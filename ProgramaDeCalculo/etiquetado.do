*******ETIQUETADO*************

/* Eliminar las personas que son ausentes definitivos
-> c_res=1 residentes habituales
-> c_res=3 residentes nuevos*/
keep if c_res != 2

/* conservar solamente entrevistas completas
-> r_def=00 Entrevista completa*/
keep if r_def== 0
destring eda, replace

*keep if eda>=15 & eda<=98

gen pea=1 if clase1==1

gen p_ocu=1 if clase2==1

gen p_des=1 if clase2==2

gen p_dis=1 if clase2==3

gen eda4c=0 if eda>=15 & eda<=17

replace eda4c=1 if eda>=18 & eda<=29

replace eda4c=2 if eda>=30 & eda<=59

replace eda4c=3 if eda>=60 & eda<=98

replace eda4c=4 if eda==99

gen peareporte=1 if clase2==1

replace peareporte=2 if clase2==2

gen salarios=0 if ing7c>=1 & ing7c<=3

replace salarios=1 if ing7c==4

replace salarios=2 if ing7c==5

replace salarios=3 if ing7c==6

replace salarios=4 if ing7c==7


* Crear etiqueta para  peareporte
label define peareporte 1 "Ocupada" 2 "Desempleada"
label values peareporte peareporte

* Crear etiqueta para saber leer y escribir (No. 29)
label define cs_p12 1 "Sí sabe leer" 2 "No sabe leer" 9 "No sabe"
label values cs_p12 cs_p12

* Crear etiqueta para requisitos de estudios para el ingreso a la carrera (No. 33)
label define cs_p15 1 "Primaria" 2 "Secundaria" 3 "Preparatoria" 9 "No sabe"
label values cs_p15 cs_p15

* Crear etiqueta para conocer motivos de ausencia (No. 37)
label define e_con 1 "Unión libre" 2 " Separado (a)" 3 "Divorciado(a)" 4 "Viudo(a)" 5 "Casado(a)" 6 "Soltero(a)" 9 "No sabe"
label values e_con e_con

* Crear etiqueta para conocer el estado conyugal(No. 38)
label define cs_ad_mot 01 "Trabajo" 02 "Estudios" 03 "Se casó o unió" 04 "Se separó o divorció" 05 "Problemas de salud" 06 "Reunirse con la familia" 07 "Inseguridad pública" 08 "Falleció" 09 "Otro motivo" 99 "No sabe"
label values cs_ad_mot cs_ad_mot  

* Crear etiqueta para conocer a que estado de la república o país se fue (No. 40)
label define cs_ad_des 1 "Mismo estado" 2 "Otro estado" 3 "Otro país" 9 "No sabe"
label values cs_ad_des cs_ad_des

* Crear etiqueta para conocer cual fue el motivo principal por el qué llegó (No. 41)
label define cs_nr_mot 01 "Trabajo" 02 "Estudios" 03 "Se casó o unió" 04 "Se separó o divorció" 05 "Problemas de salud" 06 "Reunirse con la familia" 07 "Inseguridad pública" 08 "Nació" 09 "Fue omitido" 10 "Otro motivo" 99 "No sabe"
label values cs_nr_mot cs_nr_mot

* Crear etiqueta para conocer la zona salarial (No. 45)
label define zona 1 "Zona A" 2 "Zona B"
label values zona zona

* Crear etiqueta para conocer la clasificación de la población en PEA y PNEA (No. 48)
label define clase1 1 "Población económicamente activa" 2 "Población no económicamente activa"
label values clase1 clase1

* Crear etiqueta para conocer la clasificación de la población en ocupada y desocupada; disponible y no disponible (No. 49)
label define clase2 1 "Población ocupada" 2 "Población desocupada" 3 "Disponibles" 4 "No disponibles"
label values clase2 clase2

