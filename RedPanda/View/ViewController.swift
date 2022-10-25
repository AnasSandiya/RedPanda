//
//  ViewController.swift
//  RedPanda
//
//  Created by Muhammad Anas on 25/10/22.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var dataViewModel = DataViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
    
    func initViewModel(){
        dataViewModel.reloadTableView = {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
        dataViewModel.showError = {
            DispatchQueue.main.async { self.showAlert("Ups, something went wrong.") }
        }
        dataViewModel.showLoading = {
            DispatchQueue.main.async { self.activityIndicator.startAnimating() }
        }
        dataViewModel.hideLoading = {
            DispatchQueue.main.async { self.activityIndicator.stopAnimating() }
        }
        dataViewModel.getData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataViewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? CustomTableViewCell else {
            fatalError("Cell not exists in storyboard")
        }
        let cellVM = dataViewModel.getCellViewModel( at: indexPath )
        
        cell.productTitle.text = cellVM.productTitle
        cell.productPrice.text = "$ \(cellVM.productPrice.description)"
        cell.productDesc.text = cellVM.productDesc
        
        
        
        
        //cell.lblTitle.text = cellVM.titleText
      //  cell.lblSubTitle.text = cellVM.subTitleText
        return cell
    }
}

