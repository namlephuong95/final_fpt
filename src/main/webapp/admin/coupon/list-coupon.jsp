<%@ page import="com.example.example_fpt_final.entity.CategoryCoupon" %>
<%@ page import="com.example.example_fpt_final.entity.Coupon" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/31/2021
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    HashMap<CategoryCoupon, Coupon> list = (HashMap<CategoryCoupon, Coupon>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/admin/include/header.jsp">
        <jsp:param name="title" value="My admin page"/>
        <jsp:param name="description" value="Admin area"/>
        <jsp:param name="keywords" value="admin, page...."/>
    </jsp:include>
</head>
<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i
            class="fa fa-bars"></i>  Menu
    </button>
    <span class="w3-bar-item w3-right">Admin page</span>
</div>

<jsp:include page="/admin/include/left-menu.jsp"/>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
     title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <%--        <%if (message!=null){%>--%>
        <%--        <div class="w3-panel w3-pale-yellow w3-border">--%>
        <%--            <h3>Warning!</h3>--%>
        <%--            <p><%=message%></p>--%>
        <%--        </div>--%>
        <%--        <%}%>--%>
        <h5><b><i class="fa fa-list"></i> List Food</b></h5>
    </header>

    <div class="w3-row-padding w3-margin-bottom">
        <table class="w3-table-all">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Code</th>
                <th>Category</th>
                <th>Thumbnail</th>
                <th>Status</th>
                <th>Description</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Action</th>
            </tr>
            <%
                for (Map.Entry<CategoryCoupon, Coupon> entry :
                        list.entrySet()) {
            %>
            <tr>
                <th><%=entry.getValue().getId()%>
                </th>
                <th><%=entry.getValue().getTitle()%></th>
                <th><%=entry.getValue().getCode()%></th>
                <th><%=entry.getKey().getCateName()%></th>
                <th>
                    <img src="<%=entry.getValue().getThumbnail()%>" style="width: 100px" class="w3-border w3-padding"
                         alt="Alps"></th>
                <th>
                    <%
                        String statusName = "";
                        switch (entry.getValue().getStatus()) {
                            case 1: statusName = "Sell";
                                break;
                            case 2: statusName = "Stop selling";
                                break;
                            case 3: statusName = "Delete";
                                break;
                        }
                    %>
                    <%=statusName%>
                </th>
                <th><%=entry.getValue().getDescription()%></th>
                <th><%=entry.getValue().getCreated_at()%>
                </th>
                <th><%=entry.getValue().getUpdated_at()%>
                </th>
                <th>
                    <%--                    <a href="/admin/food/detail?id=<%=entry.getValue().getId()%>">Detail</a>&nbsp;--%>
                    <a href="/admin/coupon/edit?id=<%=entry.getValue().getId()%>">Edit</a>&nbsp;
                    <a onclick="deleteFood(<%=entry.getValue().getId()%>, event)" href="">Delete</a>
                </th>
            </tr>
            <%
                }
            %>
        </table>
    </div>
    <hr>
    <!-- Footer -->
    <jsp:include page="/admin/include/footer.jsp"/>
    <!-- End page content -->
</div>
<jsp:include page="/admin/include/script.jsp"/>
<script>
    function deleteFood(id,e){
        e = e || window.event;
        e.preventDefault();
        if(confirm('Bạn có chắc muốn xoá sản phẩm này?')){
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function (){
                if(xhr.readyState == 4 && xhr.status == 200){
                    alert('Delete thành công.');
                    window.location.reload();
                }
            };
            xhr.open('DELETE', '/admin/coupon/delete?id=' + id);
            xhr.send();
            console.log(xhr.response);
        }
    }
</script>
</body>
</html>
