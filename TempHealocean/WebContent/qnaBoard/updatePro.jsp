<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "entity.QnAEntity" %>
<%@ page import = "vo.QnAVO" %>
<%@ page import = "java.sql.Timestamp" %>

<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="board" scope="page" class="vo.QnAVO">
   <jsp:setProperty name="board" property="*"/>
</jsp:useBean>
<%
 
    String pageNum = request.getParameter("pageNum");

	QnAEntity dbPro = QnAEntity.getInstance();
    int check = dbPro.updateBoard(board);

    if(check==1){
%>
	  <meta http-equiv="Refresh" content="0;url=/qnaController?choice=getAll-board" >
<% }else{%>

 		<meta http-equiv="Refresh" content="0;url=/qnaController?choice=getAll-board" >

      <script language="JavaScript">      
      <!--      
        alert("비밀번호가 맞지 않습니다");
        history.go(-1);
      -->
     </script>
<%
    }
 %> 