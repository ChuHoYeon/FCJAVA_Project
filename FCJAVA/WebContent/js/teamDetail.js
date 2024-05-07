let $createPlayerImgSrc = null;
let $createPlayerName = null;
//선수 소개 팝오버
document.addEventListener('DOMContentLoaded', function() {
        var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
        var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl);
        });
});
$(document).ready(function(){
	const formationdata = $(".team-formation-list").data("formationdata");
	let $scores = $('.score');
	for (var i = 0; i < $scores.length - 1; i += 2) {
	    let $score1 = $($scores[i]);
	    let $score2 = $($scores[i + 1]);
	    
	    let score1 = parseInt($score1.text());
	    let score2 = parseInt($score2.text());
	    
	    if (score1 > score2) {
	      $score1.addClass('win');
	    } else if (score1 < score2) {
	      $score2.addClass('win');
	    }
	}
	//신청 취소버튼
	$("#staticBackdrop").on('hidden.bs.modal', function() {
		$(".player-photo").html('<img alt="선수 사진" src="png/default-profile.jpg">');
		$("input[name='pl_pic']").val('');
		$("input[name='back_num']").val('');
		$("input[name='height']").val('');
		$("input[name='weight']").val('');
		$("textarea[name='pl_memo']").val('');
	});
	
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
	
	const gk = {x: 270, y: 661};
	const lb = { x: 60, y: 537 };
	const lcb = { x: 210, y: 537 };
	const rcb = { x: 350, y: 537 };
	const rb = { x: 495, y: 537 };
	const lm = { x: 60, y: 300 };
	const lcm = { x: 210, y: 300 };
	const rcm = { x: 350, y: 300 };
	const rm ={ x: 495, y: 300 };
	const lst = { x: 210, y: 100 };
	const rst = { x: 350, y: 100 };
	const cdm = { x: 270, y: 430 };
	const st = { x: 270, y: 100 };
	const cb1 = { x: 150, y: 537 };
	const cb2 = { x: 270, y: 537 };
	const cb3 = { x: 390, y: 537 };
	
	const formations = {
			"3-1-4-2": {
				0: gk,
				1: cb1,
				2: cb2,
				3: cb3,
				4: cdm,
				5: lm,
				6: lcm,
				7: rcm,
				8: rm,
				9: lst,
				10: rst
			},
			"4-4-2": {
				0: gk,
				1: lb,
				2: lcb,
				3: rcb,
				4: rb,
				5: lm,
				6: lcm,
				7: rcm,
				8: rm,
				9: lst,
				10: rst
			},
			"4-1-4-1": {
				0: gk,
				1: lb,
				2: lcb,
				3: rcb,
				4: rb,
				5: cdm,
				6: lm,
				7: lcm,
				8: rcm,
				9: rm,
				10: st
			}
	}
	

	let $dataFormation = $(".showFor").data("formation");
	let $dataFormationname = $(".showFor").data("formationname");
	let matchingData = formationdata.filter(function(item) {
        return item.formation == $dataFormation && item.formation_name == $dataFormationname;
    });
	if(matchingData.length > 0) {
		showFormation(matchingData);
	}
	
    //포메이션 보기
	function showFormation(matchingData) {
		const selectedFormation = formations[matchingData[0].formation];
		if(selectedFormation) {
			$('.formation-info').empty();
			$('.showPlayer').each(function() {
				let cardid = $(this).data('cardid');
				const position = selectedFormation[cardid];
				const translateX = position.x;
				const translateY = position.y;
				$(this).css('transform', 'translate('+translateX+'px,'+translateY+'px)');
				$(this).empty();
				let formationPlayerProfile = '<img alt="선수사진" src="'+matchingData[cardid].player_pic+'">';
				formationPlayerProfile += '<div class="forPlaterName">'+matchingData[cardid].player_id+'</div>';
				$(this).append(formationPlayerProfile);
				
				let rightPlayerProfile = '<div class="formation-players"><div class="for-player-img"><img alt="선수사진" src="'+matchingData[cardid].player_pic+'"></div><div>'+matchingData[cardid].player_id+'</div></div>';
		        $('.formation-info').append(rightPlayerProfile);
			});
		}
	}

	$('.savedformation').on("click",function(){
		$('.savedformation').removeClass('showFor');
		$(this).addClass('showFor');
		
		$dataFormation = $(".showFor").data("formation");
		$dataFormationname = $(".showFor").data("formationname");
		matchingData = formationdata.filter(function(item) {
	        return item.formation == $dataFormation && item.formation_name == $dataFormationname;
	    });
		
		showFormation(matchingData);
	});
	
	//포메이션 좌우 화살표
	$(".back").hide();
	$(".next").hide();
	if($(".team-formation-list").children().length >=6){
		$(".next").show();
	}
	if($(".team-formation-list").children().length >=11){
		$(".createFormationBtn").hide();
	}
	let currentPosition = 0; // 현재 목록의 위치
	const itemWidth = 178; // 각 아이템의 너비
	const visibleItems = 5; // 한 화면에 보이는 아이템 수
	$(".back").on("click", function() {
		currentPosition -= itemWidth;
		if(currentPosition <= 0){
			currentPosition = 0;
			$(".back").hide(); // 첫 아이템에 도달하면 이전 버튼 숨김 처리
		}
		$(".next").show(); // 이전 버튼이 클릭될 경우 다음 버튼 보이기
		$(".team-formation-list").css('transform','translate(-'+currentPosition+'px)');
	});
	$(".next").on("click", function() {
		currentPosition += itemWidth;
		const maxPosition = ($(".team-formation-list").children().length - visibleItems) * itemWidth;
		if (currentPosition >= maxPosition) {
	        currentPosition = maxPosition;
	        $(".next").hide(); // 마지막 아이템에 도달하면 다음 버튼 숨김 처리
	    }
		$(".back").show(); // 다음 버튼이 클릭될 경우 이전 버튼 보이기
		$(".team-formation-list").css('transform','translate(-'+currentPosition+'px)');
	});
	
	//새 포메이션
	$('.createFormation').hide();
	$(".createFormationBtn").on("click", function() {
		$('.showFormation').hide();
		$('.createFormation').show();
	});
	let $selectFormationValue = $('#selectFormation').val();
	selectFormation($selectFormationValue);
	function selectFormation($selectFormationValue) {
		const selecteFormation = formations[$selectFormationValue];
		if(selecteFormation) {
			$('.createPlayer').each(function() {
				let cardid = $(this).data('cardid');
				const position = selecteFormation[cardid];
				const translateX = position.x;
				const translateY = position.y;
				$(this).css('transform', 'translate('+translateX+'px,'+translateY+'px)');
			});
		}
	}
	//포메이션 변경시 배치이동
	$('#selectFormation').on('change', function() {
		selectFormation($(this).val());
	});
	//뒤로가기,취소버튼
	$('.cancleCreateFormation').on('click', function() {
		let isCancle = confirm('저장을 취소하시겠습니까?');
		if(isCancle){
			$('.showFormation').show();
			$('.createFormation').hide();
			$('input[name="formation_name"]').val();
			$('input[name="player_id"]').val('');
			$('.createPlayer').each(function() {
				$(this).find('img').attr('src',"png/default-profile.jpg");
				$(this).find('.forPlaterName').text('');
			});
			$('.selectPlayers .formation-players').each(function() {
				$(this).removeClass('selectedPlayer');
			});
			$("#selectFormation").prop("selectedIndex", 0);
		}
	});
	//포메이션 저장
	$('#inFormation').on('submit', function() {
		let formationSaveKey = true;
		if($('input[name="formation_name"]').val() == null || $('input[name="formation_name"]').val() == ''){
			alert('포메이션이름을 작성해 주세요');
			return false;
		}
		$('.createPlayer').each(function() {
			if($(this).find('input[name="player_id"]').val() == '') {
				formationSaveKey = false;
				alert('전부 채워주세요');
				return false;
			}
		});
		if(formationSaveKey) {
			return true;
		}else {
			return false;
		}
	})
	let $player_id = null;
	$('.createPlayer').on('click', function() {
		$createPlayerImgSrc = $(this).find('img');
        $createPlayerName = $(this).find('.forPlaterName');
        $player_id = $(this).find('input[name="player_id"]');
        $('.createPlayer').find('img').removeClass('focus-player');
        $(this).find('img').addClass('focus-player');
	});
	$('.selectPlayers .formation-players').on('click', function(event) {
		if($createPlayerImgSrc != null && $createPlayerName != null) {
			let selectPlayerImgSrc = $(this).find('.for-player-img img').attr('src');
			let selectPlayerName = $(this).find('.for-player-name').text();
			let check = true;
			if($createPlayerName.text() == selectPlayerName) {
				check = false;
			}
			if(check){
				$('.createPlayer').each(function() {
					if($(this).find('.forPlaterName').text() == selectPlayerName) {
						$(this).find('.forPlaterName').text('');
						//$(this).find('img').attr('src', "png/uniform.png");
						$(this).find('img').attr('src', "png/default-profile.jpg");
					}
				});
				//$createPlayerImgSrc.attr('src', selectPlayerImgSrc);
				$createPlayerImgSrc.attr('src', "png/uniform.png");
				$createPlayerName.text(selectPlayerName);
				$player_id.val(selectPlayerName);
				$('.createPlayer').find('img').removeClass('focus-player');
				isSelectedPlayer();
				$createPlayerImgSrc = null;
				$createPlayerName = null;
				
			}
		}
	});
});
function isSelectedPlayer() {
	$('.selectPlayers .formation-players').removeClass('selectedPlayer');
	
	$('.selectPlayers .formation-players').each(function() {
		let isSelectedPlayerName = $(this).find('.for-player-name').text();
		let isSelectedPlayer = $(this);
		$('.createPlayer').each(function() {
			if($(this).find('.forPlaterName').text() == isSelectedPlayerName) {
				isSelectedPlayer.addClass('selectedPlayer');
			}
		});
	});
}
$(document).on('click', function(event) {
    // 클릭된 요소가 .createPlayer 또는 .formation-players 요소가 아닌 경우
    if (!$(event.target).closest('.createPlayer').length && !$(event.target).closest('.formation-players').length) {
        $createPlayerImgSrc = null;
        $createPlayerName = null;
        $('.createPlayer').find('img').removeClass('focus-player');
    }
});