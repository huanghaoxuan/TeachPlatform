package com.platform.service.impl;

import org.springframework.transaction.annotation.Transactional;

import com.platform.DAO.FileDAO;
import com.platform.domain.FileMain;
import com.platform.service.FileService;

@Transactional
public class FileServiceImpl implements FileService {

	
	private FileDAO fileDAO;
	
	public FileDAO getFileDAO() {
		return fileDAO;
	}

	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}

	@Override
	public void save(FileMain fileMain) {
		fileDAO.save(fileMain);

	}

	@Override
	public void delete(FileMain fileMain) {
		fileDAO.delete(fileMain);
	}

	@Override
	public FileMain find(FileMain fileMain) {
		return fileDAO.find(fileMain);
	}

	@Override
	public void update(FileMain fileMain) {
		fileDAO.update(fileMain);
	}

}
