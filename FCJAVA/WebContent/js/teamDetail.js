//선수 소개 팝오버
document.addEventListener('DOMContentLoaded', function() {
        var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
        var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl);
        });
});
$(document).ready(function(){
    $('.tab').on("click",function(){
        $('.tab').removeClass('tab-focus');
        $(this).addClass('tab-focus');
    });
    
    $('#pl_pic').on("change", function() {
		let file = this.files[0];
		playerPhoto = URL.createObjectURL(file);
	    $('.player-photo').html("<img src='" + playerPhoto + "'/>");
	})
});