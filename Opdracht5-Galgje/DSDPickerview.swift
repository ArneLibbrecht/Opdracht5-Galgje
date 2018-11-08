//
//  DSDPickerview.swift
//  Opdracht5-Galgje
//
//  Created by student on 08/11/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import UIKit
class DSDPickerview : NSObject,UIPickerViewDelegate,UIPickerViewDataSource {
    let values=["-","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerView.tag
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return values[row]
    }
    
}
