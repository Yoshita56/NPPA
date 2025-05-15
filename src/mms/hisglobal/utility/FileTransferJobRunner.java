package mms.hisglobal.utility;

import java.util.Timer;

public class FileTransferJobRunner {

	static Timer mp_timer_production = null;

	public static void startScheduler() {
		// TODO Auto-generated method stub

		mp_timer_production = new Timer();

		//System.out.println("Timer created");

		FileTransferJob ftj = new FileTransferJob();
		
		//System.out.println("Job Created");
		
		mp_timer_production.schedule(ftj, 1000, (5*60*60*1000));
		
		//System.out.println("Job Scheduled");
		

	}

	public static void stopScheduler() {

		if (mp_timer_production != null) {

			mp_timer_production.purge();
			mp_timer_production.cancel();

			mp_timer_production = null;
			
		}

	}

}