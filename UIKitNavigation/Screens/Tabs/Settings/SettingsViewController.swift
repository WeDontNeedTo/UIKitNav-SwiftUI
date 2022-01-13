//
//  SettingsViewController.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import Foundation
import UIKit



class SettingsViewController: UIViewController {
    
    private struct SettingRowModel {
        let icon: String
        let title: String
    }
    
    private struct SectionModel {
        var title: String
        var rows: [SettingRowModel]
    }
    
    private let rowsArray = [
        SectionModel(
            title: "",
            rows: [
                SettingRowModel(icon: "bell_icon", title: "My Order"),
            ]
        ),
        
        SectionModel(
            title:  "MANAGEMENT",
            rows: [
                SettingRowModel(icon: "bell_icon", title: "Notifications"),
                SettingRowModel(icon: "edit_icon", title: "My Information"),
                SettingRowModel(icon: "card_icon", title: "Payment")
            ]
        ),
        
        SectionModel(
            title: "SUPPORT",
            rows: [
                SettingRowModel(icon: "bell_icon", title: "Help"),
                SettingRowModel(icon: "edit_icon", title: "Support"),
            ]
        )
    ]
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.register(SettingsRow.self, forCellReuseIdentifier: SettingsRow.cellId)
        tv.tableHeaderView = SettingsHeader(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width/2 + 25))
        tv.showsVerticalScrollIndicator = false
        tv.showsHorizontalScrollIndicator = false 
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
    }
    
    override func loadView() {
        super.loadView()
        createSettingsTable()
    }
    
    
    private func createSettingsTable() {
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10))
        }
    }
}



// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsArray[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = self.rowsArray[indexPath.section]
        let headline = section.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsRow.cellId, for: indexPath) as! SettingsRow
        cell.selectionStyle = .none
        cell.configure(with: headline.icon, and: headline.title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return rowsArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = rowsArray[section]
        return section.title
    }
}

