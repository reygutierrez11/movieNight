FactoryBot.define do
  factory :user do
    email { "this@gmail.com" }
    password { "strong" }
    encrypted_password { "MyString" }
    reset_password_token { "MyString" }
    role { 1 }
  end
end
