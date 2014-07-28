class WebService < ActiveRecord::Base
  attr_accessor :highlight

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_one :image, as: :imageable, dependent: :destroy

  has_many :download_urls

  has_and_belongs_to_many :tags
  has_and_belongs_to_many :service_use_modes
  has_and_belongs_to_many :languages

  has_and_belongs_to_many :related_resources, class_name: 'WebService', 
  join_table: :web_service_relations, 
  foreign_key: :first_web_service_id, 
  association_foreign_key: :second_web_service_id,
  after_add: :create_reverse_relation

  def description_snippet
    # Take the first 224 characters after removing all html, then remove trailing words.
    x=self.description[0..229] # A fudge factor

    x=x.gsub(/<\/?[a-zA-Z]+[^>]*>/, '')
    x=x.gsub(/[^\s]+$/, '')
    x
  end

  def image_url
    # Will return a default if none exists
    if self.image and self.image.image_file.url 
      self.image.image_file.url
    else
      "app-icon.jpg"
    end
  end
  
  private
  def create_reverse_relation(related_service)
    unless WebServiceRelation.find_by first_web_service_id: related_service.id, second_web_service_id: self.id
      related_service.related_resources << self
    end
  end


end
