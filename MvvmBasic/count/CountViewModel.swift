//
//  ViewModel.swift
//  MvvmBasic
//
//  Created by 김동준 on 2021/10/09.
//

import Foundation
import RxSwift
import RxCocoa

protocol CountViewModelType {
  var action: PublishRelay<CountAction> { get }
  var val: Driver<String> { get }
}

struct State {
  var number: Int
}

final class CountViewModel: CountViewModelType {
    var action = PublishRelay<CountAction>()
    
    var val: Driver<String>
    
    private let state = BehaviorRelay<State>(value: .init(number: 0))
    private let disposeBag = DisposeBag()
    
    init() {
     
        self.action.filter{$0 == .plusBtn}
            .withLatestFrom(state)
            .map{ state in
            var newState = state
            newState.number += 1
            return newState
        }.bind(to: self.state)
        .disposed(by: disposeBag)
        
        self.action.filter{$0 == .minusBtn}
            .withLatestFrom(state)
            .map{ state in
            var newState = state
            newState.number -= 1
            return newState
        }.bind(to: self.state)
        .disposed(by: disposeBag)
        
        self.val = self.state
            .map{ "\($0.number)" }
            .asDriver(onErrorRecover:  { _ in .empty() })
        
    }
}

enum CountAction{
    case plusBtn
    case minusBtn
}
