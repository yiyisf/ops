ALTER TABLE video.video_recharge modify  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '非业务主键ID';
ALTER TABLE video.video_recharge modify  `uid` int(10) NOT NULL COMMENT '用户ID';
ALTER TABLE video.video_recharge modify  `points` int(10) NOT NULL COMMENT '充值钻石数';
ALTER TABLE video.video_recharge modify  `created` datetime NOT NULL COMMENT '订单创建时间';
ALTER TABLE video.video_recharge modify  `order_id` varchar(128) NOT NULL COMMENT '订单ID';
ALTER TABLE video.video_recharge modify  `pay_type` int(10) DEFAULT NULL COMMENT '充值方式：1 银行转账、2 抽奖  3 （未使用）   4 后台充值 5 充值赠送';
ALTER TABLE video.video_recharge modify  `pay_status` smallint(2) NOT NULL DEFAULT '1' COMMENT '充值状态： 1 成功  2 等待支付';
ALTER TABLE video.video_recharge modify  `nickname` varchar(40) DEFAULT NULL COMMENT '充值时 使用昵称';
ALTER TABLE video.video_recharge modify  `pay_id` varchar(128) DEFAULT NULL COMMENT '财务充值ID';
ALTER TABLE video.video_recharge COMMENT'充值流水表（订单表）';