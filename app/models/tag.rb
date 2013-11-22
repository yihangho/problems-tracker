class Tag < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :problems
  include PgSearch
  pg_search_scope :search_by_name, against: :name, using: { tsearch: { prefix: true, any_word: true } }
end
