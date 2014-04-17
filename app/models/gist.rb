class Gist < ActiveRecord::Base
  has_many :comments
  
  attr_accessor :gist_files, :gist_files_attributes

  attr_accessible :gist_files_attributes, :description

  validate :non_blank, :unique_names

  scope :recent, -> { order('created_at desc') }
  scope :updated, -> { order('updated_at desc') }

  def non_blank
    blank? and errors.add(:gist_files, "Can't be blank")
  end

  def unique_names
    dups = dup_names(gist_files).map {|name, count| %Q["#{name}": #{count}] }
    dups.empty? or
      errors.add(:gist_files, "duplicate names: #{dups.join(',')}")
  end

  def dup_names(files)
    duplicates = files.map(&:name).
      group_by {|b| b }.
      values.
      map {|b| [b.first, b.size]}.
      select {|name, count| count > 1}
  end

  private :dup_names

  def blank?
    gist_files.blank?
  end

  def gist_files_attributes
    @gist_files_attributes || []
  end

  def gist_files_attributes=(attrs)
    self.gist_files = attrs.map do |attr|
      GistFile.new(attr)
    end.reject(&:blank?)
  end

  # Git integration
  def gist_files
    @gist_files ||= begin
       if new_record? then []
       else gist_read
       end
    end
  end

  def save_and_commit(*args)
    begin
      save_and_commit!(*args) 
      true
    rescue ActiveRecord::RecordInvalid => e
      # TODO: log e
      false
    end
  end

  def save_and_commit!(update_attrs = {})
    SaveGist.new(self).(update_attrs)
  end

  def repo_name
    id.to_s
  end

  def repo
    if new_record? then nil
    else @repo ||= GistRepo.named(repo_name)
    end
  end

  def init_repo
    GistRepo.init_named_repo(repo_name)
  end

  def gist_read
    repo.tree(repo.head).map(&method(:gist_file))
  end

  def gist_file(entry)
    # TODO: make consitent
    params = {name: entry.name, language: entry.language, content: entry.content}
    GistFile.new(params)
  end

  def gist_write
    repo.write(self.gist_files)
  end

  def recent_commits(limit = 10)
    repo.log.take(limit)
  end

  def tree(head)
    repo.tree(head || repo.head)
  end

  def to_preview_html
    GistFilePresenter.new(self.tree(repo.head).first).pretty_excerpt
  end
end
