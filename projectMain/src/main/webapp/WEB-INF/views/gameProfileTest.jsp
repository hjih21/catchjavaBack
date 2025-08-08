<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>프로필 등록</title>
</head>
<body>

  <h2>게임 프로필 등록</h2>

  <form action="savePosition" method="post">
    <!-- 주 포지션 -->
    <label>주 포지션:
      <select name="user_position1" required>
        <option value="">선택</option>
        <option value="1">탑</option>
        <option value="2">정글</option>
        <option value="3">미드</option>
        <option value="4">원딜</option>
        <option value="5">서포터</option>
      </select>
    </label>
    <br>

    <!-- 부 포지션 -->
    <label>부 포지션:
      <select name="user_position2">
        <option value="">없음</option>
        <option value="1">탑</option>
        <option value="2">정글</option>
        <option value="3">미드</option>
        <option value="4">원딜</option>
        <option value="5">서포터</option>
      </select>
    </label>
    <br>

    <!-- 게임 닉네임 -->
    <label>게임 닉네임:
      <input type="text" name="user_game_nick" required>
    </label>
    <br>

    <!-- 특이사항 -->
    <label>특이사항:
      <input type="text" name="user_special_note">
    </label>
    <br>

    <!-- 가능 요일 -->
    <label>가능 요일:<br>
      <select name="available_days" multiple required>
        <option value="월">월</option>
        <option value="화">화</option>
        <option value="수">수</option>
        <option value="목">목</option>
        <option value="금">금</option>
        <option value="토">토</option>
        <option value="일">일</option>
      </select>
    </label>
    <br>

    <!-- 가능 시간 -->
    <label>시작 시간:
      <input type="time" name="available_start" required>
    </label>
    <br>
    <label>종료 시간:
      <input type="time" name="available_end" required>
    </label>
    <br><br>

    <button type="submit">등록하기</button>
  </form>

</body>
</html>
