<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "org.dimigo.vo.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="\WebClass\css\blogcss.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
</head>
<body>

<!-- navbar 부분 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="blog2.html">
  	tjrcjf.BLog
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
  
  
    <ul class="navbar-nav mr-auto">
      <li class="nav-item" onmouseover="menu_over(this)" onmouseout="menu_out(this)">
        <a class="nav-link" href="profile.html">Profile</a>
      </li>
      <li class="nav-item" onmouseover="menu_over(this)" onmouseout="menu_out(this)">
        <a class="nav-link" href="arduino.html">Arduino</a>
      </li>
      <li class="nav-item" onmouseover="menu_over(this)" onmouseout="menu_out(this)">
        <a class="nav-link" href="song.html">Song</a>
      </li>
    </ul>
    <%-- 세션에  사용자 정보가 없는 경우 --%>
    <%
    	UserVO user = (UserVO)session.getAttribute("user");
    	if(user == null){
    %>
    <form>
    
    </form>
    <form class="form-inline my-2 my-lg-0" id = "LoginForm" action="/WebClass/bloglogin" method="post">
      <input name="id" class="form-control mr-sm-2" type="text" placeholder="ID" aria-label="id" id="id" value = "<%= (request.getAttribute("msg") == null) ? "" : request.getParameter("id") %>" required>
      <input name="pwd" class="form-control mr-sm-2" type="password" placeholder="PASSWORD" aria-label="pwd" id="pwd" required>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
    </form>
    <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#signupModal">Sign up</button>
    <%}else{ %>
    <%-- 세션에 사용자 정보가 있는 경우 --%>
	    <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
	    <li class="nav-item dropdown">
	      <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    	<%= user.getName()%>님
	      </a>
	      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="bd-versions">
	      	<form action = "/WebClass/bloglogout" method = "post">
	      	<button type="submit" class="dropdown-item">Sign out</button>
	      	</form>
	       	<div class="dropdown-divider"></div>
	        <button type="button" class="dropdown-item">Action1</button>
	        <button type="button" class="dropdown-item">Action2</button>
	      </div>
	    </li>
	    </ul>
	<%} %> 
  </div>
</nav>


<div class="container-fluid" id="fixed">
    <h3 class="text-light">
  		석철이의
  	<small class="text-secondary">블로그</small>
	</h3>
</div>

<div class="container-fluid">

<div class="jumbotron jumbotron-fluid mg-0">
  <div>
    <h1 class="display-3 text-primary" >Wellcome to tjrcjf's blog</h1>
    <p class="lead">If we worked on the assumption that what is accepted as true really is true, then there would be little hope for advance.</p>
    <p>Orville Wright</p>
  </div>
</div>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" >
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="\WebClass\image\DRONE.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="\WebClass\image\BALL.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="\WebClass\image\land.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</div>




<!--  회원 가입 모달 -->
<div class="modal" id="signupModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Sign up</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      
      <div class="modal-body">
      <div class="container">
  <form id="signupForm">
  <!-- 이름 -->
    <div class="form-group row">
      <label for="inputName" class="col-sm-2 col-form-label">Name</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="inputName" placeholder="Name" required>
      </div>
    </div>
    <!-- 번호 -->
    <div class="form-group row">
      <label for="inputNumber" class="col-sm-2 col-form-label">Number</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="inputNumber" placeholder="Number" required>
      </div>
    </div>
    <!-- 학년 -->
    <fieldset class="form-group">
            <legend class="col-form-legend col-sm-2">학년</legend>
      <div class="row">

        <div class="col-sm-10">
          <div class="form-check">
            <label class="form-check-label">
              <input class="form-check-input" type="radio" name="gridRadios" id="grade1" value="option1" checked>
              1학년
            </label>
          </div>
          <div class="form-check">
            <label class="form-check-label">
              <input class="form-check-input" type="radio" name="gridRadios" id="grade2" value="option2">
              2학년
            </label>
          </div>
          <div class="form-check">
            <label class="form-check-label">
              <input class="form-check-input" type="radio" name="gridRadios" id="grade3" value="option3">
              3학년
            </label>
          </div>
        </div>
      </div>
    </fieldset>
    <div class="form-group">
    <label for="exampleFormControlSelect1">반</label>
    <select class="form-control" id="exampleFormControlSelect1">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
      <option>6</option>
    </select>
  </div>
    <div class="form-group row">
      <div class="col-sm-10">
        <button type="submit" class="btn btn-outline-primary">Sign up</button>
      </div>
    </div>
  </form>
</div>
      </div>
      
      
    </div>
  </div>
</div>

<!--  회원가입 성공 모달 -->
<div class="modal" id="signupsucmodal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Sign up Result</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<footer class="py-1 bg-dark">
      <div class="container">
         <p class="m-0 text-center text-white">
            Jeong seok-chul's blog &copy; Telephone : 010-4139-3756 <br>
            Kakao Talk ID : tjrcf410@naver.com <br> Class: 2-5 Number:
            32
         </p>
         <br>
      </div>
      <!-- /.container -->
   </footer>
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
 
    <script type="text/javascript" src= "../js/blogscript.js"></script>
    <%@ include file="../jsp/modal.jsp" %>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

<script>
	<%-- 로그인이 실패한 경우 처리 추가 --%>
	<% 
		if("error".equals(request.getAttribute("msg"))){
	%>		
		var myModal = $('#myModal');
		myModal.find('.modal-title').text('Login Error');
		myModal.find('.modal-body').text('Invalid username or password');
		myModal.modal();
	<% } %>
</script>
</body>
</html>