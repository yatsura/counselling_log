class CreateCounsellingSessions < ActiveRecord::Migration
  def change
    create_table :counselling_sessions do |t|
      t.string :client_id
      t.string :type
      t.boolean :billed
      t.datetime :date
      t.float :length
      t.text :notes

      t.timestamps
    end
  end
end
