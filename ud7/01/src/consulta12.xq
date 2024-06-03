(: Consulta 12 :)

(: 
for $x in distinct-values(doc('books')//book/year)
return <publicacion>{$x}</publicacion>
:)

(: Con let :)
let $x := distinct-values(doc('books')//book/year)
for $x in $x
return <publicacion>{$x}</publicacion>
