class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :code
      t.string :zone
      t.integer :organisation_id
      t.text :notes
      t.string :gender
      t.boolean :visible
      
      t.timestamps
    end
  end
end
