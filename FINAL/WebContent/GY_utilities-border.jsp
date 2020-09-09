<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title> 귀영 css-1 </title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="asset/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- 제이쿼리 -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  
</head>

<style type="text/css">
.contentTopArea {
	/* 	width: 300px;
	height: 60px;
	border: 1px solid gray;
	margin-left: 15px;
	padding: 15px; */
	align-items: center;
	float: left;
	width: 43%;
	height: 40px;
	background-color: #f8f9fc;
	margin-top: -1.4rem;
}

.contentTopArea ul {
	list-style-type: none;
}

.contentTopArea ul li a {
	text-decoration: none;
	color: black;
}

.contentTopArea ul li a:hover {
	color: #4e73df;
}

.container-fluid {
	/* 	background-color:#dddfeb; */
	background-color: #f8f9fc;
	border-top: 1px solid #dddfeb;
	height: 1000px;
}

.card-body-container {
	display: inline-flex;
	flex-flow: row wrap;
}

.border-bottom-primary {
	border-top: 2.5rem solid #4e73df !important;
	width: 280px;
	height: 140px;
	margin-top: 5px;
	margin-left: 15px;
	margin-right: 20px;
	flex-wrap: nowrap;
	justify-content: space-between;
	align-content: space-around;
}

.card-body-2 {
	flex: 1 1 auto;
	min-height: 1px;
	padding-left: 1.25rem;
	padding-right: 1rem;
	padding-top: 0;
	padding-bottom: 1.25rem;
}

.modal-header {
	border-bottom: 1px solid #ffffff;
	vertical-align: middle;
}

.modal-footer {
	border-top: 1px solid #ffffff;
}

/* 모달 - input태그 선택시 css */
#pjtName:focus, #pjtInfo:focus {
	outline: 1.5px solid #4e73df;
}

/* 모달 - close 버튼 테두리제거 */
.modal-header .close {
	border: 0;
	outline: 0;	
}

/* 모달 - 라디오버튼 div */
.radioBtn {
	border-radius: 5px 5px 5px 5px;
	width: 300px;
	height: 60px;
	border: 1px solid gray;
	margin-left: 15px;
	padding: 15px;
	display: flex;
    align-items: center;
    float: left;
    width: 43%;
    font-size: 13px;
}

.radioBtn:nth-child(odd) {
	margin-left: 25px;
}

.radioBtn input {
	display: flex;
    align-items: center;
}

#selMember:focus, #pjtStartDate:focus, #pjtEndDate:focus {
	outline: 1.5px solid #4e73df;
}

.memList {
	margin-top: 10px;
	margin-left: 15px;
	font-size: 12px;
}

</style>

<script type="text/javascript">
$(function() {
    $("#modalSubmit").submit(function(){
    	/* 프로젝트 기간 제한설정 */
        var startDate = $('#pjtStartDate').val();
        var endDate = $('#pjtEndDate').val();
        //-을 구분자로 연,월,일로 잘라내어 배열로 반환
        var startArray = startDate.split('-');
        var endArray = endDate.split('-');   
        //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
        var start_date = new Date(startArray[0], startArray[1], startArray[2]);
        var end_date = new Date(endArray[0], endArray[1], endArray[2]);
             //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
        if(start_date.getTime() >= end_date.getTime()) {
            alert("종료일은 시작일 이후 날짜여야 합니다.");
            $("#pjtEndDate").focus();
            return false;
        }
    });
             
     /* 모달 submit시 프로젝트 영역 생성 */
      /*
      <div class="card mb-4 py-3 border-bottom-primary" id="newpjt">
         <div class="card-body-2">
         	<a style="display:inline-block; color:#828181; width:245px; height:15px; text-align:right; vertical-align:top;">
         	<sup><i data-toggle="modal" href="#myModal" id="config" class="fas fa-cog" style="font-size:12px; cursor:pointer;" onclick=""></i></sup></a>
         	<!-- 톱니바퀴 클릭시 모달에 입력했던 정보 불러오기 -->
         	<a href="업무리스트 생성 페이지로 이동" style="text-decoration:none; color:#828181; display:inline-block; margin-top:-10px;">
         	<i class="fas fa-check"></i>&nbsp;프로젝트명</a>
         </div>
       </div>
	 */

    $("#submitBtn").click(function(){
    	var pjtName = $("#pjtName").val();
    	var pjtEndDate = $("#pjtEndDate").val();
    	
    	if(pjtName==null || pjtName=="") {
    		alert("프로젝트 제목은 필수 입력사항입니다.");
    	} else if(!$(':input:radio[name=scope]:checked').val()) {
    		alert("공개범위는 필수 선택사항입니다.");
    	} else if(pjtEndDate==null || pjtEndDate=="") {
    		alert("프로젝트 기간은 필수 선택사항입니다.");
 	    } 

   		/* 톱니바퀴(id='config') 클릭시 모달에 입력했던 정보 불러오기 */
   		/* x(id='pjtdel') 클릭시 부모요소 가져와서 div삭제 및 db에서 delete */
       	var addTag = "<div class='card mb-4 py-3 border-bottom-primary' id='' onmouseover='confighover();' onmouseout='confighoverCan();'>"
       					+"<div class='card-body-2'>"
       		       			+"<a style='display:inline-block; color:#828181; width:245px; height:15px; text-align:right; vertical-align:top;'>"
       		     				+"<sup><i data-toggle='modal' href='#myModal' id='config' class='fas fa-cog' style='font-size:12px; cursor:pointer;' onclick=''></i>"
       		     				+"&nbsp;&nbsp;<i class='fas fa-times' id='pjtdel' style='font-size:13px; cursor:pointer;' onclick=''></i></sup></a>"
       		     			+"<a href='업무리스트 생성 페이지로 이동' style='text-decoration:none; color:#828181; display:inline-block; margin-top:-10px;'>"
       		     				+"<i class='fas fa-check'></i>&nbsp;프로젝트명</a>"
       		     		+"</div>"
       		   		+"</div>";
                  
       	$(".card-body-container").append(addTag);
    });

    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});

