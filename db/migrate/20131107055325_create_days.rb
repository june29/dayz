class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :date, null: false
      t.text :note, null: false

      t.timestamps
    end
  end
end
