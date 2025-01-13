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
                    <td><img src="${video.thumbnail}" class="video-thumbnail" alt="${video.title}"></td>
                    <td>
                        <span>${video.title}</span><br>${video.school}
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
