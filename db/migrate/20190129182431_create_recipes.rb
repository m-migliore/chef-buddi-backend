class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :idMeal
      t.string :category
      t.string :area
      t.string :instructions
      t.string :image
      t.string :youtube
      t.string :tags
      t.string :source


      t.timestamps
    end
  end
end
