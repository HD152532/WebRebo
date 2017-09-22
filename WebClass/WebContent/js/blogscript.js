// 로그인 부분
    $(document).ready(function(){
    	$('#LoginForm').submit(function(event){
    		//submit이 자동으로 되는 기능을 막기
    		event.preventDefault();
    		
    		//id,pwd 가져오기
    		//document,getElementById('id').value
    		var id = $('#id').val();
    		var pwd = $('#pwd').val();
    		console.log(id, pwd);
    		
    		//서버로 post전송
    		$.post("http://httpbin.org/post",
    				{"id" : id, "pwd" : pwd },
    				function(data){
    					var lgModal = $('#lgmodal');
    					lgModal.modal();
    					lgModal.find('.modal-body').text(data.form.id + "님 로그인 되었습니다.");
    				});
    		
    	});
    	
    	$('#signupForm').submit(function(event){
    		//submit이 자동으로 되는 기능을 막기
    		event.preventDefault();
    		
    		//name 가져오기
    		var name = $('#inputName').val();
    		console.log(name);
    		//서버로 post전송
    		$.post("http://httpbin.org/post",
    				{"name" : name},
    				function(data){
    					var signupModal = $('#signupsucmodal');
    					signupModal.modal();
    					signupModal.find('.modal-body').text(data.form.name + "님 회원가입 되었습니다.");
    				});
    		
    	});
    });

//함수
    function menu_over(e){
  	  e.setAttribute("class", "nav-item active"); //<li class="nav_item active">
    }
    function menu_out(e){
  	  e.setAttribute("class", "nav-item");      
    }