* Crear etiqueta para conocer la clasificación de la población en ocupada plena, sin pago, ausente con nexo laboral y retorno, desocupada, iniciadora con búsqueda y ausente sin ingreso y nexo laboral (No. 50)
label define clase3 1 "Ocupado pleno" 2 "Ocupado Sin Pago" 3 "Ocupado ausente con nexo laboral" 4 "Ocupado ausente con retorno asegurado" 5 "Desocupados Iniciadores" 6 "Desocupados con búsqueda" 7 "Desocupados Ausentes sin ingreso y sin nexo laboral"
label values clase3 clase3

* Crear etiqueta para conocer la clasificación la población ocupada por posición en la ocupación (No. 51)
label define pos_ocu 1 "Trabajadores subordinados y remunerados" 2 "Empleadores" 3 "Trabajadores por cuenta propia" 4 "Trabajadores sin pago" 5 "No especificado"
label values pos_ocu pos_ocu

* Crear etiqueta para conocer la clasificación de la población ocupada por condición de acceson a instituciones de salud (No. 52)
label define seg_soc 1 "Con acceso" 2 "Sin acceso" 3 "No especificado"
label values seg_soc seg_soc

* Crear etiqueta para conocer la clasificación de la población ocupada por sector de actividad económica (No. 53)
label define rama 1 "Construcción" 2 "Industria manufacturera" 3 "Comercio" 4 "Servicios" 5 "Otros" 6 "Agropecuario"  7 "No especificado"
label value rama rama

* Crear etiqueta para conocer la clasificación de la población ocupada por condición de ocupación(No. 54)
label define c_ocu11c 1 "Profesionales, técnicos y trabajadores del arte" 2 "Trabajadores de la educación" 3 "Funcionarios y directivos"  4 "Oficinistas"  5 "Trabajadores industriales artesanos  y ayudantes" 6 "Comerciantes" 7 "Operadores de transporte"  8 "Trabajadores en servicios personales" 9 "Trabajadores en protección y vigilancia" 10 "Trabajadores agropecuarios" 11 "No especificado"
label value c_ocu11c c_ocu11c 

* Crear etiqueta para conocer la clasificación de la población ocupada por por nivel de ingreso (No. 55)
label define ing7c 1 "Hasta un salario mínimo" 2 "Más de 1 hasta 2 salarios mínimos" 3 "Más de 2 hasta 3 salarios mínimos" 4 "Más de 3 hasta 5 salarios mínimos" 5 "Más de 5 salarios mínimos" 6 "No recibe ingresos" 7 "No especificado"
label value ing7c ing7c

* Crear etiqueta para conocer la clasificación de la población ocupada por por nivel de ingreso 
label define salarios 0 "Hasta tres salarios" 1 "Entre tres y cinco salarios" 2 "Más de cinco salarios" 3 "No recibe ingresos" 4 "No especificado"
label value salarios salarios

* Crear etiqueta para conocer la clasificación de la población ocupada por la duración de la jornada  (No. 56)
label define dur9c 1 "Ausentes temporales con vínculo laboral" 2 "Menos de 15 horas" 3 "De 15 a 24 horas" 4 "De 25 a 34 horas" 5 "De 35 a 39 horas" 6 "De 40 a 48 horas" 7 "De 49 a 56 horas" 8 "Más de 56 horas"  9 "No especificado"
label value dur9c dur9c 

* Crear etiqueta para conocer la clasificación de la población ocupada por número de trabajadores (No. 57)
label define emple7c 1 "1 persona" 2 "De 2 a 5 personas" 3 "De 6 a 10 personas" 4 "De 11 a 15 personas" 5 "De 16 a 50 personas" 6 "De 51 y más personas" 7 "No especificado" 
label value emple7c emple7c

* Crear etiqueta para conocer la clasificación de la población ocupada por prestaciones den salud(No. 58)
label define medica5c 1 "Sin prestaciones" 2 "Solo acceso a instituciones de salud" 3 "Acceso de instituciones de salud y otras prestaciones" 4 "No tiene acceso a instituciones de salud pero si a otras prestaciones" 5 "No especificado"
label value medica5c medica5c

