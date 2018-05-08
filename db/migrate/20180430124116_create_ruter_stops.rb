# frozen_string_literal: true

class CreateRuterStops < ActiveRecord::Migration[5.1]
  def change
    create_table :ruter_stops do |t|
      t.string :name
      t.integer :stopid

      t.timestamps
    end
  end
end
