class AddCustomToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :custom, :boolean, default: false
  end
end
