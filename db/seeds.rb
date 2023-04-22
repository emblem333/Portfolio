# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@admin",
  password: "adminadmin"
)

Genre.create!(
  [
    {name: "スポーツ",is_active: true,},
    {name: "音楽",is_active: true,},
    {name: "アウトドア",is_active: false,},
    {name: "車・バイク",is_active: false,},
    {name: "ゲーム",is_active: true,},
    {name: "ギャンブル",is_active: true,},
    {name: "芸術",is_active: true,},
    {name: "その他",is_active: true,}
  ]
)

User.create!(
  name: "管理者",
  email: "admin@admin",
  password: "adminadmin",
  password_confirmation: "adminadmin",
  admin: true
)