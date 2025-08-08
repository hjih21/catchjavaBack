package com.smhrd.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.web.entity.Msgboard;

@Mapper
public interface MsgboardMapper {
	
	@Select("select * from msg_board")
	List<Msgboard> allBoard();

	@Insert("insert into msg_board values(idx_board.nextval, #{title}, #{writer}, #{filename},"
			+ "#{content}, sysdate, 0)")
	void insert(Msgboard board);

	@Select("select * from msg_board where idx= #{idx}")
	Msgboard detail(int idx);
	
}
