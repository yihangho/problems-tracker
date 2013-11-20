class Problem < ActiveRecord::Base
  validates :name, :link, presence: true
end
