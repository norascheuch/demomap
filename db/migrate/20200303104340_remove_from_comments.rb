class RemoveFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :event_id
    remove_column :comments, :demo_id
    add_reference :comments, :commentable, polymorphic: true
  end
end
