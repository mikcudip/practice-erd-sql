-- 1. Playlists
-- Desde el departamento de marketing quieren conocer todos los datos de la tabla de
-- canciones que se encuentren en al menos 5 playlists.
SELECT C.id, C.nombre, C.compositor, COUNT(CP.id_playlist) FROM canciones AS C JOIN canciones_de_playlists AS CP ON C.id = CP.id_cancion GROUP BY C.id HAVING COUNT(CP.id_playlist)>=5;

-- 2. Facturas
-- En el departamento de Finanzas necesitan incluir dentro de la tabla de Facturas un
-- total de facturas que sume la columna total.
-- Este valor se debe repetir en todas las filas de la tabla.
SELECT SUM(F.precio_unitario * F.cantidad)  AS total_general
FROM facturas AS F;


-- 3. Clientes VIP
-- En el departamento de Marketing de Musimundos quieren entender cómo se
-- comportan los clientes.
-- Es por esto que nos solicitan agregar dentro de la tabla de clientes, una columna que
-- cuente el total de facturas emitidas para cada uno de los clientes.
SELECT C.*, COUNT(F.id) FROM clientes AS C JOIN facturas AS F ON C.id=F.id_cliente GROUP BY C.id;

-- 4. Facturas
-- En el departamento de Finanzas necesitan incluir dentro de la tabla de Facturas un
-- total de facturas que sume los pedidos de un cliente en total.
SELECT F.*, SUM(CF.precio_unitario*CF.cantidad) FROM facturas AS F JOIN items_de_facturas AS CF ON F.id=CF.id_factura GROUP BY F.id;
