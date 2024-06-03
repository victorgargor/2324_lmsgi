(: Consulta 26 :)
<anyos>
    {
        for $x in distinct-values(doc('books')//book/year)
        return <anyo>{$x}</anyo>
    }
</anyos>