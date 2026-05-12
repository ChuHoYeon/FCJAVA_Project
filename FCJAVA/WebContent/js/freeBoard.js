$(function(){
	if(sessionID == 'null'){
		$(".topbtn").hide();
	}
	
	$(".btn-favorite").click(function(){
		let borderNum = $(this).val();
		let src = $(this).find(".love");
		if(sessionID !== 'null') {
			if(src.attr("srcset") == "png/love-zero.svg"){
				$.ajax({
			  	      url : "fcjava.board?page=like",
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
			  	      url : "fcjava.board?page=unlike",
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
			let isLogin = confirm("로그인을 해야 이용가능합니다. 로그인하시겠습니까?");
			if (isLogin) {
				window.location.href = "login.jsp";
			}
		}
	})
})
