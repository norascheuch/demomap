class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :demo, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
