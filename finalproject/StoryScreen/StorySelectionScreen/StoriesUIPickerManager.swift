//
//  StoryMoodPickerManager.swift
//  finalproject
//
//  Created by Diya on 12/4/23.
//

import Foundation
import UIKit

extension StoriesMainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == storyView.moodPickerButton {
            return MoodCategories.moods.count
        } 
        else if pickerView == storyView.timeframePickerButton {
            return Timeframes.timeframes.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == storyView.moodPickerButton {
            selectedMood = MoodCategories.moods[row].lowercased()
            print("SelectedMood -- \(selectedMood)")
            return MoodCategories.moods[row]
        } 
        else if pickerView == storyView.timeframePickerButton {
            selectedTimeframe = Timeframes.timeframes[row]
            print("SelectedTime -- \(selectedTimeframe)")
            return Timeframes.timeframes[row]
        }
        return nil
    }
}
