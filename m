Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.143
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793811777;
	b=bPX4pmAfqGdZA85g2fgCih5fSjBSXBP4nmR2NsQUZd1SrYv+m2exBKZjuOVKc1fDTcqS
	 HxXZoGcKdLy2k7wnRikUp2+7YNFWAhEEi93DECb3aSyJt9J9snTb+UUDu7zeTNhBZbP/G
	 DXa7O0nxtJf6xcs6fMo8aRVcW739RQuGangQCrTsZU+RVMtLoZkVAHvLbsDTKYdwEUbgB
	 FwFXsPANBsDY6OdrBkivfB4dXJLxr5YZdLiQAEbpSDc8ZlzA5CkgGC8G6hexh5qI7IjCc
	 OtZoy8t20NLjWmYQLiFUZLNrvMaAm3rp0X5EbL2QXTxeUlAO7RVFgn2ju5wrwuSkXGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811777;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uA1VfvAV5MRXPvJ+d/ZcWZAsZv+XbxSNxKa5uVfz+hg=;
	b=DVFGq4HRx/sWTwIT5En89bOp+Ly5Ks1d5sSADM0Y7PLURkf1HvKRVrmHIbfAF6VH3Q7v
	 vBHslq80jz+hWnxQOxazTpJfQJUmZRPZPWBpuJtZA0zaYdV4Db+dC0ZQoSsP7ON1K7Ah+
	 KJ0BHYLoHFQ8AMIe7iYAkMciN+jgbupcAxTbdJZEKPRVwG24BOIsptUbb2MI8zXKNCwbU
	 H9avo4vpMDNqBdYnH/us2WpuCtPsbyADF7X7nsL21fbGS8lC6jZeGmno/KyBqNBuVIPbX
	 Mn/RCVt5jJBFmnADhrq3bxrCwZ58PBWgfmCc2NF35GFED/tdfTiGCzsEczuMbDP99OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=F4aI6+Pa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.143
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020143.outbound.protection.outlook.com [52.101.84.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BA3606A31B;
	Wed,  4 Nov 2026 17:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8BA3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=F4aI6+Pa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEj0TUylMyl7AuJtrD2hiUWDynD6rnSHt5QW0L3r2mpNvTb/oq1rtrFuJzppPaoT7CGW/tIwpWHlSzfUR3yutmiJCiT4NlXdTCi1NIIxqPoook3wGDAFCtA2nKuKMpFk7be9CywXZZT5ckiQAKmOM8eotMikcF4Z1lmJ/7g9DhQACn1avkmVQmsHXYtTrZxXVssCD4KLUX3F/03E+fU6Vyqbn8Z2s+ettPS+v5LSDAts8bBEX3bVJxclonf50spiCkI48NASdjIN9MhMmVoaYi3+44PJ0wCEG90LFLG6rXWuXCYOpzmdVvKFj9xF1sAqt4NotkbvFMTZ5VxLbND2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uA1VfvAV5MRXPvJ+d/ZcWZAsZv+XbxSNxKa5uVfz+hg=;
 b=mDZcCVQOwfWRckQ7sj4BGVPSRjXnlvJVmgMgFMtVJOEYNQ3gn5C+WdsM5Y5yAUNYzIyovEtEhQUbQ5a39yKG/UsA7brb21XNy/QsheTvtMusbZvYO3vqBMZdgFTiCNd5ZYMsTpV6HdnSgDpHpp79TXBsRfm2Z+1xGztwwLlg+8MAwNF258vr0ckPD+1srHR7HUP1ryg2nqcto1y24Lrpv+510Fk1Gtj3kWI4DfxWsO8mgLpvkDGlwhQzU/ydikKdcf9Soj/JJ6TuLpUDqhG3y0ZFmJcRxPLZ9DqujEd5SbfHz8q+64Vg1wHH8VTqhXciEDYnG1MnmOHr7tDcHQPKaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uA1VfvAV5MRXPvJ+d/ZcWZAsZv+XbxSNxKa5uVfz+hg=;
 b=F4aI6+PaXaVaqneP1f12IfyMOL7gvjWDoSnYrBeXjeJ3GC4UuBFntTqStisnRfleJ1x8QR8c+XS1ijlR33bNyDMeZaQIaXto5vVVKPSeWRrsUHR3iNDsP/rflqKRJaKrBMzPTVeIfM30f+QefyhMcf08guKYgDqFB0Ha6I3JQp0EROIIqrkKijyBVzQIvQ+YVEZIzmhHvNywxy0Aqa73PWMn/AtemJoU6NipKMj9bQ7Jo1NGiPc5hWZDc6iorYrvSFgz0amgnuCrbauW8fT1cXm2zEhsqqCgIaLrf5RWI7qEG+R8a+yvSJEqx06/lUQDiPvz8leLur4Zr73oTOPOMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:159::10)
 by DB9P195MB1730.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:399::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 17:02:53 +0000
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894]) by VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894%7]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 17:02:53 +0000
Message-ID: <a9504d96-7a1b-40b4-9dc2-37f8ce92d33e@phytec.de>
Date: Wed, 4 Nov 2026 18:02:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dts: imx95-phyflex-libra-rdk: Add dts for
 phyFLEX-i.MX 95 Libra RDK
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org
References: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
 <20261030-wip-bhahn-imx95_upstreaming-v1-2-1c1cebb5be99@phytec.de>
 <sashiko-outbox-191084@kernel.org>