* Crear etiqueta para conocer la clasificación de la población ocupada por búsqueda de otro empleo(No. 59)
label define buscar5c 1 "Para tener otro empleo" 2 "Para cambiarse de trabajo" 3 "Otro" 4 "No buscó" 5 "No especificado"
label value buscar5c buscar5c

* Crear etiqueta para conocer la clasificación de la población ocupada según sector de la actividad económica (No. 60)
label define rama_est1 1 "Primario" 2 "Secundario" 3 "Terciario" 4 "No especificado"
label value rama_est1 rama_est1

* Crear etiqueta para conocer la clasificación de la población ocupada según sector de la actividad económica desagragado (No. 61)
label define rama_est2  1 "Agricultura, ganadería, silvicultura, caza y pesca" 2 "Industria extractiva y de la electricidad" 3 "Industria manufacturera" 4 "Construcción" 5 "Comercio" 6 "Restaurantes y servicios de alojamiento" 7 "Transportes, comunicaciones, correo y almacenamiento"  8 "Servicios profesionales, financieros y corporativos" 9 "Servicios sociales" 10 "Servicios diversos" 11 "Gobierno y organismos internacionales" 12 "No especificado" 
label value rama_est2 rama_est2

* Crear etiqueta para conocer la clasificación de la población ocupada por duración de la jornada laboral (No. 62)
label define dur_est 1 "Ausentes temporales con vínculo laboral" 2 "Menos de 15 horas" 3 "De 15 a 34 horas" 4 "De 35 a 48 horas" 5 "Más de 48 horas" 6 "No especificado"
label value dur_est dur_est

* Crear etiqueta para conocer la clasificación de la población ocupada según el tamaño de la unidad económica (No. 63)
label define ambito1 1 "Ámbito agropecuario" 2 "Ámbito no agropecuario" 3 "No especificado"
label value ambito1 ambito1

* Crear etiqueta para conocer la clasificación de la población ocupada según el tamaño de la unidad económica desagregada(No. 64)
label define ambito2 1 "Micronegocios" 2 "Sin establecimiento" 3 "Con establecimiento" 4 "Pequeños establecimientos" 5 "Medianos establecimientos" 6 "Grandes establecimientos" 7 "Gobierno" 8 "Otros"
label value ambito2 ambito2

* Crear etiqueta para conocer la clasificación de la población ocupada según el tipo de la unidad económica (No. 65)
label define tue1 1 "Empresas y negocios" 2 "Instituciones" 3 "Sector de los hogares" 4 "Situaciones de carácter especial y no especificadas"
label value tue1 tue1

* Crear etiqueta para conocer la clasificación de la población ocupada según el tipo de la unidad económica desagregada (No. 66)
label define tue2 1 "Empresas constituidas en sociedad y corporativas" 2 "Negocios no constituidos en sociedad" 3 "Privadas"  4 "Públicas" 5 "Sector informal" 6 "Trabajo doméstico remunerado" 7 "Agricultura de auto subsistencia"
label value tue2 tue2

* Crear etiqueta para conocer la clasificación de la población ocupada por tipo de  unidad  (No. 67)
label define tue3 1 "Administradas por los gobiernos" 2 "No administradas por los gobiernos"
label value tue3 tue3

* Crear etiqueta para conocer la clasificación de la población ocupada cuando  busca un trabajo adicional (No. 68)
label define busqueda 1 "Si buscó un trabajo adicional" 2 "No buscó un trabajo adicional"
label value busqueda busqueda

* Crear etiqueta para conocer la clasificación de la población desocupada por antecedentes de experiencia laboral (No. 69)
label define d_ant_lab 1 "Con experiencia" 2 "Sin experiencia"
label value d_ant_lab d_ant_lab

