class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :category
      t.string :url
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
