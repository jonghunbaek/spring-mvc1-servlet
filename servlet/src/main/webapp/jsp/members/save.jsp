<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="hello.servlet.domain.member.Member"%>
<%@page import="hello.servlet.domain.member.MemberRepository"%>
<%
	MemberRepository memberRepository = MemberRepository.getInstance();
	
	System.out.println("MemberSaveServlet.service");
	String username = request.getParameter("username");
	int age = Integer.parseInt(request.getParameter("age"));
	
	Member member = new Member(username, age);
	memberRepository.save(member);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
성공
<ul>
	<li>id=<%=member.getId() %></li>
	<li>username=<%=member.getUsername() %></li>
	<li>age=<%=member.getAge() %></li>
</ul>
<a href="/index.html">메인</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>