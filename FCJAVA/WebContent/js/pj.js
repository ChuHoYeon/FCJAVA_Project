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
document.addEventListener('DOMContentLoaded', function() {
    var today = new Date().toISOString().slice(0, 10);
    document.getElementById('soccerDate1').value = today;
});
 


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
    // 'stm_teamsearch1' 클래스를 가진 각 폼에 대해 반복
    $('.stm_teamsearch1').each(function() {
        var form = $(this); // 현재 폼
        var checkboxes = form.find('.checkbox_class'); // 폼 내의 체크박스
        var amountDisplay = form.find('.won h3'); // 금액을 표시할 위치
        var times = form.find('input[name="selectedTimes"]'); // 선택한 시간을 표시할 위치
        var amount = form.find('input[name="totalAmount"]'); // 총 금액을 표시할 위치
        var wonId = amountDisplay.parent().attr('id'); // 동적으로 생성된 ID 캡처

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
                $('#totalAmount' + wonId).val(0);
            } else {
                $('#' + wonId + ' h3').text(totalAmount.toLocaleString() + " 원"); // 동적 ID 사용하여 접근
                amount.val(totalAmount);
                times.val(selectedTimes.join(',')); // 예약시간을 다음 페이지로 가져가기
            }
        });
    });
 // 로그인 상태 확인 함수 (쿠키 사용 예시)
    function isUserLoggedIn() {
        // `isLoggedIn` 쿠키가 존재하는지 확인
    	let check = false;
    	if(sessionId != 'null') check=true;
        return check;
    }

    // 폼 제출 이벤트 핸들러
    $('form').submit(function () {
        if (!isUserLoggedIn()) {
            alert('로그인이 필요한 서비스입니다. 로그인해주세요.');
            window.location.href = "login.jsp";
            return false; // 제출을 중지합니다.
        }

        var form = $(this);
        var amountText = form.find('.won h3').text().trim(); // 금액 표시 부분의 텍스트 가져오기
        var amount = parseInt(amountText.replace(/\D/g, '')); // 텍스트에서 숫자 추출하기
        var date = form.find('#soccerDate1').val(); // 선택한 날짜 가져오기

        // 금액이 없는 경우
        if (amount === 0 || isNaN(amount)) {
            alert('예약할 시간을 선택하세요.');
            return false; // 제출을 중지합니다.
        }

        // 날짜가 선택되지 않은 경우
        if (date === '') {
            alert('예약할 날짜를 선택하세요.');
            return false; // 제출을 중지합니다.
        }

        // 계속 진행
        return true;
    });


});







/*function checking(id){ 테마 체크 여부 

	if($("input[id="+id+"]").is(":checked")){  
	    $("label[for="+id+"]").css({"background-color":"#b22222", "color":"#f1f1f3"});
	  }else{
	    $("label[for="+id+"]").css({"background-color":"white", "color":"rgb(64,64,64)"});
	  }
}*/






