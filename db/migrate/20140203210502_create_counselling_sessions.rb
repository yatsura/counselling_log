class CreateCounsellingSessions < ActiveRecord::Migration
  def change
    create_table :counselling_sessions do |t|
      t.string :client_id
      t.string :zone
      t.boolean :billed
      t.datetime :date
      t.float :length
      t.text :notes

      t.timestamps
    end
  end
end
