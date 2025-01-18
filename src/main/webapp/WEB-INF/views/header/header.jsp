<style>
#header-unique-container {
	all: initial;
	display: inline-block;
	box-sizing: border-box;
	background: linear-gradient(to right, #9c27b0, #ba68c8);
	border-radius: 12px;
	margin: 15px;
	padding: 0.7rem 1.2rem;
	box-shadow: 0 3px 10px rgba(156, 39, 176, 0.3);
	width: fit-content;
	border: 1px solid rgba(255, 255, 255, 0.1);
	/* Adding Arial font family at the container level */
	font-family: Arial, "Helvetica Neue", sans-serif;
}

#header-unique-container .user-section {
	all: initial;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	gap: 1.5rem;
	/* Ensuring Arial font is applied */
	font-family: Arial, "Helvetica Neue", sans-serif;
}

#header-unique-container .user-info {
	all: initial;
	display: flex;
	align-items: center;
	gap: 0.5rem;
	color: #ffffff;
	font-family: Arial, "Helvetica Neue", sans-serif;
}

#header-unique-container .user-name {
	all: initial;
	display: inline-block;
	font-family: Arial, "Helvetica Neue", sans-serif;
	font-weight: 600;
	font-size: 1.25rem;
	color: #ffffff;
	letter-spacing: 0.3px;
}

#header-unique-container .user-role {
	all: initial;
	display: inline-block;
	font-family: Arial, "Helvetica Neue", sans-serif;
	color: #e1bee7;
	font-size: 1.1rem;
	font-weight: 500;
}

#header-unique-container .logout-button {
	all: initial;
	display: inline-block;
	font-family: Arial, "Helvetica Neue", sans-serif;
	padding: 0.5rem 1.2rem;
	background-color: #f3e5f5;
	color: #9c27b0;
	text-decoration: none;
	border-radius: 20px;
	font-size: 1.1rem;
	font-weight: 500;
	cursor: pointer;
	border: 2px solid rgba(255, 255, 255, 0.3);
	transition: all 0.3s ease;
}

#header-unique-container .logout-button:hover {
	background-color: #ffffff;
	transform: translateY(-1px);
	box-shadow: 0 3px 8px rgba(0, 0, 0, 0.2);
}

#header-unique-container .logout-button:focus {
	outline: none;
	box-shadow: 0 0 0 3px rgba(243, 229, 245, 0.5);
}
</style>

<!-- The HTML structure remains the same -->
<div id="header-unique-container">
	<div class="user-section">
		<c:if test="${not empty sessionScope.userId}">
			<div class="user-info">
				<span class="user-name">${sessionScope.name}</span> <span
					class="user-role">(${sessionScope.role})</span>
			</div>
		</c:if>
		<a href="${pageContext.request.contextPath}/logout"
			class="logout-button">Logout</a>
	</div>
</div>