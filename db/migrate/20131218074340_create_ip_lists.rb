class CreateIpLists < ActiveRecord::Migration
  def change
    create_table :ip_lists do |t|
      t.integer :poll_id
      t.string :ip_address

      t.timestamps
    end
  end
end
