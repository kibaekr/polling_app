class AddDefaultValueToVotesAttribute < ActiveRecord::Migration
  def change
    change_column :items, :votes, :integer, :default => 0
  end
end
