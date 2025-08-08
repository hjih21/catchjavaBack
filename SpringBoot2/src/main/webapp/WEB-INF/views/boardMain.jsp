<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="assetsBoard/css/main.css" />
		<link rel="stylesheet" href="assetsBoard/css/board.css" />
		
</head>
<body>		
			<div id="board">
				<table id = "list">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>시간</td>
						<td>조회수</td>
					</tr>
					<c:forEach items="${allBoard}" var="b" varStatus="i">
						<tr>
							<!-- i.count는 forEach문을 통해 세어지는 갯수 -->
							<td>${i.count}</td> 
							<td><a href="detail?idx=${b.idx}">${b.title}</a></td>
							<td>${b.writer}</td>
							<td>${b.b_date}</td>
							<td>${b.count}</td>
							<!-- b.count는 Msgboard가 가지고 있는 조회수의 컬럼 -->
						</tr>
					</c:forEach>
				</table>
				<a href="goWrite"><button id="writer">작성하러가기</button></a>
			</div>

			<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>