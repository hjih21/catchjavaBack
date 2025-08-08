<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>검색할 이름 입력 : </td>
			<td>
				<input type="text" id="name">
			</td>
			<td>
				<input type="button" id="btn" value="검색">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="result_area"></div>
			</td>
		</tr>
	</table>
	
<script type="text/javascript">
	// 0. 필요한 태그들 가져오기
	// 버튼, 입력창
	var btn = document.getElementById("btn") // document에서 get 꺼내다 element요소를 by id
	// 1. 검색버튼을 클릭했을 때 작동할 함수 추가
	btn.addEventListener("click",()=>{
		var name = document.getElementById("name")
		// 2. input태그 안쪽에 있는 글자를 가져오기
		let data = name.value;
		// 3. 해당 글자 콘솔에 출력하기
		console.log(data);
		// 4. 비동기 통신으로 data를 보내주기
		// --> url : http://127.0.0.1:8000/crawling
		fetch(`http://127.0.0.1:8000/crawling?data=\${data}`)
		.then(res => res.json())
		.then(response =>{
			console.log(response)
			// result_area 영역 내부에 이미지 태그를 생성해서, 받아온 결과 이미지를 띄우주세요!
			let result_area = document.getElementById("result_area");
			let img = document.createElement("img");
			img.setAttribute("src", response.img_src);
			result_area.append(img);
		})
	})


</script>
</body>
</html>