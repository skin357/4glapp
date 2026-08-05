<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
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
            max-width: 600px;
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
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #495057;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 14px;
        }
        input[type="text"]:focus, textarea:focus {
            outline: none;
            border-color: #007bff;
        }
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        .btn-submit {
            padding: 10px 20px;
            background-color: #28a745;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.2s ease;
        }
        .btn-submit:hover {
            background-color: #218838;
        }
        .btn-cancel {
            display: inline-block;
            padding: 10px 20px;
            background-color: #6c757d;
            color: #ffffff;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 14px;
            transition: background-color 0.2s ease;
        }
        .btn-cancel:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>새 글 작성</h2>
        <form action="write_process.jsp" method="post">
            <div class="form-group">
            	<label for="title">제목</label>
            	<input type="text" id="title" name="title" required placeholder="제목을 입력하세요">
            </div>
            <div class="form-group">
            	<label for="writer">작성자</label>
            	<input type="text" id="writer" name="writer" required placeholder="이름을 입력하세요">
            </div>
            <div class="form-group">
            	<label for="content">내용</label>
            	<textarea id="content" name="content" rows="6" required placeholder="내용을 입력하세요"></textarea>
            </div>
            <div class="btn-group">
            	<button type="submit" class="btn-submit">저장</button>
            	<a href="list.jsp" class="btn-cancel">취소</a>
            </div>
        </form>
    </div>
</body>
</html>

