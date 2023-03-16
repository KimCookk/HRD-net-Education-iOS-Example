//
//  ViewController.swift
//  SubjectCalculation
//
//  Created by TJ on 2022/06/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var tfScore: UITextField!
    
    
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblAverage: UILabel!
    @IBOutlet weak var lblKorean: UILabel!
    @IBOutlet weak var lblEnglish: UILabel!
    @IBOutlet weak var lblMath: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    var subjectIndex = 0 // 과목별 순서
    var score:[Int] = [0,0,0]
    var averageScore = 0.0
    var totalScore = 0
    var subjectTitle:[String] = ["국어점수" , "영어점수" , "수학점수"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblSubject.text = subjectTitle[subjectIndex]
        lblTotal.text = ""
        lblAverage.text = ""
        lblKorean.text = ""
        lblEnglish.text = ""
        lblMath.text = ""
        lblMessage.text = ""
        
    }
    @IBAction func touchBtnCalculation(_ sender: UIButton) {
        
        let inputScore = tfScore.text!
        if(checkNil(str: inputScore))
        {
            lblMessage.text = "숫자를 입력해주세요."
            return
        }
        
        switch subjectIndex{
            case 0:
                lblKorean.text = inputScore
                
            case 1:
                lblEnglish.text = inputScore
                
            case 2:
                lblMath.text = inputScore
            default:
                break
        }
        if(subjectIndex <= subjectTitle.count)
        {
            score[subjectIndex] = Int(inputScore) ?? 0
            lblSubject.text = subjectTitle[subjectIndex + 1]
        }
        else
        {
            subjectIndex = 0
            totalScore = calcSubject(inputScore: score).0
            averageScore = calcSubject(inputScore: score).1
            
            lblTotal.text = String(totalScore)
            lblAverage.text = String(averageScore)
            
            summarySubjectScore()
        }
        subjectIndex += 1

    }
    func calcSubject(inputScore: Array<Int>) -> (Int, Double)
    {
        var total: Int = 0
        for i in 0..<inputScore.count
        {
            total += score[i]
        }
        var average: Double = Double(total / score.count)
        return (total , average)
    }
    
    func summarySubjectScore()
    {
        for i in 0..<subjectTitle.count
        {
            var upperCheck: Bool = score[i] > Int(averageScore)
            var summary: String = getSummaryMessage(score: score[i], subjectScore: subjectTitle[i], upperAverage: upperCheck)
            
            switch subjectTitle[i]{
                case "국어점수":
                    lblKorean.text = summary
                    break
                case "영어점수":
                    lblEnglish.text = summary
                    break
                case "수학점수":
                    lblMath.text = summary
                    break
                default:
                    break
            }
        }
    }
    
    func getSummaryMessage(score: Int , subjectScore: String ,upperAverage: Bool) -> String
    {
        var summary: String = ""
        if(upperAverage)
        {
            summary = "\(subjectScore) \(score) 는 평균보다 높습니다."
        }
        else
        {
            summary = "\(subjectScore) \(score) 는 평균보다 같거나 낮습니다."
        }
        return summary
    }
    
    func checkNil(str: String) -> Bool{
        var checkResult = false
        
        let inputStr = str.trimmingCharacters(in: .whitespacesAndNewlines)
        if inputStr.isEmpty
        {
            checkResult = true
        }
            
        return checkResult
    }
}

