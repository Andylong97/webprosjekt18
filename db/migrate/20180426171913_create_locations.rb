# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
