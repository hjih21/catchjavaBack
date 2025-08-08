<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="UTF-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header" class="alt">
						<a href="index.html" class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a>
						<nav>
							<!-- 로그인 전 => 로그인 메뉴 띄우기 -->
							<!-- empty : 비워져있는 상태 => null
								 not empty : 비워져 있지 않은 상태 => 무언가 내용이 있다!
								 eq : equals(~와 같다) => == 동일값
								 ne : not equals (~와 같지 않다) => != 부정
							 -->
							<c:if test="${ empty member }">
								<a href="#menu">로그인</a>
							</c:if>
							
							<!-- 로그인 후 => 개인정보 수정 / 로그아웃 메뉴 띄우기 -->
							<!-- admin 계정의 경우 회원정보관리 메뉴 연결! -->
								<c:if test="${member.email eq 'admin'}">
									<a href="showMember">회원정보관리</a>
								</c:if>
								<c:if test="${member.email ne 'admin'}">
									<a href="goUpdate">개인정보수정</a>									
								</c:if>								
							<c:if test="${ not empty member }">
								<a href="logout">로그아웃</a>
							</c:if>
							
							<!-- 로그인 후 Logout.jsp로 이동할 수 있는'로그아웃'링크와 '개인정보수정'링크를 출력하시오. -->
						</nav>
					</header>

				<!-- Menu -->
					<nav id="menu">	
						<ul class="links">
							<li><h5>로그인</h5></li>
								<!-- login이라는 요청으로 email, pw를 전달하는 form 구조 만들기 -->
								<form action="login" method="post">
									<li><input type="text" name="email" placeholder="Email을 입력하세요"></li>
									<li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
									<li><input type="submit" name="LogIn" value="LogIn" class="button fit"></li>
								</form>
						</ul>
						<ul class="actions vertical">
							<li><h5>회원가입</h5></li>
								<form action="join" method="post">
									<li><input type="text" name="email" id="inputEmail" placeholder="Email을 입력하세요"></li>
									<li><input type="button" value="Email 중복체크" onclick="checkEmail()"></li>
									<li><span id="resultEmail"></span></li>
									<li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
									<li><input type="text" name="tel" placeholder="전화번호를 입력하세요"></li>
									<li><input type="text" name="address" placeholder="집주소를 입력하세요"></li>
									<li><input type="submit" name="JoinUs" value="JoinUs" class="button fit"></li>
								</form>
						</ul>
					</nav>			
				<!-- Banner -->
					<section id="banner" class="major">
						<div class="inner">
							<header class="major">
										<!-- 로그인 전이라면 => 즉 session의 영역에 member가 없다면!
											empty : null과 같은 의미 -->
										<c:if test="${ empty member }">
											<h1>로그인 한 세션아이디를 출력해주세요</h1>
										</c:if>
										<!-- member가 null값이 아니라면 => 즉 session의 영역에 member라는 데이터가 있다면! -->
										<c:if test="${ not empty member }">
											<h1>${member.email}님 환영합니다.</h1>
										</c:if>
										
								<!-- 로그인 후 로그인 한 사용자의 세션아이디로 바꾸시오.
									 ex)smart님 환영합니다 -->
								<!-- 로그인 수행 전/후 에 따른 h1태그 출력을 생각해야 한다! -->
							</header>
							<div class="content">
								<p>아래는 지금까지 배운 웹 기술들입니다.<br></p>
								<ul class="actions">
									<li><a href="#one" class="button next scrolly">확인하기</a></li>
								</ul>
							</div>
						</div>
					</section>

				<!-- Main -->
					<div id="main">

						<!-- One -->
							<section id="one" class="tiles">
								<article>
									<span class="image">
										<img src="images/pic01.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="#" class="link">HTML</a></h3>
										<p>홈페이지를 만드는 기초 언어</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic02.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="#" class="link">CSS</a></h3>
										<p>HTML을 디자인해주는 언어</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic03.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="#" class="link">Servlet/JSP</a></h3>
										<p>Java를 기본으로 한 웹 프로그래밍 언어/스크립트 언어</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic04.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="#" class="link">JavaScript</a></h3>
										<p>HTML에 기본적인 로직을 정의할 수 있는 언어</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic05.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="#" class="link">MVC</a></h3>
										<p>웹 프로젝트 중 가장 많이 사용하는 디자인패턴</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="images/pic06.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="#" class="link">Web Project</a></h3>
										<p>여러분의 최종프로젝트에 웹 기술을 활용하세요!</p>
									</header>
								</article>
							</section>
					<!-- Two -->
							<section id="two">
								<div class="inner">
									<header class="major">
										<h2>나에게 온 메세지 확인하기</h2>
									</header>
									<p></p>
									<ul class="actions">
										<c:if test="${empty member}">
											<li>로그인을 하세요.</li>
										</c:if>
										<c:if test="${not empty member }">
											<table>
												<tr>
													<td>번호</td>
													<td>보낸 사람</td>
													<td>내용</td>
													<td>날짜</td>
													<td>삭제</td>
												</tr>
												<c:forEach items="${messages}" var="m" varStatus="i">
													<tr>
														<td>${i.count}</td>
														<td>${m.sendName}</td>
														<td>${m.message}</td>
														<td>${m.m_date}</td>
														<td><a>삭제</a></td>
													</tr>
												</c:forEach>
											</table>
											<li><a href="allMessage?email=${member.email }"class="button next scrolly">메세지확인하기</a></li>
											<li><a href="#" class="button next scrolly">전체삭제하기</a></li>											
										</c:if>
									</ul>
								</div>
							</section>

					</div>

				<!-- Contact -->
					<section id="contact">
						<div class="inner">
							<section>
								<!-- form 필수요소 채우기 ! -->
								<form action="send" method="post">
								<div class="field half first">
										<label for="name">Name</label>
										<!-- 로그인 여부에 따라 email 값 띄워주기 -->
										<c:if test="${empty member }">
											<input type="text" id="name" placeholder="보내는 사람 이름" />										
										</c:if>
										<c:if test="${not empty member}">										
											<input type="text" name="sendName" value="${member.email}" id="name" placeholder="보내는 사람 이름" />										
										</c:if>
									</div>
									<div class="field half">
										<label for="email">Email</label>
										<input type="text" name="receiveEmail" id="email" placeholder="보낼 사람 이메일"/>
									</div>

									<div class="field">
										<label for="message">Message</label>
										<textarea name="message" id="message" rows="6"></textarea>
									</div>
									
									<ul class="actions">
										<li><input type="submit" value="Send Message" class="special" /></li>
										<li><input type="reset" value="Clear" /></li>
									</ul>
								</form>
							</section>
							
							<section class="split">
								<section>
									<div class="contact-method">
										<span class="icon alt fa-envelope"></span>
										<h3>Email</h3>
										<c:if test="${empty member }"><a href="#">로그인 한 사람의 이메일을 출력</a></c:if>
										<c:if test="${not empty member }"><a href="#">${member.email }</a></c:if>
										<!-- 로그인 한 사용자의 이메일을 출력하시오 -->
									</div>
								</section>
								<section>
									<div class="contact-method">
										<span class="icon alt fa-phone"></span>
										<h3>Phone</h3>
											<c:if test="${empty member }"><span>로그인 한 사람의 전화번호를 출력</span></c:if>
											<c:if test="${not empty member }"><span>${member.tel }</span></c:if>
										<!-- 로그인 한 사용자의 전화번호를 출력하시오 -->
									</div>
								</section>
								<section>
									<div class="contact-method">
										<span class="icon alt fa-home"></span>
										<h3>Address</h3>
											<c:if test="${empty member }"><span>로그인 한 사람의 집주소를 출력</span></c:if>
											<c:if test="${not empty member }"><span>${member.address }</span></c:if>
										<!-- 로그인 한 사용자의 집주소를 출력하시오 -->
									</div>
								</section>
							</section>					
						</div>
					</section>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<ul class="icons">
								<li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
								<li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
								<li><a href="#" class="icon alt fa-linkedin"><span class="label">LinkedIn</span></a></li>
							</ul>
							<ul class="copyright">
								<li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
			
			<!-- 비동기 통신으로 회원가입의 이메일 여부를 체크할 수 있는 기능! -->
			<script type="text/javascript">
				function checkEmail(){
					
					// ajax : JS에서 비동기 통신을 위해 사용하느 기술!
					
					// 1. 입력된 이메일 가져오기!
					let email = $('#inputEmail').val();
					
					// 1. 요청 url
					// 2. 요청 type(get/post)
					// 3. 활용 data =>  JSON타입 / key:value
					// 4. 성공/실패에 대한 로직
					$.ajax({
						url : "checkEmail", // controller가 받을 수 있는 요청 값
						type : "get",
						data : {inputEmail : email},
						success : function(res){ 
							// 매개변수 res 의미 : controller의 작업 이후 중복체크 여부에 대한
							// 결과값이 담기는 변수
							// res => RestController에서 전달해주는 return 값! "true"/"false"
										
							if (res == "true"){
								$("#resultEmail").text("사용 가능한 이메일 입니다.").css("color", "green");
							}else{
								$("#resultEmail").text("이미 사용중인 이메일 입니다.").css("color","red");
							}
							
						},
						error : function(){
							alert("회원 체크 실패");
						}
						
						
					})
					
					
				}
			</script>
			
	</body>
</html>

