capture program drop select_casen
program define select_casen, rclass
  version 14.1
  syntax, varlist(string) año(string) [mes(string)]

  * Variables relevantes, según año y variable:
  local selection ""
  foreach var in `varlist' {
    * ¿Está alfabetizado?
    if ("`var'" == "_alfabetizado") {
      if inrange(`año', 1990, 2015) local temp "e1"
      if (`año' < 1990) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * ¿Es un trabajador asalariado?
    if ("`var'" == "_asalariado") {
      if inrange(`año', 2011, 2015) local temp "o15"
      if inrange(`año', 2009, 2009) local temp "o23"
      if (`año' < 2009) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * ¿Asiste a la escuela?
    if ("`var'" == "_asiste_escuela") {
      if inrange(`año', 2009, 2015) local temp "e3"
      if inrange(`año', 2006, 2006) local temp "e4"
      if inrange(`año', 2003, 2003) local temp "e2"
      if inrange(`año', 2000, 2000) local temp "e3"
      if (`año' < 2000) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * ¿Da boleta?
    if ("`var'" == "_boleta") {
      if inrange(`año', 2011, 2015) local temp "o14"
      if inrange(`año', 2009, 2009) local temp "o22"
      if (`año' < 2009) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * ¿Fue capacitado últimamente?
    if ("`var'" == "_capacitado") {
      if inrange(`año', 2015, 2015) local temp "o30"
      if inrange(`año', 2013, 2013) local temp "o31a"
      if (`año' < 2013) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Clasificación internacional de situación de empleo (v1):
    if ("`var'" == "_cise_v1") {
      if inrange(`año', 2011, 2015) local temp "o15"
      if inrange(`año', 2009, 2009) local temp "o23"
      if inrange(`año', 2006, 2006) local temp "o19"
      if inrange(`año', 2003, 2003) local temp "o9"
      if inrange(`año', 2000, 2000) local temp "o10"
      if (`año' < 2000) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * ¿Cotiza en el sistema de pensiones?
    if ("`var'" == "_cotiza_pension") {
      if inrange(`año', 2015, 2015) local temp "o28 o29"
      if inrange(`año', 2013, 2013) local temp "o29 o30"
      if inrange(`año', 2011, 2011) local temp "o29 o30"
      if inrange(`año', 2009, 2009) local temp "o31 o32"
      if (`año' < 2009) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * ¿Cotiza en el sistema de salud?
    if ("`var'" == "_cotiza_salud") {
      if inrange(`año', 2015, 2015) local temp "s12"
      if inrange(`año', 2013, 2013) local temp "s14"
      if inrange(`año', 2011, 2011) local temp "s17"
      if (`año' < 2011) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Edad:
    if ("`var'" == "_edad") {
      if inrange(`año', 1990, 2015) local temp "edad"
      if (`año' < 1990) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Nivel educacional:
    if ("`var'" == "_educ") {
      if inrange(`año', 2013, 2015) local temp "educ"
      if (`año' < 2013) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Escolaridad:
    if ("`var'" == "_esc") {
      local temp "esc"
    }
    * Factor de expansión:
    if ("`var'" == "_estrato") {
      if inrange(`año', 2011, 2015) local temp "varstrat"
      if inrange(`año', 1998, 2009) local temp "estrato"
      if (`año' < 1998) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Horas habitualmente trabajadas:
    if ("`var'" == "_hr_hab") {
      if inrange(`año', 2013, 2015) local temp "o10"
      if (`año' < 2013) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * ¿Tiene ascendencia indígena?
    if ("`var'" == "_indigena") {
      if inrange(`año', 2015, 2015) local temp "r3"
      if inrange(`año', 2013, 2013) local temp "r6"
      if inrange(`año', 2011, 2011) local temp "r6"
      if inrange(`año', 2009, 2009) local temp "t5"
      if (`año' < 2009) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * ¿Es inmigrante?
    if ("`var'" == "_inmigrante") {
      if inrange(`año', 2015, 2015) local temp "r1b"
      if inrange(`año', 2013, 2013) local temp "r1b"
      if inrange(`año', 2011, 2011) local temp "r1a"
      if inrange(`año', 2009, 2009) local temp "t8"
      if inrange(`año', 2006, 2006) local temp "t7"
      if (`año' < 2006) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * ¿Es joven?
    if ("`var'" == "_joven") {
      if inrange(`año', 2000, 2015) local temp "edad"
      if (`año' < 2000) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * ¿Completó la enseñanza media?
    if ("`var'" == "_media_completa") {
      if inrange(`año', 2013, 2015) local temp "educ"
      if (`año' < 2013) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * ¿Es mujer?
    if ("`var'" == "_mujer") {
      if inrange(`año', 2000, 2015) local temp "sexo"
      if (`año' < 2000) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * ¿Está ocupado?:
    if ("`var'" == "_ocupado") {
      if inrange(`año', 2000, 2015) local temp "activ"
      if (`año' < 2000) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Gran grupo de ocupación:
    if ("`var'" == "_oficio1") {
      if inrange(`año', 2011, 2015) local temp "oficio1"
      if inrange(`año', 2000, 2009) local temp "oficio"
      if (`año' < 2000) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Grupo primario de ocupación:
    if ("`var'" == "_oficio4") {
      if inrange(`año', 2015, 2015) local temp "oficio4"
      if inrange(`año', 2013, 2013) local temp "oficio4_n"
      if inrange(`año', 2011, 2011) local temp "oficio4"
      if (`año' < 2011) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * PSU:
    if ("`var'" == "_psu") {
      if inrange(`año', 2011, 2015) local temp "varunit"
      if inrange(`año', 1998, 2009) local temp "segmento"
      if inlist(`año', 1998, 2006)  local temp "seg"
      if (`año' < 1998) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Factor de expansión:
    if ("`var'" == "_pweight") {
      if inrange(`año', 2000, 2015) local temp "expr"
      if inrange(`año', 2011, 2011) local temp "expr_full"
      if (`año' < 2011) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Rama de actividad:
    if ("`var'" == "_rama1_v1") {
      if inrange(`año', 2011, 2015) local temp "rama1"
      *if inrange(`año', 2009, 2009) local temp "c_o13"
      *if inrange(`año', 2006, 2006) local temp "c_o12"
      *if inrange(`año', 2003, 2003) local temp "o8"
      *if inrange(`año', 2000, 2000) local temp "o9"
      if (`año' < 2011) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Región:
    if ("`var'" == "_region_re_v1") {
      if inrange(`año', 2009, 2015) local temp "region"
      if inrange(`año', 1990, 2006) local temp "r comu"
      if (`año' < 1990) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Tramo de edad (adultos):
    if ("`var'" == "_tramo_edad_v1") {
      if inrange(`año', 1990, 2015) local temp "edad"
      if (`año' < 1990) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Tramo de edad (niños):
    if ("`var'" == "_tramo_edad_v2") {
      if inrange(`año', 1990, 2015) local temp "edad"
      if (`año' < 1990) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Ingreso por hora de la ocupación principal:
    if ("`var'" == "_yprincipal_hr") {
      if inrange(`año', 2013, 2015) local temp "o10 yoprcor"
      if (`año' < 2013) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Ingreso de la ocupación principal:
    if ("`var'" == "_yprincipal") {
      if inrange(`año', 2013, 2015) local temp "yoprcor"
      if inrange(`año', 1990, 2011) local temp "yopraj"
      if (`año' < 1990) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Ingreso del trabajo
    if ("`var'" == "_ytrabajo") {
      if inrange(`año', 2013, 2015) local temp "ytrabajocor"
      if inrange(`año', 2006, 2011) local temp "ytrabaj"
      if (`año' < 2006) {
        display as error "`var' no disponible"
        exit 1
      }
    }
    * Anexión:
    local selection "`selection' `temp'"
  }
  * Resultados:
  return local selection = "`selection'"
end
