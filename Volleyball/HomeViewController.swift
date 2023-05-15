//
//  ViewController.swift
//  Volleyball
//
//  Created by Bruno Marques on 12/05/23.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class HomeViewController: UIViewController {
    
    private lazy var homeView: HomeView = makeHomeView()
    private var viewModel: HomeViewModelProtocol
    private var disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = homeView
        setupBindings()
        configureButtons()
    }
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureButtons() {
        let tapGestureLeftContainerMarker = UITapGestureRecognizer(target: self, action: #selector(tapLeftContainerMarker))
        homeView.leftContainerMarker.addGestureRecognizer(tapGestureLeftContainerMarker)
        
        let tapGestureRightContainerMarker = UITapGestureRecognizer(target: self, action: #selector(tapRightContainerMarker))
        homeView.rightContainerMarker.addGestureRecognizer(tapGestureRightContainerMarker)
    }
    
    private func setupBindings() {
        viewModel.leftScore
            .map {String(format: "%02d", $0.leftTeamPoints)}
            .bind(to: homeView.leftCounter.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.rightScore
            .map {String(format: "%02d", $0.rightTeamPoints)}
            .bind(to: homeView.rightCounter.rx.text)
            .disposed(by: disposeBag)
    }
    
    // MARK: - Actions
    
    @objc private func tapLeftContainerMarker() {
        viewModel.incrementLeftScore()
    }
    
    @objc private func tapRightContainerMarker() {
        viewModel.incrementRightScore()
    }
    
    // MARK: - Make views
    
    private func makeHomeView() -> HomeView {
        let view = HomeView()
        return view
    }


}

