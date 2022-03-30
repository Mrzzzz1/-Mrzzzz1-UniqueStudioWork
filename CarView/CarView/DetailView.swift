//
//  DetailView.swift
//  CarView
//
//  Created by 张金涛 on 2022/3/29.
//

import UIKit
class DetailView:UIView{
    let Name:[String]=[" ","宝马","法拉利","奔驰","兰博基尼","奥迪"]
    let Text:[[String]]=[[],["x1","x2","x3","x4","x5"],["458","488","355","F40","250 GT"],["G350","C200","S560","S500","glb"],["Aventador","Huracan","Reventon","350GT","350GTV"],["A6","A7","A8","R7","RS7"]]
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var label=UILabel()
    var backButton=UIButton()
    func setUp(i:Int,j:Int){
        self.backgroundColor = .white
        self.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints=false
        backButton.topAnchor.constraint(equalTo: self.topAnchor,constant: 50).isActive=true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive=true
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive=true
        backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive=true
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints=false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive=true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive=true
        label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive=true
        label.text="这是"+Name[i]+Text[i][j]
        label.font=UIFont.boldSystemFont(ofSize: 35)
        
        
    }
    
    @objc func click() {
//        UIView.transition(with: self, duration: 1, options: .transitionCurlUp, animations: {
//
//
//        }, completion:)
        UIView.transition(with: self, duration: 0.5, options: .transitionCurlUp, animations:{
            self.alpha=0
            
        }, completion:{
            _ in self.removeFromSuperview()
        })
        
    }
}
