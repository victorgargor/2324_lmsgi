(: Consulta 14 :)
let $x := count(doc("books")//book)
return <total>{$x}</total>
