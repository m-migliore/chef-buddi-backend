class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :calories
      t.string :time
      t.string :url
      t.string :source
      t.string :ingredients

      t.timestamps
    end
  end
end
