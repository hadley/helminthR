findLocation <-function(location=''){

hpUrl=html(paste("http://www.nhm.ac.uk/research-curation/scientific-resources/taxonomy-systematics/host-parasites/database/results.jsp?dbfnsRowsPerPage=5000&x=13&y=5&paragroup=&fmsubgroup=Starts+with&subgroup=&fmparagenus=Starts+with&paragenus=&fmparaspecies=Starts+with&paraspecies=&fmhostgenus=Contains&hostgenus=&fmhostspecies=Contains&hostspecies=&location=",location,"&hstate=&pstatus=&showparasites=on&showhosts=on&showrefs=on&groupby=parasite&search=Search", sep=''))

	names <- hpUrl %>% 
		html_nodes(".searchlink")%>%
		html_text()

	hpList = matrix(names, ncol=2, byrow=TRUE)
	parNames=sapply(hpList[,1], strsplit, ' ')
	parNames2=lapply(parNames, function(a){if(length(a)<2){return(a)}else{return(paste(a[1], a[2], sep=' '))}})
	parNames3=lapply(parNames2, function(a){ gsub("\\(|\\)", "", a)})

	names(parNames3)=NULL
	parNamesShort=unlist(parNames3)
	ret=data.frame(Host=hpList[,2], Parasite=parNamesShort, ParasiteFull=hpList[,1])
return(ret)
}