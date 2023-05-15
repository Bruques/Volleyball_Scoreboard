//
//  HomeView.swift
//  Volleyball
//
//  Created by Bruno Marques on 12/05/23.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    lazy var leftContainerMarker: UIView = makeLeftContainerMarker()
    lazy var leftCounter: UILabel = makeLeftCounter()
    
    
    lazy var rightContainerMarker: UIView = makeRightContainerMarker()
    lazy var rightCounter: UILabel = makeRightCounter()
    
    
    
    // MARK: - Life cycle
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .darkGray
        addSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure view
    
    private func addSubviews() {
        addSubview(leftContainerMarker)
        leftContainerMarker.addSubview(leftCounter)
        
        
        addSubview(rightContainerMarker)
        rightContainerMarker.addSubview(rightCounter)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            leftContainerMarker.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            leftContainerMarker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            leftContainerMarker.heightAnchor.constraint(equalToConstant: 130),
            leftContainerMarker.widthAnchor.constraint(equalToConstant: 130),
            
            leftCounter.centerXAnchor.constraint(equalTo: leftContainerMarker.centerXAnchor),
            leftCounter.centerYAnchor.constraint(equalTo: leftContainerMarker.centerYAnchor),
            
            rightContainerMarker.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            rightContainerMarker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            rightContainerMarker.heightAnchor.constraint(equalToConstant: 130),
            rightContainerMarker.widthAnchor.constraint(equalToConstant: 130),
            
            rightCounter.centerXAnchor.constraint(equalTo: rightContainerMarker.centerXAnchor),
            rightCounter.centerYAnchor.constraint(equalTo: rightContainerMarker.centerYAnchor)
            
            
        ])
        
    }
    
    // MARK: - Make views
    
    private func makeLeftContainerMarker() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        return view
    }
    
    private func makeLeftCounter() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00"
        label.font = label.font.withSize(65)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }
    
    private func makeRightContainerMarker() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 10
        return view
    }
    
    private func makeRightCounter() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00"
        label.font = label.font.withSize(65)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }
}
