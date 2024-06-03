(: Consulta 20 :)
for $x in doc('books')//book
return
    <libros>
        <titulo>{$x/title}</titulo>
        <numautores>{count($x/author)}</numautores>
    </libros>
