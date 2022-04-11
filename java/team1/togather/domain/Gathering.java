package team1.togather.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class Gathering {
	private long ga_seq;
	private String ga_name;
	private String ga_date;
	private String time;
	private String ga_place;
	private String price;
	private int ga_limit;
	private long gseq;
	private long mnum;
	
}
