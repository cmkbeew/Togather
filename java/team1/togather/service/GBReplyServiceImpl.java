package team1.togather.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import team1.togather.domain.GBReply;
import team1.togather.domain.GBoard;
import team1.togather.mapper.GBReplyMapper;

@Service
@AllArgsConstructor
public class GBReplyServiceImpl implements GBReplyService {
	private GBReplyMapper gbreplyMapper;
	
	@Override
	public ArrayList<GBReply> gbrlistS(long gbnum) {
		return gbreplyMapper.gbrlist(gbnum);
	}
	@Override
	public void gbrinsertS(GBReply gbreply) {
		gbreplyMapper.gbrinsert(gbreply);
	}
	@Override
	public void gbrupdateS(GBReply gbreply) {
		gbreplyMapper.gbrupdate(gbreply);
	}
	@Override
	public GBReply getGBReply(long gbrseq) {
		GBReply gbreply = gbreplyMapper.selectgbrseq(gbrseq);
		return gbreply;
	}
	@Override
	public void gbrdeleteS(long gbrseq) {
		gbreplyMapper.gbrdelete(gbrseq);
	}
}
