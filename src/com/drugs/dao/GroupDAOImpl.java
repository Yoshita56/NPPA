package com.drugs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.drugs.models.Group;

@Component
public class GroupDAOImpl implements GroupDAO {

	JdbcTemplate jdbcTemplate;
	
	
	@Autowired
	public GroupDAOImpl(DataSource dataSource) 
	{
		jdbcTemplate = new JdbcTemplate(dataSource);
	}


	
	public Group modify(String strHiddenId) 
	{
		//System.out.println("################## GroupDAOImpl ############### findById ################## Pass Id -- "+id);
		String strGroupId=strHiddenId.split("\\^")[0];
		String strHospitalCode=strHiddenId.split("\\^")[1];
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("strGroupId", strGroupId);
		params.put("strHospitalCode", strHospitalCode);
		//String sql = "SELECT * FROM users WHERE id=:id";

		Group result = null;
		try 
		{
			String sql = "SELECT UPPER(HSTSTR_GROUP_NAME), "
					+ "TO_CHAR(GDT_EFFECTIVE_FRM,'dd-Mon-yyyy'), GSTR_REMARKS, "
					+ "GNUM_ISVALID, HSTNUM_GROUP_ID||'^'||GNUM_HOSPITAL_CODE, HSTNUM_GROUP_ID "
					+ "FROM HSTT_GROUP_MST WHERE HSTNUM_GROUP_ID=" + strGroupId + " "
					+ "AND GNUM_HOSPITAL_CODE=" + strHospitalCode;
		    //return jdbcTemplate.queryForObject(sql,new GroupMapper());
			//result = jdbcTemplate.queryForObject(sql, params, new GroupMapper());
			result = jdbcTemplate.queryForObject(sql,new GroupModifyMapper());
		} catch (EmptyResultDataAccessException e) {
			// do nothing, return null
		}

		return result;

	}
	
	
	public List<Group> showDataTable() {

		String sql = "SELECT hstnum_group_id||'^'||gnum_hospital_code,"
				+ " initcap(hststr_group_name), to_char(gdt_effective_frm,'dd-Mon-yyyy')"
				+ " from HSTT_GROUP_MST where gnum_isvalid=1";
		
		
		List<Group> result = jdbcTemplate.query(sql, new GroupMapper());
		
		//System.out.println("################## GroupDAOImpl ############### findAll ##################  ");

		return result;

	}
	
	
	public void save(Group user) 
	{
		//System.out.println("################## 3.2  GroupDAOImpl ############### SAVE ##################  ");
		
        try
        {				
		  
        	String sql = "INSERT INTO HSTT_GROUP_MST "
        			+ "(GNUM_HOSPITAL_CODE , HSTNUM_GROUP_ID  ,HSTSTR_GROUP_NAME "
        			+ ", SSTNUM_ITEM_CAT_NO , GSTR_REMARKS , GDT_EFFECTIVE_FRM  "
        			+ ", GDT_ENTRY_DATE , GNUM_SEATID , GNUM_ISVALID, HSTNUM_GROUP_ID) "
        			+ "VALUES(998,MMS_MST.nppa_get_group_id(998,10),"
        			+ "TRIM('"+user.getStrGroupName()+"'),10,"
        			+ "TRIM('"+user.getStrRemarks()+"'),"
        			+ "TO_DATE('"+user.getStrEffectiveFrom()+"','dd-mon-yyyy'),SYSDATE,15210,1,"+ user.getStrGroupTypeId()+");";
	        //System.out.println("SQL -----  "+sql);
			int row = jdbcTemplate.update(sql); 	               
		
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        	//e.getMessage();
        }
		
	}

	
	public void update(Group user) 
	{
		//System.out.println("################## 3.A GroupDAOImpl ############### update ################## Id-- "+user.getId());
		String strGroupId=user.getStrHiddenId().split("\\^")[0];
		user.setStrGroupId(strGroupId);
		String strHospitalCode=user.getStrHiddenId().split("\\^")[1];
		user.setStrHospitalCode(strHospitalCode);
		String sql = "UPDATE HSTT_GROUP_MST SET HSTSTR_GROUP_NAME='"+user.getStrGroupName()+"', GDT_EFFECTIVE_FRM = TO_DATE('"+user.getStrEffectiveFrom()+"','dd-Mon-yyyy'), "
				   + "HSTNUM_GROUP_ID="+user.getStrGroupTypeId()+",GSTR_REMARKS='"+user.getStrRemarks()+"', "
		           + "GNUM_ISVALID='"+user.getStrIsValid()+"'" 
				   + " WHERE HSTNUM_GROUP_ID='"+user.getStrGroupId()+"'"
				   + " AND GNUM_HOSPITAL_CODE="+user.getStrHospitalCode()+"";			
		
		jdbcTemplate.update(sql);

	}
	
	
	public void delete(String strHiddenId) 
	{
		//System.out.println("################## GroupDAOImpl ############### delete ################## Id ## "+id);

		//String sql = "DELETE FROM USERS WHERE id= :id";
		//jdbcTemplate.update(sql, new MapSqlParameterSource("id", id));
		
		String strGroupId=strHiddenId.split("\\^")[0];

		String strHospitalCode=strHiddenId.split("\\^")[1];
		
		String deleteQuery = "UPDATE HSTT_GROUP_MST SET GNUM_ISVALID=0 "
				            + "WHERE HSTNUM_GROUP_ID= ? "
				            + "AND GNUM_HOSPITAL_CODE= ?";
		jdbcTemplate.update(deleteQuery,strGroupId,strHospitalCode);

	}

	
	public int chkDuplicate(Group user) 
	{
		//System.out.println("################## GroupDAOImpl ############### delete ################## Id ## "+id);

		//String sql = "DELETE FROM USERS WHERE id= :id";
		//jdbcTemplate.update(sql, new MapSqlParameterSource("id", id));
		
		String sql = "SELECT COUNT(*) FROM HSTT_GROUP_MST WHERE INITCAP(HSTSTR_GROUP_NAME)=INITCAP('"+user.getStrGroupName()+"') AND GNUM_ISVALID=1";
		System.out.println("sql-->"+sql);
		Integer total=jdbcTemplate.queryForObject(sql,Integer.class);
		System.out.println("total-->"+total);
		return total;
	}
	
	
	public int chkDuplicateUpdate(Group user) 
	{
		//System.out.println("################## GroupDAOImpl ############### delete ################## Id ## "+id);

		//String sql = "DELETE FROM USERS WHERE id= :id";
		//jdbcTemplate.update(sql, new MapSqlParameterSource("id", id));
		String strGroupId=user.getStrHiddenId().split("\\^")[0];
		user.setStrGroupId(strGroupId);
		String sql = "SELECT COUNT(*) FROM HSTT_GROUP_MST WHERE INITCAP(HSTSTR_GROUP_NAME)=INITCAP('"+user.getStrGroupName()+"') AND HSTNUM_GROUP_ID!="+user.getStrGroupId()+" AND GNUM_ISVALID=1";
		System.out.println("sql-->"+sql);
		Integer total=jdbcTemplate.queryForObject(sql,Integer.class);
		System.out.println("total-->"+total);
		return total;
	}

	public static final class GroupMapper implements RowMapper<Group> 
	{
		

		public Group mapRow(ResultSet rs, int rowNum) throws SQLException 
		{
			Group user = new Group();
			user.setStrHiddenId(rs.getString(1));
			user.setStrGroupName(rs.getString(2));
			user.setStrEffectiveFrom(rs.getString(3));
			
			System.out.println("################## GroupDAOImpl ############### GroupMapper ##################  ");
			return user;
		}
	}

	public static final class GroupModifyMapper implements RowMapper<Group> 
	{
		

		public Group mapRow(ResultSet rs, int rowNum) throws SQLException 
		{
			Group user = new Group();
			user.setStrGroupName(rs.getString(1));
			user.setStrEffectiveFrom(rs.getString(2));
			user.setStrRemarks(rs.getString(3));
			user.setStrIsValid(rs.getString(4));
			user.setStrHiddenId(rs.getString(5));
			user.setStrGroupTypeId(rs.getString(6));
			
			System.out.println("################## GroupDAOImpl ############### GroupMapper ##################  ");
			return user;
		}
	}
	
}