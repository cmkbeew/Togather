package team1.togather.service;

import java.util.ArrayList;
import java.util.Map;

import team1.togather.domain.Reply;

public interface ReplyService {
	public ArrayList<Reply> getReply(Long bnum);
	public void insert(Reply reply);
	public void addLike(Reply reply);
	public void cancelLike(Reply reply);
	public Integer checkRLIKE(Map map);
	public void insertRLIKE(Map map);
	public void deleteRLIKE(Map map);
	public Long getR_like(Long rseq);
}
