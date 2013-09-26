<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.lang.String,
		java.lang.Object,
		org.json.simple.JSONObject,
		org.json.simple.JSONArray,
		java.util.List,
		java.util.Map,
		com.google.gson.Gson"%>
 <%
	        String myJSON = "{\"source\":[{\"name\":\"john\",\"age\":20},{\"name\":\"michael\",\"age\":25},{\"name\":\"sara\", \"age\":23}]}";
	        out.print(myJSON);
 %>