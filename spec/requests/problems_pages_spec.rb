require 'spec_helper'

describe "Problems Pages" do

  subject { page }

  describe "new problem page" do
    before { visit new_problem_path }
    it { should have_content "New Problem" }

    describe "create new problem with invalid info" do
      it "should not create new problem" do
        expect { click_button "Create" }.not_to change(Problem, :count);
      end
    end

    describe "create new problem with valid info" do
      before do
        fill_in "Name", with: "Lorem ipsum"
        fill_in "Link", with: "http://www.example.com/"
      end

      it "should create a new problem" do
        expect { click_button "Create" }.to change(Problem, :count).by(1)
      end
    end
  end

  describe "index page" do
    before do
      30.times { FactoryGirl.create(:problem) }
      visit root_path
    end
    it "should list each problem" do
      Problem.all.each do |p|
        expect(page).to have_link(p.name, href: p.link)
        expect(page).to have_content(p.csv_tags)
      end
    end
  end
end
