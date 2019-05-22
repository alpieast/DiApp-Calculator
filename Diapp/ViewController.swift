//
//  ViewController.swift
//  Diapp
//
//  Created by Alperen Dogu on 2.05.2019.
//  Copyright © 2019 Alperen Dogu. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
	
	
	var interstitial: GADInterstitial!
	var bannerAdIsLoaded: Bool!
	var fullScreenAdIsLoaded: Bool!
	
	@IBOutlet var resultsView: UIView!
	@IBOutlet weak var visualEffectView: UIVisualEffectView!
	
	var effect:UIVisualEffect!
	@IBOutlet weak var dismissPopUpButton: UIButton!
	
	@IBAction func dismissPopUp(_ sender: Any) {
		animateOut()
	}
	
	//banners
	@IBOutlet weak var bottomBannerView: GADBannerView!
	
	@IBOutlet weak var totalCHOLabel: UILabel!
	@IBOutlet weak var totalProteinLabel: UILabel!
	@IBOutlet weak var totalFatLabel: UILabel!
	@IBOutlet weak var totalKaloriLabel: UILabel!
	
	//textbox definitions
	@IBOutlet weak var milkTextField: UITextField!
	@IBOutlet weak var meatTextField: UITextField!
	@IBOutlet weak var eygTextField: UITextField!
	@IBOutlet weak var vegetableTextField: UITextField!
	@IBOutlet weak var fruitTextField: UITextField!
	@IBOutlet weak var fatTextField: UITextField!
	@IBOutlet weak var legumesTextField: UITextField!
	
	
	//CHO label definitions
	@IBOutlet weak var milkCHOLabel: UILabel!
	@IBOutlet weak var meatCHOLabel: UILabel!
	@IBOutlet weak var eygCHOLabel: UILabel!
	@IBOutlet weak var vegetableCHOLabel: UILabel!
	@IBOutlet weak var fruitCHOLabel: UILabel!
	@IBOutlet weak var fatCHOLabel: UILabel!
	@IBOutlet weak var legumesCHOLabel: UILabel!
	
	
	//Protein label definitions
	@IBOutlet weak var milkProteinLabel: UILabel!
	@IBOutlet weak var meatProteinLabel: UILabel!
	@IBOutlet weak var eygProteinLabel: UILabel!
	@IBOutlet weak var vegetableProteinLabel: UILabel!
	@IBOutlet weak var fruitProteinLabel: UILabel!
	@IBOutlet weak var fatProteinLabel: UILabel!
	@IBOutlet weak var legumesProteinLabel: UILabel!
	
	
	//Fat label Definitions
	@IBOutlet weak var milkFatLabel: UILabel!
	@IBOutlet weak var meatFatLabel: UILabel!
	@IBOutlet weak var eygFatLabel: UILabel!
	@IBOutlet weak var vegetableFatLabel: UILabel!
	@IBOutlet weak var fruitFatLabel: UILabel!
	@IBOutlet weak var fatFatLabel: UILabel!
	@IBOutlet weak var legumesFatLabel: UILabel!
	
	//buttons
	@IBOutlet weak var totalButton: UIButton!
	@IBOutlet weak var resetButton: UIButton!
	
	@IBAction func totalButtonPressed(_ sender: Any) {
		
		totalButton.isEnabled = false
		totalButton.backgroundColor = UIColor.darkGray
		animateIn()
		kaloriToplayıcı()
		resetButton.isEnabled = true
		
		
	}
	
	@IBAction func resetButtonPressed(_ sender: Any) {
		resetButton.isEnabled = false
		totalButton.isEnabled = true
		totalButton.backgroundColor = UIColor.green
		labelCleaner()
		showFullScreenAd()
		fullScreenAdLoader()
	}
	
	func labelCleaner(){
		self.milkCHOLabel.text = "9"
		self.milkProteinLabel.text = "6"
		self.milkFatLabel.text = "6"
		
		
		self.meatCHOLabel.text = "-"
		self.meatProteinLabel.text = "6"
		self.meatFatLabel.text = "5"
		
		
		self.eygCHOLabel.text = "15"
		self.eygProteinLabel.text = "2"
		self.eygFatLabel.text = "-"
		
		
		self.vegetableCHOLabel.text = "6"
		self.vegetableProteinLabel.text = "1"
		self.vegetableFatLabel.text = "-"
		
		
		self.fruitCHOLabel.text = "15"
		self.fruitProteinLabel.text = "-"
		self.fruitFatLabel.text = "-"
		
		
		self.fatCHOLabel.text = "-"
		self.fatProteinLabel.text = "-"
		self.fatFatLabel.text = "5"
		
		
		self.legumesCHOLabel.text = "15"
		self.legumesProteinLabel.text = "5"
		self.legumesFatLabel.text = "-"
		
		self.totalCHOLabel.text = "0"
		self.totalProteinLabel.text = "0"
		self.totalFatLabel.text = "0"
		
		self.milkTextField.text = ""
		self.meatTextField.text = ""
		self.eygTextField.text = ""
		self.vegetableTextField.text = ""
		self.fruitTextField.text = ""
		self.fatTextField.text = ""
		self.legumesTextField.text = ""
		
		self.totalKaloriLabel.text = "0"
		
	}
	
	@IBAction func milkEditEnd(_ sender: Any) {
		if(self.milkTextField.text == ""){
			milkCHOLabel.text = "9"
			milkProteinLabel.text = "6"
			milkFatLabel.text = "6"
		}else{
		var milkVariable = Int(self.milkTextField.text!)
		milkCHOLabel.text = String(milkVariable!*9)
		milkProteinLabel.text = String(milkVariable!*6)
		milkFatLabel.text = String(milkVariable!*6)
		}
		
	}
	
	@IBAction func meatEditEnd(_ sender: Any) {
		if(self.meatTextField.text == ""){
			meatProteinLabel.text = "6"
			meatFatLabel.text = "5"
			
		}else{
			var meatVariable = Int(self.meatTextField.text!)
			meatProteinLabel.text = String(meatVariable!*6)
			meatFatLabel.text = String(meatVariable!*5)
		}
		
	}
	
	@IBAction func eygEditEnd(_ sender: Any) {
		if(self.eygTextField.text == ""){
			eygCHOLabel.text = "15"
			eygProteinLabel.text = "2"
		}else{
			var eygVariable = Int(self.eygTextField.text!)
			eygCHOLabel.text = String(eygVariable!*15)
			eygProteinLabel.text = String(eygVariable!*2)
		}
		
	}
	
	@IBAction func vegitableEditEnd(_ sender: Any) {
		if(self.vegetableTextField.text == ""){
			vegetableCHOLabel.text = "6"
			vegetableProteinLabel.text = "1"
		}else{
			var vegetableVariable = Int(self.vegetableTextField.text!)
			vegetableCHOLabel.text = String(vegetableVariable!*6)
			vegetableProteinLabel.text = String(vegetableVariable!*1)
		}
		
	}
	
	@IBAction func fruitEditEnd(_ sender: Any) {
		if(self.fruitTextField.text == ""){
			fruitCHOLabel.text = "15"
		}else{
			var fruitVariable = Int(self.fruitTextField.text!)
			fruitCHOLabel.text = String(fruitVariable!*15)
		}
		
	}
	
	@IBAction func fatEditEnd(_ sender: Any) {
		if(self.fatTextField.text == ""){
			fatFatLabel.text = "5"
		}else{
			var fatVariable = Int(self.fatTextField.text!)
			fatFatLabel.text = String(fatVariable!*5)
		}
		
	}
	
	@IBAction func legumesEditEnd(_ sender: Any) {
		
		if(self.legumesTextField.text == ""){
			legumesCHOLabel.text = "15"
			legumesProteinLabel.text = "5"
			
		}else{
			var legumesVariable = Int(self.legumesTextField.text!)
			legumesCHOLabel.text = String(legumesVariable!*15)
			legumesProteinLabel.text = String(legumesVariable!*5)
		}
		
	}
	
	func kaloriToplayıcı(){
		
		var totalCHO = Int(self.milkCHOLabel.text!)! + Int(self.eygCHOLabel.text!)! + Int(self.vegetableCHOLabel.text!)! + Int(self.fruitCHOLabel.text!)!
		var finalCHO = (totalCHO + Int(self.legumesCHOLabel.text!)!)*4
		
		
		var totalProtein = Int(self.milkProteinLabel.text!)! + Int(self.meatProteinLabel.text!)! + Int(self.eygProteinLabel.text!)! + Int(self.vegetableProteinLabel.text!)!
		var finalProtein = (totalProtein + Int(self.legumesProteinLabel.text!)!)*4
		
		var finalFat = (Int(self.milkFatLabel.text!)! + Int(self.meatFatLabel.text!)! + Int(self.fatFatLabel.text!)!)*9
		
		var totalCalorie = finalCHO + finalProtein + finalFat
		var percentCHO = round(Double(finalCHO)/Double(totalCalorie)*10000)/100
		var percentProtein = round(Double(finalProtein)/Double(totalCalorie)*10000)/100
		var percentFat = round(Double(finalFat)/Double(totalCalorie)*10000)/100
		
		
		totalCHOLabel.text = "Karbonhidrat = " + String(finalCHO) + " kcal " + " % " + String(percentCHO)
		totalProteinLabel.text = "Protein = " + String(finalProtein) + " kcal " + " % " + String(percentProtein)
		totalFatLabel.text = "Yağ = " + String(finalFat) + " kcal " + " % " + String(percentFat)
		
		self.totalKaloriLabel.text = "Toplam Kalori = " + String(finalCHO + finalProtein + finalFat)
		
	}
	
	func bottomBannerCreator(){
		bottomBannerView.adUnitID = bottomBannerAPI
		bottomBannerView.rootViewController = self
		bottomBannerView.load(GADRequest())
		bottomBannerView.delegate = self
	}
	
	func fullScreenAdLoader(){//reklam yukleyici
		interstitial = GADInterstitial(adUnitID: fullScreenClearButtonAdAPI)
		let request = GADRequest()
		interstitial.load(request)
		print("ad request is sent!")
		fullScreenAdIsLoaded = true
	}
	
	func showFullScreenAd(){//reklam gosterici
		if interstitial.isReady{
			interstitial.present(fromRootViewController: self)
		}else{
			print("ad is not ready!")
		}
	}
	
	//pop-up funcs
	func animateIn(){
		dismissPopUpButton.layer.cornerRadius = 15
		visualEffectView.isHidden = false
		self.view.addSubview(resultsView)
		resultsView.center = self.view.center
		
		resultsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
		resultsView.alpha = 0
		
		UIView.animate(withDuration: 0.4) {
			self.visualEffectView.effect = self.effect
			self.resultsView.alpha = 1
			self.resultsView.transform = CGAffineTransform.identity
		}
	}
	
	func animateOut (){
		
		UIView.animate(withDuration: 0.3, animations: {
			self.resultsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
			self.resultsView.alpha = 0
			
			self.visualEffectView.effect = nil
			self.visualEffectView.isHidden = true
		}) { (success:Bool) in
			self.resultsView.removeFromSuperview()
		}
	}
	//pop-up funcs end
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
		
		FirebaseApp.configure()
		
		//pop-up upgrades
		effect = visualEffectView.effect
		visualEffectView.effect = nil
		resultsView.layer.cornerRadius = 10
		
		
		//visual and functional
		totalButton.backgroundColor = UIColor.green
		resetButton.isEnabled = false
		labelCleaner()
		
		//api parser funcs
		bottomBannerAdApiParser{
			self.bottomBannerCreator()
		}
		//api parser funcs
		fullScreenAdApiParser {
			self.fullScreenAdLoader()
		}
		fullScreenAdLoader()
		
		// Do any additional setup after loading the view.
	}
	
	@objc func keyboardWillShow(notification: NSNotification) {
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
			if self.view.frame.origin.y == 0 {
				self.view.frame.origin.y -= keyboardSize.height/8
			}
		}
	}
	
	@objc func keyboardWillHide(notification: NSNotification) {
		if self.view.frame.origin.y != 0 {
			self.view.frame.origin.y = 0
		}
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
}

extension ViewController: GADBannerViewDelegate {
	
	func adViewDidReceiveAd(_ bannerView: GADBannerView) {
		print("recieved ad")
		
		bottomBannerView.alpha = 0
		UIView.animate(withDuration: 1) {
			self.bottomBannerView.alpha = 1
		}
	}
	
	func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
		print(error)
	}
}
