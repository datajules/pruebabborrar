*-------------------- Primero declaramos las macros globales --------------------*
*                     ---------------------------------------
* 1.- Generamos macros locales que lean la ubicaci󮠤el fichero
local carpeta2 "`c(pwd)'"
local carpeta1 = strpos("`carpeta2'","Programa") 
loc carpeta1 = `carpeta1' - 1
local carpeta = substr("`carpeta2'", 1, `carpeta1')
global carpeta `carpeta'
* 2.- Conocida la ubicaci󮠤el fichero generamos las macros globales
* La de bases
global Bases "`carpeta'BasesOriginales" 
* La de bases procesadas
global BasesP "`carpeta'BasesProcesadas"
* La de Logs
global Logs "`carpeta'Logs"
* La de Cuadros
global Cuadros "`carpeta'Resultados"
* La de Bases finales
global Finales "`carpeta'BasesFinales"
* La de Programa
global Programa "`carpeta'ProgramaDeCalculo"
* La de Graficas y Mapas
global Mapas "`carpeta'GraficasYMapas"
*--------------------------------------------------------------------------------*

* I. Creamos las carpetas que vamos a usar

* a) La de bases generales
local opi
foreach op in "BasesFinales" "BasesOriginales" "ProgramaDeCalculo"  "BasesProcesadas" "GraficasYMapas" "Logs" "Resultados" {
	cd "$carpeta"
	local ext = 0
	local graf : dir . dirs "*"
	foreach caso of local graf {
		local opi = lower("`op'")
		display lower("`caso'") " | `opi'"
 
		if lower("`caso'")=="`opi'"{
			local ext=1
		}
		display "`ext'"
	}
	if `ext'==0 {
		di "`caso'" " = " "`opi'"
		di "`ext'"
		capture mkdir "$carpeta\`op'"	
	}
	cd "$Programa"
}



*Tenemos 
*Do que etiqueta y filtra

*Actividades

*1. Limpiar y Etiquetar
*	1.1. Guardar en carpetas lo procesado
*2. Descargar
*	2.1 Guardar en carpetas lo descargado


* 2. Descragar


*Tenemos 
*Do que etiqueta y filtra

*Actividades

*1. Limpiar y Etiquetar
*	1.1. Guardar en carpetas lo procesado
*2. Descargar
*	2.1 Guardar en carpetas lo descargado






* 2. Descragar

* Primero lo hacemos para uno para conocer el proceso que queremos integrar a un loop

local actual "$Bases"
di "$Bases"

/*
local aniol "2005" "2005" "2006" "2007" "2008" "2009" "2010" "2011" "2012" "2013" "2014" "2015" "2016" "2017" "2018" "2019" 
local trimestrel "1" "1" "2" "3" "4"

foreach anio of local aniol {
	foreach trimestre of local trimestrel {
	* Aquí el url
		local url "https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/microdatos/`anio'trim`trimestre'_csv.zip"

		* Generamos anio
		capture mkdir "`actual'/`anio'"
		

		* Generamos el trimestre
		capture mkdir "`actual'/`anio'/`trimestre'T"

		* Generamos limpia
		capture mkdir "`actual'/`anio'/`trimestre'T/limpia"
		* Generamos origunal
		capture mkdir "`actual'/`anio'/`trimestre'T/original"

		* Descarga
		capture copy "`url'" "`actual'/`anio'/`trimestre'T/original/`anio'`trimestre'.zip", replace

		* Ahora vamos a descomprimir
		* Cambiamos directorio raíz

		capture cd "`actual'/`anio'/`trimestre'T/original"
		
		capture unzipfile "`actual'/`anio'/`trimestre'T/original/`anio'`trimestre'.zip", replace

	}
}
*/
cd "$Programa"



* Falta corregir primer trimestre





* Almacenamos el directorio en una local
***local carpeta "Z:\nDEET\MicrodatosOriginalesYLimpios\EncuestasYCensos\ENOE/"

*local carpeta "Z:\DEET\nDEET\MicrodatosOriginalesYLimpios\EncuestasYCensos\ENOE/"
* Cambiamos el directorio de trabajo
cd "$Bases"


* Leemos las carpetas del directorio y las almacenamos en una local
local subdirs : dir "." dirs "*"



