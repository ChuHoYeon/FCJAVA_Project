function logoChange(img) {
		let file = img.files[0];
		teamLogo = URL.createObjectURL(file);
	    $('.logoImg').html(" <img src='" + URL.createObjectURL(file) + "'/> ");
}
function check(index) {
	index.value = index.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
	if(index.value.length > 2) {
		index.value = index.value.slice(0, 2);
	}
}

function teamCreating() {
	let result = false;
	let teamName = $("input[name='teamName']").val();
	
	if(teamName == ""){
		$(".dupTeamName").html("팀 이름을 입력해주세요.");
		result = false;
	} else if($("input[name='city']:checked").size() == 0) {
		alert("연고지를 선택해 주세요")
	} else if ($("input[name='week']:checked").size() == 0) {
		alert("활동요일을 선택해 주세요")
	} else if ($("input[name='skill']:checked").size() == 0){
		alert("팀 실력을 선택해 주세요")
	} else if ($("input[name='age']:checked").size() == 0) {
		alert("연령대를 선택해 주세요")
	} else if ($("input[name='maxNum']").val() == "") {
		alert("최대 가입인원을 입력해 주세요")
	} else {
		$.ajax({
		      url : "teamNameCheck.jsp",
		      data : {teamNAME : teamName},
		      success : function(re){
		    	  if (re.indexOf('1') != -1) {
		    		  $(".dupTeamName").html("중복된 팀 이름이 있습니다.");
		    		  result = false;
		    	  } else {
		    		  $(".dupTeamName").html("");
		    		  alert("팀 생성이 성공적으로 완료되었습니다! 환영합니다!");
		    		  result = true;
		    	  }
		      },
		      async: false,
		});
	}
	return result;
}
