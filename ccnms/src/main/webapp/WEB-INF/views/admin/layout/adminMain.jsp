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
  	<nav
         class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
         id="layout-navbar"
       >
        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0   d-xl-none ">
       <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
         <i class="bx bx-menu bx-sm"></i>
       </a>
     	</div>
         <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
           <!-- Search -->
           <div class="navbar-nav align-items-center">
             <div class="nav-item d-flex align-items-center">
               <i class="bx bx-search fs-4 lh-0"></i>
               <input
                 type="text"
                 class="form-control border-0 shadow-none"
                 placeholder="Search..."
                 aria-label="Search..."
               />
             </div>
           </div>
        </div>
     </nav>
         
         <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-lg-8 mb-4 order-0">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                      <div class="col-sm-7">
                        <div class="card-body">
                          <h5 class="card-title text-primary">환영합니다! 관리자 ${sessionScope.adminId }님 🎉</h5>
                          <p class="mb-4">
                            You have done <span class="fw-bold">72%</span> more sales today. Check your new badge in
                            your profile.
                          </p>

                          <a href="javascript:;" class="btn btn-sm btn-outline-primary">View Badges</a>
                        </div>
                      </div>
                      <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                          <img
                            src="${contextPath}/resources/admin/assets//img/illustrations/man-with-laptop-light.png"
                            height="140"
                            alt="View Badge User"
                            data-app-dark-img="illustrations/man-with-laptop-dark.png"
                            data-app-light-img="illustrations/man-with-laptop-light.png"
                          />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 col-md-4 order-1">
                  <div class="row">
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img
                                src="${contextPath}/resources/admin/assets//img/icons/unicons/chart-success.png"
                                alt="chart success"
                                class="rounded"
                              />
                            </div>
                            <div class="dropdown">
                              <button
                                class="btn p-0"
                                type="button"
                                id="cardOpt3"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <i class="bx bx-dots-vertical-rounded"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt3">
                                <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                              </div>
                            </div>
                          </div>
                          <c:forEach var="i" items="${cntList }">
                          <span class="fw-semibold d-block mb-1">디깅 게시물 등록수</span>
                          <h3 class="card-title mb-2">${cntList.todayDigging} 개</h3>
                          <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +72.80%</small>
                          </c:forEach>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img
                                src="${contextPath}/resources/admin/assets//img/icons/unicons/wallet-info.png"
                                alt="Credit Card"
                                class="rounded"
                              />
                            </div>
                            <div class="dropdown">
                              <button
                                class="btn p-0"
                                type="button"
                                id="cardOpt6"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <i class="bx bx-dots-vertical-rounded"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt6">
                                <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                              </div>
                            </div>
                          </div>
                          <span>댓글수</span>
                          <h3 class="card-title text-nowrap mb-1">${todayReply }개</h3>
                          <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.42%</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Total Revenue -->
                <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
                  <div class="card">
                    <div class="row row-bordered g-0">
                      <div class="col-md-8">
                        <h5 class="card-header m-0 me-2 pb-3">Total Revenue</h5>
                        <div id="totalRevenueChart" class="px-2" style="min-height: 315px;"><div id="apexcharts8878jhpd" class="apexcharts-canvas apexcharts8878jhpd apexcharts-theme-light" style="width: 444px; height: 300px;"><svg id="SvgjsSvg1873" width="444" height="300" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><foreignObject x="0" y="0" width="444" height="300"><div class="apexcharts-legend apexcharts-align-left apx-legend-position-top" xmlns="http://www.w3.org/1999/xhtml" style="right: 0px; position: absolute; left: 0px; top: 4px; max-height: 150px;"><div class="apexcharts-legend-series" rel="1" seriesname="2021" data:collapsed="false" style="margin: 2px 10px;"><span class="apexcharts-legend-marker" rel="1" data:collapsed="false" style="background: rgb(105, 108, 255) !important; color: rgb(105, 108, 255); height: 8px; width: 8px; left: -3px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span class="apexcharts-legend-text" rel="1" i="0" data:default-text="2021" data:collapsed="false" style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">2021</span></div><div class="apexcharts-legend-series" rel="2" seriesname="2020" data:collapsed="false" style="margin: 2px 10px;"><span class="apexcharts-legend-marker" rel="2" data:collapsed="false" style="background: rgb(3, 195, 236) !important; color: rgb(3, 195, 236); height: 8px; width: 8px; left: -3px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span class="apexcharts-legend-text" rel="2" i="1" data:default-text="2020" data:collapsed="false" style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">2020</span></div></div><style type="text/css">	
    	
      .apexcharts-legend {	
        display: flex;	
        overflow: auto;	
        padding: 0 10px;	
      }	
      .apexcharts-legend.apx-legend-position-bottom, .apexcharts-legend.apx-legend-position-top {	
        flex-wrap: wrap	
      }	
      .apexcharts-legend.apx-legend-position-right, .apexcharts-legend.apx-legend-position-left {	
        flex-direction: column;	
        bottom: 0;	
      }	
      .apexcharts-legend.apx-legend-position-bottom.apexcharts-align-left, .apexcharts-legend.apx-legend-position-top.apexcharts-align-left, .apexcharts-legend.apx-legend-position-right, .apexcharts-legend.apx-legend-position-left {	
        justify-content: flex-start;	
      }	
      .apexcharts-legend.apx-legend-position-bottom.apexcharts-align-center, .apexcharts-legend.apx-legend-position-top.apexcharts-align-center {	
        justify-content: center;  	
      }	
      .apexcharts-legend.apx-legend-position-bottom.apexcharts-align-right, .apexcharts-legend.apx-legend-position-top.apexcharts-align-right {	
        justify-content: flex-end;	
      }	
      .apexcharts-legend-series {	
        cursor: pointer;	
        line-height: normal;	
      }	
      .apexcharts-legend.apx-legend-position-bottom .apexcharts-legend-series, .apexcharts-legend.apx-legend-position-top .apexcharts-legend-series{	
        display: flex;	
        align-items: center;	
      }	
      .apexcharts-legend-text {	
        position: relative;	
        font-size: 14px;	
      }	
      .apexcharts-legend-text *, .apexcharts-legend-marker * {	
        pointer-events: none;	
      }	
      .apexcharts-legend-marker {	
        position: relative;	
        display: inline-block;	
        cursor: pointer;	
        margin-right: 3px;	
        border-style: solid;
      }	
      	
      .apexcharts-legend.apexcharts-align-right .apexcharts-legend-series, .apexcharts-legend.apexcharts-align-left .apexcharts-legend-series{	
        display: inline-block;	
      }	
      .apexcharts-legend-series.apexcharts-no-click {	
        cursor: auto;	
      }	
      .apexcharts-legend .apexcharts-hidden-zero-series, .apexcharts-legend .apexcharts-hidden-null-series {	
        display: none !important;	
      }	
      .apexcharts-inactive-legend {	
        opacity: 0.45;	
      }</style></foreignObject>
      <g id="SvgjsG1875" class="apexcharts-inner apexcharts-graphical" transform="translate(53.796875, 51)">
      <defs id="SvgjsDefs1874"><linearGradient id="SvgjsLinearGradient1879" x1="0" y1="0" x2="0" y2="1">
      <stop id="SvgjsStop1880" stop-opacity="0.4" stop-color="rgba(216,227,240,0.4)" offset="0"></stop>
      <stop id="SvgjsStop1881" stop-opacity="0.5" stop-color="rgba(190,209,230,0.5)" offset="1"></stop>
      <stop id="SvgjsStop1882" stop-opacity="0.5" stop-color="rgba(190,209,230,0.5)" offset="1"></stop>
      </linearGradient><clipPath id="gridRectMask8878jhpd"><rect id="SvgjsRect1884" width="380.203125" height="223.73" x="-5" y="-3" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath>
      <clipPath id="forecastMask8878jhpd"></clipPath>
      <clipPath id="nonForecastMask8878jhpd"></clipPath>
      <clipPath id="gridRectMarkerMask8878jhpd">
      <rect id="SvgjsRect1885" width="374.203125" height="221.73" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect>
      </clipPath>
      </defs><rect id="SvgjsRect1883" width="21.154464285714283" height="217.73" x="274.11383187430243" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke-dasharray="3" fill="url(#SvgjsLinearGradient1879)" class="apexcharts-xcrosshairs" y2="217.73" filter="none" fill-opacity="0.9" x1="274.11383187430243" x2="274.11383187430243"></rect>
      <g id="SvgjsG1905" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG1906" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)">
      <text id="SvgjsText1908" font-family="Helvetica, Arial, sans-serif" x="26.443080357142858" y="246.73" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
      <tspan id="SvgjsTspan1909">Jan</tspan>
      <title>Jan</title>
      </text>
      <text id="SvgjsText1911" font-family="Helvetica, Arial, sans-serif" x="79.32924107142857" y="246.73" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
      <tspan id="SvgjsTspan1912">Feb</tspan>
      <title>Feb</title>
      </text>
      <text id="SvgjsText1914" font-family="Helvetica, Arial, sans-serif" x="132.21540178571428" y="246.73" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
      <tspan id="SvgjsTspan1915">Mar</tspan>
      <title>Mar</title>
      </text>
      <text id="SvgjsText1917" font-family="Helvetica, Arial, sans-serif" x="185.1015625" y="246.73" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
      <tspan id="SvgjsTspan1918">Apr</tspan>
      <title>Apr</title>
      </text>
      <text id="SvgjsText1920" font-family="Helvetica, Arial, sans-serif" x="237.9877232142857" y="246.73" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
      <tspan id="SvgjsTspan1921">May</tspan>
      <title>May</title>
      </text>
      <text id="SvgjsText1923" font-family="Helvetica, Arial, sans-serif" x="290.87388392857144" y="246.73" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
      <tspan id="SvgjsTspan1924">Jun</tspan>
      <title>Jun</title>
      </text>
      <text id="SvgjsText1926" font-family="Helvetica, Arial, sans-serif" x="343.76004464285717" y="246.73" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
      <tspan id="SvgjsTspan1927">Jul</tspan>
      <title>Jul</title>
      </text>
      </g>
      </g>
      <g id="SvgjsG1942" class="apexcharts-grid">
      <g id="SvgjsG1943" class="apexcharts-gridlines-horizontal">
      <line id="SvgjsLine1945" x1="0" y1="0" x2="370.203125" y2="0" stroke="#eceef1" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline">
      </line>
      <line id="SvgjsLine1946" x1="0" y1="43.546" x2="370.203125" y2="43.546" stroke="#eceef1" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline">
      </line>
      <line id="SvgjsLine1947" x1="0" y1="87.092" x2="370.203125" y2="87.092" stroke="#eceef1" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline">
      </line>
      <line id="SvgjsLine1948" x1="0" y1="130.638" x2="370.203125" y2="130.638" stroke="#eceef1" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline">
      </line>
      <line id="SvgjsLine1949" x1="0" y1="174.184" x2="370.203125" y2="174.184" stroke="#eceef1" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline">
      </line>
      <line id="SvgjsLine1950" x1="0" y1="217.73" x2="370.203125" y2="217.73" stroke="#eceef1" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline">
      </line>
      </g>
      <g id="SvgjsG1944" class="apexcharts-gridlines-vertical"></g><line id="SvgjsLine1952" x1="0" y1="217.73" x2="370.203125" y2="217.73" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line><line id="SvgjsLine1951" x1="0" y1="1" x2="0" y2="217.73" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line></g><g id="SvgjsG1886" class="apexcharts-bar-series apexcharts-plot-series"><g id="SvgjsG1887" class="apexcharts-series" seriesName="2021" rel="1" data:realIndex="0"><path id="SvgjsPath1889" d="M 15.865848214285716 120.638L 15.865848214285716 62.255200000000016Q 15.865848214285716 52.255200000000016 25.865848214285716 52.255200000000016L 21.020312500000003 52.255200000000016Q 31.020312500000003 52.255200000000016 31.020312500000003 62.255200000000016L 31.020312500000003 62.255200000000016L 31.020312500000003 120.638Q 31.020312500000003 130.638 21.020312500000003 130.638L 25.865848214285716 130.638Q 15.865848214285716 130.638 15.865848214285716 120.638z" fill="rgba(105,108,255,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 15.865848214285716 120.638L 15.865848214285716 62.255200000000016Q 15.865848214285716 52.255200000000016 25.865848214285716 52.255200000000016L 21.020312500000003 52.255200000000016Q 31.020312500000003 52.255200000000016 31.020312500000003 62.255200000000016L 31.020312500000003 62.255200000000016L 31.020312500000003 120.638Q 31.020312500000003 130.638 21.020312500000003 130.638L 25.865848214285716 130.638Q 15.865848214285716 130.638 15.865848214285716 120.638z" pathFrom="M 15.865848214285716 120.638L 15.865848214285716 120.638L 31.020312500000003 120.638L 31.020312500000003 120.638L 31.020312500000003 120.638L 31.020312500000003 120.638L 31.020312500000003 120.638L 15.865848214285716 120.638" cy="52.255200000000016" cx="65.75200892857143" j="0" val="18" barHeight="78.38279999999999" barWidth="21.154464285714283"></path>
      <path id="SvgjsPath1890" d="M 68.75200892857143 120.638L 68.75200892857143 110.15580000000001Q 68.75200892857143 100.15580000000001 78.75200892857143 100.15580000000001L 73.90647321428571 100.15580000000001Q 83.90647321428571 100.15580000000001 83.90647321428571 110.15580000000001L 83.90647321428571 110.15580000000001L 83.90647321428571 120.638Q 83.90647321428571 130.638 73.90647321428571 130.638L 78.75200892857143 130.638Q 68.75200892857143 130.638 68.75200892857143 120.638z" fill="rgba(105,108,255,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 68.75200892857143 120.638L 68.75200892857143 110.15580000000001Q 68.75200892857143 100.15580000000001 78.75200892857143 100.15580000000001L 73.90647321428571 100.15580000000001Q 83.90647321428571 100.15580000000001 83.90647321428571 110.15580000000001L 83.90647321428571 110.15580000000001L 83.90647321428571 120.638Q 83.90647321428571 130.638 73.90647321428571 130.638L 78.75200892857143 130.638Q 68.75200892857143 130.638 68.75200892857143 120.638z" pathFrom="M 68.75200892857143 120.638L 68.75200892857143 120.638L 83.90647321428571 120.638L 83.90647321428571 120.638L 83.90647321428571 120.638L 83.90647321428571 120.638L 83.90647321428571 120.638L 68.75200892857143 120.638" cy="100.15580000000001" cx="118.63816964285715" j="1" val="7" barHeight="30.482199999999995" barWidth="21.154464285714283"></path>
      <path id="SvgjsPath1891" d="M 121.63816964285715 120.638L 121.63816964285715 75.31900000000002Q 121.63816964285715 65.31900000000002 131.63816964285715 65.31900000000002L 126.79263392857143 65.31900000000002Q 136.79263392857143 65.31900000000002 136.79263392857143 75.31900000000002L 136.79263392857143 75.31900000000002L 136.79263392857143 120.638Q 136.79263392857143 130.638 126.79263392857143 130.638L 131.63816964285715 130.638Q 121.63816964285715 130.638 121.63816964285715 120.638z" fill="rgba(105,108,255,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 121.63816964285715 120.638L 121.63816964285715 75.31900000000002Q 121.63816964285715 65.31900000000002 131.63816964285715 65.31900000000002L 126.79263392857143 65.31900000000002Q 136.79263392857143 65.31900000000002 136.79263392857143 75.31900000000002L 136.79263392857143 75.31900000000002L 136.79263392857143 120.638Q 136.79263392857143 130.638 126.79263392857143 130.638L 131.63816964285715 130.638Q 121.63816964285715 130.638 121.63816964285715 120.638z" pathFrom="M 121.63816964285715 120.638L 121.63816964285715 120.638L 136.79263392857143 120.638L 136.79263392857143 120.638L 136.79263392857143 120.638L 136.79263392857143 120.638L 136.79263392857143 120.638L 121.63816964285715 120.638" cy="65.31900000000002" cx="171.52433035714287" j="2" val="15" barHeight="65.31899999999999" barWidth="21.154464285714283"></path><path id="SvgjsPath1892" d="M 174.52433035714287 120.638L 174.52433035714287 14.35460000000002Q 174.52433035714287 4.354600000000019 184.52433035714287 4.354600000000019L 179.67879464285716 4.354600000000019Q 189.67879464285716 4.354600000000019 189.67879464285716 14.35460000000002L 189.67879464285716 14.35460000000002L 189.67879464285716 120.638Q 189.67879464285716 130.638 179.67879464285716 130.638L 184.52433035714287 130.638Q 174.52433035714287 130.638 174.52433035714287 120.638z" fill="rgba(105,108,255,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 174.52433035714287 120.638L 174.52433035714287 14.35460000000002Q 174.52433035714287 4.354600000000019 184.52433035714287 4.354600000000019L 179.67879464285716 4.354600000000019Q 189.67879464285716 4.354600000000019 189.67879464285716 14.35460000000002L 189.67879464285716 14.35460000000002L 189.67879464285716 120.638Q 189.67879464285716 130.638 179.67879464285716 130.638L 184.52433035714287 130.638Q 174.52433035714287 130.638 174.52433035714287 120.638z" pathFrom="M 174.52433035714287 120.638L 174.52433035714287 120.638L 189.67879464285716 120.638L 189.67879464285716 120.638L 189.67879464285716 120.638L 189.67879464285716 120.638L 189.67879464285716 120.638L 174.52433035714287 120.638" cy="4.354600000000019" cx="224.4104910714286" j="3" val="29" barHeight="126.28339999999999" barWidth="21.154464285714283"></path><path id="SvgjsPath1893" d="M 227.4104910714286 120.638L 227.4104910714286 62.255200000000016Q 227.4104910714286 52.255200000000016 237.4104910714286 52.255200000000016L 232.56495535714288 52.255200000000016Q 242.56495535714288 52.255200000000016 242.56495535714288 62.255200000000016L 242.56495535714288 62.255200000000016L 242.56495535714288 120.638Q 242.56495535714288 130.638 232.56495535714288 130.638L 237.4104910714286 130.638Q 227.4104910714286 130.638 227.4104910714286 120.638z" fill="rgba(105,108,255,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 227.4104910714286 120.638L 227.4104910714286 62.255200000000016Q 227.4104910714286 52.255200000000016 237.4104910714286 52.255200000000016L 232.56495535714288 52.255200000000016Q 242.56495535714288 52.255200000000016 242.56495535714288 62.255200000000016L 242.56495535714288 62.255200000000016L 242.56495535714288 120.638Q 242.56495535714288 130.638 232.56495535714288 130.638L 237.4104910714286 130.638Q 227.4104910714286 130.638 227.4104910714286 120.638z" pathFrom="M 227.4104910714286 120.638L 227.4104910714286 120.638L 242.56495535714288 120.638L 242.56495535714288 120.638L 242.56495535714288 120.638L 242.56495535714288 120.638L 242.56495535714288 120.638L 227.4104910714286 120.638" cy="52.255200000000016" cx="277.2966517857143" j="4" val="18" barHeight="78.38279999999999" barWidth="21.154464285714283"></path><path id="SvgjsPath1894" d="M 280.2966517857143 120.638L 280.2966517857143 88.3828Q 280.2966517857143 78.3828 290.2966517857143 78.3828L 285.4511160714286 78.3828Q 295.4511160714286 78.3828 295.4511160714286 88.3828L 295.4511160714286 88.3828L 295.4511160714286 120.638Q 295.4511160714286 130.638 285.4511160714286 130.638L 290.2966517857143 130.638Q 280.2966517857143 130.638 280.2966517857143 120.638z" fill="rgba(105,108,255,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 280.2966517857143 120.638L 280.2966517857143 88.3828Q 280.2966517857143 78.3828 290.2966517857143 78.3828L 285.4511160714286 78.3828Q 295.4511160714286 78.3828 295.4511160714286 88.3828L 295.4511160714286 88.3828L 295.4511160714286 120.638Q 295.4511160714286 130.638 285.4511160714286 130.638L 290.2966517857143 130.638Q 280.2966517857143 130.638 280.2966517857143 120.638z" pathFrom="M 280.2966517857143 120.638L 280.2966517857143 120.638L 295.4511160714286 120.638L 295.4511160714286 120.638L 295.4511160714286 120.638L 295.4511160714286 120.638L 295.4511160714286 120.638L 280.2966517857143 120.638" cy="78.3828" cx="330.1828125" j="5" val="12" barHeight="52.255199999999995" barWidth="21.154464285714283"></path><path id="SvgjsPath1895" d="M 333.1828125 120.638L 333.1828125 101.44660000000002Q 333.1828125 91.44660000000002 343.1828125 91.44660000000002L 338.33727678571427 91.44660000000002Q 348.33727678571427 91.44660000000002 348.33727678571427 101.44660000000002L 348.33727678571427 101.44660000000002L 348.33727678571427 120.638Q 348.33727678571427 130.638 338.33727678571427 130.638L 343.1828125 130.638Q 333.1828125 130.638 333.1828125 120.638z" fill="rgba(105,108,255,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 333.1828125 120.638L 333.1828125 101.44660000000002Q 333.1828125 91.44660000000002 343.1828125 91.44660000000002L 338.33727678571427 91.44660000000002Q 348.33727678571427 91.44660000000002 348.33727678571427 101.44660000000002L 348.33727678571427 101.44660000000002L 348.33727678571427 120.638Q 348.33727678571427 130.638 338.33727678571427 130.638L 343.1828125 130.638Q 333.1828125 130.638 333.1828125 120.638z" pathFrom="M 333.1828125 120.638L 333.1828125 120.638L 348.33727678571427 120.638L 348.33727678571427 120.638L 348.33727678571427 120.638L 348.33727678571427 120.638L 348.33727678571427 120.638L 333.1828125 120.638" cy="91.44660000000002" cx="383.06897321428573" j="6" val="9" barHeight="39.191399999999994" barWidth="21.154464285714283"></path></g><g id="SvgjsG1896" class="apexcharts-series" seriesName="2020" rel="2" data:realIndex="1"><path id="SvgjsPath1898" d="M 15.865848214285716 150.638L 15.865848214285716 187.24779999999998Q 15.865848214285716 197.24779999999998 25.865848214285716 197.24779999999998L 21.020312500000003 197.24779999999998Q 31.020312500000003 197.24779999999998 31.020312500000003 187.24779999999998L 31.020312500000003 187.24779999999998L 31.020312500000003 150.638Q 31.020312500000003 140.638 21.020312500000003 140.638L 25.865848214285716 140.638Q 15.865848214285716 140.638 15.865848214285716 150.638z" fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 15.865848214285716 150.638L 15.865848214285716 187.24779999999998Q 15.865848214285716 197.24779999999998 25.865848214285716 197.24779999999998L 21.020312500000003 197.24779999999998Q 31.020312500000003 197.24779999999998 31.020312500000003 187.24779999999998L 31.020312500000003 187.24779999999998L 31.020312500000003 150.638Q 31.020312500000003 140.638 21.020312500000003 140.638L 25.865848214285716 140.638Q 15.865848214285716 140.638 15.865848214285716 150.638z" pathFrom="M 15.865848214285716 150.638L 15.865848214285716 150.638L 31.020312500000003 150.638L 31.020312500000003 150.638L 31.020312500000003 150.638L 31.020312500000003 150.638L 31.020312500000003 150.638L 15.865848214285716 150.638" cy="177.24779999999998" cx="65.75200892857143" j="0" val="-13" barHeight="-56.60979999999999" barWidth="21.154464285714283"></path><path id="SvgjsPath1899" d="M 68.75200892857143 150.638L 68.75200892857143 209.0208Q 68.75200892857143 219.0208 78.75200892857143 219.0208L 73.90647321428571 219.0208Q 83.90647321428571 219.0208 83.90647321428571 209.0208L 83.90647321428571 209.0208L 83.90647321428571 150.638Q 83.90647321428571 140.638 73.90647321428571 140.638L 78.75200892857143 140.638Q 68.75200892857143 140.638 68.75200892857143 150.638z" fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 68.75200892857143 150.638L 68.75200892857143 209.0208Q 68.75200892857143 219.0208 78.75200892857143 219.0208L 73.90647321428571 219.0208Q 83.90647321428571 219.0208 83.90647321428571 209.0208L 83.90647321428571 209.0208L 83.90647321428571 150.638Q 83.90647321428571 140.638 73.90647321428571 140.638L 78.75200892857143 140.638Q 68.75200892857143 140.638 68.75200892857143 150.638z" pathFrom="M 68.75200892857143 150.638L 68.75200892857143 150.638L 83.90647321428571 150.638L 83.90647321428571 150.638L 83.90647321428571 150.638L 83.90647321428571 150.638L 83.90647321428571 150.638L 68.75200892857143 150.638" cy="199.0208" cx="118.63816964285715" j="1" val="-18" barHeight="-78.38279999999999" barWidth="21.154464285714283"></path><path id="SvgjsPath1900" d="M 121.63816964285715 150.638L 121.63816964285715 169.8294Q 121.63816964285715 179.8294 131.63816964285715 179.8294L 126.79263392857143 179.8294Q 136.79263392857143 179.8294 136.79263392857143 169.8294L 136.79263392857143 169.8294L 136.79263392857143 150.638Q 136.79263392857143 140.638 126.79263392857143 140.638L 131.63816964285715 140.638Q 121.63816964285715 140.638 121.63816964285715 150.638z" fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 121.63816964285715 150.638L 121.63816964285715 169.8294Q 121.63816964285715 179.8294 131.63816964285715 179.8294L 126.79263392857143 179.8294Q 136.79263392857143 179.8294 136.79263392857143 169.8294L 136.79263392857143 169.8294L 136.79263392857143 150.638Q 136.79263392857143 140.638 126.79263392857143 140.638L 131.63816964285715 140.638Q 121.63816964285715 140.638 121.63816964285715 150.638z" pathFrom="M 121.63816964285715 150.638L 121.63816964285715 150.638L 136.79263392857143 150.638L 136.79263392857143 150.638L 136.79263392857143 150.638L 136.79263392857143 150.638L 136.79263392857143 150.638L 121.63816964285715 150.638" cy="159.8294" cx="171.52433035714287" j="2" val="-9" barHeight="-39.191399999999994" barWidth="21.154464285714283"></path><path id="SvgjsPath1901" d="M 174.52433035714287 150.638L 174.52433035714287 191.6024Q 174.52433035714287 201.6024 184.52433035714287 201.6024L 179.67879464285716 201.6024Q 189.67879464285716 201.6024 189.67879464285716 191.6024L 189.67879464285716 191.6024L 189.67879464285716 150.638Q 189.67879464285716 140.638 179.67879464285716 140.638L 184.52433035714287 140.638Q 174.52433035714287 140.638 174.52433035714287 150.638z" fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 174.52433035714287 150.638L 174.52433035714287 191.6024Q 174.52433035714287 201.6024 184.52433035714287 201.6024L 179.67879464285716 201.6024Q 189.67879464285716 201.6024 189.67879464285716 191.6024L 189.67879464285716 191.6024L 189.67879464285716 150.638Q 189.67879464285716 140.638 179.67879464285716 140.638L 184.52433035714287 140.638Q 174.52433035714287 140.638 174.52433035714287 150.638z" pathFrom="M 174.52433035714287 150.638L 174.52433035714287 150.638L 189.67879464285716 150.638L 189.67879464285716 150.638L 189.67879464285716 150.638L 189.67879464285716 150.638L 189.67879464285716 150.638L 174.52433035714287 150.638" cy="181.6024" cx="224.4104910714286" j="3" val="-14" barHeight="-60.96439999999999" barWidth="21.154464285714283"></path><path id="SvgjsPath1902" d="M 227.4104910714286 150.638L 227.4104910714286 152.411Q 227.4104910714286 162.411 237.4104910714286 162.411L 232.56495535714288 162.411Q 242.56495535714288 162.411 242.56495535714288 152.411L 242.56495535714288 152.411L 242.56495535714288 150.638Q 242.56495535714288 140.638 232.56495535714288 140.638L 237.4104910714286 140.638Q 227.4104910714286 140.638 227.4104910714286 150.638z" fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 227.4104910714286 150.638L 227.4104910714286 152.411Q 227.4104910714286 162.411 237.4104910714286 162.411L 232.56495535714288 162.411Q 242.56495535714288 162.411 242.56495535714288 152.411L 242.56495535714288 152.411L 242.56495535714288 150.638Q 242.56495535714288 140.638 232.56495535714288 140.638L 237.4104910714286 140.638Q 227.4104910714286 140.638 227.4104910714286 150.638z" pathFrom="M 227.4104910714286 150.638L 227.4104910714286 150.638L 242.56495535714288 150.638L 242.56495535714288 150.638L 242.56495535714288 150.638L 242.56495535714288 150.638L 242.56495535714288 150.638L 227.4104910714286 150.638" cy="142.411" cx="277.2966517857143" j="4" val="-5" barHeight="-21.772999999999996" barWidth="21.154464285714283"></path><path id="SvgjsPath1903" d="M 280.2966517857143 150.638L 280.2966517857143 204.6662Q 280.2966517857143 214.6662 290.2966517857143 214.6662L 285.4511160714286 214.6662Q 295.4511160714286 214.6662 295.4511160714286 204.6662L 295.4511160714286 204.6662L 295.4511160714286 150.638Q 295.4511160714286 140.638 285.4511160714286 140.638L 290.2966517857143 140.638Q 280.2966517857143 140.638 280.2966517857143 150.638z" fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 280.2966517857143 150.638L 280.2966517857143 204.6662Q 280.2966517857143 214.6662 290.2966517857143 214.6662L 285.4511160714286 214.6662Q 295.4511160714286 214.6662 295.4511160714286 204.6662L 295.4511160714286 204.6662L 295.4511160714286 150.638Q 295.4511160714286 140.638 285.4511160714286 140.638L 290.2966517857143 140.638Q 280.2966517857143 140.638 280.2966517857143 150.638z" pathFrom="M 280.2966517857143 150.638L 280.2966517857143 150.638L 295.4511160714286 150.638L 295.4511160714286 150.638L 295.4511160714286 150.638L 295.4511160714286 150.638L 295.4511160714286 150.638L 280.2966517857143 150.638" cy="194.6662" cx="330.1828125" j="5" val="-17" barHeight="-74.0282" barWidth="21.154464285714283"></path><path id="SvgjsPath1904" d="M 333.1828125 150.638L 333.1828125 195.957Q 333.1828125 205.957 343.1828125 205.957L 338.33727678571427 205.957Q 348.33727678571427 205.957 348.33727678571427 195.957L 348.33727678571427 195.957L 348.33727678571427 150.638Q 348.33727678571427 140.638 338.33727678571427 140.638L 343.1828125 140.638Q 333.1828125 140.638 333.1828125 150.638z" fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff" stroke-opacity="1" stroke-linecap="round" stroke-width="6" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMask8878jhpd)" pathTo="M 333.1828125 150.638L 333.1828125 195.957Q 333.1828125 205.957 343.1828125 205.957L 338.33727678571427 205.957Q 348.33727678571427 205.957 348.33727678571427 195.957L 348.33727678571427 195.957L 348.33727678571427 150.638Q 348.33727678571427 140.638 338.33727678571427 140.638L 343.1828125 140.638Q 333.1828125 140.638 333.1828125 150.638z" pathFrom="M 333.1828125 150.638L 333.1828125 150.638L 348.33727678571427 150.638L 348.33727678571427 150.638L 348.33727678571427 150.638L 348.33727678571427 150.638L 348.33727678571427 150.638L 333.1828125 150.638" cy="185.957" cx="383.06897321428573" j="6" val="-15" barHeight="-65.31899999999999" barWidth="21.154464285714283"></path></g><g id="SvgjsG1888" class="apexcharts-datalabels" data:realIndex="0"></g><g id="SvgjsG1897" class="apexcharts-datalabels" data:realIndex="1"></g></g><line id="SvgjsLine1953" x1="0" y1="0" x2="370.203125" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1954" x1="0" y1="0" x2="370.203125" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG1955" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG1956" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG1957" class="apexcharts-point-annotations"></g></g><g id="SvgjsG1928" class="apexcharts-yaxis" rel="0" transform="translate(15.796875, 0)"><g id="SvgjsG1929" class="apexcharts-yaxis-texts-g"><text id="SvgjsText1930" font-family="Helvetica, Arial, sans-serif" x="20" y="52.5" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1931">30</tspan><title>30</title></text><text id="SvgjsText1932" font-family="Helvetica, Arial, sans-serif" x="20" y="96.04599999999999" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1933">20</tspan><title>20</title></text><text id="SvgjsText1934" font-family="Helvetica, Arial, sans-serif" x="20" y="139.59199999999998" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1935">10</tspan><title>10</title></text><text id="SvgjsText1936" font-family="Helvetica, Arial, sans-serif" x="20" y="183.13799999999998" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1937">0</tspan><title>0</title></text><text id="SvgjsText1938" font-family="Helvetica, Arial, sans-serif" x="20" y="226.68399999999997" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1939">-10</tspan><title>-10</title></text><text id="SvgjsText1940" font-family="Helvetica, Arial, sans-serif" x="20" y="270.22999999999996" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1941">-20</tspan><title>-20</title></text></g></g><g id="SvgjsG1876" class="apexcharts-annotations"></g></svg><div class="apexcharts-tooltip apexcharts-theme-light" style="left: 238.769px; top: 198.011px;"><div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Jun</div><div class="apexcharts-tooltip-series-group apexcharts-active" style="order: 1; display: flex;"><span class="apexcharts-tooltip-marker" style="background-color: rgba(3, 195, 236, 0.85);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">2020: </span><span class="apexcharts-tooltip-text-y-value">-17</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2; display: none;"><span class="apexcharts-tooltip-marker" style="background-color: rgba(3, 195, 236, 0.85);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">2020: </span><span class="apexcharts-tooltip-text-y-value">-17</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div></div>
      </div>
                        <div id="totalRevenueChart" class="px-2"></div>
                      </div>
                      <div class="col-md-4">
                        <div class="card-body">
                          <div class="text-center">
                            <div class="dropdown">
                              <button
                                class="btn btn-sm btn-outline-primary dropdown-toggle"
                                type="button"
                                id="growthReportId"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                2022
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="growthReportId">
                                <a class="dropdown-item" href="javascript:void(0);">2021</a>
                                <a class="dropdown-item" href="javascript:void(0);">2020</a>
                                <a class="dropdown-item" href="javascript:void(0);">2019</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div id="growthChart"></div>
                        <div class="text-center fw-semibold pt-3 mb-2">62% Company Growth</div>

                        <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
                          <div class="d-flex">
                            <div class="me-2">
                              <span class="badge bg-label-primary p-2"><i class="bx bx-dollar text-primary"></i></span>
                            </div>
                            <div class="d-flex flex-column">
                              <small>2022</small>
                              <h6 class="mb-0">$32.5k</h6>
                            </div>
                          </div>
                          <div class="d-flex">
                            <div class="me-2">
                              <span class="badge bg-label-info p-2"><i class="bx bx-wallet text-info"></i></span>
                            </div>
                            <div class="d-flex flex-column">
                              <small>2021</small>
                              <h6 class="mb-0">$41.2k</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Total Revenue -->
                <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                  <div class="row">
                    <div class="col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="${contextPath}/resources/admin/assets//img/icons/unicons/paypal.png" alt="Credit Card" class="rounded" />
                            </div>
                            <div class="dropdown">
                              <button
                                class="btn p-0"
                                type="button"
                                id="cardOpt4"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <i class="bx bx-dots-vertical-rounded"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt4">
                                <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                              </div>
                            </div>
                          </div>
                          <span class="d-block mb-1">새로운 유저 등록수</span>
                          <h3 class="card-title text-nowrap mb-2">${todayUser }개</h3>
                          <small class="text-danger fw-semibold"><i class="bx bx-down-arrow-alt"></i> -14.82%</small>
                        </div>
                      </div>
                    </div>
                    <div class="col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="${contextPath}/resources/admin/assets//img/icons/unicons/cc-primary.png" alt="Credit Card" class="rounded" />
                            </div>
                            <div class="dropdown">
                              <button
                                class="btn p-0"
                                type="button"
                                id="cardOpt1"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <i class="bx bx-dots-vertical-rounded"></i>
                              </button>
                              <div class="dropdown-menu" aria-labelledby="cardOpt1">
                                <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                              </div>
                            </div>
                          </div>
                          <span class="fw-semibold d-block mb-1">새로운 상품 등록수</span>
                          <h3 class="card-title mb-2">${todayShop }개</h3>
                          <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.14%</small>
                        </div>
                      </div>
                    </div>
                    <!-- </div>
    <div class="row"> -->
                    <div class="col-12 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="d-flex justify-content-between flex-sm-row flex-column gap-3">
                            <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
                              <div class="card-title">
                                <h5 class="text-nowrap mb-2">Profile Report</h5>
                                <span class="badge bg-label-warning rounded-pill">Year 2021</span>
                              </div>
                              <div class="mt-sm-auto">
                                <small class="text-success text-nowrap fw-semibold"
                                  ><i class="bx bx-chevron-up"></i> 68.2%</small
                                >
                                <h3 class="mb-0">$84,686k</h3>
                              </div>
                            </div>
                            <div id="profileReportChart"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <!-- Order Statistics -->
                <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2">Order Statistics</h5>
                        <small class="text-muted">42.82k Total Sales</small>
                      </div>
                      <div class="dropdown">
                        <button
                          class="btn p-0"
                          type="button"
                          id="orederStatistics"
                          data-bs-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                        >
                          <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                          <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                          <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                          <a class="dropdown-item" href="javascript:void(0);">Share</a>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex flex-column align-items-center gap-1">
                          <h2 class="mb-2">8,258</h2>
                          <span>Total Orders</span>
                        </div>
                        <div id="orderStatisticsChart"></div>
                      </div>
                      <ul class="p-0 m-0">
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-primary"
                              ><i class="bx bx-mobile-alt"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Electronic</h6>
                              <small class="text-muted">Mobile, Earbuds, TV</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">82.5k</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-success"><i class="bx bx-closet"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Fashion</h6>
                              <small class="text-muted">T-shirt, Jeans, Shoes</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">23.8k</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-info"><i class="bx bx-home-alt"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Decor</h6>
                              <small class="text-muted">Fine Art, Dining</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">849k</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-secondary"
                              ><i class="bx bx-football"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Sports</h6>
                              <small class="text-muted">Football, Cricket Kit</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">99</small>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <!--/ Order Statistics -->

                <!-- Expense Overview -->
                <div class="col-md-6 col-lg-4 order-1 mb-4">
                  <div class="card h-100">
                    <div class="card-header">
                      <ul class="nav nav-pills" role="tablist">
                        <li class="nav-item">
                          <button
                            type="button"
                            class="nav-link active"
                            role="tab"
                            data-bs-toggle="tab"
                            data-bs-target="#navs-tabs-line-card-income"
                            aria-controls="navs-tabs-line-card-income"
                            aria-selected="true"
                          >
                            Income
                          </button>
                        </li>
                        <li class="nav-item">
                          <button type="button" class="nav-link" role="tab">Expenses</button>
                        </li>
                        <li class="nav-item">
                          <button type="button" class="nav-link" role="tab">Profit</button>
                        </li>
                      </ul>
                    </div>
                    <div class="card-body px-0">
                      <div class="tab-content p-0">
                        <div class="tab-pane fade show active" id="navs-tabs-line-card-income" role="tabpanel">
                          <div class="d-flex p-4 pt-3">
                            <div class="avatar flex-shrink-0 me-3">
                              <img src="${contextPath}/resources/admin/assets//img/icons/unicons/wallet.png" alt="User" />
                            </div>
                            <div>
                              <small class="text-muted d-block">Total Balance</small>
                              <div class="d-flex align-items-center">
                                <h6 class="mb-0 me-1">$459.10</h6>
                                <small class="text-success fw-semibold">
                                  <i class="bx bx-chevron-up"></i>
                                  42.9%
                                </small>
                              </div>
                            </div>
                          </div>
                          <div id="incomeChart"></div>
                          <div class="d-flex justify-content-center pt-4 gap-2">
                            <div class="flex-shrink-0">
                              <div id="expensesOfWeek"></div>
                            </div>
                            <div>
                              <p class="mb-n1 mt-1">Expenses This Week</p>
                              <small class="text-muted">$39 less than last week</small>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Expense Overview -->

                <!-- Transactions -->
                <div class="col-md-6 col-lg-4 order-2 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="card-title m-0 me-2">Transactions</h5>
                      <div class="dropdown">
                        <button
                          class="btn p-0"
                          type="button"
                          id="transactionID"
                          data-bs-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                        >
                          <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="transactionID">
                          <a class="dropdown-item" href="javascript:void(0);">Last 28 Days</a>
                          <a class="dropdown-item" href="javascript:void(0);">Last Month</a>
                          <a class="dropdown-item" href="javascript:void(0);">Last Year</a>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <ul class="p-0 m-0">
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <img src="${contextPath}/resources/admin/assets//img/icons/unicons/paypal.png" alt="User" class="rounded" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">Paypal</small>
                              <h6 class="mb-0">Send money</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <h6 class="mb-0">+82.6</h6>
                              <span class="text-muted">USD</span>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <img src="${contextPath}/resources/admin/assets//img/icons/unicons/wallet.png" alt="User" class="rounded" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">Wallet</small>
                              <h6 class="mb-0">Mac'D</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <h6 class="mb-0">+270.69</h6>
                              <span class="text-muted">USD</span>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <img src="${contextPath}/resources/admin/assets//img/icons/unicons/chart.png" alt="User" class="rounded" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">Transfer</small>
                              <h6 class="mb-0">Refund</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <h6 class="mb-0">+637.91</h6>
                              <span class="text-muted">USD</span>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <img src="${contextPath}/resources/admin/assets//img/icons/unicons/cc-success.png" alt="User" class="rounded" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">Credit Card</small>
                              <h6 class="mb-0">Ordered Food</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <h6 class="mb-0">-838.71</h6>
                              <span class="text-muted">USD</span>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <img src="${contextPath}/resources/admin/assets//img/icons/unicons/wallet.png" alt="User" class="rounded" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">Wallet</small>
                              <h6 class="mb-0">Starbucks</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <h6 class="mb-0">+203.33</h6>
                              <span class="text-muted">USD</span>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex">
                          <div class="avatar flex-shrink-0 me-3">
                            <img src="${contextPath}/resources/admin/assets//img/icons/unicons/cc-warning.png" alt="User" class="rounded" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">Mastercard</small>
                              <h6 class="mb-0">Ordered Food</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <h6 class="mb-0">-92.45</h6>
                              <span class="text-muted">USD</span>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <!--/ Transactions -->
              </div>
            </div>
            <!-- / Content -->
</body>
</html>