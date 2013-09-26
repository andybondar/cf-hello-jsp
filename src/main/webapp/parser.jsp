<%@ page language="java" import="java.util.Properties,
				java.util.Enumeration,
                                java.util.Map,
				java.sql.*"%>
<html>
<head>
<title> DB Version example: JSP, Postgres version</title>
</head>
<body bgcolor="white">
<%
        try {
 	    Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
        }
	try {
	    
	    out.println("<h1>Driver was found :)</h1>" );

       // get the system environment variables
           Map<String,String> envMap = System.getenv();

           
               // print the system environment variables
                   for (String key : envMap.keySet())
                       {
out.println("<h1>" + key + " = " +  envMap.get(key) + "</h1><br>");
                                   }
		out.flush();

        } catch (Exception e) {
            out.println( "<h1>exception: "+e+e.getMessage()+"</h1>" );
        }
%>
</body>
</html>

