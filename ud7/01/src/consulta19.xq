(: Consulta 19 :)
<libros>
{
  let $x := doc('books')//book/price
  return (
      for $y in $x
      return $y ,
      <total>{sum($x)}</total>
  ) 
}
</libros>

