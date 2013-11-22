module ProblemsHelper
  def csv_tags_links(problem)
    arr = []
    problem.tags.each do |t|
      arr.push(link_to t.name, tag_path(t.id))
    end
    arr.join(", ").html_safe
  end
end
