//
//  LayerViewController.m
//  CLY
//
//  Created by chenliangyu on 15/2/4.
//  Copyright (c) 2015年 ioschen. All rights reserved.
//

#import "LayerViewController.h"
#import "YYMylayer.h"
@implementation LayerViewController

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //1.绘制图形
    //画一个圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
    //设置属性（颜色）
    //    [[UIColor yellowColor]set];
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
    //2.渲染
    CGContextFillPath(ctx);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
//    CALayer有2个非常重要的属性
//    position用来设置CALayer在父层中的位置  以父层的左上角为原点(0, 0)
//    
//    anchorPoint;称为“定位点”、“锚点”  决定着CALayer身上的哪个点会在position属性所指的位置
//    以自己的左上角为原点(0, 0) 它的x、y取值范围都是0~1，默认值为（0.5, 0.5）
//    没有设置锚点。默认的锚点位置为（0.5，0.5）
  
    
//    每一个UIView内部都默认关联着一个CALayer，我们可用称这个Layer为Root Layer（根层）
//    所有的非Root Layer，也就是手动创建的CALayer对象，都存在着隐式动画
//    当对非Root Layer的部分属性进行修改时，默认会自动产生一些动画效果
//    而这些属性称为Animatable Properties(可动画属性)
//
//    列举几个常见的Animatable Properties：
//    bounds用于设置CALayer的宽度和高度。修改这个属性会产生缩放动画
//    backgroundColor用于设置CALayer的背景色。修改这个属性会产生背景色的渐变动画
//    position用于设置CALayer的位置。修改这个属性会产生平移动画
    
    
    //1.创建自定义的layer
    YYMylayer *layerw=[YYMylayer layer];
    //2.设置layer的属性
    layerw.backgroundColor=[UIColor brownColor].CGColor;
    layerw.bounds=CGRectMake(0, 0, 100, 300);
    layerw.anchorPoint=CGPointZero;
    layerw.position=CGPointMake(10, 300);
    layerw.cornerRadius=20;
    layerw.shadowColor=[UIColor blackColor].CGColor;
    layerw.shadowOffset=CGSizeMake(10, 20);
    layerw.shadowOpacity=0.6;
    
    [layerw setNeedsDisplay];
    //在自定义layer中的-(void)drawInContext:方法不会自己调用，只能自己通过setNeedDisplay方法调用，在view中画东西DrawRect:方法在view第一次显示的时候会自动调用。
    //3.添加layer
    [self.view.layer addSublayer:layerw];
    

