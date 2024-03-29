capture program drop gen_casen_alfabetizado
program define gen_casen_alfabetizado
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_alfabetizado") año(`año')
  # delimit ;
  recode `r(selection)'
    (1e6  = 1e6 "Nacional")
    (1    =   1 "Sí")
    (2/4  =   0 "No")
  	(else = 1e5 "ns/nr"),
  	generate(_alfabetizado);
  # delimit cr
  * Etiquetado
  label variable _alfabetizado "¿Sabe leer y escribir?"
end
