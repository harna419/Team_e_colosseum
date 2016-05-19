package hong.kil;

import java.util.Date;
import java.text.*;

public class DateUtil {
	private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd H:mm:ss EEEE");
	
	public static String format(Date date){
		return sdf.format(date);
	}
	//test
}//class end
