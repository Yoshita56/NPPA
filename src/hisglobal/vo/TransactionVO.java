/**********************************************************
 Project:	   DWH_MSO	
 File:         TransactionVO.java
 Created:      Jul 8, 2014
 Last Changed: Jul 8, 2014
 Author:       manish

This code is copyright (c) 2014 C-DAC Noida.

 ***********************************************************/
package hisglobal.vo;

// TODO: Auto-generated Javadoc
//import java.util.*;
/**
 * TransactionVO is the class that specifies getters and setters for all the
 * identifiers which are used for retrieving and inserting information in the DB
 * tables.
 * 
 * @author AHIS
 */
public class TransactionVO extends ValueObject {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** The menu id. */
	private String menuID;

	/**
	 * Retrieves menuID.
	 * 
	 * @return Value of menuID.
	 */
	public String getMenuID() {
		return menuID;
	}

	/**
	 * Sets menuID.
	 * 
	 * @param menuID
	 *            the new menu id
	 */
	public void setMenuID(String menuID) {
		this.menuID = menuID;
	}

}
