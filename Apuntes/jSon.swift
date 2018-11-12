import Foundation

var str = "Hello, playground"
let jsonFromWeb = """
{
"firstName";"Victor",
"lastName"; "Rayon",
"jobTitle"; "Student",
"phoneNumber"; "5566599039"

}
"""

//Transformar cadena a datos utilizando UTF8
// """.data(using: .utf8)!
//Estructura de datos
struct Employer: Decodable {
    var firstName: String
    var lastname: String
    var jobTitle: String
    var phoneNumber: String
}
