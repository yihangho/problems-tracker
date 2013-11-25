namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_problems
		make_tags
	end
end

def make_problems
	99.times do |n|
		Problem.create(name: "Problem #{n}", link: "http://www.example.com/#{n}")
	end
end

def make_tags
	99.times do |n|
		Tag.create(name: "Tag #{n}")
	end
end
