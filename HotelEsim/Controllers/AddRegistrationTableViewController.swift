//
//  AddRegistrationTableViewController.swift
//  HotelEsim
//
//  Created by lorin esim on 13.05.2023.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailNameTextField: UITextField!
    
    @IBOutlet var checkInDateLabel: UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    @IBOutlet var checkOutDateLabel: UILabel!
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet var numberOfAdultsLabel: UILabel!
    @IBOutlet var numberOfAdultsStepper: UIStepper!
    @IBOutlet var numberOfChildrenLabel: UILabel!
    @IBOutlet var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet var wifiSwitch: UISwitch!
    
    
    
   //Properties
   let checkInDateLabelcellIndexPath = IndexPath(row: 0, section: 1)
   let checkOutDateLabelcellIndexPath = IndexPath(row: 2, section: 1)
     
   let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
   let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerShown: Bool = false {
        didSet{
            // isHidden: Arayüz elemanının görünürülük bilgis
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown: Bool = false {
        didSet{
            // isHidden: Arayüz elemanının görünürülük bilgis
            checkOutDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
       
       //CheckIn tarihi bulunan ulkedeki gunun gecesi
       let midnightToday = Calendar.current.startOfDay(for: Date())
       
       // secilebilinecek en küçük tarih
       checkInDatePicker.minimumDate = midnightToday
       //secili olan tarih
       checkInDatePicker.date = midnightToday
       
       // storyboard'da ayarlanan geçici degerler , o anki Stepper degeri ile güncellenir
       updateNumberOfGuests()
    }
    
    
    //Functions
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath:
            if isCheckInDatePickerShown{
                return 216
            } else {
                return 0
            }
           
        case  checkOutDatePickerCellIndexPath:
            if isCheckOutDatePickerShown{
                return 216
            } else {
                return 0
            }
           
            
        default:
            //picker hücreleri dışında kalan tüm hücrelerin yüksekliği
            return 44
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // secili olan hücrenin, secili olan durumunu bitirir. yani hücreye basınca takılı(secili) kalmaz.
        tableView.deselectRow(at: indexPath, animated: true)
        
       
        // hangi hücreye tıklandıgı biilgisi
        switch indexPath {
        case checkInDateLabelcellIndexPath:
            if isCheckInDatePickerShown{
                isCheckInDatePickerShown = false
            }else if isCheckOutDatePickerShown{
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            }else{
                isCheckInDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
                        
        case checkOutDateLabelcellIndexPath:
            if isCheckOutDatePickerShown{
                isCheckOutDatePickerShown = false
            }else if isCheckInDatePickerShown{
                isCheckOutDatePickerShown = true
                isCheckInDatePickerShown = false
            }else{
                isCheckOutDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()

        default:
            break
        }
        
        
    }
    
    // 2 DatePicker in aynı fonsiyonları tetiklemesi
    func updateDateViews() {
        // .medum= March 7,2001 gibi
        // .short= 12:00 pm gibi
        
        //otelin minimum kalma suresi 1 gece olduğundan seçilen checkIn tarihinden 24 saat sonrası ayarlanır.
        //addingTimeInterval = date nesnenisin üzerine belirtilen miktarda saniye ekler
        let oneDay: Double =  24 * 60 * 60
        checkOutDatePicker.minimumDate = checkOutDatePicker.date.addingTimeInterval(oneDay)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
        
    }
    
    // 2 Stepeer in aynı fonsiyonu tetiklemesi
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    
    
    
    
    //Actions
    @IBAction func doneBarButtonTapped(_ button: UIBarButtonItem) {
        
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let email = emailNameTextField.text!
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn

        print ("Done Tapped")
        print ("firstName: \(firstName)")
        print ("lastName: \(lastName)")
        print ("email: \(email)")
        print ("CheckIn: \(checkInDate)")
        print ("CheckOut: \(checkOutDate)")
        print ("numberOfAdults: \(numberOfAdults)")
        print ("numbeOfChildren: \(numberOfChildren)")
        print ("Wifi: \(hasWifi)")
        
    }
    
    @IBAction func datePickerValuChanged(_ picker: UIDatePicker){
        updateDateViews()
    }
    
    @IBAction func stepperValueChsnged(_ stepper: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sendder: UISwitch) {
        //.
    }
}
