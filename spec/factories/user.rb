FactoryBot.define do
  factory :user do
    username { "John Doe" }
    email { "johndoe@example.com" }
    password { "123456" }
  end
end