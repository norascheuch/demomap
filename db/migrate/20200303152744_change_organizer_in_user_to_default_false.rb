class ChangeOrganizerInUserToDefaultFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :organizer, from: true, to: false
  end
end
