<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>

<%@include file="/WEB-INF/views/include/header.jsp" %>
<body>

    <div class="main-wrapper">
            <div class="row">
                
                
                <!-- Line Start -->
                <div class="col-lg-4 col-md-6 col-12 mb-30">
                    <div class="box">
                        <div class="box-head">
                            <h4 class="title">Line</h4>
                        </div>
                        <div class="box-body">
                            <div class="example-chartjs">
                                <canvas id="example-chartjs-line"></canvas>
                            </div>
                        </div>
                    </div>
                </div><!-- Line End -->

                <!-- Bar Vertical Start -->
                <div class="col-lg-4 col-md-6 col-12 mb-30">
                    <div class="box">
                        <div class="box-head">
                            <h4 class="title">Bar Vertical</h4>
                        </div>
                        <div class="box-body">
                            <div class="example-chartjs">
                                <canvas id="example-chartjs-barV"></canvas>
                            </div>
                        </div>
                    </div>
                </div><!-- Bar Vertical End -->
                
                <!-- Pie Start -->
                <div class="col-lg-4 col-md-6 col-12 mb-30">
                    <div class="box">
                        <div class="box-head">
                            <h4 class="title">Pie</h4>
                        </div>
                        <div class="box-body">
                            <div class="example-chartjs">
                                <canvas id="example-chartjs-pie"></canvas>
                            </div>
                        </div>
                    </div>
                </div><!-- Pie End -->

            </div>

        </div><!-- Content Body End -->


<%@include file="/WEB-INF/views/include/footer.jsp" %>
     <!-- Plugins & Activation JS For Only This Page -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/chartjs/Chart.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/chartjs/chartjs.active.js"></script>
</body>

</html>