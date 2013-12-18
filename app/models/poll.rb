class Poll < ActiveRecord::Base
  validates_presence_of :title
  validate :require_two_items, :max_five_items

  has_many :items, :dependent => :destroy
  accepts_nested_attributes_for :items, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

  has_many :ip_lists
  
  private
    def require_two_items
      errors.add(:base, "You must provide at least two items") if items.size < 2
    end

    def max_five_items
      errors.add(:base, "You have exceeded the maximum items of five") if items.size > 5
    end

end
