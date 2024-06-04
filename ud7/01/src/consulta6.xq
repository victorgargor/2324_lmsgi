(: Consulta 6 :)
let $x := doc("books")
for $y in $x/bookstore/book
where $y/price > 30
order by $y/@category descending, $y/title descending
return concat($y/title, ":", $y/price, "$")


