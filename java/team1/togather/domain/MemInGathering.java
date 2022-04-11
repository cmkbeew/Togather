package team1.togather.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemInGathering {
	private long ga_seq;
	private long mnum;
	private long grade;
}
