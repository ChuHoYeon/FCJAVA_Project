$(function() {
	let $league = $(".tab-focus").data("league");
	randomStadium();
	newTeamList();
	searchLeague($league);	
    
	//탭 변경
    $('.tab').on("click",function(){
    	$league = $(this).data("league");
        $('.tab').removeClass('tab-focus');
        $(this).addClass('tab-focus');
        searchLeague($league);
    });
 
    function randomStadium() {
		$.ajax({
			url: 'fcjava.index',
			data: {
				"page" : "oneStadium",
			},
			success: function(data) {
				const jsonStadium = JSON.parse(data);
				$('#stadiumName').append(`${jsonStadium.g_name}`);
				$('#stadiumTime').append(`${jsonStadium.g_time}`);
				$('#stadiumSize').append(`${jsonStadium.g_size}`);
				$('#stadiumAddr').append(`${jsonStadium.g_add}`);
				$('input[name="sta_num"]').val(jsonStadium.g_no);
			},
		});
	};
	$('input[type="date"]').val(new Date().toISOString().substring(0, 10));
	
	$('form[name="goStadium"]').on('submit', function() {
		let selectedTimes = $('input[name="selectedTimes"]').val();
		if(sessionID == 'null'){
			alert('로그인이 필요한 서비스입니다. 로그인해주세요.');
            window.location.href = "login.jsp";
            return false;
		}
		if(selectedTimes == ''){
			alert('예약할 시간을 선택하세요.');
            return false;
		}

	});
	$('.checkBtn').on('click', function() {
		let selectedTimes = [];
    	$('.checkBtn:checked').each(function() {
    		var time = $(this).next('label').text();
            selectedTimes.push(time);
		});
		
		let a=$('.checkBtn:checked').length;
		if(a > 3) {
			alert("최대 이용시간은 3시간 입니다.");
			return false;
		}
		if(a >= 1){
			let price = a*3;
			$('.price').text(price+'0,000 원');			
		}else {
			$('.price').text('');
		}
		$('input[name="selectedTimes"]').val(selectedTimes.join(','));
		$('input[name="totalAmount"]').val(parseInt($('.price').text().replace(/\D/g, '')));
	});

	function searchLeague($league) {
		$.ajax({
			url: 'fcjava.index',
			data: {
				"page" : "footballData",
				"league" : $league,
			},
			success: function(data) {
                let plTeamList = data.standings[0].table;
				$('#standings').empty();
                $.each(plTeamList, function(index, value) {
					let num = index+1;
					$('#standings').append(`
						<div class="clubLine">
							<div class="clubItem">${value.position}</div>
							<div class="clubItem clubName">
								<div class="crestBox"><img src='${value.team.crest}' /></div>
								<div>${value.team.name}</div>
							</div>
							<div class="clubItem">${value.playedGames}</div>
							<div class="clubItem">${value.won}</div>
							<div class="clubItem">${value.draw}</div>
							<div class="clubItem">${value.lost}</div>
							<div class="clubItem">${value.goalsFor}</div>
							<div class="clubItem">${value.goalsAgainst}</div>
							<div class="clubItem">${value.points}</div>
						</div>
					`);
				})
            },
            error: function(xhr, status, error) {
            	console.error('리그 순위 에러:', xhr.responseText);
            }
		})
	}
	function newTeamList() {
		$.ajax({
			url: 'fcjava.index',
			data: {
				"page":"newTeamList",
			},
			success: function(data) {
				try{
				let teamList = JSON.parse(data);
				$.each(teamList, function(index, value) {
					let teamLogo = "./png/defaultLogo.png";
					if(value.t_logo != null){
						teamLogo = "/FCJAVA/png/playerPhoto/"+value.t_logo;
					}
					let date = new Date(value.t_c_day);
					let formattedDate = date.getFullYear() + '-' + (date.getMonth() + 1).toString().padStart(2, '0') + '-' + date.getDate().toString().padStart(2, '0');
					teamSwiper.appendSlide(
					`
					<div class="swiper-slide teamCard">
						<div class="teamImg"><img src='${teamLogo}'/></div>
						<div>
							<h2 class="teamTitle">${value.t_name}</h2>
							<div class="teamInfo">
								<p class="col">연고지 : ${value.hom_city}</p>
								<p class="col">팀 실력 : ${value.t_skill}</p>
								<p class="col">활동요일 : ${value.week_time}</p>
								<p class="col">생성일 : ${formattedDate}</p>
							</div>
						</div>
					</div>
					`);
				});
				} catch(e){
					console.error("JSON파싱 오류:",e);
				}
			},
			error: function(xhr, status, error) {
            	console.error('에러:', error);
            }
		});
	}
	let topSwiper = new Swiper('.topSwiper', {
		autoplay: {
			delay: 2500,
		},
		loop: true,
		slidesPerView: 1,
		centeredSlides: true,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
	});
	let teamSwiper = new Swiper(".teamSwiper", {
		spaceBetween: 30,
		centeredSlides: true,
		pagination: {
			el: ".swiper-pagination",
			clickable: true,
		},
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		}
	});
	
	
});