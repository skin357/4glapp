<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>6gl Rocky 10 Java 게시판</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 40px;
            display: flex;
            justify-content: center;
        }
        .container {
            width: 100%;
            max-width: 800px;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }
        h2 {
            color: #333333;
            margin-top: 0;
            margin-bottom: 20px;
        }
        .header-action {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 14px;
            transition: background-color 0.2s ease, transform 0.1s ease;
        }
        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-1px);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e9ecef;
        }
        th {
            background-color: #f8f9fa;
            color: #495057;
            font-weight: 600;
        }
        tr:hover {
            background-color: #f1f3f5;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-action">
            <h2>게시글 목록</h2>
            <a href="write.jsp" class="btn">글쓰기</a>
        </div>
        <table>
            <thead>
            	<tr>
                	<th style="width: 10%;">번호</th>
                	<th style="width: 50%;">제목</th>
                	<th style="width: 20%;">작성자</th>
                	<th style="width: 20%;">작성일</th>
            	</tr>
            </thead>
            <tbody>
            	<%
                	Connection conn = null;
                	PreparedStatement pstmt = null;
                	ResultSet rs = null;
 
                	try {
                        Class.forName("org.mariadb.jdbc.Driver");
                    	conn = DriverManager.getConnection("jdbc:mariadb://10.0.5.230:3306/boarddb", "boarduser", "1234");
 
                    	String sql = "SELECT id, title, writer, reg_date FROM board ORDER BY id DESC";
                    	pstmt = conn.prepareStatement(sql);
                    	rs = pstmt.executeQuery();
 
                    	while(rs.next()) {
            	%>
            	<tr>
                	<td><%= rs.getInt("id") %></td>
                	<td><%= rs.getString("title") %></td>
                	<td><%= rs.getString("writer") %></td>
                	<td><%= rs.getTimestamp("reg_date") %></td>
            	</tr>
            	<%
                    	}
                	} catch(Exception e) {
                        out.println("<tr><td colspan='4'>오류 발생: " + e.getMessage() + "</td></tr>");
                	} finally {
                    	if(rs != null) rs.close();
                    	if(pstmt != null) pstmt.close();
                    	if(conn != null) conn.close();
                	}
            	%>
            </tbody>
        </table>
    </div>
</body>
</html>

