package com.platform.DAO;

import com.platform.domain.FileMain;

public interface FileDAO {

	
	
	
	public void save(FileMain fileMain);
	
	
	public void delete(FileMain fileMain);


	public FileMain find(FileMain fileMain);


	public void update(FileMain fileMain);
}
