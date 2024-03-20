FactoryBot.define do
  factory :suggestion do
    movie { "MyText" }
    author { "MyString" }
    user { "MyString" }
    sugg_box_id { 5 }
    sugg_box
  end
end
