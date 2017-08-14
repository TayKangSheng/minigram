class CreateGrams < ActiveRecord::Migration[5.1]
  def change
    create_table :grams do |t|
      t.string :title
      t.text :content
      t.string :location

      t.timestamps
    end
  end
end
