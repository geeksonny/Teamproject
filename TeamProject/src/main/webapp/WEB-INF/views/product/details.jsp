<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<head>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/jsPro/insertBasket.js"></script>
<script type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

// 리뷰쓰기
$(document).ready(function(){
	$(".primary-btn").on("click", function(e){
		debugger;
		e.preventDefault();

		const userId = '${prodDTO.userId}';
		const prodLNum = '${prodDTO.prodLNum}';
		const prodLProdnm = '${details.prodLProdnm}';

		$.ajax({
			data : {
				prodLNum : prodLNum,
				userId : userId
			},
			url : '${pageContext.request.contextPath }/product/check',
			type : 'POST',
			success : function(result){
				// 댓글 등록 전 회원이 이전에 등록한 댓글이 있는지 확인하는 기능
				// 존재 : S /  존재x : F
				if(result.code === 'S'){
					let popUrl = "${pageContext.request.contextPath }/product/replyEnroll?userId=" + userId + "&prodLNum=" + prodLNum + "&prodLProdnm=" + prodLProdnm;
					console.log(popUrl);
					let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
					window.open(popUrl,"리뷰 쓰기",popOption);
				} else{
					alert("이미 등록된 리뷰가 존재 합니다.");
				}
			}
		});

	});
});

// Related Product 관련 상품 뿌려주기
function printProdList(data){
	$('#detailsContainer').empty();
	data.forEach((e, i) => {
		var prodLPrice = e.prodLPrice;
		var price = prodLPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		$('#prodContainer').append(

		);
	});
}
</script>


    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>운동운동</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
</head>

<body>
<jsp:include page="../inc/menu.jsp"/>
    <!-- Shop Details Section Begin -->

  <!--================Single Product Area =================-->
  <div class="product_image_area section_padding">
    <div class="container">
      <div class="row s_product_inner justify-content-between">
        <div class="col-lg-7 col-xl-7">
          <div class="product_slider_img">
            <div id="vertical">
              <div data-thumb="${pageContext.request.contextPath }/resources/img/product/${details.prodLMainimg}">
                <img src="${pageContext.request.contextPath }/resources/img/product/${details.prodLMainimg}"  width="500" height="500"/>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-5 col-xl-4">
          <div class="product__details__text">
            <!-- <h3>Faded SkyBlu Denim Jeans</h3> -->
            <br><br><br>
            <h3>${details.prodLProdnm}</h3>
            <!-- 상품가격의 가독성을 높이기 위해 숫자 3자리마다 콤마(,)를 찍어주도록 처리함 -->
             <h4><fmt:formatNumber value="${details.prodLPrice}" pattern="###,###,###원"/></h4>
            <div class="rating">
            <h4> 별점 평균 :
	           	<c:forEach var="i" begin="1" end="${details.rating}">
	           	<i class="fa fa-star"></i>
	            </c:forEach>
		        (${prodDTO.avgRating}점 / 5점)
		    </h4>
		    <br><br>
	      	</div>
            <ul class="list">
              <li>
                <span>남은 수량</span> : <b>${details.prodLQuantity}</b>
              </li>
              <li>
              <!-- 내가 찜한 목록들 리스트 볼수있게 이동? -->
                <span>찜하기</span> : <a class="btn btn-light btn-sm" id="prodLike">클릭</a>
              </li>
	            <li>
	              장바구니에 넣기 : <a class="btn btn-light btn-sm" id="insertBasket">클릭</a>
