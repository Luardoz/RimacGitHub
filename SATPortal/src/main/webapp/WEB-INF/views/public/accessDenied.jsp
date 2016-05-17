<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AccessDenied page</title>
</head>
<body>
    Estimado <strong>${user}</strong>, no tienes autorización para acceder a esta pagina
    <a href="<c:url value="/logout" />">Salir</a>
</body>
</html>