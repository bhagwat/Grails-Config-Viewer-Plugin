<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>View and Edit Configuration</title>
	<g:javascript library="jquery"/>
	<g:setProvider library="jquery"/>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'config-main.css')}">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jqueryFileTree.css')}">
	<script src="${resource(dir: 'js', file: 'jqueryFileTree.js')}" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#config-tree').fileTree({
				root:'',
				script: "${createLink(controller:'configEditor',action:'children')}",
				expandSpeed: 1000,
				collapseSpeed: 1000,
				multiFolder: true
			}, function(newConfiguration) {
				var equalIndex = newConfiguration.indexOf("=");

				var firstHalf = newConfiguration.substring(0, equalIndex);
				var nextHalf = newConfiguration.substring(equalIndex + 1);

				jQuery("#newConfigurationPath").val(firstHalf);
				jQuery("#newConfigurationValue").val(nextHalf);
			});
		});
	</script>
</head>
<body>
<div class="body" style="float:none;">
	<h1><g:message code="default.configEditor.header" default="Grails Configuration"/></h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<g:if test="${flash.error}">
		<div class="errors">
			<ul><li>${flash.error}</li></ul>
		</div>
	</g:if>

	<div class="list leftpanel">
		<div id="config-tree">
			Loading... <img src="${resource(dir: 'images', file: 'spinner.gif')}"/>
		</div>
	</div>
	<div class="dialog rightpanel">
		<g:uploadForm controller="configEditor" action="uploadConfiguration">
			<span>
				Configuration File : <input type="file" name="configFile" size="20"/>
				<g:submitButton name="update" value="Upload and Merge"/>
			</span>
		</g:uploadForm>
		<br/>
		<br/>
		<g:form controller="configEditor" action="updateConfiguration">
			<table>
				<tbody>
				<tr>
					<td>
						Field :
					</td>
					<td>
						<g:textField name="newConfigurationPath" value="" size="40"/>
					</td>
				</tr>
				<tr>
					<td>
						Value :
					</td>
					<td>
						<g:textField name="newConfigurationValue" value="" size="20"/>
					</td>
				</tr>
				</tbody>
			</table>
			<div class="buttons">
				<span class="button"><g:submitButton name="update" value="update"/></span>
			</div>
		</g:form>
	</div>

</div>
</body>
</html>