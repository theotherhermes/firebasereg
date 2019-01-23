//
//  Models.swift
//  regjson
//
//  Created by Rinat Luhmanov on 22/01/2019.
//  Copyright © 2019 Rinat Luhmanov. All rights reserved.
//

import Foundation

var arcticles: [Arcticle] = []

func loadNews() {
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2fb9897fb94f453b9ff9408979a816ac")
    let session = URLSession(configuration: .default)
    session.downloadTask(with: url!) { (urlFile, responce, error)  in
        if urlFile != nil {
            let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
            let urlPath = URL(fileURLWithPath: path)
            try? FileManager.default.copyItem(at: urlFile!, to: urlPath)
            
            print(urlPath)
        }
        
    }
}
