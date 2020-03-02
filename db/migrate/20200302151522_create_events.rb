class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.string :location
      t.references :user, foreign_key: true
      t.references :demo, foreign_key: true
      t.references :event_type, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
