//
//  WeatherView.swift
//  WeatherTest
//
//  Created by Александр Марков on 24/12/2018.
//  Copyright © 2018 Александр Марков. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    
    var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 100.0
        table.separatorStyle = .singleLine
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    var loadIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        view.hidesWhenStopped = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)

        configureView()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        backgroundColor = .white
    }
    
    func addSubviews() {
        self.addSubview(tableView)
        self.addSubview(loadIndicator)
    }
    
    func makeConstraints() {
        makeTableConstraints()
        makeLoaderConstraints()
    }
    func makeTableConstraints() {
        let leftConstraint = NSLayoutConstraint(item: self.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: tableView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: 0.0)
        let rightConstraint = NSLayoutConstraint(item: self.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: tableView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: self.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: tableView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: self.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: tableView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0.0)
        
        self.addConstraint(leftConstraint)
        self.addConstraint(rightConstraint)
        self.addConstraint(bottomConstraint)
        self.addConstraint(topConstraint)
    }
    func makeLoaderConstraints() {
        let centerXConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: loadIndicator, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1.0, constant: 0.0)
        let centerYConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: loadIndicator, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: 0.0)
        
        self.addConstraint(centerXConstraint)
        self.addConstraint(centerYConstraint)
    }
}

extension WeatherView {
    func showLoadIndicator() {
        self.isUserInteractionEnabled = false
        loadIndicator.startAnimating()
    }
    func hideLoadIndicator() {
        self.isUserInteractionEnabled = true
        loadIndicator.stopAnimating()
    }
}
