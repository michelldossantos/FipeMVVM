//
//  ViewController.swift
//  FipeMVVM
//
//  Created by Michel dos Santos on 30/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableViewBrand: UITableView!
    
    var viewModel = BrandViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewBrand.delegate = self
        tableViewBrand.dataSource = self
        
        viewModel.getBrand { sucess in
            if sucess{
                
                self.tableViewBrand.reloadData()
            }
        }
    }

}

extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.arrayBrand.count)
        return viewModel.getArrayBrand().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = viewModel.getNameBrand(index: indexPath.row)
        
        return cell
    }

}


