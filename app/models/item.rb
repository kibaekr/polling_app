class Item < ActiveRecord::Base
  # attr_accessible :title, :votes

  belongs_to :poll

end
