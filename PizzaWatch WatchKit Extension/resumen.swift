//
//  InterfaceController.swift
//  PizzaWatch WatchKit Extension
//
//  Created by Eliseo Fuentes on 6/12/16.
//  Copyright © 2016 Eliseo Fuentes. All rights reserved.
//

import WatchKit
import Foundation


class resumen: WKInterfaceController {

    @IBOutlet var tabla: WKInterfaceTable!
    var arreglo = ["","",""]
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        arreglo = context as! Array
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        tabla.setNumberOfRows(arreglo.count, withRowType: "Celda")
        
        // Populate the table
        for index in 0..<arreglo.count {
            let row = tabla.rowControllerAtIndex(index) as! Celda
            row.texto.setText(arreglo[index])
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        //let row = tabla.rowControllerAtIndex(rowcIndex) as! Celda
        //row.active. .setText(arreglo[index])
        //self.pushControllerWithName("masa", context: arreglo)
    }
}
