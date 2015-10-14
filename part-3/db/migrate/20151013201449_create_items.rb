class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      # t.datetime :auction_begin
      # t.datetime :auction_end
    end
  end
end
