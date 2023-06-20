# 서블릿
### 1. 스프링 부트에서 서블릿 등록 및 사용방법
##### 스프링 부트에서 지원하는 서블릿 등록 어노테이션
@ServletComponentScan   

@WebServlet(name = "", urlPatterns = "") : @ServletComponetScan의 대상이 되기 위한 어노테이션이며, 해당 어노테이션을 사용하는 클래스는 HttpServlet을 상속 받야 한다. ->요청마다 service()를 호출하기 위해

#### HTTP 메시지 바디에 내용 저장
response.getWriter().write("hello " + username);

#### http 요청 메시지 로그 확인 방법 
logging.level.org.apache.coyote.http11=debug

+ 매 요청마다 실행하면 성능저하 발생 가능성이 높아짐

### 2. 서블린 컨테이너 동작 방식
+ 서블릿은 요청-응답 프로그래밍 모델의 서버를 구현하기 위한 인터페이스이다.
+ @ServletComponentScan을 통해 서블릿 컨테이너는 서블릿 객체를 생성한다.
+ 클라이언트 측 요청이 들어오면 request,response 객체를 만들고 요청을 처리하기에 적합한 서블릿 객체를 찾는다.
+ 선택된 서블릿은 service()에 매개변수로 request,response를 전달받으며 실행된다.
+ 이때 service()는 별도의 스레드로 실행되며, 이는 클라이언트의 여러 요청을 동시에 처리할 수 있게 만든다. 즉, 서블릿 객체는 하나이고 요청에 따라 여러개의 스레드로 실행된다.
+ response에 여러가지 설정을 하고 요청에 대한 응답을 보내준다.
+ 요청이 처리되면 request,response 객체는 소멸한다. 즉, 요청마다 requset,response 객체가 생성,소멸하지만 서블릿 객체는 아니다.

### 3. HttpServletRequest 개요
+ HTTP요청 메시지를 편리하게 사용할 수 있도록 개발자 대신에 요청 메시지를 파싱하고 그 결과를 HttpServletRequest객체에 담아서 제공
+ 임시 저장소 기능(setAttribute(), getAttribute()), 세션관리 기능(getSession())
+ **HttpServletRequest는 응답 메시지를 편리하게 사용하도록 도와주는 객체다. 즉, http메시지 자체와, 스펙, 특성등에 대한 이해가 선행되어야 한다.**
+ http 요청 메시지 이미지 예시 첨부


### 4. HttpServletRequest method
+ getHeaderNames() -> 헤더 정보 가져오기
+ getLocales() -> 운선순위가 높은 순으로 모든 Accept-Language를 가져옴
+ getLocale() -> 가장 운선순위가 높은 Accept-Language를 가져옴
+ getContentType(), getContentLength(), getCharacterEncoding() 등

### 5. HTTP 요청 데이터
#### 5.1 GET(쿼리 파라미터) 방식 
+ 메시지 바디없이 url의 쿼리스트링으로 데이터를 전달(검색, 필터, 페이징 등)
+ getParameterValues() - 파라미터 이름이 하나고 값이 여러개인 경우에 사용
+ getParameterNames() - 파라미터 이름 전체 조회

#### 5.2 POST(html form) 방식 
+ 메시지 바디에 데이터를 포함해서 전달, 데이터 형식의 정의 때문에 content-type을 꼭 지정해줘야 한다.
+ application/x-www-form-urlencoded -> 쿼리스트링 형식과 같음. 즉, GET방식과 같은 방법으로 데이터를 조회할 수 있다.(getParameter())
+ 클라이언트측에선 두 방식에 차이가 있지만, 서버 입장에선 동일

#### 5.3 HTTP message body 
+ 메시지 바디에 데이터를 직접 담아서 요청, HTTP API에서 주로 사용(JSON, XML, TEXT), POST,PUT,PATCH
+ getInputStream() - 메시지 내용을 바이트 코드로 얻을 수 있다.
+ json결과를 파싱해 자바 객체로 변환하기 위해선 Jackson, Gson과 같은 라이브러리를 활용해야한다.(Jackson-ObjectMapper(스프링부트 기본 내장))

### 6. HTTP 응답 데이터
#### 6.1 HttpServletResponse (HTTP 응답코드 설정, 헤더 및 바디 생성)
+ 응답데이터는 [start-line] - [response-headers] - [message-body]로 구성
+ setStatus() - 상태 설정
+ HttpServletResponse.SC_OK - 200 상태를 직접 내려주기 보단 변수를 사용하는것이 바람직
+ 캐시 무효화 방법
+ resp.setHeader("Cach-Control", "no-cache, no-store, must-revalidate");
+ resp.setHeader("Pragma", "no-cache");
+ header관련 간편한 메서드 - setContentType(), setCharacterEncoding()등
+ Cookie 객체를 활용한 쿠키 설정 - new Cookie("myCookie", "good"),setMaxAge(), response.addCookie() - 마지막에 addCookie를 해줘야 응답헤더에 쿠키정보가 설정된다.
+ redircet - sendRedirect()

