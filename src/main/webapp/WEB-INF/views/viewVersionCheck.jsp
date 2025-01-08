<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS School Status Submission</title>
<link href="${pageContext.request.contextPath}/resources/css/SideBarStyles.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>

body {
	background-color: #f8f9fa;
}

.main-container {
	display: flex;
	min-height: 100vh;
}

/* Logo styles */
.logo {
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 2rem;
	text-decoration: none;
	padding: 1rem;
	color: #333;
}

.logo:hover {
	color: #9c27b0; /* Optional hover effect for logo */
}

/* Main content styles */
.main-content {
	flex: 1;
	padding: 20px 40px;
	background-color: white;
}

.search-bar {
	width: 100%;
	max-width: 400px;
	padding: 8px 16px;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 2rem;
}

/* Header styles */
.user-section {
	display: flex;
	align-items: center;
	gap: 10px;
	position: absolute;
	top: 20px;
	right: 40px;
}

.user-avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: #ddd;
}

/* Professional Content Styling */
.main-content {
	background-color: #f4f6f9;
	padding: 40px;
}

.breadcrumb {
	margin-bottom: 25px;
	font-size: 0.9rem;
	color: #6c757d;
}

.breadcrumb a {
	color: #6c5ce7;
	text-decoration: none;
	transition: color 0.3s ease;
}

.breadcrumb a:hover {
	color: #4a3db3;
	text-decoration: underline;
}

.school-profile-header {
	background: white;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
	padding: 25px;
	margin-bottom: 30px;
	display: flex;
	align-items: center;
}

.school-logo img {
	width: 150px;
	height: 150px;
	border-radius: 8px;
	object-fit: cover;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	margin-right: 25px;
}

.school-info h1 {
	color: #333;
	margin-bottom: 10px;
	font-size: 1.8rem;
}

.school-info p {
	color: #666;
	margin: 5px 0;
}

.criteria-table {
	background: white;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
	overflow: hidden;
}

.criteria-table table {
	width: 100%;
	border-collapse: collapse;
}

.criteria-table th {
	background-color: #f8f9fa;
	color: #495057;
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #e9ecef;
	font-weight: 600;
}

.criteria-table td {
	padding: 15px;
	border-bottom: 1px solid #e9ecef;
	vertical-align: middle;
}

.check-column {
	text-align: center;
}