* Crear etiqueta para conocer la clasificación de la población desocupada por condición de desocupación  (No. 70)
label define d_cexp_est 1 "Perdió o termino su empleo anterior" 2 "Insatisfacción con el empleo anterior" 3 "Dejo o cerro un negocio propio" 4 "Otro"
label value d_cexp_est d_cexp_est

* Crear etiqueta para conocer la duración del desempleo  (No. 71)
label define dur_des 1 "Hasta 1 mes" 2 "Más de 1 mes hasta 3 meses" 3 "Más de 3 mes hasta 6 meses" 4 "Más de 6 meses hasta 1 año" 5 "Más de 1 año" 6 "No especificado"
label value dur_des der_des

* Crear etiqueta para conocer si la población está subocupada  (No. 72)
label define sub_o 1 "Si es subocupado" 0 "No es subocupado"
label value sub_o sub_o 

* Crear etiqueta para conocer la clasificación de la población  subocupada  (No. 73)
label define s_clasifi 1 "Pers. c/ nexo labo. p/ afec. p/ paro técnico" 2 "Pers. afecta. p/ una caida en el ritmo de su activi." 3 "Pers. q/laboran - de 35 h p/ razones de mercado" 4 "Pers. q/laboran + de 35 h p/ - de lo habitual p/razones de mer." 5 "Pers. q/ buscan aumen. su jor. lab. p/ obtener + ing." 6 "Ausentes con retorno en la semana de la entrevista"
label value  s_clasifi  s_clasifi

* Crear etiqueta para conocer la clasificación de la población  subordinada y remunerada  (No. 74)
label define remune2c 1 "Subordinados y remunerados-asalariados" 2 "Subordinados y remunerados-con percepciones no salariales"
label value remune2c remune2c 

* Crear etiqueta para conocer la clasificación de la población  subordinada y remunerada por prestaciones laborales (No. 75)
label define pre_asa 1 "Con prestaciones" 2 "Sin prestaciones" 3 "No especificado"
label value pre_asa pre_asa

* Crear etiqueta para conocer la clasificación de la población  subordinada y remunerada por su tipo de contrato  (No. 76)
label define tip_con  1 "Con contrato escrito" 2 "Temporal" 3 "De base, planta o por tiempo indefinido" 4 "Contrato de tipo no especificado" 5 "Sin contrato escrito" 6 "No especificado"
label value tip_con tip_con

* Crear etiqueta para conocer la población no economicamente activa disponible (No. 77)
label define dispo 1 "Primera opción" 2 "Segunda opción" 3 "Tercera opción" 4 "Cuarta opción" 5 "Quinta opción" 6 "Sexta opción" 7 "Séptima opción"
label value dispo dispo

* Crear etiqueta para conocer la población no economicamente activa no disponible (No. 78)
label define nodispo 1 "Primera opción" 2 "Segunda opción" 3 "Tercera opción" 4 "Cuarta opción" 5 "Quinta opción" 6 "Sexta opción" 7 "Séptima opción" 8 "Octava opción" 9 "Novena opción"
label value nodispo nodispo

* Crear etiqueta para conocer la población no economicamente activa no disponible por su razón de inactividad  (No. 79)
label define c_inac5c 1 "Estudiantes" 2 "Quehaceres domésticos" 3 "Pensionados y jubilados" 4 "Incapacitados permanentes" 5 "Otros no activos"
label value c_inac5c c_inac5c

* Crear etiqueta para conocer la composición de la población economicamente no activa (No. 80)
label define pnea_est 1 "Disponible para trabajar que han desistido de buscar empleo"  2 "Disponibles para trabajar que no buscan empleo por considerar que no tienen posibilidades" 3 "Con interés para trabajar pero bajo un contexto que les impide hacerlo" 4 "Sin interés por trabajar por atender otras obligaciones"  5 "Con impedimentos físicos para trabajar"  6 "Otros"
label value pnea_est pnea_est

