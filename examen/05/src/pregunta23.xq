for $x in doc('datos')/datos/proveedores/proveedor[last()]
return (concat('{','"nombreprov": ',$x/nombreprov,',',' "estado": ',$x/estado,',',' "ciudad": ',$x/ciudad,'}'))
