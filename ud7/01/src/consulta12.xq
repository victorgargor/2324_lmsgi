(: Consulta 12 :)

(:
<libros>
{
  for $x in distinct-values(doc('books')//book/year)
  return <publicacion>{$x}</publicacion>
}
</libros> 
:)

(: Con let :)
<libros>
{
  let $x := distinct-values(doc('books')//book/year)
  for $x in $x
  return <publicacion>{$x}</publicacion>
}
</libros>
