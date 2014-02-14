FactoryGirl.define do
  factory :client do
    code { |n| "CODE#{n}" }
    type "Adult"
    organisation_id 1

    trait :adult do
      type "Adult"
    end

    trait :child do
      type "Child"
    end

    trait :male do
      gender "M"
    end

    trait :female do
      gender "F"
    end

    factory :client_adult_male, :traits => [:adult, :male]
    factory :client_adult_female, :traits => [:adult, :female]
    factory :client_child_male, :traits => [:adult, :male]
    factory :client_child_female, :traits => [:adult, :female]

  end
end
