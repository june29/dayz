class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :date, null: false
      t.text :note, null: false

      t.timestamps
    end

    add_index :days, :date, unique: true
  end
end
