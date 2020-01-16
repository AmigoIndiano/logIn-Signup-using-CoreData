//
//  FetchFamilyDetailsViewController.h
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface FetchFamilyDetailsViewController : ViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (strong, nonatomic)AppDelegate *delegate;
@property (strong,nonatomic)NSString *data;
@property (strong,nonatomic)NSArray *results;
@property (strong,nonatomic)NSMutableArray *temp;
@end

NS_ASSUME_NONNULL_END