.proof-upload {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.proof-preview {
	max-width: 200px;
	max-height: 200px;
	margin-top: 10px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.submit-section {
	display: flex;
	justify-content: flex-end;
	margin-top: 25px;
}

.submit-section button {
	padding: 10px 20px;
	border-radius: 6px;
	transition: all 0.3s ease;
}

.submit-section button:hover {
	opacity: 0.9;
}

.status-pill {
	display: inline-block;
	padding: 4px 8px;
	border-radius: 4px;
	font-size: 0.8rem;
	font-weight: 500;
	margin-left: 10px;
}

.status-pill.pending {
	background-color: #ffd700;
	color: #333;
}

.status-pill.approved {
	background-color: #48bb78;
	color: white;
}

.status-pill.rejected {
	background-color: #f56565;
	color: white;
}

/* Responsive Adjustments */
@media ( max-width : 768px) {
	.school-profile-header {
		flex-direction: column;
		text-align: center;
	}
	.school-logo {
		margin-bottom: 15px;
	}
	.school-logo img {
		margin-right: 0;
	}
}
</style>
</head>
<body>
	<div class="main-container">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/sidebar/sidebarTeacher.jsp" />

		<!-- Main Content -->
		<div class="main-content">
			<!-- User Section -->
			<div class="user-section">
				<div class="user-avatar"></div>
				<span>Mr. Ahmad (Teacher)</span>
			</div>

			<!-- School Details Content -->
			<div class="content">
				<div class="breadcrumb">
					<a href="school-status">School Status</a> > SK TAMAN BUKIT DAHLIA
				</div>

				<!-- School Profile Header (same as previous version) -->
				<div class="school-profile-header">
					<div class="school-logo">
						<img
							src="${pageContext.request.contextPath}/resources/images/tvpss-cess-logo.png"
							alt="School Logo">
					</div>
					<div class="school-info">
						<h1>SK TAMAN BUKIT DAHLIA</h1>
						<p class="school-code">JB 3003</p>
						<p class="school-address">Persiaran Dahlia 1</p>
						<p class="school-location">81700 Pasir Gudang</p>
						<p class="school-state">Johor</p>
					</div>
				</div>

				<!-- TVPSS Status Submission Form -->
				<form id="tvpssStatusForm" enctype="multipart/form-data">
					<div class="criteria-table">
						<table>
							<thead>
								<tr>
									<th>No.</th>
									<th>Criteria</th>
									<th>Status</th>
									<th>Proof Upload</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>There is a Name (Brand)</td>
									<td class="check-column"><input type="checkbox"
										name="criteria1" id="criteria1"> <span
										class="status-pill pending">Pending</span></td>
									<td class="proof-upload"><input type="file" name="proof1"
										accept="image/*"> <img class="proof-preview" src=""
										style="display: none;"></td>
								</tr>
								<tr>
									<td>2</td>
									<td>Logo</td>
									<td class="check-column"><input type="checkbox"
										name="criteria2" id="criteria2"> <span
										class="status-pill pending">Pending</span></td>
									<td class="proof-upload"><input type="file" name="proof2"
										accept="image/*"> <img class="proof-preview" src=""
										style="display: none;"></td>
								</tr>
								<tr>
									<td>3</td>
									<td>Corner / Mini Studio / TV Studio</td>
									<td class="check-column"><input type="checkbox"
										name="criteria3" id="criteria3"> <span
										class="status-pill pending">Pending</span></td>
									<td class="proof-upload"><input type="file" name="proof3"
										accept="image/*"> <img class="proof-preview" src=""
										style="display: none;"></td>
								</tr>
								<tr>
									<td>4</td>
									<td>In-School Recording</td>
									<td class="check-column"><input type="checkbox"
										name="criteria4" id="criteria4"> <span
										class="status-pill pending">Pending</span></td>
									<td class="proof-upload"><input type="file" name="proof4"
										accept="image/*"> <img class="proof-preview" src=""
										style="display: none;"></td>
								</tr>
								<tr>
									<td>5</td>
									<td>Upload on Youtube</td>
									<td class="check-column"><input type="checkbox"
										name="criteria5" id="criteria5"> <span
										class="status-pill pending">Pending</span></td>
									<td class="proof-upload"><input type="file" name="proof5"
										accept="image/*"> <img class="proof-preview" src=""
										style="display: none;"></td>
								</tr>
								<tr>
									<td>6</td>
									<td>Recording inside and outside the school</td>
									<td class="check-column"><input type="checkbox"
										name="criteria6" id="criteria6"> <span
										class="status-pill pending">Pending</span></td>
									<td class="proof-upload"><input type="file" name="proof6"
										accept="image/*"> <img class="proof-preview" src=""
										style="display: none;"></td>
								</tr>
								<tr>
									<td>7</td>
									<td>Collabirate with external agencies</td>
									<td class="check-column"><input type="checkbox"
										name="criteria7" id="criteria7"> <span
										class="status-pill pending">Pending</span></td>
									<td class="proof-upload"><input type="file" name="proof7"
										accept="image/*"> <img class="proof-preview" src=""
										style="display: none;"></td>
								</tr>
								<tr>
									<td>8</td>
									<td>Using 'Green Screen' Technology</td>
									<td class="check-column"><input type="checkbox"
										name="criteria8" id="criteria8"> <span
										class="status-pill pending">Pending</span></td>
									<td class="proof-upload"><input type="file" name="proof8"
										accept="image/*"> <img class="proof-preview" src=""
										style="display: none;"></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="submit-section">
						<button type="submit" class="btn btn-primary">Submit for
							Approval</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
	document.addEventListener('DOMContentLoaded', function() {
        // Image preview functionality
        const fileInputs = document.querySelectorAll('input[type="file"]');
        fileInputs.forEach(input => {
            input.addEventListener('change', function(event) {
                const file = event.target.files[0];
                const previewImg = this.nextElementSibling;
                
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        previewImg.src = e.target.result;
                        previewImg.style.display = 'block';
                    }
                    reader.readAsDataURL(file);
                } else {
                    previewImg.src = '';
                    previewImg.style.display = 'none';
                }
            });
        });

        // Form submission
        const form = document.getElementById('tvpssStatusForm');
        form.addEventListener('submit', function(event) {
            event.preventDefault();
            
            // Validation: Ensure checkbox is checked when uploading proof
            const rows = form.querySelectorAll('tbody tr');
            let isValid = true;

            rows.forEach(row => {
                const checkbox = row.querySelector('input[type="checkbox"]');
                const fileInput = row.querySelector('input[type="file"]');
                const statusPill = row.querySelector('.status-pill');

                if (fileInput.files.length > 0 && !checkbox.checked) {
                    isValid = false;
                    alert('Please check the box before uploading proof');
                    return;
                }

                if (checkbox.checked) {
                    statusPill.textContent = 'Pending';
                    statusPill.classList.remove('approved', 'rejected');
                    statusPill.classList.add('pending');
                }
            });

            if (isValid) {
                // Here you would typically send the form data to the server
                alert('Submitted for Admin Approval');
            }
        });
    });
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>