# frozen_string_literal: true

class Location < ApplicationRecord

  def self.all_except(except)
    list = []
    Location.where('NOT address LIKE ?', except).each do |f|
      list.push(name: f.name, address: f.address)
    end
    list
  end
end
