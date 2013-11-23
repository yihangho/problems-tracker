FactoryGirl.define do
  factory :problem do
  	sequence(:name) { |n| "Problem #{n}" }
  	sequence(:link) { |n| "http://www.example.com/#{n}" }
    sequence(:csv_tags) { |n| "Tag #{n%5}.1, Tag #{n%5}.2, Tag #{n%5}.3" }
  end

  factory :tag do
    sequence(:name) { |n| "Tag #{n}" }
  end
end
