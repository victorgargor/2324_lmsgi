(: Consulta 2 Lista libros precio superior a 30:)
for $x in doc('books')/bookstore/book
order by $x/title
where $x/price>30
return $x/title/text()