/* 톱니바퀴 숨김/보임
function confighover() {
	$("#config").css({"display":"block"});
}
function confighoverCan() {
	$("#config").css({"display":"none"});
}
*/


function radioBtnSelect(val) {
/* div 태그로 라디오버튼 체크하기 */
	var value = val;
	console.log(value);
	
	if(value == "public") {
		$("#private").removeAttr("checked");
		$("#public").attr("checked", true);
		
		$(".radioBtn:eq(0)").css({"border":"1.5px solid #4e73df", "border-radius":"5px 5px 5px 5px", "background-color":"#F8F6F6"});
		$(".radioBtn:eq(1)").removeAttr("style");
	} else if(value == "private"){
		$("#public").removeAttr("checked");
		$("#private").attr("checked", true);
		
		$(".radioBtn:eq(1)").css({"border":"1.5px solid #4e73df", "border-radius":"5px 5px 5px 5px", "background-color":"#F8F6F6"});
		$(".radioBtn:eq(0)").removeAttr("style");
	}
}

function selectMember() {
/* select태그 선택멤버 가져오기 */
	var select = document.getElementById("selMember");
	var memberName = select.options[select.selectedIndex].text;
	
	//var memberName = select.options[select.selectedIndex].value;
	// value값이 없으면 옵션 텍스트값 가져옴
	
	var user = "<span style='width:40px;'>"+memberName
			+" <i class='fas fa-times' style='font-size:10px; cursor:pointer;' onclick='userDel(\""+memberName+"\");'></i>　</span>";
	
	if(memberName!="멤버리스트") {
		$(".memList").append(user);
	}
}

function userDel(memberName) {
	var delUser = memberName;
	alert(delUser);
	// select option value에 사원번호 담고 span태그 id에 사원번호 가져와서 x클릭시 해당하는 아이디의 span태그 삭제하기
}

function modalReset() {
	/* 모달창 초기화  */
	$('#myModal').on('hidden.bs.modal', function (e) {
		$(this).find('form')[0].reset();
		$("#private").removeAttr("checked");
		$("#public").removeAttr("checked");
		$(".radioBtn:eq(0)").removeAttr("style");
		$(".radioBtn:eq(1)").removeAttr("style");
		$(".memList").html("");
	});

	/* 프로젝트 기간 - 시작일 설정(오늘 날짜) */
	document.getElementById('pjtStartDate').value = new Date().toISOString().substring(0, 10);
}
</script>


