# 스프링 MVC - 구조이해
### 1. 스프링 MVC 전체 구조
+ DispacherServlet의 상속관계 - FrameworkServlet -> HttpServletBean -> HttpServlet
+ DispacherServlet은 스프링부트에서 서블릿으로 자동등록되고 모든 경로에 대해 매핑한다.
+ FrameworkServlet에서 service()가 실행되면 DispacherServlet에 있는 doDispatch()가 실행된다.
![스프링mvc구조](https://github.com/jonghunbaek/spring-mvc1-servlet/assets/107451991/22985373-e676-439c-95f5-b77969c99899)

### 2. 핸들러 매핑과 핸들러 어댑터
##### 2.1 핸들러 매핑 
+ 스프링빈의 이름으로 핸들러를 찾을 수 있는 핸들러 매핑이 필요
+ 우선순위 - RequestMappingHandlerMapping(@RequestMapping에서 사용) - BeanNameUrlHandlerMapping(스프링 빈의 이름으로 핸들러 탐색 - @Component)

##### 2.2 핸들러 어댑터
+ 핸들러 어댑터를 찾고 실행
+ 우선수위 - RequestMappingHandlerAdapter - HttpRequestHandlerAdapter - SimpleControllerHandlerAdapter(Controller인터페이스-과거에 사용)

### 3. 뷰 리졸버
+ 우선순위 - BeanNameViewResolver(빈이름으로 뷰를 찾아 반환) - InternalResourceViewResolver(jsp를 처리할 수 있는 뷰를 반환)
+ 다른 뷰와 달리 jsp는 forward()를 통해 이동해야 렌더링이 된다. 

### 4. 스프링 mvc
+ @RequestMapping - 요청 정보를 매핑
+ @Controller - 스프링MVC에서 애노테이션 기반 컨트롤러 인식, 컴포넌트 스캔 대상
+ RequestMappingHandlerMapping은 @RequestMapping, @Controller 둘중 하나가 있는 클래스를 빈에 등록