//    - (void)drawRect:(CGRect)rect
//    {
//        //1.获取上下文
//        CGContextRef ctx=UIGraphicsGetCurrentContext();
//        //2.绘制图形
//        CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
//        //设置属性（颜色）
//        //    [[UIColor yellowColor]set];
//        CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
//        
//        //3.渲染
//        CGContextFillPath(ctx);
//        //在执行渲染操作的时候，本质上它的内部相当于调用了下面的方法
//        [self.layer drawInContext:ctx];
//    }
//    在UIView中绘制图形，获取的上下文就是这个view对应的layer的上下文。在渲染的时候，就是把图形渲染到对应的layer上。
//    在执行渲染操作的时候，本质上它的内部相当于执行了 [self.layer drawInContext:ctx];
    
    
    //第二种方式
    //设置CALayer的delegate，然后让delegate实现drawLayer:inContext:方法，当CALayer需要绘图时，会调用delegate的drawLayer:inContext:方法进行绘图。
    //1.创建自定义的layer
    CALayer *layer=[CALayer layer];
    //2.设置layer的属性
    layer.backgroundColor=[UIColor brownColor].CGColor;
    layer.bounds=CGRectMake(0, 0, 200, 150);
    layer.anchorPoint=CGPointZero;
    layer.position=CGPointMake(100, 100);
    layer.cornerRadius=20;
    layer.shadowColor=[UIColor blackColor].CGColor;
    layer.shadowOffset=CGSizeMake(10, 20);
    layer.shadowOpacity=0.6;
    
    //设置代理
    layer.delegate=self;
    [layer setNeedsDisplay];
    //3.添加layer
    [self.view.layer addSublayer:layer];
    //不能再将某个UIView设置为CALayer的delegate因为UIView对象已经是它内部根层的delegate，再次设置为其他层的delegate就会出问题。
    //在设置代理的时候，它并不要求我们遵守协议，说明这个方法是nsobject中的，就不需要再额外的显示遵守协议了。
    //以后如果要设置某个类的代理，但是这个代理没要求我们遵守什么特定的协议，那么可以认为这个协议方法是NSObject里边的。
    
    /*
    三、补充说明
    （1）无论采取哪种方法来自定义层，都必须调用CALayer的setNeedsDisplay方法才能正常绘图。
    （2）详细现实过程：
    当UIView需要显示时，它内部的层会准备好一个CGContextRef(图形上下文)，然后调用delegate(这里就是UIView)的drawLayer:inContext:方法，并且传入已经准备好的CGContextRef对象。而UIView在drawLayer:inContext:方法中又会调用自己的drawRect:方法。平时在drawRect:中通过UIGraphicsGetCurrentContext()获取的就是由层传入的CGContextRef对象，在drawRect:中完成的所有绘图都会填入层的CGContextRef中，然后被拷贝至屏幕。
    */
    
    
    
    
    CALayer *layerb=[CALayer layer];
    layerb.backgroundColor=[UIColor yellowColor].CGColor;
    layerb.bounds=CGRectMake(0, 0, 100, 100);
    layerb.anchorPoint=CGPointZero;
    [self.view.layer addSublayer:layerb];
    
    CALayer *layera=[CALayer layer];
    layera.backgroundColor=[UIColor redColor].CGColor;
    layera.bounds=CGRectMake(0, 0, 100, 100);
    [self.view.layer addSublayer:layera];
    
    
    NSLog(@"star-%@",self.view.layer.sublayers);
    //1.创建一个layer
    //CALayer *layer=[[CALayer alloc]init];//使用对象方法创建
    CALayer *layerq=[CALayer layer];//使用类方法创建
    //2.设置layer的属性(一定要设置位置，颜色属性才能显示出来)
    layerq.backgroundColor=[UIColor brownColor].CGColor;
    layerq.bounds=CGRectMake(100, 320, 200, 200);
    layerq.position=CGPointMake(100, 100);
    layerq.anchorPoint=CGPointMake(0, 0);
    //3.把layer添加到界面上
    [self.view.layer addSublayer:layerq];
    NSLog(@"end-%@",self.view.layer.sublayers);
    
    
    //添加一个显示图片的图层
    Mylayer=[CALayer layer];
    Mylayer.bounds=CGRectMake(100, 100, 100, 100);
    Mylayer.backgroundColor=[UIColor brownColor].CGColor;
    Mylayer.position=CGPointMake(100, 100);
    Mylayer.anchorPoint=CGPointZero;
    //设置需要显示的图片
    Mylayer.contents=(id)[UIImage imageNamed:@"3"].CGImage;//这里用的是UIImage的CGImage属性，是一种CGImageRef类型的数据
    Mylayer.cornerRadius=10;//设置圆角半径为10
    Mylayer.masksToBounds=YES;//如果设置了图片，那么需要设置这个属性为YES才能显示圆角效果
    Mylayer.borderWidth=3;//设置边框
    Mylayer.borderColor=[UIColor brownColor].CGColor;
    [self.view.layer addSublayer:Mylayer];
    
    
    
    
    //CALayer通过sublayers属性访问所有的子层
    NSLog(@"%@",self.view.layer.sublayers[2]);
    NSLog(@"%@",Mylayer);
    
    //CALayer也可以通过superlayer属性访问父层
    NSLog(@"%@",Mylayer.superlayer);
    NSLog(@"%@",self.view.layer);
    //UIView可以通过subviews属性访问所有的子视图，类似地，CALayer也可以通过sublayers属性访问所有的子层
    //UIView可以通过superview属性访问父视图，类似地，CALayer也可以通过superlayer属性访问父层
    
    //打印所有的layer
    NSLog(@"%@",self.view.layer.sublayers);
    //如果一个控件是另外一个控件的子控件，那么这个控件的layer也是另一个控件的子layer。
    
    
    
    iconView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 230, 100, 100)];
    iconView.image=[UIImage imageNamed:@"2"];
    [self.view addSubview:iconView];
    
    iconView.layer.borderColor=[UIColor brownColor].CGColor;
    iconView.layer.borderWidth=5;//设置图片layer的边框宽度和颜色
    iconView.layer.cornerRadius=20;//设置layer的圆角
    iconView.layer.masksToBounds=YES;//设置超过子图层的部分裁减掉
    
    customView=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    customView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:customView];

    customView.layer.borderWidth=20;//设置边框的宽度为20
    customView.layer.borderColor=[UIColor greenColor].CGColor;//设置边框的颜色
    customView.layer.cornerRadius=20;//设置layer的圆角
    customView.layer.contents=(id)[UIImage imageNamed:@"1"].CGImage;//在view的图层上添加一个image，contents表示接受内容
    //contents是id类型，可以接受内容，上面的实例让layer显示一张图片，仔细观察可以发现四个圆角的部分露了一个角出来
    //产生的原因是因为设置的image不是展示在主图层上的，而是显示在子图层上的。可以通过设置一个范围，设置超出主图层的部分把它给剪切掉
    //有以下两种方法，建议使用layer中的方法（第二种）self.customView.layer.masksToBounds=YES
    //customView.clipsToBounds=YES;UI框架中使用的方法//layer中不能直接接受UI框架中的东西
    //customView.layer.masksToBounds=YES;//设置超过子图层的部分裁减掉
    
    
    //设置阴影不光需要设置阴影颜色，还应该设置阴影的偏移位和透明度。
    //因为如果不设置偏移位的话，那么阴影和layer完全重叠，且默认透明度为0（即完全透明）
    customView.layer.shadowColor=[UIColor blackColor].CGColor;//设置阴影的颜色
    customView.layer.shadowOffset=CGSizeMake(15, 5);//设置阴影的偏移量，如果为正数，则代表为往右边偏移
    customView.layer.shadowOpacity=0.6;//设置阴影的透明度(0~1之间，0表示完全透明)
    //如果设置了超过主图层的部分减掉，则设置阴影不会有显示效果
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //iconView.transform=CGAffineTransformMakeTranslation(0, -100);//通过uiview设置（2D效果）
    //iconView.layer.transform=CATransform3DMakeTranslation(100, 20, 0);//通过layer来设置（3D效果,x，y，z三个方向）
    
    //通过KVC来设置
    NSValue *v=[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(100, 20, 0)];
    [iconView.layer setValue:v forKeyPath:@"transform"];
    //如果是只需要设置在某一个方向上的移动，可以参考下面的代码
    //在x的方向上向左移动100
    [iconView.layer setValue:@(-100) forKeyPath:@"transform.translation.x"];
    
    //旋转
    iconView.layer.transform=CATransform3DMakeRotation(M_PI_4, 1, 1, 0.5);
    
    
    
    
    
    //1隐式动画
    Mylayer.bounds=CGRectMake(0, 0, 200, 60);
    Mylayer.backgroundColor=[UIColor yellowColor].CGColor;
    
    
    
    //2关闭隐式动画：
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    //隐式动画
    Mylayer.bounds=CGRectMake(0, 0, 200, 60);
    Mylayer.backgroundColor=[UIColor yellowColor].CGColor;
    [CATransaction commit];
    //如何查看CALayer的某个属性是否支持隐式动画？可以查看头文件，看有没有Animatable，如果有则表示支持。
}
@end