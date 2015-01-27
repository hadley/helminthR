## parasiteR

[![Build Status](https://travis-ci.org/ropensci/parasiteR.svg?branch=master)](https://travis-ci.org/ropensci/parasiteR)

> Programmatically access the London Natural History Museum's [helminth database](http://www.nhm.ac.uk/research-curation/scientific-resources/taxonomy-systematics/host-parasites/index.html). 


### Installation

```r
# From GitHub
# install.packages("devtools")
devtools::install_github("rOpenSci/parasiteR")
library("parasiteR")
```


### Main functions

#### `findHost()`

Given a host genus and (optionally) species and location, this function returns all host-parasite associations of a given host species. The example below determines all parasite records for helminth infections of _Gorilla gorilla_. 

```r
gorillaParasites=findHost('Gorilla', 'gorilla')
head(gorillaParasites)
```

#### `findParasite()`

Given a helminth parasite genus (and optionally species, and location), this function returns a list of host-parasite records for that parasite. In the example below, I query the database for occurrences of _Giardia lamblia_.

```r
giardiaHosts=findParasite(genus='Giardia', species='lamblia')
str(giardiaHosts)
```



#### `listLocations()` and `findLocation()`

List all location names (`listLocations()`). These names can be given to the `findLocation()` function, which finds all host-parasite associations that have occurred in the given location. Below, I look at host-parasite associations recorded in France. 


```r
FrenchHostPars=findLocation(location='France')
str(FrenchHostPars)
```




### Contribute!
This is a very recent creation, and will be changed pretty often as I find time to update it. Feel free to fork it and contribute some functionality. 

