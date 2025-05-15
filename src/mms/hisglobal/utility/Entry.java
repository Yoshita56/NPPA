/**********************************************************
 Project:	   DWH_MSO	
 File:         Entry.java
 Created:      Jul 3, 2014
 Last Changed: Jul 3, 2014
 Author:       cdac

This code is copyright (c) 2014 C-DAC Noida.

 ***********************************************************/
package mms.hisglobal.utility;

import java.io.Serializable;
import java.util.Comparator;

// TODO: Auto-generated Javadoc
/**
 * The Class Entry.
 */
public class Entry implements Serializable, Cloneable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/** The label. */
	private String label = "";

	/** The value. */
	private String value = "";

	/**
	 * Instantiates a new entry.
	 * 
	 * @param _Label
	 *            the _ label
	 * @param _Value
	 *            the _ value
	 */
	public Entry(String _Label, String _Value) {
		this.label = _Label;
		// System.out.println("LAbel::" + this.label);
		this.value = _Value;
		// System.out.println("Value::" + this.value);
	}

	/**
	 * Instantiates a new entry.
	 */
	public Entry() {
	}

	/**
	 * Gets the label.
	 * 
	 * @return the label
	 */
	public java.lang.String getLabel() {
		return this.label;
	}

	/**
	 * Gets the value.
	 * 
	 * @return the value
	 */
	public java.lang.String getValue() {
		return this.value;
	}

	/**
	 * Sets the label.
	 * 
	 * @param label
	 *            the new label
	 */
	public void setLabel(java.lang.String label) {
		this.label = label;
	}

	/**
	 * Sets the value.
	 * 
	 * @param value
	 *            the new value
	 */
	public void setValue(java.lang.String value) {
		this.value = value;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	public String toString() {
		return ("[" + this.label + ", " + this.value + "]");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	public boolean equals(Object obj) {
		if (obj == this) // (2)
			return true;
		if (obj == null || !(obj instanceof Entry)) // (3)
			return false;
		Entry objEntry = (Entry) obj;
		System.out.println("objEnt" + objEntry.value);
		System.out.println("objEnt" + this.value);
		return (objEntry.value == null ? false : objEntry.value
				.equals(this.value));
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#hashCode()
	 */
	public int hashCode() {

		int hashValue = 0;
		hashValue = this.value.hashCode();
		return hashValue;
	}

	/**
	 * The Class EntryComparator.
	 */
	public static class EntryComparator implements Comparator {

		/*
		 * (non-Javadoc)
		 * 
		 * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
		 */
		public int compare(Object obj1, Object obj2) {

			Entry objEntry1 = ((Entry) obj1);
			Entry objEntry2 = ((Entry) obj2);
			return objEntry1.getLabel().compareTo(objEntry2.getLabel());
		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#clone()
	 */
	public Object clone() {
		Object obj = null;
		try {
			obj = super.clone();
		} catch (CloneNotSupportedException e) {

		}
		return obj;

	}
}
