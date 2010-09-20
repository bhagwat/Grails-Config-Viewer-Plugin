<ul class='jqueryFileTree' style='display: none;'>
	<g:each in="${folders}" var="folder">
        <li class="directory collapsed" id="${folder}">
            <a class="file-folder" href="#" rel="${rootDir}${folder}" title="${rootDir}${folder}">${folder}</a>
        </li>
    </g:each>
    <g:each in="${files}" var="file">
            <li class="file ext_txt">
                <a class="file-folder" href="#" rel="${rootDir}${file}" title="${rootDir}${file}" >${file}</a>
            </li>
    </g:each>
</ul>