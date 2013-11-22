class Problem < ActiveRecord::Base
  validates :name, :link, presence: true
  has_and_belongs_to_many :tags

  def csv_tags
    tags_array = []
    tags.each do |t|
      tags_array.push t.name
    end
    tags_array.join(", ")
  end

  def csv_tags=(str)
    add_tags str.split(/\s*,\s*/)
  end

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
