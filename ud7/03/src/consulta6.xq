<ganancias>
{
  for $x in /bailes/baile[profesor='Jesus Lozano']
  return 
  <baile>
      { $x/nombre }
      <ganancia>{ $x/precio * $x/plazas }</ganancia>
  </baile>
}
</ganancias>