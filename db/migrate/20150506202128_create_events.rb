class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :topic
      t.text :body
      t.references :baby, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
