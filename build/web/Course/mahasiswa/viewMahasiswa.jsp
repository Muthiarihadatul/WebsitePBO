<%-- 
    Document   : viewMahasiswa
    Created on : 29 Dec 2024, 22.05.16
    Author     : Azra Feby Awfiyah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
              crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
              rel="stylesheet">
        <title>Lecturo - Mahasiswa</title>
        <style>
            body {
                background-color: #004643;
                color: #ffffff;
            }
            .navbar {
                background-color: #004643;
            }
            .navbar-brand {
                display: flex;
                align-items: center;
                font-weight: bolder;
            }
            .navbar-brand .circle {
                width: 15px;
                height: 15px;
                background-color: #F9BC60;
                border-radius: 50%;
                margin-right: 10px;
            }
            .active-button {
                background-color: #F9BC60;
                color: #004643;
                border: none;
                padding: 8px 16px;
                border-radius: 20px;
                text-decoration: none;
            }
            .passive-button {
                color: #F9BC60;
                border: none;
                padding: 8px 16px;
                text-decoration: none;
            }
            .passive-button:hover {
                color: #ABD1C6;
            }
            .course-button {
                background-color: #F9BC60;
                color: #004643;
                font-weight: bold;
                border: none;
                padding: 8px 16px;
                border-radius: 20px;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard.jsp">
                    <div class="circle"></div>
                    Lecturo
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="viewCourse.jsp">Mata Kuliah</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/penelitian/viewPenelitian.jsp">Penelitian</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/abdimas/viewAbdimas.jsp">Pengabdian Masyarakat</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>  
        
        <div class="container mt-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="d-flex justify-space-between align-items-center mb-4 gap-3">
                    <a href="${pageContext.request.contextPath}/Course/dashboardCourse.jsp" class="passive-button fw-bold">Activity</a>
                    <a href="viewMahasiswa.jsp" class="active-button fw-bold">Mahasiswa</a>
                    <a href="${pageContext.request.contextPath}/Course/nilai/viewNilai.jsp" class="passive-button fw-bold">Nilai</a>
                </div>
                <a href="addMahasiswa.jsp" class="btn course-button"><b>Tambah Mahasiswa +</b></a>
            </div>
            <table class="table table-hover table-bordered rounded-2"> 
                <thead class="table-success">
                    <tr>
                        <th>NIM</th>
                        <th>Nama</th>
                        <th>Kode Kelas</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1301223357</td>
                        <td>Nasywa Alif Widyasari</td>
                        <td>IF-46-06</td>
                        <td>
                            <a href='deleteMahasiswa?id=(getID)' class="btn btn-sm btn-warning" title="Delete">
                                <i class="bi bi-trash3"></i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>1301223401</td>
                        <td>Farah Saraswati</td>
                        <td>IF-46-06</td>
                        <td>
                            <a href='deleteMahasiswa?id=(getID)' class="btn btn-sm btn-warning" title="Delete">
                                <i class="bi bi-trash3"></i>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
    </body>
</html>