Content-Language: en-US
From: Benjamin Hahn <B.Hahn@phytec.de>
In-Reply-To: <sashiko-outbox-191084@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:159::10)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P195MB0623:EE_|DB9P195MB1730:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ee0f1a-9227-422d-a20a-08df3a957751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261022105027099003|261022075727099003|4143699003|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	bhrpsZsb8V2lLqLg+jXeQ+nFZVCfp5rVfwnaBRb7C918fBrNrCC29Ot4gF8kN3qYuhE8wcnuNsBuHsFqKFgD6CMNNkM2vIL3uaSYjdEKurRvTNZJYD8+nRVxAqs4rNHOlIjfcwpou2sa4q5E/IiQq2TT27vGbyaWOgYMzgVX3EU1DUSwGCb78O7MWmQxbtupNSxRrFywm19JT/ybZNm+S7i4mkjERJMIzW48/V1lXE6Q5LBf556U2qtGtToeWtbUN847hMFMtQodiCvfbmhO8C/q+2UQtkPRlh3MEyyLkg6s3LZ2RkX5Erq78w7gCd4jWBI5lDMO5Uo6d5Rm8Zl3xMy7JOGe/vSpULDpxYsbex4nH1vfQYO9m31X9tr4FcnEyZ750E4FGj9Cxkbdvc19QfIV/HmJLMZ5VkOKvjO+9cKTBukY96ugg/y4YN4MBW6Dp5O+WO/GDOZbjIyC00XOQNHOHcbmXj3f91j6QZwtdtxomKidwPsJzYXOD3MMP4W+Bfm73UrgmPqRL4HYLk6zgfKAuii40yHL0HktzapoWVqe2JVLkvFvvO2PJLL9AJwbrDabOOZu8m+CAuCudCkb5uznPN1eG4/49MEyjCXXjvmbindf50vqGJJxXahoWDiVIT4wbx+/8RptcN9I9XjOeoVKJ37CcgaCLfKrtsxf7Dk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P195MB0623.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261022105027099003)(261022075727099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUFzTFpYeTFMbHZiQUpPbHJudE5wQndkTFZaaWtPQjF5L0VhazRNNHd3QjVU?=
 =?utf-8?B?WlZJRnpBRnY4SzZKUVhlbDFWMEM1WmJyNlVTWmw0YWZNMWxQbUFiMC9Kb2lQ?=
 =?utf-8?B?eGFxdktDdGoxL1FxcW5rVGRCQ0dvMTlHbFBKNy9yNkI3OWxJTG1uMzFrbWRl?=
 =?utf-8?B?UE9UcEVEdzdscnpmU0EwaVhGVkRUS3BVZTJMaGpkdG0rNi8zMVJranN0Rjl0?=
 =?utf-8?B?WHNudmFGczFORjNjbGcySzZIaUh6UWwxcmdrUlNhOTQweEM2bGhES09Rdnk0?=
 =?utf-8?B?WnJsbWRJM1NOTjFRZDZNSXM1OU5XYVZhRHNMTGZ1WGp6QldBWHVhUDJtdG12?=
 =?utf-8?B?NEVJMGwzV2hBSlRKRHZ0VU5ydjNGUmZYL1ZvT3ptd2trVlhCUk9sU3h2SmY4?=
 =?utf-8?B?VW9Nd09SemlJSzM2Mys2cUFrWFBzaFZWU0JTOWJuVk1tREdtcUxDQXFmajZQ?=
 =?utf-8?B?VUtFdjRSVVFlR3l5SytucnhOemhuN3lMODJEdHloNEZRRVczd1dUNUI3ZHhR?=
 =?utf-8?B?aWptQk5Wdk9BWitzcFJ3M0ZOc2llVWpocG11MjdidkNzQ3hua2hCSHhRMW95?=
 =?utf-8?B?U3pZQmZ3c3JLVSttcGk3RUYrNHRkbEh2N0NwUGxuQklhOVdtT1F0WktRU21R?=
 =?utf-8?B?RUVYWTg3cHI0RlJYTllNbFNra2tpc2liMEw1TEIvWUMyRWlLTFJoZG9aaTBM?=
 =?utf-8?B?U2F6UFZKYjRqcFVKUTh5NXNXZHRUM1hDZ2NBUmNuMGpWdEY2THN6citLUkps?=
 =?utf-8?B?QWttK3ZLb0lyYnd5bXNlTk5IU0tpci9jZjVzWjdwbmNPNTdhckFDVGdMWTFo?=
 =?utf-8?B?dnplcGhvMlBTYU5vSlRQTzZZK3ZLWjAzNVpEaTFZK0x4R2FtWmplc0srTzcz?=
 =?utf-8?B?Mm1nNldGeHMzRDIvbm9jTXhzMndkUHBMN0JEb0dQekFDdVZEL1pZWVdBNGpl?=
 =?utf-8?B?L0o3bWZFUzE3aUJnVHJUaFJ6ZHN1M1VUL1hIQkI0eWUvc3RxZDdMTllqWlQ2?=
 =?utf-8?B?NkZob29QOUtEeXNwYTBCRlhza3dlU3dOSmxwRzlRRWlYTUtzNTQyZE5XQTRG?=
 =?utf-8?B?SFJMaVRMeFNZUVlmckVmQXh5UndHWE5LbUUvanJ4T0pEVUxZRHkzcnlsMHhw?=
 =?utf-8?B?OUV0MTdRVUJXdDVMWG50OU5NSmVmTXNhOHp5OVBUalR1TFNnUGZ1dWZvMEFR?=
 =?utf-8?B?YnBiTitFRy9LMzFVempreDlVRVZERkJvclM3RFFLM25PVVZKNWRnaHBCWkM5?=
 =?utf-8?B?aWV4KzNURGZvVm5mT0t2Y2YralZhTS80OU5WZU5rSjg1d3RuK3JOUEJCNHF4?=
 =?utf-8?B?UnU4MTBBWjg2SWZnN2I0TWtNR0lYVCt0K2QxNjJqMGxjRUM4bEJmbkVNUmRG?=
 =?utf-8?B?Y0ppMENURk1OQVBqQkZwL1Brajl3YkxZS2dWUVB6ajZzUEorb3N6SnRhMy9q?=
 =?utf-8?B?bE8vWlhpbnBpb3IzOEZ5VFRNdWZuZ0c5T3I2UkVOVzlKSElJTE1rRDZ6Szh0?=
 =?utf-8?B?QnY5ZlJDREU2MjBtTWxmVkFhWE5peENXRmlwUUY3R08rNXZySlBnejI0ckJm?=
 =?utf-8?B?Y1IzcGdBcEliWExxR2d3NVlKVTBRK0hubUhTUkREQWpOcGZyQU9Ob2ZjWXNP?=
 =?utf-8?B?eldmc0ZGQm1DNXdPTUZsaVN1N1ZHZkRLV0lvQnQ3MGhWMTlHYmlCZXNoL2dq?=
 =?utf-8?B?bmVCYTUvWUdPU2wrbVVIb1NIazBPUzhOU1c3UWN0VUlmNVFrUVVjRTk0S3Yw?=
 =?utf-8?B?WHBGOXl3a1FvVzJ1OGNVc3NjM0hPalJiWWovVzZudklYVzJSWHZ6UUFqQUV5?=
 =?utf-8?B?Q0dPUGJybk4rMm83OW52U3FBRVliQ1NHQ01hWS9kcmltMnIwVWVVM2ZvL0xR?=
 =?utf-8?B?NDFlWExvZEtVRnNJNGFZWlJDMUxvMXBGZWp4bFdGRE91U3Zzbm9zTmNvby9N?=
 =?utf-8?B?elVKMWtLelRBZDhqS25zR1BPZzVzQ0Q3L21PZStkaXpEalhwTEd3N3dzRlk0?=
 =?utf-8?B?MDQ1emU1dnM3Wm9odUVldmMzdy82T2dBWnpNQUsxNjRhOUNhVmRocUd3UnFj?=
 =?utf-8?B?cDNIU1JjbXA3S1NkYkkrb2lPb1BsM0Ywb0NMT0NtRW5NL0FiTEZwZ1Fid0Jj?=
 =?utf-8?B?dWUwNzhodUtmQWhjc0dxb1RlRXM1UExOVlhJYldINjdrM29mZ3F5MGgvd2My?=
 =?utf-8?B?dmEzaFZsR2tvRFFFVzMxUW5EQ1Q2R01IQm1UcEhDTzJpNkhXMElySWM3ODBm?=
 =?utf-8?B?YWwzRWxwNFNvbTM1WE9GMEhqK2ZCZGhaczlDd2tkSHp6WTJKQlZSV0RLVGl5?=
 =?utf-8?Q?RWeRy/7YPe51HXqDav?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ee0f1a-9227-422d-a20a-08df3a957751
X-MS-Exchange-CrossTenant-AuthSource: VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 17:02:53.7398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmEMJqCMlDDJVOSdcZ1anO08JnW5r/D2RUG7EdFQJMYrF/REYK72g7P0PLi52e1x/on7htFOVlorc4lrV0rFTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1730

Am 30.10.26 um 15:00 schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] arm64: dts: freescale: duplicate usdhc2-200mhzgrp node overwrites usdhc2 pins
Thanks, will correct for v2.
> - [High] arm64: dts: freescale: missing OF graph ports on M.2 connectors disables radios
As already described in my other answer, lpuart8 is also used for 
RS232/RS485 and specifiying the ports will lead to the interface not 
beeing exposed as /dev/ttyLP1, so RS232/RS485 is no longer usable. That 
is why the port is not specified.
> - [High] arm64: dts: freescale: descending cooling-levels ending in 0 breaks pwm-fan
The pwm-fan is tested and works as expected. The levels are inverted on 
our hardware. 255 is fan off (if the hardware is cold enough). 0 is fan 
on full speed.
> - [Medium] arm64: dts: freescale: misplaced external-facing and wake-gpios on pcie0/pcie1
> - [Medium] arm64: dts: freescale: stale gpio2 gpio-line-names collide with gpio_expander2

