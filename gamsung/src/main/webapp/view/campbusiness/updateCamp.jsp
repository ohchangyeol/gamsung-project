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
		.form-horizontal .control-label{
    		text-align: left;
		}
    </style>

	<!-- JavaScript -->
	<script type="text/javascript">

		$(function() {
			
			$("#update").on("click" , function() {
				alert("?????????????????? ???????????????.");
				$("form").attr("method" , "POST").attr("action" , "/campBusiness/updateCamp").attr("enctype","multipart/form-data").submit();
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

		<div class="page-header">
		   <h1 class=" text-info">????????? ????????????</h1>
		</div>
		
		<!-- Form Start -->
		<div class="row">    				
	 		<form class="form-horizontal" >
	 				
	  			<input type="hidden" name="campNo" id="campNo" value="${campSession.campNo}">	
			    <input type="hidden" name="campTempSave" id="campTempSave" value="3">
			    
			    <div class="form-group">
			        <label for="campNo" class="col-xs-4 control-label">?????? ??????</label>
			            <div class="col-xs-8">
			                <input type="text" class="form-control" id="campNo" name="campNo" value="${camp.campNo}" readonly>
			            </div>
			    </div>		
			    
			    <div class="form-group">
			        <label for="campRegDate" class="col-xs-4 control-label">?????? ??????</label>
			            <div class="col-xs-8">
			                <input type="text" class="form-control" id="campRegDate" name="campRegDate" value="${camp.campRegDate}" readonly>
			            </div>
			    </div>
			                
			    <div class="form-group">
			        <label for="user.id" class="col-xs-4 control-label">???????????????ID</label>
			            <div class="col-xs-8">
			                <input type="text" class="form-control" id="user.id" name="user.id" value="${user.id}" readonly>
			            </div>
			    </div>					    
			    
			    <div class="form-group">
			        <label for="campTheme1" class="col-xs-4 control-label">?????? ??????1</label>
			        <div class="col-xs-8">
			            <select name="campTheme1" class="form-control" >
			                <option value="???" ${! empty camp.campTheme1 && camp.campTheme1 eq '???' ? "selected" : "" }>???</option>
			                <option value="??????" ${! empty camp.campTheme1 && camp.campTheme1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campTheme1 && camp.campTheme1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campTheme1 && camp.campTheme1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campTheme1 && camp.campTheme1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campTheme1 && camp.campTheme1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campTheme1 && camp.campTheme1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campTheme1 && camp.campTheme1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????????????????" ${! empty camp.campTheme1 && camp.campTheme1 eq '??????????????????' ? "selected" : "" }>??????????????????</option>	
			            </select>
			        </div>
			    </div>
			    
			    <div class="form-group">
			        <label for="campTheme2" class="col-xs-4 control-label">?????? ??????2</label>
			        <div class="col-xs-8">
			            <select name="campTheme2" class="form-control" >
			                <option value="???" ${! empty camp.campTheme2 && camp.campTheme2 eq '???' ? "selected" : "" }>???</option>
			                <option value="??????" ${! empty camp.campTheme2 && camp.campTheme2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campTheme2 && camp.campTheme2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campTheme2 && camp.campTheme2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campTheme2 && camp.campTheme2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campTheme2 && camp.campTheme2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campTheme2 && camp.campTheme2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campTheme2 && camp.campTheme2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????????????????" ${! empty camp.campTheme2 && camp.campTheme2 eq '??????????????????' ? "selected" : "" }>??????????????????</option>
			            </select>
			        </div>
			    </div>
			
			    <div class="form-group">
			        <label for="campNature1" class="col-xs-4 control-label">?????? ??????1</label>
			        <div class="col-xs-8">
			            <select name="campNature1" class="form-control" >
			                <option value="??????" ${! empty camp.campNature1 && camp.campNature1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campNature1 && camp.campNature1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="???" ${! empty camp.campNature1 && camp.campNature1 eq '???' ? "selected" : "" }>???</option>
			                <option value="??????" ${! empty camp.campNature1 && camp.campNature1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="???" ${! empty camp.campNature1 && camp.campNature1 eq '???' ? "selected" : "" }>???</option>
			                <option value="???" ${! empty camp.campNature1 && camp.campNature1 eq '???' ? "selected" : "" }>???</option>
			                <option value="??????" ${! empty camp.campNature1 && camp.campNature1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="???" ${! empty camp.campNature1 && camp.campNature1 eq '???' ? "selected" : "" }>???</option>
			            </select>
			        </div>
			    </div>
			
			    <div class="form-group">
			        <label for="campNature2" class="col-xs-4 control-label">?????? ??????2</label>
			        <div class="col-xs-8">
			            <select name="campNature2" class="form-control" >
			                <option value="??????" ${! empty camp.campNature2 && camp.campNature2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campNature2 && camp.campNature2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="???" ${! empty camp.campNature2 && camp.campNature2 eq '???' ? "selected" : "" }>???</option>
			                <option value="??????" ${! empty camp.campNature2 && camp.campNature2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="???" ${! empty camp.campNature2 && camp.campNature2 eq '???' ? "selected" : "" }>???</option>
			                <option value="???" ${! empty camp.campNature2 && camp.campNature2 eq '???' ? "selected" : "" }>???</option>
			                <option value="??????" ${! empty camp.campNature2 && camp.campNature2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="???" ${! empty camp.campNature2 && camp.campNature2 eq '???' ? "selected" : "" }>???</option>
			            </select>
			        </div>
			    </div>	
			
			    <div class="form-group">
			        <label for="campOperation1" class="col-xs-4 control-label">?????? ??????1</label>
			        <div class="col-xs-8">
			            <select name="campOperation1" class="form-control" >
			                <option value="??????" ${! empty camp.campOperation1 && camp.campOperation1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="???" ${! empty camp.campOperation1 && camp.campOperation1 eq '???' ? "selected" : "" }>??? (3???~5???)</option>
			                <option value="??????" ${! empty camp.campOperation1 && camp.campOperation1 eq '??????' ? "selected" : "" }>?????? (6???~8???)</option>
			                <option value="??????" ${! empty camp.campOperation1 && camp.campOperation1 eq '??????' ? "selected" : "" }>?????? (9???~11???)</option>
			                <option value="??????" ${! empty camp.campOperation1 && camp.campOperation1 eq '??????' ? "selected" : "" }>?????? (12???~2???)</option>
			                <option value="??????" ${! empty camp.campOperation1 && camp.campOperation1 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campOperation1 && camp.campOperation1 eq '??????' ? "selected" : "" }>??????</option>
			            </select>
			        </div>
			    </div>
			    
			    <div class="form-group">
			        <label for="campOperation2" class="col-xs-4 control-label">?????? ??????2</label>
			        <div class="col-xs-8">
			            <select name="campOperation2" class="form-control" >
			                <option value="??????" ${! empty camp.campOperation2 && camp.campOperation2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="???" ${! empty camp.campOperation2 && camp.campOperation2 eq '???' ? "selected" : "" }>??? (3???~5???)</option>
			                <option value="??????" ${! empty camp.campOperation2 && camp.campOperation2 eq '??????' ? "selected" : "" }>?????? (6???~8???)</option>
			                <option value="??????" ${! empty camp.campOperation2 && camp.campOperation2 eq '??????' ? "selected" : "" }>?????? (9???~11???)</option>
			                <option value="??????" ${! empty camp.campOperation2 && camp.campOperation2 eq '??????' ? "selected" : "" }>?????? (12???~2???)</option>
			                <option value="??????" ${! empty camp.campOperation2 && camp.campOperation2 eq '??????' ? "selected" : "" }>??????</option>
			                <option value="??????" ${! empty camp.campOperation2 && camp.campOperation2 eq '??????' ? "selected" : "" }>??????</option>
			            </select>
			        </div>
			    </div>
			    
				<div class="form-group">
			        <label for="campName" class="col-xs-4 control-label">????????? ??????</label>
			            <div class="col-xs-8">
			                <input type="text" class="form-control" id="campName" name="campName" value="${campSession.user.campName}" readonly>
			            </div>
			    </div>
			
			    <div class="form-group">
			        <label for="campCall" class="col-xs-4 control-label">????????? ????????????</label>
			            <div class="col-xs-8">
			                <input type="text" class="form-control" id="campCall" name="campCall" value="${campSession.user.campCall}" readonly>
			            </div>
			    </div>
			    
			    <div class="form-group">
			        <label for="campAddr" class="col-xs-4 control-label">????????? ??????</label>
			            <div class="col-xs-8">
			                <input type="text" class="form-control" id="campAddr" name="campAddr" value="${campSession.user.addr}" readonly>
			            </div>
			    </div>
			            
			    <div class="form-group">
			        <label for="campMapFile" class="col-xs-4 control-label">????????? ??????????????? </label>				
			            <div class="col-xs-8">
			                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campMapImg}" />
			                <input type="file"  id="campMapFile" name="campMapFile">	
			            </div>
			    </div> 
			            
			    <div class="form-group">
			    
			        <label for="campImgFile1" class="col-xs-4 control-label">????????? ???????????????(1/5)</label>
			        				
			            <div class="col-xs-8">
			                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg1}" />
			                <input type="file"  id="campImgFile1" name="campImgFile1" >		
			            </div>
			    </div>
			    
			    <div class="form-group">
			        <label for="campImgFile2" class="col-xs-4 control-label">????????? ???????????????(2/5)</label>				
			            <div class="col-xs-8">
			                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg2}" />
			                <input type="file"  id="campImgFile2" name="campImgFile2" >			
			            </div>
			    </div>
			    
			    <div class="form-group">
			        <label for="campImgFile3" class="col-xs-4 control-label">????????? ???????????????(3/5)</label>				
			            <div class="col-xs-8">
			                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg3}" />
			                <input type="file"  id="campImgFile3" name="campImgFile3" >	
			            </div>
			    </div>
			
			    <div class="form-group">
			        <label for="campImgFile4" class="col-xs-4 control-label">????????? ???????????????(4/5)</label>				
			            <div class="col-xs-8">
			                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg4}" />
			                <input type="file"  id="campImgFile4" name="campImgFile4" >		
			            </div>
			    </div>	
			
			    <div class="form-group">
			        <label for="campImgFile5" class="col-xs-4 control-label">????????? ???????????????(5/5)</label>				
			            <div class="col-xs-8">
			                <img src="../uploadfiles/campimg/campbusiness/camp/${camp.campImg5}" />
			                <input type="file"  id="campImgFile5" name="campImgFile5" >			
			            </div>
			    </div>			
				
				<div class="row">
					<div class="form-group">        
				        <label for="campSummery" class="col-xs-12 control-label">????????? ????????????</label>
					</div> 		   
				</div>
				
				<div class="row">
					<div class="col-xs-12">
				    	<textarea class="form-control" id="campSummery" rows="3" name="campSummery">${camp.campSummery}</textarea>
				    </div> 		   
				</div>
				
				<div class="row">
					<br>
					<div class="form-group">        
				       <label for="campDetail" class="col-xs-12 control-label">????????? ????????????</label>
					</div> 		   
				</div>
				
				<div class="row">
					<div class="col-xs-12">
				    	<textarea class="form-control" id="campDetail" rows="6" name="campDetail">${camp.campDetail}</textarea>	
				    </div> 		   
				</div>
				
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
	 				
	 				</form>
	 			</div>
	 			<!-- Form End -->
    			
 	</div>
	<!-- Page End -->

</body>

</html>