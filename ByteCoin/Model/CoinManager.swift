
import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(_ currency: String, _ price: String)
    func didFailWithError(error: Error)
}


struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "F2061192-271A-4270-AD90-90587C57B391"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    var selectCurrency: String = "AUD"
    var currencyRate: Double = 0.00
    var delegate: CoinManagerDelegate?
    
    mutating func getCoinPrice(for currency: String) {
        selectCurrency = currency
    }
    
    
    func performRequest(with urlString: String) {
            if let url = URL(string: urlString) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    if let safeData = data {
                        
                        if error != nil {
                                                                    self.delegate?.didFailWithError(error: error!)
                                                                    return
                                                                }
                                                                if let safeData = data {
                                                                    if let coin = self.parseJSON(safeData) {
                                                                        self.delegate?.didUpdateCoin(selectCurrency, String(format: "%.2f", coin))
                                                                    }
                                                                }
                        
                    }
                }
                task.resume()
            }
        }
    func getCurrency() {
        let getCurrencyURL = "\(baseURL)/\(selectCurrency)?apikey=\(apiKey)"
    
        performRequest(with: getCurrencyURL)
    }
    
    func parseJSON(_ data: Data) -> Double? {
         let decode = JSONDecoder()
         do {
             let decodeData = try decode.decode(CoinData.self, from: data)
             return decodeData.rate
         } catch {
             return nil
         }
         
     }
     
}
