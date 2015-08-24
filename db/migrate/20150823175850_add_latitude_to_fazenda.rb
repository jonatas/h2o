class AddLatitudeToFazenda < ActiveRecord::Migration
  def change
    add_column :fazendas, :latitude, :float
  end
end
