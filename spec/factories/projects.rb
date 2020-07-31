FactoryBot.define do
  sequence :title do |n|
    "ProjectTitle#{n}"
  end

  factory :project do
    title

    trait :with_todos do
      after(:create) { |project| create_list(:todo, 3, project: project) }
    end
  end
end
