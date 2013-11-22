require 'spec_helper'

describe "Tags Pages" do

  subject { page }

  describe "index page" do

  	before do
  		30.times { FactoryGirl.create(:problem) }
  		visit tags_path
  	end

  	it "should have links to all tags" do
  	  Tag.all.each do |t|
  	  	expect(page).to have_link t.name, href: tag_path(t.id)
  	  end
  	end
  end

  describe "page for each tag" do
  	let(:problem) { FactoryGirl.create(:problem) }
  	before { visit tag_path problem.tags.first.id }
  	it { should have_link problem.name, href: problem.link }
  end
end
