<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ page trimDirectiveWhitespaces="true" %>
<header>
  <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top"  style="background-color: #fff;">
      <div class="header container" s>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active">
            	<a href="greenProject" style="width:60px; height:50px; padding:0px;">
            		<img src="/resources/images/cmapaignBoardimage/images/logo.png" style="width:100%; height:100%">
            	</a>
            </li>
            <li><a href="/client/campaignBoard/about">소개</a></li>
            <li><a href="/client/campaignBoard/campaignBoardList">캠페인</a></li>
            <li><a href="/client/mission/missionList">미션</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객센터<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">공지사항</a></li>
                <li><a href="#">Q & A</a></li>
              </ul> 
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/profile/mainMypage"><img alt="마이페이지" title="마이페이지" src="/resources/images/common/myPage.png" style="width: 20px;height: 20px"></a></li>
            
					<c:if test="${pvo == null}">
						<li><a href="/profile/login"><img src="/resources/images/common/signIn.png" title="로그인" style="width: 20px;height: 20px" ></a></li> 
						<li><a href="/profile/memberJoinForm"><img src="/resources/images/common/singUp.png" style="width: 20px;height: 20px"></a></li>
					</c:if>
					
					<c:if test="${pvo != null}">
						<li><a href="/profile/logout"><img src="/resources/images/common/signIn.png" title="로그아웃" style="width: 20px;height: 20px"></a> </li>
						<li><a href="/profile/mainMypage"><img src="/resources/images/common/singUp.png" title="회원가입 " style="width: 20px;height: 20px"></a></li>
					</c:if>
          </ul>
        </div><!--/.nav-collapse -->
      </div> 
    </nav>
</header>

