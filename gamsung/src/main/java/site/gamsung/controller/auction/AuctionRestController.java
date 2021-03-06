package site.gamsung.controller.auction;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import site.gamsung.service.auction.AuctionInfoService;
import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.auction.AuctionReviewService;
import site.gamsung.service.common.RatingReviewService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.NaverProduct;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.RatingReview;
import site.gamsung.service.domain.User;
import site.gamsung.service.payment.PaymentService;
import site.gamsung.service.user.UserService;
import site.gamsung.util.auction.NaverShoppingAPI;

@RequestMapping("auction/rest/*")
@RestController
public class AuctionRestController {
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
	@Autowired
	@Qualifier("auctionInfoService")
	private AuctionInfoService auctionInfoService;
	
	@Autowired
	@Qualifier("auctionReviewService")
	private RatingReviewService ratingReviewService;
	
	@Autowired
	@Qualifier("auctionReviewService")
	private AuctionReviewService auctionReviewService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("naverShoppingAPI")
	private NaverShoppingAPI naverShoppingAPI;
	
	@Value("#{auctionProperties['auctionPageSize']}")
	int auctionPageSize;
	
	@Value("#{auctionProperties['auctionReviewPageSize']}")
	int auctionReviewPageSize;
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	@RequestMapping(value = "infiniteScrollA", produces = "application/json; charset=utf-8")
	public List<NaverProduct> naverShoppingAPI(@RequestBody Search search) {
		
		NaverProduct naverProduct = naverShoppingAPI.naverShopping(search);
		
		return naverProduct.getItems();
	}
	
	//????????? ?????? ??????
	@RequestMapping("autoComplete")
	public List<String> autoComplete(@RequestBody Search search) {
		System.out.println(search.getSearchKeyword());
		List<String> list = auctionProductService.autoComplete(search.getSearchKeyword());
		return list;
	}
	
	@PostMapping("getBidderRanking")
	public AuctionInfo getBidderRanking(@RequestBody AuctionInfo auctionInfo, HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		auctionInfo.setUser(user);
		
		return auctionInfoService.getBidderRanking(auctionInfo);
	}
	
