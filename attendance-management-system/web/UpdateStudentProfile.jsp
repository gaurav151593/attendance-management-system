<%-- 
    Document   : updateStudentProfile.jsp
    Created on : Apr 12, 2021, 6:46:32 PM
    Author     : bot
--%>

<%@ include file="studentheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String message="";
   if(request.getParameter("update")!=null){
       String sname=request.getParameter("SName");
       String sphone=request.getParameter("Sphone");
       String rollno=request.getParameter("RollNo");
       String sem=request.getParameter("Sem");
       String temail=request.getParameter("Temail");
       String tpassword=request.getParameter("Tpassword");
       String sql1="update student set SName=?,RollNo=?,Sem=?,SContact=? where SId=?";
       PreparedStatement p=conn.prepareStatement(sql1);
        p.setString(1,sname);
        p.setString(2,rollno);
        p.setString(3, sem);
        p.setString(4,sphone);
        p.setInt(5,sid);
        int r=p.executeUpdate();
            if(r>0)
            {
                message="Profile Updated Successfully";
            }
            else{
                message="Profile not updated";
            }
   }
%>

<div class="container">
    <h1>Update Profile</h1>
    <form action="">
        <% 
            String sql="select * from student where SId=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            //sid=(Integer)session.getAttribute("SId");
            ps.setInt(1,sid); 
            ResultSet r=ps.executeQuery();
            String name="";
            String contact="";
            String email="";
            String password="";
            int sem=1;
            String rollno=""; 
            while(r.next()){
                name=r.getString("SName");
                contact=r.getString("SContact");
                email=r.getString("email");
                password=r.getString("Password");
                rollno=r.getString("RollNO");
                sem =r.getInt("Sem");
            }
        %>
        <table>
        
            <tr><td>Name</td><td><input type="text" name="SName" value="<%=name%>"></td></tr>
            <tr><td>Phone</td><td><input type="text" name="Sphone" value="<%=contact%>"></td></tr>
            <tr><td>Email</td><td><input type="email" name="Temail" value="<%=email%>"></td></tr>
            <tr><td>Password</td><td><input type="text" name="TPassword" value="<%=password%>"></td></tr>
            <tr><td>RollNo</td><td><input type="text" name="RollNo" value="<%=rollno%>"></td></tr>
            <tr><td>Semester</td><td>
        <select name="Sem">
            <%for (int i = 1; i <=6; i++) {
            %>
            <option <%if(i==sem){%>selected<%}%>>
                <%=i%>
            </option>
            <%
                }
            %>
        </select></td></tr>
            <tr><td colspan="2"></td></tr>
            <tr><td colspan="2"><input type="submit" value="Update" name="update"></td></tr>
        <% if(!message.equals("")){ %>
            <div class="massage"><p><%= message%></p></div>
          <%  } 
%>
            </table>
    </form>
</div>

