Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.126
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793352456;
	b=ojo4cArH7SU2K9m19cZGuqZGBtlig9Ws2bpTQIlXPoIPIqd/Y9e7GVdqwwP28LQ3W1Sm
	 W01gge4gD1bI7IYpVEeE+EhmxrnxCcsyBjTXlMXxEa/sLI0UkeGTjbg2C4NaCRNPSKorM
	 Zlo3Em9LeI/tRe/5Sm05zPyUDlRTDiF+FzFUekM+OZqi7H2yP+sukdYG6/+qSHZrgwfTo
	 g7uJSsWNY5s9nq1U/c/elE6koaac/nJ71TMbZktACGabekyWIWFfxBcdAAlSMWG70ObUC
	 99BFIE4kVg57cV2BGHmLnzgXHE17hIagFPkI9t2hqc952LCFFYosGOW1ptLLDNkf0MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352456;
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
	bh=uRjzo/k36HqYQSv42VxyuV/s/0rrVS+B8K46dP4A5G4=;
	b=xM3j9KuL/PD7jdU3KhU1e1g27WDLOXhwf2JUHHShjZK2fiHNMHjr0VpS3AqUWtGa67MX
	 Q2ISNQLkUQlWm3J8x3L7OT8Gy7XkvHZ6CCGYPfpwDgDuuSStB0R1nJB+RETDQEY2WWEEz
	 Qrpyxiuomf5p0FgeIF9JyPbpieBwZnQ7y+6Knb8brP9jl77LylINXMOlFMuMy1EShBsD4
	 LUgJfQccUXfvUo/E5IpJBOnqHhPL7/WLzzHoQoibFmODDUTF6Zr7uSu8E5gJzaCKk8yHz
	 CC41jmkkclP15NX+hhZlNqSZKm/WFH1A43FKs9Vv8y/YGaX416VNi+wU16VSw+VcT8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=UzMDpRGX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.126
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023126.outbound.protection.outlook.com [52.101.127.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7936606A31F
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 09:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7936606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=UzMDpRGX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMfIh/MnaHdkIRuu2mJyjknBHHtdwOXbxKkb568VT/xwcAM2GlRNB4urClMYV7WhEhqZFj7B8KzkvvxNBbOi0+yIUy2PMkp1OqcsPtfyLlVyCdimRmKa+sxX/qpjgvTqdR6Xq8W4NZAQZLS30Czzl5kbwQDGvncjxKvWbo/qobVtS2OaLORCqkB17jYjNmbp2R0TKQaZXF8Th+7Hu8EA3W0HkDvK5/qPcmV5WluUdGUwMG8QpDwCAXVxRuNtusmumEmtKOtJOYkuhfrNcaykGarAiwOmE+MWkU3zuV1I7OV9FWvqAVZi2ddnqwjXBnycE2Ipxk1M3pleWjVxUqFLkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRjzo/k36HqYQSv42VxyuV/s/0rrVS+B8K46dP4A5G4=;
 b=eXrB7Y76K+uDok/Wx2bJ964H8MfH4n9APJ9G1NqTI38fhD1CwAHW+mxrpjekxGbOYu0B0d5xhH5vlQOniP48cUTSENjXqa6OMqriZgPAb6uHj3s8/0bryRjydHjWqIEASCL8WKvXwinvpeVDgu64Sgj2OdzxqEUyVcNRyACSXLbKJFiCskmNjbfZWAxv0cgUyUrNRzNi+KDNo50Cw8tOai2vo75BIGoMA1PKy3JLq40Ft+Z0a6USAAHLDh/9Hfa+fhLZ3uF1Txmpm0GsSaWCTmpP9kmmji7I97vnVUkHPRmwp0F26Y5t6WL1Uc3w8CoC0s29eEXG1gMzqkmtkpmYSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRjzo/k36HqYQSv42VxyuV/s/0rrVS+B8K46dP4A5G4=;
 b=UzMDpRGX5bgshTBZEDWfqpT6khKNBEsnRD/+O0YGAjiW5Fu9evM3cjHYxOpTq/Vs9lSil9rhYqDF5RE3y8HtZylWpc9F07IUKmtsMINC5y/0zNj6VNp0Bw3R1WwG2uxkDUWZXgIBUNCz1O6evfEqeOLwUjE/GcIKPfs4/90VWoMYi2kAuBylHAdPTA07YR6hiHa/AKWswGNEHV0RSX7CFHe1r5M1/FNVQi4P8u1t/X/I5OwG8kCZNjinyLKYKAlAzyTm8mLDBubFS3kgjwx4skFnA/egdNCJ4bTz5aBHZQqEy7l7OcHjPiha0XoVL0DfFLeamqeFg9YVWD3sUQfDWQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB7710.apcprd03.prod.outlook.com (2603:1096:400:3ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:27:31 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 09:27:31 +0000
Message-ID: <25203e40-ae4a-487c-a579-46e1c42f7917@amlogic.com>
Date: Fri, 30 Oct 2026 17:27:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: amlogic: Add Amlogic A9 I2C controller driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
References: <20261029-a9-i2c-v3-0-7b30ccc00533@amlogic.com>
 <20261029-a9-i2c-v3-2-7b30ccc00533@amlogic.com>
 <sashiko-outbox-188989@kernel.org>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <sashiko-outbox-188989@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0093.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::14) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
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
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: a8db5485-abac-4791-0379-08df3668061d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|4143699003|11063799006|56012099006|261028144727099003|261022105027099003|261026140227099003|261026121527099003|261021123027099003|261022075727099003|10067099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0dAen/pWwBcbUklHe4spr+bcgxtY20LJBWbK1ZwLcliqS1epr1AiQEVcxQmo5R3dh/frlR9E6BMKpQ5Ef30FLhCetzgV9hKdEVf8D7z7atWnnRclWWjiRC5v5zhoksOTWKbRRfNwk2lv+ZH5IC8SFivOC/wobc/K7yorC8Kaw/RYNi+cVkgcaYq6XGkMu0BdsYB7JC6fGE1FB0DVaC/UhTP9wzPX4LKK7ctd/LEkzS1asKpziuSvVvuHm9WP36wAwRc6Bt8jRrna0ltjChII4HmY/QYg0ZMuVsqvT1/m8f0auv3ZEYyR+OKP8nCM49tVNEsdNTKtGh4x50YEn7wDXEsWG/O8NZS4HyK9Efku00ZNCTl3Ezs+ceOjHLfKrCDcG7v3XAPqe2LHddJ6Rxc8bySIgkmdrJnrYNUl+7924kIqMN8TOomUTviHAu572m3L/NZzyOeeXisNtLCK4EvQGJ721ABgEo+szHW4K6eljN+Kmio0gLxG2epU913JmgqcaJF5x7oUIyvo3/xPd56HkQeG2G/tZpbzO7Ru17vreJfN38H/F0P2wf3bhYlHikFPWUJdZ75DIHmOsUSaPOQRt2dwaAKCaKDwFDDcDXiWZsVAQPuqs+DQq7up9ubVuNlmSPsr1Unm/IohFgbqOqWSv0viucmPs6FVROST4EshEVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021123027099003)(261022075727099003)(10067099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bSt4Lzh2a1pPbFFuQVpFc2xscnVabkUyelJjQXhwNGl4MVFuTitPTm80T21l?=
 =?utf-8?B?ZG1kcExKK1lZYy9SUisxVHpCWDlUbkE0WUpuemxNZUtJNklNVWtubUNZK0Zv?=
 =?utf-8?B?R3JzWGhibkxPU0ZxdjQ4MkNKL0NHMW9JRFJ6M2p4OUpqQldJRXFBSVJ5TFBs?=
 =?utf-8?B?UVVneTNIZUt0T25PeTFyOWIwT3hsMkt6eWpLcS85TGRodnZXRjliRFNNWmR6?=
 =?utf-8?B?VGUvcjFVL3lXVVJlb0p1WmFFTnVPMkVIY1Y4aExxRUJyekhhbXptM2ZicktI?=
 =?utf-8?B?TWsxN01JcW5pM292MUQ0OG1Hc2l4dHEwZERja2pNdTUyWEI5akd5Z3Avc082?=
 =?utf-8?B?RUZNVDhHOVJRaW9tdGZtWERXTkxGcmhvS0lFOFZFSU03NTgydWkzMGhTMXpv?=
 =?utf-8?B?S1BhZG01MnMrN280aER1bEZpTkVvZzB3TDkyaGdia2NoWGtCWlNQNy8yQndR?=
 =?utf-8?B?S3hBbUloWDUwcm1jeit5UFRUOXgzNnZ3RHNFMktUMHkvMXl5RURCWlk3bGUx?=
 =?utf-8?B?NU9ITlI0N3ZCSE1WdndQM25HeWFCK3FUL29Hb2xBL2NqVVk1d1ZnVkk4Tm5N?=
 =?utf-8?B?Z1dGaG80T25pRnRRaCt5ZzJaVHZIOVU3Tm5qN25OL1V5U1liaUlZZE1XYjlL?=
 =?utf-8?B?Nk9ZaFZhdkk3MzdTcG5yM0dLWE5oa0V5TFJacnhHS25xcW9XMVpqT1hmU3ZU?=
 =?utf-8?B?dW9xbm4yWFgvVGthTGRZVDBaNGQ5RUVuOUtTOTVBSUcvS3grN0ZZM0hoTjlG?=
 =?utf-8?B?UXE4UGJzdUk3U2Q3MlJBV1BmZ0xYZTYxQVZrUms4UlpIOU93L3JrakxadW1i?=
 =?utf-8?B?eEtwR2h6Y1laelVnQlAwSkhPUk1VTWhEYTZXQ2h4OWtJTFVOUjZzZHdESkF1?=
 =?utf-8?B?MU1ncTA2Q1h6UXg0Q2tkVUxVZVBGVHl0eGZ3dnMvMkJiM1pxUEY5MksrZm8w?=
 =?utf-8?B?S3F5SFU4UkFtcC9FTnBybWh6Rmd1cEdXK0x6SUJUQk81SVhpdmljOXhXcG1F?=
 =?utf-8?B?K0RMS1IrWmJtSkYxMUVZQ1JneFpwcmhnRWJ3a015cVNTNGdwUUhCOVdteWtP?=
 =?utf-8?B?bFczdEVGNk40Z0VwNDVvWVo1Z1A4ditFS3dma2hJc21aYnlWcXNOME9XWFB6?=
 =?utf-8?B?Q2wwcHBOamVjNEJpY2dyZFJMLzlRVDk4UEVhaGhXYmwydlZwQXZ2c3l3TEo0?=
 =?utf-8?B?V1MyTzA2T2tzMGg1MVVDZ2x6ZXRLOHZFMGJtdzBNa0RQc21UYmlPZ3czZm1G?=
 =?utf-8?B?U1hLUFY3L085eXdHemoxZUpzWjZ2azNXSmFXcjNxWEp2YjdjTjg3d0c5RGI0?=
 =?utf-8?B?YUZKOTdTTm5xZE40S1ZhYTZCMlFBM01vZ1gzVHNNRVV4SUtRREtHc2Y2YmVJ?=
 =?utf-8?B?OEFsNG1kb25QZ1YwbllFbCt1NlMrWjdQMjl6YXNzZTQ4akhaVUk4WVJKbXVm?=
 =?utf-8?B?ZGRFS21YaU1pS2FEaVpHRG9pbEtQYko4bmZSTVhjOFdBTDFuYWFSR2hqekNK?=
 =?utf-8?B?cXVxelVIU1dEWWVDemFQaW1mSlU4SVluV1A2dU1BYXhKeTJRMHJMUjFGajNP?=
 =?utf-8?B?YXd2d0g4aUdGTy9Fd2RhNlRIeTlBV3AvbFo4WVRSWS9ZZ0hDUEtuVW03R2Z2?=
 =?utf-8?B?dEl6L1hQOVNKeXdiMWhNUjRUTC9NMXkzMk9wYTZlT3l4MzM5R3dzNllkVUF1?=
 =?utf-8?B?bnE0ejN0OHViNW5tcUFCRkhUcVphbUZuUEdaUDRHU0R4d0xsY3Y1d3l5STRl?=
 =?utf-8?B?aG9UN0NGeGtGamJ3YWpvTE5PRktEZ3BrTTM5ZWh1bTFMNWpicTFUYndOMTZn?=
 =?utf-8?B?L2VhRUV4MWRidENBcmlxUUFaZGpDa0ZjSDRpQTFrM2xOWkxTTlJheTVZVDJO?=
 =?utf-8?B?ZVNJQVZoTkNmZjZGa1JJdnhnOCtLYm14bTh0TFowWGZlcTkweC83UUF1VzVl?=
 =?utf-8?B?amdOd2M0K3JBZkJRT3UxYUhIVGp4Vk1KQUlERHVFaElRUWkyeVhKaU5IaHdx?=
 =?utf-8?B?eHljWGtWVnhZYXo5TmZzK0tNTmc3emtnOEQ5WG9HUmtjanh5S2FnT2FUTy9L?=
 =?utf-8?B?SHYvRkEwTEpNc0gzL2Nrb3FsMmJLSlh0UEkzejBEZytYMHpYczg3Zyswck9C?=
 =?utf-8?B?aWIzS0w3WDJEN01VdE9yd1ZGWFdSdnZTMlovSk5HNFgvT1BuWW5sVzFjQWVk?=
 =?utf-8?B?dXN3UFQ5bGhITFY3MDBvNjBsSnp5L0RRYjBab1NZSm81M1dSZ1gvYUYyd1lG?=
 =?utf-8?B?L3JDcmloeTNXd0FuMjR3bmVUbkxPTjZtU2hMUlhVU00rYW10Z2dxRW1qVHZp?=
 =?utf-8?B?TEtDVFRNVzhLQTB3d0QzQjlSUkdaeTNEb0JjWERyMnZ4WG45TFRpZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8db5485-abac-4791-0379-08df3668061d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:27:31.8023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXxFy4xalH+gqhcG+IPVBetudnQPq//ZbdmocWrI6c42AWJR7MvpZcUWrJrMyYkRuUyY6wh6GFvPBQiFb8TRBP5qsRyj3u+fpUEZUkLYTSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7710

hi,

On 2026/10/29 16:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] i2c: amlogic-a9: missing threshold IRQ disable on timeout in aml_i2c_xfer_msg()
> - [Medium] i2c: amlogic-a9: transfer started before IRQ setup in aml_i2c_do_start()
> - [Medium] i2c: amlogic-a9: spurious TX FIFO write on completion in aml_i2c_irq()
> --
> 
> commit ab8bf627f35c4931f8163555b700d4cca01277db
> Author: Junyi Zhao<junyi.zhao@amlogic.com>
> 
> i2c: amlogic: Add Amlogic A9 I2C controller driver
> 
> This commit adds an I2C controller driver for Amlogic A9 SoCs, along with
> corresponding Kconfig, Makefile, and MAINTAINERS entries.
> 
>> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c-amlogic-a9.c
>> new file mode 100644
>> index 0000000000000..503511734fe26
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-amlogic-a9.c
> [ ... ]
>> +static void aml_i2c_put_data(struct aml_i2c *i2c, u8 *buf, int len)
>> +{
>> +     int i;
>> +
>> +     /* When this I2C module transfers 0 bytes, it must still send at least 1 byte. */
>> +     if (!i2c->msg->len) {
>> +             writel(0x00, i2c->regs + REG_CFG_TX);
>> +             return;
>> +     }
>> +
>> +     for (i = 0; i < len; i++, buf++)
>> +             writel(*buf, i2c->regs + REG_CFG_TX);
>> +}
>> +
>> +static void aml_i2c_prepare_xfer(struct aml_i2c *i2c, enum fifo_fill_mode mode)
>> +{
>> +     bool write = !(i2c->msg->flags & I2C_M_RD);
>> +
>> +     if (!write)
>> +             return;
>> +
>> +     i2c->count = min(i2c->msg->len - i2c->pos,
>> +                      mode == A9_FIFO_FILL_FULL ? A9_I2C_FIFO_DEPTH : A9_I2C_HALF_FIFO);
>> +     aml_i2c_put_data(i2c, i2c->msg->buf + i2c->pos, i2c->count);
>> +}
>> +
>> +static irqreturn_t aml_i2c_irq(int irqno, void *dev_id)
>> +{
> [ ... ]
>> +     switch (i2c->state) {
>> +     case A9_STATE_READ:
>> +             buf = i2c->msg->buf;
>> +             rd_len = min(i2c->msg->len - i2c->pos, A9_I2C_FIFO_DEPTH);
>> +             for (i = 0; i < rd_len; i++) {
>> +                     rd_val = readl(i2c->regs + REG_CFG_RX);
>> +                     buf[i2c->pos++] = rd_val & TX_RX_DATA;
>> +             }
>> +             /* Rx must clear thresh after read fifo */
>> +             clear_irq_status(i2c, A9_RX_THRESH_READ);
>> +             break;
>> +     case A9_STATE_WRITE:
>> +             aml_i2c_prepare_xfer(i2c, A9_FIFO_FILL_HALF);
>> +             if ((i2c->pos + A9_I2C_HALF_FIFO) >= i2c->msg->len)
>> +                     aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_TX_THRESH_WRITE, 0);
>> +             i2c->pos += i2c->count;
>> +             /* Tx must clear thresh after write fifo */
>> +             clear_irq_status(i2c, A9_TX_THRESH_WRITE);
>> +             break;
> [Severity: Medium]
> When a zero-length write message (i2c->msg->len == 0) is submitted via
> aml_i2c_xfer() -> aml_i2c_xfer_msg(), aml_i2c_prepare_xfer() calls
> aml_i2c_put_data() and writes 0x00 to REG_CFG_TX before starting the
> transfer.
> 
> When the transfer finishes and A9_PHY_DONE triggers aml_i2c_irq(), the
> A9_STATE_WRITE case runs unconditionally without checking if bytes remain to
> be written or if A9_TX_THRESH_WRITE is set. Because i2c->msg->len is still 0,
> aml_i2c_prepare_xfer() -> aml_i2c_put_data() writes a second dummy 0x00 byte
> to REG_CFG_TX during completion.
> 
> Also, given the comment in aml_i2c_put_data() noting that the hardware must
> send at least 1 byte when transferring 0 bytes, does a 0-byte transfer
> actually transmit a data byte on the bus? If the controller cannot perform
> true zero-length transfers, should aml_i2c_quirks set I2C_AQ_NO_ZERO_LEN
> since aml_i2c_func() advertises I2C_FUNC_SMBUS_EMUL (which includes SMBus
> Quick commands)?
> 

Will add flag I2C_AQ_NO_ZERO_LEN in aml_i2c_quirks.

>> +     default:
>> +             break;
>> +     }
>> +
>> +     if (!(irq_state & A9_TRANS_DONE) ||
>> +         (i2c->state == A9_STATE_READ && i2c->pos < i2c->msg->len))
>> +             goto irq_trans_out;
>> +
>> +complete_irq_out:
>> +     i2c->state = A9_STATE_IDLE;
>> +     reset_fifo_pos(i2c);
>> +     complete(&i2c->done);
>> +     aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, 0);
>> +     clear_irq_status(i2c, IRQ_ALL_MASK);
>> +irq_trans_out:
>> +     spin_unlock(&i2c->lock);
>> +
>> +     return IRQ_HANDLED;
>> +}
>> +
>> +static void aml_i2c_do_start(struct aml_i2c *i2c, struct i2c_msg *msg)
>> +{
>> +     unsigned int reg_val;
>> +     unsigned int trans_len;
>> +
>> +     trans_len = msg->len;
>> +     reg_val = (unsigned int)(((msg->addr & 0x7f) << START_SADDR_SHIFT) |
>> +                             ((msg->flags & I2C_M_RD) ? START_READ : 0) |
>> +                             ((trans_len & 0xfff) << START_LEN_SHIFT) | START_START);
>> +     aml_i2c_set_mask(i2c, REG_CFG_START,
>> +                      START_START | START_SLAVE_ADDR | START_READ | START_LEN, reg_val);
>> +     clear_irq_status(i2c, IRQ_ALL_MASK);
>> +     /* enable thresh mode */
>> +     if (trans_len > A9_I2C_FIFO_DEPTH) {
>> +             reg_val = (msg->flags & I2C_M_RD) ? A9_RX_THRESH_READ : A9_TX_THRESH_WRITE;
>> +             aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE,
>> +                              A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, reg_val);
>> +     }
>> +}
> [Severity: Medium]
> In aml_i2c_do_start(), START_START is written to REG_CFG_START before
> clear_irq_status(i2c, IRQ_ALL_MASK) is called and before the threshold
> interrupts are enabled in REG_CFG_IRQ_ENABLE.
> 
> If execution is delayed between writing REG_CFG_START and clearing
> REG_CFG_IRQ_STATE (for instance on PREEMPT_RT where spin_lock_irqsave() does
> not disable preemption, or due to an NMI or hypervisor preemption), can the
> hardware assert A9_NCK_ERROR or A9_PHY_DONE for the new transfer only for
> clear_irq_status(i2c, IRQ_ALL_MASK) to immediately wipe it out, causing
> aml_i2c_irq() to miss A9_TRANS_DONE and wait_for_completion_timeout() in
> aml_i2c_xfer_msg() to time out?
> 

