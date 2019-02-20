App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append("<div class='content'><a class='author'>" + data.nick + "</a>
    </div><div class='text'>" + data.msg + "</div> <div class='metadata' ><div class='date' >" + data.time + "</div></div>"
    )
    scroll();
