<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "entity.QnAEntity" %>
<%@ page import = "vo.QnAVO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("euc-kr");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String passwd = request.getParameter("passwd");

  QnAEntity dbPro = QnAEntity.getInstance();
  int check = dbPro.deleteBoard(num, passwd);

  if(check==1){
%>
	  <meta http-equiv="Refresh" content="0;url=../qnaController?choice=getAll-board" >
<% }else{%>
       <script language="JavaScript">      
       <!--      
         alert("��й�ȣ�� ���� �ʽ��ϴ�");
         history.go(-1);
       -->
      </script>
<%
    }
 %>