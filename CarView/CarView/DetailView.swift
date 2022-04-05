//
//  DetailView.swift
//  CarView
//
//  Created by 张金涛 on 2022/3/29.
//

import UIKit
class DetailView: UIView{
    let Name:[String]=[" ","宝马","法拉利","奔驰","兰博基尼","奥迪"]
    var detailLabel1=UILabel()
    var detailLabel2=UILabel()
    var detailLabel3=UILabel()
    var tag1=0;
    var tag2=0;
    let Text:[[String]]=[[],["x1","x2","x3","x4","x5"],["458","488","355","F40","250GT"],["G350","C200","S560","S500","glb"],["Aventador","Huracan","Reventon","350GT","350GTV"],["A6","A7","A8","R7","RS7"]]
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var label=UILabel()
    var backButton=UIButton()
    func setUp(i: Int,j: Int){
        tag1=i;
        tag2=j;
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
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: -200).isActive=true
        label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive=true
        label.text="这是"+Name[i]+Text[i][j]
        label.font=UIFont.boldSystemFont(ofSize: 35)
        self.addSubview(detailLabel1)
        detailLabel1.translatesAutoresizingMaskIntoConstraints=false
        detailLabel1.topAnchor.constraint(equalTo: label.bottomAnchor).isActive=true
        detailLabel1.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive=true
        detailLabel1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive=true
        detailLabel1.font=UIFont.boldSystemFont(ofSize: 35)
        self.addSubview(detailLabel2)
        detailLabel2.translatesAutoresizingMaskIntoConstraints=false
        detailLabel2.topAnchor.constraint(equalTo: detailLabel1.bottomAnchor).isActive=true
        detailLabel2.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive=true
        detailLabel2.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive=true
        detailLabel2.font=UIFont.boldSystemFont(ofSize: 35)
        self.addSubview(detailLabel3)
        detailLabel3.translatesAutoresizingMaskIntoConstraints=false
        detailLabel3.topAnchor.constraint(equalTo: detailLabel2.bottomAnchor).isActive=true
        detailLabel3.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive=true
        detailLabel3.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive=true
        detailLabel3.font=UIFont.boldSystemFont(ofSize: 35)
        ReadData()
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
    func ReadData(){
        let jsonPath=Bundle.main.path(forResource: "Data", ofType: "JSON")
        let data=NSData.init(contentsOfFile: jsonPath!)
        let jsonDic:NSDictionary=try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        let jsonDicData:NSDictionary=jsonDic.object(forKey:Name[tag1] ) as! NSDictionary
        let jsonDicData1:NSDictionary = jsonDicData.object(forKey:Text[tag1][tag2] ) as! NSDictionary
        let color=jsonDicData1.object(forKey:"颜色" ) as! NSString
        print(color)
        let price=jsonDicData1.object(forKey:"价格" ) as! NSString
        print(price)
        let consumption=jsonDicData1.object(forKey:"油耗" ) as! NSString
        print(consumption)
        detailLabel1.text="颜色:"+String(color)
        detailLabel2.text="价格:"+String(price)
        detailLabel3.text="油耗:"+String(consumption)
        
        


        
    }
}
