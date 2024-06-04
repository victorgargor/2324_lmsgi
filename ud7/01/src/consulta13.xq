(: Consulta 13 :)
<libros>
{
  for $x in doc('books')//book
  order by $x/@category, $x/title
  return $x  
}
</libros>

