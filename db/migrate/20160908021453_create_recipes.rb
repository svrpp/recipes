class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.date :date
      t.text :ingredients
      t.text :directions
      t.time :cooktime
      t.integer :servings

      t.timestamps
    end
  end
end
