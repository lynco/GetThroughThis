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

  private
  def create_reverse_relation(related_service)
    unless WebServiceRelation.find_by first_web_service_id: related_service.id, second_web_service_id: self.id
      related_service.related_resources << self
    end
  end
end
