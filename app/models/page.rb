class Page < ActiveRecord::Base

  has_many :page_attributes
  accepts_nested_attributes_for :page_attributes, allow_destroy: true
end
