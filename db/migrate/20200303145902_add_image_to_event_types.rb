class AddImageToEventTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :event_types, :icon, :string
  end
end
