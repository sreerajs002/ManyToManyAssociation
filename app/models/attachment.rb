class Attachment < ActiveRecord::Base
	belongs_to :user
	has_many :images , dependent: :destroy
	accepts_nested_attributes_for :images
	 attr_accessor :images_attributes, :form_id
end
