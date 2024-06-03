(: Consulta 15 :)
<libros>{
for $x in doc('books')/bookstore
return ($x/book/title, <total>{count($x/book)}</total>)
}
</libros> 