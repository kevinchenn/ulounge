class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :post_id
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
