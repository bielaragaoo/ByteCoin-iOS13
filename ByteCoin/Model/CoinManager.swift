

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "F2061192-271A-4270-AD90-90587C57B391"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    var selectCurrency: String = "AUD"
    
    mutating func getCoinPrice(for currency: String) {
        selectCurrency = currency
    }
    
}
