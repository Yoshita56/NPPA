package mms.hisglobal.utility;

import java.util.Date;
import java.util.TimerTask;

public class FileTransferJob extends TimerTask  {

	@Override
	public void run() {
		
		System.out.println("ftj started and running @ "+new Date());
		
		/*CopyDirectory.startCopy();
		CopyReqAcknowledge.startCopy();
		CopyResponceDirectory.startCopy();
		CopyResAcknowledge.startCopy();*/
		
		System.out.println("ftj end and running @ "+new Date());
	}

	
	
}
