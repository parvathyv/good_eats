class AddColumnsToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :description, :string
    add_column :restaurants, :category, :string
  end
end
