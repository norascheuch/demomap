class AddOrganizerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :organizer, :boolean
  end
end
