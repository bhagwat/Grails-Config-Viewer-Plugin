<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main"/>
	<title>Simple GSP page</title>
	<g:javascript library="jquery"/>
	<g:setProvider library="jquery"/>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}">
</head>
<body>
<div class="body" style="float:none;">
	<h1><g:message code="default.configEditor.header" default="Grails Configuration"/></h1>

	<div class="list">
		<g:render template="showMap" model="[map:map]"/>  		
	</div>
</div>
</body>
</html>