(: Consulta 17 :)
<libros>
{
  let $x := doc('books')//book/price
  return (
      <min>{min($x)}</min>,
      <max>{max($x)}</max>
  )  
}
</libros>

