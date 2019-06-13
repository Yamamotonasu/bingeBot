//
//  ViewController.swift
//  bingeBod
//
//  Created by 山本裕太 on 2019/06/11.
//  Copyright © 2019 山本裕太. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var landomShowLabel: UILabel!
    @IBOutlet weak var bingebotSpokenLabel: UILabel!
    @IBOutlet weak var addShowTextField: UITextField!
    @IBOutlet weak var addShowButton: UIButton!
    
    @IBOutlet weak var randomShowStackView: UIStackView!
    @IBOutlet weak var addShowStackView: UIStackView!
    @IBOutlet weak var showsStackView: UIStackView!
    
    var shows: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showsStackView.isHidden = true
        randomShowStackView.isHidden = true
        
    }
    
    // showLabelにshowsの中の文字列をjoinedさせて表示する
    func updateShowsLabel() {
        showLabel.text = shows.joined(separator: ", ")
    }

    @IBAction func randomBingeShowButton(_ sender: Any) {
        landomShowLabel.text = shows.randomElement()
        landomShowLabel.isHidden = false
        bingebotSpokenLabel.isHidden = false
    }
    @IBAction func addShowButtonPressed(_ sender: Any) {
        // addShowTextFieldが確実に存在するようにする。(クラッシュを防ぐ)
        guard let showName = addShowTextField.text else { return }
        if (addShowTextField.text)!.count == 0 {
            return
        }
        shows.append(showName)
        updateShowsLabel()
        addShowTextField.text = ""
        showsStackView.isHidden = false
        if shows.count > 1 {
            randomShowStackView.isHidden = false
            bingebotSpokenLabel.isHidden = true
            landomShowLabel.isHidden = true
        }
    }
    
}

