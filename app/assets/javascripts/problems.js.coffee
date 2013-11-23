# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#problem_csv_tags").autocomplete({
    source: (request, response) ->
      idx = request.term.lastIndexOf(",")
      term = request.term.substr(idx+1).trim()
      # Get suggestions
      if term.length
        $.ajax {
          url: "/tags/search/" + encodeURIComponent(term) + ".json",
          dataType: "json",
          success:  (data) ->
            dataset = for d in data
              d.name
            response dataset,
          error: ->
            response null
        }
      else
        response null,
    focus: -> false,
    select: (event, ui) ->
      tags = this.value.split(/\s*,\s*/)
      tags.pop()
      tags.push ui.item.value
      tags.push ""
      this.value = tags.join(", ")
      return false
  });
