require 'spec_helper'

describe Problem do
  let(:problem) { Problem.new(name: "Lorem ipsum", link: "http://www.example.com") }

  subject { problem }

  it { should respond_to :name }
  it { should respond_to :link }
  it { should be_valid }

  describe "when name is empty" do
  	before { problem.name = "" }
  	it { should_not be_valid }
  end

  describe "when link is empty" do
  	before { problem.link = "" }
  	it { should_not be_valid }
  end
end
