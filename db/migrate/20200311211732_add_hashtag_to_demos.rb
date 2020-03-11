class AddHashtagToDemos < ActiveRecord::Migration[5.2]
  def change
    add_column :demos, :hashtag, :string
  end
end