* Seleccionamos únicmente los que representan un año
local anio
foreach op of local subdirs{
	if regexm("`op'", "^[0-9]") == 1{
		local anio  `anio'  `op'
	}
}


* Visitamos cada uno de los años y extraemos las carpetas de lo trimestres
foreach i of local anio{
	local directorio "$Bases\\`i'"
	cd "`directorio'"
	local subdirs : dir "." dirs "*"
	foreach j of local subdirs{
		if regexm("`j'", "^[0-9]") == 1 {
			local aniotrim = "$Bases\\`i'\\`j'"
			local trimestre  `trimestre'  `aniotrim'
		}
	}
}
cd "$Programa"

* Dentro de la lista creamos investigamos cuales contienen datos
foreach i of local trimestre{
	cd "`i'"
	local subdirs : dir "." dirs "*"
	foreach j of local subdirs{
		if regexm("`j'", "original") == 1 {
			local aniotrim "`i'/`j'"
			local trimval  `trimval'  `aniotrim'
		}
	}
	cd "$Programa"
}


* Ya tenemos un registro de todos las carpetas con archivos válidos, con ellos 
* leemos los achivos

* Para sociodem



local sdem 
foreach i of local trimval{
	cd "`i'"
	local arch 
	local arch : dir . files "*.csv"
	foreach j of local arch{
		if regexm("`j'", "sdemt|SDEMT") == 1 {
			local sdem   `sdem' "`i'/`j'"
		}
	}
}

cd "$Programa"

foreach op of local sdem{
	di "`op'"
}


* Para coe1

local coe1 
foreach i of local trimval{
	cd "`i'"
	local arch : dir . files "*.csv"
	foreach j of local arch{
		if regexm("`j'", "coe1|COE1") == 1 {
			local coe1   `coe1' "`i'/`j'"
		}
	}
}




* Para hogar

local  hog
foreach i of local trimval{
	cd "`i'"
	local arch : dir . files "*.csv"
	foreach j of local arch{
		if regexm("`j'", "hog|HOG") == 1 {
			local hog   `hog' "`i'/`j'"
		}
	}
}



* Para coe2

local coe2 
foreach i of local trimval{
	cd "`i'"
	local arch : dir . files "*.csv"
	foreach j of local arch{
		if regexm("`j'", "coe2|COE2") == 1 {
			local coe2   `coe2' "`i'/`j'"
		}
	}
}




* Para vivt

local vivt 
foreach i of local trimval{
	cd "`i'"
	local arch : dir . files "*.csv"
	foreach j of local arch{
		if regexm("`j'", "vivt|VIVT") == 1 {
			local vivt   `vivt' "`i'/`j'"
		}
	}
}

* Así se pueden comprobar los elementos de una macro
*foreach i of local vivt {
*	display "`i'"
*}




* Primero tenemos que enviar todo a número y los nombres de las 
local todos `sdem' `coe1' `hog' `coe2' `vivt'
local limpias
foreach ii of local todos  {
	import delimited using "`ii'", delimiters(",") encoding("UTF-8") clear
	destring *, replace
	capture rename `v' `=lower("`v'")'
	local nomb "`:subinstr local ii "original" "limpia", all'"
	saveold "`:subinstr local nomb ".csv" "", all'.dta", replace
	display "`ii'"
}


* Para sdem
local nomb `:subinstr local sdem "original" "limpia", all'
local sdemLimp `:subinstr local nomb ".csv" ".dta", all'
* Para coe1
local nomb `:subinstr local coe1 "original" "limpia", all'
local coe1Limp `:subinstr local nomb ".csv" ".dta", all'
* Para hog
local nomb `:subinstr local hog "original" "limpia", all'
local hogLimp `:subinstr local nomb ".csv" ".dta", all'
* Para coe2
local nomb `:subinstr local coe2 "original" "limpia", all'
local coe2Limp `:subinstr local nomb ".csv" ".dta", all'
* Para vivt
local nomb `:subinstr local vivt "original" "limpia", all'
local vivtLimp `:subinstr local nomb ".csv" ".dta", all'



