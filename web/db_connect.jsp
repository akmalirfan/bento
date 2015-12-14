<%@page import="common.ResultList"%>
<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
<%
    String query = "SELECT * FROM user WHERE id=1";
    ResultList rs = DB.query(query);
    rs.next();
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Lecturer Profile</title>
</head>

<body>
    <%=rs.getString("username") %>
</body>
<jsp:include page="footer.jsp"/>
</html>