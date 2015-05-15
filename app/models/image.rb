class Image < ActiveRecord::Base
	belongs_to :attachment
	attr_accessor :attachment_id
	has_attached_file :photo, :styles => { :medium => "100x100>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
