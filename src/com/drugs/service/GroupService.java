package com.drugs.service;

import java.util.List;

import com.drugs.models.Group;

public interface GroupService {

	Group modify(String strHiddenId);
	
	List<Group> showDataTable();

	void save(Group user);
	
	void update(Group user);
	
	void delete(String strHiddenId);
	
	int chkDuplicate(Group user);
	
	int chkDuplicateUpdate(Group user);
}