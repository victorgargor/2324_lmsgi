(: Consulta 18 :)
let $x := sum(doc('books')//book/price)
return <total>{$x}</total>
