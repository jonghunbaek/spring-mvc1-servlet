# 스프링MVC - 기본기능
### 1. 요청 매핑, 요청 파라미터
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
+ @RequestParam("요청 파라미터") - 요청 파라미터를 간편하게 사용 가능, request.getParameter()와 같은 역할
+ 변수명과 요청 파라미터 명이 같으면 요청파라미터 생략가능 - @RequestParam 요것도 생략가능(단, 원시 타입과 래퍼 클래스, String만) 
+ required의 boolean 속성을 통해 파라미터의 값의 필수 상태를 조절할 수 있다.
+ defaultValue 속성을 통해 파라미터 값이 없을 경우 기본값을 지정해준다.(null, "" 둘다 처리가능)
+ Map, MultiValueMap을 통해서 파라미터를 받을 수 있다.
+ @ModelAttribute - 객체를 통해 파라미터를 받음, 단 필드에 있는 변수명과 파라미터 명이 일치해야한다.
+ 웃긴건 얘도 생략 가능함 -> 원시타입, 래퍼, String등의 기본 타입은 @RequestParam과 나머지는 @ModelAttriute와 연관되고 각자 생략가능

### 2. 요청 메시지(Http Body Message)
##### 2.1 단순 텍스트
+ 가장 기본적인 방식은 request.InputStream()으로 받을 수 있다. 좀 더 단순한 방식은 InputStream으로 직접 받기
+ HttpEntity를 통해 HttpMessageConverter를 실행하여 바이트 코드를 문자열로 받는다.
+ httpEntity.getBody()로 바디 메세지를 가져오고, HttpEntity<>("메시지 내용")으로 응답을 보낸다.
+ HttpEntity는 요청파라미터를 조회하는 기능과 전혀 관계가 없다.
+ ResponseEntity<>()는 http상태 코드를 넣어 반환할 수 있다.
+ 위에 기술한 모든 것들은 @RequestBody를 통해 해결할 수 있다.

##### 2.2 JSON
+ HttpEntity로 받아도 된다. 하지만 아래가 더 편
+ @RequestBody로 받으면 된다. 굳이 json으로 parsing해주는 과정도 필요 없음
+ @RequestBody는 생략 불가능 - 생략하면 @RequestParam 또는 @ModelAttriute을 생략한 것으로 인식. 즉, 요청 파라미터로 인식

### 3. Http 응답
##### 3.1 정적리소스, 뷰 템플릿
+ 정적리소스는 static패키지 하위에 저장해서 url을 통해 접근 가능
+ spring boot는 templates 하위 경로에 뷰 템플릿 파일들을 저장해야 접근할 수 있다.
+ 뷰템플릿은 ModelAndView를 통해 접근할 수 있다. 또 문자열로 경로를 반환해 접근할 수도 있다.

##### 3.2 http api, 바디에 메세지 넣기
+ response.getWriter().write("ok")
+ ResponseEntity<>("ok", HttpStatus.OK)
+ @ResponseBody
+ @ResponseStatus를 통해 http응답 상태 코드를 보낼 수 있다. 단, 어노테이션이라 동적으로 설정이 불가하다.
+ 동적으로 응답하려면 ResponseEntity로
+ @RestController는 각 메소드에 @ResponseBody를 붙이는 것과 같은 기능

### 4. HttpMessageConverter
+ http message body에 직접 읽거나 쓸 때는 HttpMessageConverter를 사용하는게 편리
+ @ResponseBody, @RequestBody, HttpEntity(Request,Response)를 사용할 때는 뷰리졸버대신 컨버터가 동작
+ 기본 문자처리(StringHttpMessageConverter), 기본 객체 처리(MappingJackson2HttpMessageConverter-json) 및 바이트 처리등 여러 컨버터가 있음
+ 응답의 경우 클라이언트의 HTTP Accept header와 서버의 반환타입을 조합해 적절한 컨버터가 선택된다.
+ 우선순위 : ByteArrayHttpMessageConverter - StringHttpMessageConverter - MappingJackson2HttpMessageConverter

### 요청 매핑 핸들러 어댑터 구조
+ 

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
+ 프로퍼티란? - getter, setter에 주체가 되는 개체
+ stream은 무조건 bytecode이기 때문에 인코딩을 지정해줘야 한다.
+ objectMapper.readValue() 활용 방법
+ 요청, 응답 모두 메시지 바디에 컨텐트 타입을 지정해줘야 한다.



  
