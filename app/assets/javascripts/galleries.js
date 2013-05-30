$(function (){
	$('#new_gallery').fileupload().bind('fileuploadfinished', function (e, data){
		init_papercrop();
	})
})
