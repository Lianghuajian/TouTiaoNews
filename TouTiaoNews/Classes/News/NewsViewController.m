//
//  NewsViewController.m
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/5/29.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import "NewsViewController.h"
#import "NetWorkManager.h"
#import "ListNewsModel.h"
#import "NewsModel.h"
static NSString * const NewsCellID = @"NewsCellID";
@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong)ListNewsModel *listNews;
@end

@implementation NewsViewController
//MARK: - 懒加载属性
- (ListNewsModel *)listNews
{
    if (_listNews == nil) {
        _listNews = [[ListNewsModel alloc] init];
    }
    return _listNews;
}

//MARK: - 生命周期
-(instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
//    __weak NewsViewController* weakself = self;
    __weak typeof(self) weakself = self;
    [[NetworkManager shared] loadNews:^(Boolean success, NSArray<NewsModel*> * _Nonnull dataArray) {
        if (success) {
            for(NSDictionary *info in dataArray)
            {
                NewsModel *model = [[NewsModel alloc] init];
                //KVC
                [model configWithDictionary:info];
                [weakself.listNews appendNews:model];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakself.tableView reloadData];
            });
        }
    }];
}

//MARK: - 布局视图
-(void)setUpUI{
    //1.初始化控件
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    //2.添加自控件
    [self.view addSubview:_tableView];
    //.设置控件
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:NewsCellID];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NewsCellID];
    
    [cell setText:[_listNews newsAt:indexPath.row].author_name];
    
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listNews.count;
}



@end
