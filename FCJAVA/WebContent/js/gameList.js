$(function() {
	//clear버튼
	$(".closeBtn").hide();
	$("input[name='search-text']").keyup(function(){
		  $(".closeBtn").toggle(Boolean($(this).val()));
	});
	$(".closeBtn").click(function() {
		$("input[name='search-text']").val('').focus();
		$(this).hide();
	})
	//검색 탭
	$("input[name='status-tab']").on("change", function () {
		let search = $("input[name='search-text']").val();
		let status = $(this).val();
		let currentTime = new Date();
		getSearching(search, status, currentTime);
	});
	//검색버튼
	$(".btn-search").on("click", function() {
		let search = $("input[name='search-text']").val();
		let status = $("input[name='status-tab']:checked").val();
		let currentTime = new Date();
		getSearching(search, status, currentTime);
	});
	//검색 엔터키
	$("input[name='search-text']").keypress(function(event) {
	    if (event.which === 13) {
	        $(".btn-search").click();
	    }
	});
	
	//검색ajax
	function getSearching(search, status, currentTime) {
		$.ajax({
            url: "fcjava.game?page=gameSearch",
            data: {
                "search-text": search,
                "status-tab": status
            },
            dataType: 'json',
            success: function(data) {
           		$(".conten-area").empty();
           		$(".searchResult").empty();
            	if(data.length > 0) {
            		$(".no-search").remove();
            		let imgNum = 1;
                	for (let i = 0; i < data.length; i++) {
                		let per = (data[i].game_apply * 100) / data[i].type;
                		const substDate = new Date(data[i].subst_date);
                        const subfnDate = new Date(data[i].subfn_date);
                        const startDate = new Date(data[i].st_date);
                        const finalDate = new Date(data[i].fn_date);
                        
                        let month = startDate.getMonth() + 1;
                        let day = startDate.getDate();
                        let hours = startDate.getHours();
                        if(hours <= 10) {
                        	hours = '0'+hours;
                        }
                        let minutes = startDate.getMinutes();
                        if(minutes <= 10) {
                        	minutes = '0'+minutes;
                        }
                		let state = "";
                		if(currentTime < substDate) {
                			state = "<span class='status'>접수예정</span>";
                		} else if (currentTime > subfnDate && currentTime < startDate || (currentTime > substDate && currentTime < subfnDate && per ==100)) {
                			state = "<span class='status end-status'>접수마감</span>";
                		} else if (currentTime > startDate && currentTime < finalDate) {
                			state = "<span class='status start-status'>진행중</span>";
                		} else if (currentTime > finalDate || (currentTime > subfnDate && per < 100)) {
                			state = "<span class='status end-status'>종료</span>";
                		} else {
                			state = "<span class='status'>접수중</span>";
                		}
                		$(".conten-area").append(`
                			<li>
                				<a href='fcjava.game?page=2&game_num=${data[i].num}' class='game-card'>
	                				<div class='card-thumb'>
	                					<div class='game-status'>${state}</div>
	                					<img src='png/gameposter${imgNum}.jpg'/>
	        						</div>
	        						<div class='card-title'>
	        							<article class='gameDate'>
	        								<p class='m'>${month}월</p>
	        								<p class='d'>${day}</p>
	    								</article>
										<div class='title-holder'>
											<h3>${data[i].name}</h3>
											<p>${hours}:${minutes}  •  ${data[i].place}  • ${data[i].type}강</p>
											</div>
										</div>
									</div>
								</a>
							</li>
                		`);
                		imgNum += 1;
                		if(imgNum>2) imgNum=1;
                	}
                	$(".searchResult").append("총 <strong>"+data.length+"</strong> 개");
            	} else {
            		$(".searchResult").append("총 <strong>"+data.length+"</strong> 개");
            		$(".no-search").remove();
            		$(".content").append("<div class='no-search'>검색된 결과가 없습니다.</div>");
            	}
            },
        });
	}
}) 