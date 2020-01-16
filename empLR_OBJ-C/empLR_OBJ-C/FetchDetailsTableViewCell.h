//
//  FetchDetailsTableViewCell.h
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 27/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FetchDetailsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblRelation;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblDob;
@property (strong, nonatomic) IBOutlet UILabel *lblGender;
@property (strong, nonatomic) IBOutlet UILabel *lblHobbies;
@property (strong, nonatomic) IBOutlet UILabel *lblProfession;

@end
//cell.lblRelation.text = [[results valueForKey:@"relation"]objectAtIndex:indexPath.row];
//           cell.lblName.text = [[results valueForKey:@"name"] objectAtIndex:indexPath.row];
//           cell.lblDob.text = [[results valueForKey:@"dob"]objectAtIndex:indexPath.row];
//           cell.lblGender.text = [[results valueForKey:@"gender"]objectAtIndex:indexPath.row];
//           cell.lblHobbies.text =cats;
//
//           cell.lblProfession.text = [[results valueForKey:@"profession"]objectAtIndex:indexPath.row];
//           return cell;
NS_ASSUME_NONNULL_END
