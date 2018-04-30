# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.create(name: 'Fjerdingen', address: 'Westerdals+Oslo+ACT,+Chr.+Krohgs gate+32,+Oslo', stop_id: '3010510')
Location.create(name: 'Vulkan', address: 'vulkan+oslo', stop_id: '3010512')
Location.create(name: 'Brennerivegen', address: 'Brenneriveien+9,+Oslo', stop_id: '3010512')
Location.create(name: 'Kvadraturen', address: 'Hoyskolen+Kristiania,+Kirkegata,+Oslo', stop_id: '3010050')

