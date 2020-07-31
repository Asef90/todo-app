FactoryBot.define do
  factory :todo do
    text { "MyString" }
    is_completed { false }
    project { nil }
  end
end
