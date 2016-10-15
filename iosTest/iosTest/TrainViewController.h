//
//  TrainViewController.h
//  iosTest
//
//  Created by Aftab on 13/10/2016.
//  Copyright © 2016 Waja Information Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrainViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *TrainTableView;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, assign)BOOL isWebApiCalled_Train;
@property (nonatomic, assign)BOOL isTrainsorting;

-(IBAction)SortingUp:(id)sender;
@end
