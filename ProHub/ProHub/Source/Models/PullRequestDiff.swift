//
//  PullRequestDiff.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/22/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation
import UIKit

enum  LineType {
    case none
    case added
    case removed

}

struct ComparisonLine {
    var diffFilePath : Substring
    
    var baseLineType : LineType = .none
    var baseIndex    : Substring
    var baseLine     : Substring
    var headIndex    : Substring
    var headLine     : Substring
    
    var color: UIColor {
        switch baseLineType {
        case .none:
            return .white
        case .added:
            return .green
        case .removed:
            return .red
        }
    }
    
    mutating func updateType(to type: LineType){
        baseLineType = type
    }
}



struct PullRequestDiff {
    
    var rawContent : String!
    
    var filePaths  : Substring!
    var lines      : [Substring]
    var headLines  : [Substring] = [Substring]()
    var baseLines  : [Substring] = [Substring]()
    
    var comparisonLines            : [Substring:[[Substring]]] = [Substring:[[Substring]]]()
    var comparisonChangeTitleIndex : [Substring] = [Substring]()
    
    init(content: String) {
        rawContent = content
        
        lines      = rawContent.split(separator: "\n")
        splitContents()
        
        print("HEAD lines \(headLines.count)")
        print("BASE lines \(baseLines.count)")
    }
    
    
    func getFilePaths(){
    }
    
    
    
    mutating func splitContents(){
        
        var currentChangeTitle : Substring?
        
        var currentBaseIndex   : Int?
        var currentBaseLine    : Substring?
        var currentHeadIndex   : Int?
        var currentHeadLine    : Substring?
        
        for (_, line) in lines.enumerated() {
            
            if let _ = line.range(of: "diff --git") {
//                let titles = line.split(separator: " ")
//                baseLines.append(titles[1])
//                headLines.append(titles[2])
            }
            else if let _ = line.range(of: "---") {
//                baseLines.append(line)
            }
            else if let _ = line.range(of: "+++") {
//                headLines.append(line)
            }
            else if let _ = line.range(of: "@@"){
                currentChangeTitle = line
                comparisonChangeTitleIndex.append(currentChangeTitle!)
            }
            else if let _ = line.range(of: "-") {
                baseLines.append(line)
            }
            else if let _ = line.range(of: "+") {
                headLines.append(line)
            } else {
                baseLines.append(line)
                headLines.append(line)
            }
            
            if currentChangeTitle != nil{
                if comparisonLines.keys.contains(currentChangeTitle!) {
                    comparisonLines[currentChangeTitle!]?.append([line])
                    
                } else {
                    comparisonLines[currentChangeTitle!] = [[line]]
                    
                }
            }
            
        }
    }
    
    ///
//    func lookForValue()
    
    
}


/*
 
 diff --git a/Library/Categories/CoreData/NSManagedObject/NSManagedObject+MagicalDataImport.m b/Library/Categories/CoreData/NSManagedObject/NSManagedObject+MagicalDataImport.m
 index 9992c89f..f659b3ba 100644
 --- a/Library/Categories/CoreData/NSManagedObject/NSManagedObject+MagicalDataImport.m
 +++ b/Library/Categories/CoreData/NSManagedObject/NSManagedObject+MagicalDataImport.m
 @@ -325,9 +325,12 @@ - (BOOL) MR_importValuesForKeysWithObject:(id)objectData
 NSEntityDescription *entityDescription = [relationshipInfo destinationEntity];
 relatedObject = [entityDescription MR_createInstanceInContext:[strongSelf managedObjectContext]];
 }
 +
 //import or update
 -        [relatedObject MR_importValuesForKeysWithObject:localObjectData];
 -
 +        if ([localObjectData isKindOfClass:[NSDictionary class]]) {
 +            [relatedObject MR_importValuesForKeysWithObject:localObjectData];
 +    }
 +
 [strongSelf MR_setObject:relatedObject forRelationship:relationshipInfo];
 };
 
*/