* Loop para pegar las bases de la ENOE
local todos
local vivyhog
local sdemycoes
local n = 1
foreach ii of local vivtLimp {
    local directorio substr("`ii'",1,64)
	local trimanio substr("`ii'",-8,4)
	use  "`ii'", clear
	rename p1 p1_viv
    rename p3 p3_viv
	mmerge cd_a ent con v_sel using "`: word `n' of `hogLimp''", type(spread)
	rename p4_1 p4_1_hog
	rename p4_2 p4_2_hog
	local archivo = `directorio' + "vivyhog" + `trimanio'
	
	saveold "`archivo '", replace
	local vivyhog `vivyhog' "`archivo '"
	
	***
	
	use "`: word `n' of `sdemLimp''", clear
	
	mmerge cd_a ent con v_sel  n_hog h_mud  n_ren using "`: word `n' of `coe1Limp''", type(spread)
	
	mmerge cd_a ent con v_sel  n_hog h_mud  n_ren using "`: word `n' of `coe2Limp''", type(spread)
	
	local archivo = `directorio' + "sdemycoes" + `trimanio'
	
	saveold "`archivo '", replace
	local sdemycoes `sdemycoes' "`archivo '"
	

	local archivo = `directorio' + "vivyhog" + `trimanio'
	mmerge cd_a ent con v_sel n_hog h_mud  using "`archivo'", type(spread)
	
	
	local archivo = `directorio' + "todas" + `trimanio'
	
	drop if _merge == 2
	
	saveold "`archivo '", replace
	local todas `todas' "`archivo '"
	

	local ++n
}


* Loop para etiquetar y limpiar las bases de la ENOE

local carpeta "$Programa"
display "`carpeta'/etiquetado.do"

local n = 1
foreach ii of local sdemycoes {
	/* Eliminar las personas que son ausentes definitivos
	-> c_res=1 residentes habituales
	-> c_res=3 residentes nuevos*/
	keep if c_res != 2

	/* conservar solamente entrevistas completas
	-> r_def=00 Entrevista completa*/
	keep if r_def== 0

	use "`ii'", clear
	keep if eda>=15 & eda<=98
	do "`carpeta'etiquetado.do"
	
	saveold "`ii'", replace

	local ++n
}






local n = 1
foreach ii of local todas {

	use "`ii'", clear
	
	/* Eliminar las personas que son ausentes definitivos
	-> c_res=1 residentes habituales
	-> c_res=3 residentes nuevos*/
	keep if c_res != 2

	/* conservar solamente entrevistas completas
	-> r_def=00 Entrevista completa*/
	keep if r_def== 0
	
	do "`carpeta'etiquetado.do"
	saveold "`ii'", replace

	local ++n
}



local todos `sdemLimp' `coe1Limp' `hogLimp' `coe2Limp' `vivtLimp'
local limpias
foreach ii of local todos  { 
	erase  "`ii'"
}


local todos `sdem' `coe1' `hog' `coe2' `vivt'
local limpias
foreach ii of local todos  { 
	erase  "`ii'"
}



********************************************************************************
***************************** Descara de tabulados *****************************
********************************************************************************

local urltab1 "https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/tabulados/indicadores_estrategicos_15ymas_2019_trim2_xls.zip https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/tabulados/indicadores_estrategicos_15ymas_2019_trim1_xls.zip https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/tabulados/enoe_estrategicos_2018_xls.zip https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/tabulados/enoe_estrategicos_2017_xls.zip https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/tabulados/enoe_estrategicos_2016_xls.zip https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/tabulados/enoe_estrategicos_2015_xls.zip https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/tabulados/enoe_estrategicos_2014_xls.zip https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/tabulados/enoe_estrategicos_2005_2013_xls.zip"

* Creamos las carpetas de tabulado por año
local aniol "2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022"
local actual "$Cuadros"


foreach anio of local aniol {
	capture mkdir "`actual'/`anio'/Tabulados"
}

* Descargamos los archivos zip
 foreach url of local  urltab1 {
	local aniopos = strpos("`url'", "s_20") + 2
	local anio0 = substr("`url'",`aniopos', 4)
	local carpeta = "`actual'/`anio0'/Tabulados/" // Aquí la carpeta
	local nombdist = strpos("`url'", "/tabulados/") + 11
	local nomb = substr("`url'",`nombdist', .)
	copy "`url'" "`actual'/`anio0'/Tabulados/`nomb'", replace
 }


