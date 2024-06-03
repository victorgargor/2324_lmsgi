(: Consulta 16 :)
let $x := doc('books')//book/price
return (
    <min>{min($x)}</min>,
    <max>{max($x)}</max>
)
