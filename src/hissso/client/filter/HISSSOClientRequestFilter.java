package hissso.client.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
import dvdms.bean.ApplicationErrorLogRptBean;
import dvdms.service.ApplicationErrorLogRptDtlService;
import dvdms.service.SpringBeanManager;*/

import hisglobal.vo.HospitalMstVO;
import hisglobal.vo.UserVO;
import hissso.config.HISSSOClientConfig;
import hissso.config.HISSSOConfig;
import hissso.config.HISSSOSupport;
import hissso.services.HISSSOServiceCLN;
import hissso.ticket.HISServiceGrantTicket;
import hissso.ticket.HISServiceTicket;
import hissso.ticket.registry.HISTicketRegistry;
import hissso.validation.credentails.authorization.HISService;
import mms.hisglobal.config.HISConfig;
import vo.usermgmt.HospitalMasterVO;
import vo.usermgmt.UserMasterVO;

public class HISSSOClientRequestFilter implements Filter {
	// private FilterConfig objFilterConfig;

	//private ApplicationErrorLogRptDtlService errorService;

	public void init(FilterConfig objFilterConfig) {
		// this.objFilterConfig = objFilterConfig;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest objRequest = (HttpServletRequest) request;
		HttpServletResponse objResponse = (HttpServletResponse) response;
		boolean authenticate = false, authenticatioRequired = true;
		HISServiceTicket objHISServiceTicket = null;
		String strURI = "";
		try {
			strURI = objRequest.getRequestURI();

			/*
			 * System.out.println("strURI :: "+strURI);
			 * 
			 * 
			 * if(!(objRequest.getHeader("Referer") != null &&
			 * objRequest.getHeader("Referer").trim().length() > 0)) {
			 * 
			 * System.out.println("inside referer");
			 * 
			 * RequestDispatcher rd = null; rd =
			 * objRequest.getRequestDispatcher(HISSSOConfig.
			 * SSO_AUTHENTICATION_ERROR_PAGE_URL); rd.forward(objRequest, objResponse);
			 * 
			 * return; }
			 */

		 	
			// Skipping URLs that can be accessed without Login into AHIMS
			// strURI.endsWith(".js") || strURI.endsWith(".css") ||   strURI.contains("msowebsite/websiteHome/getwebsiteHome.mso") 
			if (strURI.contains(HISSSOClientConfig.SSO_ST_SERVICE_URL) ||  strURI.contains("/circular/")|| strURI.contains("/tutorial/")|| strURI.contains("/itCell/")|| strURI.contains("/msowebsite/")     ) {
				// Forward as-it-is
				chain.doFilter(request, response);
			} else {
				// Fetch Module ST Registry
				HISTicketRegistry registry = HISSSOSupport.getSSORegister(objRequest);

				String strServiceTicketId = "";
				// Check Session Validation

				HttpSession session = objRequest.getSession(false);

				// System.out.println("Registration :: HisRequestLoginFilter");
				if (session != null) {
					// System.out.println("session is not NULL");
					// If Session Already Exists
					// Fetch ST Id from Session
					strServiceTicketId = (String) session.getAttribute(HISSSOConfig.LOGGEDIN_USER_SERVICE_TICKET_ID);

					// Check the same in Registry
					if (strServiceTicketId == null || registry.getTicket(strServiceTicketId) == null) {
						authenticate = false;
						authenticatioRequired = true;
					} else {
						objHISServiceTicket = (HISServiceTicket) registry.getTicket(strServiceTicketId);

						String reqGrantingTicketId = (String) objRequest
								.getParameter(HISSSOConfig.LOGGEDIN_USER_GRANTING_TICKET_ID_VAR);
						// System.out.println("Session::reqGrantingTicketId ----:" +
						// reqGrantingTicketId);

						if (reqGrantingTicketId != null && !reqGrantingTicketId.equals("")
								&& !reqGrantingTicketId.equals(objHISServiceTicket.getGrantingTicketId())) {
							// System.out.println("Here------------");
							authenticate = false;
							authenticatioRequired = true;
						} else {
							// If get ticket then update ticket and go ahead
							// Authenticate
							authenticate = true;
							authenticatioRequired = false;

							// if expired
							if (objHISServiceTicket.isExpired()) {
								// create new session
								objRequest.getSession().invalidate();
								session = objRequest.getSession();

								// Set TGT inSession
								session.setAttribute(HISSSOConfig.LOGGEDIN_USER_GRANTING_TICKET_ID,
										objHISServiceTicket.getGrantingTicketId());

								// associate with ST
								objHISServiceTicket.associateServiceAtClient(session);
							}
						}
					}
				} else {
					// If session not exists
					// Get TGT ID from Request
					// If found check from SSO

					// System.out.println("session is NULL");
					String grantingTicketId = (String) objRequest
							.getParameter(HISSSOConfig.LOGGEDIN_USER_GRANTING_TICKET_ID_VAR);
					// System.out.println("grantingTicketId :" + grantingTicketId);

					if (grantingTicketId == null) {
						authenticate = false;
						authenticatioRequired = false;
					} else {
						authenticate = false;
						authenticatioRequired = true;
					}
				}

				if (authenticatioRequired) {
					// System.out.println("inside if(authenticatioRequired)");
					String grantingTicketId = (String) objRequest
							.getParameter(HISSSOConfig.LOGGEDIN_USER_GRANTING_TICKET_ID_VAR);

					HISService objHISService = HISSSOSupport.getHISServiceObject(objRequest);

					// REquest SSO Service for Valid ST
					HISServiceGrantTicket objGrantTicket = authenticateAccess(grantingTicketId, objHISService,
							objRequest);
					if (objGrantTicket != null) {
						// System.out.println("GrantTicket ID :" + objGrantTicket.getTicketId());
						authenticate = true;

						// Check Is User Already have a Service Ticket based on
						// UserId, IP Address
						// HISServiceTicket objST = (HISServiceTicket)
						// registry.getTicketBasedOn(objGrantTicket.getAuthentication().getVarUserId(),
						// objGrantTicket.getAuthentication().getVoUser().getVarIPAddress());

						// Check Is User Already have a Service Ticket based on
						// UserId, IP Address and Session Id
						// This session id was appended to resolve the issue of session expiry in case
						// of same user id login from different machines on Global IP
						HISServiceTicket objST = (HISServiceTicket) registry.getTicketBasedOn(
								objGrantTicket.getAuthentication().getVarUserId(),
								objGrantTicket.getAuthentication().getVoUser().getVarIPAddress(),
								objRequest.getSession());
						// If ticket exist, logout and delete the old ticket
						if (objST != null) {
							objST.logout();
							registry.deleteTicket(objST.getTicketId());
						}

						// Setting Session Credentials, New Session, Session Expiration,
						// Creating New Session
						objRequest.getSession().invalidate();
						HttpSession objSession = objRequest.getSession();

						// Set TGT inSession
						objSession.setAttribute(HISSSOConfig.LOGGEDIN_USER_GRANTING_TICKET_ID, grantingTicketId);

						// Set Session Detail in ST
						objHISServiceTicket = new HISServiceTicket(objGrantTicket, objSession);

						// Register ST in Registry
						// registry.addTicket(objHISServiceTicket);

						// This session id was appended to resolve the issue of session expiry in case
						// of same user id login from different machines on Global IP
						registry.addTicket(objHISServiceTicket, objSession);
						// Set Credentials in Session
						setCredentialsInSession(objSession, objHISServiceTicket);
					} else {
						// If User Not Authenticated by WS, then not valid
						authenticate = false;
					}
				}

				if (authenticate) {
					// Check for URI Authorization here If not set -------
					if (objHISServiceTicket.getAuthorization().isAuthorizedURL(strURI)) {
						chain.doFilter(request, response);
					} else {
						RequestDispatcher rd = null;
						rd = objRequest.getRequestDispatcher(HISSSOConfig.SSO_AUTHORIZATION_ERROR_PAGE_URL);
						rd.forward(objRequest, objResponse);
					}
				} else {
					RequestDispatcher rd = null;
					rd = objRequest.getRequestDispatcher(HISSSOConfig.SSO_AUTHENTICATION_ERROR_PAGE_URL);
					rd.forward(objRequest, objResponse);
				}
			}
		} catch (Exception e) {

			e.printStackTrace();

			/*
			 * Integer hospitalCode = 0; Integer seatId = 0;
			 * 
			 * if (objRequest.getSession().getAttribute("HOSPITAL_CODE") != null) {
			 * 
			 * hospitalCode =
			 * Integer.valueOf(String.valueOf(objRequest.getSession().getAttribute(
			 * "HOSPITAL_CODE"))); seatId =
			 * Integer.valueOf(objRequest.getSession().getAttribute("SEATID").toString()); }
			 * 
			 * if (!e.getMessage().
			 * contains("An established connection was aborted by the software in your host machine"
			 * )) {
			 * 
			 * // log error to database Integer errorId = logError(e.getMessage(),
			 * getStackTrace(e), strURI, hospitalCode, seatId);
			 * 
			 * objRequest.setAttribute("errorId", errorId);
			 * objRequest.setAttribute("errorMsg", getStackTrace(e));
			 * 
			 * }
			 */

			RequestDispatcher rd = null;
			rd = objRequest.getRequestDispatcher(HISSSOConfig.SSO_UNKNOWN_ERROR_PAGE_URL);
			rd.forward(objRequest, objResponse);
		} catch (Throwable e) {

			e.printStackTrace();

			Integer hospitalCode = 0;
			Integer seatId = 0;

			/*
			 * if (objRequest.getSession().getAttribute("HOSPITAL_CODE") != null) {
			 * 
			 * hospitalCode =
			 * Integer.valueOf(String.valueOf(objRequest.getSession().getAttribute(
			 * "HOSPITAL_CODE"))); seatId =
			 * Integer.valueOf(objRequest.getSession().getAttribute("SEATID").toString()); }
			 * 
			 * if (!e.getMessage().
			 * contains("An established connection was aborted by the software in your host machine"
			 * )) {
			 * 
			 * // log error to database Integer errorId = logError(e.getMessage(),
			 * getStackTrace(e), strURI, hospitalCode, seatId);
			 * 
			 * objRequest.setAttribute("errorId", errorId);
			 * objRequest.setAttribute("errorMsg", getStackTrace(e));
			 * 
			 * }
			 */
			 
			RequestDispatcher rd = null;
			rd = objRequest.getRequestDispatcher(HISSSOConfig.SSO_UNKNOWN_ERROR_PAGE_URL);
			rd.forward(objRequest, objResponse);
		}

	}

