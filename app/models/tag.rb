class Tag < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_and_belongs_to_many :web_services

  def slug_link
    "/tags/#{self.name}"
  end
end
