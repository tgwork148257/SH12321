//
//  CommonDefine.h
//  SH12321
//
//  Created by Tommy on 6/21/16.
//  Copyright © 2016 12321. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

typedef NS_ENUM(NSInteger, ReportDataType){
    ReportCrankCall = 0,                //举报骚扰电话
    ReportScamCall,                     //举报诈骗电话
    ReportMessage,                      //举报短信
    ReportWIFI,                         //举报WIFI
    ReportEmail,                        //举报邮件
    ReportWebsite,                      //举报网站
    ReportApp,                          //举报APP
    ReportFakeBaseStation,              //举报伪基站
    ReportPhoneNumberIndentification,   //举报手机实名制
    ReportInfoReveal,                   //举报个人信息泄露
    ReportBadNews,                      //举报不良舆情
    ReportInfringment,                  //举报知识产权侵权
    ReportOthers,                     //举报其他
};


#define timeLengthArr               @[@"3分钟以下",@"3-5分钟",@"5-10分钟",@"10分钟以上"]
#define crankFormArr                @[@"响一声就挂",@"自动语音骚扰",@"人工骚扰"]
#define crankTypeArr                @[@"色情",@"发票",@"赌博",@"违禁品",@"高利贷",@"反动",@"广告骚扰"]
#define scamTypeArr                 @[@"中奖诈骗",@"金融类诈骗",@"冒充公检法",@"冒充领导",@"网购类诈骗",@"其他"]
#define websiteTypeArr              @[@"淫秽色情",@"钓鱼诈骗",@"反动及政治敏感",@"其他"]
#define fakeBasicStationTypeArr     @[@"短信",@"电话"]

#define storeTypeArr                @[@"实体店",@"网店"]
#define internetStoreIllegalReasonArr  @[@"配送已激活卡，预选号环节不要求上传身份证扫描信息",\
                                  @"配送已激活卡，预选号环节未对上传身份信息联网核验",\
                                  @"配送已激活卡，物流环节未确认人证网上提交信息一致",\
                                  @"配送未激活卡，收卡后未上传或未联网核验本人身份信息",\
                                  @"无授权代理标志"]
#define entityStoreIllegalReasonArr  @[@"无需本人身份证原件即售卡",@"无二代证识别设备",@"无统一的授权代理标志"]

#define areaData  @[@"黄浦区",@"徐汇区",@"长宁区",@"静安区",@"虹口区",@"普陀区",@"杨浦区",@"闵行区",@"浦东区",@"宝山区",\
                                @"金山区",@"嘉定区",@"奉贤区",@"松江区",@"青浦区",@"崇明区"]

#define operatorsData  @[@"阿里",@"爱施德",@"巴士在线",@"北京青牛",@"长江",@"二六三",@"分享在线",@"凤凰石",@"凤凰资产",@"富士康",@"海尔",@"广州博元",\
                                @"国美",@"海信",@"合一信息",@"恒大和",@"红豆集团",@"华翔联信",@"话机世界",@"京东",@"朗玛",@"乐语",@"连连",@"鹏博士",@"民生电子",\
                                @"平安通信",@"日日顺",@"三五互联",@"世纪互联",@"苏宁",@"苏州蜗牛",@"天音",@"万网",@"小米",@"星美",@"银盛支付",@"用友",@"远特",\
                                @"中期",@"中兴视通",@"中邮世纪",@"中国移动",@"中国联通",@"中国电信"]

#define reportIconArr @[@"report_message",@"report_scamcall",@"report_crankcall",@"report_website",@"report_email",@"report_app",\
    @"report_fake_station",@"report_wifi",@"report_sim",@"report_userInfo",@"report_badnews",@"report_infringement",@"report_others"]


#define grayBgColor  [TGManager colorWithString:@"EEEEEE"]      //灰色背景
#define commitBtnBgColor [TGManager colorWithString:@"3DCE3D"]  //提交按钮背景
#define greenBgColor C_GREEN                                    //绿色背景
#define redTextColor [TGManager colorWithString:@"ff5a00"]
#define placeholderTextColor grayBgColor

#define C_LABEL [TGManager colorWithString:@"707070"]
#define C_INPUT [TGManager colorWithString:@"b7b7b7"]

#define F_TITLE FONTSIZE15
#define F_TEXT FONTSIZE13

static const CGFloat reportItemLabelH = 40.0F;
static const CGFloat reportItemTextFieldH = 35.0F;
static const CGFloat reportItemTextViewH = 80.0F;
static const CGFloat selectTimeViewH = 240.0F;
static const CGFloat commitBtnTopGap = 40.0F;
static const CGFloat commitBtnBottomGap = 64.0F;

static NSString *const addressPlaceholder = @"请输入详细地址";
static NSString *phoneNumberPlaceholder = @"如：02166528739，13918549752";


static NSString *const sucessShowStr = @"我们已经收到你的举报，谢谢你的参与";
static NSString *const failureShowStr = @"提交失败，请重新提交或者检查网络";

static  NSString *const nextIconImageStr = @"next_icon";
static  NSString *const selectNormalIconImageStr = @"type_normal";
static  NSString *const selectSelectedIconImageStr = @"type_selected";


#endif /* CommonDefine_h */
