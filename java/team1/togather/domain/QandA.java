package team1.togather.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class QandA {
	private long qseq;
	private String qtitle;
	private String qcontent;
	private String mname;
	private long mnum;
	private long qcount;
	private String qpwd;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd (E) HH:mm")
	private Date qdate;
}
