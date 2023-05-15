//
//  HomeViewModel.swift
//  Volleyball
//
//  Created by Bruno Marques on 13/05/23.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

protocol HomeViewModelProtocol {
    var leftScore: Observable<ScoreModel> { get }
    var rightScore: Observable<ScoreModel> { get }
    func incrementLeftScore()
    func incrementRightScore()
}

class HomeViewModel: HomeViewModelProtocol {
    
    private let leftTeamScore = BehaviorRelay<ScoreModel>(value: ScoreModel(leftTeamPoints: 0, rightTeamPoints: 0))
    private let rightTeamScore = BehaviorRelay<ScoreModel>(value: ScoreModel(leftTeamPoints: 0, rightTeamPoints: 0))
    private let disposeBag = DisposeBag()
    
    var leftScore: Observable<ScoreModel> {
        return leftTeamScore.asObservable()
    }
    
    var rightScore: Observable<ScoreModel> {
        return rightTeamScore.asObservable()
    }
    
    func incrementLeftScore() {
        
        var currentScore = leftTeamScore.value
        currentScore.leftTeamPoints += 1
        leftTeamScore.accept(currentScore)
    }
    
    func incrementRightScore() {
        var currentScore = rightTeamScore.value
        currentScore.rightTeamPoints += 1
        rightTeamScore.accept(currentScore)
    }
}
