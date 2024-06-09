<bailes>
{
  for $x in /bailes/baile
  order by $x/nombre
  return 
  <baile>
      { $x/nombre }
      <precio_original>{ $x/precio }</precio_original>
      <precio_descuento>{ $x/precio * 0.85 }</precio_descuento>
  </baile>  
}
</bailes>
