package team1.togather.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team1.togather.domain.Notification;
import team1.togather.domain.NotificationCriteria;
import team1.togather.mapper.NotificationMapper;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private NotificationMapper notificationMapper;
	
	@Override
	public List<Notification> listPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		page = (page - 1)*10;
		return notificationMapper.listPage(page);
	}

	@Override
	public List<Notification> listPageCri(NotificationCriteria cri) {
		return notificationMapper.listPageCri(cri);
	}

	@Override
	public int pageCount() {
		return notificationMapper.pageCount();
	}

	@Override
	public Notification getNotificationContent(Long nseq) {
		return notificationMapper.getNotificationContent(nseq);
	}

	@Override
	public List<Notification> getNotificationBySearch(Map map) {
		return notificationMapper.getNotificationBySearch(map);
	}

	@Override
	public void updateNView(Long nseq) {
		notificationMapper.updateNView(nseq);
		
	}
	@Override
	public void insert(Notification notification) {
		notificationMapper.insert(notification);
	}
	@Override
	public void update(Notification notification) {
		notificationMapper.update(notification);
	}
	@Override
	public void delete(long nseq) {
		notificationMapper.delete(nseq);
	}
	
		
	
}

