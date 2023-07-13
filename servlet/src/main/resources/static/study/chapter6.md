# 스프링MVC - 기본기능
### 1. 요청 매핑
+ @PathVariable - 경로 변수(변수명 - 경로명 같으면 ""안 생략 가능), 다중 매핑으로 여러개 사용 가능
+ 요청 매핑의 여러가지 속성 - params, headers, consumes(요청 컨텐트 타입), produces(응답 컨텐트 타입) 
```java
  public String headers(HttpServletRequest request, 
			HttpServletResponse response, 
		    	HttpMethod httpMethod,
			Locale locale,
			@RequestHeader MultiValueMap<String, String> headerMap,
			@RequestHeader ("host") String host,
			@CookieValue(value ="myCookie", required = false) String cookie
			)
```
+ 위와 같이 헤더의 정보를 받을 수 있다.			


### Tip
+ WAR vs JAR - jsp를 쓰지 않기때문에 jar, war는 별도의 톰캣 설치로 이용
+ 로그라이브러리들을 인터페이스로 추상화한게 SLF4J - Logback은 구현체, @Slf4j로 간편하게 사용 가능
+ logging.level.hello.springmvc=trace
+ log level : trace - debug(개발) - info(운영) - warn - error
+ log.trace(" trace my log="+ name);
+ log.trace("trace log={}", name); -> 자원의 낭비를 방지하기 위해 아래처럼 쓰는 것을 권장
+ 로그 사용의 장점 - 쓰레드 정보, 클래스 이름 같은 부가정보를 가시적으로 표현하고, 출력 모양 조절 가능
+ 개발, 운영 환경등에 따라 로그 레벨을 다르게 설정해 반드시 필요한 로그만 출력되게 설정 가능
+ 또 콘솔뿐 아니라 파일, 네트워크 등 원하는 위치에 출력가능, 성능 자체도 일반 출력보다 좋음
+ MultiValueMap -> 하나의 키에 여러 값(쿼리스트링 받을 때 종종)



+ 151분 - 요청매핑-api예시
