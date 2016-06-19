saveSVG = function() {
	realCol = 3
	xName = "svd"
	xCol = 4
	png(filename=compareFileName(varToString(preference1), xName))
	   compare(preference1,realCol ,xCol )
	dev.off()

	png(filename=plotFileName(varToString(preference1), xName))
	   pPlot(preference1, xCol )
	dev.off()

	##preferences 2
	png(filename=compareFileName(varToString(preference2), xName))
	   compare(preference2,realCol ,xCol )
	dev.off()

	png(filename=plotFileName(varToString(preference2), xName))
	   pPlot(preference2, xCol )
	dev.off()

	##preferences3
	png(filename=compareFileName(varToString(preference3), xName))
	   compare(preference3,realCol ,xCol )
	dev.off()

	png(filename=plotFileName(varToString(preference3), xName))
	   pPlot(preference3, xCol )
	dev.off()

	##preferences4
	png(filename=compareFileName(varToString(preference4), xName))
	   compare(preference4,realCol ,xCol)
	dev.off()

	png(filename=plotFileName(varToString(preference4), xName))
	   pPlot(preference4, xCol)
	dev.off()

	##preferences5
	png(filename=compareFileName(varToString(preference5), xName))
	   compare(preference5,realCol ,xCol)
	dev.off()

	png(filename=plotFileName(varToString(preference5), xName))
	   pPlot(preference5, xCol)
	dev.off()

	##preferences6
	png(filename=compareFileName(varToString(preference6), xName))
	   compare(preference5,realCol ,xCol)
	dev.off()

	png(filename=plotFileName(varToString(preference6), xName))
	   pPlot(preference6, xCol)
	dev.off()
}