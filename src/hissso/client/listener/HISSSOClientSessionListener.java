package hissso.client.listener;

import hissso.config.HISSSOClientConfig;

import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class HISSSOClientSessionListener implements HttpSessionListener
{

	public void sessionCreated(HttpSessionEvent objSessionEvent)
	{
		
		objSessionEvent.getSession().setMaxInactiveInterval(20 * 60);
		
	//	System.out.println("NPPA session started for "+objSessionEvent.getSession().getId()+" @ "+new Date());
		
		// Nothing to do right now for HIS
	}

	public void sessionDestroyed(HttpSessionEvent objSessionEvent)
	{
		HttpSession objSession = objSessionEvent.getSession();

		// System.out.println("NPPA session "+objSessionEvent.getSession().getId()+"  expired @ "+new Date());
		
		// Check for SSO TGT Expiration
		HISSSOClientConfig.onSessionExpiration(objSession);
	}
}
