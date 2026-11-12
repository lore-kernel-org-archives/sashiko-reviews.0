Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794482575;
	b=AtBwRdBxzeeLLaBHqAEH9nDAN9bkgunxy3hHBr0z3FqPyMvZYPCGmERUJPNAlgiAlJ7E
	 IFKYaC9sIkaW2uMwoNkl5C1ZUOeSIs0irQ3/CnnvMwF9wO7MlHHBM3Zz/emrbQ5xx8USC
	 txH7rY9LtMLsg+oMMvGSdhMYX32u/H/eBZz/zrpc1S0wljNufApXMwRJYt8D+nlGeY7rb
	 HZARYPyxPZSFmpLaUZ+ijOIyG8x7TFMc0kXlzQWUC5FhrWOz+h8d8ShsyAUHe8jXssxk+
	 oN9A/q3lGKMykUKeb3A5u8QFs7dGl3ofyrWTF0cNxk+AMam+MGucoKKCnSHwaS9yHig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482575;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=3EmtcX8XafoRa35CRXrmIMtCCc0YVulX5MZaNrix4Ok=;
	b=hF4RqRUYP51PbGhxjssyqIMqRCvOgSdlCPagoxQbjwuCrk1xNPYHpYceCDib2YDzMnuu
	 PZpewKxFM89GJzq5l+K18/NYP8jcZt8pqmJYn/jtLtDrdgr9PU43RsnHR52id+ziUrcOc
	 0W+Fm7glEIY1wUJj9Bf17UN6XL/GxwKKDWcR/wli161WoRxvk6KqxkWvbUOr2EqrjzEBM
	 cXeJAvSi2Dzf8Yqk3AQpgzAIK7XXx5r1RoHLjZgQNt8XcFW81gPOyJs1bYJSwhLeiQrgt
	 vk3ZRi0pWnCCBL2Qghlb4AkNdlgs+kFinpLR8/7uuOGNK5YAF++WENAbcLce6AugIZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=EmNemTop;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=cgkJKVUY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6581D606A88F;
	Thu, 12 Nov 2026 11:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6581D606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=EmNemTop;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=cgkJKVUY
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBJD2I1862193;
	Thu, 12 Nov 2026 05:22:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=3EmtcX8XafoRa35CRX
	rmIMtCCc0YVulX5MZaNrix4Ok=; b=EmNemTopjCJSQ+8SWXhCGS6pl136p6sNAU
	jjnNKQqiekqyr1UHcu3aOofr8FtXDFyv/CPz21UZJAlUXRWLWdHUvwFxaEGQru9f
	b20h759S79emOBk/dgX0sq+U1KUC3mKr2Pju00fJQGZgbXBVkFmpl09VkokBxWXl
	lHDBlWWlLG+TOx8YuTAdYNJLhG/MkN/bN6/O2rbGg+7gJreKWUDlWCV6lL94wWnZ
	EhQac1lrxNmo7NggpoA7gOwpavVnGaboq2NLfpKfW9h6ZjIMXzBfgM5tXfaXS/d3
	9f4XQ5bTCh3l93GNR03Rcym19CijSmUTiFMGpLFjJPUwUMuFUo9w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020116.outbound.protection.outlook.com [52.101.46.116])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hwcfpg04m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 05:22:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgGggWXQdnphfYx0/QDkR6SlsnbibUO50vsO1MH09Qpt/hfx+zTDKeP6xGCcrtDKJrxO3T5X7LDjq1jbxCpWyQ7QtguUvV/EVPUU7RUefXnRsB8uVx4OSV8GAS5DAaRUok3RH30Sdu5nCUWZ06+LiSNOipLfYez0i7Moxm/3YmE1s6lJqGlWGGWwUvAb4RqapNRmqh39RHdIVYcpMB5RMbV3MR0If0ki4EgzAX8DYxwDLp2y/DblcBPXWy3GUPTTAC+51GR/eFk1SkKZ2w9TMaAZIUNssgovlwWQMMZuvU6KtVr22z2COdGEaHJTEdarIduZSnV+0Rzy0VfmwIGVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EmtcX8XafoRa35CRXrmIMtCCc0YVulX5MZaNrix4Ok=;
 b=KvJZK0cxyaG73wTb7KF8jS2D5FnM55W3Em5v0YB8fPyLI0P8wHWByBPlCaETuMWVsWNBrxl42HA9euBZD8+SdFAVcbVpw7y8t4Zk7nylR71gizG8nCbcO8Wpxa2/R1waJho9PPfLnIOenA+Xx2velbIhp9ebt88+sLYphTPvGYt7GTGS4ZjlkoSGG4ieyybNmFD7I/a6umH9IRqiugIT0956519fo+NBYFxh60dIb6FWdjKZT9sxmBGOJpw84vfVTh4CTfm/jiKeJ0rBsxQNeUeI85UyphQccJKIUOzZPHOJ7z5EamqrTiUaHGa72CbHuuEfIWITsuyVjdUpVIz7zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EmtcX8XafoRa35CRXrmIMtCCc0YVulX5MZaNrix4Ok=;
 b=cgkJKVUYmLgwjm/N/viLesCJMTdhJzn1nAufT8Jc0uGGnHGzzEiNviJNnex2VGjplS4Scim1Am4nlgRZva74Q2yQ0G9aCzuA0mGzIoCD3gIhIoFKFCIA15zvwDU+yKLjOroBpwDvG3mshDaNSWcsuslLMbTpVixJ7c+a94/xUJU=
