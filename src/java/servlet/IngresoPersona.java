/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controlador.clsFuncionario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Articuno
 */
public class IngresoPersona extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /*protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet IngresoPersona</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IngresoPersona at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }*/

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
        //processRequest(request, response);
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
        //processRequest(request, response);
        Integer intAccion=Integer.parseInt(request.getParameter("iAcc"));
        
        clsFuncionario per = new clsFuncionario();
        
        String CodigoPersona=request.getParameter("RutPersona");
        per.setRut(CodigoPersona);
        
        if (intAccion!=3){
            //INGRESO DATOS PERSONA
            //String RutPersona=request.getParameter("RutPersona");           
            per.setNombre(request.getParameter("Nombre"));
            per.setApellidoPaterno(request.getParameter("Paterno"));
            per.setApellidoMaterno(request.getParameter("Materno"));
            per.setFechaNacimiento(request.getParameter("Fecha"));
            per.setGenero(request.getParameter("Genero"));
            per.setDireccion(request.getParameter("Direccion"));
            per.setNacionalidad(Integer.parseInt(request.getParameter("Nacionalidad")));
            per.setTipoTrabajador(Integer.parseInt(request.getParameter("TipoTrabajador")));
            per.setTelefono(request.getParameter("Telefono"));
            per.setCelular(request.getParameter("Celular"));
            per.setMail(request.getParameter("Email"));
            
            //INGRESO DATOS PREVISIONALES SALUD
            if ("1".equals(request.getParameter("optSalud"))){
                per.setSalud(7);
                per.setFechaIngresoIsapre("01/01/1900");
                per.setMontoPactado(0.0);
                per.setTipoMonedaSalud(0);
                per.setNumContratoIsapre("0");
            }else{
                per.setSalud(Integer.parseInt(request.getParameter("Salud")));
                per.setFechaIngresoIsapre(request.getParameter("FechaIngreso"));
                per.setMontoPactado(Double.parseDouble(request.getParameter("MontoPactado")));
                per.setTipoMonedaSalud(Integer.parseInt(request.getParameter("MonedaSalud")));
                per.setNumContratoIsapre(request.getParameter("NumeroContrato"));
            }
            
            //INGRESO DATOS PREVISIONALES PENSION
            if ("1".equals(request.getParameter("optPension"))){
                per.setPension(Integer.parseInt(request.getParameter("cboPension")));
            }else{
                per.setPension(Integer.parseInt(request.getParameter("cboSis")));
            }
            
            if ("1".equals(request.getParameter("chkAhorroAFP"))){
                per.setMontoAhorroAFP(Double.parseDouble(request.getParameter("MontoAhorroAFP")));
                per.setTipoMonedaAhorroAFP(Integer.parseInt(request.getParameter("AhorroAFP")));
            }else{
                per.setMontoAhorroAFP(0.0);
                per.setTipoMonedaAhorroAFP(0);
            }
            
            if ("1".equals(request.getParameter("chkAPV"))){
                per.setMontoAPV(Double.parseDouble(request.getParameter("MontoAPV")));
                per.setTipoMonedaAPV(Integer.parseInt(request.getParameter("MonedaAPV")));
                per.setInstitucionAPV(Integer.parseInt(request.getParameter("cboAPV")));
            }else{
                per.setMontoAPV(0.0);
                per.setTipoMonedaAPV(0);
                per.setInstitucionAPV(0);
            }
        }
        
        if (intAccion==0){
            if (per.GuardarFuncionario()){
                per.ModificarFuncionarioPrevisionSalud();
                per.ModificarFuncionarioPrevisionPension();
                response.sendRedirect("ListarFuncionarios.jsp");
            }else{
                request.getSession().setAttribute("error", per.getError());
                response.sendRedirect("ListarFuncionarios.jsp");
            }
        }
        
        if (intAccion==1){
            if (per.ModificarFuncionario()){
                per.ModificarFuncionarioPrevisionSalud();
                per.ModificarFuncionarioPrevisionPension();
                response.sendRedirect("ListarFuncionarios.jsp");
            }
        }
        
        if (intAccion==3){
            if (per.EliminarFuncionario()){
                response.sendRedirect("ListarFuncionarios.jsp");
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
