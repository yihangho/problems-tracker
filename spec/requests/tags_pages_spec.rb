require 'spec_helper'

describe "Tags Pages" do

  subject { page }

  describe "index page" do

  	before do
  		30.times { FactoryGirl.create(:problem) }
      50.times { FactoryGirl.create(:tag) }
  		visit tags_path
  	end

    it { should have_title "Tags" }

  	it "should have links to all tags with correct pagination" do
  	  Tag.paginate(page: 1).each do |t|
  	  	expect(page).to have_link t.name, href: tag_path(t.id)
  	  end

      Tag.paginate(page: 2).each do |t|
        expect(page).not_to have_link t.name
      end
  	end
  end

  describe "page for each tag" do
  	let(:problem) { FactoryGirl.create(:problem) }
  	before { visit tag_path problem.tags.first.id }
    it { should have_title problem.tags.first.name }
  	it { should have_link problem.name, href: problem.link }
  end

  describe "search page" do
    before do
      30.times { FactoryGirl.create(:tag) }
      visit '/tags/search/t'
    end

    it { should have_title "Search Results" }

    let(:search_result) { Tag.search_by_name 't' }
    it "should have links to all results" do
      search_result.each do |r|
        expect(page).to have_link r.name, href: tag_path(r)
      end
    end

    describe "JSON request" do
      before { visit '/tags/search/t.json' }
      it { should have_content search_result.to_json }
    end
  end
end
