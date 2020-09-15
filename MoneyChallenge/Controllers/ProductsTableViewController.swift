//
//  ProductsTableViewController.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 15/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    private var productsInfo: ProductsInfo? {
        didSet {
            setProductsInfo()
        }
    }
    @IBOutlet weak var totalPlanValueLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        getProducts()
    }
    
    // MARK: - UI
    private func setupUI() {
        navigationItem.title = "Hello \(Authenticator.shared.userName ?? "")!"
        tableView.tableFooterView = UIView()
        totalPlanValueLabel.text = ""
    }
    
    private func setProductsInfo() {
        totalPlanValueLabel.text = "Total Plan Value: " + "\(productsInfo?.totalValue ?? .zero)"
        tableView.reloadData()
    }
    
    // MARK: - Network
    private func getProducts() {
        Loader.showActivityIndicator()
        ProductsClient.shared.getInvestorProduts(completion: handleProductsResult)
    }
    
    private func handleProductsResult(_ result: Result<ProductsInfo, APIError>) {
        Loader.hideActivityIndicator()
        switch result {
        case .failure(let error):
            Utils.showAlert(for: error, in: self)
        case .success(let productsInfo):
            self.productsInfo = productsInfo
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsInfo?.products.count ?? .zero
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseId, for: indexPath)
        if let productsCell = cell as? ProductTableViewCell {
            let product = productsInfo?.products[indexPath.row]
            productsCell.configureCell(with: product)
        }
        return cell
    }
}
