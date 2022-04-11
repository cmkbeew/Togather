package team1.togather.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WishList {
	Long wseq;
	Long mnum;
	Long gseq;
	Integer flag;
}
