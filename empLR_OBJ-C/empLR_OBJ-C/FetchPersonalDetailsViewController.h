//
//  FetchPersonalDetailsViewController.h
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
NS_ASSUME_NONNULL_BEGIN

@interface FetchPersonalDetailsViewController : ViewController
@property (strong, nonatomic) IBOutlet UILabel *lblOrg;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblDepartment;
@property (strong, nonatomic) IBOutlet UILabel *lblEmail;
@property (strong, nonatomic) IBOutlet UILabel *lblPhone;

@property (strong, nonatomic)AppDelegate *delegate;
@property(strong,nonatomic)NSString *data;
@property(strong,nonatomic)NSMutableArray *temp;
@end

NS_ASSUME_NONNULL_END
