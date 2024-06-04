(: Consulta 11 :)
<libros>{
  for $x in doc('books')//book[year = 2005]
  return(
     <lib2005>
          <titulo>{$x/title}</titulo>
          <autor>{$x/author}</autor>
     </lib2005>
  )   
}
</libros>
