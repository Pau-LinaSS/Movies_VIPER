//
//  ListOfMoviesViewController.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 21/06/23.
//  
//

import UIKit

class ListOfMoviesViewController: UIViewController {
    var presenter: ListOfMoviesPresenterProtocol?
    
    @IBOutlet weak var tableListMovie: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
        presenter?.onViewAppear()
    }
}

extension ListOfMoviesViewController {
    private func setupTableView() {
        tableListMovie.estimatedRowHeight = 120
        tableListMovie.rowHeight = UITableView.automaticDimension
        tableListMovie.register(MovieCellView.self, forCellReuseIdentifier: "MovieCellView")
        
        tableListMovie.dataSource = self
        tableListMovie.delegate = self
    }
}

extension ListOfMoviesViewController: ListOfMoviesViewProtocol {
    
    func update(movies: [MovieViewModel]) {
        print("Data: \(movies)")
        
        DispatchQueue.main.async {
            self.tableListMovie.reloadData()
        }
    }
    
}

extension ListOfMoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
        
        let model = presenter?.viewModel?[indexPath.row]
        
        cell.configure(model: model!)
        
        return cell
    }
}

extension ListOfMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onTapCell(atIndex: indexPath.row)
    }
}

