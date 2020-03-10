class AddRouteToDemos < ActiveRecord::Migration[5.2]
  def change
    add_column :demos, :route, :jsonb
  end
end
