class AddColumnToDemos < ActiveRecord::Migration[5.2]
  def change
    add_column :demos, :d_hashtag, :string
  end
end
