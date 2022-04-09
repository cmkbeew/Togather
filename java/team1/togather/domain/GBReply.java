package team1.togather.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GBReply {
	private long gbrseq;
	private long gbnum;
	private String mname;
	private long mnum;
	private String gbrcontent;
	private long gbr_like;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd (E) HH:mm")
	private Date rdate;
}
