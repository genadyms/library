package com.gmazurkevich.training.library.service.util;

import java.util.Calendar;
import java.util.Date;

public class NextDateUtil {
	public static Date getNextDate(Date currentDate) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, 1);
		return cal.getTime();
	}

	public static Date getNextWeek(Date currentDate) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, 7);
		return cal.getTime();
	}
}
