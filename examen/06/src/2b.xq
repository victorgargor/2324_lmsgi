for $x in doc('liga2024')//equipo
let $nombre := $x/nombre
return concat('Equipo: ',$nombre, ' Peso Medio: ',avg($x/jugadores/jugador/peso), 
' Altura Media: ',avg($x/jugadores/jugador/altura))