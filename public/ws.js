
$( function() {
    client = Stomp.client( "ws://localhost:8675/" )

    client.connect( null, null, function() {
        $(window).unload(function() { client.disconnect() });
        
        client.subscribe( '/stomplet/messages', function(message) {
            msg = $.parseJSON( message.body )

            var html = "<li><span class='ts'>[" + 
                msg.timestamp + 
                "]</span> <span class='sender'>" + 
                msg.sender + 
                ":</span> " + msg.message + "</li>"

            if (msg.type == 'tweet') {
                $("#tweets").prepend(html)
            } else {
                $("#notices").append(html)
            }

        } )
    } )

} )