Received: from BN9PR03CA0178.namprd03.prod.outlook.com (2603:10b6:408:f4::33)
 by SAEPR19MB317699.namprd19.prod.outlook.com (2603:10b6:802:205::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 11:22:47 +0000
Received: from BN1PEPF00018071.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::4e) by BN9PR03CA0178.outlook.office365.com
 (2603:10b6:408:f4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 12
 Nov 2026 11:22:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00018071.mail.protection.outlook.com (10.167.245.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 12 Nov 2026 11:22:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 592FB406559;
	Thu, 12 Nov 2026 11:22:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4550A820273;
	Thu, 12 Nov 2026 11:22:45 +0000 (UTC)
Date: Thu, 12 Nov 2026 11:22:44 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
Subject: Re: [PATCH 2/2] ASoC: cs42l43: Update load detect procedure for
 cs42l43b
Message-ID: <avWhhKiOK/DzfdbO@opensource.cirrus.com>
References: <20261111171032.1491717-1-ckeepax@opensource.cirrus.com>
 <20261111171032.1491717-3-ckeepax@opensource.cirrus.com>
 <sashiko-outbox-209438@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-209438@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018071:EE_|SAEPR19MB317699:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7bed05-dbe3-48a5-ab7f-08df40af46fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|61400799027|82310400026|261026140227099003|10067099003|4143699003|56012099006|11063799006|261009223027099003|261028144727099003|261026121527099003|261022105027099003|22082099003|18002099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	w7xAuwHHFut3XCe8fXWZxE7skAKv4VsvZVUhlUHAjEfRhZF+Ti4iA4BMkFG5ono72i6m63bPXsClN0BgBBx/4fyqPl3bvxkd96FxDxvmYQYjBOEd8I3zemn68+/uqB20OfkIJTDcD2QqXoFy2Q1XUGtfD7ZyUfTutcAKTTb5+4NT9uLCFCWbqtizL1/DeSE8YoAi2vOwGd+ZZmIVW+dma9DcfRdepJqa2QaSJgv1fylLqA5WEFxyw6Dw9x8ycRkYORceGUmpmMi4zexfejGsBa8c0V+twpuMkKw6OqXtdKhxSU1MqKuzJzSq8z2UA8QLCez0pNwRhXKqqWWiCo7B6A2mE6e1hp789gcg1iONbyv1RRLn/DToeyFRm4BAXvGvIAy4fSaah9EXA8pvqvyc4qPW5NlLui63EJpm58c4aYsmDefe1XkDKL7/sdCzRackxqKb2QSTnVNHvJZJn/N+Mx0ISJc3qAOqaqitu1bDR7PLoGmn8FpcgJ1UaPOpXzgqSzVSi53ALWVmhKgZ8eAe77euWA72kc823XFta9cfecxZ2THaST8u96zNJZbz9ZwMqJdX3dj5k+AHK9YxhQB6G7XemEg6afw69DQhheRx79aRkUIqoMND8e43aWRfdeL1YAF7cgoDf6oxu2R1vsjwdJbqF5x6VtpOW0tOSasnBfU7TJfK0lzy48NC3O5WceaKEzPWC73BJYj87saL0NB/oA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(61400799027)(82310400026)(261026140227099003)(10067099003)(4143699003)(56012099006)(11063799006)(261009223027099003)(261028144727099003)(261026121527099003)(261022105027099003)(22082099003)(18002099003)(16102099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Qky4SwgtMKX/sznmwzBNzkPrC+XKB2GFVp0p4LDMA/MPf6m6Sap5/XYSjHf4g7Mtz8MDS2WR5gt5te3HbbxaIFZlP74bQX75woqslBd7EnrvW2V4vwPT8SKEtahVAQKeZ+vdzEh56DJzT2XPvuB99k1k3OpUWobat4/xhI66yFnV1UEKDqdu1M0G93VCQY2jGn5VuNbP2yQfZ0ZtTtv4KFu5Pj/KnHV9GdbCSz0QrahjdlA1F16e91qz2Ey5V7+8dHBnFUm9kduyWh/C206ByfUjSi207es0AQZtHQHHT7hNlCgpG0zMPlvZvOp/UVyGgTuJejdgSgcnqJOL5twKWcT4G2DOzetFGmE4N35obwo10IbK5uX9lwuF4vhXyjMuCWDyKlHkBoX+RSaPhDfRoGlNbIWInwvW0AlenSdWEl/L+fRYR8bHqYpaUHYixjHb
X-Exchange-RoutingPolicyChecked:
	RoLD+ED7o47QlaOZweDOaugvSMfRhEmhOLMP9ClDHkq5IdzSrk2yFY81vjs3iQewDmo87S5ssB5IZgZCp02Oo6KDGT9bWEkw0tquTBAZTOVYbUizA1IhYNZfKWHqFMk7RxWYwP/EiI7JJ/CdcI5rJPrqB5xokqszSM4CidolyUI+ig1WMGRTIoaKd5+xjMtHz5fcM9nvkjgM9cCqqKpC86Hyw2NozuKsjcBdO9KDJp8+Cc6PACRq3lVrv2IqQvojkqdIO0RqXcBAU2hKHZ10HZoOLWnXKaxa53GAcgqHZdsA+ye5+nz66SAVAptEEfo0pE6mtd7/0h3HOR05icZEdw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:22:46.2305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7bed05-dbe3-48a5-ab7f-08df40af46fe
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00018071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR19MB317699
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NCBTYWx0ZWRfX2g4ZFXslJRKM
 RQfKscEcDNcrt6PnhcAu6E6T30fjgtl34tUwzeD9ij0vvo9icEQQDqnnoOCPzJUp94tbv/tqYty
 AqH+3zgmM8s1CjA5dGYx/BD1bmLr7+Gd/ckt/P7RRz1Iz1c52xdGcqgose3JNW6JZ082mFQJddd
 d1QcYs7CMNPGKBdWJxhtsUDE5eJhVhJ+j5VxuWY6bTRInr10IsgjOQqdnBz5W5JY6W9DPz8/A7I
 gRqXNZCfGHESLtEWSbpeUtSBF5Co8wfxfgZvN4msuCdNrPw9dWbBTDkMv+3JJJOeKH8CRQKT5SV
 ZaHPPRuTmsSsHV6827C6iFzc8Y0xd2DIRkoV2te5zfBkTIfU+mI5ePPZ7eo6jvRRgr0QsMZIikL
 93Nh3oCkFvwsVo4XoYlkufYVToAkxSmJXbkMIHoA8WSSwN41yk4kIPC5JgQ/tnD1cCC+D6+ZcC7
 680xYLaENlC9s6dT6QA==
X-Proofpoint-GUID: 1L1RtJHrC2utkfxyH7NKxF-eznfo2IOM
X-Proofpoint-ORIG-GUID: 1L1RtJHrC2utkfxyH7NKxF-eznfo2IOM
X-Authority-Analysis: v=2.4 cv=Woi+otfv c=1 sm=1 tr=0 ts=6af5a18b cx=c_pps
 a=ouQKzlSDvkUBIcrmkWtKoA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=nfo7bpZeE-W30gQE22IA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NCBTYWx0ZWRfXyiEn90Zk918d
 dyojlbS2DgsCaFcZyp+yGkEckoEBT1z8a1N9kPircymG+/5FBaoo3E8nzz/CaMEOobqV2CNc0hH
 Npj+WQiu273yTFgprVK4i4qbqIqopds=
X-Proofpoint-Spam-Reason: safe

On Wed, Nov 11, 2026 at 05:47:46PM +0000, sashiko-bot@kernel.org wrote:
> > +		switch (type) {
> > +		case CS42L43_TYPE_OMTP:
> > +			regmap_write(cs42l43->regmap, CS42L43B_LOAD_DET_SEL, 0x89);
> > +			break;
> > +		default:
> > +			regmap_write(cs42l43->regmap, CS42L43B_LOAD_DET_SEL, 0x98);
> > +			break;
> > +		}
> > +		break;
> > +	}
> 
> [Severity: Medium]
> Does writing CS42L43B_LOAD_DET_SEL via regmap_write() here and in
> cs42l43_stop_load_detect() cache the register in REGCACHE_MAPLE and cause
> every subsequent regcache_sync() in cs42l43_runtime_resume() to re-write
> it to hardware?

Yeah the register should be marked as readable missed the fact
that overrides precious. Will spin for this.

> > -	switch (type & CS42L43_HSDET_TYPE_STS_MASK) {
> > -	case 0x0: // CTIA
> > -	case 0x1: // OMTP
> > -	case 0x4:
> > -		return cs42l43_run_load_detect(priv, true);
> > -	case 0x2: // 3-pole
> > -		return cs42l43_run_load_detect(priv, false);
> > -	case 0x3: // Open-circuit
> > +	type &= CS42L43_HSDET_TYPE_STS_MASK;
> > +
> > +	if (type == CS42L43_TYPE_OPEN)
> >  		return CS42L43_JACK_EXTENSION;
> > -	default:
> > -		return -EINVAL;
> > -	}
> > +	else
> > +		return cs42l43_run_load_detect(priv, type);
> >  }
> 
> [Severity: Medium]
> Does replacing the switch in cs42l43_run_type_detect() cause invalid
> CS42L43_HS_STAT values (0x5..0x7) to be misclassified as a 4-pole headset
> instead of returning -EINVAL?
> 
> In cs42l43_run_type_detect(), type is initialized to 0xff and
> regmap_read(cs42l43->regmap, CS42L43_HS_STAT, &type) is not checked for
> errors; if that read fails or hardware reports 0x5..0x7, type &
> CS42L43_HSDET_TYPE_STS_MASK is passed to cs42l43_run_load_detect(), which
> now hits the default branch, enables headset bias and button detection,
> and reports CS42L43_JACK_HEADSET.  In addition, the CS42L43_TYPE_OPEN
> cases in cs42l43_start_load_detect() and cs42l43_run_load_detect() are
> unreachable because cs42l43_run_type_detect() returns
> CS42L43_JACK_EXTENSION when type == CS42L43_TYPE_OPEN.

I think we are happy with these, failing the headset detect is
not super useful. And it is safer to handle the open cases
even if at the moment we can't hit those in load detect, load
detect has historically been uses a couple of times to try and
detect what is/when something is connected to an extension cable,
so probably safer against future refactoring.

Thanks,
Charles
