for $x in doc('datos')/datos/suministros/suministra
let $y := datos/productos/producto
where $y/color="Rojo" and  $x/numproducto=$y/@numproducto
return concat($x/numproducto,'--', avg($x/cantidad))
