//
//  ViewController.swift
//  TestAsyncCodeExample
//
//  Created by Yiyin Shen on 21/5/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var viewModel: ExampleViewModel = ExampleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        viewModel.fetchBookList { [weak self] (_) in
            self?.tableView.reloadData()
        }
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfBooks
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text = viewModel.book(at: indexPath.row)
        return cell
    }


}

