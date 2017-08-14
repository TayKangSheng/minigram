class GramCountryCode < ActiveRecord::Migration[5.1]
  def change
    add_column :grams, :country_code, :string
  end
end
