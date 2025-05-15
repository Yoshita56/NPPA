package com.drugs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drugs.dao.GroupDAO;
import com.drugs.models.Group;
import com.drugs.service.GroupService;

@Service("groupService")
public class GroupServiceImpl implements GroupService {

	GroupDAO userDao;

	@Autowired
	public void setGroupDAO(GroupDAO userDao) {
		this.userDao = userDao;
	}

	
	public Group modify(String strHiddenId) {
		return userDao.modify(strHiddenId);
	}

	
	public List<Group> showDataTable() {
		return userDao.showDataTable();
	}
	
	
	public void save(Group user) 
	{
		userDao.save(user);
	}
	
	
	public void update(Group user) 
	{
		userDao.update(user);
	}
	
	
	public void delete(String strHiddenId) {
		userDao.delete(strHiddenId);
	}
	
	
	public int chkDuplicate(Group user) {
		return userDao.chkDuplicate(user);
	}
	
	
	public int chkDuplicateUpdate(Group user) {
		return userDao.chkDuplicateUpdate(user);
	}

	
}