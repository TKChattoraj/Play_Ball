# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


keepScore = ->

  $("#keep-score").click ->
      alert "App to Keep Score Coming Soon!"

  return

sendTxt = ->
  $("#sendTxt").click ->
      alert "Send a text alert to this site.  Try it out.  Text a message to 513-952-8704.  Example...'Reds are rained out.  Go back to sleep!'"



$(document).on('turbolinks:load', keepScore)
$(document).on('turbolinks:load', sendTxt)
