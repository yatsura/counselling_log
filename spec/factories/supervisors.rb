FactoryGirl.define do
  factory :supervisor do
    name "A Smith"
    cost 30.00
    zone "Adult"

    trait :adult do
      zone "Adult"
    end

    trait :child do
      zone "Child"
    end

    trait :invisible do
      visible false
    end
  end
end
