(: Consulta 25 :)
<libros>
    {
        for $x in doc('books')//book
        return (
            <libro>
                <titulo>{data($x/title)}</titulo>
                <caracteres>{string-length($x/title)}</caracteres>
            </libro>
        )
    }
</libros>