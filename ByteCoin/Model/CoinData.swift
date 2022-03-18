//
//  CoinData.swift
//  ByteCoin
//
//  Created by Gabriel Aragao on 18/03/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let rate: Double
    let time: String
    let asset_id_quote: String
    let asset_id_base: String
    
    
}
