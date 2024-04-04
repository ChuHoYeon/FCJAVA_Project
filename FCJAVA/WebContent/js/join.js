var box = document.getElementsByClassName("infoBox");
var war = document.getElementsByClassName("warning");
var infoCheck = [];

//비밀번호
function pwCheck() {
  let expPass = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#%^&*])[A-Za-z\d!@#%^&*]{4,20}$/;
  let pw = document.querySelector("input[name='pw']");
  if (pw.value == "") {
    war[1].innerHTML = "비밀번호를 입력해주세요.";
    box[1].style.borderColor = "red";
    infoCheck[1] = false;
  } else if (!expPass.test(pw.value)) {
    war[1].innerHTML = "비밀번호는 대문자/소문자/특수문자 포함 4~20글자 입력해주세요.";
    box[1].style.borderColor = "red";
  }
  else {
    war[1].innerHTML = "";
    box[1].style.borderColor = "green";
    infoCheck[1] = true;
  }
}
//비밀번호 확인
function pwcCheck() {
  let pw = document.querySelectorAll("input[type='password']");
  if (pw[1].value == "") {
    war[2].innerHTML = "비밀번호를 입력해주세요.";
    box[2].style.borderColor = "red";
    infoCheck[2] = false;
  } else if (pw[1].value != pw[0].value) {
    war[2].innerHTML = "비밀번호가 서로 다릅니다.";
    box[2].style.borderColor = "red";
    infoCheck[2] = false;
  } else {
    war[2].innerHTML = "";
    box[2].style.borderColor = "green";
    infoCheck[2] = true;
  }
}
//이름
function nameCheck() {
  let expName = /^[가-힣]{2,10}$/;
  var name = document.querySelector("input[name='name']");
  if (name.value == "") {
    war[3].innerHTML = "이름을 입력해주세요.";
    box[3].style.borderColor = "red";
    infoCheck[3] = false;
  } else if (!expName.test(name.value)) {
    war[3].innerHTML = "잘못된 형식입니다. 다시입력해주세요.";
    box[3].style.borderColor = "red";
  }
  else {
    war[3].innerHTML = "";
    box[3].style.borderColor = "green";
    infoCheck[3] = true;
  }
}
//생년월일
function birCheck() {
  let expBir = /^(19[0-9][0-9]|20[0-2][0-4])(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
  var bir = document.querySelector("input[name='bir']");
  if (bir.value == "") {
    war[4].innerHTML = "생년월일을 입력해주세요.";
    box[4].style.borderColor = "red";
    infoCheck[4] = false;
  } else if (!expBir.test(bir.value)) {
    war[4].innerHTML = "잘못된 형식입니다. 다시입력해주세요.";
    box[4].style.borderColor = "red";
    infoCheck[4] = false;
  }
  else {
    war[4].innerHTML = "";
    box[4].style.borderColor = "green";
    infoCheck[4] = true;
  }
}
//휴대폰 번호
function cellCheck() {
  let expCell = /^01([0|1|6|7|8|9])?\d{8}$/;
  var cell = document.querySelector("input[type='tel']");
  if (cell.value == "") {
    war[5].innerHTML = "휴대폰 번호를 입력해주세요.";
    box[5].style.borderColor = "red";
    infoCheck[5] = false;
  } else if (!expCell.test(cell.value)) {
    war[5].innerHTML = "잘못된 형식입니다. 다시입력해주세요.";
    box[5].style.borderColor = "red";
    infoCheck[5] = false;
  }
  else {
    war[5].innerHTML = "";
    box[5].style.borderColor = "green";
    infoCheck[5] = true;
  }
}

//이메일
function emailCheck() {
  let expEmail = /[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
  let expEmail1 = /^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]{2,64}$/;
  var email = document.querySelector("input[name='email']");
  var emailSelect = document.querySelector("select");
  if (email.value == "") {
    war[7].innerHTML = "이메일을 입력해주세요.";
    box[7].style.borderColor = "red";
    infoCheck[7] = false;
  } else if (email.value.length < 2) {
    war[7].innerHTML = "이메일은 2글자 이상 입력해주세요.";
    box[7].style.borderColor = "red";
    infoCheck[7] = false;
  } else if (emailSelect.options[0].selected) {
    if (!expEmail.test(email.value)) {
      war[7].innerHTML = "잘못된 이메일 형식입니다.";
      box[7].style.borderColor = "red";
      infoCheck[7] = false;
    } else {
      war[7].innerHTML = "";
      box[7].style.borderColor = "green";
      infoCheck[7] = true;
    }
  } else {
    if (email.value.indexOf("@") != -1) {
      war[7].innerHTML = "잘못된 이메일 형식입니다.";
      box[7].style.borderColor = "red";
      infoCheck[7] = false;
    } else if (!expEmail1.test(email.value)) {
    	war[7].innerHTML = "영문/숫자 2~64자 입력해주세요";
        box[7].style.borderColor = "red";
        infoCheck[7] = false;
    } else {
      war[7].innerHTML = "";
      box[7].style.borderColor = "green";
      infoCheck[7] = true;
    }
  }
}
//우편번호찾기
function serchAddr() {
  new daum.Postcode({
    oncomplete: function (data) {
      document.getElementById('addr1').value = "(" + data.zonecode + ")" + data.address;
      box[8].style.borderColor = "green";
      infoCheck[8] = true;
      document.getElementById('addr2').focus();
    }
  }).open();
}


//상세주소
function addr2Check() {
  var addr2 = document.querySelector("input[name='addr2']");
  if (addr2.value == "") {
    war[9].innerHTML = "상세주소를 입력해주세요.";
    box[9].style.borderColor = "red";
    infoCheck[9] = false;
  } else {
    war[9].innerHTML = "";
    box[9].style.borderColor = "green";
    infoCheck[9] = true;
  }
}
//가입 버튼
function joinbtn() {
  //성별
  //let gend = document.querySelectorAll("input[name='gender']");
  infoCheck[6] = true;

  let count = 0;
  for (var i = 0; i < infoCheck.length; i++) {
    if (infoCheck[i] == true) {
      count += 1;
    }
  }

  if (count == 10) {
    alert("회원가입이 성공적으로 완료되었습니다! 환영합니다!");
  }
  else {
    alert("회원가입 실패: 입력한 정보가 유효하지 않습니다.\n모든 필드를 올바르게 입력해 주세요.");
    return false;
  }
}

$(function () {
  // 성별 - 백그라운드
  $("input[name='gender']").each(function () {
    if ($(this).is(":checked") == true) {
      $(this).css({ "background-color": "red" });
    }
  });
  
  //아이디
  $("input[name='id']").blur(function(){
	  let expId = /^[a-zA-Z0-9]{4,20}$/;
	  let id = $(this).val();

	  if (id == "") {
		  
		  war[0].innerHTML = "아이디를 입력해주세요.";
		  box[0].style.borderColor = "red";
		  infoCheck[0] = false;
		  return;
	  } else if (!expId.test(id)) {
	      war[0].innerHTML = "아이디는 영문/숫자 4~20글자 입력해주세요. 다시 입력해주세요.";
  	      box[0].style.borderColor = "red";
	      infoCheck[0] = false;
	      return;
	  }
  	  $.ajax({
  	      url : "joinIdCheck.jsp",
  	      data : {ID : id},
  	      success : function(re){
  	    	  if (re.indexOf('1') != -1) {
  	    		  war[0].innerHTML = "중복된 아이디가 있습니다. 다시 입력해주세요.";
  			      box[0].style.borderColor = "red";
  			      infoCheck[0] = false;
  	    	  } else {
  				  war[0].innerHTML = "";
  				  box[0].style.borderColor = "green";
  				  infoCheck[0] = true;
  	    	  }
  	      }
  	  });
  })
 
})