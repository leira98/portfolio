<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "entity.QnAEntity" %>
<%@ page import = "vo.QnAVO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file= "color.jspf"%>

<%!    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    int pageNum = request.getAttribute("pageNum") != null ? Integer.parseInt(request.getAttribute("pageNum").toString()) : 1;
    int count = 0;
    int number=0;

    List boardList = null;
    if(request.getAttribute("count") != null) {
    	count = Integer.parseInt((request.getAttribute("count")).toString());
    } 
    
    if (count > 0) {
    	boardList = (List)request.getAttribute("list");
    }

	number=count-(pageNum-1)*10;
%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">


<!-- meta data -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!--font-family-->
		<link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        
        <!-- title of site -->
        <title>Directory Landing Page</title>

        <!-- For favicon png -->
		<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
       
        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!--linear icon css-->
		<link rel="stylesheet" href="assets/css/linearicons.css">

		<!--animate.css-->
        <link rel="stylesheet" href="assets/css/animate.css">

		<!--flaticon.css-->
        <link rel="stylesheet" href="assets/css/flaticon.css">

		<!--slick.css-->
        <link rel="stylesheet" href="assets/css/slick.css">
		<link rel="stylesheet" href="assets/css/slick-theme.css">
		
        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- bootsnav -->
		<link rel="stylesheet" href="assets/css/bootsnav.css" >	
        
        <!--style.css-->
        <link rel="stylesheet" href="assets/css/style.css">
        
        <!--responsive.css-->
        <link rel="stylesheet" href="assets/css/responsive.css">
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		
        <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->



</head>

<body bgcolor="<%=bodyback_c%>">

<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->
		
		<!--header-top start -->
		<header id="header-top" class="header-top">
			<ul>
				<li>
					<!--  
					<div class="header-top-left">
						<ul>
							<li class="select-opt">
								<select name="language" id="language">
									<option value="default">EN</option>
									<option value="Bangla">BN</option>
									<option value="Arabic">AB</option>
								</select>
							</li>
							<li class="select-opt">
								<select name="currency" id="currency">
									<option value="usd">USD</option>
									<option value="euro">Euro</option>
									<option value="bdt">BDT</option>
								</select>
							</li>
							<li class="select-opt">
								<a href="#"><span class="lnr lnr-magnifier"></span></a>
							</li>
						</ul>
					</div>
					-->
				</li>
				<li class="head-responsive-right pull-right">
					<div class="header-top-right">
						<ul>
							<%
							String memID = (String) session.getAttribute("Member.id");
							if (memID == null || memID.equals("")) {
						%>
						<a href="member/login.jsp" id="user"><i class="fa fa-user"></i>sign in</a>
						<%
							} else {
						%>
								<i class="fa fa-user"></i>
								<B><%=(String) session.getAttribute("Member.id")%>�� ȯ���մϴ�.</B>
								<br>
								<a href="mainController?choice=select-member">��������</a>
								<a href="mainController?choice=logout">�α׾ƿ�</a>
						<%
							}
						%>
						</ul>
					</div>
				</li>
			</ul>
					
		</header><!--/.header-top-->
		<!--header-top end -->

		<!-- top-area Start -->
		<section class="top-area">
			<div class="header-area">
				<!-- Start Navigation -->
			    <nav class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"  data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

			        <div class="container">

			            <!-- Start Header Navigation -->
			            <div class="navbar-header">
			                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
			                    <i class="fa fa-bars"></i>
			                </button>
			                <a class="navbar-brand" href="main.jsp">heal<span>ocean</span></a>

			            </div><!--/.navbar-header-->
			            <!-- End Header Navigation -->

			            <!-- Collect the nav links, forms, and other content for toggling -->
			            <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
			                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
			                    <li><a href="best.jsp">best</a></li>
			                    <li><a href="aiCommand.jsp">���� ��õ</a></li>
			                    <li><a href="all.jsp">���� �ٴ�</a></li>
			                    <li><a href='boardController?choice=getAll-board'>�ı�</a></li>
			                    <li><a href='qnaController?choice=getAll-board'>���� ����</a></li>
			                </ul><!--/.nav -->
			            </div><!-- /.navbar-collapse -->
			        </div><!--/.container-->
			    </nav><!--/nav-->
			    <!-- End Navigation -->
			</div><!--/.header-area-->
		    <div class="clearfix"></div>

		</section><!-- /.top-area-->
		<!-- top-area End -->


<div align="center"><b>�۸��(��ü ��:<%=count%>)</b>
<table width="1000">
<tr>
    <td align="right" bgcolor="<%=value_c%>">
    <a href="qnaBoard/writeForm.jsp">�۾���</a>
    </td>
</table>

