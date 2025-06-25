//
//  ViewController.swift
//  Heroes-iOS
//
//  Created by Tardes on 24/6/25.
//

import UIKit

class ViewController: UIViewController {
    
    var superheroList: [Superhero]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        Task{
            superheroList  =  await SuperHeroProvider.findSuperheroesByName(query: "Super")
            print(superheroList.description)
            
        }
    }


}

