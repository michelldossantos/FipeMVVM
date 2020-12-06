//
//  YearModelViewController.swift
//  FipeMVVM
//
//  Created by Michel dos Santos on 06/12/20.
//

import UIKit

class YearModelViewController: UIViewController {
    
    @IBOutlet var tableViewYearModel: UITableView!

    var viewModel = YearModelViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewYearModel.delegate = self
        tableViewYearModel.dataSource = self
        
        
        viewModel.getYearModel { sucess in
            self.tableViewYearModel.reloadData()
        }
    }

}


extension YearModelViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let screenAddMovie = UIStoryboard(name: "YearModel", bundle: nil).instantiateInitialViewController() as? YearModelViewController{
//
//                    navigationController?.pushViewController(screenAddMovie, animated: true)
//            YearModelViewModel.idBrand = ModelViewModel.id
//            YearModelViewModel.idModel = viewModel.getIdModel(index: indexPath.row)
//
//                }
//    }
}

extension YearModelViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.getArrayYearModel().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = viewModel.getYear(index: indexPath.row)
        
        return cell
    }

}
