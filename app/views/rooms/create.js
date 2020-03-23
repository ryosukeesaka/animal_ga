console.log('aaaa');

$(".form-submit").click(function(){
	$(".form-text-field").val('');
});
$(".message_list").append("<%= j(render 'rooms/message',message: @messages) %>")