	@GetMapping( "updateAuctionStatus/{auctionProductNo}/{status}")
	public AuctionInfo updateAuctionStatus(	@PathVariable("auctionProductNo") String auctionProductNo,
											@PathVariable("status") String status, HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionProductNo(auctionProductNo);
		auctionInfo.setAuctionStatus(status);
		
		AuctionProduct auctionProduct = (AuctionProduct)auctionProductService.getAuctionProduct(auctionInfo).get("auctionProduct");
		auctionProduct.getHopefulBidPrice();
		
		//????????????/????????????/??????????????? ?????? ????????? ?????? ???????????? ?????????.
		AuctionInfo info = auctionProductService.deleteAuctionProduct(auctionInfo);
		
		Payment payment = (Payment)auctionInfoService.makePaymentInfo(user, status, auctionProduct);
		
		try {
			paymentService.makePayment(payment);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//????????? ?????? ?????? ???????????????.
		user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
		httpSession.setAttribute("user", user);
		
		return info;
		
	}
	
	//?????? 10?????? ??????
	@GetMapping( "updateBidEndTime/{auctionProductNo}")
	public AuctionInfo updateBidEndTime(@PathVariable("auctionProductNo") String auctionProductNo) {
		
		return auctionProductService.updateBidEndTime(auctionProductNo);
	}
	
	//?????? ??????
	@PostMapping("addReview/{auctionProductNo}")
	public void addReview(	@PathVariable("auctionProductNo") String auctionProductNo, 
							@RequestBody RatingReview ratingReview, HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		
		ratingReview.setUser(user);
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionProductNo(auctionProductNo);
		ratingReview.setAuctionInfo(auctionInfo);
		
		try {
			ratingReviewService.addRatingReview(ratingReview);
			//????????? ?????? ?????? ???????????????.
			user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
			httpSession.setAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	//?????? ?????????
	@PostMapping("listAuctionRatingReview/{currentPage}")
	public List<RatingReview> listAuctionRatingReview(@RequestBody AuctionInfo auctionInfo, HttpSession httpSession, @PathVariable int currentPage){
		
		User user = (User)httpSession.getAttribute("user");
		auctionInfo.setUser(user);
		
		//????????? IP??? ????????????.
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if(ip == null) {
			ip = req.getRemoteAddr();			
		}
		auctionInfo.setInfo(ip);
		
		Map<String, Object> map = auctionProductService.getAuctionProduct(auctionInfo);
	
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(auctionReviewPageSize);
		
		map.put("search", search);
		
		return auctionReviewService.listAuctionRatingReview(map);
	}

	//?????? ??????
	@PostMapping("addReviewComment/{auctionProductNo}")
	public AuctionInfo addReviewComment(@RequestBody RatingReview ratingReview, @PathVariable("auctionProductNo") String auctionProductNo) {
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionProductNo(auctionProductNo);
		
		ratingReview.setAuctionInfo(auctionInfo);
		
		return auctionReviewService.addAuctionRatingReviewComment(ratingReview);
		
	}
	
	//?????? ??????
	@PostMapping("deleteAuctionRatingReview")
	public AuctionInfo deleteAuctionRatingReview(@RequestBody RatingReview ratingReview, HttpSession httpSession){
		
		AuctionInfo auctionInfo = auctionReviewService.deleteAuctionRatingReview(ratingReview); 
		
		//????????? ?????? ?????? ???????????????.
		User user = (User)httpSession.getAttribute("user");
		user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
		httpSession.setAttribute("user", user);
		return auctionInfo;
	}
	
	//?????? ?????? ??????
	@RequestMapping("addMainAuctionProduct/{auctionProductNo}")
	public AuctionInfo addMainAuctionProduct(@PathVariable("auctionProductNo") String auctionProductNo) {
		
		String info = auctionProductService.addMainAuctionProduct(auctionProductNo);
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setInfo(info);
		
		return auctionInfo;
	}
	
	//?????? ?????? ?????? ??????
	@RequestMapping("addBidConcern")
	public AuctionInfo addBidConcern(@RequestBody AuctionInfo auctionInfo, HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		auctionInfo.setUser(user);
		
		String info = auctionInfoService.addBidConcern(auctionInfo);
		
		auctionInfo.setInfo(info);
		
		return auctionInfo;
	}
	
	//?????? ????????? ?????? ????????? ??????
	@RequestMapping("listAuctionProduct")
	public Map<String,Object> listAuctionProduct(@RequestBody Search search, Model model, HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		
		search.setPageSize(auctionPageSize);
		search.setCurrentPage(1);
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("search", search);
		map.put("user", user);
		
		//????????? ?????? ?????? 8?????? ?????? ????????? ???????????? ?????????
		map = auctionProductService.listAuctionProduct(map);
		map.put("search", search);
		
		return map;
	}
	
	//?????? ???????????? ??????
	@PostMapping("deleteSuspension")
	public AuctionInfo deleteAuctionSuspensionUser(@RequestBody User user) {
		
		return auctionInfoService.deleteAuctionSuspension(user);
	}
	
	
	@MessageMapping("/join/{auctionProductNo}")
	public void auctionJoin(AuctionInfo auctionInfo, StompHeaderAccessor stompHeaderAccessor) {
		
		List<String> list = stompHeaderAccessor.getNativeHeader("realTimeViewCount");
		for(String string : list) {
			auctionInfo.setRealTimeViewCount(Integer.parseInt(string));
		}
		
		simpMessagingTemplate.convertAndSend("/topic/join/"+auctionInfo.getAuctionProductNo(),auctionInfo);
	}
	
	@MessageMapping("/bid/{auctionProductNo}")
	public void auctionBid(AuctionInfo auctionInfo, SimpMessageHeaderAccessor simpMessageHeaderAccessor) {

		HttpSession httpSession = (HttpSession)simpMessageHeaderAccessor.getSessionAttributes().get("session");
		User user = (User)httpSession.getAttribute("user");
		
		auctionInfo.setUser(user);
		
		String info = auctionProductService.auctionProductBid(auctionInfo);
		int bidPrice = auctionInfo.getBidPrice();
		
		auctionInfo = auctionInfoService.getBidderRanking(auctionInfo);
		
		auctionInfo.setBidPrice(bidPrice);
		auctionInfo.setInfo(info);
		
		AuctionProduct auctionProduct = (AuctionProduct)auctionProductService.getAuctionProduct(auctionInfo).get("auctionProduct");
		auctionInfo.setBidDateTime(auctionProduct.getAuctionEndTime());
		
		simpMessagingTemplate.convertAndSend("/topic/bid/"+auctionInfo.getAuctionProductNo(),auctionInfo);
	}
	
	@MessageMapping("/update/{auctionProductNo}")
	public void auctionUpdate(AuctionInfo auctionInfo, SimpMessageHeaderAccessor simpMessageHeaderAccessor) {
		
		AuctionProduct auctionProduct = (AuctionProduct)auctionProductService.getAuctionProduct(auctionInfo).get("auctionProduct");
		simpMessagingTemplate.convertAndSend("/topic/update/"+auctionInfo.getAuctionProductNo(), auctionProduct);
		
	}
	
	@MessageMapping("/delete/{auctionProductNo}")
	public void auctionDelete(AuctionInfo auctionInfo, SimpMessageHeaderAccessor simpMessageHeaderAccessor) {
		System.out.println("????????????");
		
		HttpSession httpSession = (HttpSession)simpMessageHeaderAccessor.getSessionAttributes().get("session");
		User user = (User)httpSession.getAttribute("user");
		
		auctionInfo.setUser(user);
		
		user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
		httpSession.setAttribute("user", user);
		
		auctionInfo.setInfo("?????? ????????? ?????? ?????? ???????????????.");
		
		simpMessagingTemplate.convertAndSend("/topic/delete/"+auctionInfo.getAuctionProductNo(),auctionInfo);

	}
	
	@MessageMapping("/exit/{auctionProductNo}")
	public void exitAuction(AuctionInfo auctionInfo, StompHeaderAccessor stompHeaderAccessor) {
		
		List<String> list = stompHeaderAccessor.getNativeHeader("realTimeViewCount");
		for(String string : list) {
			auctionInfo.setRealTimeViewCount(Integer.parseInt(string));
		}
		
		simpMessagingTemplate.convertAndSend("/topic/exit/"+auctionInfo.getAuctionProductNo(),auctionInfo);
	}
	
	//EC2 Coupang ?????? ???????????? ?????? ??????
	@PostMapping("infiniteScrollB")
	public synchronized List<AuctionProduct> InfiniteScroll(@RequestBody Search search){
	
		search.setOffset(auctionPageSize);
		search.setPageSize(auctionPageSize);
		
		return auctionProductService.listCrawlingAuctionProduct(search);
	}
}
