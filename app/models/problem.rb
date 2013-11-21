class Problem < ActiveRecord::Base
  validates :name, :link, presence: true
  has_and_belongs_to_many :tags

  def add_tag(t)
    obj = Tag.find_by name: t
    if obj.nil?
      obj = Tag.create name: t
    end
    if tags.find_by(id: obj.id).nil?
      tags << obj
    end
  end

  def add_tags(t)
    t.each do |n|
      add_tag n
    end
  end
end
