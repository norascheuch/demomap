class ChangeHashtagInDemosToDefaultFridayForFuture < ActiveRecord::Migration[5.2]
  def change
    change_column_default :demos, :hashtag, from: true, to: 'fridayforfuture'
  end
end
