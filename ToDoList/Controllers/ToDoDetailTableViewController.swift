//
//  ToDoDetailTableViewController.swift
//  ToDoList
//
//  Created by Антон Шалимов on 25.02.2023.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {
    
    // MARK: Properties
    
    // Value to store if wheel date picker hidden or not
    var isDatePickerHidden = true
    
    // Index path of label of date picker
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    
    // Index path of wheel date picker
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    
    // Index path for notes
    let notesIndexPath = IndexPath(row: 0, section: 2)
    
    // MARK: Outlets
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var dueDateDatePicker: UIDatePicker!
    @IBOutlet var notesTextView: UITextView!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Getting the today's date and adding 24 hours to it
        dueDateDatePicker.date = Date().addingTimeInterval(24*60*60)
        updateSaveButtonState()
        updateDueDateLabelText(date: dueDateDatePicker.date)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    /// Перегрузка метода `heightForRowAt` для того, чтобы устанавливать значения высоты для клеток, скрывая
    /// wheel дейтпикер если он не нужен
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // В зависимости от того, какой `indexPath` у клетки
        switch indexPath {
            // Если indexPath совпадает с indexPath дейтпикера и значение переменной показа
            // дейтпикера говорит что показывать его не надо, то скрыть его
        case datePickerIndexPath where isDatePickerHidden == true:
            return 0
            // В противном случае назначить высоту клетки = 200
        case notesIndexPath:
            return 200
            // Для остальных клеток дать значение автоматическое
        default:
            return UITableView.automaticDimension
        }
    }
    
    /// Перегрузка функции `didSelectRowAt` для отслеживания, когда пользователь нажимает на клетку с лейблом
    /// даты и времени и переключает переменную `idDatePickerHidden` для скрытия/показа колеса дейтпикера
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == dateLabelIndexPath {
            isDatePickerHidden.toggle()
            updateDueDateLabelText(date: dueDateDatePicker.date)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: Helper functions
    /// Helper function to update save button state.
    /// Function checks if user filled title of TODO item and if not - disables save button
    func updateSaveButtonState(){
        let shouldEnableSaveButton = titleTextField.text?.isEmpty == false
        saveButton.isEnabled = shouldEnableSaveButton
    }
    
    /// Helper method to format dateTime label
    /// - Parameter date: Date object with date, that should be displayed
    func updateDueDateLabelText(date: Date) {
        dueDateLabel.text = date.formatted(
            .dateTime.month(.defaultDigits).day().year(.twoDigits).hour().minute()
        )
    }
    
    // MARK: Actions
    
    
    /// Action for checking if "Is complete?" button selected and changing it state when user taps it
    /// - Parameter sender: UIButton
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected.toggle()
    }
    
    /// Action for checking the value change state of text field with TODO's title
    /// - Parameter sender: UITextField
    @IBAction func titleTextChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    /// Action for tracking primary event of text field.
    /// For text field primary event = pressing the "Return" button
    /// - Parameter sender: UITextField object
    @IBAction func returnButtonPressed(_ sender: UITextField) {
        // Next line will dismiss keyboard when user clicks return key on keyboard
        sender.resignFirstResponder()
    }
    
    /// Action to trigger when user changes the dateTime in wheel datepicker
    /// - Parameter sender: UIDatePicker, in our case - wheel datepicker
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabelText(date: sender.date)
    }
    
}
