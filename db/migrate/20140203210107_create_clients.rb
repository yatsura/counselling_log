class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :code
      t.string :type
      t.integer :organisation_id
      t.text :notes

      t.timestamps
    end
  end
end
