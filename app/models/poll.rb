class Poll < ActiveRecord::Base
  # attr_accessible :title, :items_attributes

  has_many :items, :dependent => :destroy
  accepts_nested_attributes_for :items#, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  
end
