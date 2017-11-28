//
//  ViewController.m
//  TableViewWithCollectionViewDemo
//
//  Created by Liangk on 2017/11/1.
//  Copyright © 2017年 liang. All rights reserved.
//

#import "ViewController.h"
#import "FLAnimatedImageView+WebCache.h"
#import "UIImage+GIF.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "YYWebImage.h"

// 设备宽度
#define IphoneWidth [[UIScreen mainScreen] bounds].size.width
// 设备高度
#define IphoneHeight [[UIScreen mainScreen] bounds].size.height
// 间隙
#define Margin 10


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource> {
    NSArray *listArray;
}

@property (weak, nonatomic) IBOutlet UITableView *tableMainView;

@property (nonatomic, strong) UICollectionView *collectionMainView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    listArray =@[
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805544_923610.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805542_106668.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805536_358644.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805533_454105.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805499_602233.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805483_964522.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805544_923610.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805542_106668.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805536_358644.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805533_454105.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805499_602233.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805483_964522.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805544_923610.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805542_106668.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805536_358644.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805533_454105.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805499_602233.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805483_964522.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805544_923610.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805542_106668.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805536_358644.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805533_454105.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805499_602233.gif"},
                      @{@"GIFImageURL":@"http://storage.slide.news.sina.com.cn/slidenews/77_ori/2017_47/74766_805483_964522.gif"}
                      
                      ];
}



#pragma mark - tableview代理方法


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return IphoneHeight;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell;

    cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    self.collectionMainView = (UICollectionView*)[cell.contentView viewWithTag:1];
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - collectionview代理方法
#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return listArray.count;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UILabel *titleLabel = (UILabel*)[cell.contentView viewWithTag:2];
    titleLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    NSDictionary *dic = listArray[indexPath.row];
    NSURL *url = [NSURL URLWithString:[dic valueForKey:@"GIFImageURL"]];
    
    /*
     //传统意义的加载
     [imgView sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
     imgView.image = image;
     }];
     */
    
    /*
     //1. 加载本地的gif图片 (需要在故事板设置imageview的类型为FLAnimatedImageView)
     FLAnimatedImageView *imgView = (FLAnimatedImageView*)[cell.contentView viewWithTag:1];
     imgView.contentMode = UIViewContentModeScaleAspectFit;
     
     NSString * bundlePath = [[ NSBundle mainBundle] pathForResource: @ "gifBundle" ofType :@ "bundle"];
     NSString *imgPath= [bundlePath stringByAppendingPathComponent :[NSString stringWithFormat:@"/%ld.gif", indexPath.row+1]];
     
     NSData  *imageData = [NSData dataWithContentsOfFile:imgPath];
     
     imgView.animatedImage = [FLAnimatedImage animatedImageWithGIFData:imageData];

     */
    
    /*
     //2. 加载url gif 图片 (需要在故事板设置imageview的类型为FLAnimatedImageView)
     FLAnimatedImageView *imageView = (FLAnimatedImageView*)[cell.contentView viewWithTag:1];
    imageView.image = [UIImage imageNamed:@"专注.jpg"];
    
    [self loadAnimatedImageWithURL:url completion:^(FLAnimatedImage *animatedImage) {
        imageView.animatedImage = animatedImage;
    }];
     */

   /*
    //ALAssetsLibrary 转换位NSData
    FLAnimatedImageView *imgView = (FLAnimatedImageView*)[cell.contentView viewWithTag:1];
    imgView.contentMode = UIViewContentModeScaleAspectFit;

    ALAssetsLibrary *assetLibrary = [[ALAssetsLibrary alloc] init];


    void (^ALAssetsLibraryAssetForURLResultBlock)(ALAsset *) = ^(ALAsset *asset) {
        if (asset != nil) {

            ALAssetRepresentation *rep = [asset defaultRepresentation];
            Byte *imageBuffer = (Byte*)malloc(rep.size);
            NSUInteger bufferSize = [rep getBytes:imageBuffer fromOffset:0.0 length:rep.size error:nil];
            NSData *imageData = [NSData dataWithBytesNoCopy:imageBuffer length:bufferSize freeWhenDone:YES];
            FLAnimatedImage *i =  [FLAnimatedImage animatedImageWithGIFData:imageData];

            imgView.animatedImage = i;
        }
        else {
        }
    };

    [assetLibrary assetForURL:url
                  resultBlock:ALAssetsLibraryAssetForURLResultBlock
                 failureBlock:^(NSError *error) {

                 }];

    */

    
     //YYWebImage 使用
     YYAnimatedImageView *imageView = (YYAnimatedImageView*)[cell.contentView viewWithTag:1];
     imageView.yy_imageURL = url;
     
    return cell;
}

- (void)loadAnimatedImageWithURL:(NSURL *const)url completion:(void (^)(FLAnimatedImage *animatedImage))completion
{
    NSString *const filename = url.lastPathComponent;
    NSString *const diskPath = [NSHomeDirectory() stringByAppendingPathComponent:filename];
    
    NSData * __block animatedImageData = [[NSFileManager defaultManager] contentsAtPath:diskPath];
    FLAnimatedImage * __block animatedImage = [[FLAnimatedImage alloc] initWithAnimatedGIFData:nil];
    
    if (animatedImage) {
        if (completion) {
            completion(animatedImage);
        }
    } else {
        [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            animatedImageData = data;
            animatedImage = [[FLAnimatedImage alloc] initWithAnimatedGIFData:animatedImageData];
            if (animatedImage) {
                if (completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(animatedImage);
                    });
                }
                [data writeToFile:diskPath atomically:YES];
            }
        }] resume];
    }
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake((IphoneWidth - 3*Margin)/2, (IphoneWidth - 3*Margin)/2);

}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //top, left, bottom, right
    return UIEdgeInsetsMake(Margin, Margin, Margin, Margin);
}

//横行与横行之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return Margin;
}

//竖行与竖行之间的间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
