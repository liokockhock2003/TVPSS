<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS School List</title>
<link
	href="${pageContext.request.contextPath}/resources/css/SideBarStyles.css"
	rel="stylesheet">
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

/* Table styles */
.content-card {
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
	padding: 20px;
}

.manage-btn {
	background-color: #9c27b0;
	color: white;
	border: none;
	padding: 6px 16px;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

.manage-btn:hover {
	background-color: #7b1fa2;
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

.table th {
	color: #666;
	font-weight: 500;
	border-bottom: 2px solid #eee;
}

.table td {
	vertical-align: middle;
}
/* Header section with flexbox for title and button alignment */
.header-section {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
	font-family: Arial, sans-serif;
}

/* Style for the create button */
.create-btn {
	background-color: #9c27b0;
	color: white;
	border: none;
	padding: 8px 20px;
	border-radius: 8px;
	text-decoration: none;
	font-size: 0.9rem;
	font-weight: 500;
	transition: all 0.3s ease;
	display: inline-flex;
	align-items: center;
	gap: 8px;
}

/* Hover effect matching your existing button style */
.create-btn:hover {
	background-color: #7b1fa2;
	color: white;
	transform: translateY(-1px);
	box-shadow: 0 2px 5px rgba(156, 39, 176, 0.3);
}

/* Make the title style consistent */
.header-section h6 {
	font-size: 1.1rem;
	font-weight: 600;
	margin: 0;
	color: #333;
}

.delete-btn {
	background-color: #dc3545; /* Bootstrap's danger color */
	color: white;
	border: none;
	padding: 6px 16px;
	border-radius: 4px;
	transition: all 0.3s ease;
}

.delete-btn:hover {
	background-color: #bb2d3b;
	transform: translateY(-1px);
	box-shadow: 0 2px 5px rgba(220, 53, 69, 0.3);
}

.d-flex {
	display: flex;
}

.gap-2 {
	gap: 0.5rem;
}
</style>
</head>
<body>
	<div class="main-container">
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/sidebar/sidebarAdmin.jsp" />

		<!-- Main Content -->
		<div class="main-content">
			<jsp:include page="/WEB-INF/views/header/header.jsp" />

			<div class="content-card">
				<h6 class="mb-4">List of Schools</h6>
				<p> ${message} </p>

				<table class="table">
					<thead>
						<tr>
							<th>No</th>
							<th>School Name</th>
							<th>Version</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<!-- Loop through the schools and display them -->
						<c:forEach items="${schools}" var="school">
							<tr>
								<td>${school.id}</td>
								<td>${school.name}</td>
								<td>${school.version}</td>
								<td>
									<!-- Display 'Active' or 'Not Active' based on status --> <c:choose>
										<c:when test="${school.status == true}">Active</c:when>
										<c:otherwise>Not Active</c:otherwise>
									</c:choose>
								</td>
								<td>
									<!-- Button that links to the school profile page based on school ID -->
									<a
									href="${pageContext.request.contextPath}/school-profile/${school.id}"
									class="manage-btn"> View Details </a> <!-- New Delete button that triggers a confirmation modal -->
									<button type="button" class="delete-btn" data-bs-toggle="modal"
										data-bs-target="#deleteSchoolModal"
										data-school-id="${school.id}"
										data-school-name="${school.name}">Delete</button>
								</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
				<!-- Update the create button to open the modal -->
				<div class="header-section">
					<button type="button" class="create-btn" data-bs-toggle="modal"
						data-bs-target="#addSchoolModal">Add New School</button>
				</div>
				<div class="modal fade" id="addSchoolModal" tabindex="-1"
					aria-labelledby="addSchoolModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="addSchoolModalLabel">Add New
									School</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- Note how we're using action and method attributes to specify where the form should submit -->
								<form id="addSchoolForm"
									action="${pageContext.request.contextPath}/add-school"
									method="post">
									<div class="mb-3">
										<label for="schoolName" class="form-label">School Name</label>
										<input type="text" class="form-control" id="schoolName"
											name="schoolName" required>
									</div>
									<div class="mb-3">
										<label for="schoolAddress" class="form-label">School
											Address</label>
										<textarea class="form-control" id="schoolAddress"
											name="schoolAddress" rows="3" required></textarea>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancel</button>
								<!-- Note how we changed this to submit the form -->
								<button type="button" class="btn btn-primary"
									onclick="submitSchoolForm()">Save School</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Delete Confirmation Modal -->
				<div class="modal fade" id="deleteSchoolModal" tabindex="-1"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Confirm Delete</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>
									Are you sure you want to delete <span id="schoolNameToDelete"></span>?
								</p>
								<p class="text-danger">This action cannot be undone.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancel</button>
								<form id="deleteSchoolForm" method="POST">
									
									<button type="submit" class="btn btn-danger">Delete
										School</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
// Handle the delete confirmation modal
// Handle the delete confirmation modal
const deleteModal = document.getElementById('deleteSchoolModal');
deleteModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget;
    
    // Extract info from data-* attributes
    const schoolId = button.getAttribute('data-school-id');
    const schoolName = button.getAttribute('data-school-name');
    console.log(schoolId);
    // Update the modal's content
    const schoolNameSpan = deleteModal.querySelector('#schoolNameToDelete');
    schoolNameSpan.textContent = schoolName;
    
    // Update the form's action URL
    const deleteForm = deleteModal.querySelector('#deleteSchoolForm');
    // Construct the URL using string concatenation
    deleteForm.action = document.getElementById('contextPath').value + '/delete-school/' + schoolId;
    
});
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
document.addEventListener('DOMContentLoaded', function() {
    // Get the modal and form elements
    const modal = document.getElementById('addSchoolModal');
    const form = document.getElementById('addSchoolForm');
    const saveButton = document.getElementById('saveSchool');

    // Handle form submission
    saveButton.addEventListener('click', function() {
        // Check if the form is valid
        if (!form.checkValidity()) {
            form.reportValidity();
            return;
        }

        // Get form data
        const formData = new FormData(form);
        const schoolData = {
            name: formData.get('name'),
            address: formData.get('address')
        };

        // Send the data to your server
        fetch('${pageContext.request.contextPath}/api/schools/create', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(schoolData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Close the modal
                const modalInstance = bootstrap.Modal.getInstance(modal);
                modalInstance.hide();
                
                // Refresh the page to show the new school
                location.reload();
            } else {
                alert('Failed to create school. Please try again.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred. Please try again.');
        });
    });

    // Reset form when modal is closed
    modal.addEventListener('hidden.bs.modal', function () {
        form.reset();
    });
});
</script>
	<script>
function submitSchoolForm() {
    // Get the form element
    const form = document.getElementById('addSchoolForm');
    
    // Check if the form is valid
    if (!form.checkValidity()) {
        form.reportValidity();
        return;
    }
    
    // Submit the form
    form.submit();
}

// Reset form when modal is closed
document.getElementById('addSchoolModal').addEventListener('hidden.bs.modal', function () {
    document.getElementById('addSchoolForm').reset();
});
</script>
</body>
</html>