
import Foundation

class Model{
    var name:String!
    var isChecked:Bool!
    var longitude:String!
    var latitude:String!
    var description:String!
    init(name:String,isChecked:Bool,longitude:String,latitude:String,description:String) {
        self.name = name
        self.isChecked = isChecked
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
    }
}
