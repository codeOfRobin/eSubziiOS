

import Foundation

//let APIPageSize = 20
//let botChannelId = 14

struct API {
    struct Static {
        static let apiProtocol = "http://"
        static let baseURL = "localhost"
        //        static let baseURL = "169.254.223.134"
        static let portNumber = "3000"
        static let api = "api"
        static let login = "login"
        static let discounts = "discounts"
        static let get = "get"
    }
    var fullUrl:String
    {
        return Static.apiProtocol + Static.baseURL + ":" + Static.portNumber
    }
    
    var loginURL:String
    {
        return ([fullUrl,Static.api,Static.login]).joinWithSeparator("/")
    }
    var getAllNotificationsURL:String
    {
        return ([fullUrl,Static.api,Static.discounts,Static.get]).joinWithSeparator("/")
    }
}