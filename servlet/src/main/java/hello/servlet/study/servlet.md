## 1. 서블릿
### 스프링 부트에서 서블릿 등록 및 사용방법
// 스프링 부트에서 지원하는 서블릿 등록 어노테이션
@ServletComponentScan

//@ServletComponetScan의 대상이 되기 위한 어노테이션이며, 해당 어노테이션을 사용하는 클래스는 HttpServlet을 상속 받야 한다. -> 요청마다 service()를 호출하기 위해
@WebServlet(name = "helloServlet", urlPatterns = "/hello")

// HTTP 메시지 바디에 내용 저장
response.getWriter().write("hello " + username);

// http 요청 메시지 로그 확인 방법 -> 매 요청마다 실행하면 성능저하 발생 가능성이 높아짐
logging.level.org.apache.coyote.http11=debug

### 서블린 컨테이너 동작 방식
+ 서블릿은 요청-응답 프로그래밍 모델의 서버를 구현하기 위한 인터페이스이다.
+ @ServletComponentScan을 통해 서블릿 컨테이너는 서블릿 객체를 생성한다.
+ 클라이언트 측 요청이 들어오면 request,response 객체를 만들고 요청을 처리하기에 적합한 서블릿 객체를 찾는다.
+ 선택된 서블릿은 service()에 매개변수로 request,response를 전달받으며 실행된다.
+ 이때 service()는 별도의 스레드로 실행되며, 이는 클라이언트의 여러 요청을 동시에 처리할 수 있게 만든다. 즉, 서블릿 객체는 하나이고 요청에 따라 여러개의 스레드로 실행된다.
+ response에 여러가지 설정을 하고 요청에 대한 응답을 보내준다.
+ 요청이 처리되면 request,response 객체는 소멸한다. 즉, 요청마다 requset,response 객체가 생성,소멸하지만 서블릿 객체는 아니다.