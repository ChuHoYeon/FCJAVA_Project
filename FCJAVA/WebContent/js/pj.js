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
    /*document.getElementById('soccerDate2').value = today;*/
/*    document.getElementById('soccerDate3').value = today;
    document.getElementById('soccerDate4').value = today;
    document.getElementById('soccerDate5').value = today;
*/



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
	
	$('.checkbox_class').change(function() {
		 
		  var checkedCount = 0;
		  
		 
		  $('.checkbox_class').each(function() {
		    if ($(this).prop('checked')) {
		      checkedCount++;
		    }
		  });
		  
		  // 4개 이상이 선택된 경우 경고창 표시
		  if (checkedCount >= 4) {
		    alert("최대 이용시간은 3시간입니다.");
		    $(this).prop('checked', false); 
		    return;
		  }
		  

		});
	$(function () {
	    $('.checkbox_class').change(function() {
	        var selectedTimes = []; // 선택된 시간을 저장할 배열
	        var totalAmount = 0; // 총 금액을 저장할 변수
	        
	     
	        $('.checkbox_class:checked').each(function() {
	            var time = $(this).next().text(); // 해당 체크박스의 레이블 텍스트(시간) 가져오기
	            selectedTimes.push(time); // 선택된 시간 배열에 추가
	            
	            // 시간에 따른 금액 계산을 하여 총 금액
	            totalAmount += 30000;
	        });
	        
	        // 선택된 시간과 총 금액을 숨겨진 인풋 요소의 값으로 설정하여 다음 페이지로 전달
	        $('#selectedTimes').val(selectedTimes.join(','));
	        $('#totalAmount').val(totalAmount);
	        
	        // 선택된 시간과 총 금액
	        $('.won h3').text(totalAmount.toLocaleString() + " 원");
	    });
	});
});

// 금액/시간
// 체크박스 상태 변경 시 금액 계산 및 선택된 시간 ID 수집
//var checkboxValues = {};
//$('.checkbox_class').change(function() {
  // 체크박스 상태 변경 로직...
  // 금액 계산 및 선택된 시간 ID 업데이트
//});

// 예약하기 버튼 클릭 시 선택된 시간과 총 금액을 폼에 추가
//$('#reservationSubmit').click(function() {
  // 숨겨진 필드에 선택된 시간과 총 금액 설정
//  $('#selectedTimes').val(/* 선택된 시간 ID */);
//  $('#totalAmount').val(/* 계산된 총 금액 */);
//});




