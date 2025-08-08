<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>회원가입</title>
  <!-- jQuery: integrity 속성 제거해서 차단되지 않게 합니다 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
  <h1>이메일 중복 확인</h1>
  <input type="text" id="email" placeholder="이메일 입력" />
  <button type="button" id="dupBtn">중복확인</button>

  <script>
    $('#dupBtn').on('click', function(){
      const email = $('#email').val().trim();
      console.log('[DEBUG] 보낼 이메일 →', email);

      $.ajax({
        url:  '/web/checkEmail',   // 프로젝 context-path 가 /web 이니까
        method: 'GET',
        data: { email: email },    // 파라미터 이름(email)이 @RequestParam 과 일치해야 합니다
        success: function(res) {
          console.log('[AJAX 응답]', res);
          if(res === 'true') {
            console.log('✅ 사용 가능한 이메일입니다.');
          } else {
            console.log('❌ 이미 사용 중인 이메일입니다.');
          }
        },
        error: function(err) {
          console.error('AJAX 요청 실패:', err);
        }
      });
    });
  </script>
</body>
</html>
