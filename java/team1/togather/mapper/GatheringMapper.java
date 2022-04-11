package team1.togather.mapper;

import java.util.List;
import java.util.Map;

import team1.togather.domain.Gathering;
import team1.togather.domain.GatheringCriteria;
import team1.togather.domain.MemInGathering;
import team1.togather.domain.Member;

public interface GatheringMapper {
	Gathering ga_selectByGaSeq(long ga_seq);
	void ga_insert(Gathering gathering);
	void ga_update(Gathering gathering);
	void ga_delete(long ga_seq);
	List<Gathering> ga_selectByGseq(long gseq); //group에 속한 gathering목록
	
	List<Member> selectAllname();
	Long gatheringMemberCount(long ga_seq);
	Member gatheringCreaterName(long ga_seq); //정모 만든사람 이름 구하는 로직
	void memInGathering(MemInGathering memInGathering);
	Long grade(MemInGathering memIngathering);
	Long memInGatheringCheck(MemInGathering memInGathering);
	
	void gatheringQuit(MemInGathering memInGathering); //정모 참여 취소
	List<Map<String, String>> memInGatheringName(MemInGathering memInGathering); //정모 참여 멤버이름
	void memInGatheringDelete(long ga_seq);//모임삭제시 참여멤버 삭제
	Gathering insertGatheringInfo(Gathering gathering);//모임 생성시 모임인포로 이동
	
	//페이징
	public List<Gathering> listPage(Integer page);
	public List<Gathering> listPageCri(GatheringCriteria cri);
	public Integer pageCount();
	
	
	long gatheringCount();
	//
	String gathringInfoMemberName(MemInGathering memInGathering);
}
