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
    document.getElementById('soccerDate2').value = today;
    document.getElementById('soccerDate3').value = today;
    document.getElementById('soccerDate4').value = today;
    document.getElementById('soccerDate5').value = today;




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
  
  // 변경된 체크박스의 값을 checkboxValues에 업데이트
  var checkboxID = $(this).attr('id');
  var isChecked = $(this).prop('checked');
  var value = isChecked ? 30000 : 0; // 체크하면 30000, 아니면 0
  checkboxValues[checkboxID] = value;

  //금액 계산
  var total = Object.values(checkboxValues).reduce((a, b) => a + b, 0);
  
  // 금액을 화면에 표시
  $('.won h3').text(total.toLocaleString() + " 원");
});


// 금액/시간
// 체크박스 상태 변경 시 금액 계산 및 선택된 시간 ID 수집
var checkboxValues = {};
$('.checkbox_class').change(function() {
  // 체크박스 상태 변경 로직...
  // 금액 계산 및 선택된 시간 ID 업데이트
});

// 예약하기 버튼 클릭 시 선택된 시간과 총 금액을 폼에 추가
$('#reservationSubmit').click(function() {
  // 숨겨진 필드에 선택된 시간과 총 금액 설정
  $('#selectedTimes').val(/* 선택된 시간 ID */);
  $('#totalAmount').val(/* 계산된 총 금액 */);
});




