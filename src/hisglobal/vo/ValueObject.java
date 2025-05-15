/**********************************************************
 Project:	   DWH_MSO	
 File:         ValueObject.java
 Created:      Jul 8, 2014
 Last Changed: Jul 8, 2014
 Author:       manish

This code is copyright (c) 2014 C-DAC Noida.

 ***********************************************************/
package hisglobal.vo;

/**
 * The ValueObject class must be the superclass of any value object that is to
 * be used for data transfer.
 * 
 * @author AHIS
 */

public abstract class ValueObject implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// String describe() : Provides a textual version of description and state.
	// String describeAsXMLDocument (java.lang.String fieldName) : Provides XML
	// Text for a given instance.

	// public boolean equals(java.lang.Object obj) << primary key
	// public int hashCode() << primary key
	// All other accessors and mutators in the subclass
}
