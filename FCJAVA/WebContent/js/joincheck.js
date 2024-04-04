
// function a(){
//   var a1=document.querySelectorAll(".boline");
//   for (var i=0 ; i <a1.length; i++){
//     if(a1[i].value==''){
//       a1.style.borderColor="green";
//     }
//   }

// }

function a(){
  var a1=document.querySelectorAll(".boline");
  a1.style.borderColor="red";

    }
  



// function a(){
//       alert("빈값을 입력해주세요");
// }





function joinch(){

var id=myform.idin.value;
var pw=myform.pw.value;
var pwc=myform.pwc.value;
var nam=myform.nam.value;
var add1=myform.add1.value; 
var add2=myform.add2.value;
var add3=myform.add3.value;
var date=myform.date.value;
var gender=myform.gender.value;
var pnum=myform.pnum.value;
var email=myform.email.value;





if(id.length <= 3 ) {
  alert("id는 최소 3글자 이상입니다 ");
  return;
}

if(id.length >+ 10 ){
  alert("ID 길이는 10글자를 넘을 수 없습니다.")
  return;
}
  if(pw==pwc) {
    alert("패스워드가 정상으로 입력되었습니다.")
     }
     else {
       alert("패스워드가 불일치 합니다. ")
       return;
     }

     if(myform.gender[0].checked){
       gender=myform.gender[0].value
    } else {
      gender=myform.gender[1].value
    }
  if(id=="") {
    alert("아이디를 입력하세요 ");
    return;
  }
  if(pw==""){
        alert("pw 를 입력하세요");
        return;
    }
  if(pwc==""){
    alert("pwc 비밀번호 확인을 입력해주세요 ");
    return;
  }

  if(nam=="")
  {
    alert("이름을 입력하세요 "); 
    return;
  }
  if (add1.length!=5) {
    alert("우편번호는 신주소만 가능합니다. 5자리로 입력해주세요 ");
    return;
  }
  if(add1=="") {
    alert("우편번호를 입력해주세요 ");
    return;
  }

  if(add2=="") {
    alert("주소를 입력해주세요");
    return;
  }

  if(date.length!=8){
    alert("생년월일은 8자리로 입력해주세요 ex) 19001210");
    return;
  }
  if(date==""){
    alert("생년월일을 입력해주세요 ");
    return;
  }

if(pnum.length != 11 && pnum.length!=10 ){
  alert("전화번호는 11자리 또는 10자리로 입력하셔야 합니다.");
  return;
}
if(pnum==""){
  alert("전화번호를 입력해주세요")
  return;
}

if(add3=="") {
    alert("주소 상세를 입력해주세요");
    return;
}

if(pnum==""){
   alert("핸드폰 번호를 입력해주세요 ");
   return;
}
    alert("입력한 내용을 확인 해주세요\n" + 
    "ID : "+ id + "\n"+ 
    "이름 : "+ nam + "\n" +
    "패스워드 : " + pw + "\n"+ 
    "주소 : " + add1 + add2 + add3 +"\n" +
    "성별 : " + gender + "\n"+
    "휴대폰번호 : " + pnum +"\n"+ 
    "생년월일 : " + date +"\n"+ 
    "E-mail : " + email);

}




// pwch() {
//   // var aa= document.getElementsByName("idin");   
//   // aa.innerHTML="아이디 최소 길이는 3글자 이상입니다. "


//   var dh=document.querySelector('#div1');
//   dh.innerHTML="<h1> text </h1>";
  


//   //  if(id.length <= 3){
    
//   //  }

  
//   //  if(pwc!=pw) {
//   //     dh.innerHTML = "패스워드가 일치하지 않습니다."    
//   // }
  

// }

