class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :genre
      t.string :info
      t.integer :user_id
      t.integer :console_id
    end
  end
end
