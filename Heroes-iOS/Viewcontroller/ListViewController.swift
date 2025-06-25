//
//  ViewController.swift
//  Heroes-iOS
//
//  Created by Tardes on 24/6/25.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    var superheroList: [Superhero]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
            
            let searchController = UISearchController(searchResultsController: nil)
            searchController.searchBar.delegate = self
            self navigationItem.searchController = searchController
        
        
         
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    
    searchSuperheroByName(query)
}
    
    
    func searchSuperheroByName(_ query: String) {
        loadingView.isHidden = false
        Task{
            superheroList  =  await SuperHeroProvider.findSuperheroesByName(query: query)
           DispatchQueue.main.async{
               self.loadingView.isHidden = true
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        detailViewController.superheroes = superheroList[indexPath.Row]
        table.deselectRow(at: indexPath, animated: true)
    }
}