	public void destroy() {

	}

	// Authenticate User By Calling Authenticate SSO Service
	private HISServiceGrantTicket authenticateAccess(String strGrantingTicketId_p, HISService objService_p,
			HttpServletRequest objRequest) {
		HISServiceGrantTicket objGrantTicket = null;
		try {
			HISSSOServiceCLN objHISSSOServiceClient = new HISSSOServiceCLN();
			objGrantTicket = objHISSSOServiceClient.authenticate(strGrantingTicketId_p, objService_p, objRequest);
		} catch (Exception e) {
			e.printStackTrace();
			objGrantTicket = null;
		}
		return objGrantTicket;
	}

	// Setting Credential in Session
	private boolean setCredentialsInSession(HttpSession objSession_p, HISServiceTicket objST_p) {
		boolean flg = true;
		try {
			
			
			objSession_p.setMaxInactiveInterval(20*60);
			
			
			// User VO
			UserMasterVO voUser = objST_p.getAuthentication().getVoUser();
			UserVO voGlobalUser = new UserVO();
			populateData(voGlobalUser, voUser);

			voGlobalUser.setVarLanguage(voUser.getVarLanguage());

			objSession_p.setAttribute(HISConfig.USER_VO, voGlobalUser);
			objSession_p.setAttribute("SEATID", voGlobalUser.getUserId());
			objSession_p.setAttribute("IP_ADDR", voGlobalUser.getIpAddress());

			// Hospital VO
			HospitalMasterVO voHospital = objST_p.getAuthentication().getVoHostpital();
			HospitalMstVO voGlobalHospital = new HospitalMstVO();
			populateData(voGlobalHospital, voHospital);
			objSession_p.setAttribute(HISConfig.HOSPITAL_VO, voGlobalHospital);
			objSession_p.setAttribute("HOSPITAL_CODE", voGlobalHospital.getHospitalCode());
			objSession_p.setAttribute(HISConfig.SYSDATEOBJECT,
					objST_p.getAuthentication().getVoUserLog().getVarUserLoginDate());
			// System.out.println("-------date----" +
			// objST_p.getAuthentication().getVoUserLog().getVarUserLoginDate());

			objSession_p.setAttribute("HOSPITAL_CODE", voGlobalUser.getHospitalCode());

			objSession_p.setAttribute("SEATID", voGlobalUser.getSeatId());
			objSession_p.setAttribute("USERID", voGlobalUser.getUserId());
			objSession_p.setAttribute("USER_NAME", voGlobalUser.getUserName());
			objSession_p.setAttribute("USER_LEVEL", voGlobalUser.getUserLevel());
			objSession_p.setAttribute("UserFullName", voGlobalUser.getUsrName());

			objSession_p.setAttribute("LANGUAGE", voGlobalUser.getVarLanguage());

		} catch (Exception ee) {
			flg = false;
		}
		return flg;
	}

