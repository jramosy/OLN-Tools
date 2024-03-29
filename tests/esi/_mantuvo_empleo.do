*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_mantuvo_empleo"

forvalues año = 2010(1)2015 {
	* Variables relevantes
	select_esi, varlist(`var1') año(`año')
	local var0 "`r(selection)'"

	* BBDD
	capture : use "$pkg/data/tests/esi/`año'/`var1'.dta", clear
	gen_esi`var1', año("`año'")
	contract `var0' `var1'
	gen nolabel = `var1'
	drop _freq

	* Sub-muestra (solo 2010)
	if (`año' == 2010) keep if inlist(MESES_EMPLEO, 0, 1, 10, .)

	* Visualización
	format * %100.0g
	noisily : display _newline "{title:Test N°1 - `año'}"
	noisily : codebook, compact
	noisily : list, abbr(100)
	noisily : label list

	* Contrastes
	local id "Test N°1 - `año'"
	if (`año' == 2010) matrix expected = (0, 1, 1, 1e5)'
	if (`año' != 2010) matrix expected = (1, 0, 1, 0, 1e5)'
	expect_equal, expected("expected") observed("`var1'") id("`id'")
}
