<!--  1. Directive tag (������) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%-- 2. cComment Tage(JSP �ּ�) --%>
<%-- 3. Declaration tag(�����) --%>
<%! private static final String DEFAULT_NAME = "Guest"; %>
<%-- 4. Scriptlet tag(��ũ��Ʋ��)--%>
<%
	// �ڹ� �ڵ带 �״�� �ۼ�
	String name = request.getParameter("name");
	if(name == null) 
		name = DEFAULT_NAME;
	//out.println("<h1>hello, "+ name + "</h1>");
%>
<%-- 5. Expression tag(ǥ����) --%>
<h1> hello, <%=name %></h1>
</body>
</html>