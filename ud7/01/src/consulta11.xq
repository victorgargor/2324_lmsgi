(: Consulta 11 :)
for $x in doc('books')//book[year = 2005]
return
    <lib2005>
        <titulo>{$x/title}</titulo>
        <autor>{$x/author}</autor>
    </lib2005>
