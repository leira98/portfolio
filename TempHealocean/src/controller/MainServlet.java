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
 * ���ʿ� ��û�� �ҷ����� ���� Ŭ�����̴�.
 */
public class MainServlet extends HttpServlet {
    private HashMap commands;
    public void init() {
        initCommands();
    }
    /**  Life Cycle  service() �޼���
     *  Http method�� POST ��û�� ó�����ִ� service �޼���
     */
    public void doPost(HttpServletRequest req,HttpServletResponse res)
    throws ServletException,IOException {
        processRequest(req,res);
    }
    /**  Life Cycle  service() �޼���
     *  Http method�� GET ��û�� ó�����ִ� service �޼���
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
        //�α���
        commands.put("login",new LoginMember("main.jsp"));
        //�α׾ƿ�
        commands.put("logout",new LogoutMember("main.jsp"));
        //ȸ�� ����
        commands.put("insert-member",new InsertMember("thank_you.jsp") );
        //ȸ������ ��ȸ
        commands.put("select-member",new SelectMember("member/updateMember.jsp") );
        //ȸ������ ����
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