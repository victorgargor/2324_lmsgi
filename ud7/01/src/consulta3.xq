(: Consulta 3:)
<html>
  <head>
    <title>Lista de alumnos</title>
  </head>
  <body>
    <ul>
      {
        for $x in doc('books')/bookstore/book
        order by $x/title
        where $x/price>30
        return <li>{$x/title/text()}</li>
      }
    </ul>
  </body>
</html>

