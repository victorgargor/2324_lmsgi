(: Consulta 27 :)
<autores>
    {
        for $x in distinct-values(doc('books')//book/author)
        order by string-length($x)
        return <autor>{$x}</autor>
    }
</autores>