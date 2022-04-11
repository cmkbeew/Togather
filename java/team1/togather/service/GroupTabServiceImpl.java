package team1.togather.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import team1.togather.domain.Gathering;
import team1.togather.domain.GroupTab;
import team1.togather.domain.IndexCriteria;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.mapper.GroupTabMapper;

@Service
@AllArgsConstructor
public class GroupTabServiceImpl implements GroupTabService {
	private GroupTabMapper groupTabMapper;
	
	@Override
	public List<GroupTab> selectAllS(IndexCriteria cri) {
		List<GroupTab> list = groupTabMapper.selectAll(cri);
		return list;
	}
	
	
	
	@Override
	public GroupTab selectByGSeqS(long gseq) {
		return groupTabMapper.selectByGSeq(gseq);
	}

	@Override
	public void insertS(GroupTab groupTab) {
		groupTabMapper.insert(groupTab);
	}

	@Override
	public void updateS(GroupTab groupTab) {
		groupTabMapper.update(groupTab);
	}

	@Override
	public void deleteS(long gseq) {
		groupTabMapper.delete(gseq);
	}
	//03.16지수추가 
	@Override
	public List<String> selectAllname(long mnum) {
		
		return groupTabMapper.selectAllname(mnum);
	}

	@Override
	public long groupCount() {
		
		return groupTabMapper.groupCount();
	}

	@Override
	public Long groupMemberCount(long gseq) {
		
		return groupTabMapper.groupMemberCount(gseq);
	}

	@Override
	public Member groupInfoMemberName(long gseq) {
		
		return groupTabMapper.groupInfoMemberName(gseq);
	}

	@Override
	public void memInGroup(MemInGroup memInGroup) {
		groupTabMapper.memInGroup(memInGroup);
	}

	@Override
	public Long grade(MemInGroup memInGroup) {

		
		return groupTabMapper.grade(memInGroup);
	}
	//03.17지수추가
	@Override
	public Long memInGroupCheck(MemInGroup memInGroup) {
		return groupTabMapper.memInGroupCheck(memInGroup);
	}

	@Override
	public void groupQuit(MemInGroup memInGroup) {
		groupTabMapper.groupQuit(memInGroup);
		
	}

	@Override
	public List<Map<String,String>> memInGroupName(MemInGroup memInGroup) {
		
		return groupTabMapper.memInGroupName(memInGroup);
	}

	@Override
	public void memInGroupDelete(long gseq) {
		groupTabMapper.memInGroupDelete(gseq);
		
	}

	@Override
	public List<GroupTab> myGroup(MemInGroup memInGroup) {
		
		return groupTabMapper.myGroup(memInGroup);
	}

	@Override
	public GroupTab insertGroupInfo(GroupTab groupTab) {
		
		return groupTabMapper.insertGroupInfo(groupTab);
	}
	
	@Override
	public List<GroupTab> loginGroupList(Map<String,Object> map) {
		List<GroupTab> list = groupTabMapper.loginGroupList(map);
		return list;
	}

	@Override
	public Integer pageCount(Member member) {
		
		return groupTabMapper.pageCount(member);
	}



	@Override
	public Integer notCategorypageCount() {
		
		return groupTabMapper.notCategorypageCount();
	}

	@Override
	public long LIMIT(MemInGroup memInGroup) {
		
		return groupTabMapper.LIMIT(memInGroup);
	}



	@Override
	public List<String> NoCategoryNames(IndexCriteria cri) {
		
		return groupTabMapper.NoCategoryNames(cri);
	}



	@Override
	public void quitGroupDeleteGathering(long mnum) {
		groupTabMapper.quitGroupDeleteGathering(mnum);
	}
	@Override
	public Long gatheringCountInGroup(long gseq) {
		return groupTabMapper.gatheringCountInGroup(gseq);
	}



	@Override
	public List<String> groupMemberNames(Map<String, Object> map) {
		return groupTabMapper.groupMemberNames(map);
	}



	@Override
	public void kickout(MemInGroup memInGroup) {
		groupTabMapper.kickout(memInGroup);
		
	}



	@Override
	public void gradeChange(MemInGroup memInGroup) {
		groupTabMapper.gradeChange(memInGroup);
		
	}
	@Override
	public void gradeChange2(MemInGroup memInGroup) {
		groupTabMapper.gradeChange2(memInGroup);
		
	}



	@Override
	public List<HashMap<String,Object>> endTime(HashMap<String,Object> map) {
		
		return groupTabMapper.endTime(map);
	}



	@Override
	public List<Gathering> endTimeGathring(String ga_date) {
		return groupTabMapper.endTimeGathring(ga_date);
	}



	@Override
	public String endTimeName(long gseq) {
		return groupTabMapper.endTimeName(gseq);
		
	}



	@Override
	public void gatheringDelete(String ga_date) {
		groupTabMapper.gatheringDelete(ga_date);
		
	}
	

}