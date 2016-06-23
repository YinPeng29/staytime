<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	session.setMaxInactiveInterval(11);
	Date now = new Date();
	int h = 0;
	int m = 0;
	int s = 0;
	if(session.isNew()){
		session.setAttribute("start", now);
	}else{
		Date date = (Date)session.getAttribute("start");
		Date end = new Date();
		long howmuch = end.getTime() - (date.getTime());
		h = (int)(howmuch/1000/60/60);
		howmuch = howmuch-h*60*60*1000;
		m = (int)(howmuch/1000/60);
		howmuch = howmuch-m*60*1000;
		s = (int)(howmuch/1000);
	}
	response.setHeader("Refresh", "10");
%>
<body>
您登陆的时间为:<%=((Date)session.getAttribute("start")).toLocaleString() %><br>
您停留的时间：<%=h%>小时<%=m %>分<%=s %>秒
</body>
</html>