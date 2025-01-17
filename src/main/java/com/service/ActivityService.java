package com.service;

import com.entity.Activity;
import com.entity.Participant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.persistence.EntityNotFoundException;

@Service
public class ActivityService {
	private static final Logger logger = LoggerFactory.getLogger(ActivityService.class);

	@Autowired
	private ActivityDao activityDao;

	@Autowired
	private ParticipantDao participantDao;

	@Transactional
	public void saveActivity(Activity activity) {
		try {
			activityDao.saveActivity(activity);
			logger.info("Activity saved successfully: {}", activity.getTitle());
		} catch (Exception e) {
			logger.error("Error saving activity: ", e);
			throw new RuntimeException("Failed to save activity", e);
		}
	}

	@Transactional
	public Activity getActivity(Long id) {
		Activity activity = activityDao.getActivity(id);
		if (activity == null) {
			logger.warn("Activity not found with id: {}", id);
			throw new EntityNotFoundException("Activity not found with id: " + id);
		}
		return activity;
	}

	@Transactional(readOnly = true)
	public List<Activity> getAllActivities() {
		try {
			return activityDao.getAllActivities();
		} catch (Exception e) {
			logger.error("Error fetching activities: ", e);
			throw new RuntimeException("Failed to fetch activities", e);
		}
	}

	@Transactional
	public void deleteActivity(Long id) {
		Activity activity = getActivity(id);
		activityDao.deleteActivity(id);
		logger.info("Activity deleted successfully: {}", activity.getTitle());
	}

	@Transactional(readOnly = true)
	public Activity getActivityById(Long id) {
		Activity activity = activityDao.getActivity(id);
		if (activity == null) {
			throw new EntityNotFoundException("Activity not found with id: " + id);
		}
		return activity;
	}

	@Transactional
	public void updateActivity(Long id, Activity updatedActivity) {
		Activity existingActivity = getActivity(id);
		existingActivity.setTitle(updatedActivity.getTitle());
		existingActivity.setDate(updatedActivity.getDate());
		existingActivity.setPlace(updatedActivity.getPlace());
		existingActivity.setMaxParticipants(updatedActivity.getMaxParticipants());
		existingActivity.setDescription(updatedActivity.getDescription());
		activityDao.saveActivity(existingActivity);
	}

	@Transactional
	public void joinActivity(Activity activity, Participant participant) {
		if (activity == null) {
			throw new IllegalArgumentException("Activity cannot be null");
		}

		// Check capacity before allowing join
		if (!activity.hasCapacity()) {
			throw new IllegalStateException("Activity is full. Maximum capacity of " + activity.getMaxParticipants()
					+ " participants reached.");
		}

		// Assign activity to the participant
		participant.setActivity(activity);
		participant.setId(null);

		// Increment participant count
		activity.setCurrentParticipants(activity.getCurrentParticipants() + 1);

		// Save both participant and updated activity
		participantDao.saveParticipant(participant);
		activityDao.saveActivity(activity);
	}

	@Transactional(readOnly = true)
	public List<Participant> getParticipants(Long activityId) {
		return participantDao.getParticipantsByActivity(activityId);
	}

}
