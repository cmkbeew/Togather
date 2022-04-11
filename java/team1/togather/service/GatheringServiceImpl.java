package team1.togather.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team1.togather.domain.Gathering;
import team1.togather.domain.GatheringCriteria;
import team1.togather.domain.MemInGathering;
import team1.togather.domain.Member;
import team1.togather.mapper.GatheringMapper;
import team1.togather.mapper.GroupTabMapper;

@Service
public class GatheringServiceImpl implements GatheringService {

	@Autowired
	private GatheringMapper gatheringMapper;
	@Autowired
	private GroupTabMapper groupTabMapper;


	@Override
	public Gathering ga_selectByGaSeqS(long ga_seq) {
		return gatheringMapper.ga_selectByGaSeq(ga_seq);
	}

	@Override
	public void ga_insertS(Gathering gathering) {
		gatheringMapper.ga_insert(gathering);

	}

	@Override
	public void ga_updateS(Gathering gathering) {
		gatheringMapper.ga_update(gathering);

	}

	@Override
	public void ga_deleteS(long ga_seq) {
		gatheringMapper.ga_delete(ga_seq);

	}

	@Override
	public List<Gathering> ga_selectByGseqS(long gseq) {
		List<Gathering> list = gatheringMapper.ga_selectByGseq(gseq);
		return list;
	}
	@Override
	public List<String> selectAllname(long mnum){
		return groupTabMapper.selectAllname(mnum);
	}
	@Override
	public Long gatheringMemberCount(long ga_seq) {
		return gatheringMapper.gatheringMemberCount(ga_seq);
	}
	@Override
	public Member gatheringCreaterName(long ga_seq) {//정모 만든사람 이름 구하는 로직
		return gatheringMapper.gatheringCreaterName(ga_seq);
	}
	@Override
	public void memInGathering(MemInGathering memInGathering) {
		gatheringMapper.memInGathering(memInGathering);
	}
	@Override
	public Long grade(MemInGathering memIngathering) {
		return gatheringMapper.grade(memIngathering);
	}
	@Override
	public void gatheringQuit(MemInGathering memInGathering) { //정모 참여 취소
		gatheringMapper.gatheringQuit(memInGathering);
	}
	@Override
	public List<Map<String, String>> memInGatheringName(MemInGathering memInGathering){//정모 참여 멤버이름
		return gatheringMapper.memInGatheringName(memInGathering);
	}
	@Override
	public void memInGatheringDelete(long ga_seq) {//모임삭제시 참여멤버 삭제
		gatheringMapper.memInGatheringDelete(ga_seq);
	}
	@Override
	public Gathering insertGatheringInfo(Gathering gathering) {//모임 생성시 모임인포로 이동
		return gatheringMapper.insertGatheringInfo(gathering);
	}
	@Override
	public Long memInGatheringCheck(MemInGathering memInGathering) {
		return gatheringMapper.memInGatheringCheck(memInGathering);
	}
	@Override
	public List<Gathering> listPage(Integer page){
		if(page <= 0) {
			page = 1;
		}
		page = (page -1)*10;
		return gatheringMapper.listPage(page);
	}
	@Override
	public List<Gathering> listPageCri(GatheringCriteria cri){
		return gatheringMapper.listPageCri(cri);
	}
	@Override
	public Integer pageCount() {
		return gatheringMapper.pageCount();
	}
	@Override
	public long gatheringCount() {
		return gatheringMapper.gatheringCount();
	}
}
