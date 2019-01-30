class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :calories
      t.integer :time
      t.string :url
      t.string :source
      t.string :ingredients_bulk

      t.timestamps
    end
  end
end
