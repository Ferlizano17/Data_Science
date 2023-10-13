// Insertar varios documentos

var array_items = [{ "title" : "The Pillars of Society", "artist" : "Grosz", "year" : 1926, "price" : NumberDecimal("199.99") }, { "title" : "Melancholy III", "artist" : "Munch", "year" : 1902, "price" : NumberDecimal("280.00") }, { "title" : "Dancer", "artist" : "Miro", "year" : 1925, "price" : NumberDecimal("76.04") }, { "title" : "The Great Wave off Kanagawa", "artist" : "Hokusai", "price" : NumberDecimal("167.30") }, { "title" : "The Persistence of Memory", "artist" : "Dali", "year" : 1931, "price" : NumberDecimal("483.00") }, { "title" : "Composition VII", "artist" : "Kandinsky", "year" : 1913, "price" : NumberDecimal("385.00") }, { "title" : "The Scream", "artist" : "Munch", "year" : 1893 }, { "title" : "Blue Flower", "artist" : "O'Keefe", "year" : 1918, "price" : NumberDecimal("118.42") } ]

db.arts.insertMany(array_items)
db.arts.find()

//1. Buscar Cuadros cuyo año esté por encima de 1920

// select * from ejemplo.arts where year > 1920

var queryaño= {"year": {$gt: 1920} }

db.arts.find (queryaño)

//2. Buscar Cuadros cuyo año esté por encima de 1920 Y su precio sea mayor a 200

// select * from ejemplo.arts where year > 1920 AND price > 200



//3. Buscar Cuadros cuyo año esté por encima de 1920 O su precio sea mayor a 200

// select * from ejemplo.arts where year > 1920 OR price > 200



//4. Buscar Cuadros que NO sean menores de 1925 y NO sean mayores de 1950 ($nor)

// select * from ejemplo.arts where NOT(year < 1925 AND year > 1950)



//5. Buscar Cuadros que NO ESTÉN DATADOS (no tengan el campo year)



//6. Añadir campo year igual a NULL en campos que no estén datados



//7. Ordenar por año de forma descendente

// select * from ejemplo.arts order by year DESC



//8. Limitar la salida anterior a las 3 primeras filas



//9. Sacar las filas de la cuarta a la sexta

