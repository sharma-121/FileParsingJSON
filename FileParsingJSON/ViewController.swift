//
//  ViewController.swift
//  FileParsingJSON
//
//  Created by Sam-IT on 17/05/1944 Saka.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
    }
    
    private func parseJSON() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            return
    }
    let url = URL(fileURLWithPath: path)
        
        var result: Result?
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
    
            if let result = result {
                print(result)
            }
            else {
                print("Failed to parse")
            }
            return
        }
        catch {
            print("Error: \(error)")
        }
    }
 
    
}

struct Result: Codable {
    let data: [ResultItem]
}


struct ResultItem: Codable {
    let id: String
    let address: String
    let name: String
    let status: String
}
        
      
