<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Friends</title>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" />
              <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
              <link href="css/ct-navbar.css" rel="stylesheet" />

</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
   <a class="navbar-brand" href="#">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Creative-Tail-atomi.svg/128px-Creative-Tail-atomi.svg.png" width="30" height="30" alt="">
  </a>
  <a class="navbar-brand" href="#">PicChat</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    
      <li class="nav-item active">
        <a class="nav-link" href="#">Profile <span class="sr-only">(current)</span></a>
     
      
  </div>
</nav>


<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else {
      // The person is not logged into your app or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '977158602459676',
      cookie     : true,  // enable cookies to allow the server to access 
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });

    // Now that we've initialized the JavaScript SDK, we call 
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')
    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me?fields=id,name,email', function(response) {
      //console.log('Successful login for: ' + response.name);
      console.log(response);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
      $('[name="myId"]').val(response.id);
      $('[name="myNmae"]').val(response.id);
      $('[name="myEmail"]').val(response.id);
    });
    
    FB.api('/me/friends', function(response) {
        //console.log('Successful login for: ' + response.name);
        console.log(response);
      response.data.forEach(function(user,i){
    	  $("#tableBody").append(
    			 '<tr><th scope="row">'+ i + '</th>' + 
    			 '<td>'+ user.name + '</td>'
    			 + '<td>' + user.id + '</td>'+' </tr>');
    	   var earlierVal = $('[name="myfriends"]').val();
    		$('[name="myfriends"]').val(earlierVal + user.id+"/" + user.name +"/"); 
      });
      //$("#redirectForm").submit();
      });
  }
</script>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

<!-- <fb:login-button class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false" scope="public_profile,email,user_friends" onlogin="checkLoginState();">
</fb:login-button> -->


<div class="container">

<div class="jumbotron">
<form id="home" action="home">
<div class="row"> 
<div class="col-12" align = "center" style="margin-left:30px">

<fb:login-button class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false" scope="public_profile,email,user_friends" onlogin="checkLoginState();" action="home">
</fb:login-button>
</div>
</div>
<div class="row">
<div class="col-12" align = "center" style="margin-left:40px">
<div id="status">
</div>
</div>
</div>
</form>
</div>

</div>  




<div class="container">
<div class="jumbotron">
<div class="row">
<table class="table">
<thead>
<tr>
<th scope="col">
#
</th>
<th scope="col">
Name
</th>
<th scope="col">
FB ID
</th>
</tr>
</thead>

<tbody id="tableBody">
</tbody>
</table>
</div>

</div>
</div>
<form action="profile">
<button type="submit" class="btn btn-primary">View Profile</button>
</form>

<form id="redirectForm" method="post" action="facebookRedirect">
<input type="hidden" name="myId"/>
<input type="hidden" name="myName"/>
<input type="hidden" name="myFriends"/>
<input type="hidden" name="myEmail"/>
</form>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="js/jquery-1.10.2.js"></script>
              <script src="js/bootstrap.js"></script>
              <script src="js/ct-navbar.js"></script>

</body>
</html>