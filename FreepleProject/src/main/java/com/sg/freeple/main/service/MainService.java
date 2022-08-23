package com.sg.freeple.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sg.freeple.main.mapper.MainSQLMapper;

@Service
public class MainService {

	@Autowired
	private MainSQLMapper mainSQLMapper;
	
}
