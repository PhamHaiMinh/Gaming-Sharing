<%-- 
    Document   : index.jsp
    Created on : 01-12-2022, 13:13:16
    Author     : haimi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Dashboard</title>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['Attendance', 11],
                    ['Absent', 2]
                ]);

                var options = {
                    title: 'Staff Attendance status'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                chart.draw(data, options);
            }
        </script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Year', 'Sales', 'Expenses'],
                    ['2004', 1000, 400],
                    ['2005', 1170, 460],
                    ['2006', 660, 1120],
                    ['2006', 660, 1120],
                    ['2006', 660, 1120],
                    ['2006', 660, 1120],
                    ['2007', 1030, 540]
                ]);

                var options = {
                    title: 'Company Performance',
                    curveType: 'function',
                    legend: {position: 'bottom'}
                };

                var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

                chart.draw(data, options);
            }
        </script>
        <style>
            .diagram{
                display: flex;
                flex-direction: row;
                flex: 1;
                width: -webkit-fill-available;
            }

            .content{
                display: flex;
                flex: 1;
                flex-direction: column;
                width: 100%;
            }

            .diagram1{
                flex: 1;
            }
            .diagram2{
                flex: 1;
            }
        </style>
    </head>
    <body>
        <jsp:include page="layout/left.jsp"></jsp:include>
            <div class="d-flex flex-column mx-auto ">
                <div class="diagram">
                    <div class="diagram1" id="piechart" style="width: 50%; height: 99%;"></div>
                    <div class="diagram2" id="curve_chart" style="width: 50%; height: 99%"></div> 
                </div>
                <div class="content">
                    <h1>sdasahdusahudhsuahduhuh</h1>
                    <p style="text-align: left">sdajhsaiufiuhsudhuhdash</p>
                </div>
            </div>
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>
