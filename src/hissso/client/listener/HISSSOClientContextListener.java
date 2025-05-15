package hissso.client.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import application.config.HISApplicationConfig;
import hissso.config.HISSSOClientConfig;

public class HISSSOClientContextListener implements ServletContextListener
{
	public void contextInitialized(ServletContextEvent objContextEvent)
	{
		ServletContext objContext = objContextEvent.getServletContext();
		
		// Application Initialization 
		new HISApplicationConfig().setApplictaionInitials(objContext);
		
		// SSO Client Initialization
		HISSSOClientConfig.initializeSSOClient(objContext);
		
		//FileTransferJobRunner.startScheduler();
		
	}

	public void contextDestroyed(ServletContextEvent objContextEvent)
	{
		
		//FileTransferJobRunner.stopScheduler();
		// Nothing to do right now for HIS
	}
}
