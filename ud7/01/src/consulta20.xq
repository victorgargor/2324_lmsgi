(: Consulta 20 :)
<libros>
{
  for $x in doc('books')//book
  return (
        <titulo>{$x/title}</titulo>,
        <numautores>{count($x/author)}</numautores>  
  )        
}
</libros>
