(: Consulta 22 :)
<libros>
{
  for $x in doc('books')//book[substring(year, string-length(year)) = "3"]
  return $x 
}
</libros>

(:
<libros>
{
  for $x in doc('02')/book
  where ends-with($x/year,'3')
  return data($x/title)  
}
</libros>
:)
