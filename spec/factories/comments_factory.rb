FactoryBot.define do
  factory :comment do
    id { 1 }
    commenter { "test" }
    body { "test text on comment" }
    article_id { 1 }
    created_at { "2021-07-02 17:13:47.364494000 +0000" }
    updated_at { "2021-07-02 17:13:47.364494000 +0000" }
    status { "public" }
    user_id { 1 }
  end
end
