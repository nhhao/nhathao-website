/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoang
 */

@WebServlet(name = "Assignment5", urlPatterns = "/assignmentt5")
public class Assignment5 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String url = "";
            
            String customerPhone_i = request.getParameter("customerPhone");
            String CreditNum_i = request.getParameter("CreditNum");
            String Email_i = request.getParameter("customerEmail");
            int Yearpick = Integer.parseInt(request.getParameter("expYearCredit"));
            int Monthpick = Integer.parseInt(request.getParameter("expMonthCredit"));
            
            Pattern customerPhone_pattern = Pattern.compile("\\d{3}-\\d{3}-\\d{4}");
            Matcher customerPhone_matcher = customerPhone_pattern.matcher(customerPhone_i);
            
            Pattern CreditNum_pattern = Pattern.compile("\\d{16}");
            Matcher CreditNum_matcher = CreditNum_pattern.matcher(CreditNum_i);
            
            Pattern Email_pattern = Pattern.compile("\\w+@\\w+(.\\w+)*");
            Matcher Email_matcher = Email_pattern.matcher(Email_i);
            
            GregorianCalendar calendar = new GregorianCalendar();
            int yearNow = calendar.get(Calendar.YEAR);
            int monthNow = calendar.get(Calendar.MONTH);
            
            int kk = 0;
            
            if(!customerPhone_matcher.matches())
            {
                request.setAttribute("Phone_error", "Your must enter 10 digits number as format.");
                kk++;
            }
            else
            {
                request.setAttribute("Phone_error", "");
            }
            
            if(!CreditNum_matcher.matches())
            {
                request.setAttribute("CreditNum_error","You must enter 16 digits number.");
                kk++;
            }
            else
            {
                request.setAttribute("CreditNum_error","");
            }
            
            if(!Email_matcher.matches())
            {
                request.setAttribute("Email_error", "Youir must enter email as format example@example.com");
                kk++;
            }
            else
            {
                request.setAttribute("Email_error", "");
            }
            
            if(Yearpick < yearNow || (Yearpick == yearNow && Monthpick < monthNow))
            {
                request.setAttribute("cal_error","Your card has expired!");
                kk++;
            }
            else
            {
                request.setAttribute("cal_error","");
            }
            
            if(kk != 0)
            {
                url = "/ass5/errorass5.jsp";
            }
            else
            {
                url = "/ass5/success.html";
            }
            
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
