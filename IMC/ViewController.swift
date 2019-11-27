//
//  ViewController.swift
//  IMC
//
//  Created by Catia Miranda de Souza on 27/11/19.
//  Copyright © 2019 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var lbResultado: UILabel!
    @IBOutlet weak var ivImageResult: UIImageView!
    @IBOutlet weak var viewResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


    @IBAction func btCalcular(_ sender: Any) {
        //Converte o peso que vem como string para Double
        if let peso =  Double(tfPeso.text!), let altura = Double(tfAltura.text!){
            imc = peso / (altura*altura)
            showResults()
        }
    }
    func showResults(){
        var resultado: String = ""
        var image: String = ""
        
        switch imc {
            case 0 ..< 16:
                resultado = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                resultado = "Abaixo do peso"
                image = "abaixo"
            case 18,5 ..< 25:
                resultado = "Peso ideal"
                image = "ideal"
            case 25..<30:
                resultado = "Sobrepeso"
                image = "sobrepeso"
            default:
                resultado = "Obesidade"
                image = "obesidade"
        }
      
        lbResultado.text! = "\(Int(imc)): \(resultado)"
        ivImageResult.image = UIImage(named: image)
        viewResult.isHidden = false
        view.endEditing(true) // ESCONDER TECLADO
    }
}

