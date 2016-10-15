//
//  TrainViewController.m
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import "TrainViewController.h"
#import "vehicalTableViewCell.h"
#import "AppDelegate.h"
#import "Train+CoreDataClass.h"
#import "UIImageView+AFNetworking.h"



@interface TrainViewController ()

@end

@implementation TrainViewController
@synthesize fetchedResultsController = _fetchedResultsController;
- (void)viewDidLoad {
    [super viewDidLoad];
    _isTrainsorting=true;
    NSError *error;
    if (![[self fetchedResultsController] performFetch:&error]) {
        // Update to handle the error appropriately.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        exit(-1);  // Fail
    }
    
          _isWebApiCalled_Train=false;
  
    // Do any additional setup after loading the view.
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [DateValidator timeMake:@"2:46"];
    if(!_isWebApiCalled_Train)
     [self CallWebApi_Train];
}
-(AppDelegate*)getApplicatioDelegates{
    
    id appDelegate = (id)[[UIApplication sharedApplication] delegate];
    
    return appDelegate;
}


-(void)CallWebApi_Train{
        [Utilities startActivityIndicatorInView:self.view withMessage:@"please wait"];
    if ([Connection isInternetAvailable]) {
        
    
    
        [Connection CallServiceGet:WebApi_Train postData:nil qString:nil callBackBlock:^(id response){
            
            
            
            if([response isKindOfClass:[NSArray class]]){
    
            dispatch_async(dispatch_get_main_queue(), ^(void){
                  _isWebApiCalled_Train=true;
                [Utilities stopActivityIndicatorInView:self.view];
                [FetchingData deleteAllEntities:EntityTrain context:[self getApplicatioDelegates].managedObjectContext];
                [JsonParser ParseWebJsonData:[NSArray arrayWithArray:response] Entity:EntityTrain];
                
                
                
            });
                
            }else if ([response isKindOfClass:[NSDictionary class]]){
            
                //NSLog(@"%@",[response allKeys]);
                
                [Utilities stopActivityIndicatorInView:self.view];
                [Utilities showOKAlertWithTitle:@"Response Change" message:@"Response is not expected"];
            
            }
            
        }];
    }else{
        _isWebApiCalled_Train=false;
        [Utilities stopActivityIndicatorInView:self.view];
        [Utilities showOKAlertWithTitle:@"Internet" message:@"Please Check you Internet Connection"];
        
    
    }
    
}
-(IBAction)SortingUp:(id)sender{
    
    if (_isTrainsorting) {
        _isTrainsorting=false;
    }else{
        
        _isTrainsorting=true;
    }
    
    _fetchedResultsController=nil;
    
    NSError *error;
    if (![[self fetchedResultsController] performFetch:&error]) {
        // Update to handle the error appropriately.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        exit(-1);  // Fail
    }
    [_TrainTableView reloadData];
    NSLog(@"what happend");
}

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:EntityTrain inManagedObjectContext:[self getApplicatioDelegates].managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sort ;
    if (_isTrainsorting) {
      sort = [[NSSortDescriptor alloc]
                                  initWithKey:@"arivalTime" ascending:NO];
    }else{
    
      sort = [[NSSortDescriptor alloc]
                                  initWithKey:@"arivalTime" ascending:YES];
    
    }

    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:[self getApplicatioDelegates].managedObjectContext sectionNameKeyPath:nil
                                                   cacheName:nil];
    self.fetchedResultsController = theFetchedResultsController;
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
    
}



- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.TrainTableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.TrainTableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.TrainTableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.TrainTableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    [self.TrainTableView endUpdates];
}

#pragma mark - TableView Delegate and Data Source

- (void)configureCell:(vehicalTableViewCell *)mainCell atIndexPath:(NSIndexPath *)indexPath {

    Train *train = [_fetchedResultsController objectAtIndexPath:indexPath];

    [mainCell.logo setImageWithURL:[NSURL URLWithString:train.logo]];
    mainCell.priceLb.text=[NSString stringWithFormat:@"%0.2f €",train.priceEuro];
   
    mainCell.ariveTime.text=[NSString stringWithFormat:@"Arrive: %@",[DateValidator RetunTimeAsString:train.arivalTime]];
    mainCell.departTime.text=[NSString stringWithFormat:@"Depart: %@",[DateValidator RetunTimeAsString:train.departTime]];
    mainCell.destinationStop.text=[NSString stringWithFormat:@"Stops: %i",train.stops];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  
    
    vehicalTableViewCell *mainCell =nil;
    mainCell= [tableView dequeueReusableCellWithIdentifier:@"vehicalTableViewCell_Ind" forIndexPath:indexPath];
    [self configureCell:mainCell atIndexPath:indexPath];

    return mainCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}





-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    int hgt=200;
    
    
    return hgt;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id  sectionInfo =
    [[_fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

-(int)heighforMainTableview{
    
    int hgt=0;
    if(IS_IPAD)
    {
        hgt=300;
        //NSLog(@"IS_IPAD");
    }
    if(IS_IPHONE)
    {
        hgt=250;
        //NSLog(@"IS_IPHONE");
    }
    if(IS_RETINA)
    {
        hgt=250;
        // NSLog(@"IS_RETINA");
    }
    if(IS_IPHONE_4_OR_LESS)
    {
        hgt=260;
        // NSLog(@"IS_IPHONE_4_OR_LESS");
    }
    if(IS_IPHONE_5)
    {
        hgt=250;
        //NSLog(@"IS_IPHONE_5");
    }
    if(IS_IPHONE_6)
    {
        hgt=300;
        //NSLog(@"IS_IPHONE_6");
    }
    if(IS_IPHONE_6P)
    {
        hgt=320;
        //  NSLog(@"IS_IPHONE_6P");
    }
    
    return hgt;
}















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
