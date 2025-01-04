<%-- 
    Document   : viewAllNilai
    Created on : Jan 3, 2025, 9:44:05 AM
    Author     : Muthia Rihadatul
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
            
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            .table-container {
                border: 1px solid #ddd;
                display: flex;
                width: 100%;
            }

            .fixed-columns {
                width: 30%;
                min-width: 200px;
                border-right: 1px solid #ddd;
                
            }

            .scrollable-content {
                width: 70%;
                overflow-x: auto;
            }

            table {
                border-collapse: collapse;
                width: 100%;
                
            }

            th, td {
                padding: 10px;
                border: 1px solid #ddd;
                width: auto;
                color : #f2f2f2; 
            }

            th {
                background-color: #ABD1C6;
                position: sticky;
                top: 0;
                z-index: 1;
                color : #000000;
            }
            
            td {
                background-color: #FFFFFF; /* Warna putih untuk sel data */
                color: #000000;
                text-align: left;
            }

            tr {
                height: 70px; /* Tinggi default untuk semua baris */
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
                    <a href="${pageContext.request.contextPath}/Course/dashboardCourse.jsp" 
                        class="${page == 'dashboardCourse' ? 'active-button fw-bold' : 'passive-button fw-bold'}">
                        Activity
                     </a>
                     <a href="${pageContext.request.contextPath}/Course/mahasiswa/viewMahasiswa.jsp" 
                        class="${page == 'viewMahasiswa' ? 'active-button fw-bold' : 'passive-button fw-bold'}">
                        Mahasiswa
                     </a>
                     <a href="${pageContext.request.contextPath}/Course/nilai/viewNilai.jsp" 
                        class="${page == 'viewNilai' ? 'active-button fw-bold' : 'active-button fw-bold'}">
                        Nilai
                     </a>
                </div>
            </div>
        <div class="table-container">
            <!-- Fixed Columns -->
            <div class="fixed-columns">
                <table>
                    <thead>
                        <tr>
                            <th>Nama</th>
                            <th>Overall Grade</th>
                        </tr>
                    </thead>
                    <tbody id="fixedColumnBody"></tbody>
                </table>
            </div>

            <!-- Scrollable Content -->
            <div class="scrollable-content">
                <table>
                    <thead>
                        <tr id="quizHeaders"></tr>
                    </thead>
                    <tbody id="scrollableBody"></tbody>
                </table>
            </div>
        </div>

        <script>
            // Data untuk tabel
            const data = {
                students: [
                    {
                        nama: "Nasya Alif Widyasari",
                        overallGrade: "90",
                        quizzes: [100, 100, 100, 100, 100, 100, 100, 100, 100, 90,50,50,505,050,505,5,05,505]
                    },
                    {
                        nama: "Muthia Rihadatul",
                        overallGrade: "85",
                        quizzes: [90, 95, 85, 92, 88, 95, 100]
                    },

                    {
                        nama: "Diva Sanjaya",
                        overallGrade: "85",
                        quizzes: [90, 95, 85, 92, 88, 95, 100]
                    }
                ]
            };

            // Tentukan jumlah quiz maksimum
            const maxQuizCount = Math.max(...data.students.map(student => student.quizzes.length));

            // Header Quiz
            const quizHeaders = document.getElementById("quizHeaders");
            for (let i = 1; i <= maxQuizCount; i++) {
                const th = document.createElement("th");
                th.textContent = Quiz ${i};
                quizHeaders.appendChild(th);
            }

            // Fixed Columns (Nama, Overall Grade)
            const fixedColumnBody = document.getElementById("fixedColumnBody");
            data.students.forEach(student => {
                const row = document.createElement("tr");

                const namaCell = document.createElement("td");
                namaCell.textContent = student.nama;
                row.appendChild(namaCell);

                const gradeCell = document.createElement("td");
                gradeCell.textContent = student.overallGrade;
                row.appendChild(gradeCell);

                fixedColumnBody.appendChild(row);
            });

            // Scrollable Content (Quiz)
            const scrollableBody = document.getElementById("scrollableBody");
            data.students.forEach(student => {
                const row = document.createElement("tr");

                for (let i = 0; i < maxQuizCount; i++) {
                    const quizCell = document.createElement("td");
                    quizCell.textContent = student.quizzes[i] !== undefined ? student.quizzes[i] : "0";
                    row.appendChild(quizCell);
                }

                scrollableBody.appendChild(row);
            });

            // Sync Row Heights
            function syncRowHeights() {
                const fixedRows = document.querySelectorAll("#fixedColumnBody tr");
                const scrollableRows = document.querySelectorAll("#scrollableBody tr");

                fixedRows.forEach((row, index) => {
                    const fixedHeight = row.offsetHeight;
                    const scrollableHeight = scrollableRows[index].offsetHeight;
                    const maxHeight = Math.max(fixedHeight, scrollableHeight);

                    row.style.height = ${maxHeight}px;
                    scrollableRows[index].style.height = ${maxHeight}px;
                });
            }

            // Run on page load
            window.onload = syncRowHeights;
            window.onresize = syncRowHeights; // Re-sync on window resize
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
    </body>
</html>