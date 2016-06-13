//
//  InterfaceController.swift
//  PizzaWatch WatchKit Extension
//
//  Created by Eliseo Fuentes on 6/12/16.
//  Copyright © 2016 Eliseo Fuentes. All rights reserved.
//

import WatchKit
import Foundation


class queso: WKInterfaceController {

    @IBOutlet var tabla: WKInterfaceTable!
    let tamanios = ["mozarela", "cheddar", "parmesano", "sin queso"]
    var arreglo = ["","","",""]
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        arreglo = context as! Array

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
        arreglo[2]=tamanios[rowIndex]
        self.pushControllerWithName("ingredientes", context: arreglo)
    }
}
