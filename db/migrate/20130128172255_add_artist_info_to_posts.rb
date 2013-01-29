class AddArtistInfoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :day, :string
    add_column :posts, :opinion, :text
    add_column :posts, :electronic, :boolean
    add_column :posts, :hiphop, :boolean
    add_column :posts, :rock, :boolean
    add_column :posts, :pop, :boolean
    add_column :posts, :indie, :boolean
    add_column :posts, :fav, :boolean
  end
end
