<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PicChat</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" />
              <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
              <link href="css/ct-navbar.css" rel="stylesheet" />

</head>
<body>

   <nav class="navbar navbar-expand-lg navbar-dark bg-dark" >
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
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      
      
  </div>
</nav>

<div class="container">
<div class="jumbotron">
<br></br>
<br></br>
<h2 align="center">Create Profile </h2>

<div class="container" style="margin-top:100px">
<div class="row">
<div class="col-12" align = "center" style="margin-left:80px">

<form action="/upload" method = "POST" enctype = "multipart/form-data">
<input type="file" name="file"/>
</div>

<div class="container">

<div class="col-12">
<!-- <form action="user/add" method="post"> -->
 <div class="form-group">
    <label for="name">Full Name</label>
    <input type="text" name="name" class="form-control" id="name" placeholder="Enter Full Name">
  </div>
  <div class="form-group">
    <label for="email">Email address</label>
    <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
  </div>
   <div class="form-group">
    <label for="desc">Description</label>
    <input type="text" name="desc" class="form-control" id="desc" placeholder="Enter short description">
  </div>
 
  <button type="submit" class="btn btn-primary">Submit</button>
<!-- </form> -->

</div>

</div>

</div>

<div class="row" style="margin-top:100px">
<div class="col-12" align = "center">
<input type="submit" value = "Upload Profile Picture"/>
</form>
</div>
</div>

</div> 






</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="js/jquery-1.10.2.js"></script>
              <script src="js/bootstrap.js"></script>
              <script src="js/ct-navbar.js"></script>

</body>
</html>