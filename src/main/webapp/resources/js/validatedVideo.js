function loadValidatedVideos() {
	fetch('videos/validated', {
		headers: {
			'Accept': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			const tableBody = document.querySelector('table tbody'); // Target the table body
			tableBody.innerHTML = ''; // Clear the table body

			data.forEach((video, index) => {
				const row = document.createElement('tr');

				row.innerHTML = `
				   <td>${index + 1}.</td>
				   <td>
				       <div class="video-preview">
				           <img src="${video.thumbnail}" class="video-thumbnail" alt="${video.title}">
				           <span class="duration">${video.duration || "00:00"}</span>
				       </div>
				   </td>
				   <td>
				       <div class="video-info">
				           <span class="video-title">${video.title}</span>
				           <div class="video-meta">
				               <span class="teacher-name">${video.teacherName}</span>
				               <span class="school-name">${video.schoolName}</span>
				           </div>
				       </div>
				   </td>
				   <td class="description-cell">
				       <div class="video-description">
				           ${video.description || 'No description available'}
				       </div>
				   </td>
				   <td class="action-buttons">
				       <button class="btn btn-approve" disabled>${video.status}</button>
				   </td>
				`;
				tableBody.appendChild(row);
			});
		})
		.catch(error => {
			console.error('Error fetching validated videos:', error);
		});
}

// Load videos when the page is loaded
window.onload = loadValidatedVideos;
