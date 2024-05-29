$(function () {
    $("#headerNav li").mouseenter(function () {
        $("#layer").stop().slideDown(200);
        $(this).addClass("mouseNav");
    });
    $("#headerNav li").mouseleave(function () {
        $(this).removeClass("mouseNav");
    });
    $("#layer").mouseleave(function () {
        $(this).stop().slideUp(200);
    })
    
});
 