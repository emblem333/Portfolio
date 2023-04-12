# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "ayumi@ayumi",
  password: "matsubara"
)

Genre.create!(
  [
    {
      name: "野球",
      is_active: true,
    },
    {
      name: "サッカー",
      is_active: true,
    },
    {
      name: "釣り",
      is_active: false,
    },
    {
      name: "ドライブ",
      is_active: false,
    },
    {
      name: "卓球",
      is_active: true,
    }
  ]
)