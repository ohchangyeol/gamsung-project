<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${auctionProduct.auctionProductName}</title>

<link rel="apple-touch-icon" sizes="57x57"	href="../../resources/images/favicons/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"	href="../../resources/images/favicons/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"	href="../../resources/images/favicons/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"	href="../../resources/images/favicons/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="../../resources/images/favicons/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="../../resources/images/favicons/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="../../resources/images/favicons/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="../../resources/images/favicons/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="../../resources/images/favicons/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192" href="../../resources/images/favicons/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="../../resources/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="../../resources/images/favicons/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="../../resources/images/favicons/favicon-16x16.png">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="../../resources/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">

<link href="../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Template specific stylesheets-->
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
<link href="../../resources/lib/animate.css/animate.css" rel="stylesheet">
<link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../../resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
<link href="../../resources/lib/flexslider/flexslider.css" rel="stylesheet">
<link href="../../resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
<link href="../../resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css"	rel="stylesheet">
<link href="../../resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
<link href="../../resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="../../resources/css/style.css" rel="stylesheet">
<link id="color-scheme" href="../../resources/css/colors/default.css" rel="stylesheet">

</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="main">
			<div class="alert alert-success" role="alert" hidden="hidden">
				<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa fa-cog fa-spin"></i><strong></strong></div>
			<div class="alert alert-info" role="alert" hidden="hidden">
				<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa fa-cutlery"></i><strong></strong></div>
			<div class="alert alert-warning" role="alert" hidden="hidden">
				<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa fa-diamond"></i><strong></strong></div>
			<div class="alert alert-danger" role="alert" hidden="hidden">
				<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa fa-coffee"></i><strong></strong></div>
			<section class="module">
				<div class="container">
					<div class="col-sm-2"></div>
					<div class="col-sm-8"><h1 class="product-title">${auctionProduct.auctionProductName}</h1></div>
					<div class="col-sm-2"></div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-4 mb-sm-40">	
						<c:if test="${!empty auctionProduct.auctionProductSubDetail}">
							<a><img src="${auctionProduct.productImg1}" alt="Single Product Image" /></a>
							 <ul class="product-gallery">
								<c:if test="${!empty auctionProduct.productImg2}">
									<li><img src="${auctionProduct.productImg2}" alt="Single Product" /></li>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg3}">
									<li><img src="${auctionProduct.productImg3}" alt="Single Product" /></li>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg4}">
									<li><img src="${auctionProduct.productImg4}" alt="Single Product" /></li>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg5}">
									<li><img src="${auctionProduct.productImg5}" alt="Single Product" /></li>
								</c:if>
							</ul>
						</c:if>
						<c:if test="${empty auctionProduct.auctionProductSubDetail}">
							<a><img src="/uploadfiles/auctionimg/product/${auctionProduct.productImg1}" alt="Single Product Image" /></a>
							 <ul class="product-gallery">
								<c:if test="${!empty auctionProduct.productImg2}">
									<li><img src="/uploadfiles/auctionimg/product/${auctionProduct.productImg2}" alt="Single Product" /></li>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg3}">
									<li><img src="/uploadfiles/auctionimg/product/${auctionProduct.productImg3}" alt="Single Product" /></li>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg4}">
									<li><img src="/uploadfiles/auctionimg/product/${auctionProduct.productImg4}" alt="Single Product" /></li>
								</c:if>
								<c:if test="${!empty auctionProduct.productImg5}">
									<li><img src="/uploadfiles/auctionimg/product/${auctionProduct.productImg5}" alt="Single Product" /></li>
								</c:if>
							</ul>
						</c:if>
						</div>
						<div class="col-sm-6">
							<div class="col-sm-12">
								<span>${registrantInfo.user.auctionGrade}LV</span>
								<span>${registrantInfo.user.id}</span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star"></i></span>
								<span><i class="fa fa-star star-off"></i></span>
								<a class="open-tab section-scroll" href="#reviews">4.0</a>
							</div>
						<div class="row mb-20">
							<div class="col-sm-12">
								<div class="price font-alt">
									<a>시작가 : ${auctionProduct.startBidPrice}원</a><br>
									<input type="hidden" id="startBidPrice" value="${auctionProduct.startBidPrice}">
									<a>희망 낙찰가 : ${auctionProduct.hopefulBidPrice}원</a><br>
									<a>입찰 단위 : ${auctionProduct.bidUnit}원</a><br>
									<input type="hidden" id="bidUnit" value="${auctionProduct.bidUnit}">
									<a>입찰 가능 등급 : ${auctionProduct.bidableGrade}LV 이상</a><br><br>
									<input type="hidden" id="bidableGrade" value="${auctionProduct.bidableGrade}">
								</div>
							</div>
						</div>
						<div class="row mb-20">
							<div class="col-sm-12">
								<div class="description">
									<span class="amount">현재입찰가</span><br>
									<span id="currentPrice" class="amount">${auctionProduct.currentBidPrice}</span>										
								</div>
							</div>
						</div>
						<input type="hidden" id="auctionProductNo" value="${auctionProduct.auctionProductNo}">
						<div class="row mb-20">
							<c:if test="${registrantInfo.user.id ne sessionScope.user.id}">
								<div class="col-sm-5">
									<a id="bidBtn" class="btn btn-lg btn-block btn-round btn-b">입찰</a>
								</div>
								<div class="col-sm-5" hidden="hidden">
									<a id="cancelBtn" class="btn btn-lg btn-block btn-round btn-b">낙찰취소</a>
								</div>
							</c:if>
							<c:if test="${registrantInfo.user.id eq sessionScope.user.id}">
								<div class="col-sm-5">
									<a id="updateBtn" class="btn btn-lg btn-block btn-round btn-b">수정</a>
								</div>
								<div class="col-sm-5">
									<a id="deleteBtn" class="btn btn-lg btn-block btn-round btn-b">중도철회</a>
								</div>
							</c:if>
						</div>
						<div class="font15 time-title"></div>
						<div class="time font40">
							<span id="auctionStartTime" hidden="hidden">${auctionProduct.auctionStartTime}</span>
							<span id="auctionEndTime" hidden="hidden">${auctionProduct.auctionEndTime}</span>
							<c:if test="${fn:indexOf(auctionProduct.remainAuctionTime,'-') == -1}">
							  <span class="hours"></span>
							  <span class="col">:</span>
							  <span class="minutes"></span>
							  <span class="col">:</span>
							  <span class="seconds"></span>
							</c:if>
						</div>
						<div class="row mb-20">
							<div class="col-sm-12">
								<div class="product_meta">
									<span id = "userInfo">
										<c:if test="${!empty auctionInfo && auctionInfo.bidderCount != 0}">
											${user.nickName}님은 ${auctionInfo.bidderCount}명 중 ${auctionInfo.bidderRank}등 입니다.'
										</c:if>
									</span>
									<input type="hidden" id="userId" value="${user.id}"/>
									<input type="hidden" id="nickName" value="${user.nickName}"/>
								</div>
							</div>
						</div>							
					</div>
					</div>
					<div class="row mt-70">
						<div class="col-sm-12">
						<div class="well well-lg"><strong id="realTimeViewCount"></strong></div>
							<ul class="nav nav-tabs font-alt" role="tablist">
								<li class="active">
									<a href="#description" data-toggle="tab">
										<span class="icon-tools-2"></span>Description
									</a>
								</li>
								<li>
									<a href="#reviews" data-toggle="tab">
										<span class="icon-tools-2"></span>Reviews (2)
									</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="description">
								<c:if test="${empty auctionProduct.auctionProductDetail}">
									<p>관리자가 등록한 상품입니다.</p>
									<p><a href="https://www.coupang.com${auctionProduct.auctionProductSubDetail}">상품 정보</a></p>								
								</c:if>
								</div>
								<div class="tab-pane" id="reviews">
									<div class="comments reviews">
										<div class="comment clearfix">
											<div class="comment-avatar">
												<img src="" alt="avatar" />
											</div>
											<div class="comment-content clearfix">
												<div class="comment-author font-alt">
													<a href="#">John Doe</a>
												</div>
												<div class="comment-body">
													<p>The European languages are members of the same
														family. Their separate existence is a myth. For science,
														music, sport, etc, Europe uses the same vocabulary. The
														European languages are members of the same family. Their
														separate existence is a myth.</p>
												</div>
												<div class="comment-meta font-alt">
													Today, 14:55 -<span><i class="fa fa-star star"></i></span><span><i
														class="fa fa-star star"></i></span><span><i
														class="fa fa-star star"></i></span><span><i
														class="fa fa-star star"></i></span><span><i
														class="fa fa-star star-off"></i></span>
												</div>
											</div>
										</div>
										<div class="comment clearfix">
											<div class="comment-avatar">
												<img src="" alt="avatar" />
											</div>
											<div class="comment-content clearfix">
												<div class="comment-author font-alt">
													<a href="#">Mark Stone</a>
												</div>
												<div class="comment-body">
													<p>Europe uses the same vocabulary. The European
														languages are members of the same family. Their separate
														existence is a myth.</p>
												</div>
												<div class="comment-meta font-alt">
													Today, 14:59 -<span><i class="fa fa-star star"></i></span><span><i
														class="fa fa-star star"></i></span><span><i
														class="fa fa-star star"></i></span><span><i
														class="fa fa-star star-off"></i></span><span><i
														class="fa fa-star star-off"></i></span>
												</div>
											</div>
										</div>
									</div>
									<div class="comment-form mt-30">
										<h4 class="comment-form-title font-alt">Add review</h4>
										
											<div class="row">
												<div class="col-sm-4">
													<div class="form-group">
														<label class="sr-only" for="name">Name</label> <input
															class="form-control" id="name" type="text" name="name"
															placeholder="Name" />
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="sr-only" for="email">Name</label> <input
															class="form-control" id="email" type="text" name="email"
															placeholder="E-mail" />
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<select class="form-control">
															<option selected="true" disabled="">Rating</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
													</div>
												</div>
												<div class="col-sm-12">
													<div class="form-group">
														<textarea class="form-control" id="" name="" rows="4" placeholder="Review"></textarea>
													</div>
												</div>
												<div class="col-sm-12">
													<button class="btn btn-round btn-d" type="submit">Submit Review</button>
												</div>
											</div>
									
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>			
			<hr class="divider-w">
			<section class="module">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h2 class="module-title font-alt">경매 추천 상품</h2>
							<div class="module-subtitle font-serif">12개의 상품이 추천 되며 한 사람이 여러개의 상품을 등록할 수 없습니다.</div>
						</div>
					</div>
					<div class="row">
						<div class="owl-carousel text-center" data-items="5"
							data-pagination="false" data-navigation="false">
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img
											src="../../resources/images/shop/product-1.jpg"
											alt="Leather belt" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Leather belt</a>
										</h4>
										£12.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img
											src="../../resources/images/shop/product-3.jpg"
											alt="Derby shoes" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Derby shoes</a>
										</h4>
										£54.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img
											src="../../resources/images/shop/product-2.jpg"
											alt="Leather belt" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Leather belt</a>
										</h4>
										£19.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img
											src="../../resources/images/shop/product-4.jpg"
											alt="Leather belt" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Leather belt</a>
										</h4>
										£14.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img
											src="../../resources/images/shop/product-5.jpg"
											alt="Chelsea boots" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Chelsea boots</a>
										</h4>
										£44.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img
											src="../../resources/images/shop/product-6.jpg"
											alt="Leather belt" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Leather belt</a>
										</h4>
										£19.00
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<div class="module-small bg-dark">
				<div class="container">
					<div class="row">
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">About Titan</h5>
								<p>The languages only differ in their grammar, their
									pronunciation and their most common words.</p>
								<p>Phone: +1 234 567 89 10</p>
								Fax: +1 234 567 89 10
								<p>
									Email:<a href="#">somecompany@example.com</a>
								</p>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">Recent Comments</h5>
								<ul class="icon-list">
									<li>Maria on <a href="#">Designer Desk Essentials</a></li>
									<li>John on <a href="#">Realistic Business Card Mockup</a></li>
									<li>Andy on <a href="#">Eco bag Mockup</a></li>
									<li>Jack on <a href="#">Bottle Mockup</a></li>
									<li>Mark on <a href="#">Our trip to the Alps</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">Blog Categories</h5>
								<ul class="icon-list">
									<li><a href="#">Photography - 7</a></li>
									<li><a href="#">Web Design - 3</a></li>
									<li><a href="#">Illustration - 12</a></li>
									<li><a href="#">Marketing - 1</a></li>
									<li><a href="#">Wordpress - 16</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">Popular Posts</h5>
								<ul class="widget-posts">
									<li class="clearfix">
										<div class="widget-posts-image">
											<a href="#"><img src="../../resources/images/rp-1.jpg"
												alt="Post Thumbnail" /></a>
										</div>
										<div class="widget-posts-body">
											<div class="widget-posts-title">
												<a href="#">Designer Desk Essentials</a>
											</div>
											<div class="widget-posts-meta">23 january</div>
										</div>
									</li>
									<li class="clearfix">
										<div class="widget-posts-image">
											<a href="#"><img src="../../resources/images/rp-2.jpg"
												alt="Post Thumbnail" /></a>
										</div>
										<div class="widget-posts-body">
											<div class="widget-posts-title">
												<a href="#">Realistic Business Card Mockup</a>
											</div>
											<div class="widget-posts-meta">15 February</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr class="divider-d">
			<footer class="footer bg-dark">
				<div class="container">
					<div class="row">
						<div class="col-sm-6">
							<p class="copyright font-alt">
								&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights
								Reserved
							</p>
						</div>
						<div class="col-sm-6">
							<div class="footer-social-links">
								<a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
									class="fa fa-twitter"></i></a><a href="#"><i
									class="fa fa-dribbble"></i></a><a href="#"><i
									class="fa fa-skype"></i></a>
							</div>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
		
		<form>
			<input type="hidden" name="auctionProductNo" value="${auctionProduct.auctionProductNo}">
			<input type="hidden" name="user.id" value="${registrantInfo.user.id}">
		</form>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<script src="../../resources/lib/jquery/jquery.js"></script>
	<script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../resources/lib/wow/wow.js"></script>
	<script src="../../resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="../../resources/lib/isotope/isotope.pkgd.js"></script>
	<script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="../../resources/lib/flexslider/jquery.flexslider.js"></script>
	<script src="../../resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="../../resources/lib/smoothscroll.js"></script>
	<script src="../../resources/lib/magnific-popup/jquery.magnific-popup.js"></script>
	<script src="../../resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="../../resources/js/plugins.js"></script>
	<script src="../../resources/js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="../../resources/js/stomp.min.js"></script>
	
	<script>

	document.addEventListener("DOMContentLoaded",function(){
		connect();
	});
	
	var stompClient = null;
	var auctionProductNo = document.getElementById('auctionProductNo').value;
	var userId = document.getElementById('userId').value;
	var nickName = document.getElementById('nickName').value;
	
	console.log(auctionProductNo, userId, nickName);
	
	$(function(){
		
		auctionProductNo = $('#auctionProductNo').val();
		userId = $('#userId').val(); 
		nickName = $('#nickName').val();
		
		$('#updateBtn').on('click',function(){
			$('form').attr('method','get').attr('action','/auction/updateAuctionProduct').submit();
		});
		
		$('#deleteBtn').on('click',function(){
			$.ajax({
					url : "/auction/rest/midwayWithdrawal/"+auctionProductNo,
					method : "GET",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					dataType : "json",
					success : function(JSONData, status) {
						alert(JSONData.info);
						deleteProduct();
					}
			});
			
			
		});
		
		$('#bidBtn').on('click',function(event){
			
			if($('#bidBtn').attr('disabled') == 'disabled'){
				return;
			}
			
			var currentPrice = $('#currentPrice').text();
			var startBidPrice = $('#startBidPrice').val();
			var bidUnit = $('#bidUnit').val();
			var bidPrice = $('#bidPrice').val();
			var bidableGrade = ${registrantInfo.user.auctionGrade}
			var userGrade = ${sessionScope.user.auctionGrade}
			if(bidableGrade > userGrade){
				$('.alert-danger').children('strong').text('입찰 가능 등급을 확인하세요.');
				$('.alert-success').attr('hidden',true);
				$('.alert-danger').attr('hidden',false);
				return;
			}
			
			$('.alert-success').children('strong').text('입찰 성공하셨습니다.');
			$('.alert-danger').attr('hidden',true);
			$('.alert-success').attr('hidden',false);

			if(currentPrice != 0){
				stompClient.send('/app/bid',{},JSON.stringify({
					auctionProductNo : auctionProductNo,
					bidPrice : 1*currentPrice + 1*bidUnit
				}));				
			}else{
				stompClient.send('/app/bid',{},JSON.stringify({
					auctionProductNo : auctionProductNo,
					bidPrice : 1*startBidPrice
				}));
			}
		
			
		});
	});
	
	function connect(){
		
		var sock = new SockJS("/realtime");
		stompClient = Stomp.over(sock);
		
		stompClient.connect({},function(frame){	
			
			console.log('connected: '+frame);
			
			stompClient.subscribe('/topic/join',function(response){
				
				var joinInfo = JSON.parse(response.body);
				console.log(joinInfo)
				if(auctionProductNo == joinInfo.auctionProductNo){
					$("#realTimeViewCount").text(joinInfo.realTimeViewCount);					
				}
			});
			
			stompClient.subscribe('/topic/bid',function(response){
				var bidInfo = JSON.parse(response.body)
				console.log(bidInfo);
				if(auctionProductNo == bidInfo.auctionProductNo){
					$('#currentPrice').text(bidInfo.bidPrice);
				}
				if(userId == bidInfo.user.id){
					var info = nickName+'님은 '+bidInfo.bidderCount+'명 중 '+bidInfo.bidderRank+'등 입니다.';
					$('#userInfo').text(info);
				}else{
					
					$.ajax({
  						url : "/auction/rest/getBidderRanking",
  						method : "POST",
  						data : JSON.stringify({
  							auctionProductNo : auctionProductNo
  						}),
  						headers : {
  							"Accept" : "application/json",
  							"Content-Type" : "application/json"
  						},
  						dataType : "json",
  						success : function(JSONData, status) {
  							if(JSONData.bidderRank != 0){
	  							var info = nickName+'님은 '+JSONData.bidderCount+'명 중 '+JSONData.bidderRank+'등 입니다.';
	  							$('#userInfo').text(info);  								
  							}
  						}
					});
				}
			});
			
			stompClient.subscribe('/topic/delete',function(response){
				var deleteInfo = JSON.parse(response.body)
				if(auctionProductNo == deleteInfo.auctionProductNo){
					alert(deleteInfo.info);
					window.location = "/auction/listAuctionProduct";
				}
			});
			
			stompClient.subscribe('/topic/exit',function(response){
				var exitInfo = JSON.parse(response.body)
				if(auctionProductNo == exitInfo.auctionProductNo){
					$("#realTimeViewCount").text(exitInfo.realTimeViewCount);					
				}
			});
						
			stompClient.send('/app/join',{},JSON.stringify({
				auctionProductNo : auctionProductNo
			}));
		});
	
	}
	
	
	window.onbeforeunload = function(e){
		stompClient.send('/app/exit',{},JSON.stringify({
			auctionProductNo : auctionProductNo
		}));
		setTimeout(disconnect(),3000);
	}
	
	function deleteProduct(){
        stompClient.send('/app/delete',{},JSON.stringify({
        	auctionProductNo : auctionProductNo
    	}));
	}
	
	
	function disconnect() {
	    if (stompClient !== null) {
	        stompClient.disconnect(function(){
	        	stompClient.send('/app/exit',{},JSON.stringify({
	        		auctionProductNo : auctionProductNo
	    		}));
	        });
	    }
	}
	
	function remaindTime() {
		var startTime = $('#auctionStartTime').text();
		var endTime = $('#auctionEndTime').text();
	    var now = new Date();
	    var open = new Date(startTime);
	    var end = new Date(endTime);
	   
	    var nt = now.getTime();
	    var ot = open.getTime();
	    var et = end.getTime();
	    
	  
	   if(nt<ot){
		   
			 $('#bidBtn').attr('disabled',true);
		     $(".time").fadeIn();
		     $("div.time-title").html("경매 시작까지 남은 시간");
		     sec =parseInt(ot - nt) / 1000;
		     day  = parseInt(sec/60/60/24);
		     sec = (sec - (day * 60 * 60 * 24));
		     hour = parseInt(sec/60/60);
		     sec = (sec - (hour*60*60));
		     min = parseInt(sec/60);
		     sec = parseInt(sec-(min*60));
		     if(hour<10){hour="0"+hour;}
		     if(min<10){min="0"+min;}
		     if(sec<10){sec="0"+sec;}
		     $(".hours").html(hour);
		     $(".minutes").html(min);
		     $(".seconds").html(sec);
		     
	   }else if(nt>et){
		   
		   	$('#bidBtn').attr('disabled',true);
	   		$("#bidBtn").html("경매 마감");
	    	$(".time").fadeOut();
	    	
	   }else {
		   
		     $(".time").fadeIn();
		     $("div.time-title").html("경매 마감까지 남은 시간");
		     $('#bidBtn').attr('disabled',false);
		     sec =parseInt(et - nt) / 1000;
		     day  = parseInt(sec/60/60/24);
		     sec = (sec - (day * 60 * 60 * 24));
		     hour = parseInt(sec/60/60);
		     sec = (sec - (hour*60*60));
		     min = parseInt(sec/60);
		     sec = parseInt(sec-(min*60));
		     if(hour<10){hour="0"+hour;}
		     if(min<10){min="0"+min;}
		     if(sec<10){sec="0"+sec;}
		     $(".hours").html(hour);
		     $(".minutes").html(min);
		     $(".seconds").html(sec);
		     
	   }
	 }
	 setInterval(remaindTime,1000);

	
	</script>
</body>
</html>