* Crear etiqueta para conocer la instrucción de población con más de 5 años (No. 81)
*label define niv_ins 1 "Primaria incompleta" 2 "Primaria completa" 3 "Secundaria completa" 4 "Medio superior y superior" 5 "No especificado"
*label value niv_ins niv_ins

* Crear etiqueta para los rangos de edad de 14 años y más, clasificado en 5 grupos (No. 82)
label define eda5c  1 "14 a 24 años" 2 "25 a 44 años" 3 "45 a 64 años" 4 "65 años y más" 5 "Edad no especificado"
label values eda5c eda5c

* Crear etiqueta para los rangos de edad de 14 años y más, clasificado en 7 grupos (No. 83)
label define eda7c  1 "De 14 a 19 años" 2 "De 20 a 29 años" 3 "De 30 a 39 años" 4 "De 40 a 49 años" 5 "De 50 a 59 años" 6 "De 60 años y más" 7 "Edad no especificado"
label values eda7c eda7c

* Crear etiqueta para los rangos de edad de 12 años y más, clasificadas en 12 grupos (No. 84) 
label define eda12c 1 "De 14 a 19 años" 2 "De 20 a 24 años" 3 "De 25 a 29 años" 4 "De 30 a 34 años" 5 "De 35 a 39 años" 6 "De 40 a 44 años" 7 "De 45 a 49 años" 8 "De 50 a 54 años" 9 "De 55 a 59 años" 10 "De 60 a 64 años" 11 "De 65 años y más" 12 "No especificado"
label values eda12c eda12c

* Crear etiqueta para los rangos de edad
label define edad4c 0 "De 15 a 17 años" 1 "De 18 a 29 años" 2 "De 30 a 59 años" 3 "De 60 años"  4 "No especificado"
label values eda4c edad4c

* Crear etiqueta para los rangos de edad de la población total (No. 85) 
label define eda19c 1 "Menores de 1 año" 2 "De 1 a 4 años" 3 "De 5 a 9 años" 4 "De 10 a 11 años" 5 "De 12 a 13 años" 6 "De 14 a 19 años" 7 "De 20 a 24 años" 8 "De 25 a 29 años"  9 "De 30 a 34 años"  10 "De 35 a 39 años" 11 "De 40 a 44 años" 12 "De 45 a 49 años"  13 "De 50 a 54 años" 14 "De 55 a 59 años" 15 "De 60 a 64 años" 16 "De 65 a 69 años" 17 "De 70 a 74 años" 18 "De 75 años y más" 19 "No especificado"
label values eda19c eda19c

* Crear etiqueta para conocer el número de hijos de mujeres mayores de 14 años (No. 86)
label define hij5c 1 "Sin hijos" 2 "De 1 a 2 hijos" 3 "De 3 a 5 hijos" 4 "De 6 hijos y más" 5 "No especificado"
label values hij5c hij5c

* Crear etiqueta para conocer la condición de la población de por condición de ocupación o desocupación  mayores de 14 años (No. 87)
label define domestico 1 "Solo PEA" 2 "PEA y estudian" 3 "PEA y quehaceres domésticos" 4 "PEA y apoyos al hogar" 5 "PEA y otras actividades" 6 "Solo PNEA" 7 "PNEA y estudian" 8 "PNEA y quehaceres domésticos" 9 "PNEA y apoyos al hogar" 10 "PNEA y otras actividades"
label values domestico domestico

* Crear etiqueta para conocer el número de años de escolaridad (No. 88)
label define anios_esc 1 "1 año de escolaridad" 2 "2 años de escolaridad" 3 "3 años de escolaridad" 4 "4 años de escolaridad" 5 "5 años de escolaridad" 6 "6 años de escolaridad" 7 "7 años de escolaridad" 8 "8 años de escolaridad" 9 "9 años de escolaridad" 10 "10 años de escolaridad" 11 "11 años de escolaridad" 12 "12 años de escolaridad" 13 "13 años de escolaridad" 14 "14 años de escolaridad" 15 "15 años de escolaridad" 16 "16 años de escolaridad" 17 "17 años de escolaridad" 18 "18 años de escolaridad" 19 "19 años de escolaridad" 20 "20 años de escolaridad"  21 "21 años de escolaridad" 22 "22 años de escolaridad" 23 "23 años de escolaridad" 24 "24 años de escolaridad" 99 "no especificado" 
label values anios_esc anios_esc

