App.text = App.cable.subscriptions.create "TextChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # $('#alerts').removeClass('do-not-display-alert-btn')

    $('#alerts').addClass('alertTab-padding')
    # $('#alerts2').addClass('display-alert-btn')
    # $('#alerts2').fadeIn(6000)
    $('#alerts').fadeIn(3000)
    $('#alertList').append '<p>From ' + data.name + ': ' + data.content + '</p>'
    console.log data
