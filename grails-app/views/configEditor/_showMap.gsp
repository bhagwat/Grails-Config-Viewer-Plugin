<ul id="config-tree">
	<g:each in="${map}" var="es">
		<g:set var="value" value="${es.value}"/>
		<li>
			${es.key}
			<g:if test="${value && (value instanceof Map)}">
				<g:render template="showMap" model="[map:value]"/>
			</g:if>
			<g:else>
				=${value}
			</g:else>
		</li>
	</g:each>
</ul>
