package com.drugs.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Component
public class DvdmsUtil {

	
	
	private static final Map<String, String> hisPathMap = new HashMap<String, String>();

	static {

		fetchHisPathToMap();

	}
	
	/**
	 * returns combo string
	 * <code>&lt;option value='0'&gt;Select Value&lt;/option&gt; </code> based on
	 * the provided ComboOption List and defaultOptions
	 * 
	 * @param list
	 *            - list of combo options
	 * 
	 * @param defaultOption
	 *            - 0^Select Value#1^All returns
	 *            <code>&lt;option value='0'&gt;Select Value&lt;/option&gt; &lt;option value='1'&gt;All&lt;/option&gt; </code>
	 * 
	 * @param defaultValue
	 *            - the value should be selected
	 * 
	 * @return options string
	 */
	

	/**
	 * returns combo string
	 * <code>&lt;option value='0'&gt;Select Value&lt;/option&gt; </code> based on
	 * the provided defaultOptions
	 * 
	 * @param defaultOption
	 *            - 0^Select Value#1^All returns
	 *            <code>&lt;option value='0'&gt;Select Value&lt;/option&gt; &lt;option value='1'&gt;All&lt;/option&gt; </code>
	 * 
	 * @param defaultValue
	 *            - the value should be selected
	 * 
	 * @return - options string
	 */
	
	/**
	 * returns the given amount in Decimal Format.
	 * 
	 * @param amount
	 *            amount value in int, float, double.
	 * @param decimalSize
	 *            Size of the decimal in integer, 3 will convert the amount in 0.000
	 *            Format. Negative integer or zero will return the amount without
	 *            Decimals.
	 * @return amount by converting the value in decimal Format by considering the
	 *         decimalSize.
	 * @throws Exception
	 *             the exception
	 * @see #getAmountWithDecimal(String, int)
	 */

	public String getAmountWithDecimal(final double amount, final int decimalSize) {

		String strAmt = "";

		StringBuffer strPattern = new StringBuffer();

		DecimalFormat df = new DecimalFormat("0.0000");

		if (decimalSize > 0) {

			strPattern.append(".");

			for (int i = 1; i <= decimalSize; i++) {

				strPattern = strPattern.append("0");

			}

		} else {

			strPattern.append("0");

		}

		df.applyPattern(strPattern.toString());

		if (amount == 0.0 || amount == 0) {

			strAmt = "0" + strPattern.toString();

		} else {

			strAmt = df.format(amount);
		}

		if (amount < 1) {
			strAmt = "0" + strAmt;
		}

		if (df != null)

			df = null;

		if (strPattern != null)

			strPattern = null;

		return strAmt;

	}

	/**
	 * returns the given amount in Decimal Format.
	 * 
	 * @param amount
	 *            amount value in String
	 * @param decimalSize
	 *            Size of the decimal in integer, 3 will convert the amount in 0.000
	 *            Format. Negative integer or zero will return the amount without
	 *            Decimals.
	 * @return amount by converting the value in decimal Format by considering the
	 *         decimalSize.
	 * @throws Exception
	 *             when amount value other than Digits.
	 * @see #getAmountWithDecimal(double, int)
	 */

	public String getAmountWithDecimal(final String amount, final int decimalSize) {

		String strAmt = "";

		StringBuffer strPattern = new StringBuffer();

		DecimalFormat df = new DecimalFormat("0.0000");

		if (decimalSize > 0) {

			strPattern.append(".");

			for (int i = 1; i <= decimalSize; i++) {

				strPattern = strPattern.append("0");

			}

		} else {

			strPattern.append("0");

		}

		df.applyPattern(strPattern.toString());

		if (amount.equals("0") || amount == "0" || amount.equals("0.0"))

			strAmt = "0" + strPattern.toString();

		else

			strAmt = df.format(Double.parseDouble(amount));

		if (Double.valueOf(amount) < 1) {
			strAmt = "0" + strAmt;
		}
		if (df != null)

			df = null;

		if (strPattern != null)

			strPattern = null;

		return strAmt;

	}

	public String getAmountWithDecimalAndComma(final double amount, final int decimalSize) {

		String strAmt = "";
		StringBuffer strPattern = new StringBuffer();

		if (decimalSize > 0) {

			strPattern.append(".");

			for (int i = 1; i <= decimalSize; i++) {

				strPattern = strPattern.append("0");

			}

		} else {

			strPattern.append("0");

		}

		DecimalFormat format = new DecimalFormat("##,##,##,##,##,##,##0.00");

		strAmt = format.format(amount);

		return strAmt.replace("Rs.", "");

	}

