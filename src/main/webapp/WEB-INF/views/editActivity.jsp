<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
   <title>Edit Activity</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
   <style>
       body {
           background: linear-gradient(135deg, #1e1e2f 0%, #2d2d44 100%);
           font-family: 'Inter', sans-serif;
           color: #e0e0e0;
           min-height: 100vh;
           padding: 40px 0;
       }

       .container {
           max-width: 800px;
           background: rgba(255, 255, 255, 0.03);
           backdrop-filter: blur(10px);
           border: 1px solid rgba(255, 255, 255, 0.1);
           border-radius: 16px;
           padding: 32px;
           box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
       }

       .header {
           margin-bottom: 40px;
           text-align: center;
           position: relative;
       }

       .header h1 {
           color: #fff;
           font-weight: 600;
           font-size: 2.2rem;
           margin: 0;
           padding-bottom: 20px;
           position: relative;
       }

       .header h1::after {
           content: '';
           position: absolute;
           bottom: 0;
           left: 50%;
           transform: translateX(-50%);
           width: 60px;
           height: 4px;
           background: linear-gradient(90deg, #4facfe 0%, #00f2fe 100%);
           border-radius: 2px;
       }

       .form-group {
           margin-bottom: 28px;
           position: relative;
       }

       .form-label {
           color: #a0a0a0;
           font-size: 0.9rem;
           font-weight: 500;
           margin-bottom: 8px;
           display: block;
           transition: all 0.3s ease;
       }

       .form-control {
           background: rgba(255, 255, 255, 0.05);
           border: 1px solid rgba(255, 255, 255, 0.1);
           border-radius: 8px;
           color: #fff;
           padding: 12px 16px;
           transition: all 0.3s ease;
       }

       .form-control:focus {
           background: rgba(255, 255, 255, 0.08);
           border-color: #4facfe;
           box-shadow: 0 0 0 2px rgba(79, 172, 254, 0.2);
           color: #fff;
       }

       .form-control::placeholder {
           color: rgba(255, 255, 255, 0.3);
       }

       .btn-submit {
           background: linear-gradient(90deg, #4facfe 0%, #00f2fe 100%);
           color: #fff;
           padding: 12px 32px;
           border: none;
           border-radius: 8px;
           font-weight: 500;
           cursor: pointer;
           transition: all 0.3s ease;
           text-transform: uppercase;
           letter-spacing: 1px;
       }

       .btn-submit:hover {
           transform: translateY(-2px);
           box-shadow: 0 8px 16px rgba(79, 172, 254, 0.3);
       }

       .btn-cancel {
           background: rgba(255, 255, 255, 0.1);
           color: #fff;
           padding: 12px 32px;
           border: none;
           border-radius: 8px;
           font-weight: 500;
           cursor: pointer;
           transition: all 0.3s ease;
           text-transform: uppercase;
           letter-spacing: 1px;
           text-decoration: none;
           margin-left: 16px;
           display: inline-block;
       }

       .btn-cancel:hover {
           background: rgba(255, 255, 255, 0.15);
           color: #fff;
           transform: translateY(-2px);
       }

       .alert {
           background: rgba(220, 53, 69, 0.1);
           border: 1px solid rgba(220, 53, 69, 0.2);
           color: #ff6b6b;
           border-radius: 8px;
           padding: 16px;
           margin-bottom: 24px;
           backdrop-filter: blur(10px);
       }

       textarea.form-control {
           min-height: 120px;
           resize: vertical;
       }

       input[type="number"] {
           -moz-appearance: textfield;
       }

       input[type="number"]::-webkit-outer-spin-button,
       input[type="number"]::-webkit-inner-spin-button {
           -webkit-appearance: none;
       }

       input[type="date"] {
           position: relative;
           padding-right: 40px;
       }

       input[type="date"]::-webkit-calendar-picker-indicator {
           background: transparent;
           cursor: pointer;
           height: 100%;
           position: absolute;
           right: 0;
           top: 0;
           width: 40px;
           filter: invert(1);
       }

       .text-center {
           text-align: center;
           margin-top: 40px;
       }

       /* Animation keyframes */
       @keyframes fadeIn {
           from {
               opacity: 0;
               transform: translateY(20px);
           }
           to {
               opacity: 1;
               transform: translateY(0);
           }
       }

       /* Apply animation to form elements */
       .form-group {
           animation: fadeIn 0.5s ease forwards;
           opacity: 0;
       }

       .form-group:nth-child(1) { animation-delay: 0.1s; }
       .form-group:nth-child(2) { animation-delay: 0.2s; }
       .form-group:nth-child(3) { animation-delay: 0.3s; }
       .form-group:nth-child(4) { animation-delay: 0.4s; }
       .form-group:nth-child(5) { animation-delay: 0.5s; }
   </style>
</head>
<body>
   <div class="container">
       <c:if test="${not empty error}">
           <div class="alert alert-danger">
               ${error}
           </div>
       </c:if>

       <div class="header">
           <h1>Edit Activity</h1>
       </div>

       <form:form action="${pageContext.request.contextPath}/activities/edit/${activity.id}" 
                  method="post" 
                  modelAttribute="activity">
           
           <div class="form-group">
               <form:label path="title" class="form-label">Title</form:label>
               <form:input path="title" class="form-control" required="required" placeholder="Enter activity title"/>
           </div>

           <div class="form-group">
               <form:label path="date" class="form-label">Date</form:label>
               <form:input path="date" type="date" class="form-control" required="required"/>
           </div>

           <div class="form-group">
               <form:label path="place" class="form-label">Place</form:label>
               <form:input path="place" class="form-control" required="required" placeholder="Enter activity location"/>
           </div>

           <div class="form-group">
               <form:label path="maxParticipants" class="form-label">Max Participants</form:label>
               <form:input path="maxParticipants" type="number" class="form-control" required="required" placeholder="Enter maximum number of participants"/>
           </div>

           <div class="form-group">
               <form:label path="description" class="form-label">Description</form:label>
               <form:textarea path="description" class="form-control" rows="4" required="required" placeholder="Enter activity description"/>
           </div>

           <div class="text-center">
               <button type="submit" class="btn-submit">Update Activity</button>
               <a href="${pageContext.request.contextPath}/activities" class="btn-cancel">Cancel</a>
           </div>
       </form:form>
   </div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>