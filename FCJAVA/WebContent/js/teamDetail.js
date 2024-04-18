//선수 소개 팝오버
document.addEventListener('DOMContentLoaded', function() {
        var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
        var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl);
        });
});
$(document).ready(function(){
	$('.tab').each(function(index) {
        if ($(this).hasClass('tab-focus')) {
            $('.tab-content').eq(index).show();
        } else {
            $('.tab-content').eq(index).hide();
        }
    });
	
    $('.tab').on("click",function(){
    	// 클릭된 탭에 해당하는 인덱스 가져오기
        const index = $(this).index();
        
        // 모든 탭 컨텐츠 숨기기
        $('.tab-content').hide();
        
        // 클릭된 탭에 해당하는 컨텐츠만 보이기
        $('.tab-content').eq(index).show();
        
        // 현재 선택된 탭에 focus 클래스 추가
        $('.tab').removeClass('tab-focus');
        $(this).addClass('tab-focus');
    });
    
    $('#pl_pic').on("change", function() {
		let file = this.files[0];
		playerPhoto = URL.createObjectURL(file);
	    $('.player-photo').html("<img src='" + playerPhoto + "'/>");
	})
});