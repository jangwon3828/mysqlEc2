<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>

<h1>MySQL 데이터 삽입 및 조회 예제</h1>
<body>
<%

    Class.forName("com.mysql.cj.jdbc.Driver");

    // 데이터베이스 연결
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/geodo2db","geodo2", "1234");

    // 사용자 정보 삽입


    String insertQuery = "INSERT INTO user (name, email) VALUES (?, ?)";
    PreparedStatement insertStatement = conn.prepareStatement(insertQuery);
    insertStatement.setString(1, "John_Doe"); // 사용자 이름
    insertStatement.setString(2, "john@example.com"); // 사용자 이메일
    insertStatement.executeUpdate();

    // 사용자 정보 조회
    String selectQuery = "SELECT * FROM user";
    Statement selectStatement = conn.createStatement();
    ResultSet resultSet = selectStatement.executeQuery(selectQuery);

    // 조회 결과 출력
    while (resultSet.next()) {
        String name = resultSet.getString("name");
        String email = resultSet.getString("email");
        out.println("<p>Name: " + name + ", Email: " + email + "</p>");
    }

    // 연결 종료
    resultSet.close();
    selectStatement.close();
    insertStatement.close();
    conn.close();
%>

</body>
</html>