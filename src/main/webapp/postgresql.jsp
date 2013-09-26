<%@ page language="java" import="java.sql.*"%>
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
	    Connection conn = DriverManager.getConnection (
		"jdbc:postgresql://10.0.0.17:5434/db70085ff8d41434cab604ba88b61acc0", "ud9b79c1b63c5429ebd8d2222dd645e32", "pf9a15984f5304255820d9cd1ce4e3a35" );
			
		Statement stmt = conn.createStatement();
		ResultSet rs;
		
		rs = stmt.executeQuery("SELECT VERSION()");
		
		while ( rs.next() ) {
		String version = rs.getString("version");
		out.println("<h1>"+version+"</h1>" );
		}
		
		
	    
        } catch (Exception e) {
            out.println( "<h1>exception: "+e+e.getMessage()+"</h1>" );
        }
%>
</body>
</html>

