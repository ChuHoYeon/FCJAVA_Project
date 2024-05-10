$(function () {
    let showTeam = 10;
    //처음 팀 불러오기
    for (let i = 0; (i < showTeam) & (i < teamList.length); i++) {
    	let dateObj = new Date(teamList[i].t_c_day);
    	let year = dateObj.getFullYear();
    	let month = ("0" + (dateObj.getMonth() + 1)).slice(-2);
    	let day = ("0" + dateObj.getDate()).slice(-2);
    	let formattedDate = year + "-" + month + "-" + day;
    	let teamLogo = "png/defaultLogo.png";
    	if(teamList[i].t_logo != null) {
    		teamLogo = "/FCJAVA/png/playerPhoto/"+teamList[i].t_logo;
    	}
        $("#teamlists").append(
            /*html*/
            `
            <li>
        		<div class="team" data-bs-toggle="modal" data-bs-target='#Modal${teamList[i].t_num}'>
                    <div class="teamlogo">
                        <img src="${teamLogo}"/>
                    </div>
                    <div class="teamTitle">
                        <h2>${teamList[i].t_name}</h2>
                    </div>
                    <div class="teamin">
                        <div class="teaminLeft1">
                            <p>연고지 : ${teamList[i].hom_city}</p>
                            <p>팀 실력 : ${teamList[i].t_skill}</p>
                        </div>
                        <div class="teaminLeft2">
                            <p>활동요일 : ${teamList[i].week_time}</p>
                            <p>생성일 : ${formattedDate}</p>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id='Modal${teamList[i].t_num}' tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
			        <div class="modal-dialog modal-dialog-centered">
			            <div class="modal-content">
			                <div class="modal-body">
		                       <div class="pop-logo">
		                            <img src="${teamLogo}"/>
		                        </div>
		                        <div class="pop-info">
		                            <h1 class="modal-title fs-5" id="ModalLabel">${teamList[i].t_name}</h1>
					                <p>연고지 : ${teamList[i].hom_city}</p>
					                <p>팀 실력 : ${teamList[i].t_skill}</p>
					                <p>활동요일 : ${teamList[i].week_time}</p>
					               	<p>생성일 : ${formattedDate}</p>
		                        </div>
			                </div>
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			                    <a href="fcjava.team?page=detail&teamNumber=${teamList[i].t_num}" class="btn btn-danger" role="button">팀 이동</a>
			                </div>
			            </div>
	        		</div>
			   </div>
            </li>
            `
        );
    }
    //팀개수 10미만이면 더보기 숨김
    if (teamList.length <= 10) {
        $(".plusbtn").hide();
    } else {
        $(".plusbtn").show();
    }
    //더보기 누르면 10개씩 추가
    $("#team-more").click(function () {
        for (let i = showTeam; (i < showTeam + 10) & (i < teamList.length); i++) {
        	let dateObj = new Date(teamList[i].t_c_day);
        	let year = dateObj.getFullYear();
        	let month = ("0" + (dateObj.getMonth() + 1)).slice(-2);
        	let day = ("0" + dateObj.getDate()).slice(-2);
        	let formattedDate = year + "-" + month + "-" + day;
        	let teamLogo = "png/defaultLogo.png";
        	if(teamList[i].t_logo != null) {
        		teamLogo = "/FCJAVA/png/playerPhoto/"+teamList[i].t_logo;
        	}
            $("#teamlists").append(
                /*html*/
                `
                <li>
	        		<div class="team" data-bs-toggle="modal" data-bs-target='#Modal${teamList[i].t_num}'>
	                    <div class="teamlogo">
	                        <img src="${teamLogo}"/>
	                    </div>
	                    <div class="teamTitle">
	                        <h2>${teamList[i].t_name}</h2>
	                    </div>
	                    <div class="teamin">
	                        <div class="teaminLeft1">
	                            <p>연고지 : ${teamList[i].hom_city}</p>
	                            <p>팀 실력 : ${teamList[i].t_skill}</p>
	                        </div>
	                        <div class="teaminLeft2">
	                            <p>활동요일 : ${teamList[i].week_time}</p>
	                            <p>생성일 : ${formattedDate}</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="modal fade" id='Modal${teamList[i].t_num}' tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
			        <div class="modal-dialog modal-dialog-centered">
			            <div class="modal-content">
			                <div class="modal-body">
		                       <div class="pop-logo">
		                            <img src="${teamLogo}"/>
		                        </div>
		                        <div class="pop-info">
		                            <h1 class="modal-title fs-5" id="ModalLabel">${teamList[i].t_name}</h1>
					                <p>연고지 : ${teamList[i].hom_city}</p>
					                <p>팀 실력 : ${teamList[i].t_skill}</p>
					                <p>활동요일 : ${teamList[i].week_time}</p>
					               	<p>생성일 : ${formattedDate}</p>
		                        </div>
			                </div>
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			                    <a href="fcjava.team?page=detail&teamNumber=${teamList[i].t_num}" class="btn btn-danger" role="button">팀 이동</a>
			                </div>
			            </div>
	        		</div>
			    </div>
	            </li>
                `
            );
            //마지막팀에서 더보기버튼 숨기기
            if (i == teamList.length - 1) {
                $(".plusbtn").hide();
            }
        }
        showTeam += 10; // 보이는 팀 개수 업데이트
    });
	function searchTeam() {
		let selectedRegions = [];
    	let selectedDays = [];
    	let selectedSkill = [];
    	let teamName = $("#input_tname").val();
        $('input[name="city"]:checked').each(function() {
            selectedRegions.push($(this).val());
        });
        $('input[name="week"]:checked').each(function() {
            selectedDays.push($(this).val());
        });
        $('input[name="skill"]:checked').each(function() {
        	selectedSkill.push($(this).val());
        });
        $.ajax({
        	url: 'fcjava.team?page=teamSearch',
        	data: {
        		hom_city: selectedRegions,
        		week_time: selectedDays,
        		t_skill: selectedSkill,
                t_name: teamName
        	},
        	success: function(result) {
        		console.log('ajax성공! = ' + result.length);
        		$("#teamlists").empty();
        		showTeam = 10;
        		teamList = result;
        		if (teamList.length <= 10) {
        			$(".plusbtn").hide();
        		} else {
        			$(".plusbtn").show();
        		}
        		if (result && result.length > 0) {
        			for (let i = 0; (i < showTeam) & (i < teamList.length); i++) {
        		    	let dateObj = new Date(teamList[i].t_c_day);
        		    	let year = dateObj.getFullYear();
        		    	let month = ("0" + (dateObj.getMonth() + 1)).slice(-2);
        		    	let day = ("0" + dateObj.getDate()).slice(-2);
        		    	let formattedDate = year + "-" + month + "-" + day;
        		    	let teamLogo = "png/defaultLogo.png";
        	        	if(teamList[i].t_logo != null) {
        	        		teamLogo = "/FCJAVA/png/playerPhoto/"+teamList[i].t_logo;
        	        	}
        		    	
        		        $("#teamlists").append(
        		            /*html*/
        		            `
        		            <li>
        		        		<div class="team" data-bs-toggle="modal" data-bs-target='#Modal${teamList[i].t_num}'>
        		                    <div class="teamlogo">
        		                        <img src="${teamLogo}"/>
        		                    </div>
        		                    <div class="teamTitle">
        		                        <h2>${teamList[i].t_name}</h2>
        		                    </div>
        		                    <div class="teamin">
        		                        <div class="teaminLeft1">
        		                            <p>연고지 : ${teamList[i].hom_city}</p>
        		                            <p>팀 실력 : ${teamList[i].t_skill}</p>
        		                        </div>
        		                        <div class="teaminLeft2">
        		                            <p>활동요일 : ${teamList[i].week_time}</p>
        		                            <p>생성일 : ${formattedDate}</p>
        		                        </div>
        		                    </div>
        		                </div>
        		                <div class="modal fade" id='Modal${teamList[i].t_num}' tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        					        <div class="modal-dialog modal-dialog-centered">
        					            <div class="modal-content">
        					                <div class="modal-body">
        				                       <div class="pop-logo">
        				                            <img src="${teamLogo}"/>
        				                        </div>
        				                        <div class="pop-info">
        				                            <h1 class="modal-title fs-5" id="ModalLabel">${teamList[i].t_name}</h1>
        							                <p>연고지 : ${teamList[i].hom_city}</p>
        							                <p>팀 실력 : ${teamList[i].t_skill}</p>
        							                <p>활동요일 : ${teamList[i].week_time}</p>
        							               	<p>생성일 : ${formattedDate}</p>
        				                        </div>
        					                </div>
        					                <div class="modal-footer">
        					                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        					                    <a href="fcjava.team?page=detail&teamNumber=${teamList[i].t_num}" class="btn btn-danger" role="button">팀 이동</a>
        					                </div>
        					            </div>
        			        		</div>
        					   </div>
        		            </li>
        		            `
        		        );
        		    };
                } else {
                    console.log('결과값이 없습니다.');
                    $("#teamlists").append(
            		/*html*/
		            `
		            <li>
                    	<div class="notResult">찾으시는 팀이 없습니다.</div>
		            </li>
		            `
            		);
                };
            },
        });
	}
    //검색버튼
    $("#chkSearch").click(function () {
    	searchTeam();
    });
    //초기화버튼
    $("#chkReset").click(function(){
        $('input[type=checkbox]').prop('checked', false);
        $('#input_tname').val('');
    });

    //팀 마우스오버
    $("#teamlists").on("mouseenter", ".team", function () {
        $(this).css({ "filter": "brightness(70%)" });
    });
    $("#teamlists").on("mouseleave", ".team", function () {
        $(this).css({ "filter": "brightness(100%)" });
    });


    //jQuery Ui 항목
    $("input").checkboxradio({
        icon: false,
    });
});
