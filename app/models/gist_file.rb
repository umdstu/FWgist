class GistFile
  include ActiveModel::Validations

  attr_accessor :blob, :name#, :description

  validates :blob, { presence: true }

  def initialize(params = {})
    params.each do |k, v|
      self.send("#{k}=", v)
    end
  end

  def name
    @name
  end

  def blank?
    self.blob.blank?
  end
end
