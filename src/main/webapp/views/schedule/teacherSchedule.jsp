<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/15/2024
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<form id="weekForm" action="processDates" method="post">
    <label for="weekSelect">Chọn tuần:</label>
    <select id="weekSelect" name="weekSelect" onchange="updateDates()">
        <option value="" disabled>Chọn tuần</option>
        <!-- Các tuần sẽ được thêm vào đây bằng JavaScript -->
    </select>

    <input type="hidden" id="startDate" name="startDate">
    <input type="hidden" id="endDate" name="endDate">
    <input type="hidden" id="daysInWeek" name="daysInWeek">

    <button type="submit">Gửi</button>
</form>

<table id="weekTable" border="1">
    <thead>
    <tr id="weekDaysHeader">
        <td></td>
        <!-- Các ngày trong tuần sẽ được thêm vào đây bằng JavaScript -->
    </tr>
    </thead>
    <tbody id="weekTableBody">
    <!-- Nội dung của bảng -->
    </tbody>
</table>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
    function getWeeksInYear(year) {
        const weeks = [];
        let date = new Date(year, 0, 1);
        while (date.getDay() !== 1) {
            date.setDate(date.getDate() + 1);
        }
        while (date.getFullYear() === year) {
            let startOfWeek = new Date(date.getTime());
            let endOfWeek = new Date(date.getTime());
            endOfWeek.setDate(endOfWeek.getDate() + 6);
            if (endOfWeek.getFullYear() === year || (endOfWeek.getFullYear() > year && endOfWeek.getMonth() === 0)) {
                weeks.push({
                    start: formatDate(startOfWeek),
                    end: formatDate(endOfWeek)
                });
            }
            date.setDate(date.getDate() + 7);
        }
        return weeks;
    }

    function formatDate(date) {
        let d = date.getDate();
        let m = date.getMonth() + 1; // Months are zero-based
        let y = date.getFullYear();
        return y + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d);
    }

    function populateWeeks() {
        const weekSelect = document.getElementById('weekSelect');
        const currentYear = new Date().getFullYear();
        const weeks = getWeeksInYear(currentYear);

        weeks.forEach(week => {
            const option = document.createElement('option');
            option.value = week.start + ',' + week.end;
            option.text = week.start + ' - ' + week.end;
            weekSelect.add(option);
        });

        // Chọn tuần hiện tại làm mặc định
        const today = new Date();
        const currentWeek = weeks.find(week => {
            const start = new Date(week.start);
            const end = new Date(week.end);
            return today >= start && today <= end;
        });

        if (currentWeek) {
            weekSelect.value = currentWeek.start + ',' + currentWeek.end;
            updateDates();
        }
    }

    function updateDates() {
        const weekSelect = document.getElementById('weekSelect');
        const selectedValue = weekSelect.value;
        if (selectedValue) {
            const dates = selectedValue.split(',');
            const startDate = new Date(dates[0]);
            const endDate = new Date(dates[1]);
            document.getElementById('startDate').value = dates[0];
            document.getElementById('endDate').value = dates[1];
            document.getElementById('daysInWeek').value = getDaysInWeek(startDate, endDate);
            updateWeekDaysHeader(startDate, endDate);
        }
        const days = document.getElementById('daysInWeek').value;
        const fday = document.getElementById('startDate').value;
        const lday = document.getElementById('endDate').value;
        $.ajax({
            url: "${pageContext.request.contextPath}/loadTeacherSchedule",
            type: "GET",
            dataType: "JSON",
            data: {
                days: days,
                fday: fday,
                lday: lday
            },
            success: function (data) {
                var sessions = data.sessions;
                var slots = data.slots;
                var date = data.date;
                var bodyTable = $("#weekTableBody");
                bodyTable.html("");
                var htmlValue = '';
                slots.forEach(function (slot){
                    htmlValue += "<tr><td>Slot " + slot.id +"<br>"+slot.startTime + " - " + slot.endTime + "</td>";
                    date.forEach(function (d) {
                        console.log(d);
                        htmlValue += "<td>";
                        sessions.forEach(function (session) {
                            // console.log(session.slot.id);
                            // console.log(session.date);
                            if (session.slot.id === slot.id && session.date === d) {
                                htmlValue += ""+session.group.name+" - "+session.group.course.detail+" - "+session.room.detail+"<br>";
                                htmlValue += "<form action='attendance' method='GET'>";
                                htmlValue += "<input type='hidden' name='sesid' value='"+session.id+"'>";
                                if (session.isTaken) {
                                    htmlValue += "<input type='submit' value='View'>";
                                }else {
                                    htmlValue += "<input type='submit' value='Take'>";
                                }
                                htmlValue += "</form>";
                            }
                        });
                        htmlValue += "</td>";
                    })
                    htmlValue += "</tr>";
                })
                bodyTable.html(htmlValue);
            }
        });
    }

    function getDaysInWeek(startDate, endDate) {
        let dates = [];
        let currentDate = new Date(startDate);
        while (currentDate <= endDate) {
            dates.push(formatDate(currentDate));
            currentDate.setDate(currentDate.getDate() + 1);
        }
        return dates.join(',');
    }

    function updateWeekDaysHeader(startDate, endDate) {
        const weekDaysHeader = document.getElementById('weekDaysHeader');
        weekDaysHeader.innerHTML = '';
        const ts = document.createElement('th');
        weekDaysHeader.appendChild(ts);
        let currentDate = new Date(startDate);
        while (currentDate <= endDate) {
            const th = document.createElement('th');
            th.textContent = formatDate(currentDate);
            weekDaysHeader.appendChild(th);
            currentDate.setDate(currentDate.getDate() + 1);
        }
    }

    // Populate weeks on page load
    window.onload = populateWeeks;
</script>
</body>
</html>
