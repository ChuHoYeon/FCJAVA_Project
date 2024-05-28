$(document).ready(
		function() {
			$('.over').hover(
					function() {
						// 호버된 이미지의 src 속성을 변경하여 sh_de1 클래스에 속한 이미지 파일의 src 속성을 변경합니다.
						$('.sh_de1 img').attr(
								'src',
								$(this).attr('src').replace('.jpg',
										'_on.jpg'));
					},
					function() {
						// 원래 이미지의 src 속성을 변경하여 sh_de1 클래스에 속한 이미지 파일의 src 속성을 변경합니다.
						$('.sh_de1 img').attr(
								'src',
								$(this).attr('src').replace('_on.jpg',
										'.jpg'));
		});
});
new Swiper('.swiper', {
    autoplay: {
      delay: 12000
    },
    loop: true,
    slidesPerView: 2.5,
    spaceBetween: 10,
    centeredSlides: true,
    pagination: {
      el: '.swiper-pagination',
      clickable: true
    },
    navigation: {
      prevEl: '.swiper-button-prev',
      nextEl: '.swiper-button-next'
    }
});