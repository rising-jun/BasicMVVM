//
//  CountView.swift
//  MvvmBasic
//
//  Created by 김동준 on 2021/10/09.
//

import Foundation
import UIKit
import SnapKit

class CountView: BaseView{
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    lazy var plusBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("+", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }()
    
    lazy var minusBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }()
    
    
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        addSubViews(countLabel, plusBtn, minusBtn)
        
        countLabel.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.width.height.equalTo(30)
        }
        
        plusBtn.snp.makeConstraints { make in
            make.leading.equalTo(countLabel.snp.trailing).offset(50)
            make.centerY.equalTo(self)
            make.width.height.equalTo(40)
        }
        
        minusBtn.snp.makeConstraints { make in
            make.trailing.equalTo(countLabel.snp.leading).offset(-50)
            make.centerY.equalTo(self)
            make.width.height.equalTo(40)
        }
        
    }
    
}
