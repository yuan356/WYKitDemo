//
//  ViewController.swift
//  MilkShopping
//
//  Created by Will on 2022/9/5.
//

import UIKit

class DrinksViewController: UIViewController {

    @IBOutlet weak var msTableView: UITableView!
    
    var drinks: [Drink] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        msTableView.delegate = self
        msTableView.dataSource = self
        msTableView.register(UINib(nibName: "DrinkCell", bundle: nil), forCellReuseIdentifier: "DrinkCell")
        msTableView.backgroundColor = .white
        let msAPIRequest = APIService.MSAPIRequest()
        msAPIRequest.send { [weak self] result in
            switch result {
            case .success(let response):
                print(response)
                self?.drinks = response.records
                DispatchQueue.main.async {
                    self?.msTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }


}

extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell", for: indexPath) as? DrinkCell {
            cell.drink = drinks[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DrinkDetailViewController()
        vc.drink = drinks[indexPath.row]
        self.present(vc, animated: true)
    }
    
    
}
