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
    var baseLineType : LineType = .none
    var baseIndex    : String
    var baseLine     : String
    var headIndex    : String
    var headLine     : String
    
    var color: UIColor {
        switch baseLineType {
        case .none:
            let color : UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            return color
        case .added:
            let color : UIColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            return color
        case .removed:
            let color : UIColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            return color
        }
    }
    mutating func updateType(to type: LineType){
        baseLineType = type
    }
}



struct PullRequestDiff {
    
    private(set) var rawContent : String!
    private(set) var rawRange   : NSRange!

    private(set) var commits                    : [String] = [String]()
    private(set) var comparisonDictionary       : [String:[ComparisonLine]] = [String:[ComparisonLine]]()
    private(set) var comparisonChangeTitleIndex : [String] = [String]()
    
    init(content: String) {
        rawContent = String(content)
        rawRange   = NSRange(location: 0, length: rawContent.utf8.count)
        
        orderDiff()
        
    }
    
    mutating func orderDiff(){
        
        let commitsString = removeTitles(diffString: rawContent)
        commits = commitsString.components(separatedBy: "@@").filter{ $0 != "" }
        comparisonDictionary = createCommitsDictionary(commits: commits)
        
    }
    
    mutating func removeTitles(diffString: String) -> String {
        let findFirstCommitIndex = diffString.firstIndex(of: "@")
        let commitsBlockString   = String(diffString.suffix(from: findFirstCommitIndex!))
        return commitsBlockString
    }
    
    
    mutating func createCommitsDictionary(commits: [String] ) -> [String:[ComparisonLine]] {
        var tmpDic = [String:[ComparisonLine]]()
        
        if commits.count > 0 {
            var currentIndex = 0
            while currentIndex < commits.count{
                
                let commitKey   = "@@ \(commits[currentIndex]) @@"
                let commitValue = getCommitLines(commitValue:commits[currentIndex+1])
                
                tmpDic[ commitKey ] = commitValue
                comparisonChangeTitleIndex.append( commitKey )
                
                currentIndex += 2
            }
        }
        
        return tmpDic
    }

    mutating func getCommitLines(commitValue: String) -> [ComparisonLine] {
        let lines = commitValue.components(separatedBy: "\n").filter{ $0 != "" }
        var comparisons = [ComparisonLine]()
        var currentBaseIndex = 0
        var currentHeadIndex = 0
        
        for line in lines {
            let l = line
            var cLine : ComparisonLine

            if line.hasPrefix("+"){
                cLine = ComparisonLine(baseLineType: .added,
                                       baseIndex: "",
                                       baseLine: "",
                                       headIndex: String(0),
                                       headLine: line)
                
            } else if line.hasPrefix("-") {
                cLine = ComparisonLine(baseLineType: .removed,
                                       baseIndex: String(0),
                                       baseLine: line,
                                       headIndex: String(0),
                                       headLine: line)
            } else {
                cLine = ComparisonLine(baseLineType: .none,
                                       baseIndex: String(0),
                                       baseLine: line,
                                       headIndex: String(0),
                                       headLine: line)
            }
            
            comparisons.append(cLine)
            
        }
        
        return comparisons
    }
    
    mutating func splitContents(){
    }

    
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
