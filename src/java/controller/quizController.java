/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Course_Mahasiswa;
import model.Dosen_Penelitian;
import model.Mahasiswa;
import model.Penelitian;
import model.Quiz;
import model.Dosen;

/**
 *
 * @author Farah
 */
@WebServlet(name = "quizController", urlPatterns = {"/quizController"})
public class quizController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("kode") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        String menu = request.getParameter("menu");
        String kodeMK = request.getParameter("kodeMatkul");
        String kodeKls = request.getParameter("kodeKelas");
        Quiz quizModel = new Quiz();

        if ("add".equals(menu)) {
            String nama = request.getParameter("nama");
            String deskripsi = request.getParameter("deskripsi");

            quizModel.setNama(nama);
            quizModel.setKodeMK(kodeMK);
            quizModel.setDeskripsi(deskripsi);
            quizModel.setKodeKelas(kodeKls);
            quizModel.insert();
        } else if ("upd".equals(menu)) {
            String nama = request.getParameter("nama");
            String deskripsi = request.getParameter("deskripsi");

            quizModel.setNama(nama);
            quizModel.setKodeMK(kodeMK);
            quizModel.setDeskripsi(deskripsi);
            quizModel.setKodeKelas(kodeKls);
            quizModel.update();

        } else if ("del".equals(menu)) {
            quizModel.setKodeMK(kodeMK);
            quizModel.delete();
        }

        response.sendRedirect("Course/dashboardCourse.jsp?kodeMK=" + kodeMK + "&&kodeKelas=" + kodeKls);
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

