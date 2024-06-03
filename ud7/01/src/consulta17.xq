(: Consulta 17 :)
let $x := doc('books')//book
for $y in $x
let $iva := $y/price * 1.21
order by $iva
return
    <libros>
        <titulo>{$y/title}</titulo>
        <precio>{$y/price}</precio>
        <precioIVA>{$iva}</precioIVA>
    </libros>