	/**
	 * Returns Application Server Date dtFormat --> date format[dd/MM/yyyy,
	 * dd/MMM/yyyy etc]
	 * 
	 * if dtFormat is blank then default format is dd/MM/yyyy.
	 * 
	 * @param dtFormat
	 *            Date Format in String.
	 * @return Application Server Date in required Format.
	 * @throws Exception
	 *             the exception
	 * @see #getDSDate(String)
	 */
	public String getASDate(final String dtFormat) throws Exception {

		String dtStr = "";
		String defFormat = "";
		Calendar c = null;
		SimpleDateFormat dateFormat = null;

		defFormat = dtFormat;
		if (defFormat.equals(""))
			defFormat = "dd/MM/yyyy";

		try {
			c = Calendar.getInstance();
			dateFormat = new SimpleDateFormat(defFormat);
			dtStr = dateFormat.format(c.getTime());

		} catch (Exception e) {

			throw e;
		} finally {
			if (c != null) {
				c.clear();
				c = null;
			}
			if (dateFormat != null)
				dateFormat = null;
		}

		return dtStr;
	}

	public Integer getCurrentQuarter(final Date d) {

		Calendar c = Calendar.getInstance();
		c.setTime(d);

		int month = c.get(Calendar.MONTH);

		return (month >= Calendar.JANUARY && month <= Calendar.MARCH) ? 4
				: (month >= Calendar.APRIL && month <= Calendar.JUNE) ? 1
						: (month >= Calendar.JULY && month <= Calendar.SEPTEMBER) ? 2 : 3;

	}

