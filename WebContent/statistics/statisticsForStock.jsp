<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="statisticsForStock.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>문구점</title>

	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">
    <link href="${context}/css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/bootstrap.min.js"></script>

    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

    <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="${context}/js/sb-admin-2.js"></script>
    <script src="${context}/js/morris.min.js"></script>
    <script src="${context}/js/raphael.js"></script>

    <script>

	var sort;
	var url;

    $(document).ready(function(){
    	var objDonut = JSON.parse('${objDonut}');
    	var objBar = JSON.parse('${objBar}');
    	sort = '${sort}';

    	if('${sort}' != null) $("#sort").val(sort);

    	$("#sort").change(function(){
    		sort = $("#sort").val();

    		if(sort == 'stockP'){
				url = "${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=P";
    		}else if(sort == 'stockO'){
				url = "${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=O";
    		}else if(sort == 'stockS'){
				url = "${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=S";
    		}else if(sort == 'stockB'){
				url = "${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=B";
    		}else if(sort == 'stockD'){
				url = "${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=D";
    		}else if(sort == 'sell'){
    			url = "${context}/work/product/retrieveStatisticsForSell.do";
    		}

    		if(sort != 'sell'){
    			location.href = url + "&sort=" + sort;
    		}else if(sort == 'sell'){
    			location.href = url + "?sort=" + sort;
    		}
    	});

        Morris.Donut({
            element: 'donutChart',
            data: objDonut,
            resize: true
        });

        Morris.Bar({
            element: 'barChart',
            data: objBar,
            xkey: 'y',
            ykeys: ['a'],
            labels: ['수치'],
            hideHover: 'auto',
            resize: true
        });


    });

    </script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>재고현황</strong>&nbsp;<span class="glyphicon glyphicon-signal"></span></font></h1>
			<p>재고현황 페이지입니다.</p>
		</div>

		<div class="row">
			<div class="col-md-3">
				<select class="form-control" id="sort" name="sort">
					<option value="stockP">재고현황[필기류]</option>
					<option value="stockO">재고현황[사무용품]</option>
					<option value="stockS">재고현황[정리/수납용품]</option>
					<option value="stockB">재고현황[화일/바인더]</option>
					<option value="stockD">재고현황[디자인문구]</option>
					<option value="sell">판매현황</option>
				</select>
			</div>
		</div>
	    <div class="row">
			<div id="donutChart"></div>
	    </div>

		<div class="row">
			<div id="barChart"></div>
	    </div>

		<div class="row">
			<div class="col-md-1 col-md-offset-11">
				<button type="button" class="btn btn-success btn-lg"  style="float:right;" onclick="fn_back()">뒤로가기</button>
			</div>
		</div>
		<div id="printArea" style="display: none;">
		</div>
	</div>
<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
</html>