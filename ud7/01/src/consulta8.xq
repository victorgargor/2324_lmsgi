(: Consulta 8 :)
<html>
<head>
  <meta charset="UTF-8"/>
  <title>Prácticas Víctor García Gordón</title>
</head>
<body>
  <h1>Listado de practicas</h1>
{
  for $tema in(1 to 7),$y in(1 to 3)
  return 
  <div>
    <a href="{$tema}/{$y}.html">Tema{$tema} Ejercicio{$y}</a>
  </div>  
}
</body>
</html>