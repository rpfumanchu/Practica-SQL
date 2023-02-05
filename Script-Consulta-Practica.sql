

--Consulta SQL


select m.nombre as Modelo, m2.nombre as Marca, g.nombre as Grupo_Automovilistico, v.fecha_compra, v.matricula,cc.nombre as Color, v.km_totales, c.empresa as Aseguradora, v.poliza 
from flotacoches.vehiculos v 
inner join flotacoches.modelo m on m.idmodelo = v.idmodelo
inner join flotacoches.marca m2  on m2.idmarca = m.idmarca
inner join flotacoches.grupo g  on g.idgrupo = m2.idgrupo 
inner join flotacoches.color_coche cc on cc.idcolor = v.idcolor
inner join flotacoches.companias c on c.idcompania = v.idcompania
where fecha_baja = '4000-01-01';



