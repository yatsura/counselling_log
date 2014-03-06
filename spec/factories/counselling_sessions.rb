FactoryGirl.define do
  factory :counselling_session do
    meetable_id 1
    meetable_type "No such object"
    zone "Adult"
    date { Date.today }
    length 1.5
    billed false
  end
end
