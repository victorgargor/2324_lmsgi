<ganancias>
{
  for $x in /bailes/baile[contains(profesor, 'Laura')]
  return 
  <baile>
      { $x/nombre }
      <ganancia>{ $x/precio * $x/plazas }</ganancia>
  </baile>
}
</ganancias>