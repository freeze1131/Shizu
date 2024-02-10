//
//  ProverbViewModel.swift
//  Shizu
//
//  Created by Ahmet Ozen on 10.02.2024.
//

import Foundation
import Observation


@Observable
class ProverbViewModel {
    var proverbModel: ProverbModel = ProverbModel.defaultQuote()
    
    
    let urlString = "https://chinese-proverbs.onrender.com/api/proverbs/random"
    
    
    func getRandomQuote () {
        getQuote(urlString: urlString)
    }
    
    
    
    private func getQuote(urlString: String) {
        // Create URL
        guard let url = URL(string: urlString) else {return}
        
        // Send a GET request from the quote API
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Try to get data and any error information
        let task = URLSession.shared.dataTask(with: request) {data,response,error in
            let jsonDecoder = JSONDecoder()
            
            // This is called if there is an error
            if let error {
                print(error)
                return
            }
            // Get data if it is not nil
            guard let data = data else {
                print("data is nil")
                return
            }
            
            do {
                let niceProverb =  try jsonDecoder.decode(ProverbModel.self, from: data)
                print(niceProverb.proverb)
                print(niceProverb.pinyin)
                
                
                // Crucial - update quoteModel
                DispatchQueue.main.async {
                    self.proverbModel = niceProverb
                }
                
            } catch  {
                print(data.description)
            }
            
            
            
        }
        
        // Resume
        task.resume()
        
    }
}
