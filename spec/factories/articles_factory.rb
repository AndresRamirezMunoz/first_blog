FactoryBot.define do
  factory :article do
    id { 1 }
    title{ "Articulo 1" }
    body { "Add some information about the album below" }
    created_at { "2021-06-30 20:28:50.004449000 +0000" }
    updated_at { "2021-06-30 20:28:50.004449000 +0000" }
    status { "public" }
    user_id { 1 }
  end
end
