package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Check {
    public static void main(String[] args) throws ParseException {
        String start = "2024-08-03";
        String end = "2024-08-09";
        String endRangeDate = "2024-08-30";

        System.out.println(isWithinRange(start, end, endRangeDate));
    }

    public static boolean isWithinRange(String start, String end, String endRangeDate) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = sdf.parse(start);
        Date endDate = sdf.parse(end);
        Date endRangeDateParsed = sdf.parse(endRangeDate);

        // Tính toán các ngày trong khoảng thời gian yêu cầu
        Date fourWeeksBeforeEndRangeDate = subtractWeeks(endRangeDateParsed, 4);
        Date threeWeeksBeforeEndRangeDate = subtractWeeks(endRangeDateParsed, 3);

        // Định dạng lại ngày để so sánh dễ dàng hơn
        String formattedFourWeeksBeforeEndRangeDate = sdf.format(fourWeeksBeforeEndRangeDate);
        String formattedThreeWeeksBeforeEndRangeDate = sdf.format(threeWeeksBeforeEndRangeDate);

        // Chuyển đổi lại thành Date để so sánh
        Date rangeStartDate = sdf.parse(formattedFourWeeksBeforeEndRangeDate);
        Date rangeEndDate = sdf.parse(formattedThreeWeeksBeforeEndRangeDate);

        System.out.println("fourWeeksBeforeEndRangeDate: " + formattedFourWeeksBeforeEndRangeDate);
        System.out.println("threeWeeksBeforeEndRangeDate: " + formattedThreeWeeksBeforeEndRangeDate);

        // Kiểm tra startDate và endDate có nằm trong khoảng yêu cầu hay không
        return (startDate.compareTo(rangeStartDate) >= 0 && startDate.compareTo(rangeEndDate) <= 0)
                && (endDate.compareTo(rangeStartDate) >= 0 && endDate.compareTo(rangeEndDate) <= 0);
    }

    private static Date subtractWeeks(Date date, int weeks) {
        long millisecondsPerWeek = 7L * 24 * 60 * 60 * 1000;
        return new Date(date.getTime() - weeks * millisecondsPerWeek);
    }
}
