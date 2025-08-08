package com.smhrd.web.entity;

import java.time.LocalTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Position {
	private String user_id;               // user_id
    private int user_position1;           // user_position1
    private Integer user_position2;       // user_position2
    private String user_game_nick;        // user_game_nick
    private String user_special_note;     // user_special_note
    private String available_days;        // available_days (CSV 문자열)

    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime available_start;    // available_start

    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime available_end;      // available_end
}