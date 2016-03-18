//
//  Sample+CoreDataProperties.h
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Sample.h"

NS_ASSUME_NONNULL_BEGIN

@interface Sample (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSDecimalNumber *ident;

@end

NS_ASSUME_NONNULL_END
