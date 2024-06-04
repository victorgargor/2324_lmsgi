(: Consulta 23 :)
<libros>
{
  for $x in doc('books')//book[starts-with(lower-case(@category), 'c')]/title
  return $x 
}
</libros>

