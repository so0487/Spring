<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>

<%@include file="/WEB-INF/views/include/header.jsp" %>
<body>



            <div class="row">

                <!--Basic Tab Start-->
                <div class="col-lg-6 col-12 mb-30">
                    <div class="box">
                        <div class="box-head">
                            <h4 class="title">Basic Tab</h4>
                        </div>
                        <div class="box-body">
                            <ul class="nav nav-tabs mb-15">
                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#home">Home</a></li>
                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#profile">Profile</a></li>
                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#contact">Contact</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="home">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus cumque corporis et hic obcaecati ipsum consequatur nostrum, explicabo praesentium saepe porro expedita iure suscipit harum illum quas esse quo fugiat vel temporibus ad ipsam! Laudantium asperiores ad at saepe illum.</p>
                                </div>
                                <div class="tab-pane fade" id="profile">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus cumque corporis et hic obcaecati ipsum consequatur nostrum, explicabo praesentium saepe porro expedita iure suscipit harum illum quas esse quo fugiat vel temporibus ad ipsam! Laudantium asperiores ad at saepe illum.</p>
                                </div>
                                <div class="tab-pane fade" id="contact">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus cumque corporis et hic obcaecati ipsum consequatur nostrum, explicabo praesentium saepe porro expedita iure suscipit harum illum quas esse quo fugiat vel temporibus ad ipsam! Laudantium asperiores ad at saepe illum.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Basic Tab End-->



    <script>
        $('#exampleModal5').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var recipient = button.data('whatever') // Extract info from data-* attributes
            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var modal = $(this)
            modal.find('.modal-title').text('New message to ' + recipient)
            modal.find('.modal-body input').val(recipient)
        })
    </script>
    
    
    <%@include file="/WEB-INF/views/include/footer.jsp" %>

</body>

</html>