<!-- 	              장바구니에 가져갈 히든 값. 제품 코드와 가격, 수량 1개 -->
				  <input type="hidden" name="prodLcount" type="text" id="prodLcount" value="1">
	              <input type="hidden" name="prodLCode" value="${details.prodLCode}" id="prodLCode">
              	  <input type="hidden" name="prodLPrice" value="${details.prodLPrice}" id="prodLPrice">
             	 <a href="#" class="like_us"> <i class="ti-heart"></i> </a>
              	</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  <!--================End Single Product Area =================-->

  <!--================Product Description Area =================-->
  <section class="product_description_area">
    <div class="container">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
            aria-selected="false">상품 정보</a>
        <li class="nav-item">
          <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
            aria-selected="false">상품 후기</a>
        </li>
      </ul>
      <!-- 상품 정보 뿌려주는 부분 시작 -->
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
          <div class="table-responsive">
			<div style="text-align: center;">
            	<img src="${pageContext.request.contextPath }/resources/img/product/${details.prodLSubimg}"/>
            </div>
          </div>
        </div>
        <!-- 상품 정보 뿌려주는 부분 끝 -->
         <!-- 상품 후기 부분 시작 -->
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
<!--           <div class="row"> -->
            <div class="col-lg-6">
            <!-- 리뷰 쓰기 시작 -->
            <div class="col-lg-6">
              <div class="review_box">
                <div class="reply_subject">
					<br><h2>리뷰</h2>
				</div>
					<div class="reply_button_wrap">
						<br><button type="submit" class="primary-btn" value="submit">리뷰 쓰기</button>
					</div>
              </div>
            </div>
            <!-- 상품 후기 부분 끝 -->
              <div class="row total_rate">
                <div class="col-6">
                  <div class="box_total"><br>
                    <h5>별점 평균</h5>
                    <c:forEach var="i" begin="1" end="${details.rating}">
		           		<i class="fa fa-star" style="color:orange"></i>
		            </c:forEach> (${prodDTO.avgRating}점 / 5점)
                    <h6>(${prodDTO.countRating} Reviews)</h6><br>
                    <hr>
                  </div>
                </div>
              </div>
			  <c:forEach var="prodReply"  items="${prodReply}" >
	              <div class="review_list">
	                <div class="review_item">
	                  <div class="media">
	                    <div class="d-flex">
	                      <img src="${pageContext.request.contextPath }/resources/img/product/single-product/review-1.png" alt="" />
	                    </div>
	                    <div class="media-body">
	                      <h4>${prodReply.userId}</h4>
	                      <c:forEach var="i" begin="1" end="${prodReply.rating}">
	                      	<i class="fa fa-star" style="color:orange"></i>
	                      </c:forEach>
							(${prodReply.rating}점)
	                    </div>
	                  </div>
	                  ${prodReply.replyDate}
	                  <p>
	                    ${prodReply.content}
	                  </p>
	                </div>
	              </div>
				</c:forEach>
            </div>
<!--           </div> -->
        </div>
      </div>
    </div>
  </section>
  <!--================End Product Description Area =================-->
       <!-- Related Section Begin -->
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">Related Product</h3>
                </div>
            </div>
            <div class="row">

            	<!-- Related Product 관련상품 뿌려주는 곳 시작 -->
            	<div class="row" id="detailsContainer">
                   	<c:forEach var="prodRelatedList" items="${prodRelatedList}">
	                   	<div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
	                    	<div class="product__item">
	                        	<div class="product__item__pic set-bg">
		                        	<a href="${pageContext.request.contextPath }/product/details?prodLNum=${prodRelatedList.prodLNum}">
									<img src="${pageContext.request.contextPath }/resources/img/product/${prodRelatedList.prodLMainimg}" alt="위의 이미지를 누르면 연결됩니다."/></a>
	                            	<ul class="product__hover">
	                  	 	           <li><a href="#">
	                  	 	           	   <img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""><span>찜하기</span></a>
	                  	 	           </li>
	                                </ul>
	                           	</div>
	                            <div class="product__item__text">
	                            	<h6>${prodRelatedList.prodLProdnm}</h6>
	                            	<a href="${pageContext.request.contextPath }/order/cart"></a>
	                                <!-- 상품가격의 가독성을 높이기 위해 숫자 3자리마다 콤마(,)를 찍어주도록 처리함 -->
	                                <h5> <fmt:formatNumber value="${prodRelatedList.prodLPrice}" pattern="###,###,###원"/></h5>
	                                <div class="rating">
										<c:forEach var="i" begin="1" end="${prodRelatedList.avgRating}">
											<i class="fa fa-star"></i>
	                      				</c:forEach>
	                            	</div>
	                        	</div>
	                    	</div>
	                	</div>
	            	</c:forEach>
	            </div>
            	<!-- Related Product 관련상품 뿌려주는 곳 끝 -->
            </div>
        </div>
    </section>
    <!-- Related Section End -->

    <!-- Footer Section Begin -->
    <jsp:include page="../inc/footer.jsp"/>
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.nicescroll.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
</body>

</html>