	/**
	 * adds no of days from the provided date
	 * 
	 * @param date
	 *            - Date
	 * @param days
	 *            - positive integer
	 * @return
	 */
	public Date addDays(final Date date, final Integer days) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, days);

		return cal.getTime();
	}

	/**
	 * just days difference (time will not be considered)
	 * 
	 * @param dateOne
	 * @param dateTwo
	 * @return
	 */
	public Long daysBetween(final Date dateOne, final Date dateTwo) {
		long difference = (dateOne.getTime() - dateTwo.getTime()) / 86400000;
		return Math.abs(difference);
	}

	/**
	 * compares two dates and returns 0 - if both dates are same , 1 date One is
	 * greater than date Two , -1 date one is less than date two
	 * 
	 * @param dateOne
	 * @param dateTwo
	 * @return 0 , 1 , -1
	 */
	public int compareDate(final Date dateOne, final Date dateTwo) {

		long difference = (dateOne.getTime() - dateTwo.getTime()) / 86400000;
		return Long.signum(difference);
	}

	/**
	 * subtract no of days from the provided date
	 * 
	 * @param date
	 *            - Date
	 * @param days
	 *            - positive integer
	 * @return
	 */
	public Date subtractDays(final Date date, final Integer days) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, -days);

		return cal.getTime();
	}

	/**
	 * format date string to date
	 * 
	 * @param dateString
	 *            - date in string
	 * @param format
	 *            - date format
	 * @return date
	 */
	public Date stringToDate(final String dateString, final String format) {

		if (dateString == null || (dateString != null && dateString.trim().length() == 0))
			return new Date();

		SimpleDateFormat sdf = null;
		Date d = null;
		try {
			sdf = new SimpleDateFormat(getDefaultDateFormat(format));
			d = sdf.parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {

			sdf = null;
		}

		return d;

	}

	/**
	 * date to string format
	 * 
	 * @param date
	 *            - Date object
	 * @param format
	 *            - date format string
	 * @return date in provided formatted string
	 */
	public String dateToString(final Date date, final String format) {

		SimpleDateFormat sdf = new SimpleDateFormat(getDefaultDateFormat(format));
		return sdf.format(date);

	}

	/**
	 * get default date format
	 * 
	 * @param format
	 *            - provided format
	 * @return provided format or dd-MMM-yyyy (if provided format is null or empty)
	 */
	private String getDefaultDateFormat(final String format) {

		if (format == null || format.trim().length() == 0)
			return "dd-MMM-yyyy";
		else
			return format;

	}

private static void fetchHisPathToMap() {

		
		DocumentBuilderFactory dbf = null;
		DocumentBuilder db = null;
		Document doc = null;
		
		try {

			String filePath = "";
			String osType = System.getProperties().getProperty("os.name");
			
			//System.out.println("osType>>>>>>>>>>>>>>"+osType);
			if (osType.startsWith("Win")) {

				filePath = "c:/IMCS/hisPath.xml";
			} else {
				filePath = "/opt/IMCS/hisPath.xml";

			}
			

			  dbf = DocumentBuilderFactory.newInstance();
			  db = dbf.newDocumentBuilder();
			  doc = db.parse(filePath);
			NodeList nodeList = doc.getChildNodes();
			for (int i = 0; i < nodeList.getLength(); i++) {
				Node textChild = nodeList.item(i);
				NodeList childNodes = textChild.getChildNodes();
				for (int j = 0; j < childNodes.getLength(); j++) {
					Node grantChild = childNodes.item(j);
					NodeList grantChildNodes = grantChild.getChildNodes();
					for (int k = 0; k < grantChildNodes.getLength(); k++) {
						if (grantChildNodes.item(k).getTextContent() != null
								&& grantChildNodes.item(k).getTextContent()
										.trim().length() > 0) {

							hisPathMap.put(grantChildNodes.item(k).getNodeName(),
									grantChildNodes.item(k).getTextContent());
							// System.out.println(map);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			
			doc = null;
			db = null;
			dbf = null;
		 
			
		}

	}
	
	
public static String getParameterFromHisPathXML(String _Param){
	
	//System.out.println("HISUTIL::getParameterFromHisPathXML");
	String osType = null;
	String paramValue=null;
	try{
		osType = System.getProperties().getProperty("os.name");
		if(osType.startsWith("Win")){
			_Param += "_WIN";
			//paramValue = getParameterFromXML("c:/RAOL/AHIMS/hisPath.xml", _Param);
			paramValue = hisPathMap.get(_Param);
		}else{
			_Param += "_LIN";
	    	paramValue = hisPathMap.get(_Param);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	return paramValue;
}

	public String convertToIndianCurrency(String num) {
		BigDecimal bd = new BigDecimal(num);
		long number = bd.longValue();
		long no = bd.longValue();
		int decimal = (int) (bd.remainder(BigDecimal.ONE).doubleValue() * 100);
		int digits_length = String.valueOf(no).length();
		int i = 0;
		ArrayList<String> str = new ArrayList<String>();
		HashMap<Integer, String> words = new HashMap<Integer, String>();
		words.put(0, "");
		words.put(1, "One");
		words.put(2, "Two");
		words.put(3, "Three");
		words.put(4, "Four");
		words.put(5, "Five");
		words.put(6, "Six");
		words.put(7, "Seven");
		words.put(8, "Eight");
		words.put(9, "Nine");
		words.put(10, "Ten");
		words.put(11, "Eleven");
		words.put(12, "Twelve");
		words.put(13, "Thirteen");
		words.put(14, "Fourteen");
		words.put(15, "Fifteen");
		words.put(16, "Sixteen");
		words.put(17, "Seventeen");
		words.put(18, "Eighteen");
		words.put(19, "Nineteen");
		words.put(20, "Twenty");
		words.put(30, "Thirty");
		words.put(40, "Forty");
		words.put(50, "Fifty");
		words.put(60, "Sixty");
		words.put(70, "Seventy");
		words.put(80, "Eighty");
		words.put(90, "Ninety");
		String digits[] = { "", "Hundred", "Thousand", "Lakh", "Crore" };
		while (i < digits_length) {
			int divider = (i == 2) ? 10 : 100;
			number = no % divider;
			no = no / divider;
			i += divider == 10 ? 1 : 2;
			if (number > 0) {
				int counter = str.size();
				String plural = (counter > 0 && number > 9) ? "s" : "";
				String tmp = (number < 21) ? words.get(Integer.valueOf((int) number)) + " " + digits[counter] + plural
						: words.get(Integer.valueOf((int) Math.floor(number / 10) * 10)) + " "
								+ words.get(Integer.valueOf((int) (number % 10))) + " " + digits[counter] + plural;
				str.add(tmp);
			} else {
				str.add("");
			}
		}

		Collections.reverse(str);
		String Rupees = String.join(" ", str).trim();

		String paise = (decimal) > 0
				? " And Paise " + words.get(Integer.valueOf((int) (decimal - decimal % 10))) + " "
						+ words.get(Integer.valueOf((int) (decimal % 10)))
				: "";
		return "&#8377 "  + Rupees +  paise + " Only";
	}

	public String RandomString(int n) {

		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";

		StringBuilder sb = new StringBuilder(n);

		for (int i = 0; i < n; i++) {

			int index = (int) (AlphaNumericString.length() * Math.random());
			sb.append(AlphaNumericString.charAt(index));
		}
		return sb.toString();

	}

	public String getQuantityWithComma(final Long quantity) {

		String strAmt = "";

		DecimalFormat format = new DecimalFormat("##,##,##,##,##,##,##0");

		strAmt = format.format(quantity);

		return strAmt;

	}

}
