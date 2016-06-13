//
//  InterfaceController.swift
//  PizzaWatch WatchKit Extension
//
//  Created by Eliseo Fuentes on 6/12/16.
//  Copyright © 2016 Eliseo Fuentes. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var tabla: WKInterfaceTable!
    let tamanios = ["Chica","Mediana","Grande"]
    var arreglo = ["","","",""]
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        tabla.setNumberOfRows(tamanios.count, withRowType: "Celda")
        
        // Populate the table
        for index in 0..<tamanios.count {
            let row = tabla.rowControllerAtIndex(index) as! Celda
            row.texto.setText(tamanios[index])
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        arreglo[0]=tamanios[rowIndex]
        self.pushControllerWithName("masa", context: arreglo)
    }
}