<%
    if (count == 0) {
%>
<table width="1000" border="1" cellpadding="0" cellspacing="0">
<tr>
    <td align="center">
    �Խ��ǿ� ����� ���� �����ϴ�.
    </td>
</table>

<%  } else {    %>
<table border="1" width="1000" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30" bgcolor="<%=value_c%>"> 
      <td align="center"  width="50"  >�� ȣ</td> 
      <td align="center"  width="250" >��   ��</td> 
      <td align="center"  width="100" >�ۼ���</td>
      <td align="center"  width="150" >�ۼ���</td> 
      <td align="center"  width="50" >�� ȸ</td> 
     <!--  <td align="center"  width="100" >IP</td>    --> 
    </tr>
<%  
        for (int i = 0 ; i < boardList.size() ; i++) {
        	QnAVO board = (QnAVO)boardList.get(i);
%>
   <tr height="30">
    <td align="center"  width="50" > <%=number--%></td>
    <td  width="250" >
	<%
	      int wid=0; 
	      if(board.getRe_level()>0){
	        wid=5*(board.getRe_level());
	%>
	 <img src="qnaBoard/images/level.gif" width="<%=wid%>" height="16">
	 <img src="qnaBoard/images/re.gif">
	<%}else{%>
	 <img src="qnaBoard/images/level.gif" width="<%=wid%>" height="16">
	<%}%>
           
      <a href="qnaController?choice=get-board&num=<%=board.getNum()%>&pageNum=<%=pageNum%>">
           <%=board.getSubject()%></a> 
          <% if(board.getReadcount()>=20){%>
        <img src="qnaBoard/images/hot.gif" border="0"  height="16"><%}%> </td>
    <td align="center"  width="100"> 
       <a href="mailto:<%=board.getEmail()%>"><%=board.getWriter()%></a></td>
    <td align="center"  width="150"><%= sdf.format(board.getReg_date())%></td>
    <td align="center"  width="50"><%=board.getReadcount()%></td>
    
  </tr>
     <%}%>
</table>
<%}%>

<%
    if (count > 0) {
        int pageCount = count / 10 + ( count % 10 == 0 ? 0 : 1);
		 
        int startPage = (int)(pageNum/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="qnaController?choice=getAll-board&pageNum=<%= startPage - 10 %>&startRow=<%=(startPage - 1) * 10 + 1%>&endRow=<%=startPage * 10%>">[����]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="qnaController?choice=getAll-board&pageNum=<%= i %>&startRow=<%=(i - 1) * 10 + 1%>&endRow=<%=i * 10%>">[<%= i %>]</a>
<%                                      
        }
        if (endPage < pageCount) {  %>
        <a href="qnaController?choice=getAll-board&pageNum=<%= startPage + 10 %>&startRow=<%=(startPage - 1) * 10 + 1%>&endRow=<%=startPage * 10%>">[����]</a>
<%
        }
    }
%>
</div>

<!--footer start-->
		<footer id="footer"  class="footer">
			<div class="container">
				<div class="footer-menu">
		           	<div class="row">
			           	<div class="col-sm-3">
			           		 <div class="navbar-header">
				                <a class="navbar-brand" href="main.jsp">Heal<span>ocean</span></a>
				            </div><!--/.navbar-header-->
			           	</div>
			           	<div class="col-sm-9">
			           		<ul class="footer-menu-item">
			                    <li><a href="best.jsp">best</a></li>
			                    <li><a href="aiCommand.jsp">���� ��õ</a></li>
			                    <li><a href="all.jsp">���� �ٴ�</a></li>
			                    <li><a href='boardController?choice=getAll-board'>�ı�</a></li>
			                    <li><a href='qnaController?choice=getAll-board'>���� ����</a></li>
			                </ul><!--/.nav -->
			           	</div>
		           </div>
				</div>
				<div class="hm-footer-copyright">
					<div class="row">
						<div class="col-sm-5">
							<p>
								&copy;copyright. designed and developed by <a href="https://www.themesine.com/">themesine</a>
							</p><!--/p-->
						</div>
						<div class="col-sm-7">
							<div class="footer-social">
								<span><i class="fa fa-phone"> +1  (222) 777 8888</i></span>
								<a href="#"><i class="fa fa-facebook"></i></a>	
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-linkedin"></i></a>
								<a href="#"><i class="fa fa-google-plus"></i></a>
							</div>
						</div>
					</div>
					
				</div><!--/.hm-footer-copyright-->
			</div><!--/.container-->

			<div id="scroll-Top">
				<div class="return-to-top">
					<i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
				</div>
				
			</div><!--/.scroll-Top-->
			
        </footer><!--/.footer-->
		<!--footer end-->
		
		<!-- Include all js compiled plugins (below), or include individual files as needed -->

		<script src="assets/js/jquery.js"></script>
        
        <!--modernizr.min.js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
		
		<!--bootstrap.min.js-->
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- bootsnav js -->
		<script src="assets/js/bootsnav.js"></script>

        <!--feather.min.js-->
        <script  src="assets/js/feather.min.js"></script>

        <!-- counter js -->
		<script src="assets/js/jquery.counterup.min.js"></script>
		<script src="assets/js/waypoints.min.js"></script>

        <!--slick.min.js-->
        <script src="assets/js/slick.min.js"></script>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
		     
        <!--Custom JS-->
        <script src="assets/js/custom.js"></script>


</body>
</html>