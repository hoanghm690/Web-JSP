<%-- 
    Document   : manager_subject
    Created on : Mar 24, 2021, 8:35:28 PM
    Author     : admin
--%>

<%@page import="model.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.SubjectDAO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>HAT Admin - Dashboard</title>
        <!-- Custom fonts for this template-->
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${root}/css/sb-admin-2.min.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <%
            SubjectDAO subjectDAO = new SubjectDAO();
            ArrayList<Subject> listSubject = subjectDAO.getListSubject();
        %>
        <div id="wrapper">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">
                        <!--Header-->
                    <jsp:include page="header.jsp"></jsp:include>
                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <h3>QUẢN LÝ MÔN HỌC</h3>

                            <div class="d-flex mb-4">
                                <a href="${root}/admin/insert_subject.jsp" class="btn btn-primary">
                                <i class="fas fa-plus"></i>
                                Thêm mới môn học
                            </a>
                            <a href="" class="btn btn-success ml-2">
                                <i class="fas fa-file-excel"></i>
                                Xuất excel
                            </a>
                        </div>
                        <!--<span>Tất cả (5)</span>-->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã</th>
                                    <th>Tên</th>
                                    <th>Icon</th>
                                    <th>Mô tả</th>
                                    <th>Ngày tạo</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <%
                                int count = 0;
                                for (Subject subject : listSubject) {
                                    count++;
                            %>
                            <tbody>
                                <tr>
                                    <th scope="row"><%=count%></th>
                                    <td><%=subject.getSubjectID()%></td>
                                    <td><%=subject.getSubjectName()%></td>
                                    <td> <i class="<%=subject.getSubjectIcon()%>"></i> </td>
                                    <td style="width: 600px"><%=subject.getDescription()%></td>
                                    <td><%=subject.getCreatedate()%></td>
                                    <td>
                                        <a href="${root}/admin/update_subject.jsp?command=update&subjet_id=<%=subject.getSubjectID()%>" class="btn btn-primary">
                                            <i class="far fa-edit"></i>
                                        </a>
                                        <a href="${root}/ManagerSubjectServlet?command=delete&subjet_id=<%=subject.getSubjectID()%>" class="btn btn-danger">
                                            <i class="far fa-trash-alt"></i>
                                        </a>
                                    </td>
                            </tbody>
                            <%}%>
                        </table>
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->

                <jsp:include page="footer.jsp"></jsp:include>

                </div>
            </div>

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
        <jsp:include page="logout_modal.jsp"></jsp:include>
            <!-- Bootstrap core JavaScript-->
            <script src="${root}/vendor/jquery/jquery.min.js"></script>
        <script src="${root}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${root}/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${root}/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="${root}/vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="${root}/js/demo/chart-area-demo.js"></script>
        <script src="${root}/js/demo/chart-pie-demo.js"></script>
    </body>
</html>
