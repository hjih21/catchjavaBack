<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.ChatWrapper {
   width: 100%;
   height: 100%;
}

#Chatting {
   width: 60%;
   height: 400px;
   border : 1px solid gray;
}

#Chatting-send{
   width: 60%;
}
.content {
   width: 100%;
   height: 5%;
}
.my{
   text-align : right;
}
.others{
   text-align : left;
}
</style>

</head>
<body>

   <div class="container">
      <h2>WebSocket Chatting</h2>
      <div class="panel panel-default">
         <div class="panel-heading">채팅구현하기</div>
         <div class="panel-body" align="center">
         
            <div class="ChatWrapper">
               <div id="Chatting">
               </div>
               
               <br>
               
               <div id = "Chatting-send">
                  <div class="form-group">
                     <label class="control-label col-sm-2" for="nickname">닉네임:</label>
                     <div class="col-sm-8">
                        <input type="email" class="form-control" id="nickname"
                           placeholder="닉네임입력" name="nickname">
                     </div>
                     <button id="eCheck" class="btn btn-success col-sm-2">닉네임확정</button>
                  </div>
                  <br>
                  <div class="form-group">
                     <label class="control-label col-sm-2" for="content">메시지:</label>
                     <div class="col-sm-8">
                        <textarea placeholder="메시지입력" rows="5" class="form-control" id="content" name="content"></textarea>
                     </div>
                  </div>
                  <div class="form-group">
                     <button class="btn btn-info col-sm-2" id="sendMsg" disabled>전송</button>                  
                  </div>
               </div>

            </div>

         </div>
         <div class="panel-footer">언어지능 과정 - 선영표 담임<div>
      </div>
   </div>
   </div>
   </div>
   
   
   
   
   
   
   <script type="text/javascript">
   
   let eCheck = document.getElementById("eCheck")
   let nickname = document.getElementById("nickname");
   let sendMsg = document.getElementById("sendMsg");
   let content = document.getElementById("content");
   let area = document.getElementById("Chatting");
   let websocket;
   // 1. id값이 eCheck인 태그를 클릭했을 때
   eCheck.addEventListener("click", ()=>{
   		// 2. id값이 nickname인 태그 안쪽에 글자를 가져와서 콘솔창에 출력
	    console.log(nickname.value);
   		// 3. id값이 sendMsg인 버튼 태그를 활성화 시켜주세요!
		sendMsg.removeAttribute("disabled")
		// 4. 웹 소켓 열어주기
		// (1) 웹소켓 접속 url
		// let wsUrl = "ws://localhost:8083/mywebsocket";
		// -> location.host : 동적으로 내 ip주소랑 포트번호를 가져오는 방법
		let wsUrl = "ws://"+ location.host +"/mywebsocket";
   		// (2) 웹소캣 객체 생성하기 스프링 내부적으로 있는 객체(WebSocket)
   		websocket = new WebSocket(wsUrl);
		// 5. 웹소켓에 특정 이벤트가 발생했을 때 동작할 함수 지정
		// *필수 : 메세지가 동작했을 때 실행할 함수
		// *선택 : 열렸을때, 닫혔을때
		websocket.onopen = ()=>{
			console.log("웹 소켓 연결 성공~");
		}
   		websocket.onclose = ()=>{
   			console.log("웹 소켓 닫힘..");
   		}
   		websocket.onmessage = (msg)=>{
   			console.log("메세지 수신~", msg);
   			let div = document.createElement("div");
   	   		div.innerText = msg.data;
   	   		div.classList.add("others");
   	   		area.append(div);
   		}
   		
   		
   	})
   
   	// 1. 전송버튼을 클릭하면 동작할 함수 추가
   	sendMsg.addEventListener("click", ()=>{
   		// 2. textarea 영역 안쪽에 있는 글자를 가져와서
   		 let sendData = content.value;
   		// 3. 소켓을 사용해서 데이터 전송
   		 websocket.send(sendData);
   		// 4. 화면에 전송한 메세지를 오른쪽에 붙여주면서 출력하기
   		let div = document.createElement("div");
   		div.innerText = sendData;
   		div.classList.add("my");
   		area.append(div);
   		
   	})
   
   </script>

</body>
</html>