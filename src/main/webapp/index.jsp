<%@page language="java" import="java.util.Properties,
java.util.Enumeration,
java.util.Map,
org.json.simple.JSONObject,
org.json.simple.JSONArray,
org.json.simple.JSONValue,
org.json.simple.parser.ParseException,
org.json.simple.parser.JSONParser,
java.sql.*"%>

 <%
   out.print("<h1>Hello World!!!</h1>");
   out.print("<h1>"+new java.util.Date()+"</h1>");
   out.flush();

// get the system environment variables
  String vcap = System.getenv("VCAP_SERVICES");
  out.println("<h1>"+ vcap +"</h1></br>");

JSONParser parser = new JSONParser();
Object obj = parser.parse(vcap);
JSONObject jsonObj = (JSONObject) obj;
JSONArray pgsqlarr = (JSONArray) jsonObj.get("postgresql-9.2");
JSONObject jsonPgsql = (JSONObject) pgsqlarr.get(0);
JSONObject jsonCredsObj = (JSONObject) jsonPgsql.get("credentials");
JSONObject jsonCreds = (JSONObject) jsonCredsObj;


String hostname = jsonCreds.get("hostname").toString();
String port = jsonCreds.get("port").toString();
String dbname = jsonCreds.get("name").toString();
String user = jsonCreds.get("user").toString();
String password = jsonCreds.get("password").toString();


        try {
  Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
        }
try {

out.println("<h1>Driver was found :)</h1>" );
Connection conn = DriverManager.getConnection (
"jdbc:postgresql://"+hostname+":"+port+"/"+dbname, user, password );

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