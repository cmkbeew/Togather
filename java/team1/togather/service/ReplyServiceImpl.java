package team1.togather.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team1.togather.domain.Reply;
import team1.togather.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper replymapper;

	@Override
	public ArrayList<Reply> getReply(Long bnum) {
		return replymapper.getReply(bnum);
	}
	@Override
	public void insert(Reply reply) {
		replymapper.insert(reply);
	}
	@Override
	public void addLike(Reply reply) {
		replymapper.addLike(reply);
	}
	@Override
	public void cancelLike(Reply reply) {
		replymapper.cancelLike(reply);
	}
	@Override
	public Integer checkRLIKE(Map map) {
		return replymapper.checkRLIKE(map);
	}
	@Override
	public void insertRLIKE(Map map) {
		replymapper.insertRLIKE(map);
	}
	@Override
	public void deleteRLIKE(Map map) {
		replymapper.deleteRLIKE(map);
	}
	@Override
	public Long getR_like(Long rseq) {
		return replymapper.getR_like(rseq);
	}
}