* Crear etiqueta para conocer si el entrevistado busca trabajo (No. 92)
label define tpg_p8a 0 "No aplica" 1 "Si busco trabajo" 
label values tpg_p8a tpg_p8a

* Crear etiqueta para conocer la clasificación de la población que trabaja menos de 35 horas, más de 35 y más de 48 horas (No. 93)
label define tcco 1 "OH35RM (Ocupados que trabajan menos de 35 hrs por razones de mercado)" 2 "OH35SM (Ocupados que trabajan de 35 hrs ó más y ganan hasta 1 salario mínimo)" 3 "OH48SM (Ocupados que trabajan mas de 48 horas con ingresos de más de 1 hasta 2 s.m.)"
label values tcco tcco

* Crear etiqueta para conocer si el entrevistado trabaja por cuenta propia en una actividad no calificada (No. 94)
label define cp_anoc 1 "Cuenta propia en actividades no calificadas"
label values cp_anoc cp_anoc

* Crear etiqueta para conocer la institución médica en la que recibe atención  (No. 95)
label define imssissste 1 "Imss" 2 "Issste" 3 "Otras instituciones" 4 "No recibe atención médica" 5 "No especificado"
label values imssissste imssissste

* Crear etiqueta para conocer si trabaja más de 48 horas y recibe menos de un salario mínimo (No. 96)
label define  ma48me1sm 1 "Si trabaja más de 48 horas y gana menos de 1 salario mínimo" 
label values ma48me1sm ma48me1sm

* Crear etiqueta para conocer si la población recibe apoyos económicos  (No. 98)
label define  p14apoyos  1 "Si recibe apoyos económicos" 2 "No recibe apoyos económicos" 3 "No especificado"
label values p14apoyos p14apoyos

* Crear etiqueta para conocer la clasificación de actividades económicas con base al sistema de clasificación industrial de América del Norte (No. 99)
label define  scian  1 "Agricultura, ganadería, aprovechamiento forestal, pesca y caza" 2 "Minería" 3 "Generación y distribución de electricidad, suministro de agua y gas" 4 "Construcción" 5 "Industrias manufactureras" 6 "Comercio al por mayor" 7 "Comercio al por menor" 8 "Transportes, correos y almacenamiento" 9 "Información en medios masivos" 10 "Servicios financieros y de seguros" 11 "Servicios inmobiliarios y de alquiler de bienes" 12 "Servicios profesionales, científicos y técnicos" 13 "Corporativos" 14 "Servicios de apoyo a los negocios y manejo de deseechos" 15 "Servicios educativos" 16 "Servicios de salud y de asistencia social" 17 "Servicios de esparcimiento, culturales y deportivos"  18 "Servicios de hospedaje y de preparación de alimentos y bebidas" 19 "Otros servicios, excepto actividades gubernamentales"  20 "Actividades gubernamentales y de organismos internacionales" 21 "No especificado"
label values scian scian 

* Crear etiqueta para conocer el total de trabajos de la población (No. 100)
label define  t_tra 1 "Un solo trabajo" 2 "Dos trabajos"
label values t_tra t_tra

* Crear etiqueta para conocer si el empleo de la población es formal o informal  (No. 101)
label define emp_ppal 1 "Empleo informal" 2 "Empleo formal"
label values emp_ppal emp_ppal

* Crear etiqueta para conocer el tipo de unidad económica del trabajo primcipal (No. 102)
label define  tue_ppal 1 "Sector informal" 2 "Fuera del sector informal"
label values tue_ppal tue_ppal

