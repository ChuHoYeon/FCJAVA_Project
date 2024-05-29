$(document).ready(function () {
  $('.over').hover(function () {
      // 호버된 이미지의 src 속성을 변경하여 sh_de1 클래스에 속한 이미지 파일의 src 속성을 변경합니다.
      $(this).attr('src', $(this).attr('src').replace('.avif', '_on.avif'));
  }, function () {
      // 원래 이미지의 src 속성을 변경하여 sh_de1 클래스에 속한 이미지 파일의 src 속성을 변경합니다.
      $(this).attr('src', $(this).attr('src').replace('_on.avif', '.avif'));
  });
});




// $(document).ready(function(){ 
 
//    $('.over').hover(function(){
//       $('.sh2 img').attr('src',$('.sh2 img').attr('src').replace('.avif','_on.avif'));
//    });   
  
//   $('.over').mouseout(function(){
//     $('.sh2 img').attr('src',$('.sh2 img').attr('src').replace('_on.avif','.avif'));
//   });
// });
 


$(document).ready(function(){ 
 
  $('.tab1').hover(function(){
     $(this).css('background-color','pink' );
  });   
 
 $('.tab1').mouseout(function(){
     $(this).css('background-color','black' );
 });
});




// $('.sh2 img').mouseover(function(){
//   $(this).attr('src','png/sin_bal1.PNG');
// });


// $('.sh2 img').mouseout(function(){
// $(this).attr('src','png/sin_bal2.PNG');
// });




    // $(document).ready(function(){
    //     $('.over').hover(function(){
    //         var originalSrc = $(this).attr('src');
    //         var newSrc = $(this).attr('src').replace('.jpg','_on.jpg'); // 호버된 이미지의 속성 변경
    //         $('.sh_de1 img').attr('src', newSrc); // sh_de1 클래스에 속한 이미지 파일의 src 속성 변경
    //     }, function(){
    //         var originalSrc = $(this).attr('src');
    //         var newSrc = $(this).attr('src').replace('_on.jpg','.jpg'); // 원래 이미지의 속성 변경
    //         $('.sh_de1 img').attr('src', newSrc); // sh_de1 클래스에 속한 이미지 파일의 src 속성 변경
    //     });
    // });

    // $(document).ready(function () {
    //     $('.over').hover(function () {
    //         // 호버된 이미지의 src 속성을 변경하여 sh_de1 클래스에 속한 이미지 파일의 src 속성을 변경합니다.
    //         $('.sh2 img').attr('src', $(this).attr('src').replace('.avif', '_on.avif'));
    //     }, function () {
    //         // 원래 이미지의 src 속성을 변경하여 sh_de1 클래스에 속한 이미지 파일의 src 속성을 변경합니다.
    //         $('.sh2 img').attr('src', $(this).attr('src').replace('_on.avif', '.avif'));
    //     });
    // });