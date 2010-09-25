<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main"/>
	<title>Simple GSP page</title>
	<g:javascript library="jquery"/>
	<g:setProvider library="jquery"/>
	%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'config-main.css')}">--}%
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.treeview.css')}">
	<script src="${resource(dir: 'js', file: 'jquery.treeview.js')}" type="text/javascript"></script>

	<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery("#config-tree").treeview({
				persist: "location",
				collapsed: true
			});
		})

	</script>
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