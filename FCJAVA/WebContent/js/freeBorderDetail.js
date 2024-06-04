$(function(){
	if(check == false){
		$(".updateContent").hide();
	}
	
	$('#delbtn').click(function(){
        let result = confirm("삭제하시겠습니까?");
        if(result){
            window.location.href = 'freeBorderDelete.jsp?number=' + freeBorderPage; // 페이지 이동
        }
    });

	$(".btn-favorite").click(function(){
		const borderNum = $(this).val();
		const src = $(".love");
		console.log(sessionID);
		if(sessionID !== 'null') {
			if(src.attr("srcset") == "png/love-zero.svg"){
				$.ajax({
			  	      url : "fBorderLike.jsp",
			  	      data : {
			  	    	  ID : sessionID,
			  	    	  Num : borderNum,
		  	    	  },
			  	      success : function(re){
			  	    	  src.attr("srcset", "png/love-red.svg");
			  	      }
			  	});
			} else {
				$.ajax({
			  	      url : "fBorderUnLike.jsp",
			  	      data : {
			  	    	  ID : sessionID,
			  	    	  Num : borderNum,
		  	    	  },
			  	      success : function(re){
			  	    	  src.attr("srcset", "png/love-zero.svg");
			  	      }
			  	});
			}	
		} else {
			const isLogin = confirm("로그인을 해야 이용가능합니다. 로그인하시겠습니까?");
			if (isLogin) {
				window.location.href = "login.jsp";
			}
		}
	})
})