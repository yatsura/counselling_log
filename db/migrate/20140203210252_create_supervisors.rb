class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.string :name
      t.float :cost
      t.text :address
      t.string :contact_name
      t.string :type
      t.string :email_address

      t.timestamps
    end
  end
end
