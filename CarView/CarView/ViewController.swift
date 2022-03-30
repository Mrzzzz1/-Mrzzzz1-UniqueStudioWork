//
//  ViewController.swift
//  CarView
//
//  Created by 张金涛 on 2022/3/29.
//

import UIKit

class ViewController: UIViewController,ScollSubViewDegegate,SecondViewDelegate, UIScrollViewDelegate {
    func showTableview(tag: Int) {
        let secondView=SecondView(frame: self.view.frame)
        secondView.delegate=self
        UIView.transition(with: self.view, duration: 0.5, options: .transitionFlipFromLeft, animations:{
             self.view.addSubview(secondView)
        }, completion:nil)
        self.view.addSubview(secondView)
        secondView.setupView(tag: tag)
        
    }
    
    func showDetailView(tag1: Int, tag2: Int) {
        let detailView=DetailView(frame: self.view.frame)
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCurlDown, animations:{
             self.view.addSubview(detailView)
        }, completion:nil)
        
        
        detailView.setUp(i: tag1, j: tag2)
    }
    

    var scollView=UIScrollView()
    var scollSubView=[ScollSubView]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpScrollView()
        setupLebalView()
        //showTableview(tag: 1)
        //showDetailView(tag1: 1, tag2: 1)
       
    }
    func setupLebalView(){
        let label=UILabel()
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints=false
        label.topAnchor.constraint(equalTo: scollView.bottomAnchor).isActive=true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        label.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive=true
        label.text="Choose your car!"
        label.textColor = .black
        label.font=UIFont.systemFont(ofSize: 40)
        
    }
    
    func setUpScrollView(){
        self.view.addSubview(scollView)
        
        //scollView.backgroundColor = .blue
        scollView.translatesAutoresizingMaskIntoConstraints=false
        scollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive=true
        scollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive=true
        scollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive=true
        scollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive=true
        scollView.contentSize=CGSize(width: self.view.frame.width*5.0/3.0, height: scollView.frame.height)
       
        scollView.delegate=self
        
        for i in 1...5
        {
            let view=ScollSubView(frame: CGRect(x: self.view.frame.width*Double(i-1)/3.0, y: 0, width: self.view.frame.width/3.0, height: self.view.frame.height*0.2))
            //print(view.frame.height)
            //print(view.frame.width)
            view.delegate=self
            view.configView(tag: i)
            scollView.addSubview(view)
            scollSubView.append(view)
        }
    }

}


