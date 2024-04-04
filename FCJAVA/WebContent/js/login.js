function loginCheck(){
	let id = $("input[name='id']").val();
	let pw = $("input[name='pw']").val();
	let result = false;
	$.ajax({
		url: "loginCheck.jsp",
		data: {
			id: id,
			pw: pw,
		},
		success : function(re){
			console.log(re);
			if(re.indexOf("id") != -1){
				$("#alertID").html("없는 아이디입니다.");
				result=false;
			} else if(re.indexOf("pw") != -1) {
				$("#alertID").html("");
				$("#alertPW").html("비밀번호가 틀렸습니다.");
				result=false;
			} else {
				result=true;
			}
		},
		//ajax가 끝나고나서 loginCheck함수가 끝나게할려고.
		async: false,
	});
	return result;
}