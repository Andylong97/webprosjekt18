class AddCoordinateColoumnToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :coordinate, :string
  end
end
