package team1.togather.mapper;

import java.util.ArrayList;

import team1.togather.domain.GBReply;
import team1.togather.domain.GBoard;

public interface GBReplyMapper {
	ArrayList<GBReply> gbrlist(long gbnum);
	void gbrinsert(GBReply gbreply);
	void gbrupdate(GBReply gbreply);
	GBReply selectgbrseq(long gbrseq);
	void gbrdelete(long gbrseq);
}
