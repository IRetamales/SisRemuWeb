/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controlador.clsNacionalidad;
import controlador.clsParametros;
import controlador.clsPension;
import controlador.clsSalud;
import controlador.clsTipoContrato;
import controlador.clsTipoMoneda;
import controlador.clsTipoTrabajador;
import controlador.clsVinculo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Articuno
 */
public class IngresoMantenedores extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /*try () {
            /* TODO output your page here. You may use following sample code. *
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet IngresoMantenedores</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IngresoMantenedores at " + request.getContextPath() + "</h1>");
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    //@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer intMant=Integer.parseInt(request.getParameter("iMant"));
        
        HttpSession session=request.getSession();
        //MANTENEDOR DE SALUD
        if (intMant==1){
            Integer intAcc=Integer.parseInt(request.getParameter("iacc"));
            clsSalud sal = new clsSalud();
            sal.setIdInstitucion(Integer.parseInt(request.getParameter("IdInstitucionSalud").toString().trim()));
            if (intAcc!=3){
                sal.setNombre(request.getParameter("nombreInstitucion").trim());
                sal.ActualizarSalud();
                response.sendRedirect("ListadoInstitucionSalud.jsp");
            }
            if (intAcc==3){
                sal.EliminaSalud();
                response.sendRedirect("ListadoInstitucionSalud.jsp");
            }
        }
        
        //MANTENEDOR DE PENSION
        if (intMant==2){
            Integer intAcc=Integer.parseInt(request.getParameter("iacc"));
            clsPension pen = new clsPension();
            pen.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
            pen.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
            pen.setIdInstitucion(Integer.parseInt(request.getParameter("IdInstitucionPension").toString().trim()));
            if (intAcc!=3){
                pen.setNombre(request.getParameter("nombreInstitucion").toString().trim());
                pen.setTipo(request.getParameter("TipoSistema").toString().trim());
                pen.setValor(Double.parseDouble(request.getParameter("valor").toString().trim()));
                pen.ActualizarPension();
                response.sendRedirect("ListadoInstitucionPension.jsp");
            }
            
            if (intAcc==3){
                pen.EliminaPension();
                response.sendRedirect("ListadoInstitucionPension.jsp");
            }
        }
        
        //MANTENEDOR DE TIPO DE CONTRATO
        if (intMant==3){
            Integer intAcc=Integer.parseInt(request.getParameter("iacc"));
            clsTipoContrato con = new clsTipoContrato();
            con.setId(Integer.parseInt(request.getParameter("IdITipoContrato").toString().trim()));
            if (intAcc!=3){
                con.setNombre(request.getParameter("nombreContrato").trim());
                if (request.getParameter("Habilitado")==null){
                    con.setHabilitado(0);
                }else{
                    con.setHabilitado(1);
                }
                con.ActualizarTipoContrato();
                response.sendRedirect("ListadoTipoContrato.jsp");
            }
            if (intAcc==3){
                con.EliminaTipoContrato();
                response.sendRedirect("ListadoTipoContrato.jsp");
            }
        }
        
        //MANTENEDOR DE TIPO DE MONEDA
        if (intMant==4){
            Integer intAcc=Integer.parseInt(request.getParameter("iacc"));
            clsTipoMoneda mon = new clsTipoMoneda();
            mon.setIdTipoMoneda(Integer.parseInt(request.getParameter("IdITipoMoneda").toString().trim()));
            if (intAcc!=3){
                mon.setNombre(request.getParameter("nombreMoneda").trim());
                if (request.getParameter("Habilitado")==null){
                    mon.setHabilitado(0);
                }else{
                    mon.setHabilitado(1);
                }
                mon.ActualizarTipoMoneda();
                response.sendRedirect("ListadoTipoMoneda.jsp");
            }
            if (intAcc==3){
                mon.EliminarTipoMoneda();
                response.sendRedirect("ListadoTipoMoneda.jsp");
            }
        }
        
        //MANTENEDOR DE TIPO DE TRABAJADOR
        if (intMant==5){
            Integer intAcc=Integer.parseInt(request.getParameter("iacc"));
            clsTipoTrabajador tra = new clsTipoTrabajador();
            tra.setIdTipoTrabajador(Integer.parseInt(request.getParameter("IdITipoTrabajador").toString().trim()));
            if (intAcc!=3){
                tra.setNombre(request.getParameter("nombreTrabajador").trim());
                if (request.getParameter("Habilitado")==null){
                    tra.setHabilitado(0);
                }else{
                    tra.setHabilitado(1);
                }
                tra.ActualizarTipoTrabajador();
                response.sendRedirect("ListadoTipoTrabajador.jsp");
            }
            if (intAcc==3){
                tra.EliminarTipoTrabajador();
                response.sendRedirect("ListadoTipoTrabajador.jsp");
            }
        }
        
        //MANTENEDOR DE NACIONALIDAD
        if (intMant==6){
            Integer intAcc=Integer.parseInt(request.getParameter("iacc"));
            clsNacionalidad nac = new clsNacionalidad();
            nac.setIdNacionalidad(Integer.parseInt(request.getParameter("IdNacionalidad").toString().trim()));
            if (intAcc!=3){
                nac.setNombre(request.getParameter("nombreNacionalidad").trim());
                if (request.getParameter("Habilitado")==null){
                    nac.setHabilitado(0);
                }else{
                    nac.setHabilitado(1);
                }
                nac.ActualizarNacionalidad();
                response.sendRedirect("ListadoNacionalidad.jsp");
            }
            if (intAcc==3){
                nac.EliminarNacionalidad();
                response.sendRedirect("ListadoNacionalidad.jsp");
            }
        }
        
        //MANTENEDOR VINCULO
        if (intMant==7){
            Integer intAcc=Integer.parseInt(request.getParameter("iacc"));
            clsVinculo vin = new clsVinculo();
            vin.setIdVinculo(Integer.parseInt(request.getParameter("IdVinculo").toString().trim()));
            if (intAcc!=3){
                vin.setNombre(request.getParameter("nombreVinculo").trim());
                if (request.getParameter("Habilitado")==null){
                    vin.setHabilitado(0);
                }else{
                    vin.setHabilitado(1);
                }
                vin.ActualizarVinculo();
                response.sendRedirect("ListadoVinculo.jsp");
            }
            if (intAcc==3){
                vin.EliminarVinculo();
                response.sendRedirect("ListadoVinculo.jsp");
            }
        }
        
        //MANTENEDOR VINCULO
        if (intMant==8){
            Integer intAcc=Integer.parseInt(request.getParameter("iacc"));
            clsParametros par = new clsParametros();
            par.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
            par.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
            par.setCodigo(request.getParameter("codigo").toString().trim());
            if (intAcc!=3){
                par.setDescripcion(request.getParameter("descripcion").trim());
                par.setNumerico(Double.parseDouble(request.getParameter("numero").trim()));
                par.setAlfanumerico(request.getParameter("alfanumerico").toString().trim());
                par.setFecha(request.getParameter("fecha").trim());
                par.ActualizarParametro();
                response.sendRedirect("ListadoParametros.jsp");
            }
            if (intAcc==3){
                par.EliminarParametro();
                response.sendRedirect("ListadoParametros.jsp");
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
