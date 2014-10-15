FactoryGirl.define do
  factory :counselling_session do
    meetable_id 1
    meetable_type "No such object"
    zone "No such zone"
    date { Date.today }
    length 1.5
    billed false

    trait :adult do
      zone "Adult"
    end

    trait :child do
      zone "Child"
    end

    trait :hour_long do
      length 60
    end

    trait :with_client do
      meetable do
        (Client.all.first || FactoryGirl.create(:client))
      end
    end

    trait :with_supervisor do
      meetable do
        (Supervisor.all.first || FactoryGirl.create(:supervisor))
      end
    end
  end
end
