class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :votes
      t.integer :poll_id

      t.timestamps
    end
  end
end
