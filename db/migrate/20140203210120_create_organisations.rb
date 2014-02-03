class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.boolean :billable
      t.text :address
      t.string :telephone
      t.string :contact_name
      t.string :contact_email
      t.text :notes

      t.timestamps
    end
  end
end
