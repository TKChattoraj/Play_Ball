$ ->
  $(".close").on("click", (event)->
    $(event.target.parentElement).hide("slow")
  )
