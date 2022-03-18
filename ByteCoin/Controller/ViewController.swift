
import UIKit

    class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CoinManagerDelegate {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            coinManager.delegate = self
            
            currencyPicker.dataSource = self
            currencyPicker.delegate = self
        }
        
        func didUpdateCoin(_ currency: String, _ price: String) {
            
            DispatchQueue.main.async {

            self.currencyLabel.text = price
            
            self.bitCoinLabel.text = currency
            }}
        
        func didFailWithError(error: Error) {
            print(error)
        }
        
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
   
        coinManager.getCurrency()
            }
            
            var coinManager = CoinManager()
            
            @IBOutlet weak var bitCoinLabel: UILabel!
            @IBOutlet weak var currencyLabel: UILabel!
            @IBOutlet weak var currencyPicker: UIPickerView!
            
            }


