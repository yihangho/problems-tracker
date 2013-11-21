FactoryGirl.define do
  factory :problem do
  	sequence(:name) { |n| "Problem #{n}" }
  	sequence(:link) { |n| "http://www.example.com/#{n}" }
  end
end
