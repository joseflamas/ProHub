//
//  PullRequestDiff.swift
//  ProHub
//
//  Created by Guillermo Irigoyen on 11/22/18.
//  Copyright © 2018 Guillermo Irigoyen. All rights reserved.
//

import Foundation

struct PullRequestDiff {
    
    var rawContent : String!
    
    init(content: String) {
        rawContent = content
        
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
