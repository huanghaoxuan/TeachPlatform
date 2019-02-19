package com.platform.service;

import com.platform.domain.FileMain;

public interface FileService {

	
	
	public void save(FileMain fileMain);
	public void update(FileMain fileMain);
	
	
	public void delete(FileMain fileMain);


	public FileMain find(FileMain fileMain);
}
