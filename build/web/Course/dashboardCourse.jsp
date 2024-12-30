<%-- 
    Document   : dashboardCourse
    Created on : 19 Dec 2024, 12.24.41
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
        <title>Lecturo - Dashboard Course</title>
        <!-- Custom CSS -->
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
            .course-card {
                background-color: #FFFFFF;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
                position: relative;
                overflow: hidden;
            }
            .btn-create {
                background-color: #F9BC60;
                color: #000;
                font-weight: bold;
            }
            .btn-create:hover {
                background-color: #004643;
            }
            .quiz-card {
                background-color: #FFFFFF;
                border-radius: 10px;
                padding: 15px;
                box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
                display: flex;
                flex-direction: column; /* Konten diatur secara vertikal */
            }
            .quiz-icon {
                background-color: #004643;
                padding: 5px 10px;
                color: #ABD1C6;
                font-size: 20px;
            }
            .btn-transparent:hover {
                background-color: #004643;
                color: #ABD1C6;
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
        
        <!-- Dashboard Course -->
        <div class="container mt-4">
            <div class="d-flex justify-space-between align-items-center mb-4 gap-3">
                <a href="dashboardCourse.jsp" class="active-button fw-bold">Activity</a>
                <a href="mahasiswa/viewMahasiswa.jsp" class="passive-button fw-bold">Mahasiswa</a>
                <a href="nilai/viewNilai.jsp" class="passive-button fw-bold">Nilai</a>
            </div>
            <!-- Header -->
            <div class="course-card d-flex justify-content-between align-items-center">
                <div>
                    <h4 class="fw-bold text-dark">PEMROGRAMAN BERORIENTASI OBJEK [CAX15BB]</h4>
                    <p class="fw-bold text-dark mb-1">IF-46-06</p>
                    <p class="fw-bold text-dark mb-1">SKS: 6</p>
                    <br>
                    <br>
                    <p class="fw-bold text-dark mb-1">Dosen Pengampu: Azra Feby Awfiyah [AZF]</p>
                    <p class="fw-bold text-dark mb-1">Dosen Koordinator: Muthia Rihaadatul A [MRA]</p>
                </div>
            </div>

            <!-- Create Quiz Button -->
            <div class="mt-5 text-start">
                <a href="quiz/setQuiz.jsp" class="btn btn-create">
                    Create Quiz +
                </a>
            </div>

            <!-- Quiz List -->
            <div class="row mt-4">
                <!-- Quiz 1 -->
                <div class="col-md-6 mb-4">
                    <div class="quiz-card d-flex flex-column">
                        <!-- Header -->
                        <div class="d-flex align-items-center">
                            <!-- Icon -->
                            <div class="quiz-icon d-flex align-items-center justify-content-center rounded-circle me-3">
                                <i class="bi bi-card-checklist"></i>
                            </div>
                            <!-- Details -->
                            <h5 class="pb-2 mt-1 mb-2 fw-bold text-dark border-bottom border-success-emphasis flex-grow-1">
                                Quiz 1: Class Diagram
                            </h5>
                        </div>
                        <!-- Footer (Closes + Delete Icon) -->
                        <div class="d-flex justify-content-between align-items-center mt-2">
                            <div class="flex-grow-1">
                                <p class="mb-1 text-muted small">
                                    <strong>Opened:</strong> Tuesday, 24 December 2024, 12:40 PM
                                </p>
                                <p class="mb-0 text-muted small">
                                    <strong>Closes:</strong> Tuesday, 31 December 2024, 12:40 PM
                                </p>
                            </div>
                            <a href='quiz/deleteQuiz?id=(getID)' class="btn btn-sm btn-transparent" title="Delete">
                                <i class="bi bi-trash3"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        
        <!-- Bootstrap Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
    </body>
</html>