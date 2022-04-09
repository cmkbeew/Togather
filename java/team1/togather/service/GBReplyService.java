package team1.togather.service;

import java.util.ArrayList;

import team1.togather.domain.GBReply;
import team1.togather.domain.GBoard;

public interface GBReplyService {
	ArrayList<GBReply> gbrlistS(long gbnum);
	void gbrinsertS(GBReply gbreply);
	void gbrupdateS(GBReply gbreply);
	GBReply getGBReply(long gbrseq);
	void gbrdeleteS(long gbrseq);
}
