$(document).on "click", ".day-single .editor-opener", (event) ->
  target = $(event.target)
  target.siblings(".note").hide()
  target.siblings(".day-form").fadeIn()

$(document).on "ajax:success", ".day-form form", (event, data) ->
  target = $(event.target)
  container = target.parents(".day-single")
  container.replaceWith($(data.html))
