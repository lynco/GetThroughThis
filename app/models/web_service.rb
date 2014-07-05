class WebService < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_one :image, as: :imageable, dependent: :destroy

  has_and_belongs_to_many :tags
  has_and_belongs_to_many :service_types
  has_and_belongs_to_many :languages

  has_and_belongs_to_many :related_resources, class_name: 'WebService', 
  join_table: :web_service_relations, 
  foreign_key: :first_web_service_id, 
  association_foreign_key: :second_web_service_id
end
