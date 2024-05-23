$(function() {
	let $league = $(".tab-focus").data("league");
	newTeamList()
	searchLeague($league);
	
	//탭 변경
    $('.tab').on("click",function(){
    	$league = $(this).data("league");
        $('.tab').removeClass('tab-focus');
        $(this).addClass('tab-focus');
        searchLeague($league);
    });
    
	function searchLeague($league) {
		$.ajax({
			url: 'fcjava.index?page=footballData',
			data: {
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
			url: 'fcjava.team',
			data: {
				"page":"newTeamList",
			},
			success: function(data) {
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
})