/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Course;
import model.Mahasiswa;
import model.Course_Mahasiswa;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "mahasiswaController", urlPatterns = {"/mahasiswaController"})
public class mahasiswaController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("kode") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        String menu = request.getParameter("menu");
        Mahasiswa mhsModel = new Mahasiswa();
        Course_Mahasiswa cmModel = new Course_Mahasiswa();
        String kodeMatkul = request.getParameter("kodeMatkul");

        if ("add".equals(menu)) {
            String nama = request.getParameter("nama");
            int nim = Integer.parseInt(request.getParameter("nim"));
            String kodeKelas = request.getParameter("kodeKelas");
            
            Mahasiswa mahasiswa = mhsModel.find(request.getParameter("nim"));
            
            if (mahasiswa==null) {
                mhsModel.setNama(nama);
                mhsModel.setNIM(nim);
                mhsModel.setKodeKelas(kodeKelas);
                mhsModel.insert();
            }
            cmModel.setKodeMK(kodeMatkul);
            cmModel.setNIM(nim);
            cmModel.insert();
            
        } else if ("del".equals(menu)) {
            int nim = Integer.parseInt(request.getParameter("nim"));
            cmModel.setNIM(nim);
            cmModel.delete();
        }

        response.sendRedirect("Course/mahasiswa/viewMahasiswa.jsp?kodeMK=" + kodeMatkul);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("kode")==null) {
            response.sendRedirect("index.jsp");
            return;
        }
    }
}
