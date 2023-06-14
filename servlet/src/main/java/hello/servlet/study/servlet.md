# 1. 서블릿
### 스프링 부트에서 서블릿 등록 및 사용방법
##### 스프링 부트에서 지원하는 서블릿 등록 어노테이션
@ServletComponentScan   

@WebServlet(name = "", urlPatterns = "") : @ServletComponetScan의 대상이 되기 위한 어노테이션이며, 해당 어노테이션을 사용하는 클래스는 HttpServlet을 상속 받야 한다. ->요청마다 service()를 호출하기 위해

##### HTTP 메시지 바디에 내용 저장
response.getWriter().write("hello " + username);

##### http 요청 메시지 로그 확인 방법 
logging.level.org.apache.coyote.http11=debug

+ 매 요청마다 실행하면 성능저하 발생 가능성이 높아짐

### 서블린 컨테이너 동작 방식
+ 서블릿은 요청-응답 프로그래밍 모델의 서버를 구현하기 위한 인터페이스이다.
+ @ServletComponentScan을 통해 서블릿 컨테이너는 서블릿 객체를 생성한다.
+ 클라이언트 측 요청이 들어오면 request,response 객체를 만들고 요청을 처리하기에 적합한 서블릿 객체를 찾는다.
+ 선택된 서블릿은 service()에 매개변수로 request,response를 전달받으며 실행된다.
+ 이때 service()는 별도의 스레드로 실행되며, 이는 클라이언트의 여러 요청을 동시에 처리할 수 있게 만든다. 즉, 서블릿 객체는 하나이고 요청에 따라 여러개의 스레드로 실행된다.
+ response에 여러가지 설정을 하고 요청에 대한 응답을 보내준다.
+ 요청이 처리되면 request,response 객체는 소멸한다. 즉, 요청마다 requset,response 객체가 생성,소멸하지만 서블릿 객체는 아니다.

### HttpServletRequest 개요
+ HTTP요청 메시지를 편리하게 사용할 수 있도록 개발자 대신에 요청 메시지를 파싱하고 그 결과를 HttpServletRequest객체에 담아서 제공
+ 임시 저장소 기능(setAttribute(), getAttribute()), 세션관리 기능(getSession())
+ HttpServletRequest는 응답 메시지를 편리하게 사용하도록 도와주는 객체다. 즉, http메시지 자체와, 스펙, 특성등에 대한 이해가 선행되어야 한다.-> 굵은 글씨체로
+ http 요청 메시지 이미지 예시 첨부


### HttpServletRequest method
+ getHeaderNames() -> 헤더 정보 가져오기
+ getLocales() -> 운선순위가 높은 순으로 모든 Accept-Language를 가져옴
+ getLocale() -> 가장 운선순위가 높은 Accept-Language를 가져옴
+ getContentType(), getContentLength(), getCharacterEncoding() 등
