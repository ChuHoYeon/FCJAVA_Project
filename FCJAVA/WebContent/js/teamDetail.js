$(document).ready(function(){
	
    $('.tab').on("click",function(){
        $('.tab').removeClass('tab-focus');
        $(this).addClass('tab-focus');
    });
    $("#team-apply").on("click", function() {
    	let alrim = confirm("가입 ㄱ?");
    	//if(alrim) {
    	//	window.location.href="";
    	//}
	});
});