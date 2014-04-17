class GistFile
  include ActiveModel::Validations

  attr_accessor :content, :name, :language #, :description

  validates :content, { presence: true }

  def initialize(params = {})
    params.each do |k, v|
      self.send("#{k}=", v)
    end
  end

  def name
    @name
  end

  def language
    @language
  end

  def blank?
    self.content.blank?
  end
end
