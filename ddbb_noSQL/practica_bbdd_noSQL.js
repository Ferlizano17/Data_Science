// Ver estructura de los documentos:
db.Airbnb.find()
db.Airbnb.find().count()

// 1. Agregar una línea con un nuevo lugar en Manhattan, primero se ordena para no repetir ID, se inserta uno menor:

db.Airbnb.find().sort({id: 1})

db.Airbnb.insertOne({
    "id": 1001056,
    "NAME": "Best place in the City",
    "host id": 1487835973,
    "host_identity_verified": "verified",
    "host name": "Fernanda",
    "neighbourhood group": "Manhattan",
    "neighbourhood": "East Village",
    "lat": 40.7224,
    "long": -73.983,
    "country": "United States",
    "country code": "US",
    "instant_bookable": true,
    "cancellation_policy": "moderate",
    "room type": "Entire home/apt",
    "Construction year": 2007,
    "price": "$725 ",
    "service fee": "$193 ",
    "minimum nights": 2,
    "number of reviews": 1,
    "last review": "11/07/2022",
    "reviews per month": 0.01,
    "review rate number": 5,
    "calculated host listings count": 1,
    "availability 365": 286,
    "house_rules": "No smoking. Parties until 23:00. Pets allowed"
})

// En caso de que quiera borrar el documento insertado anteriormente:
db.Airbnb.deleteOne({id: 1001056})

// 2. Algunos lugares tienen en blanco el campo de reglas de la casa, por lo que vamos a actualizar esos documentos para indicar que 
// no hay reglas definidas para esos lugares:

db.Airbnb.updateMany(
    {"house_rules": {$exists: false}},
    {$set: {"house_rules": "No Rules"}}
)

// 3. Cuantos lugares de hospedaje hay en Manhattan?:

db.Airbnb.find({"neighbourhood group": "Manhattan"}).count()

// 4. Cuántos y cuáles alojamientos en Manhattan son "alojamiento entero", tienen reserva inmediata, 
//con review rate de 5 (mínimo 100 reviews para aumentar la confianza en el rate) permiten reservar una sola noche?

db.Airbnb.find(
    {
    "neighbourhood group": "Manhattan", 
    "instant_bookable": true, 
    "room type": "Entire home/apt", 
    "minimum nights": {$eq:1}, 
    "review rate number": {$eq:5},
    "number of reviews": {$gt:100}
    },
    {
        "_id":0, "id":1, "NAME":1, "neighbourhood group":1,
        "instant_bookable":1, "room type":1, "price":1,
        "number of reviews":1, "review rate number":1
    })

// 5. Cuál es el review rate promedio de las habitaciones privadas en Brooklyn y cual es en Manhattan?
db.Airbnb.aggregate([
    {$match: {"neighbourhood group":"Brooklyn"}},
    {$group: { _id: "$Promedio", PromBrooklyn: {$avg: "$review rate number"}}}
    ])
db.Airbnb.aggregate([
    {$match: {"neighbourhood group":"Manhattan"}},
    {$group: { _id: "$Promedio", PromManhattan: {$avg: "$review rate number"}}}
    ])
    
// 6.	Cuales son los 5 alojamientos en Brooklyn con mayor cantidad de reviews? ¿Cuál es el costo y el review rate de cada uno?

db.Airbnb.aggregate([
    {$match: {"neighbourhood group": "Brooklyn"}},
    {$project:
        {"_id":0, "NAME":1, "number of reviews":1, "review rate number":1, "price":1}},
    {$sort:
        {"number of reviews": -1}},
    {$limit: 5}
])

// 7. Vamos a ver cuales son los alojamientos más antiguos, la ubicación y costo de los mismos:




// 7. Crear un nuevo campo llamado Precio con los datos de “price" optimizados (sin signo de dolar y sin espacio al final) y convertidos a Integer:

db.Airbnb.updateMany({},
    [{$set: 
        {Precio: 
                {$convert: {
                    input: {$trim: {
                        input: {$substrBytes: ["$price", 1, 5]}}}, 
                to: "int", onError: null}}
    }}])

// Por si quisiera borrar el campo nuevo:

db.Airbnb.updateMany({}, {$unset: {"Precio": ""}})


// 8. Calculamos la cantidad de alojamientos y el promedio del costo de los mismos según el vecindario:

db.Airbnb.aggregate ([
    {$bucket: {
          groupBy: "$neighbourhood group",
          boundaries: ["Bronx", "Brooklyn", "Manhattan", "Queens", "Staten Island"],
          default: "Z_Other",
          output: {
            "Total": {$sum: 1},
            "Prom_Precio" : {$avg: "$Precio"}
          }
        }
}])

// 9. Cantidad de alojamientos y promedio del costo por vecindario, solo para alojamientos enteros:

db.Airbnb.aggregate ([
    {$match: {"room type": "Entire home/apt"}},
    {$bucket: {
          groupBy: "$neighbourhood group",
          boundaries: ["Bronx", "Brooklyn", "Manhattan", "Queens", "Staten Island"],
          default: "Z_Other",
          output: {
            "Total": {$sum: 1},
            "Prom_Precio" : {$avg: "$Precio"}
          }
        }
}])

// 10. Vamos a enfocarnos en Manhattan y calcular el precio promedio por tipo de habitación

db.Airbnb.aggregate ([
    {$match: {"neighbourhood group": "Manhattan"}},
    {$bucket: {
          groupBy: "$room type",
          boundaries: ["Entire home/apt", "Hotel room", "Private room", "Shared room"],
          default: "Z_Other",
          output: {
            "Total": {$sum: 1},
            "Prom_Precio" : {$avg: "$Precio"}
          }
        }
}])

// 11. Siendo las habitaciones de hotel las más costosas (en promedio), veremos la lista de los 10 hoteles más costosos y su ubicación:

db.Airbnb.aggregate([
    {$match: {"room type": "Hotel room"}},
    {$project: {_id:0, "NAME": 1, "Precio": 1, "neighbourhood group": 1, "neighbourhood": 1}},
    {$sort: {"Precio": -1}},
    {$limit: 10}
])

// 12. Finalmente haremos un ejercicio para estimar el costo aproximado de hospedarnos 4 noches en Manhattan, específicamente en la zona de SoHo, 
// en alojamientos con un precio cercano al promedio, pero además con review rate de 5 (en más de 30 reviews), 
// que tengan hosts con identidad verificada y políticas de cancelación flexible:

db.Airbnb.aggregate([
    {$match: {"neighbourhood": "SoHo", "minimum nights": {$lte: 4}, "review rate number": {$eq: 5}, "number of reviews": {$gt: 30},
             "host_identity_verified": "verified", "cancellation_policy": "flexible", "Precio": {$lt: 524}
    }},
    {$project: {_id: 0, NAME: 1, "neighbourhood": 1, "review rate number": 1, "price": 1, "room type": 1, 
        "Costo_Total": {$multiply: ["$Precio", 4]}}
    }
])




