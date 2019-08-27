# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


stopwatch1 = Stopwatch.create(name: 'Running', description: 'Adding seconds back to my life', total_time: 3600)
stopwatch2 = Stopwatch.create(name: 'Coding', description: 'Hacking my way to 10K hours', total_time: 31536000)
stopwatch3 = Stopwatch.create(name: 'Hiking', description: 'Climbing to new heights...', total_time: 63072000)
