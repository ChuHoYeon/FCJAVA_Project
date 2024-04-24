new Swiper('.swiper', {
  // autoplay: {
  //   delay: 5000
  // },
  loop: true,
  slidesPerView: 1,
  spaceBetween: 0,
  centeredSlides: true,
  pagination: {
    el: '.swiper-pagination',
    clickable: true
  },
  // navigation: {
  //   prevEl: '.swiper-button-prev',
  //   nextEl: '.swiper-button-next'
  // }
})
//달력
var today = new Date().toISOString().slice(0, 10);

    //id로 오늘 날짜 설정
    document.getElementById('soccerDate1').value = today;



var checkboxValues = {
  "stm_btn6": 0,
  "stm_btn7": 0,
  "stm_btn8": 0,
  "stm_btn9": 0,
  "stm_btn10": 0,
  "stm_btn11": 0,
  "stm_btn18": 0,
  "stm_btn19": 0,
  "stm_btn20": 0,
  "stm_btn21": 0,
  "stm_btn22": 0,
  "stm_btn23": 0
};



$(function () {
    // 모든 예약 폼에 대해 이 함수를 실행합니다.
    $('.stm_teamsearch1').each(function() {
        var form = $(this); // 현재 폼
        var checkboxes = form.find('.checkbox_class'); // 현재 폼 내의 체크박스
        var amountDisplay = form.find('.won h3'); // 금액을 표시할 위치

        checkboxes.change(function() {
            var selectedTimes = [];
            var totalAmount = 0;
            var checkedCount = 0;

            checkboxes.each(function() {
                if ($(this).prop('checked')) {
                    checkedCount++;
                    var time = $(this).next().text();
                    selectedTimes.push(time);
                    totalAmount += 30000; // 시간당 금액은 여기에서 조정
                }
            });
            $('#selectedTimes').val(selectedTimes.join(',')); // 예약시간을 다음 페이로 가져가기 
            
            // 선택한 체크박스가 3개를 초과하면 경고를 표시하고 선택을 취소
            if (checkedCount > 3) {
                alert("최대 이용시간은 3시간입니다.");
                $(this).prop('checked', false);
                return;
            }

            if (totalAmount === 0) {
            $('#totalAmount').val(0);
	            $('.won h3').text("");
	        } else {
	            $('#totalAmount').val(totalAmount);
	            // 선택된 시간과 총 금액
            $('.won h3').text(totalAmount.toLocaleString() + " 원");
	        }
        });
    });
});




/*function checking(id){ 테마 체크 여부 

	if($("input[id="+id+"]").is(":checked")){  
	    $("label[for="+id+"]").css({"background-color":"#b22222", "color":"#f1f1f3"});
	  }else{
	    $("label[for="+id+"]").css({"background-color":"white", "color":"rgb(64,64,64)"});
	  }
}*/






