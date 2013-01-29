class AddArtistInfoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :day, :string
    add_column :posts, :genre, :string
    add_column :posts, :opinion, :text
  end
end
