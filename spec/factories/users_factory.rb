FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'root@toot.com' }
    password { '123456' }
  end
end
