//
//  FetchFamilyDetailsViewController.m
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "FetchFamilyDetailsViewController.h"
#import <CoreData/CoreData.h>
#import "FetchDetailsTableViewCell.h"
@interface FetchFamilyDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
    NSArray *dictionaries;
}

@end

@implementation FetchFamilyDetailsViewController
@synthesize data,results,tblView,temp;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"FamilyDataVC Contains:%@",data);
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    context = appDelegate.persistentContainer.viewContext;
    [self.tblView setDelegate:self];
    [self.tblView setDataSource:self];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"FamilyDetails"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"email =%@",data];
    [request setPredicate:predicate];
    [request setReturnsObjectsAsFaults:NO];
    results = [context executeFetchRequest:request error:nil];
    
    //LogData
    NSLog(@"Names is %@",[results valueForKey:@"name"] );
    NSLog(@"DOB is %@",[results valueForKey:@"dob"]);
    NSLog(@"Gender is %@",[results valueForKey:@"gender"]);
    NSLog(@"Hobbies is %@",[results valueForKey:@"hobbies"]);
    NSLog(@"Profession is %@",[results valueForKey:@"profession"]);
    NSLog(@"Relations is %@",[results valueForKey:@"relation"]);
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"Amigo!");
     static NSString *CellIdentifier=@"cell";

    temp=[[results valueForKey:@"hobbies"]  objectAtIndex:indexPath.row];
    NSString *cats = [temp componentsJoinedByString:@", "];
    
    
            
    FetchDetailsTableViewCell *cell = [tblView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil)
               {
                   cell = [[FetchDetailsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
               }
            NSLog(@"amigo");
    cell.lblRelation.text =[[results valueForKey:@"relation"]objectAtIndex:indexPath.row];
            cell.lblName.text = [[results valueForKey:@"name"] objectAtIndex:indexPath.row];
            cell.lblDob.text = [[results valueForKey:@"dob"]objectAtIndex:indexPath.row];
            cell.lblGender.text = [[results valueForKey:@"gender"]objectAtIndex:indexPath.row];
            cell.lblHobbies.text =cats;
            cell.lblProfession.text = [[results valueForKey:@"profession"]objectAtIndex:indexPath.row];
            return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return results.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190;
}
@end
