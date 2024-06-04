(: Consulta 21 :)
<libros>
{
  for $x in doc('books')//book
  return (
    concat($x/title, " (", count($x/author), ")")
  )    
}      
</libros>
