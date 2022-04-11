package team1.togather.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {
	private Long rseq;
	private Long bnum; 
	private String mname;
	private Long mnum;
	private String content;
	private Long r_like;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd (E) HH:mm")
	private Date rdate; 
}
