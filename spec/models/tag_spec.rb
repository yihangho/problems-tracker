require 'spec_helper'

describe Tag do
  let(:tag) { Tag.create(name: "Graph") }

  subject { tag }

  it { should respond_to :name }
  it { should be_valid }
end
