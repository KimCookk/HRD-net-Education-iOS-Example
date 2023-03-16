//
//  DataModel.swift
//  NetworkJsonMovie
//
//  Created by TJ on 2022/06/19.
//

import Foundation
import UIKit

struct JsonMovie: Codable
{
    var image: String
    var title: String
}

class Movie
{
    var mImage: String
    var mTitle: String
    var mScoreText: String
    var mScore: Int
    var mImageURL: URL?
    
    init(mImage: String , mTitle: String)
    {
        self.mImage = mImage
        self.mTitle = mTitle
        self.mScore = Int(round(Float.random(in: 0...5.0)))
        self.mScoreText = "\(mScore) / 5.0 "
        self.mImageURL = URL(string: mImage)
    }
}


protocol NetworkModelProtocol{
    func downloadedData(datas: [Movie])
}

class NetworkModel{
    var delegate: NetworkModelProtocol!
    let urlPath = "https://zeushahn.github.io/Test/ios/movies.json"
    
    func downloadData()
    {
        let url = URL(string: urlPath)
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url!, completionHandler: {(data , response, error)
            in if error == nil
            {
                print("Download Succes")
                self.parseJson(data: data!)
            }
            else
            {
                print("Download Error")
                print(error?.localizedDescription)

            }
        })
        task.resume()
    }
    
    func parseJson(data: Data)
    {
        let decoder = JSONDecoder()
        let str = String(decoding: data, as: UTF8.self)
        print(str)
        
        var movies: [Movie] = []
        do
        {
            let jsonMovies = try decoder.decode([JsonMovie].self, from: data)
            for jsonMovie in jsonMovies
            {
                var movie = Movie(mImage: jsonMovie.image, mTitle: jsonMovie.title)
                movies.append(movie)
            }
        }catch let error{
            print(error.localizedDescription)
        }
        
        DispatchQueue.main.async(execute: {()->Void in
            self.delegate.downloadedData(datas: movies)
        })
        
    }
    
}
