class CreateVaccinations < ActiveRecord::Migration
  def change
    create_table :vaccinations do |t|
      t.string :type
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
