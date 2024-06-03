(: Consulta 28 :)
let $x := doc('books')//book
return 
<html>
    <body>
        <table border="1">
            <tr>
                <th>Título</th>
            </tr>
            {
                for $y in $x
                return
                    <tr>
                        <td>{$y/title}</td>
                    </tr>
            }
        </table>
    </body>
</html>
