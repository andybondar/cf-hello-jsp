<%@ page import="java.util.Properties,
                 java.util.Enumeration,
                 java.util.Map" %>

<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>System Properties</title>
</head>

<!--
Prints out all the parameters being passed in from java
-->

<body>
<p>
This shows all the parameters passed in from the Windows registry or command line.
<br>
<br>
</p>
<h3>Java Opts</h3>

<%
       // get the system environment variables
    Map<String,String> envMap1 = System.getenv();

    // print the system environment variables
    for (String key : envMap1.keySet())
    {
        if (key.equals("JAVA_OPTS"))
        out.println(key + " = " +  envMap1.get(key) + "<br>");
    }
    out.flush();
%>

<h3>Environment Variables:</h3>
<%
       // get the system environment variables
    Map<String,String> envMap = System.getenv();

    // print the system environment variables
    for (String key : envMap.keySet())
    {
        out.println(key + " = " +  envMap.get(key) + "<br>");
    }
    out.flush();
%>
<h3>System Properties:</h3>
<%
Properties p = System.getProperties();
Enumeration keys = p.keys();
while (keys.hasMoreElements()) {
  String key = (String)keys.nextElement();
  String value = (String)p.get(key);
  out.println(key + ": " + value + "<br>");
}

  out.flush();

%>
<br>
<br>


</body>
</html>