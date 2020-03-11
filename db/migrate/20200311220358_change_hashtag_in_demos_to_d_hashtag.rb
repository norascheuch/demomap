class ChangeHashtagInDemosToDHashtag < ActiveRecord::Migration[5.2]
  def change
    rename_column :demos, :hashtag, :d_hashtag
  end
end
