package controller;

import javax.servlet.*;
import javax.servlet.http.*;

import member.Command;
import member.CommandToken;
import member.InsertMember;
import member.LoginMember;
import member.LogoutMember;
import member.SelectMember;
import member.UpdateMember;

import java.io.*;
import java.util.*;

import exception.CommandException;
/**
 * 최초에 요청시 불려지는 서블릿 클래스이다.
 */
public class MainServlet extends HttpServlet {
    private HashMap commands;
    public void init() {
        initCommands();
    }
    /**  Life Cycle  service() 메서드
     *  Http method중 POST 요청을 처리해주는 service 메서드
     */
    public void doPost(HttpServletRequest req,HttpServletResponse res)
    throws ServletException,IOException {
        processRequest(req,res);
    }
    /**  Life Cycle  service() 메서드
     *  Http method중 GET 요청을 처리해주는 service 메서드
     */
    public void doGet(HttpServletRequest req, HttpServletResponse res)
    throws ServletException,IOException {
        processRequest(req,res);
    }
    
    public void processRequest(HttpServletRequest request,HttpServletResponse response)
    throws ServletException,IOException{
        //request data encoding
        request.setCharacterEncoding("euc-kr");
        // Declare the dispatcher for the View
        RequestDispatcher view = null;
        String next;
        
        try {
            Command cmd = lookupCommand(request.getParameter("choice"));
            next = cmd.doExecute(request,response);
            CommandToken.set(request);
            System.out.println("next " + next);
            view = request.getRequestDispatcher(next);
            view.forward(request, response);
        }catch(Exception e) {
            request.setAttribute("javax.servlet.error.exception", e);
            request.setAttribute("javax.servlet.error.request_uri",request.getRequestURI());
            view = request.getRequestDispatcher("incl/exceptionDisplay.jsp");
            view.forward(request, response);
        }
        
    }
    
    private void initCommands() {
        commands = new HashMap();
        //로그인
        commands.put("login",new LoginMember("main.jsp"));
        //로그아웃
        commands.put("logout",new LogoutMember("main.jsp"));
        //회원 가입
        commands.put("insert-member",new InsertMember("thank_you.jsp") );
        //회원정보 조회
        commands.put("select-member",new SelectMember("member/updateMember.jsp") );
        //회원정보 갱신
        commands.put("update-member",new UpdateMember("thank_you.jsp") );
        
        
       
    }
    
    private Command lookupCommand(String cmd) throws Exception {
        //System.out.println("cmd "  + cmd + " " + cmd.toLowerCase());
        if( commands.containsKey(cmd) )
            return (Command)commands.get(cmd);
        else
            throw new Exception(new CommandException("Invalid Command Indetifier"));
    }
    
}