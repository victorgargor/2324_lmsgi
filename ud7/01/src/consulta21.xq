(: Consulta 21 :)
for $x in doc('books')//book
return
    <libros>
        {concat($x/title, " (", count($x/author), ")")}
    </libros>
