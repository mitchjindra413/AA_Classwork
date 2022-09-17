# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Destroying tables...'
Cat.delete_all

puts 'Resetting id sequences...'
%w(cats).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
end

puts 'Creating seed data...'
cat1 = Cat.create(birth_date: '2020/01/01', color: 'orange', name: 'Cow', sex: 'M', description: 'Not a cow')
cat2 = Cat.create(birth_date: '2020/02/01', color: 'grey', name: 'Kat', sex: 'F', description: 'something')