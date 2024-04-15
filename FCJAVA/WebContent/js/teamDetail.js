$(document).ready(function(){
	
    $('.tab').on("click",function(){
        $('.tab').removeClass('tab-focus');
        $(this).addClass('tab-focus');
    });

});