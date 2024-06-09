<profesores>
{
  for $x in distinct-values(/bailes/baile/profesor)
  let $y := distinct-values(/bailes/baile[profesor=$x]/sala)
  order by $x
  return 
  <profesor>
      <nombre>{ $x }</nombre>
      <salas>{ for $z in $y return <sala>{ $z }</sala> }</salas>
  </profesor> 
}
</profesores>