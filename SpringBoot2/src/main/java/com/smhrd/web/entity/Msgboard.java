package com.smhrd.web.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Msgboard {
	
	private int idx;
	private String title;
	private String writer;
	private String filename;
	private String content;
	private String b_date;
	private int count;
}
