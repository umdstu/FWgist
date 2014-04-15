class GistFilePresenter

  delegate :name, :content, :data, :filemode, :oid, :to => :gist_file

  attr_reader :gist_file

  def initialize(file)
    #current file
    @gist_file = file
    #Rails.logger.info file.instance_variable_get(:@tree).instance_variable_get(:@tree).diff(nil).deltas
    #prev file
    #@prev_file = 
  end

  def highlight(filename, src)
    # src = current version
    # prev = previous version
    HighlightedSource.new(name, src).to_formatted_html.html_safe
  end

  def pretty_excerpt(limit = 4)
    src = content.split("\n").take(limit).join("\n")
    highlight(name, src)
  end

  def pretty_content
    highlight(name, content)
  end

end
