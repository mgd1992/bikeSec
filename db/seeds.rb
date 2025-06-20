Admin.destroy_all

User.create!(
  email: "admin@bikesec.com",
  password: "bikesec123",
  password_confirmation: "bikesec123",
  admin: true
)
