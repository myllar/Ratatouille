//import SQLite
//
//// Step 2: Open a Connection to the Database
//let db = try! Connection("./databaseRatatouille")
//
//// Step 3: Create a Table
//let users = Table("users")
//let id = Expression<Int>("id")
//let name = Expression<String>("name")
//
//// Create the table if it doesn't exist
//try! db.run(users.create { table in
//    table.column(id, primaryKey: true)
//    table.column(name)
//})
//
//// Step 4: Fetch Data from API
//struct User: Codable {
//    var id: Int
//    var name: String
//}
//
//// Fetch data from API
//let url = URL(string: "https://api.example.com/users")!
//URLSession.shared.dataTask(with: url) { data, response, error in
//    guard let data = data, error == nil else {
//        // Handle error
//        return
//    }
//
//    do {
//        let users = try JSONDecoder().decode([User].self, from: data)
//
//        // Step 5: Store data in SQLite database
//        for user in users {
//            let insert = users.insert(id <- user.id, name <- user.name)
//            try db.run(insert)
//        }
//
//        // Step 6: Query Data
//        for user in try! db.prepare(users) {
//            print("ID: \(user[id]), Name: \(user[name])")
//        }
//    } catch {
//        // Handle decoding error
//    }
//}.resume()
