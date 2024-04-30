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
        var times = form.find('input[name="selectedTimes"]'); // 금액을 표시할 위치
        var amount = form.find('input[name="totalAmount"]'); // 금액을 표시할 위치
        var wonId = amountDisplay.parent().attr('id'); // 동적 생성된 ID 캡처

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

            // 선택한 체크박스가 3개를 초과하면 경고를 표시하고 선택을 취소
            if (checkedCount > 3) {
                alert("최대 이용시간은 3시간입니다.");
                $(this).prop('checked', false);
                checkedCount--; // 선택 취소 후 개수 감소
                return false; // each 함수 중단
            }

            if (totalAmount === 0) {
                $('#' + wonId + ' h3').text(""); // 동적 ID 사용하여 접근
                $('#totalAmount').val(0);
            } else {
                $('#' + wonId + ' h3').text(totalAmount.toLocaleString() + " 원"); // 동적 ID 사용하여 접근
                amount.val(totalAmount);
                times.val(selectedTimes.join(',')); // 예약시간을 다음 페이지로 가져가기
            }
        });
    });
});
function selectButton(selectedButton) {
	  // 모든 버튼의 'active' 클래스 제거
	  document.querySelectorAll('.radio-button').forEach(button => {
	    button.classList.remove('active');
	  });

	  // 선택된 버튼에만 'active' 클래스 추가
	  selectedButton.classList.add('active');
	}





/*function checking(id){ 테마 체크 여부 

	if($("input[id="+id+"]").is(":checked")){  
	    $("label[for="+id+"]").css({"background-color":"#b22222", "color":"#f1f1f3"});
	  }else{
	    $("label[for="+id+"]").css({"background-color":"white", "color":"rgb(64,64,64)"});
	  }
}*/






