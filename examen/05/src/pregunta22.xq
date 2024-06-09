<proveedores>
{
  for $x in doc('datos')/datos/proveedores/proveedor
  order by $x/ciudad, $x/@numprov
  return (<ciudad>{$x/ciudad}</ciudad>,
  <numprov>{$x/@numprov}</numprov>)
}
</proveedores>