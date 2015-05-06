class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.float :height
      t.float :weight
      t.datetime :date
      t.references :baby, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
