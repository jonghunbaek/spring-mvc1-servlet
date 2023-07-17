# 웹 페이지 만들기
### @ModelAttribute
+ 요청 파라미터의 값을 프로퍼티 접근법으로 입력
+ Model에 값을 자동 추가

### PRG(Post, Redirect, Get)
+ 웹 브라우저의 새로고침은 마지막에 서버에 전송한 데이터를 다시 전송하는 것
+ 해결 방법 -> post로 등록후 get으로 redirect
+ 즉, 상품 저장후 뷰템플릿으로 이동하는 것이 아니라 새로운 url을 호출하는 개념

### RedirectAttribute
+ addAttribute("itemId", savedItem.getId())
+ addAttribute("status", true);
+ url 인코딩, 나머지는 쿼리 파라미터로 처리해줌

