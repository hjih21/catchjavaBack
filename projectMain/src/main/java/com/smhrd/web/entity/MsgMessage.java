package com.smhrd.web.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MsgMessage {

		private int idx;
		private String sendName;
		private String receiveEmail;
		private String message;
		private String m_date;
		
}
