FactoryGirl.define do
  factory :counselling_session do
    client_id 1
    zone "Adult"
    date { Date.today }
    length 1.5
    billed false
  end
end
