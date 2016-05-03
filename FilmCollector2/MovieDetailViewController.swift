//
//  MovieDetailViewController.swift
//  FilmCollector2
//
//  Created by student on 5/3/16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit
import CoreData

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var directorTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    var managedObjectContext: NSManagedObjectContext!
    var selectedMovie: Movie?
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedMovie = selectedMovie {
            titleTextField.text = selectedMovie.title
            directorTextField.text = selectedMovie.director
            ratingTextField.text = selectedMovie.rating
            genreTextField.text = selectedMovie.genre
            
            title = "Update Movie"
        } else {
            title = "Add Movie"
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        if let selectedMovie = selectedMovie, title = titleTextField.text, director = directorTextField.text, genre = genreTextField.text, rating = ratingTextField.text {
            selectedMovie.title = title
            selectedMovie.director = director
            selectedMovie.rating = rating
            selectedMovie.genre = genre
        } else {
            if let title = titleTextField.text, director = directorTextField.text, genre = genreTextField.text, rating = ratingTextField.text, entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: managedObjectContext) where !title.isEmpty && !director.isEmpty && !genre.isEmpty && !rating.isEmpty {
                movie = Movie(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
                
                movie?.title = title
                movie?.director = director
                movie?.rating = rating
                movie?.genre = genre
            }
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving the managed object context!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
