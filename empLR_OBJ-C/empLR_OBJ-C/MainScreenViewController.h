//
//  MainScreenViewController.h
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN


@interface MainScreenViewController : ViewController
@property(strong,nonatomic)NSString *data;
- (IBAction)showInfo:(UIButton *)sender;
- (IBAction)addFamilyData:(UIButton *)sender;
- (IBAction)logOutBtn:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
