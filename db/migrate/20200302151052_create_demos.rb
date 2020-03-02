class CreateDemos < ActiveRecord::Migration[5.2]
  def change
    create_table :demos do |t|
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :start_location
      t.string :end_location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
