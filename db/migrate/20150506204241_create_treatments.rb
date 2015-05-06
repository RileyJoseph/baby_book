class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.datetime :date
      t.string :doctor
      t.references :vaccination, index: true, foreign_key: true
      t.references :baby, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
