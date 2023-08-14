//
//  SchoolController.swift
//  NYC-Schools_SAT_Scores
//
//  Created by Randall_B on 8/12/23.
//

import UIKit

class SchoolController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SchoolDetailCell.self, forCellReuseIdentifier: SchoolDetailCell.identifier)
        return tableView
    }()
    
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
    
    let url = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    
    private var schools = [School]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        title = "NY City Schools - SAT"
        navigationController?.navigationBar.prefersLargeTitles = true
        confugureSearchBar()
    
        SchoolService().fetchSchools(URL: url) { result in
            self.schools = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func confugureSearchBar() {
        searchBar.placeholder = "Search School Name"
        searchBar.autocapitalizationType = .none
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
    }
    
}

extension SchoolController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SchoolDetailCell.identifier, for: indexPath) as? SchoolDetailCell else {
            fatalError("Error dequeuing reusable cell")
        }
        let school = schools[indexPath.row]
        cell.schoolNameLabel.text = school.schoolName
        cell.backgroundColor = .systemMint
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let school = schools[indexPath.row]
        let schoolInfoVC = SchoolMaster(score: school)
        navigationController?.pushViewController(schoolInfoVC, animated: true)
    }
}

extension SchoolController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            SchoolService().fetchSchools(URL: url) { result in
                self.schools = result
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            return
        }
        
        schools = schools.filter({ $0.schoolName.lowercased().contains(searchText.lowercased())
        })
        self.tableView.reloadData()
    }
}
