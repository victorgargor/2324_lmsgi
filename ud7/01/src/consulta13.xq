(: Consulta 13 :)
for $x in doc('books')//book
order by $x/@category, $x/title
return $x
