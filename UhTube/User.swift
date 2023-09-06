import Foundation

struct User {
    var name: String
    var email: String
    var password: String
}

class UserManager {
    static let shared = UserManager()
    private init() {}

    func saveUser(_ user: User) {
        UserDefaults.standard.set(user.name, forKey: "name")
        UserDefaults.standard.set(user.email, forKey: "email")
        UserDefaults.standard.set(user.password, forKey: "password")
    }

    func getUser() -> User? {
        guard
            let name = UserDefaults.standard.string(forKey: "name"),
            let email = UserDefaults.standard.string(forKey: "email"),
            let password = UserDefaults.standard.string(forKey: "password")
        else {
            return nil
        }
        return User(name: name, email: email, password: password)
    }

    func deleteUser() {
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "password")
    }
}
