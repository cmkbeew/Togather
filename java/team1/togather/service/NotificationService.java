package team1.togather.service;

import java.util.List;
import java.util.Map;

import team1.togather.domain.Notification;
import team1.togather.domain.NotificationCriteria;
public interface NotificationService {

	
	public List<Notification> listPage(int page);
	public List<Notification> listPageCri(NotificationCriteria cri); 	//페이징 처리후 글 목록
	public int pageCount();	
	Notification getNotificationContent(Long nseq);
	
	public List<Notification> getNotificationBySearch(Map map); // 검색
	
	void updateNView(Long nseq);
	void insert(Notification notification);
	void update(Notification notification);
	void delete(long nseq);
	
}
