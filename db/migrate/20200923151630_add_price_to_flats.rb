class AddPriceToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :price, :integer
  end
end
