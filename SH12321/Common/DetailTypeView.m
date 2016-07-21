//
//  DetailTypeView.m
//  SH12321
//
//  Created by Tommy on 7/4/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "DetailTypeView.h"
#import "DetailItemView.h"

@implementation DetailTypeView

+ (DetailTypeView *)initWithY:(CGFloat)y data:(ReportDataModel*)reportData superView:(UIView *)superView{
    
    DetailTypeView *view = [[DetailTypeView alloc] initWithFrame:CGRectMake(0, y, DEVICE_W, 100)];
    
//    ReportItemLabel *handleResultLabel = [ReportItemLabel initWithY:0 title:@"处理结果" superView:view];
//
//    TGView *handleResultContentView = [TGView initWithFrame:CGRectMake(0, handleResultLabel.y + handleResultLabel.height, DEVICE_W, 100) superView:view];
//    TGLabel *handleResultContentLabel = [TGLabel initWithFrame:CGRectMake(L_R_EDGE, 0, MIDDLE_W, handleResultContentView.height) text:reportData.handleResultStr textColor:C_LABEL textFont:F_TEXT textAlignment:NSTextAlignmentLeft superView:handleResultContentView];
//    handleResultContentLabel.numberOfLines = 2;
//    CGFloat itemY = handleResultContentView.y + handleResultContentView.height;
    CGFloat itemY = 0;
    switch (reportData.reportType) {
        case ReportCrankCall:
        {
            DetailItemView *sendNumberItemView = [DetailItemView initWithY:itemY title:@"骚扰电话号码" content:reportData.reportSendNumber superView:view];
            DetailItemView *acceptNumberItemView = [DetailItemView initWithY:sendNumberItemView.y + sendNumberItemView.height title:reportData.reportAcceptNumber content:reportData.reportAcceptNumber superView:view];
            DetailItemView *typeItemView = [DetailItemView initWithY:acceptNumberItemView.y + acceptNumberItemView.height title:@"骚扰类型" content:reportData.reportTypeStr  superView:view];
            DetailItemView *statusItemView = [DetailItemView initWithY:typeItemView.y + typeItemView.height title:@"骚扰形式" content:reportData.reportCrankCallStatusStr superView:view];
            DetailItemView *lengthItemView = [DetailItemView initWithY:statusItemView.y + statusItemView.height title:@"通话时长" content:reportData.reportTimeLengthStr superView:view];
            DetailItemView *timeItemView = [DetailItemView initWithY:lengthItemView.y + lengthItemView.height title:@"来电时间" content:reportData.reportTime superView:view];
            DetailItemView *contentItemView = [DetailItemView initWithY:timeItemView.y + timeItemView.height title:@"骚扰内容" content:reportData.reportContent superView:view];
            
            view.height = contentItemView.y + contentItemView.height;
            
        }
            break;
            
        case ReportScamCall:
        {
            DetailItemView *sendNumberItemView = [DetailItemView initWithY:itemY title:@"诈骗电话号码" content:reportData.reportSendNumber superView:view];
            DetailItemView *acceptNumberItemView = [DetailItemView initWithY:sendNumberItemView.y + sendNumberItemView.height title:@"被诈骗电话号码" content:reportData.reportAcceptNumber superView:view];
            DetailItemView *typeItemView = [DetailItemView initWithY:acceptNumberItemView.y + acceptNumberItemView.height title:@"诈骗类型" content:reportData.reportTypeStr superView:view];
            DetailItemView *lengthItemView = [DetailItemView initWithY:typeItemView.y + typeItemView.height title:@"通话时长" content:reportData.reportTimeLengthStr superView:view];
            DetailItemView *timeItemView = [DetailItemView initWithY:lengthItemView.y + lengthItemView.height title:@"来电时间" content:reportData.reportTime superView:view];
            DetailItemView *contentItemView = [DetailItemView initWithY:timeItemView.y + timeItemView.height title:@"诈骗内容" content:reportData.reportContent superView:view];
            
            view.height = contentItemView.y + contentItemView.height;
        }
            break;
            
        case ReportMessage:
        {
            DetailItemView *sendNumberItemView = [DetailItemView initWithY:itemY title:@"发送方号码" content:reportData.reportSendNumber superView:view];
            DetailItemView *acceptNumberItemView = [DetailItemView initWithY:sendNumberItemView.y + sendNumberItemView.height title:@"接收方号码" content:reportData.reportAcceptNumber superView:view];
            DetailItemView *contentItemView = [DetailItemView initWithY:acceptNumberItemView.y + acceptNumberItemView.height title:@"短信内容" content:reportData.reportContent superView:view];
            
            view.height = contentItemView.y + contentItemView.height;
        }
            break;
            
        case ReportWebsite:
        {
            DetailItemView *adressItemView = [DetailItemView initWithY:itemY title:@"不良网站网址" content:reportData.reportWebsiteURL superView:view];
            DetailItemView *acceptNumberItemView = [DetailItemView initWithY:adressItemView.y + adressItemView.height title:@"不良网站类型" content:reportData.reportTypeStr superView:view];
            DetailItemView *contentItemView = [DetailItemView initWithY:acceptNumberItemView.y + acceptNumberItemView.height title:@"不良网站内容" content:reportData.reportContent superView:view];
            
            view.height = contentItemView.y + contentItemView.height;
        }
            break;
            
        case ReportApp:
        {
            DetailItemView *nameItemView = [DetailItemView initWithY:itemY title:@"不良App名称" content:reportData.reportName superView:view];
            DetailItemView *sourceItemView = [DetailItemView initWithY:nameItemView.y + nameItemView.height title:@"不良App来源" content:reportData.reportAppSource superView:view];
            DetailItemView *contentItemView = [DetailItemView initWithY:sourceItemView.y + sourceItemView.height title:@"不良App描述" content:reportData.reportContent superView:view];
            
            view.height = contentItemView.y + contentItemView.height;
        }
            break;
            
        case ReportFakeBaseStation:
        {
            DetailItemView *typeItemView = [DetailItemView initWithY:itemY title:@"伪基站类型" content:reportData.reportTypeStr superView:view];
            DetailItemView *adressItemView = [DetailItemView initWithY:typeItemView.y + typeItemView.height title:@"伪基站地址" content:reportData.reportAdress superView:view];
            DetailItemView *timeItemView = [DetailItemView initWithY:adressItemView.y + adressItemView.height title:@"接收时间" content:reportData.reportTime superView:view];
            DetailItemView *contentItemView = [DetailItemView initWithY:timeItemView.y + timeItemView.height title:@"伪基站描述" content:reportData.reportContent superView:view];
            
            view.height = contentItemView.y + contentItemView.height;
        }
            break;
            
        case ReportWIFI:
        {
            DetailItemView *nameItemView = [DetailItemView initWithY:itemY title:@"不良WIFI" content:reportData.reportName superView:view];
            DetailItemView *timeItemView = [DetailItemView initWithY:nameItemView.y + nameItemView.height title:@"接收时间" content:reportData.reportTime superView:view];
            DetailItemView *adressItemView = [DetailItemView initWithY:timeItemView.y + timeItemView.height title:@"不良WIFI地址" content:reportData.reportAdress superView:view];
            
            view.height = adressItemView.y + adressItemView.height;
        }
            break;
            
        case ReportPhoneNumberIndentification:
        {
            DetailItemView *typeItemView = [DetailItemView initWithY:itemY title:@"举报类型" content:reportData.reportSendNumber superView:view];
            DetailItemView *reasonItemView = [DetailItemView initWithY:typeItemView.y + typeItemView.height title:@"违规原因" content:reportData.reportReasonTypeStr superView:view];
            DetailItemView *nameItemView = [DetailItemView initWithY:reasonItemView.y + reasonItemView.height title:@"店铺名称" content:reportData.reportName superView:view];
            DetailItemView *phoneItemView = [DetailItemView initWithY:nameItemView.y + nameItemView.height title:@"手机号码" content:reportData.reportBuyNumber superView:view];
            DetailItemView *timeItemView = [DetailItemView initWithY:phoneItemView.y + phoneItemView.height title:@"购卡时间" content:reportData.reportTime superView:view];
            DetailItemView *operatorItemView = [DetailItemView initWithY:timeItemView.y + timeItemView.height title:@"所属运营商" content:reportData.reportOperatorsTypeStr superView:view];
            
            NSString *adress;
            if (EMPTY_STRING(reportData.reportAdress)) {
                adress = reportData.reportWebsiteURL;
            }else if(EMPTY_STRING(reportData.reportWebsiteURL)){
                adress = reportData.reportAdress;
            }
            DetailItemView *adressItemView = [DetailItemView initWithY:operatorItemView.y + operatorItemView.height title:@"网址/地址" content:adress superView:view];
            DetailItemView *contentItemView = [DetailItemView initWithY:adressItemView.y + adressItemView.height title:@"骚扰内容" content:reportData.reportContent superView:view];
            
            view.height = contentItemView.y + contentItemView.height;
        }
            break;
            
        case ReportInfoReveal:
        {
            DetailItemView *contentItemView = [DetailItemView initWithY:itemY title:@"个人信息泄露" content:reportData.reportContent superView:view];
            
            view.height = contentItemView.y + contentItemView.height;
        }
            break;
            
        case ReportBadNews:
        {
            DetailItemView *contentItemView = [DetailItemView initWithY:itemY title:@"不良舆情" content:reportData.reportContent superView:view];
            
            view.height = contentItemView.y + contentItemView.height;
        }
            break;
            
        case ReportInfringment:
        {
            DetailItemView *contentItemView = [DetailItemView initWithY:itemY title:@"骚扰内容" content:reportData.reportContent superView:view];
            
            view.height = contentItemView.y + contentItemView.height;
        }
            break;
            
        case ReportOthersVC:
        {
            DetailItemView *contentItemView = [DetailItemView initWithY:itemY title:@"骚扰内容" content:reportData.reportContent superView:view];
            
            view.height = contentItemView.y + contentItemView.height;
        }
            break;
            
        default:
            break;
    }
    
    [superView addSubview:view];
    return view;
    
}

@end
