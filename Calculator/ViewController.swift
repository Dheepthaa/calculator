//
//  ViewController.swift
//  Calculator/Users/dheepthaa/Developer/Calculator/Calculator/ViewController.swift
//
//  Created by Dheepthaa Anand on 17/11/17.
//  Copyright © 2017 Dheepthaa Anand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flag = 0
    var sym = ""
    var ans = 0.0
    var ans1 = ""
    var ct = 0;
    var cteq = 0;
    var text = 0.0
    var text1 = "";
    var d = 0;
    var z=0.0
    var zero=""
    var nan=0
    var digct=0
    var digctd=0
    var oob=0
  
  
    @IBOutlet weak var display: UILabel!
    
    
    
    override func viewDidLoad()
    {
        display!.text = "0"
        display!.textAlignment = NSTextAlignment.right;
        
    }
    
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
      
        if cteq == 1
        {
            display!.text = "0"
            cteq=0
        }
        if nan==1
        {
            ans = 0.0;
            sym = "";
            ct=0
            cteq = 0
            flag=0
            nan=0
            digct=0
            digctd=0
            oob=0
            nan=0
            display!.text = "0"
        }
        if oob==1
        {
            ans = 0.0;
            sym = "";
            ct=0
            cteq = 0
            flag=0
            nan=0
            digct=0
            digctd=0
            oob=0
            oob=0
            display!.text = "0"
        }
        if(digit != ".")
        {
            if ct == 0
            {
                digct = digct + 1
            }
            else
            {
                digctd = digctd + 1
            }
       
        }
     
        if((digit==".")||(((digct < 13)||(digct>13 && ct==1))&&( digctd < 4)))
        {
            if flag==0
            {
                if digit=="."
                {
                    if ct == 0
                    {
                        let textInDisplay = display!.text!
                        if textInDisplay == "0"
                        {
                            display!.text = "0."
                        }
                        else
                        {
                            display!.text = display!.text! + "."
                        }
                    }
                    ct = ct + 1
                }
                else
                {
                    if ct==0
                    {
                        let textInDisplay = display!.text!
                        if textInDisplay != "0"
                        {
                            let d1 = (textInDisplay as NSString).doubleValue
                            d = Int(d1)
                            display!.text = (String(d) + digit)
                        }
                        else
                        {
                            display!.text = (digit) //change
                        }
                    }
                    else
                    {
                        
                        display!.text = display!.text! + digit
                        
                    }
                }
            }
            else
            {
                if digit == "."
                {
                    if ct == 0
                    {
                        display!.text = "0."
                        flag = 0;
                    }
                    ct = ct + 1
                }
                else
                {
                    display!.text = digit
                    flag = 0;
                }
            }
        }
    }
    
    
    @IBAction func plusorminus(_ sender: UIButton) {
        if nan==0 && oob==0
        {
            let num = display!.text!
            let num1 = (num as NSString).doubleValue
            if((String(Int(num1))+".0")==String(num1))
            {
                //print("int")
                display!.text = String(Int(-num1))
            }
            else
            {
                //print("not")
                display!.text = String(-num1)
            }
            
        }
    }
    
    @IBAction func touchOperation(_ sender: UIButton) {
        let symbol = sender.currentTitle!
        cteq = 0;
        ans1 = display!.text!
        digct=0
        digctd=0
        ct=0;
        if flag==0 && nan==0 && oob==0
        {
            switch sym
            {
            case "+":
                
                ans = ans + (ans1 as NSString).doubleValue
                if ans > 1e15
                {
                    display!.text = "Out of bounds"
                    oob=1
                }
                
            case "-":
                
                ans = ans - (ans1 as NSString).doubleValue
                if ans > 1e15
                {
                    display!.text = "Out of bounds"
                    oob=1
                }
                
            case "*":
                
                ans = ans * (ans1 as NSString).doubleValue
                if ans > 1e15
                {
                    display!.text = "Out of bounds"
                    oob=1
                }
                
            case "/":
                
                if (ans1 as NSString).doubleValue == 0
                {
                    display!.text = "Not a number"
                    nan = 1
                }
                else
                {
                    ans = ans / (ans1 as NSString).doubleValue
                    if ans > 1e15
                    {
                        display!.text = "Out of bounds"
                        oob=1
                    }
                }
                
            default:
                ans = (ans1 as NSString).doubleValue
                
                
            }

        }
        if nan==0 && oob==0
        {
            sym = symbol
            if sym=="%"
            {
                ans = ans/100;
            }
            if(sym != "")
            {
                ans = Double(round(1000*ans)/1000)
                if ans == -0 //new
                {
                    ans = 0
                }
            }
            if((String(Int(ans))+".0")==String(ans))
            {
                //print("int")
                display!.text = String(Int(ans))
            }
            else
            {
                //print("not")
                display!.text = String(ans)
            }
            
            flag = 1;
            
        }
        
    }
    
    @IBAction func touchEqual(_ sender: UIButton) {
        if cteq == 0 && flag == 0
        {
            ans1 = display!.text!
            
            switch sym
            {
            case "+":
            
                ans = ans + (ans1 as NSString).doubleValue
                if ans > 1e15
                {
                    display!.text = "Out of bounds"
                    oob=1
                }
                
            case "-":
            
                ans = ans - (ans1 as NSString).doubleValue
                if ans > 1e15
                {
                    display!.text = "Out of bounds"
                    oob=1
                }
                
            case "*":
            
                ans = ans * (ans1 as NSString).doubleValue
                if ans > 1e15
                {
                    display!.text = "Out of bounds"
                    oob=1
                }
                
            case "/":
            
                if (ans1 as NSString).doubleValue == 0
                {
                    display!.text = "Not a number"
                    nan = 1
                }
                else
                {
                    ans = ans / (ans1 as NSString).doubleValue
                    if ans > 1e15
                    {
                        display!.text = "Out of bounds"
                        oob=1
                    }
                }
                
            default:
                    ans = (ans1 as NSString).doubleValue
                
            
            }

            
            if nan==0 && oob==0
            {
                ans = Double(round(1000*ans)/1000)
                if ans == -0 //new
                {
                    ans = 0
                }
                if((String(Int(ans))+".0")==String(ans))
                {
                    //print("int")
                    display!.text = String(Int(ans))
                }
                else
                {
                    //print("not")
                    display!.text = String(ans)
                }
                
            }
            
        }
        cteq = cteq + 1;
        sym = "="
        flag=0
        ans = 0.0;
        ct=0
        flag=0
        
        digct=0
        digctd=0
   
       
        
    }
    
    @IBAction func clear(_ sender: UIButton) {
        display!.text = "0"
        ans = 0.0;
        sym = "";
        ct=0
        cteq = 0
        flag=0
        nan=0
        digct=0
        digctd=0
        oob=0
    }
    
}

