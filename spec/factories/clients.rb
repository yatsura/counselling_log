FactoryGirl.define do
  factory :client do
    sequence(:code) { |n| "CODE#{n}" }
    zone "Adult"
    organisation_id 1

    trait :adult do
      zone "Adult"
    end

    trait :child do
      zone "Child"
    end

    trait :male do
      gender "M"
    end

    trait :female do
      gender "F"
    end

    trait :invisible do
      visible false
    end

    trait :self do
      organisation_id 0
      code "SELF"
    end

    factory :client_adult_male, :traits => [:adult, :male]
    factory :client_adult_female, :traits => [:adult, :female]
    factory :client_child_male, :traits => [:child, :male]
    factory :client_child_female, :traits => [:child, :female]

  end
end
