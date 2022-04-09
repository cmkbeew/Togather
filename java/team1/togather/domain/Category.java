package team1.togather.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {
	Long catenum;
	String int_out;
	String int_in;
	String first_option;
	String second_option;
}
