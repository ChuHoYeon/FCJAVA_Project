$(function() {
	let $league = $(".tab-focus").data("league");
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
			url: 'fcjava.index',
			type: 'GET',
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
})