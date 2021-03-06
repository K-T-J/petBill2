<%-- *** 전체내용 복붙해서 사용하시면 됩니다 *** --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta name="description" content="" />
		<meta name="author" content="" />
		<title>petBill</title>
		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<%-- 1. 부트스트랩 css 사용 --%>
		<link href="/petBill/resources/css/styles.css" rel="stylesheet" type="text/css">
		<!-- footer css -->
		<link href="/petBill/resources/css/footer.css" rel="stylesheet" type="text/css">
		
		<script>
		function addressKindChange(e) {
			
			var seoul = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", 
				"마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
			var gyeonggi = ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시",
				"수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시",
				"이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
			var incheon = ["강화군", "계양구", "남동구", "동구", "미추홀구", "부평구", "서구", "연수구", "옹진군", "중구"];
			var gangwon = ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군",
				"춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"];
			var chungnam = ["계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "예산군", "천안시",
				"청양군", "태안군", "홍성군"];
			var daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
			var chungbuk = ["괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군", "청주시", "충주시"];
			var sejong = ["세종시"];
			var busan = ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구",
				"영도구", "중구", "해운대구"];
			var ulsan = ["남구", "동구", "북구", "울주군", "중구"];
			var daegu = ["남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"];
			var gyoengbuk = ["경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군",
				"영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시 남구", "포항시 북구"];
			var gyeongnam = ["거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천군", "산청군", "양산시", "의령군", "진주시", "창녕군",
				"창원시", "통영시", "하동군", "함안군", "함양군", "합천군"];
			var jeonam = ["목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군",
				"강진군", "해남군", "영암군", "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군"];
			var gwangju = ["광산구", "남구", "동구", "북구", "서구"];
			var jeonbuk = ["전주시", "익산시", "군산시", "정읍시", "김제시", "남원시" ,"완주군", "고창군", "부안군", "임실군", "순창군", "진안군",
				"무주군", "장수군"];
			var jeju = ["제주시", "서귀포시"];
			
			var target = document.getElementById("addressKindD");
			
			if (e.value == "서울특별시") var si = seoul;
			else if (e.value == "경기도") var si = gyeonggi;
			else if (e.value == "인천광역시") var si = incheon;
			else if (e.value == "강원도") var si = gangwon;
			else if (e.value == "충청남도") var si = chungnam;
			else if (e.value == "대전광역시") var si = daejeon;
			else if (e.value == "충청북도") var si = chungbuk;
			else if (e.value == "세종특별자치시") var si = sejong;
			else if (e.value == "부산광역시") var si = busan;
			else if (e.value == "울산광역시") var si = ulsan;
			else if (e.value == "대구광역시") var si = daegu;
			else if (e.value == "경상북도") var si = gyoengbuk;
			else if (e.value == "경상남도") var si = gyeongnam;
			else if (e.value == "전라남도") var si = jeonam;
			else if (e.value == "광주광역시") var si = gwangju;
			else if (e.value == "전라북도") var si = jeonbuk;
			else if (e.value == "제주특별자치도") var si = jeju;
			
			target.options.length = 0;
			
			for (x in si) {	
				var opt = document.createElement("option"); // 문서 안에 괄호 안에 있는 요소를 만든다는 의미를 가진다. <option></option>
				opt.value = si[x];							// <option>[값]</option>
				opt.innerHTML = si[x];						// <option>[값, HTML과 XML]</option>
				target.appendChild(opt); // appendChild() ? 뭐냐 너 뭐하는 자식이냐?  
				
			}
		}
		</script>
		
		
	</head>

	
	<body>
	
		<div class="d-flex" id="wrapper">
			<%-- 왼쪽 메인 메뉴 --%>
			<div class="border-end bg-white" id="sidebar-wrapper">
				<%-- 로고 --%>
				<div class="sidebar-heading border-bottom bg-light">
					<a href="/petBill/user/main.pet">
						<img src="/petBill/resources/imgs/로고화면.png" style="width: 190px; margin-top: 10px;">
					</a>
				</div>
				<div class="list-group list-group-flush">
					<a class="list-group-item list-group-item-action list-group-item-light p-3" href="/petBill/search/mapMain.pet?petType=${param.petType}">지도 병원검색</a> 
					<a class="list-group-item list-group-item-action list-group-item-light p-3" href="/petBill/search/searchResult.pet?pageNum=1&petType=${param.petType}">시/도 병원검색</a> 
					<a class="list-group-item list-group-item-action list-group-item-light p-3" href="/petBill/hospital/hosCompare.pet?petType=${param.petType}">병원 비교하기</a> 
					<a class="list-group-item list-group-item-action list-group-item-light p-3" href="/petBill/admin/noticeList.pet?petType=${param.petType}">공지사항</a>
				</div>
			</div>
			<%-- Page content wrapper --%>
			<div id="page-content-wrapper">
				<%-- 상단 네비게이션 --%>
				<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
					<div class="container-fluid">
						<%-- 반응형 동작시 버튼생김 --%>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
								<li>
									<%-- 위치 변경필요할듯 search(검색)form 조장님 수정부분 --%>
									<form action="/petBill/search/searchResult.pet">
										<input type="search" name="search" placeholder="병원명 입력"/>
										<input type="hidden" name="petType" value="${param.petType}"/>
										<input type="submit" value="검색" class="btn btn-secondary btn-sm"/>                 
									</form>
								</li>
		
								<%-- 로그인 분기처리 --%>
                                <c:if test="${sessionScope.userId eq 'admin'}">	
		                        	<li class="nav-item active"><a class="nav-link" href="/petBill/user/logoutPro.pet">로그아웃</a></li>
		                       		<li class="nav-item"><a class="nav-link" href="/petBill/admin/adMain.pet">관리자 페이지</a></li>
		                        </c:if>
                                <c:if test="${sessionScope.userId == null && sessionScope.kakaoId == null}">	
		                        	<li class="nav-item active"><a class="nav-link" href="/petBill/user/loginForm.pet">로그인</a></li>
		                       		<li class="nav-item"><a class="nav-link" href="/petBill/user/userSignupForm.pet">회원가입</a></li>
		                        </c:if>
		                        <c:if test="${sessionScope.kakaoId != null ||sessionScope.userId != null && sessionScope.userId ne 'admin'}">
		                        	<li class="nav-item active"><a class="nav-link" href="/petBill/user/logoutPro.pet">로그아웃</a></li>
		                       		<li class="nav-item"><a class="nav-link" href="/petBill/user/userMypage.pet">마이페이지</a></li>
		                        </c:if>
	
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">검색동물 변경</a>
									<div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="/petBill/search/searchResult.pet?petType=${'dog'}&diagnosis=${'dAllTest'}">강아지</a>
		                            	<a class="dropdown-item" href="/petBill/search/searchResult.pet?petType=${'cat'}&diagnosis=${'cAllTest'}">고양이</a>
									</div>
								</li>
							</ul>
							<c:if test="${param.petType eq 'dog'}">
                            	<img src="/petBill/resources/imgs/10.png" style="width: 50px; height: 50px">
                            </c:if>
                            <c:if test="${param.petType eq 'cat'}">
                            	<img src="/petBill/resources/imgs/11.png" style="width: 50px; height: 50px">
                            </c:if>
						</div>
					</div>
				</nav>
	
				<%-- ================================================== 공통 메뉴 구분선 ========================================================== --%>
	
				<%-- 페이지 내용작성 영역 : Page content --%>
				<div class="container-fluid" style="white-space:nowrap;">
				
				<c:if test="${count == 0}">
				<%-- 병원 시/도 및 시/구 선택 --%>
				<br />
					<div align="center">
						<table class="table table-bordered">
						<caption>시/도 병원검색</caption>
 							 <thead>
								<tr>
									<td>
										<form action="searchResult.pet">
										<%-- 시/도 select box (부모) --%>
										<label for="addressKindU">시/도 선택</label>
											<select name="sidoSel" id="addressKindU" onchange="addressKindChange(this)">
												<option>선택해주세요</option>
												<option value="서울특별시">서울특별시</option>
												<option value="경기도">경기도</option>
												<option value="인천광역시">인천광역시</option>
												<option value="강원도">강원도</option>
												<option value="충청남도">충청남도</option>
												<option value="대전광역시">대전광역시</option>
												<option value="충청북도">충청북도</option>
												<option value="세종특별자치시">세종특별자치시</option>
												<option value="부산광역시">부산광역시</option>
												<option value="울산광역시">울산광역시</option>
												<option value="대구광역시">대구광역시</option>
												<option value="경상북도">경상북도</option>
												<option value="경상남도">경상남도</option>
												<option value="전라남도">전라남도</option>
												<option value="광주광역시">광주광역시</option>
												<option value="전라북도">전라북도</option>
												<option value="제주특별자치도">제주특별자치도</option>
											</select>
										<%-- 시/구 select box (자식) --%>
										<label for="addressKindD">시/구 선택</label>
											<select id="addressKindD" name="siguSel">
												<option>선택해주세요</option>
											</select>
											<input type="hidden" name="petType" value="${param.petType}"/>
											<input type="submit" value="검색"  class="btn btn-secondary btn-sm" />
										</form>
									</td>
								</tr>
							</thead>
						</table>
					</div>
					<div align="center">
						<table>
							<tbody>
								<tr>
									<td>
										해당 지역에 공공데이터 포털의 DB 병원 정보가 없습니다.
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
				</c:if>	
				
				<c:if test="${count != 0}">
				<%-- 병원 시/도 및 시/구 선택 --%>
				<br />
					<div align="center">
						<table class="table table-bordered table-hover">
						<caption>시/도 병원검색</caption>
  							<thead>
								<tr>
									<td>
										<form action="searchResult.pet">
										<%-- 시/도 select box (부모) --%>
										<label for="addressKindU">시/도 선택</label>
											<select name="sidoSel" id="addressKindU" onchange="addressKindChange(this)">
												<option>선택해주세요</option>
												<option value="서울특별시">서울특별시</option>
												<option value="경기도">경기도</option>
												<option value="인천광역시">인천광역시</option>
												<option value="강원도">강원도</option>
												<option value="충청남도">충청남도</option>
												<option value="대전광역시">대전광역시</option>
												<option value="충청북도">충청북도</option>
												<option value="세종특별자치시">세종특별자치시</option>
												<option value="부산광역시">부산광역시</option>
												<option value="울산광역시">울산광역시</option>
												<option value="대구광역시">대구광역시</option>
												<option value="경상북도">경상북도</option>
												<option value="경상남도">경상남도</option>
												<option value="전라남도">전라남도</option>
												<option value="광주광역시">광주광역시</option>
												<option value="전라북도">전라북도</option>
												<option value="제주특별자치도">제주특별자치도</option>
											</select>
										<%-- 시/구 select box (자식) --%>
										<label for="addressKindD">시/구 선택</label>
											<select id="addressKindD" name="siguSel">
												<option>선택해주세요</option>
											</select>
											<input type="hidden" name="petType" value="${param.petType}"/>
											<input type="submit" value="검색" class="btn btn-secondary btn-sm"/>
										</form>
									</td>
								</tr>
							</thead>
						</table>
					</div>
					
					<%-- ** 병원 list 뿌려주기 ** --%>
					<%-- 시/도 선택X 시 뿌려줄 병원 list --%>
					<br />
					<c:if test="${sessionScope.kakaoId == null && sessionScope.userId == null && sessionScope.userId ne 'admin'}">
        				<p class="lead" align="center">로그인하시면 더 많은 정보를 확인하실 수 있습니다.</p>
                    </c:if>
					<div align="center">
						<table class="table table-bordered table-hover">
 							 <thead>
								<tr class="table-dark" align="center">
									<th>번호</th>
									<th>병원명</th>
									<th>주소</th>
									<th>전화번호</th>
									<th>리뷰수</th>
								</tr>
							</thead>
						<c:forEach var="hos" items="${hosList}">
							<tbody>
								<tr>
									<td align="center">${number}
										<c:set var="number" value="${number - 1}" />
									</td>
									<td>
									<%-- petType : cat / dog hosContent 접근 수정 : 혜란 --%>
										<%-- sessionScop : 로그인 상태에 따라 cat/dog hosContent 접근 가능/불가능 추가 : 건우 --%>
										<c:if test="${sessionScope.kakaoId != null || sessionScope.userId != null || sessionScope.userId eq 'admin'}">
					           				<c:if test="${param.petType eq 'cat'}">
					           					<a href="/petBill/hospital/hosContent.pet?petType=${param.petType}&hosNo=${hos.hosNo}&pageNum=${pageNum}&hosSi=${hos.hosSi}&hosGu=${hos.hosGu}&diagnosis=${'cAllTest'}" class="nav-link"> ${hos.hosName} </a>
					           				</c:if>
					           				<c:if test="${param.petType ne 'cat'}">
					           					<a href="/petBill/hospital/hosContent.pet?petType=${param.petType}&hosNo=${hos.hosNo}&pageNum=${pageNum}&hosSi=${hos.hosSi}&hosGu=${hos.hosGu}&diagnosis=${'dAllTest'}" class="nav-link"> ${hos.hosName} </a>
					           				</c:if>
				                        </c:if>
				                        <c:if test="${sessionScope.kakaoId == null && sessionScope.userId == null && sessionScope.userId ne 'admin'}">
				                        	<c:if test="${param.petType eq 'cat'}">
					           					${hos.hosName}
					           				</c:if>
					           				<c:if test="${param.petType ne 'cat'}">
					           					${hos.hosName}
					           				</c:if>
				                        </c:if>
									</td>
									<td>
										${hos.hosNewAddress}
									</td>
									<td align="center">
										${hos.hosNum}
									</td>
									<td  align="center">
									<c:if test="${hos.revCount == 0}">
										-
									</c:if>
									<c:if test="${hos.revCount != 0}">
										${hos.revCount}									
									</c:if>
									</td>
								</tr>
							</tbody>
						</c:forEach>
						</table>
					</div>
				</c:if>	
				
				<br />
	
					<%-- ** 페이지 번호 뿌리기 위한 변수 생성 ** --%>
					<div align="center">
					
						<%-- DB에 저장되어있는 병원의 수가 0보다 크면 if문 실행 --%>
						<c:if test="${count > 0}">
							<%-- 하단 페이지 블럭 생성 변수 --%>
							<c:set var="pageBlock" value="5" />
							<%-- res 변수를 생성 및 연산하여 'pageCount' 에 넣어줄 변수 생성 --%>
							<%-- 					 res(441) = 4413 / 10  --%>
							<fmt:parseNumber var="res" value="${count / pageSize}" integerOnly="true" />
							<%-- 'pageCount'로 총 몇 페이지가 나오는지 계산 하기 위함 --%>
							<%-- res(441) + (hosCount(4413) % pageSize(10) == 0이 맞아? 0(true) : 1(false) --%>
							<c:set var="pageCount" value="${res + (count % pageSize == 0 ? 0 : 1)}" />
							<%-- 'result'변수를 생성 및 연산하여 'startPage' 에 담기   --%>
							<%-- 				result(0) = (1경우)(currentPage(pageNum)  - 1) / pageBlock(5)	 --%>
							<%-- fmt:parseNumber : "문자열" -> 숫자 형으로 변환 후 'parseNumber'로 ex) 1,000,000 ',' 자동으로 생성해줌  --%>
							<fmt:parseNumber var="result" value="${(currentPage - 1) / pageBlock}" integerOnly="true" />
							<%-- 하단의 페이지 설정을 위한 하단번호의 startPage 설정 --%>
							<%-- 					startPage(1) = (result(0) * pageBlock(5) = 0) + 1 --%>
							<fmt:parseNumber var="startPage" value="${result * pageBlock + 1}" />
							<%-- 하단의 페이지 설정을 위한 하단 번호의 endPage 설정 --%>
							<%--					endPage(5) = (startPage(1) +  pageBlock(5) = 6) - 1 --%>
							<fmt:parseNumber var="endPage" value="${startPage + pageBlock - 1}" />
							<%-- 하단 번호의 endPage의 번호가 pageCount 보다 크면 덮어씌우 --%>
							<c:if test="${endPage > pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>
	
							<%-- ** 선택/검색X 보여질 페이징 처리 ** --%>
							<c:if test="${sidoSel == null && siguSel == null && search == null}">
								<c:if test="${startPage > pageBlock}">
									<a href="/petBill/search/searchResult.pet?pageNum=${startPage - pageBlock}&petType=${param.petType}" class="page-link"> &lt;</a>
								</c:if>
								<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
									<a href="/petBill/search/searchResult.pet?pageNum=${i}&petType=${param.petType}" class="page-link">${i}</a>
								</c:forEach>
								<c:if test="${endPage < pageCount}">
									<a href="/petBill/search/searchResult.pet?pageNum=${startPage + pageBlock}&petType=${param.petType}" class="page-link"> &gt; </a>
								</c:if>
							</c:if>
						
							<%-- ** 검색O 보여질 페이징 처리 ** --%>
							<c:if test="${search != null}">
								<%-- 왼쪽 꺽쇄 '<'  --%>
								<c:if test="${startPage > pageBlock}">
									<a href="/petBill/search/searchResult.pet?pageNum=${startPage - pageBlock}&search=${search}&petType=${param.petType}" class="page-link"> &lt;</a>
								</c:if>
								<%-- 페이지 하단번호 뿌리기 ex < 1 2 3 4 5 > --%>
								<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
									<a href="/petBill/search/searchResult.pet?pageNum=${i}&search=${search}&petType=${param.petType}" class="page-link">${i}</a>
								</c:forEach>
								<%-- 오른쪽 꺽쇄 '>'  --%>
								<c:if test="${endPage < pageCount}">
									<a href="/petBill/search/searchResult.pet?pageNum=${startPage + pageBlock}&search=${search}&petType=${param.petType}" class="page-link"> &gt; </a>
								</c:if>
							</c:if>
							
							<%-- ** 시/도O, 시/구O 보여질 페이징 처리 ** --%>
							<c:if test="${sidoSel != null && siguSel != null}">
								<%-- 왼쪽 꺽쇄 '<'  --%>
								<c:if test="${startPage > pageBlock}">
									<a href="/petBill/search/searchResult.pet?pageNum=${startPage - pageBlock}&sidoSel=${sidoSel}&siguSel=${siguSel}&petType=${param.petType}" class="page-link"> &lt;</a>
								</c:if>
								<%-- 페이지 하단번호 뿌리기 ex < 1 2 3 4 5 > --%>
								<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
									<a href="/petBill/search/searchResult.pet?pageNum=${i}&sidoSel=${sidoSel}&siguSel=${siguSel}&petType=${param.petType}" class="page-link">${i}</a>
								</c:forEach>
								<%-- 오른쪽 꺽쇄 '>'  --%>
								<c:if test="${endPage < pageCount}">
									<a href="/petBill/search/searchResult.pet?pageNum=${startPage + pageBlock}&sidoSel=${sidoSel}&siguSel=${siguSel}&petType=${param.petType}" class="page-link"> &gt; </a>
								</c:if>
							</c:if>
						</c:if>
					</div>
				</div>
				<%-- container-fluid 내용작성 영역 --%>
			</div>
			<%-- page-content-wrapper 꺼 --%>
		</div>
		
	<!-- footer -->
	<footer class="footer">
		<div class="container bottom_border">
			<div class="row">
				<div class=" col-sm-4 col-md col-sm-4  col-12 col">
					<h1 class="headin5_amrc col_white_amrc pt2">🚑𝖕𝖊𝖙𝕭𝖎𝖑𝖑</h1>
				</div>
				
				<div class=" col-sm-4 col-md col-sm-4  col-12 col">
					<h5 class="headin5_amrc col_white_amrc pt2">🐕Bootstrap</h5>
					<!--headin5_amrc-->
					<p class="mb10">http://bootstrapk.com</p>
				</div>
				
				<div class=" col-sm-4 col-md col-sm-4  col-12 col">
					<h5 class="headin5_amrc col_white_amrc pt2">🐈Naver</h5>
					<!--headin5_amrc-->
					<p class="mb10">https://developers.naver.com/main</p>
				</div>
				
				<div class=" col-sm-4 col-md col-sm-4  col-12 col">
					<h5 class="headin5_amrc col_white_amrc pt2">🦮Kakao</h5>
					<!--headin5_amrc-->
					<p class="mb10">https://tableblog.tistory.com/117</p>
					<p class="mb10">https://developers.kakao.com/</p>
				</div>
				
				<div class=" col-sm-4 col-md col-sm-4  col-12 col">
					<h5 class="headin5_amrc col_white_amrc pt2">🐕‍🦺‍Chartjs</h5>
					<!--headin5_amrc-->
				<p class="mb10">https://www.chartjs.org/</p>
				</div>
			</div>
		</div>
		
		<div class="container">
			<ul class="foote_bottom_ul_amrc">
				<li>👨‍⚕️이건우</li>
				<li>👩‍⚕️안혜란</li>
				<li>👨‍⚕️김태준</li>
				<li>👩‍⚕️정샛별</li>
				<li>👨‍⚕️이용훈</li>
			</ul>
		</div>
	</footer>
		
		
		
		
		
		<%-- wrapper 꺼 --%>
		<%-- 2. 부트스트랩 core JS --%> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
		<%-- 3. Core theme JS --%> 
		<script src="/petBill/resources/js/scripts.js"></script>
	
	
	</body>
</html>