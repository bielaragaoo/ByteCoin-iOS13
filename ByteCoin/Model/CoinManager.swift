
import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "F2061192-271A-4270-AD90-90587C57B391"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    var selectCurrency: String = "AUD"
    
    mutating func getCoinPrice(for currency: String) {
        selectCurrency = currency
    }
    
    
    func performRequest(with urlString: String) {
            if let url = URL(string: urlString) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    if let safeData = data {
                        var dataToString = String(data: safeData, encoding: String.Encoding.utf8) as String?
                        print(dataToString)
                        
                    }
                }
                task.resume()
            }
        }
    func getCurrency() {
        let getCurrencyURL = "\(baseURL)/\(selectCurrency)?apikey=\(apiKey)"
    
        performRequest(with: getCurrencyURL)
    }
    
}
