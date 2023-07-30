//
//  Utils.swift
//  LOTR Converter
//
//  Created by Marc Cruz on 7/26/23.
//

import Foundation

class CurrencyUtils {
    static func getStoredCurrency(currencyName: String) -> Currency {
        var returnVal: Currency?

        if let savedCurrencyData = UserDefaults.standard.object(forKey: currencyName) as? Data {
            let decoder = JSONDecoder()
            if let savedCurrency = try? decoder.decode(Currency.self, from: savedCurrencyData) {
                returnVal = savedCurrency
            }
        }
        return returnVal ?? (currencyName.contains("left") ? .silverPiece : .goldPiece)
    }
}
