package com.ig.ce

import org.springframework.web.multipart.commons.CommonsMultipartFile

class ConfigEditorController {

	def index = {
	}
	def children = {
		List<String> folders = [], files = []
		def config = grailsApplication.config
		String rootDir = params.dir
		if (rootDir) {
			List paths = rootDir.tokenize(".")
			paths.each {path ->
				config = config."${path}"
			}
		}
		config.each {key, value ->
			if (value instanceof Map) {
				folders << key
			} else {
				files << "${key}=${value}"
			}
		}
		rootDir = rootDir ? rootDir + "." : ""

		render(template: "children", layout: null, model: [rootDir: rootDir, folders: folders, files: files])
	}

	def updateConfiguration = {
		println "${new Date()} : ${params}"

		String firstHalf = params.newConfigurationPath
		String nextHalf = params.newConfigurationValue
		def value = getConfigValue(firstHalf)
		try {
			def newValue = (nextHalf.asType(value.class))
			setConfigValue(firstHalf, newValue)
			flash.message = "successfully updated : ${firstHalf}=${nextHalf}"
		} catch (ex) {
			ex.printStackTrace()
			flash.error = "Failed to update : ${firstHalf}=${nextHalf}"
		}
		redirect(action: index)
	}

	def uploadConfiguration = {
		CommonsMultipartFile file = params.configFile
		if (file && !file.isEmpty() && file.getSize() > 0) {
			def config = grailsApplication.config
			try {
				config.merge(new ConfigSlurper().parse(new String(file.bytes)))
				flash.message = "Successfully merged configuration uploaded file"
			} catch (ex) {
				ex.printStackTrace()
				flash.error = "Exception while merging configuration file"
			}
		}
		redirect(action: index)
	}

	def viewConfigMap={
		[map:grailsApplication.config]
	}

	def generateConfigFile = {
		def config = grailsApplication.config
		String result=showMap(config,0, new StringBuffer()) as String
		println result
		render result

	}

	private StringBuffer showMap(Map map, int deep, StringBuffer sb) {
		sb.append("\n{")
		sb.append("\t"*deep)
		map.each {key, value ->
			if (key != 'class') {
				sb.append("\n"+key)
				if (value && (value instanceof Map)) {
					deep++
					showMap(value,deep, sb)
				} else {
					sb.append("=" + value)
				}
			}
		}
		sb.append("}")
		return sb
	}

	private def getConfigValue(String pathString) {
		def config = grailsApplication.config
		pathString.tokenize(".").each {path ->
			config = config."${path}"
		}
		return config
	}

	private void setConfigValue(String pathString, def newValue) {
		def config = grailsApplication.config
		List paths = pathString.tokenize(".")
		String lastVar = paths.last()
		paths = paths - lastVar
		paths.each {path ->
			config = config."${path}"
		}
		config."$lastVar" = newValue
	}

}
