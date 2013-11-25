require 'spec_helper'

describe "Problems Pages" do

  subject { page }

  describe "new problem page" do
    before { visit new_problem_path }
    it { should have_content "New Problem" }
    it { should have_title "New Problem" }

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
      50.times { FactoryGirl.create(:problem) }
      visit root_path
    end
    it { should have_title "Problems Tracker | Problems" }
    it "should list each problem with correct pagination" do
      Problem.paginate(page: 1, per_page: 20).each do |p|
        expect(page).to have_link(p.name, href: p.link)
        p.tags.each do |t|
          expect(page).to have_link(t.name, href: tag_path(t.id))
        end
      end

      Problem.paginate(page: 2, per_page: 20).each do |p|
        expect(page).not_to have_link(p.name, href: p.link)
      end
    end
  end
end
