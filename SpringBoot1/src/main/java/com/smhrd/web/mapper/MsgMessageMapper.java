package com.smhrd.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.web.entity.MsgMessage;

@Mapper
public interface MsgMessageMapper {
	
	@Insert("insert into msg_message values(idx_message.nextval, #{sendName}, #{receiveEmail}, #{message}, sysdate)")
	void send(MsgMessage mes);
	
	@Select("select * from msg_message where receiveEmail=#{email}")
	List<MsgMessage> allMessage(String email);
}
