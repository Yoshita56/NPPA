package com.drugs.dao;

import java.util.List;

import com.drugs.models.Group;

public interface GroupDAO {

	Group modify(String strHiddenId);

	List<Group> showDataTable();
	
	void save(Group user);
	
	void update(Group user);
	
	void delete(String strHiddenId);
	
	int chkDuplicate(Group user);
	
	int chkDuplicateUpdate(Group user);

}