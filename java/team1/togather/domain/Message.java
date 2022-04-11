package team1.togather.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Message {
	private long meseq;
	private String to_mname;
	private long to_mnum;
	private long from_mnum;
	private String from_mname;
	private String metitle;
	private String mecontent;
	private long mecheck;
	private long viewcheck;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd (E) HH:mm")
	private Date medate;
}
