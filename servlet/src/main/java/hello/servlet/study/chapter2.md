# 서블릿,JSP,MVC
### 1. 서블릿으로 회원관리 웹 애플리케이션 만들기
+ Java 코드안에 html을 넣기 때문에 동적인 html파일 생성이 불가능
+ 또 Java 코드안에 html을 넣기 때문에 비효율적이며 추후 유지보수 및 디버깅이 힘듬
+ 해결책으로 html에 java코드를 넣는 템플릿엔진(jsp, thymeleaf 등이 나옴)

### 2. JSP로 회원관리 웹 애플리케이션 만들기
+ JSP는 서버 내부에서 서블릿으로 변환
+ .jsp 확장자명까지 입력해줘야 실행
+ JSP는 자바 코드를 그대로 사용 가능(<% %>, <%= %> - 스크립틀릿을 사용해서)
+ view와 비즈니스 로직이 결합되어 있기 때문에 코드가 복잡해지고 유지보수가 힘듬

### 3. MVC 패턴
+ 서블릿, jsp는 너무 많은 역할을 한페이지 안에 담당하고, 변경의 라이프 사이클(ui와 비즈니스로직)이 다른 단점이 있다.
+ 단점을 해결하기 위해 뷰와 비즈니스로직을 분리시키는 MVC패턴이 나옴
+ Model, View, Controller로 이루어짐
+ getRequestDispatcher() - view<->controller를 연결, RequestDispatcher.forward() - 다른 서블릿이나 jsp로 이동할 수 있는 기능, 서버에서 재호출 발생
+ 리다이렉트와 forward의 차이 - 클라이언트의 인지 유무 차이(리다이렉트는 인지, 포워드는 미인지)
+ 한계점 - 중복되는 코드, 공통처리가 어렵다(컨트롤러들의 컨트롤이 필요함, 현재는 요청이 막 들어옴-스프링 mvc의 핵심)

# TIP
+ HashMap()은 동시성 이슈가 해결아 안되기 때문에 ConcurrentHashMap, AtomicLong을 실무에서 사용
+ Test case작성 중 assertThat().contains() - 해당 항목들이 존재하는지 확인
+ WEP-INF -> 해당 디렉토리 하위 파일은 was서버의 규칙으로 외부에서 직접적인 호출이 안되고, controller를 통해 내부에서 forward를 통해 호출 가능
