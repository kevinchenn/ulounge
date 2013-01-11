class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject
      t.text :description
      t.integer :lounge_id
      t.integer :user_id

      t.timestamps
    end
  end
end
