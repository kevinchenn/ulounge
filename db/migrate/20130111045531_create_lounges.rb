class CreateLounges < ActiveRecord::Migration
  def change
    create_table :lounges do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
