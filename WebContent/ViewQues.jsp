<%-- 
    Document   : ViewJobDetails
    Created on : Nov 18, 2008, 1:25:33 PM
    Author     : Srishti
--%>
<%@page import="java.io.*,java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            <!--
            .style1 {
                font-size: 24px;
                color: #003399;
                font-weight: bold;
            }
            .style6 {color: #3399FF; font-weight: bold; }
            .style7 {color: #660099}
            .style10 {color: #663300; font-weight: bold; }
            .style11 {font-weight: bold}
            .style15 {color: #CC0066; font-weight: bold; }
            -->
        </style>
    </head>
    <body style="margin:0px" bgcolor="#FFFFFF">
        <table width="100%" border="1" bgcolor="#FFFFFF">
            <tr>
                <td height="85" colspan="2"><jsp:include page="CompanyHeader.jsp"/></td>
            </tr>
            <tr>
                <td width="1" height="512" valign="top"><jsp:include page="Companymenu.html"/></td>
                <td width="961" valign="top">

                    <form name="form1" action="ViewQues.jsp">

                        <table  width="35%" height="97" border="0" align="center">
                            <tr>
                                <td height="28" colspan="2" bgcolor="#FFFFFF"><div align="center" class="style1">
                                        <p class="style6 style7">View Questions</p>
                                </div></td>
                            </tr>
                            <tr>
                                <%
        String jid = request.getParameter("jobid");
        String eid = request.getParameter("examid");
        //out.print(jid);
        try {
            if (eid == null) {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
                Statement st = con.createStatement();
                Statement st2 = con.createStatement();
                                %>
                                <tr>
                                    <td width="129" height="32"><span class="style15">Select an JobID </span></td>
                                    <td width="118"><label>
                                            <select name="jobid">
                                                <%      ResultSet rs2 = st2.executeQuery("select * from JobDetails");
                                        String s2 = null;
                                        // String s2=null;
                                        while (rs2.next()) {
                                            s2 = rs2.getString("jobid");
                                            //    s2=rs.getString("Post");
%>
                                                <option value="<%=s2%>"><%=s2%></option>
                                                <%}%>
                                            </select>
                                        </label>

                                </td></tr>

                                <td width="129" height="32"><span class="style15">Select an ExamID </span></td>
                                <td width="118"><label>
                                        <select name="examid">
                                            <%      ResultSet rs = st.executeQuery("select * from Exam where JobID='" + s2 + "'");
                                        String s1 = null;
                                        // String s2=null;
                                        while (rs.next()) {
                                            s1 = rs.getString("examid");
                                            //    s2=rs.getString("Post");
%>
                                            <option value="<%=s1%>"><%=s1%></option>
                                            <%}%>
                                        </select>
                                    </label>

                            </td></tr>

                            <tr>
                                <td><div align="center">
                                        <input type="submit" value="Show Details">
                                </div></td>
                            </tr>
                        </table>
                    </form>

                    <p>
                        <%
                                    } else {
                        %>
                    </p>
                    <table width="99%" height="54" border="1" align="left">

                        <tr>
                            <td width="149" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center"><span class="style10">Question No: </span></div></td>
                            <td width="149" height="23" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center" class="style10"><span class="style11">Question</span></div></td>
                            <td width="74" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center" class="style10"><span class="style11">Option 1</span></div></td>
                            <td width="85" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center" class="style10"><span class="style11">Option 2</span></div></td>
                            <td width="75" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center" class="style10"><span class="style11">Option 3</span></div></td>
                            <td width="78" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center" class="style10"><span class="style11">Option 4</span></div></td>
                            <td width="80" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center" class="style10"><span class="style11">Answer</span></div></td>
                            <td width="77" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center" class="style10"><span class="style11">Delete</span></div></td>
                        </tr>
                        <%

                                        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                                        Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
                                        Statement st3 = con.createStatement();
                                        // Statement st2=con.createStatement();

                                        ResultSet rs3 = st3.executeQuery("select QuestionNo,Question,Option1,Option2,Option3,Option4,Answer from Question where ExamID='" +
                                                eid + "' and JobID='" + jid + "'");
                                        //  String s2=null;
                                        while (rs3.next()) {
                                            String qno = rs3.getString("QuestionNo");
                                            String ques = rs3.getString("Question");
                                            String op1 = rs3.getString("Option1");
                                            String op2 = rs3.getString("Option2");
                                            String op3 = rs3.getString("Option3");
                                            String op4 = rs3.getString("Option4");
                                            String ans = rs3.getString("Answer");



                        %>
                        <tr>
                            <td bordercolor="#666699" bgcolor="#F1F0E2"><%=qno%></td>
                            <td height="23" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center">
                                    <%=ques%>
                            </div></td>
                            <td height="23" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center">
                                    <%=op1%>
                            </div></td>
                            <td height="23" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center">
                                    <%=op2%>
                            </div></td>
                            <td height="23" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center">
                                    <%=op3%>
                            </div></td>
                            <td height="23" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center">
                                    <%=op4%>
                            </div></td>
                            <td height="23" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center">
                                    <%=ans%>
                            </div></td>
                            <td height="23" bordercolor="#666699" bgcolor="#F1F0E2"><div align="center"><a href="DeleteQues.jsp?qno=<%=qno%>&jid=<%=jid%>&eid=<%=eid%>" >Delete</a></div></td>
                        </tr>

                        <%
                }
                con.close();
            }

        } catch (Exception e) {
            out.println(e);
        }
                        %>
                    </table>
                </td>
            </tr>
        </table>

    </body>
</html>
