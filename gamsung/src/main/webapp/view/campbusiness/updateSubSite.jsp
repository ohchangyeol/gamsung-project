<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="utf-8">

	<!-- Bootstrap, jQuery CDN -->
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<script src="/resources/lib/jquery/jquery.js"></script>
    <script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
  	<script src="/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
  	<link rel="stylesheet" href="/resources/lib/bootstrap/css/bootstrap.min.css"></link>  	
  	
  	
  	<!-- ### headerCampBusiness resources Start ### -->
  	<script src="/resources/lib/jquery/jquery.js"></script>
    
    <!-- Favicons -->
    <meta name="msapplication-TileImage" content="/resources/images/favicons/ms-icon-144x144.png">    
    <meta name="msapplication-TileColor" content="#ffffff">  
    <meta name="theme-color" content="#ffffff">
   
    <!-- Stylesheets -->
    
    <!-- Default stylesheets-->
    <link href="/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template specific stylesheets-->
    <link href="/resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="/resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="/resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="/resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="/resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="/resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">       
    
    <!-- Main stylesheet and color file-->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="/resources/css/colors/default.css" rel="stylesheet">  
  	<!-- ### headerCampBusiness resources End ### -->
	
	<!-- CSS -->
	<style>
		body > div.container{
			margin-top: 30px;
		}
		
		.form-horizontal .control-label{
    		text-align: left;
		}
    </style>

	<!-- JavaScript -->
	<script type="text/javascript">
	
	// ??????
	$(function() {
		
		$("#update").on("click" , function() {
			alert("???????????? ????????? ???????????????.");
			$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateSubSite").attr("enctype","multipart/form-data").submit();
		});
		
		$("#cancle").on("click" , function() {
			alert("????????? ?????? ???????????????.");
			history.go(-1);
		});			

	});

</script>		

</head>

<body>

	<!-- ToolBar -->
	<jsp:include page="/view/common/headerCampBusiness.jsp" />

	<!-- Page Start -->
	<div class="container">
	
	<div class="col-sm-2"></div>
		<div class="col-sm-10">

		<div class="page-header">
	       <h1 class=" text-info">???????????? ??????</h1>
	    </div>

		<!-- Form Start -->
		<form class="form-horizontal" >
		 	
		<input type="hidden" name="campNo" id="campNo" value="${campSession.campNo}">
		
		<div class="form-group">
			<label for="subSiteNo" class="col-sm-offset-1 col-sm-3 control-label">?????? ??????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="subSiteNo" name="subSiteNo" value="${subSite.subSiteNo}" readonly>
				</div>
		</div>
		
		<div class="form-group">
			<label for="subSiteRegDate" class="col-sm-offset-1 col-sm-3 control-label">?????? ??????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="subSiteRegDate" name="subSiteRegDate" value="${subSite.subSiteRegDate}" readonly>
				</div>
		</div>
			
		<div class="form-group">
			<label for="subSiteType" class="col-sm-offset-1 col-sm-3 control-label">???????????? ??????</label>
			<div class="col-sm-4">
				<select name="subSiteType" class="form-control" >
					<option value="??????" ${! empty subSite.subSiteType && subSite.subSiteType eq '??????' ? "selected" : "" }>??????</option>
					<option value="??????" ${! empty subSite.subSiteType && subSite.subSiteType eq '??????' ? "selected" : "" }>??????</option>
					<option value="??????" ${! empty subSite.subSiteType && subSite.subSiteType eq '??????' ? "selected" : "" }>??????</option>
					<option value="?????????" ${! empty subSite.subSiteType && subSite.subSiteType eq '?????????' ? "selected" : "" }>?????????</option>
					<option value="????????????" ${! empty subSite.subSiteType && subSite.subSiteType eq '????????????' ? "selected" : "" }>????????????</option>
					<option value="????????????" ${! empty subSite.subSiteType && subSite.subSiteType eq '????????????' ? "selected" : "" }>????????????</option>
					<option value="???????????????" ${! empty subSite.subSiteType && subSite.subSiteType eq '???????????????' ? "selected" : "" }>???????????????</option>
					<option value="?????????" ${! empty subSite.subSiteType && subSite.subSiteType eq '?????????' ? "selected" : "" }>?????????</option>
				</select>
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="subSiteName" class="col-sm-offset-1 col-sm-3 control-label">???????????? ??????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="subSiteName" name="subSiteName" value="${subSite.subSiteName}">
				</div>
		</div>

		
		<div class="form-group">
			<label for="subSiteImgFile" class="col-sm-offset-1 col-sm-3 control-label">???????????? ?????????</label>				
				<div class="col-sm-4">
					<img src="/uploadFiles/campimg/campbusiness/subSite/${subSite.subSiteImg}" />
					<span>????????????<input type="file"  id="subSiteImgFile" name="subSiteImgFile" ></span>			
				</div>
		</div>
		
		<div class="form-group">
			<label for="subSiteInfo" class="col-sm-offset-1 col-sm-3 control-label">???????????? ??????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="subSiteInfo" name="subSiteInfo" value="${subSite.subSiteInfo}">
				</div>
		</div>
		
		</form>
		<!-- Form End -->
		
		<br>
		<div class="row">
			<div class="form-group">		
				<div class="col-xs-1 col-xs-offset-1">
					<button id="cancle" type="button" class="btn btn-danger">??????</button>
				</div>
				
				<div class="col-xs-1 col-xs-offset-5">
					<button id="update" type="button" class="btn btn-primary">??????</button>
				</div>			
			</div>
		</div>	
		
	</div>
	
 	</div>
	<!-- Page End -->

</body>

</html>