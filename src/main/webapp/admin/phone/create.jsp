<%@ page import="com.example.example_fpt_final.entity.Phone" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.example_fpt_final.entity.CategoryPhone" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/31/2021
  Time: 7:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    Phone phone = (Phone) request.getAttribute("coupon");
    if (phone == null) {
        phone = new Phone();
    }
    HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
    if (errors == null) {
        errors = new HashMap<>();
    }
    ArrayList<CategoryPhone> categories = (ArrayList<CategoryPhone>) request.getAttribute("categories");
%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/admin/include/header.jsp">
        <jsp:param name="title" value="Coupon form"/>
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
        <h5><b><i class="fa fa-dashboard"></i> Coupon form</b></h5>
    </header>

    <div class="w3-padding w3-margin-bottom">
        <%
            if (errors.size() > 0) {
        %>
        <div class="w3-panel w3-pale-red w3-border">
            <h3>Danger!</h3>
            <ul>
                <%
                    for (Map.Entry<String, String> entry :
                            errors.entrySet()) {
                %>
                <li><%=entry.getValue()%>
                </li>
                <%}%>
            </ul>
        </div>
        <%}%>
        <form action="/admin/phone/create" method="post" class="w3-container w3-padding w3-card-4 w3-margin">
            <%--            <div class="w3-margin">--%>
            <%--                <label>Id</label>--%>
            <%--                <input class="w3-input" type="text" name="id">--%>
            <%--            </div>--%>
            <div class="w3-margin">
                <label>Name</label>
                <input class="w3-input" type="text" name="name" value="<%=phone.getName()%>" required>
            </div>
            <div class="w3-margin">
                <label>Description</label>
                <textarea class="w3-input" name="description" rows="4" cols="50" required>
                    <%=phone.getDescription()%>
                </textarea>
            </div>
            <div class="w3-margin">
                <label>Price</label>
                <input class="w3-input" type="number" name="price" value="<%=phone.getPrice()%>" required>
            </div>
            <div class="w3-margin">
                <label>Category</label>
                <select class="w3-select" name="category_id" required>
                    <option value="" disabled selected>Choose your Category</option>
                    <%
                        for (CategoryPhone categoryCoupon :
                                categories) {
                    %>
                    <option <%if (phone.getBrand_id() == categoryCoupon.getId()) {%> <%="selected"%> <%}%>
                            value="<%=categoryCoupon.getId()%>"><%=categoryCoupon.getCateName()%>
                    </option>
                    <%}%>
                </select>
            </div>
            <button class="w3-btn w3-blue w3-margin">Submit</button>
            <a onclick="reloadFrom()" class="w3-btn w3-green w3-margin">Reset</a>
        </form>
    </div>
    <hr>
    <!-- Footer -->
    <jsp:include page="/admin/include/footer.jsp"/>
    <!-- End page content -->
</div>
<jsp:include page="/admin/include/script.jsp"/>

<script>
    function reloadFrom(){
        window.location.reload();
    }
</script>
</body>
</html>
