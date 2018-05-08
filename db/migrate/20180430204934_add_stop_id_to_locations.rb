# frozen_string_literal: true

class AddStopIdToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :stop_id, :string
  end
end
