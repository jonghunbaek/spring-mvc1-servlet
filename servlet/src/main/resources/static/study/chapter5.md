# 스프링 MVC - 구조이해
### 1. 스프링 MVC 전체 구조
+ DispacherServlet의 상속관계 - FrameworkServlet -> HttpServletBean -> HttpServlet
+ DispacherServlet은 스프링부트에서 서블릿으로 자동등록되고 모든 경로에 대해 매핑한다.
+ FrameworkServlet에서 service()가 실행되면 DispacherServlet에 있는 doDispatch()가 실행된다.
![스프링mvc구조](https://github.com/jonghunbaek/spring-mvc1-servlet/assets/107451991/22985373-e676-439c-95f5-b77969c99899)
<img src="C:/Users/qor60/Desktop/BLOG/Github/00 Spring MVC/스프링mvc구조" width="500" height="250">

### 2. 핸들러 매핑과 핸들러 어댑터
##### 2.1 핸들러 매핑 
+ 스프링빈의 이름으로 핸들러를 찾을 수 있는 핸들러 매핑이 필요
+ 우선순위 - RequestMappingHandlerMapping(@RequestMapping에서 사용) - BeanNameUrlHandlerMapping(스프링 빈의 이름으로 핸들러 탐색 - @Component)

##### 2.2 핸들러 어댑터
+ 핸들러 어댑터를 찾고 실행
+ 우선수위 - RequestMappingHandlerAdapter - HttpRequestHandlerAdapter - SimpleControllerHandlerAdapter(Controller인터페이스-과거에 사용)
