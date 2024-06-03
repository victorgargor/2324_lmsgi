(: Consulta 24 :)
for $x in doc('books')//book[contains(translate(title, 'x', 'X'), 'X')]
order by $x/title descending
return $x
