for $x in collection('academia')/curso
return (data($x/nombre),data($x/precio),data($x/@cuota))