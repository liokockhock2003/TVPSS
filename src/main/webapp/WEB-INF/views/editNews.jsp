<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit News</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>Edit News</h1>
    <form action="${pageContext.request.contextPath}/news/edit/${news.id}" method="post" enctype="multipart/form-data">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <div class="mb-3">
            <label for="author" class="form-label">Author</label>
            <input type="text" class="form-control" id="author" name="author" value="${news.author}" required>
        </div>
        <div class="mb-3">
            <label for="title" class="form-label">Title</label>
            <input type="text" class="form-control" id="title" name="title" value="${news.title}" required>
        </div>
        <div class="mb-3">
            <label for="picture" class="form-label">Picture</label>
            <input type="file" class="form-control" id="picture" name="picture">
        </div>
        <div class="mb-3">
            <label for="content" class="form-label">Content</label>
            <textarea class="form-control" id="content" name="content" rows="6" required>${news.content}</textarea>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="${pageContext.request.contextPath}/news" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
