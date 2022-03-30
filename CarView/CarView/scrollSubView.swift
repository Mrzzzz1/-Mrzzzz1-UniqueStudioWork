//
//  scrollSubView.swift
//  CarView
//
//  Created by 张金涛 on 2022/3/29.
//

import UIKit
protocol ScollSubViewDegegate{
    func showTableview(tag:Int)
}
class ScollSubView:UIView{
    var Name:[String]=[" ","宝马","法拉利","奔驰","兰博基尼","奥迪"]
      
    var delegate:ScollSubViewDegegate?=nil
    var startLocation=CGPoint()
    var touchDown=false
    var imageview=UIImageView()
    var name:String?
    var label=UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configView(tag:Int){
        imageview.image=UIImage(named: "\(tag).jpeg")
        label.text=Name[tag]
        self.tag=tag
        setUp()
    }
    func setUp(){
       // let button=UIButton(frame: self.frame)
//        self.addSubview(button)
//        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        //button.backgroundColor = .blue
        self.addSubview(imageview)
        imageview.translatesAutoresizingMaskIntoConstraints=false
        imageview.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
        imageview.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive=true
        imageview.widthAnchor.constraint(equalTo: self.widthAnchor).isActive=true
        print(self.heightAnchor)
        imageview.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive=true
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints=false
        label.topAnchor.constraint(equalTo: imageview.bottomAnchor).isActive=true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40).isActive=true
        label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive=true
        label.textColor = .black
        
        label.font=UIFont.boldSystemFont(ofSize: 20)
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(2)
//        delegate?.showTableview(tag: tag)
//        }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.delegate?.showTableview(tag: self.tag)
        
    }

//    @objc func click() {
//        delegate?.showTableview(tag: tag)
//    }
    
   
}
