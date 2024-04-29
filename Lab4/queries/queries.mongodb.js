use('musicBandsLab4');

// Вивести всі гурти:
// db.bands.find();

// Показати перші п'ять гуртів у колекції:
// db.bands.find().limit(5)

// Вивести гурти, засновані в Австралії:
// db.bands.find({ "country": "Australia" });

// Вивести гурти, засновані у 1970-х роках
// db.bands.find({ "year_formed": { $gte: 1970, $lt: 1980 } });

// Вивести гурти в порядку зростання року заснування:
// db.bands.find().sort({ "year_formed": 1 })

// Вивести найпопулярнішу пісню гурту "The Beatles":
// db.bands.find({ "name": "The Beatles" }, { "popular_song": 1, "_id": 0 })

// Вивести країну, в якій був заснований гурт "Queen":
// db.bands.findOne({ "name": "Queen" }, { "country": 1, "_id": 0 })

// Вивести кількість гуртів з кожної країни:
// db.bands.aggregate([
//    { $group: { "_id": "$country", "count": { $sum: 1 } } }
// ])

// Показати назви всіх гуртів у верхньому регістрі:
// db.bands.find({}, { "name": { $toUpper: "$name" }, "_id": 0 })

// Показати всі гурти, чиї назви складаються з двох слів:
// db.bands.find({ "name": { $regex: /^[^\s]+\s[^\s]+$/ } })

// Показати гурти, у яких наймолодші учасники мають вік менше 20 років:
// db.bands.find({ "youngest_member_age": { $lt: 20 } })

// Знайти гурти, що грають у стилі поп
// db.bands.find({ "genre": "Pop" })

// Показати назви гуртів та їхні найпопулярніші пісні:
//db.bands.find({}, { "name": 1, "popular_song": 1, "_id": 0 })

// Вивести гурти, засновані після 1963 року, назва яких починається на літеру P:
// db.bands.find({ "year_formed": { $gt: 1963 }, "name": { $regex: /^P/i } })

// Вивести останні три гурти:
// db.bands.find().sort({ "_id": -1 }).limit(3)

// Вивести гурти, рік заснування яких кратний 5:
// db.bands.find({ $expr: { $eq: [ { $mod: [ "$year_formed", 5 ] }, 0 ] } })

// Вивести гурти з найбільшим значенням поля "youngest_member_age":
// db.bands.find().sort({ "youngest_member_age": -1 }).limit(1)

// Вивести наймолодший гурт:
// db.bands.find().sort({ "year_formed": -1 }).limit(1)

// Вивести гурти з непарними ідентифікаторами:
// db.bands.find({ "_id": { $mod: [2, 1] } })

// Вивести гурти, назви яких містять принаймні одну цифру:
// db.bands.find({ "name": { $regex: /\d/ } })