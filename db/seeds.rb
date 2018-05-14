# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.create(name: 'Fjerdingen',
                address: 'Westerdals+Oslo+ACT,+Chr.+Krohgs gate+32,+Oslo',
                stop_id: '3010510',
                coordinate: '(x=598298,y=6643380)')
Location.create(name: 'Vulkan',
                address: 'vulkan+oslo',
                stop_id: '3010512',
                coordinate: '(x=597952,y=6644167)')
Location.create(name: 'Brennerivegen',
                address: 'Brenneriveien+9,+Oslo',
                stop_id: '3010512',
                coordinate: '(x=597984,y=6643840)')
Location.create(name: 'Kvadraturen',
                address: 'Kirkegata+24,+Oslo',
                stop_id: '3010050',
                coordinate: '(x=597460,y=6642801)')
