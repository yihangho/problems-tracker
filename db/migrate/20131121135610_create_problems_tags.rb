class CreateProblemsTags < ActiveRecord::Migration
  def change
    create_table :problems_tags, id: false do |t|
      t.belongs_to :problem
      t.belongs_to :tag
    end

    add_index :problems_tags, :problem_id
    add_index :problems_tags, :tag_id
  end
end
