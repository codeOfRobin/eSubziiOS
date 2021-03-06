

import Foundation

//let APIPageSize = 20
//let botChannelId = 14

struct API {
    struct Static {
        static let apiProtocol = "http://"
//        static let baseURL = "128.199.152.41"
        static let baseURL = "localhost"
        static let portNumber = "3000"
        static let api = "api"
        static let login = "login"
        static let discounts = "discounts"
        static let get = "get"
        static let signup = "signup"
        static let products = "products"
        static let placeOrder = "placeOrder"
        static let fetchOrder = "findOrders"
        static let findOrdersNotDelivered = "findOrdersNotDelivered"
    }
    var fullUrl:String
    {
        return Static.apiProtocol + Static.baseURL + ":" + Static.portNumber
//        return Static.apiProtocol + Static.baseURL
    }
    
    var loginURL:String
    {
        return ([fullUrl,Static.api,Static.login]).joinWithSeparator("/")
    }
    
    var signupURL:String
    {
        return ([fullUrl,Static.api,Static.signup]).joinWithSeparator("/")
    }
    var getAllNotificationsURL:String
    {
        return ([fullUrl,Static.api,Static.discounts,Static.get]).joinWithSeparator("/")
    }
    var getAllProductsURL:String
    {
        return([fullUrl,Static.api,Static.products,Static.get]).joinWithSeparator("/")
    }
    
    var placeOrderURL: String
    {
        return([fullUrl,Static.api,Static.placeOrder]).joinWithSeparator("/")
    }
    
    var fetchOrdersURL: String
    {
        return([fullUrl,Static.api,Static.fetchOrder]).joinWithSeparator("/")
    }
    
    var fetchLatestOrdersURL: String
    {
        return([fullUrl,Static.api,Static.findOrdersNotDelivered]).joinWithSeparator("/")
    }
    
}