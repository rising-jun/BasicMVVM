//
//  ViewController.swift
//  MvvmBasic
//
//  Created by 김동준 on 2021/10/09.
//

import UIKit
import RxSwift
import RxCocoa

final class CountViewController: BaseViewController {

    lazy var v = CountView(frame: view.frame)
    var viewModel: CountViewModelType!
    var disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        view = v
        self.viewModel = CountViewModel()
        self.bind(viewModel: self.viewModel)
        
    }
    
    private func bind(viewModel: CountViewModelType){
        
        self.viewModel.val
              .drive(v.countLabel.rx.text)
              .disposed(by: self.disposeBag)
            
        v.plusBtn.rx.tap
            .map{CountAction.plusBtn}
            .bind(to: viewModel.action)
            .disposed(by: self.disposeBag)
    
        v.minusBtn.rx.tap
            .map{CountAction.minusBtn}
            .bind(to: viewModel.action)
            .disposed(by: self.disposeBag)
        
    }
    
}

