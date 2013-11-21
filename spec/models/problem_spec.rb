require 'spec_helper'

describe Problem do
  let(:problem) { Problem.create(name: "Lorem ipsum", link: "http://www.example.com") }
  let(:problem2) { Problem.create(name: "Problem 2", link: "http://www.example.com/2") }

  subject { problem }

  it { should respond_to :name }
  it { should respond_to :link }
  it { should respond_to :tags }
  it { should respond_to :add_tag }
  it { should respond_to :add_tags }
  it { should be_valid }

  describe "when name is empty" do
  	before { problem.name = "" }
  	it { should_not be_valid }
  end

  describe "when link is empty" do
  	before { problem.link = "" }
  	it { should_not be_valid }
  end

  describe "adding a tag" do

    describe "with invalid information" do
      it "should not create new tag" do
        expect { problem.add_tag("") }.not_to change(problem.tags, :count)
      end
    end

    describe "with valid information" do
      it "should create new tag" do
        expect { problem.add_tag("Graph") }.to change(problem.tags, :count).by(1)
      end

      describe "but repeated tag" do
        before { problem.add_tag("Graph") }
        it "should not create new tag" do
          expect { problem.add_tag("Graph") }.not_to change(problem.tags, :count)
        end
      end

      describe "another problem with the same tag" do
        before { problem.add_tag("Graph") }

        it "should not create a new tag in table" do
          expect { problem2.add_tag("Graph") }.not_to change(Tag.all, :count).by(1)
        end
      end
    end
  end

  describe "adding several tags" do
    let(:tags) { ["Graph", "DFS", "SCC"] }
    it "should create new tags" do
      expect { problem.add_tags(tags) }.to change(problem.tags, :count).by(tags.count)
    end
  end
end