	private void populateData(Object objTarget, Object objSource) {
		if (objSource instanceof UserMasterVO && objTarget instanceof UserVO) {
			UserMasterVO objSrc = (UserMasterVO) objSource;
			UserVO objTar = (UserVO) objTarget;
			objTar.setUserId(objSrc.getVarUserId()); // User ID
			objTar.setSeatId(objSrc.getVarUserId()); // User ID
			objTar.setUserSeatId(objSrc.getVarUserSeatId()); // Seat ID
			objTar.setHospitalCode(objSrc.getVarHospitalCode());
			objTar.setIpAddress(objSrc.getVarIPAddress());
			objTar.setUserEmpID(objSrc.getVarEmpNo());
			objTar.setUserLevel(objSrc.getVarUserLevel());
			objTar.setUsrName(objSrc.getVarUsrName());
			objTar.setUserName(objSrc.getVarUserName()); // Login User Name
			objTar.setDesignation(objSrc.getVarDesignation());
			objTar.setDistrictCode(objSrc.getVarDistrictId());
			objTar.setEmailId(objSrc.getVarEmailId());
			objTar.setMobileNo(objSrc.getVarMobileNumber());
			objTar.setDistrictName(objSrc.getVarDistrictName());

			objTar.setVarLanguage(objSrc.getVarLanguage());

			// Other User Details
			objTar.setUserType(objSrc.getVarUserTypeId());
			objTar.setSwapcardNo(objSrc.getVarSwapcardNumber());
		} else if (objSource instanceof HospitalMasterVO && objTarget instanceof HospitalMstVO) {
			HospitalMasterVO objSrc = (HospitalMasterVO) objSource;
			HospitalMstVO objTar = (HospitalMstVO) objTarget;
			objTar.setHospitalCode(objSrc.getVarHospitalCode());
			objTar.setHospitalName(objSrc.getVarHospitalName());
			objTar.setHospitalShortName(objSrc.getVarHospitalShortName());

			objTar.setAddress1(objSrc.getVarHospitalAddress1());
			objTar.setAddress2(objSrc.getVarHospitalAddress2());
			objTar.setCity(objSrc.getVarCity());
			objTar.setEmail(objSrc.getVarEmail());
			objTar.setPhone(objSrc.getVarPhone());
			objTar.setFax(objSrc.getVarFax());
			objTar.setDistrictCode(objSrc.getVarDistrictId());
			objTar.setState(objSrc.getVarStateCode());
			objTar.setPinCode(objSrc.getVarPinCode());
			objTar.setDistrictName(objSrc.getVarDistrictName());
			objTar.setStateName(objSrc.getVarStateName());

			objTar.setLanguageCode(objSrc.getVarLanguageCode());
			objTar.setLocalLangCode(objSrc.getVarLocalLangCode());
			objTar.setLanguageName(objSrc.getVarLanguageName());
			objTar.setLocalLangName(objSrc.getVarLocalLangName());

			// Other Hospital Details
			objTar.setContactPerson(objSrc.getVarContactPerson());
			objTar.setHospitalTypeCode(objSrc.getVarHospitalType());
			objTar.setHospitalTypeName(objSrc.getVarHospitalTypeName());
			objTar.setBedCapacity(objSrc.getVarBedCapacity());
			objTar.setBusRouteNo(objSrc.getVarBusRouteNo());
			objTar.setHospitalCategory(objSrc.getVarHospitalCategory());
			objTar.setIsAssociated(objSrc.getVarIsAssociated());
			objTar.setLunchTimings(objSrc.getVarLunchBreak());
			objTar.setOrgType(objSrc.getVarOrganizationType());
			objTar.setRemarks(objSrc.getVarRemarks());
			objTar.setSaturdayTimings(objSrc.getVarSaturdayTimings());
			objTar.setWeekdayTimings(objSrc.getVarWeekdaysTimings());
			objTar.setPanNo(objSrc.getVarPANNo());
			objTar.setTanNo(objSrc.getVarTANNo());
			objTar.setUserLiscenceAllowed(objSrc.getVarUserLicenseAllowed());
		}
	}

	private static String getStackTrace(final Throwable throwable) {
		final StringWriter sw = new StringWriter();
		final PrintWriter pw = new PrintWriter(sw, true);
		throwable.printStackTrace(pw);

		return sw.toString();
	}

	/*
	 * private Integer logError(String error, String fullError, String url, Integer
	 * hospitalCode, Integer seatId) {
	 * 
	 * ApplicationErrorLogRptBean errorLog = new ApplicationErrorLogRptBean();
	 * 
	 * errorLog.setGnumHospitalCode(hospitalCode); errorLog.setGnumSeatId(seatId);
	 * 
	 * errorLog.setGnumIsvalid(1);
	 * 
	 * errorLog.setGstrErrorMsg(error); errorLog.setGstrModuleName("DVDMS");
	 * 
	 * errorLog.setGstrFullErrorMsg(fullError);
	 * 
	 * errorLog.setGstrFileName(url);
	 * 
	 * if (errorService == null) { errorService =
	 * SpringBeanManager.getBean(ApplicationErrorLogRptDtlService.class); }
	 * 
	 * return errorService.save(errorLog);
	 * 
	 * }
	 */

}