Will update/fix for v2.

Benjamin

> --
>
> commit 01cb871eca78a3c506a85dce8f3e949939c4a0cb
> Author: Benjamin Hahn <B.Hahn@phytec.de>
>
> dts: imx95-phyflex-libra-rdk: Add dts for phyFLEX-i.MX 95 Libra RDK
>
> This commit adds the device tree source files for the PHYTEC phyFLEX Libra
> RDK baseboard (revision 1618.2) and phyFLEX-i.MX 95 FPSC Gamma SoM (revision
> 1620.3).
>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi
>> new file mode 100644
>> index 0000000000000..4b37d76cced1b
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi
>> @@ -0,0 +1,736 @@
> [ ... ]
>
>> +&scmi_iomuxc {
> [ ... ]
>
>> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
>> +		fsl,pins = <
>> +			IMX95_PAD_SD2_CD_B__USDHC2_CD_B		0x31e	/* CD */
>> +			IMX95_PAD_SD2_CLK__USDHC2_CLK		0x158e	/* CLK */
>> +			IMX95_PAD_SD2_CMD__USDHC2_CMD		0x138e	/* CMD */
>> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x138e	/* DATA0 */
>> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x138e	/* DATA1 */
>> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x138e	/* DATA2 */
>> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x138e	/* DATA3 */
>> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>> +	pinctrl_usdhc3: usdhc3grp {
>> +		fsl,pins = <
>> +			IMX95_PAD_SD3_CLK__USDHC3_CLK		0x159e	/* SDIO_CLK */
>> +			IMX95_PAD_SD3_CMD__USDHC3_CMD		0x139e	/* SDIO_CMD */
>> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x139e	/* SDIO_DATA0 */
>> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x139e	/* SDIO_DATA1 */
>> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x139e	/* SDIO_DATA2 */
>> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x139e	/* SDIO_DATA3 */
>> +		>;
>> +	};
>> +
>> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
>> +		fsl,pins = <
>> +			IMX95_PAD_SD3_CLK__USDHC3_CLK		0x159e	/* SDIO_CLK */
>> +			IMX95_PAD_SD3_CMD__USDHC3_CMD		0x139e	/* SDIO_CMD */
>> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x139e	/* SDIO_DATA0 */
>> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x139e	/* SDIO_DATA1 */
>> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x139e	/* SDIO_DATA2 */
>> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x139e	/* SDIO_DATA3 */
>> +		>;
>> +	};
>> +
>> +	pinctrl_usdhc3_200mhz: usdhc2-200mhzgrp {
>> +		fsl,pins = <
>> +			IMX95_PAD_SD3_CLK__USDHC3_CLK		0x159e	/* SDIO_CLK */
>> +			IMX95_PAD_SD3_CMD__USDHC3_CMD		0x139e	/* SDIO_CMD */
>> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x139e	/* SDIO_DATA0 */
>> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x139e	/* SDIO_DATA1 */
>> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x139e	/* SDIO_DATA2 */
>> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x139e	/* SDIO_DATA3 */
>> +		>;
>> +	};
> [Severity: High]
> Should pinctrl_usdhc3_200mhz be named usdhc3-200mhzgrp instead of
> usdhc2-200mhzgrp?
>
> Because both pinctrl_usdhc2_200mhz and pinctrl_usdhc3_200mhz use the node
> name usdhc2-200mhzgrp under &scmi_iomuxc, dtc merges them into a single
> node and overwrites the SD2 fsl,pins array in pinctrl_usdhc2_200mhz with
> the SD3 pins from pinctrl_usdhc3_200mhz.
>
> When usdhc2 (which has sd-uhs-sdr104 enabled) switches to its state_200mhz
> pinctrl state, it will attempt to claim the SD3 pads instead of configuring
> the SD2 pads, breaking 200MHz SD card operation and conflicting with usdhc3.
>
> Also, both pinctrl_usdhc2_200mhz and pinctrl_usdhc3_200mhz appear to use
> 100MHz pad settings (0x158e/0x138e and 0x159e/0x139e) rather than 200MHz
> slew rate settings (such as 0x15fe/0x13fe used in pinctrl_usdhc1_200mhz).
>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts
>> new file mode 100644
>> index 0000000000000..55d49f8109567
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts
>> @@ -0,0 +1,558 @@
> [ ... ]
>
>> +	m2-key-m-connector {
>> +		compatible = "pcie-m2-m-connector";
>> +		clocks = <&rv3028>;
>> +		i2c-parent = <&lpi2c5>;
>> +		vpcie3v3-supply = <&reg_vdd_3v3>;
>> +	};
>> +
>> +	m2-key-e-connector {
>> +		compatible = "pcie-m2-e-connector";
>> +		clocks = <&rv3028>;
>> +		i2c-parent = <&lpi2c3>;
>> +		sdio-reset-gpios = <&gpio_expander2 6 GPIO_ACTIVE_LOW>;
>> +		sdio-wake-gpios = <&gpio_expander2 5 GPIO_ACTIVE_LOW>;
>> +		uart-wake-gpios = <&gpio_expander1 13 GPIO_ACTIVE_LOW>;
>> +		vpcie3v3-supply = <&reg_vdd_3v3>;
>> +		w-disable1-gpios = <&gpio_expander1 9 GPIO_ACTIVE_LOW>;
>> +		w-disable2-gpios = <&gpio_expander1 10 GPIO_ACTIVE_LOW>;
>> +	};
> [Severity: High]
> Are the OF graph ports missing from m2-key-m-connector and
> m2-key-e-connector?
>
> When pwrseq_pcie_m2_probe() in drivers/power/sequencing/pwrseq-pcie-m2.c
> probes m2-key-e-connector, it requests w-disable1-gpios and w-disable2-gpios
> with GPIOD_OUT_HIGH, asserting the active-low W_DISABLE1# and W_DISABLE2#
> lines and disabling the M.2 module's Wi-Fi and Bluetooth radios:
>
> drivers/power/sequencing/pwrseq-pcie-m2.c:pwrseq_pcie_m2_probe() {
> 	...
> 	ctx->w_disable1_gpio = devm_gpiod_get_optional(dev, "w-disable1",
> 						       GPIOD_OUT_HIGH);
> 	...
> 	ctx->w_disable2_gpio = devm_gpiod_get_optional(dev, "w-disable2",
> 						       GPIOD_OUT_HIGH);
> }
>
> Those lines are only deasserted when a consumer matches via
> pwrseq_pcie_m2_match(), which walks the connector's OF graph endpoints via
> for_each_endpoint_of_node(ctx->of_node, endpoint). Without the ports nodes
> linking m2-key-e-connector and m2-key-m-connector to the PCIe Root Ports,
> UART, and SDIO controller (which are also required by
> pcie-m2-e-connector.yaml and pcie-m2-m-connector.yaml), no consumer can
> match and the radios remain permanently disabled.
>
>> +	osc_mclk: oscillator-mclk {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-frequency = <19200000>;
>> +		status = "disabled";
>> +	};
>> +
>> +	osc_mclk_gated: oscillator-mclk-gated {
>> +		compatible = "gpio-gate-clock";
>> +		#clock-cells = <0>;
>> +		clocks = <&osc_mclk>;
>> +		enable-gpios = <&gpio_expander1 8 GPIO_ACTIVE_HIGH>;
>> +		status = "disabled";
>> +	};
>> +
>> +	fan: pwm-fan {
>> +		compatible = "pwm-fan";
>> +		interrupt-parent = <&gpio1>;
>> +		interrupts = <4 IRQ_TYPE_EDGE_RISING>;
>> +		#cooling-cells = <2>;
>> +		/* startup 35%, duty cycle 30%-100%;
>> +		 * polarity inversion does not appear to work
>> +		 */
>> +		cooling-levels = <255 166 96 0>;
>> +		/* fan-supply = <&reg_vdd_5v0>;  probe fails with this set */
>> +		pwms = <&tpm5 3 86958 0>;
>> +		pulses-per-revolution = <2>;
>> +	};
> [Severity: High]
> Will cooling-levels = <255 166 96 0> turn the fan off when the thermal zone
> reaches its highest temperature trip point (trip4 at 75C)?
>
> In drivers/hwmon/pwm-fan.c, __set_pwm() treats a PWM value of 0 as fan
> power-off rather than driving a 0% duty cycle:
>
> drivers/hwmon/pwm-fan.c:__set_pwm() {
> 	...
> 	if (pwm > 0) {
> 		...
> 		state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
> 		ret = pwm_apply_might_sleep(ctx->pwm, state);
> 		if (ret)
> 			return ret;
> 		ret = pwm_fan_power_on(ctx);
> 	} else {
> 		ret = pwm_fan_power_off(ctx, false);
> 	}
> 	...
> }
>
> When cooling state 3 selects cooling-levels[3] == 0, pwm_fan_power_off() sets
> state->enabled = false. In drivers/pwm/pwm-imx-tpm.c, pwm_imx_tpm_apply_hw()
> disables the TPM5_CH3 output driver when state->enabled is false, allowing the
> pad pull-up on IMX95_PAD_GPIO_IO26__TPM5_CH3 (0x51e) to pull the inverted PWM
> line high and stop the fan at 75C.
>
> Additionally, pwm_fan_probe() sets the initial state to
> cooling_levels[pwm_fan_max_state] (0), so the PWM channel is not enabled at
> boot, and pwm_fan_update_state() expects cooling-levels to be ordered in
> ascending order. Using a non-zero minimum value (such as 1) or configuring
> active-high/inverted PWM handling would avoid disabling the channel at state 3.
>
> [ ... ]
>
>> +&gpio2 {
>> +	gpio-line-names = "", "", "", "", "",
>> +			  "", "", "", "", "",
>> +			  "", "", "", "", "",
>> +			  "", "RGMII2_nINT", "GPIO4", "RTC_INT", "",
>> +			  "LVDS1_BL_EN";
>> +};
>> +
>> +&lpi2c1 {
>> +	temperature-sensor@4f {
>> +		compatible = "nxp,p3t1755";
>> +		reg = <0x4f>;
>> +		vs-supply = <&reg_vdd_1v8>;
>> +	};
>> +};
>> +
>> +&lpi2c3 {
>> +	status = "okay";
>> +
>> +	gpio_expander2: gpio@21 {
>> +		compatible = "ti,tcal6416";
>> +		reg = <0x21>;
>> +		interrupt-parent = <&gpio2>;
>> +		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
>> +		#interrupt-cells = <2>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +		gpio-line-names = "CAN1_STBY", "CAN2_STBY", "NC",
>> +				  "KEY-E_nALERT", "KEY-M_nALERT",
>> +				  "SDIO_nWAKE", "SDIO_nRESET", "HDMI_EN",
>> +				  "RTC_nINT", "LVDS1_BL_EN", "SFP_TX_FAULT",
>> +				  "SFP_TX_DISABLE", "SFP_MOD_ABS", "SFP_RS0",
>> +				  "SFP_RX_LOSS", "SFP_RS1";
> [Severity: Medium]
> Should the &gpio2 gpio-line-names override in imx95-phyflex-libra-rdk.dts be
> dropped?
>
> On the SoM (imx95-phyflex-fpsc-g-som.dtsi), GPIO2 lines 18 and 20 are muxed to
> SPI3_CS and SPI3_MOSI for lpspi4, while on the baseboard RTC_nINT and
> LVDS1_BL_EN are on gpio_expander2 lines 8 and 9. Keeping "RTC_INT" and
> "LVDS1_BL_EN" on &gpio2 duplicates the "LVDS1_BL_EN" line name and causes
> userspace lookups by name to match gpio2 line 20 instead of gpio_expander2
> line 9.
>
> [ ... ]
>
>> +/* M.2 Key-E PCIe */
>> +&pcie0 {
>> +	external-facing;
>> +	supports-clkreq;
>> +	wake-gpios = <&gpio_expander1 11 GPIO_ACTIVE_LOW>;
>> +	status = "okay";
>> +};
>> +
>> +&pcie0_port0 {
>> +	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>> +	vpcie3v3-supply = <&reg_vdd_3v3>;
>> +};
>> +
>> +/* M.2 Key-M PCIe */
>> +&pcie1 {
>> +	external-facing;
>> +	supports-clkreq;
>> +	wake-gpios = <&gpio_expander1 12 GPIO_ACTIVE_LOW>;
>> +	status = "okay";
>> +};
>> +
>> +&pcie1_port0 {
>> +	reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
>> +	vpcie3v3-supply = <&reg_vdd_3v3>;
>> +};
> [Severity: Medium]
> Should external-facing and wake-gpios be placed on &pcie0_port0 and
> &pcie1_port0 rather than on &pcie0 and &pcie1?
>
> In drivers/pci/of.c, pci_set_bus_of_node() only checks external-facing when
> bus->self is non-NULL (reading from the Root Port node rather than the host
> bridge node), and pci_configure_of_wake_gpio() requests wake-gpios from the
> enumerated pci_dev's OF node (&pcie0_port0 and &pcie1_port0). The
> fsl,imx6q-pcie.yaml binding also only allows pci-pci-bridge.yaml properties
> like external-facing and wake-gpios on the Root Port child node.
>
