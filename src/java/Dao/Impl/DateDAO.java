/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao.Impl;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import Model.DateFormat;

/**
 *
 * @author LENOVO
 */
public class DateDAO {

    //Calendar now
    public Calendar cal() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal;
    }

    //get date 4 ---------------------------------------------------------------------------------------------------------
    public java.sql.Date getCurrentDate() {
        cal().add(Calendar.DATE, 1);
        return convertJavaDateToSqlDate(cal().getTime());
    }

    public ArrayList<Date> getDateOfLast7Day() {
        ArrayList<Date> output = new ArrayList<>();
        Calendar cal = Calendar.getInstance();
// get starting date
        cal.add(Calendar.DAY_OF_YEAR, -6);
// loop adding one day in each iteration
        for (int i = 0; i < 6; i++) {
            cal.add(Calendar.DAY_OF_YEAR, 1);
            output.add(convertJavaDateToSqlDate(cal.getTime()));
        }
        return output;
    }

    public ArrayList<Date> getDateOfCurrentWeek() {
        ArrayList<Date> dates = new ArrayList<>();
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        for (int i = Calendar.MONDAY; i <= Calendar.SATURDAY; i++) {
            cal.set(Calendar.DAY_OF_WEEK, i);
            dates.add(convertJavaDateToSqlDate(cal.getTime()));
        }
        cal.add(Calendar.DATE, 1);
        dates.add(convertJavaDateToSqlDate(cal.getTime()));
        return dates;
    }

    public ArrayList<Date> getDateOfNextWeek(int times) {
        ArrayList<Date> dates = new ArrayList<>();
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        if (times < 0) {
            return getDatesOfLastWeek(times);
        }
        for (int i = 0; i < times; i++) {
            cal.add(Calendar.DATE, 7);
        }
        for (int i = Calendar.MONDAY; i <= Calendar.SATURDAY; i++) {
            cal.set(Calendar.DAY_OF_WEEK, i);
            dates.add(convertJavaDateToSqlDate(cal.getTime()));
        }
        cal.add(Calendar.DATE, 1);
        dates.add(convertJavaDateToSqlDate(cal.getTime()));
        return dates;
    }

    public ArrayList<Date> getDatesOfLastWeek(int times) {
        ArrayList<Date> dates = new ArrayList<>();
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        if (times > 0) {
            return getDateOfNextWeek(times);
        }
        for (int i = 0; i < (-times); i++) {
            cal.add(Calendar.DATE, -7);
        }
        for (int i = Calendar.MONDAY; i <= Calendar.SATURDAY; i++) {
            cal.set(Calendar.DAY_OF_WEEK, i);
            dates.add(convertJavaDateToSqlDate(cal.getTime()));
        }
        cal.add(Calendar.DATE, 1);
        dates.add(convertJavaDateToSqlDate(cal.getTime()));
        return dates;
    }

    //get day ---------------------------------------------------------------------------------------------------------
    public String getDayFromDate(java.sql.Date date) {
        String[] days = new String[getDayOfWeekFormat().size()];
        days = getDayOfWeekFormat().toArray(days);
        String[] input = date.toString().split("-");
        int d = Integer.parseInt(input[2]);
        int m = Integer.parseInt(input[1]);
        int y = Integer.parseInt(input[0]);
        if (m < 3) {
            m += 12;
            y -= 1;
        }
        int k = y % 100;
        int j = y / 100;
        int day = ((d + (((m + 1) * 26) / 10) + k + (k / 4) + (j / 4)) + (5 * j)) % 7;
        return days[day];
    }

    //format date 7 ---------------------------------------------------------------------------------------------------------
    public java.sql.Date convertJavaDateToSqlDate(java.util.Date date) {
        return new java.sql.Date(date.getTime());
    }

    public String getDateFormat(java.sql.Date date) {
        String[] input = date.toString().split("-");
        String d = input[2];
        String m = input[1];
        return d + "-" + m;
    }

    public ArrayList<String> getDateFormat(ArrayList<java.sql.Date> dates) {
        ArrayList<String> output = new ArrayList<>();
        for (java.sql.Date d : dates) {
            output.add(getDateFormat(d));
        }
        return output;
    }

    public ArrayList<DateFormat> getCurrentDatesFormat() {
        ArrayList<String> dates = getDateFormat(getDateOfCurrentWeek());
        ArrayList<String> days = getDayOfWeekFormat();
        ArrayList<DateFormat> output = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            output.add(new DateFormat(days.get(i), dates.get(i)));
        }
        return output;
    }

    public ArrayList<DateFormat> getLastDatesFormat(int times) {
        ArrayList<String> dates = getDateFormat(getDatesOfLastWeek(times));
        ArrayList<String> days = getDayOfWeekFormat();
        ArrayList<DateFormat> output = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            output.add(new DateFormat(days.get(i), dates.get(i)));
        }
        return output;
    }

    public ArrayList<DateFormat> getNextDatesFormat(int times) {
        ArrayList<String> dates = getDateFormat(getDateOfNextWeek(times));
        ArrayList<String> days = getDayOfWeekFormat();
        ArrayList<DateFormat> output = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            output.add(new DateFormat(days.get(i), dates.get(i)));
        }
        return output;
    }

    public java.sql.Date getDateWithoutTimeUsingFormat(java.sql.Date date) {
        return java.sql.Date.valueOf(date.toLocalDate());
    }

    //day format ---------------------------------------------------------------------------------------------------------
    public ArrayList<String> getDayOfWeekFormat() {
        ArrayList<String> output = new ArrayList<>();
        output.add("Monday");
        output.add("Tuesday");
        output.add("Wednesday");
        output.add("Thursday");
        output.add("Friday");
        output.add("Saturday");
        output.add("Sunday");
        return output;
    }

    //date method ---------------------------------------------------------------------------------------------------------
    public java.sql.Date createDate(String date) throws ParseException {
        SimpleDateFormat textFormat = new SimpleDateFormat("yyyy-MM-dd");
        String paramDateAsString = date;
        java.util.Date myDate = textFormat.parse(paramDateAsString);
        return new java.sql.Date(myDate.getTime());
    }

    public int isDateEqual(java.sql.Date date1, java.sql.Date date2) {
        return date1.compareTo(date2);
    }

//    public boolean isBetween(java.sql.Date date, java.sql.Date from, java.sql.Date to){
//        
//    }
    public String getSemester() {
        //get time
        //get month, year
        //trans to representative semsester
        java.sql.Date date = convertJavaDateToSqlDate(cal().getTime());
        String[] input = date.toString().split("-");
        int m = Integer.parseInt(input[1]);
        String y = input[0];
        String semester = "";
        if (m >= 1 && m <= 4) {
            semester = "SP";
        } else if (m >= 5 && m <= 8) {
            semester = "SU";
        } else {
            semester = "FA";
        }
        return semester + y.substring(2, 4);
    }

}
