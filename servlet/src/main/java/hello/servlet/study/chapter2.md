# 서블릿,JSP,MVC
### 1. 서블릿으로 회원관리 웹 애플리케이션 만들기
+ Java 코드안에 html을 넣기 때문에 동적인 html파일 생성이 불가능
+ 또 Java 코드안에 html을 넣기 때문에 비효율적이며 추후 유지보수 및 디버깅이 힘듬
+ 해결책으로 html에 java코드를 넣는 템플릿엔진(jsp, thymeleaf 등이 나옴)





# TIP
+ HashMap()은 동시성 이슈가 해결아 안되기 때문에 ConcurrentHashMap, AtomicLong을 실무에서 사용
+ Test case작성 중 assertThat().contains() - 해당 항목들이 존재하는지 확인