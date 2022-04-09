package team1.togather.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    
	private long mnum;
	private String maddr;
	private String pfr_loc;
	private String mname;
	private String gender;
	private String birth;
	private String pwd;
	private String email;
	private String phone;
	private String category_first;
	private String category_second;
	private String category_third;
	private long athur;
}
