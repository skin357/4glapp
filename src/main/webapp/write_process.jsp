<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
 
    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String content = request.getParameter("content");
 
    Connection conn = null;
    PreparedStatement pstmt = null;
 
    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mariadb://10.0.5.230:3306/boarddb", "boarduser", "1234");
 
        String sql = "INSERT INTO board (title, writer, content) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, writer);
        pstmt.setString(3, content);
 
        pstmt.executeUpdate();
 
        response.sendRedirect("index.jsp");
	} catch(Exception e) {
        out.println("저장 중 오류 발생: " + e.getMessage());
	} finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
	}
%>

