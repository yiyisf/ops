#优化时间2015-01-16
#针对SELECT     (select max(submittime) from tasks where  procinstid in  ( select procinstid from tasks where  submitter = 'JXC_201502152326077349901_risk' and taskname ='start')) AS risk_time,     (select max(submittime) from tasks where  procinstid in  ( select procinstid from tasks where procdefid like 'financialAudit%' and  jsondata like '%f26f986e363712fb666a04dd32719e27%')) AS audit_time,     (select max(submittime) from tasks where taskname like '%放款'  and  jsondata like '%f26f986e363712fb666a04dd32719e27%') AS pay1_time,     (select max(submittime) from tasks where taskname like  '%出款'  and  jsondata like '%f26f986e363712fb666a04dd32719e27%') AS pay2_time from DUAL\G

ALTER TABLE npe.tasks add index multikey5(submitter,taskname);

#优化时间2015-02-26
#针对SELECT FC_WITH_APPLY_ID, BUSINESS_ID, DRAW_APPLY_ID, USER_NAME, AMOUNT, DRAW_TYPE, DRAW_BANK_ALIAS, DRAW_NO, DRAW_NAME, APPLY_TIME, APPLY_RECEIVE_TIME, DATA_NO, RISK_STATUS, STATUS, COMMENTS, RISK_SYN_TYPE, RISK_SYN_STEP, RISK_COMMENTS FROM FC_WITHDRAW_APPLY WHERE ((RISK_STATUS in (0, 2))) ORDER BY APPLY_TIME limit 0,50\G

alter table FC_WITHDRAW_APPLY add key  `MULTI_KEY5` (`RISK_STATUS`,`APPLY_TIME`);



#优化时间2015-03-15
#针对SELECT * FROM (     SELECT ACC.BUSINESS_ID, ACCOUNT.ACCOUNT_ALIAS, ACCOUNT.IS_TRANSFERING, INFO.TRAN_RESULT_STATE,     INFO.TRAN_MONEY, INFO.TRAN_TIME, INFO.TRAN_DEST_CARDNAME, INFO.TRAN_DEST_CARDNO     FROM FC_SHIFT_ACTIVE_ACCOUNT ACCOUNT     LEFT JOIN FC_BANKMSG_TRANS_RESULT_INFO INFO ON ACCOUNT.ACCOUNT_ALIAS = INFO.TRAN_CARD_ALIAS     LEFT JOIN FC_INNERC_ACCOUNT ACC ON ACCOUNT.ACCOUNT_ALIAS = ACC.ACCOUNT_ALIAS    ORDER BY INFO.TRAN_CARD_ALIAS, INFO.TRAN_TIME DESC ) A WHERE 1 = 1 AND BUSINESS_ID IN ('JXC')  GROUP BY ACCOUNT_ALIAS\G

alter table FC_BANKMSG_TRANS_RESULT_INFO add key multikey1(TRAN_CARD_ALIAS,TRAN_TIME);

#优化时间2015-09-22
#针对SELECT app.DRAW_APPLY_ID, app.BUSINESS_ID, app.STATUS, app.DRAW_BANK_ALIAS, app.USER_NAME, app.AMOUNT, app.APPLY_TIME, tmp.* FROM FC_WITHDRAW_APPLY app LEFT JOIN FC_STATISTICS_PROCESS tmp ON app.DRAW_APPLY_ID = tmp.DRAW_APPLY_ID WHERE app.BUSINESS_ID IN ('JXC') AND STATUS IN (3, 9) AND APPLY_TIME Between '2015-09-18 02:00:00' AND  '2015-09-19 02:00:00' ORDER BY APPLY_TIME;

alter table FC_STATISTICS_PROCESS add key DRAW_APPLY_ID_key(DRAW_APPLY_ID);