<%@page import="com.foodexpress.model.User"%>

<%
User user=(User)session.getAttribute("user");
%>

<div class="dashboard-header">

    <div class="profile">
        <img src="images/admin.jpeg" alt="Admin">

        <div>
            <h3><%=user.getUsername()%></h3>
            <p>System Administrator</p>
        </div>
    </div>

</div>