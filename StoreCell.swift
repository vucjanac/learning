//
//  StoreCell.swift
//  Zadatak2.1
//
//  Created by Aleksandar Stojanovic on 10/10/21.
//

import UIKit

class StoreCell: UITableViewCell {
    
    struct Store: Codable {
        var name: String
        var city: String
        var address: String
        var zipcode: String
        var state: String
        var phone: String
    }
    
    struct Stores: Codable {
        var stores: [Store]
    }
    
    var storeLogoURL = UIImageView()
    var store = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(storeLogoURL)
        addSubview(store)
        
        configurestoreLogoURL()
        configureStoreData()
        logoConstraints()
        dataConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configurestoreLogoURL() {
        storeLogoURL.layer.cornerRadius = 3
        storeLogoURL.clipsToBounds = true
    }
    
    func configureStoreData() {
        store.numberOfLines = 0
        store.adjustsFontSizeToFitWidth = true
    }
    
    func logoConstraints() {
        storeLogoURL.translatesAutoresizingMaskIntoConstraints = false
        storeLogoURL.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        storeLogoURL.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        storeLogoURL.heightAnchor.constraint(equalToConstant: 100).isActive = true
        storeLogoURL.widthAnchor.constraint(equalTo: storeLogoURL.heightAnchor).isActive = true        
    }
    
    func dataConstraints() {
        store.translatesAutoresizingMaskIntoConstraints = false
        store.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        store.leadingAnchor.constraint(equalTo: storeLogoURL.trailingAnchor, constant: 20).isActive = true
        store.heightAnchor.constraint(equalTo: storeLogoURL.heightAnchor).isActive = true
        store.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    }
}
