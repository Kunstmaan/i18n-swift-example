//
//  ViewController.swift
//  KunstmaanI18nSwiftExample
//
//  Created by Daan Poron on 19/04/16.
//  Copyright © 2016 Kunstmaan. All rights reserved.
//

import UIKit
import KunstmaanI18nSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var languagePicker: UIPickerView!
    
    private var languages = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.languagePicker.delegate = self
        self.languagePicker.dataSource = self
        
        self.languages = I18n.possibleLanguages
        
        if let currentLanguage = I18n.language {
            self.languagePicker.selectRow(languages.indexOf(currentLanguage)! + 1, inComponent: 0, animated: false)
        }
    }

    @IBAction func executeCTA(sender: AnyObject) {
        let alertController = UIAlertController(title: "alert.title".i18nLocalized, message: "alert.message".i18nLocalized, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "alert.action".i18nLocalized, style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.languages.count + 1
    }
}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return "---"
        }
        
        let language = self.languages[row - 1]
        
        return NSLocale(localeIdentifier: language).displayNameForKey(NSLocaleIdentifier, value: language)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row > 0 {
            do {
                try I18n.setLanguage(self.languages[row - 1])
            } catch { }
        }
    }
    
}

