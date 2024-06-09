let $x := /bailes/baile
  return 
  <html>
    <body>
      <table border="1">
        <tr><th>Nombre del Baile</th><th>Profesor</th></tr>
        {
          for $y in $x
          return
            <tr>
              <td>{ $x/nombre }</td>
              <td>{ $x/profesor }</td>
            </tr>
        }
      </table>
    </body>
  </html>

