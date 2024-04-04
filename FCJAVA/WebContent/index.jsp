<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>FC JAVA</title>
    <link rel="stylesheet" href="css/header.css" type="text/css">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/shop_main.css" type="text/css">

    <!-- <link rel="stylesheet" href="css/main.css" type="text/css"> -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>


    <link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">


    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script defer src="js/main.js"></script>
    <script src="js/shop_over.js"></script>

    <!-- <script src="js/main2.js"></script> -->
    <link href="css/btn.css" rel="stylesheet" type="text/css">

    <script src="js/header.js"></script>

    <!--구글 아이콘-->
     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>


<body bgcolor="f0ffff">
	<!-- 헤더 -->
	<jsp:include page="headerPage.jsp" />

    <div class="mainb">
        <div class="swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="png/fifa1.jpg" width="100%" alt=""></div>
                <div class="swiper-slide"><img src="png/fifa2.jpg" width="100%" alt=""></div>
                <div class="swiper-slide"><img src="png/fifa3.jpg" width="100%" alt=""></div>
                <div class="swiper-slide"><img src="png/fifa4.jpg" width="100%" alt=""></div>
                <div class="swiper-slide"><img src="png/fifa5.jpg" width="100%" alt=""></div>

            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev">
            </div>
            <div class="swiper-button-next">
            </div>
        </div>
    </div>

    <section>
        <div class="title_h">구장 예약 </div>
        <div class="gr1 bo1">
            <ul class="sum1">
                <li class="infor">
                    <div class="width300">
                        <img src="img/sdf.jpg" width="300">
                    </div>
                    <div class="mbox1">
                        <p><img src="img/football-field.png"> 서울 디지털 운동장 축구장 </p>
                        <p><img src="img/clock.png"> 운영시간:06:00~24:00</p>
                        <p><img src="img/maximize.png"> :104 x 68</p>
                        <p> <img src="img/map.png"> :서울시 금천구 가산동 459-18</p>
                    </div>
                    <div class="box-warp12">
                        <div class="ord">📅 예약 가능 날짜 : 오늘 ~ 03.21 (목)</div>
                        <div class="box-wrap">
                            <div class="tm_box">
                                <div class="box_si">06:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">07:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">08:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">09:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">10:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">11:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">12:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">13:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">14:00</div>
                            </div>
                        </div>
                        <div class="box-wrap1">
                            <div class="tm_box">
                                <div class="box_si">15:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">16:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">17:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">18:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">19:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">20:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">21:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">22:00</div>
                            </div>
                            <div class="tm_box">
                                <div class="box_si">23:00</div>
                            </div>
                        </div>
                        <div class="bt">
                            <input type="button" a href="#" class="btn-two red" value="예약하기">
                        </div>
                    </div>

                </li>
            </ul>
        </div>



        <ul class="group1">
            <li class="title_h">이달의 선수</div>
            <li class="title_h">마이팀</div>
        </ul>
        <ul class="group2">
            <li class="pl1 bo1">
                <div class="playrank_back">
                    <div class="playpic left1">
                        <img src="png/ki.png" width="283px" height="283px">
                    </div>
                    <div class="playtext left1">
                        <p> 선수명 : 기성룡</p>
                        <p> 포지션 : MF </p>
                        <p> 소속 팀 : FC서울 </p>
                        <p> 키 : 180 cm </p>
                        <p>나이 : 34 세 </p>
                    </div>
                </div>
            </li>
            <li class="pl2"> <a href="teamlist.html"><img src="png/game2.jpg" width="550px" height="285px" alt=""></a>
            </li>
        </ul>
        <div class="title_h"> 쇼핑몰 </div>
        <ul class="group3">
            <li class="sh2"><img class="over" src="png/sin_bal/sin_1_1.avif" width="300px" height="300px"> </li>
            <li class="sh2"><img class="over" src="png/sin_bal/sin_2_1.avif" width="300px" height="300px"> </li>
            <li class="sh2"><img class="over" src="png/sin_bal/sin_3_1.avif" width="300px" height="300px"> </li>
            <li class="sh2"><img class="over" src="png/sin_bal/sin_4_1.avif" width="300px" height="300px"> </li>
        </ul>
        <ul class="group1">
            <li class="title_h">FIFA Rank
                <a href="#" class="ri1">more</a>
            </li>
            <li class="title_h">축구뉴스 <a href="#" class="ri1">more</a></li>
        </ul>

        <ul class="group2">
            <li class="pl1">

                <table>
                    <tr>
                        <td> 랭킹 </td>
                        <td> 순위변화 </td>
                        <td> 국가명 </td>
                    </tr>
                    <tr>
                        <td> 1 </td>
                        <td> = </td>
                        <td> 아르헨티나 </td>
                    </tr>
                    <tr>
                        <td> 2 </td>
                        <td> ▲5 </td>
                        <td> 프랑스 </td>
                    </tr>
                    <tr>
                        <td> 3 </td>
                        <td> ▼1 </td>
                        <td> 벨기에 </td>
                    </tr>
                    <tr>
                        <td> 4 </td>
                        <td> ▲3 </td>
                        <td> 브라질 </td>
                    </tr>
                    <tr>
                        <td> 5 </td>
                        <td> ▲3 </td>
                        <td> 네덜란드 </td>
                    </tr>
                    <tr>
                        <td> 6 </td>
                        <td> ▲1 </td>
                        <td> 포루투갈</td>
                    </tr>
                    <tr>
                        <td> 7 </td>
                        <td> ▲1 </td>
                        <td> 스페인</td>
                    </tr>
                    <tr>
                        <td> 8 </td>
                        <td> ▲1 </td>
                        <td> 이탈리아 </td>
                    </tr>
                    <tr>
                        <td> 9 </td>
                        <td> ▲1 </td>
                        <td> 크로아티아 </td>
                    </tr>
                </table>
            </li>
            <li class="pl2">
                <table>
                    <tr>
                        <td>글번호</td>
                        <td>제목</td>
                        <td>날짜</td>
                    </tr>
                    <tr>
                        <td>997</td>
                        <td class="c_title">아시안컵 4강 탈락 </td>
                        <td> 24.02.14</td>
                    </tr>
                    <tr>
                        <td>996</td>
                        <td class="c_title">극적인 역전극에 온 국민 환호 </td>
                        <td> 24.02.14</td>
                    </tr>
                    <tr>
                        <td>995</td>
                        <td class="c_title">조별리그 2위 16강 토너먼트진출 </td>
                        <td> 24.02.14</td>
                    </tr>
                    <tr>
                        <td>994</td>
                        <td class="c_title">아시안컵 승리를 위한 선수단</td>
                        <td> 24.02.14</td>
                    </tr>
                    <tr>
                        <td>993</td>
                        <td class="c_title">경고 5장 2차경기 부담감 가중 </td>
                        <td> 24.02.14</td>
                    </tr>
                    <tr>
                        <td>992</td>
                        <td class="c_title">카타르 도하 경기장 아시안컵으로 활기 넘처</td>
                        <td> 24.02.14</td>
                    </tr>
                    <tr>
                        <td>991</td>
                        <td class="c_title">손흥민 주장으로써 최선을 다하겠다</td>
                        <td> 24.02.14</td>
                    </tr>
                    <tr>
                        <td>990</td>
                        <td class="c_title">부상 투혼 김진규 결국 하차</td>
                        <td> 24.02.14</td>
                    </tr>
                    <tr>
                        <td>989</td>
                        <td class="c_title">토트넘 2:1 승리</td>
                        <td> 24.02.14</td>
                    </tr>


                </table>

            </li>
        </ul>
    </section>

    <!-- 푸터 -->
	<jsp:include page="footerPage.jsp" />
</body>

</html>