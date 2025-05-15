package application.config;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
//import mms.hisglobal.utility.filetransfer.config.FTPStaticConfigurator;

import mms.hisglobal.config.HISConfig;
import mms.hisglobal.utility.SaxHandler;

public class HISApplicationConfig extends HISConfig {
	private static Map<String, Object> mapURLWiseAllowedActionURIs;

	public boolean setApplictaionInitials(ServletContext objContext) {
		boolean flg = true;
		try {
			System.out.println("Initializing Applictaion Context --> "
					+ objContext.getContextPath());

			/* Setting Configuration Static Fields */
			APPLICATION_CONTEXT = objContext.getContextPath();
			APPLICATION_TYPE = APP_TYPE.MODULE;
			APPLICATION_DESCRIPTION = "Module All :Struts 1";
			APPLICATION_SERVER_INFO = objContext.getServerInfo();
			// APPLICATION_SERVER_OS = ""
			APPLICATION_URL = "/NPPA";
			APPLICATION_SERVER_URL = "";

			// Setting Application Server IP and Port
			String strApplicationServerIP = getParameterFromHisPathXML("HIS_APPSERVER_IP");
			String strApplicationServerPort = getParameterFromHisPathXML("HIS_APPSERVER_APPPORT");
			HISConfig.HIS_SERVICES_SERVER_URL = "http://"
					+ strApplicationServerIP + ":" + strApplicationServerPort;
			System.out.println("Applictaion Server URL --> "
					+ HISConfig.HIS_SERVICES_SERVER_URL);

			// Setting FTP Server URL, User Name and Password
			String strFTPServerURL = getParameterFromHisPathXML("HIS_FTPSERVER_URL");
			String strFTPServerUsername = getParameterFromHisPathXML("HIS_FTPSERVER_USERNAME");
			String strFTPServerPassword = getParameterFromHisPathXML("HIS_FTPSERVER_PASSWORD");
			// FTPStaticConfigurator.HIS_FTP_SERVER_ADDRESS_COMPLETE =
			// strFTPServerURL;
			// FTPStaticConfigurator.HIS_FTP_SERVER_USERNAME =
			// strFTPServerUsername;
			// FTPStaticConfigurator.HIS_FTP_SERVER_PASSWORD =
			// strFTPServerPassword;
			// System.out.println("FTP Server URL, UserName, Password --> " +
			// FTPStaticConfigurator.HIS_FTP_SERVER_ADDRESS_COMPLETE
			// +", "+FTPStaticConfigurator.HIS_FTP_SERVER_USERNAME
			// +", "+FTPStaticConfigurator.HIS_FTP_SERVER_PASSWORD);

			// Setting SNOIMED CT Server URL
			String strSNOMEDServerIPPort = getParameterFromHisPathXML("HIS_SNOMEDSERVER_IPPORT");
			// HISConfig.HIS_SNOMEDCT_SERVER_URL =
			// "http://"+strSNOMEDServerIPPort;
			// System.out.println("SNOMED CT Browser Server URL --> " +
			// HISConfig.HIS_SNOMEDCT_SERVER_URL);

			// Initial Parameters
			// System.out.println(objContext.getInitParameterNames());

			// Setting Application Initial Attributes
			setApplictaionMapofAllowedURLs();
		} catch (Exception e) {
			flg = false;
			// e.printStackTrace();
		}
		return flg;
	}

	/**
	 * Gets the parameter from his path xml.
	 * 
	 * @param _Param
	 *            the _ param
	 * @return the parameter from his path xml
	 */
	public static String getParameterFromHisPathXML(String _Param) {
		String osType = null;
		String paramValue = null;
		try {
			osType = System.getProperties().getProperty("os.name");
			if (osType.startsWith("Win")) {
				_Param += "_WIN";
				paramValue = getParameterFromXML("c:/IMCS/IMCS/hisPath.xml",
						_Param);
			} else {
				_Param += "_LIN";
				paramValue = getParameterFromXML("/opt/IMCS/IMCS/hisPath.xml",
						_Param);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return paramValue;
	}

	/**
	 * Gets the parameter from xml.
	 * 
	 * @param _XMLpath
	 *            the _ xm lpath
	 * @param _Param
	 *            the _ param
	 * @return the parameter from xml
	 */
	public static String getParameterFromXML(String _XMLpath, String _Param) {
		String strResult = "";
		SaxHandler sax = null;

		try {
			sax = new SaxHandler();
			strResult = sax.getParameter(_XMLpath, _Param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sax = null;
		}
		return strResult;
	}

	private void setApplictaionMapofAllowedURLs()// ----- Not In Use Right Now
	{
		mapURLWiseAllowedActionURIs = new HashMap<String, Object>();
	}

}
