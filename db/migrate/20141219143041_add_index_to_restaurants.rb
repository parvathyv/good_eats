class AddIndexToRestaurants < ActiveRecord::Migration
  def change
  	 add_index :restaurants, [:id], unique: true 
  end
end