* Crear etiqueta para conocer los trabajadores transfronterizos que existen (No. 103)
label define  trans_ppal 1 "Extranjero, embajadas o consulados" 2 "Dentro del país"
label values trans_ppal trans_ppal

* Crear etiqueta para conocer las filas agregadas de la matriz Hussmans (No. 104)
label define  mh_fil2 1 "Sector informal" 2 "Trabajo doméstico remunerado" 3 "Empresas, Gobierno e Instituciones4/" 4 "Ámbito agropecuario"
label values mh_fil2 mh_fil2

* Crear etiqueta para conocer las columnas de la matriz Hussmans (No. 105)
label define  mh_col 1 "Subordinados y remunerados Asalariados INFORMALES"  2 "Trabajadores subordinados y remunerados - Asalariados FORMALES" 3 "Trabajadores subordinados y remunerados - Con percepciones no salariales INFORMALES" 4 "Trabajadores subordinados y remunerados - Con percepciones no salariales FORMALES" 5 "Empleadores INFORMAL" 6 "Empleadores FORMAL" 7 "Cuenta p. INFORMAL" 8 "Cuenta p. FORMAL" 9 "Trabajadores no Remunerados INFORMAL" 10 "Trabajadores no Remunerados FORMAL"
label values mh_col mh_col

* Crear etiqueta para conocer los sectores institucionales del tranajo principal (No. 106)
label define  sec_ins 1 "Instituciones financieras" 2 "Corporaciones y sociedades no financieras" 3 "Agropecuario" 4 "No agropecuario" 5 "Gobierno" 6 "Privadas no lucrativas"  7 "Públicas no lucrativas" 8 "Sector Informal"  9 "Trabajo doméstico remunerado" 10 "Agricultura de subsistencia" 11 "Situaciones de carácter especial y no especificadas"
label values sec_ins sec_ins

* Crear etiqueta para sex
* Cambiar la variable sex de su condición de texto a numérico
label define sex 1 "Hombre" 2 "Mujer"
label values sex sex

* Crear etiquera para ing7c
*label define ing7c 1 "Hasta un salario mínimo" 2 "De uno a dos salarios mínimos" 3 " De dos a tres salarios mínimos" 4 "De tres a cinco salarios mínimos" 5 "Más de cinco salarios mínimos" 6 "No recibió ingreso" 7 "No especificado"
*label values ing7c ing7c

* Crear etiqueta para niv_ins
label define niv_ins 1 "Primaria incompleta" 2 "Primaria completa" 3 "Secundaria completa" 4 "Media superior y superior" 5 "No espeficidado"
label values niv_ins niv_ins

*Crear etiqueta para seguridad social 1seg_soc

*label define seg_soc 1 "con acceso" 2 "sin acceso" 3 "no especificado"  
*label values seg_soc lseg_soc

 
*Crear etiqueta para posición en la ocupación
*label define  pos_ocu 1 "Subordinados" 2 "Empleadores" 3 "Cuenta propia" 4 "Sin pago" 5 "No especificado"
*label values pos_ocu pos_ocu
 

*Crear etiqueta para trabajo domestico
*label define   domestico 1 "Sólo PEA" 2 "PEA y estudian" 3 "PEA y quehaceres domésticos" 4 "PEA y apoyos al hogar" 5 "PEA y otras actividades" 6 "Sólo PNEA" 7 "PNEA y estudian" 8 "PNEA y quehaceres domésticos" 9 "PNEA y apoyos al hogar" 10 "PNEA y otras actividade"
*label values   domestico domestico

*Crear etiqueta para grado aprobado
label define cs_p13_1 ///
0 "Ninguno"   ///
1 "Preescolar"    ///
2 "Primaria"    ///
3 "Secundaria"    ///
4 "Preparatoria"    ///
5 "Normal"    ///
6 "Carrera técnica"    ///
7 "Profesional"    ///
8 "Maestría"    ///
9 "Doctorado"    ///
99 "No sabe" 
label values cs_p13_1 cs_p13_1 
