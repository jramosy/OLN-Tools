* ¿Es un conmutante?  (sí distingue a Ñuble del Biobío)
capture program drop gen_ene_conmutante_v2
program define gen_ene_conmutante_v2, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Abreviaciones
  local var "_conmutante_v2"
  * Mutación
  gen_ene_region_tr_v2, año(`año') mes(`mes')
  gen_ene_region_re_v2, año(`año') mes(`mes')
  generate `var' = (_region_re_v2 != _region_tr_v2)
  replace  `var' = 1e5 if (_region_re_v2 == 1e5)
  replace  `var' = 1e5 if (_region_tr_v2 == 1e5)
  * Etiquetado
  # delimit ;
    label define `var'
      0 "No conmutantes"
      1 "Conmutantes"
      1e5 "ns/nr"
      1e6 "nacional";
  # delimit cr
  label values `var' `var'
  label variable `var' "¿Es un conmutante?"
end
