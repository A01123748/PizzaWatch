//
//  InterfaceController.swift
//  PizzaWatch WatchKit Extension
//
//  Created by Eliseo Fuentes on 6/12/16.
//  Copyright © 2016 Eliseo Fuentes. All rights reserved.
//

import WatchKit
import Foundation


class ingredientes: WKInterfaceController {

    @IBOutlet var tabla: WKInterfaceTable!
    let tamanios = ["jamón", "pepperoni", "pavo", "salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoa",]
    var arreglo = ["","","",""]
    var counter = 0
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        arreglo = context as! Array

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        tabla.setNumberOfRows(tamanios.count, withRowType: "Celda")
        
        // Populate the table
        for index in 0..<tamanios.count {
            let row = tabla.rowControllerAtIndex(index) as! Celda
            row.active.setTitle(tamanios[index])
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
/*    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        //arreglo[3]=tamanios[rowIndex]
        //self.pushControllerWithName("resumen", context: arreglo)
    }*/
    @IBAction func clicked(value: Bool) {
        if value == true{
            counter += 1
        }
        else{
            counter -= 1
        }
    }
    @IBAction func next() {
        for index in 0..<counter {
            //let row = tabla.rowControllerAtIndex(index) as! Celda
            arreglo[3+index]=tamanios[index]
            NSLog(tamanios[index])
        }
        if(counter > 1 || counter < 6){
            self.pushControllerWithName("resumen", context: arreglo)
        }
    }
}
