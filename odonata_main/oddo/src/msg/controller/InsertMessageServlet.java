package msg.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import msg.model.service.MessageService;
import msg.model.vo.Message;

/**
 * Servlet implementation class InsertMessageServlet
 */
@WebServlet("/insert.ms")
public class InsertMessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMessageServlet() {
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String msgTitle = request.getParameter("msgTitle");
        String msgContent = request.getParameter("msgContent");
        String sendId = request.getParameter("sendId");
        String recvId = request.getParameter("recvId");
        
        Message m = new Message();
        m.setMessage_Title(msgTitle);
        m.setMessage_Text(msgContent);
        m.setSend_Id(sendId);
        m.setReceive_Id(recvId);
        
        int result = new MessageService().insertMessage(m);
        
        if (result > 0)
            response.sendRedirect("msgBoxForm.ms");
        else {
            request.setAttribute("msg", "메세지 전송 실패");
            request.getRequestDispatcher("WEB-INF/errorPage.jsp").forward(request, response);
        }
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
}
