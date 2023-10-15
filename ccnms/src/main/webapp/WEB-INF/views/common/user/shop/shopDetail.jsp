<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${contextPath }/shop/thumbnails?file=${shopDTO.productFile}" alt="상품사진">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="img/product/details/product-details-2.jpg"
                                src="${contextPath }/shop/thumbnails?file=${shopDTO.productFile}" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${shopDTO.productNm }</h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                        <div class="product__details__price">${shopDTO.price } 원</div>
                        <ul>
                            <li><b>재고수량</b> <span>${shopDTO.stock }</span></li>
                            <li><b>배송</b> <span>${shopDTO.deliveryMethod } <samp>${shopDTO.deliveryPrice }</samp></span></li>
                            <li><b>공유</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                        <hr>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="${contextPath }/order/myCart?productCd=${shopDTO.productCd}" class="primary-btn" style="background:royalblue">구매하기</a>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">상품설명</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">리뷰</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Q&A <span>(${shopDTO.qnaCnt })</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>${shopDTO.productNm }</h6>
                                    <p>${shopDTO.content }</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>리뷰</h6>
                                    <a href="javascript:void(0);" class="list-group-item list-group-item-action flex-column align-items-start">
			                            <div class="d-flex justify-content-between w-100">
			                              <h6>List group item heading</h6>
			                              <small class="text-muted">3 days ago</small>
			                            </div>
			                            <p class="mb-1">
			                              Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius
			                              blandit.
			                            </p>
			                            <small class="text-muted">Donec id elit non mi porta.</small>
			                          </a>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Q&A<span>(${shopDTO.qnaCnt })</span></h6>
                                    	<input type="button" value="Q&A 작성">
                                   <div class="card">
					                <div class="table-responsive text-nowrap">
					                  <table class="table">
					                    <thead>
					                      <tr>
					                        <th>답변상태</th>
					                        <th>제목</th>
					                        <th>작성자</th>
					                        <th>작성일</th>
					                      </tr>
					                    </thead>
					                    <tbody>
					                      <tr>
					                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>Angular Project</strong></td>
					                        <td>Albert Cook</td>
					                        <td>
					                          <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
					                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Lilian Fuller">
					                              <img src="../assets/img/avatars/5.png" alt="Avatar" class="rounded-circle">
					                            </li>
					                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Sophia Wilkerson">
					                              <img src="../assets/img/avatars/6.png" alt="Avatar" class="rounded-circle">
					                            </li>
					                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Christina Parker">
					                              <img src="../assets/img/avatars/7.png" alt="Avatar" class="rounded-circle">
					                            </li>
					                          </ul>
					                        </td>
					                        <td><span class="badge bg-label-primary me-1">Active</span></td>
					                      </tr>
					                    </tbody>
					                  </table>
					                </div>
					              </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>