<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Components</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item" href="buttons.html">Buttons</a>
            <a class="collapse-item" href="cards.html">Cards</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item active">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Utilities</span>
        </a>
        <div id="collapseUtilities" class="collapse show" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="utilities-color.html">Colors</a>
            <a class="collapse-item active" href="utilities-border.html">Borders</a>
            <a class="collapse-item" href="utilities-animation.html">Animations</a>
            <a class="collapse-item" href="utilities-other.html">Other</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Addons
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="login.html">Login</a>
            <a class="collapse-item" href="register.html">Register</a>
            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="404.html">404 Page</a>
            <a class="collapse-item" href="blank.html">Blank Page</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter">3+</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 12, 2019</div>
                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fas fa-donate text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 7, 2019</div>
                    $290.29 has been deposited into your account!
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 2, 2019</div>
                    Spending Alert: We've noticed unusually high spending for your account.
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter">7</span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                    <div class="status-indicator"></div>
                  </div>
                  <div>
                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                    <div class="small text-gray-500">Jae Chun · 1d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                    <div class="status-indicator bg-warning"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie Luna</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
          <div class="contentTopArea" style="width:35%;">
          	<h1 class="h6 mb-1 text-gray-900" style="padding-top:16px; padding-left:35px; font-weight:bold; font-size:20px;">
          		<i class="fas fa-list"></i>&nbsp;&nbsp;삽입내용 미정</h1>
          </div>
          <div class="contentTopArea" style="width:35%;">
          	<ul class="h6 mb-1 text-gray-800" style="padding-top:20px; font-weight:bold; font-size:13px;">
	          	<li style="float:left; margin-left:90px;"><a href="#"><i class="fas fa-clipboard-list"></i>&nbsp;미정</a></li>
	          	<li style="float:left; margin-left:60px;"><a href="#"><i class="fas fa-paperclip"></i>&nbsp;미정</a></li>
          	</ul>
          </div>
          <div class="contentTopArea" style="width:30%;">
          	<h1 class="h6 mb-1 text-gray-800" style="padding-top:19px; padding-right:35px; font-weight:bold; text-align:right;">미정</h1>
          </div>
          <br><br><br>
        
        <div class="container-fluid" style="margin-top:-2.5rem;">
        <br>

          <!-- Content Row -->
          <div class="row">

			<div class="card-body-container">
              <div class="card mb-4 py-3 border-bottom-primary">
                <div class="card-body">
                	<a data-toggle="modal" href="#myModal" id="myBtn" style="text-decoration:none; color:#828181;" onclick="modalReset();">
                	<i class="fas fa-plus" style="font-size:20px;"></i>&nbsp;새 프로젝트</a>
                </div>
              </div>
              
            </div>
              
            <!-- --------------------------------- 모달창 --------------------------------- -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="myModalLabel" style="font-weight:bold; color:black; padding-left:10px; padding-top:10px;">새 프로젝트 생성하기 </h5>
			        <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			      </div>
			     <form action="" method="post" id="modalSubmit">
			     <!-- 서브밋 = 컨트롤러로 데이터 전달 / 프로젝트 생성 -->
				      <div class="modal-body">
				        	<h6 style="color:black; font-size:13px; font-weight:bold; margin-left:10px;">제목</h6>
				        	<input type="text" name="pjtName" id="pjtName" placeholder="예) 파이널 프로젝트"
				        		style="font-size:12px; width:430px; height:30px; margin-left:15px; padding:5px;" required><br><br>
				        		
				        	<h6 style="color:black; font-size:13px; font-weight:bold; margin-left:10px;">설명(선택사항)</h6>
				        	<input type="text" name="pjtInfo" id="pjtInfo"
				        		style="font-size:12px; width:430px; height:30px; margin-left:15px; padding:5px;"><br><br>
				        		
				        	<h6 style="color:black; font-size:13px; font-weight:bold; margin-left:10px;">공개범위</h6>
				        	<div class="radioBtn" onclick="radioBtnSelect(public.value);">
				        		<input type="radio" value="public" name="scope" id="public" required ><label for="public" style="margin-bottom:0rem;">&nbsp;&nbsp;전체공개</label>
				        	</div> 
				        	<div class="radioBtn" onclick="radioBtnSelect(private.value);">
				        		<input type="radio" value="private" name="scope" id="private"><label for="private" style="margin-bottom:0rem;">&nbsp;&nbsp;멤버공개</label>
				        	</div>
				        	<br><br><br><br>
				        	
				        	<span style="color:black; font-size:13px; font-weight:bold; margin-left:10px;">참여멤버(선택사항)</span>
				        	
				        	<span style="color:black; font-size:13px; font-weight:bold; margin-left:40px;">프로젝트 기간</span><br>
				        	
				        	<!-- js18_select 
				        	https://okky.kr/article/200742
				        	-->
				       		<select id="selMember" name="selMember" style="font-size:12px; width: 100px; height:25px; margin-left:15px; margin-top:5px;" onchange="selectMember();">
				       		<!-- 전체 멤버리스트 뿌리기  -->
				       			<option selected>멤버리스트</option>
				       			<option value="hong">홍길동</option>
				       			<option>이순신</option>
				       			<option>유관순</option>
				       		</select>

 				       		<input type="date" name="pjtStartDate" id="pjtStartDate" style="font-size:12px; width:125px; height:25px; margin-left:55px;">
 				       		~ 
 				       		<input type="date" name="pjtEndDate" id="pjtEndDate" style="font-size:12px; width:125px; height:25px;" required>
				       		
				       		<div class="memList">
				       		<!-- 참여멤버 리스트 출력 영역 -->
				       		</div>
				       		

				       		
				      </div>
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-primary" id="submitBtn" style="font-size:13px; font-weight:bold;">생성</button>
				      </div>
			      </form>
			    </div>
			  </div>
			</div>
            <!-- --------------------------------- 모달창 띄우기 --------------------------------- --> 

          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>
</html>