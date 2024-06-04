(: Consulta 24 :)
<libros>
{
  for $x in doc('books')//book[contains(translate(title, 'x', 'X'), 'X')]
  order by $x/title descending
  return $x 
}
</libros>