This is a hardware-related issue. Some status bits can only be cleared 
during startup. Changing the initialization sequence may cause data 
transmission issues.

>> +
>> +static int aml_i2c_xfer_msg(struct aml_i2c *i2c, struct i2c_msg *msg, bool last)
>> +{
> [ ... ]
>> +     if (!time_left) {
>> +             spin_lock_irqsave(&i2c->lock, flags);
>> +             i2c->state = A9_STATE_IDLE;
>> +             clear_irq_status(i2c, IRQ_ALL_MASK);
>> +             reset_fifo_pos(i2c);
>> +             spin_unlock_irqrestore(&i2c->lock, flags);
>> +             return -ETIMEDOUT;
>> +     }
> [Severity: High]
> When a transfer with msg->len > A9_I2C_FIFO_DEPTH (32 bytes) is started,
> aml_i2c_do_start() enables A9_RX_THRESH_READ or A9_TX_THRESH_WRITE in
> REG_CFG_IRQ_ENABLE.
> 
> If that transfer times out in aml_i2c_xfer_msg(), this timeout path resets
> i2c->state, clears REG_CFG_IRQ_STATE, and resets the FIFO pointers, but
> unlike complete_irq_out in aml_i2c_irq(), it does not disable
> A9_RX_THRESH_READ | A9_TX_THRESH_WRITE in REG_CFG_IRQ_ENABLE, nor does it
> clear START_START in REG_CFG_START to halt the controller.
> 
> When a subsequent transfer with msg->len <= A9_I2C_FIFO_DEPTH runs,
> aml_i2c_do_start() skips updating REG_CFG_IRQ_ENABLE:
> 
>          if (trans_len > A9_I2C_FIFO_DEPTH) {
>                  reg_val = (msg->flags & I2C_M_RD) ? A9_RX_THRESH_READ : A9_TX_THRESH_WRITE;
>                  aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE,
>                                   A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, reg_val);
>          }
> 
> Because aml_i2c_irq() dispatches strictly on i2c->state without checking
> which bit in irq_state triggered the interrupt, won't a stale
> A9_TX_THRESH_WRITE interrupt left enabled from a timed-out write fire during
> a subsequent <= 32-byte read (i2c->state == A9_STATE_READ), causing
> aml_i2c_irq() to read from an empty REG_CFG_RX FIFO into i2c->msg->buf while
> leaving A9_TX_THRESH_WRITE uncleared?

Will add clear A9_RX_THRESH_READ | A9_TX_THRESH_WRITE enable bit after 
timeout.
