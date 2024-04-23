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
	//탭 변경
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
	
	$("#applygoing").on("submit", function(event) {
		let check = false;
		const back_num = $("input[name='back_num']").val();
		
		if(back_num == '') {
			alert("희망 등번호를 입력해주세요");
			check = false
		} else {
			alert("가입되었습니다.");
			check = true
		}
		
		if(!check) {
			event.preventDefault(); // 폼 제출 중단
		}
	});
    
    $('#back_num').on('input', function() {
    	this.value = this.value.replace(/[^0-9]/g, '');
    });
    $('#weight').on('input', function() {
    	this.value = this.value.replace(/[^0-9]/g, '');
	});
	$('#height').on('input', function() {
		this.value = this.value.replace(/[^0-9]/g, '');
	});
	
	const formation442 = {
		1: { x: 300, y: 661 },
		2: { x: 90, y: 537 },
		3: { x: 230, y: 537 },
		4: { x: 370, y: 537 },
		5: { x: 510, y: 537 },
		6: { x: 90, y: 300 },
		7: { x: 230, y: 300 },
		8: { x: 370, y: 300 },
		9: { x: 510, y: 300 },
		10: { x: 230, y: 100 },
		11: { x: 370, y: 100 }
	}
	const formation4141 = {
			1: { x: 300, y: 661 },
			2: { x: 90, y: 537 },
			3: { x: 230, y: 537 },
			4: { x: 370, y: 537 },
			5: { x: 510, y: 537 },
			6: { x: 300, y: 430 },
			7: { x: 90, y: 300 },
			8: { x: 230, y: 300 },
			9: { x: 370, y: 300 },
			10: { x: 510, y: 300 },
			11: { x: 300, y: 100 }
	}
	let $dataFormation = $(".showFor").data("formation");
	showFormation($dataFormation);
    //포메이션 보기
	function showFormation($dataFormation) {
		let formations = null;
		switch($dataFormation){
		case "4-4-2": formations = formation442; break;
		case "4-1-4-1": formations = formation4141; break;
		}
		if(formations != null) {
			$('.player-card').each(function() {
				let cardid = $(this).data('cardid');
				const position = formations[cardid];
				const translateX = position.x;
				const translateY = position.y;
				$(this).css('transform', 'translate('+translateX+'px,'+translateY+'px)');
			});
		}
	}

	$('.savedformation').on("click",function(){
		$('.savedformation').removeClass('showFor');
		$(this).addClass('showFor');
		//포메이션 변경
		$dataFormation = $(".showFor").data("formation");
		console.log($dataFormation);
		showFormation($dataFormation);
	});

	//포메이션 좌우 화살표
	$(".back").hide();
	let currentPosition = 0; // 현재 목록의 위치
	const itemWidth = 178; // 각 아이템의 너비
	const visibleItems = 5; // 한 화면에 보이는 아이템 수
	let a = 0;
	$(".back").on("click", function() {
		currentPosition -= itemWidth;
		if(currentPosition <= 0){
			currentPosition = 0;
			$(".back").hide(); // 첫 아이템에 도달하면 이전 버튼 숨김 처리
		}
		$(".next").show(); // 이전 버튼이 클릭될 경우 다음 버튼 보이기
		$(".team-formation-list").css('transform','translate(-'+currentPosition+'px)');
	})
	$(".next").on("click", function() {
		currentPosition += itemWidth;
		const maxPosition = ($(".team-formation-list").children().length - visibleItems) * itemWidth;
		if (currentPosition >= maxPosition) {
	        currentPosition = maxPosition;
	        $(".next").hide(); // 마지막 아이템에 도달하면 다음 버튼 숨김 처리
	    }
		$(".back").show(); // 다음 버튼이 클릭될 경우 이전 버튼 보이기
		$(".team-formation-list").css('transform','translate(-'+currentPosition+'px)');
	})
});