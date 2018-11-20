/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controlador.clsConcepto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Articuno
 */
public class IngresoConcepto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet IngresoConcepto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IngresoConcepto at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
*/
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
        HttpSession sesion=request.getSession();
        Integer intAccion=Integer.parseInt(request.getParameter("iAcc"));
        
        clsConcepto con = new clsConcepto();
       
        con.setCodigo(request.getParameter("CodigoConcepto"));
        con.setAño(Integer.parseInt(sesion.getAttribute("Año").toString()));
        con.setMes(Integer.parseInt(sesion.getAttribute("Mes").toString()));
        con.setDescripcion(request.getParameter("Descripcion"));
        con.setTipoConcepto(request.getParameter("tipoconcepto"));
        con.setFormula(request.getParameter("txtFormula"));
        
        if ("on".equals(request.getParameter("Obligatorio"))){
            con.setObligatorio(1);
        }else{
            con.setObligatorio(0);
        }
        
        if ("on".equals(request.getParameter("Imponible"))){
            con.setImponible(1);
        }else{
            con.setImponible(0);
        }
                
        if ("on".equals(request.getParameter("Tributable"))){
            con.setTributable(1);
        }else{
            con.setTributable(0);
        }
        
        con.setModo(request.getParameter("modo"));
        if ("".equals(request.getParameter("Monto"))){
            con.setMonto(0);
        }else{
            con.setMonto(Integer.parseInt(request.getParameter("Monto")));
        }
        
        if (intAccion==0){
            if (con.GuardarConcepto()){
                response.sendRedirect("ListarConceptos.jsp");
            }else{
                request.getSession().setAttribute("error", con.getError());
                response.sendRedirect("ListarConceptos.jsp");
            }
        }
        
        if (intAccion==1){
            if (con.ModificarConcepto()){
                response.sendRedirect("ListarConceptos.jsp");
            }else{
                request.getSession().setAttribute("error", con.getError());
                response.sendRedirect("ListarConceptos.jsp");
            }
        }
        
        if (intAccion==3){
            if (con.EliminarConcepto()){
                response.sendRedirect("ListarConceptos.jsp");
            }
        }
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
