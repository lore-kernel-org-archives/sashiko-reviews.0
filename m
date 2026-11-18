Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.143
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795034420;
	b=IPh/dA0XzRtIx3+yRj1s/GWHHsloOPhi9c2GHZXXWd0tHCDnxVDrsBFwey6y9iwJp9/u
	 M0fItSLB/lmtOWHk3PuaExFr3zrcKf2kkWBFves0W3eoBsXaIpEcXNz5k+vEWAbXkdlGl
	 TATFXfQ0oqDFg6Kjj3GFyuC2Iiv3ZDSty3Ws8viapSCzpaAebZtRKoh/oHBxoovl6KPk6
	 3V6t7gkFTFWjMMBkYFxwssfN9nIQbC8vU5F2rz4qMUnyor1Wjb32Gu1ppJhxAYhzLeiGW
	 VZ5Bgyl3kRPczEmfKeVYXVzmQDzDWQg3b+sgdBTVVvMI2yXEsc8PPbnYlDpmd1OgmDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034420;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
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
	bh=d8rquWTazZ5G8aGa44Uo1MnSmHARaJ15nMAitm9qRQU=;
	b=O3Hezu7+KUcxhC3Wq+Y/fvKAZ43z/x3L7FYvoGCOq7aTam7rjcuYILbjhPqqgkUlqEL1
	 5jQNxUgbgU1LJp718IuqyRxIwlng2fyNX88aqGqFfBw10gZ/kSnLifRYbHu+YRAu2mh7n
	 ZGZtssastx/Q4FirE+qwO1lXgS5Dx7bc7UuQsjyTvOWRompknw2a2Up/otrNJczIqkEuW
	 /uvW9PjNTlJmKVshYoBMZG+1hTd5gRXrxl+eKTZgzso4dGe87dOElu+beFzE8y+wM94Aa
	 Q+HFKFAl27utflKJLTYC21COAkO3sbLakH5EIfBhiTWHKQ+30tmQ0w+YSAAl/k9oF4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=BUflXr28;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.143
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022143.outbound.protection.outlook.com [40.107.193.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D56606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 20:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D56606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=BUflXr28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKdWDC4AEBk2Hcf/+7yXG8kZ+O8lQe87nnHRZUzrqqs8aKgxlc47T6G3UxAk/u7yVjAHLmut17VwKgNMjEf8H7wK+x0VPY7Hu8RYoZg9zR9t7ll2C19MVi1rKdKLD39ffmMwM2zUvKD5eMnOPjTgb2oa/xH8//eAvS0c0gkF46bsd+Z2VHHWxyY4p+xydW6/umy1rr5vplE6oWi0/I0IjBMKb+OQlooTgFPxE0KeFjdivMAGm5ZGuxxlu5nDd6UiprfYrB1EslAjyFknftIpdf60CmAy2fSWI5lMNcmZ2dqz0aKPVOh/27pNepu23UnM/EVhC9asjKS+SyFoauSIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8rquWTazZ5G8aGa44Uo1MnSmHARaJ15nMAitm9qRQU=;
 b=mwSdsyfnZmUyOYRKkas9xHfL7p9Rs3o+Y4S/26CKfsAkG6Zji6TDTyPZfpCERb767m5R0Tu8x67ZEafm92JlmRmxXZcDTm66qxrG4AM3BbWcqg+oHJhlaok/MVe/qM1RXydY2PohqwU0mYTVO33VzUlCflmJ2GP52YZmdTL/CpC8VXMgkfohHQWwKr/BjOWu7fUjL17L6GYyU/Z/Yr0YTknh1V78x6zg/xT/9of7d9p56C5LOIqjCDTsAi3lmamlBlCuR6j/SqAs9uhkCGq8JZKRL37pNr7A3Ikc1/xFkG08FlvZGiMBftcNncXJPTAv0LAExMhAIsPBdJryTfLUjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8rquWTazZ5G8aGa44Uo1MnSmHARaJ15nMAitm9qRQU=;
 b=BUflXr28xaoI3uHNG0lO4VDJWrUIhZZs4weFVsBrxUad1/uBnR3WM51vwGP2GGKPIjgBa+hk/b3YTDiuVwvwK7VMQbVKj9pjHcuif1VoWKpkZq28+6BPxOeN10lM5ZJTHhd8CwJiE6SBCTAGKXaeXPaODAKBRyjHRwIqQG/XTJcrchqQE/6Vb93iEG01201a7SFsmObBjcDgUMdYyPe1vvh54lYAEQJqU5cWhoI6LuKV84kY4RSwIYvfC+QZR5MYDYKMw7lzpZZIe6qp0cMDyOJBWZxpMou9nqASnljeDjwH29FfXNYgGJJ5Cjdau3QNvjL7uHhrfL91g1xeWH0oXw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YT2PR01MB6029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:59::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:40:18 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:40:18 +0000
Message-ID: <049bdfaa-2e0a-4536-9552-a6d609f1e3a9@efficios.com>
Date: Wed, 18 Nov 2026 15:40:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] selftests/rseq: Test affinity changes while a task
 replaces or drops its mm
To: sashiko-reviews@lists.linux.dev, tglx@kernel.org, peterz@infradead.org
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 paulmck@kernel.org, boqun@kernel.org, shuah@kernel.org, kees@kernel.org,
 viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, oleg@redhat.com,
 bestswngs@gmail.com, xmei5@asu.edu, xujiakai24@mails.ucas.ac.cn,
 linux-mm@kvack.org
References: <cover.1794932121.git.mathieu.desnoyers@efficios.com>
 <ccc2a6c50429b1ad9c8d5cc45ec8e58c12df7fde.1794932121.git.mathieu.desnoyers@efficios.com>
 <sashiko-outbox-221459@kernel.org>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-221459@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0021.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::27) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YT2PR01MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 8207e728-fac5-4185-de7f-08df45b42870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|6133799003|22082099003|18002099003|261009223027099003|56012099006|4143699003|261026121527099003|261102123227099003|10067099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	2e/XpcRoqa618ESVIc2RbVKcE2VzMU/Nx+S0tHd2+u4NVn6lRra+Y6Db8IdVzBacfwKEFp5vcjRg/sddyU8lD8mhVlup2ImTEGhTH2wh6S1LX/iSLJ1G/O/Upt7sGlvRj2Q85W9hlPqVkhY4/YixKOHZ/7A1H71yTMgIv1iGBNqZNP1imhxkFTmSyBiOmS4skylb0MtFzU3IEjtCi8w66VmUCmOpaM8fXYjM5uA5rD3TT6MM7LAVzpNUqGO0zCokmKve0Xs/P6u2cMjIL8TXw7nCG5lTWk6YqVlUd9cEVD+qP+aRuo4mh/fkl6K6JLa5c5a1q40FnKm/OuxYMzUUTJQ1nLuwEvBc2PTYvhP6GQC7J44KTDrb+0BTL66OxAXOsN2Ut0th6B4iVWlLXBe9wh1RcwWSzrj+fP8+roD0o/fxNY0cCDBjOS4w7QdQS7MyMC04Vz+G3gdnhwC5RvwLyz8EbSaqx2KfVj3kBIXdCsfFmrjmxZ9QZfyprS0Rkqd3u9FfEcsLXJl/b8DM10r0qcmAly5Ft61P++FJQKdjnPWsDCb5N6HdVjDpr/wnBURrtORrKlCCAzR6dpHR2yx3jzhr0GrU/TCgJwo3l3Wuleo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(261009223027099003)(56012099006)(4143699003)(261026121527099003)(261102123227099003)(10067099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmhuZ1cwSFU0Njh0Y202YVhQSkYzSENLaWJTQWRwMDVIRHJERkw4RUs0cUhz?=
 =?utf-8?B?ZG9MTmxjVFIyQkdndkhpT2o0dFlzeC9RaTIvaUhyeUpPb2FNSUlMWFZPWW5R?=
 =?utf-8?B?TGFHZWVsSWJCbEhGRVpDRTArZmpiRGYvVHdoZTFrdlIySlczcUhlbkpzQlhj?=
 =?utf-8?B?WXI4d3VGak9pdVgwZnNWRXIwSGcyeCswUEF2MndqWTB5Y3RIcGhJVU5DbExo?=
 =?utf-8?B?OGdBVGgyellnQkQ2em1PLzdiQ29VMjhsWno3WHhGY1R2WW40MXUwcHRGYm52?=
 =?utf-8?B?eXhKdnNGcFcrNFo4eGN1SFN1MUZjV0NmREhZdk14NXJldkdyMVl3LzRRTmtS?=
 =?utf-8?B?aTBqV2tQUkFXUTU0Y0pJVDdYNFJ6emVWajREcGZtZlF1VlNDajhERWE4S09w?=
 =?utf-8?B?M3JaaUNDb05zQ3B5aktlVTFpdUlDaHZwK3ZmVkJyTHI3WWF5YnFJRVNZS1BR?=
 =?utf-8?B?MTZqeGNrNjBzS1U5cWRKN0c1cHVPekVIcGs5VmhqWDFnUHJBWGdIR0dyM2Nv?=
 =?utf-8?B?ZXMwOGRiNEI1ZHJmbWg1QjkySXdGY3BvZm5mNGNBcmJlNzJGQTMwTVNFS1Nm?=
 =?utf-8?B?MzEzL3hzOFIwODRLZGt1NTVURlg5ampTOEtNRmg4akxRanBzV0MyQnQ3cFkz?=
 =?utf-8?B?eERMNHYrZ2hIMHBFK2pPUGNVaVhuWGlFWkl4dUNSTU5uOXhkSU50TzN6WGV3?=
 =?utf-8?B?MXEra1B3K0ZVZDRIbnIrbkRRUFhQTlVhazhVdkZqL2ZXZkZvOVhKQ3B0YkV1?=
 =?utf-8?B?RUs2SzFnL0hxYk40SmFtakVjNFBCL0QycXZ5TWt3YkdSeW14bHdtby96VDRY?=
 =?utf-8?B?MUhhaEdqbUt1QmtrTmVmajFwSGpNVWNSTmZXTmRidGc5U0I5YlBPYWlpUVlL?=
 =?utf-8?B?OElobWc5ZkRaYnNBYXlXQlBGcTY2WUZRbnhNcnhjY0JieUdweXZRbVJwTngy?=
 =?utf-8?B?VjZmdzBlaEU2STR6RHFITE8xKzdoVXM5ZWw2dlYrTEg2N1l6MktlV3lGYW5q?=
 =?utf-8?B?aURkcmRtbm9JVXNxSklyc2U3T0o2VGd4OUJ6VEc5SHA4eldHLzVFYzExVkkz?=
 =?utf-8?B?QVN3aUNMLy80VW5GT1hZWHVLKzBPK3Y0QmdVRGZoYnpaUzRCNnpERkcvUlZW?=
 =?utf-8?B?czgzYkR5Vng1ZmNSUThVM0NkV1d1R3ZuVVV1c2I2RHdxMzIxM3Rtc2NjcTYz?=
 =?utf-8?B?YmZmdFhWenVzMit6a3pZWEdDa0JTb2pheWU1dU9VL2I0Um8rZDRRWlhoNmZs?=
 =?utf-8?B?WldaVjdXNDY2NjlOVkF5U3kvZENob25YdHNVZlRiYmxhdFNIR0dxd01NdndI?=
 =?utf-8?B?eGRxeHVZM0IrMUE4b0pTODhLQVpSNHBZZXhSUFNud3NTQzBvRVg5alRJbjlD?=
 =?utf-8?B?d1Q2S0pHTHAzRy9xVDN5TWxrNmhhbDgvYjJhOFJ6ejVyQmpuNHJzWFBGRXRD?=
 =?utf-8?B?WEtSUXJucUFPZ0tSQ21YYlNFNzA1YVhva1NEalNqVVlNVGVaYXhtQURIOWx4?=
 =?utf-8?B?eXdSVkZEY2RBSmJXR2JEU0IvQ25DY3ZuQVdjTUhLdzRWZjBFMWtYRDFla3Fh?=
 =?utf-8?B?VHJYYjZ5N1lVSUtlVUtQdDlsQ2tHZzFZRmZnZnVzTWNYeFMreDNFZGxEbURh?=
 =?utf-8?B?OFdMQWIxMkdxNEVkRC9iNU9vYTM3YUxhQ2F6K0pnVGJGZmVNVVlnQy9JK2U5?=
 =?utf-8?B?Vjh5V00razQvY2xleWZSa2JVaFhCNjQ2c0ZxZ0kxTWRXUmVaeGs3Q0g2ZmFM?=
 =?utf-8?B?MTVBUHVnN2pJdm9ReUxZczFlNUp2UWZUUVA5RlFBU1ZiNkpQdCsycE91ejI2?=
 =?utf-8?B?RXRiY1NXR3g4Uzh1Z3c1bXdYb0JiUUVTWFl3Sk9SZ1dxU092dWxZbWZjeTQz?=
 =?utf-8?B?TGZ5WjZxb0RhYWVOTDgwdnBrV2Q3RG52ODhsdDJ1VFZUTGxzY0IwMTl1SEUx?=
 =?utf-8?B?QUx0MHU5NHdPVnlMTU5YTUI0OFAwdi9ETWdRUkhiUWQzZFJycXI4ZFpnMHVK?=
 =?utf-8?B?eWcxLytOTXZUNXYrbS9qZHlnanJvWkN2MklyQWZma1JGUUtzZEllc29hbVJ5?=
 =?utf-8?B?Y0hOWjhzbmw1Z2RiUEFJY1RTaFBlOStYdnRnSy9IUXZwMDlZMkh5emlGcHpn?=
 =?utf-8?B?eFIwbzNzQTI1U2c1YVJwOE9IM2k5LzdQRDM3ZG9MOG1LNUNzNnFsUm5yUzFE?=
 =?utf-8?B?WXN3M1N3N1lVRllOYWU0amF2QWRyR3NyeUFvU0tZL3VHdzlzclNpdnloV1Nn?=
 =?utf-8?B?MnFRUGdBaytIRnh6U2VlWlgyT1RSL0krYzBLK2NRNDdrZktHeU5ZdEJpYlBl?=
 =?utf-8?B?eEdpOXk4bCtyRDE2MGZlODdmZFQyREJ3aFdqc2MzcU16Mk1zOFgvVEpJUHRK?=
 =?utf-8?Q?ZY54BDv6KwWKdbKL6+l5M8FllYYgo50nr8Dv7?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8207e728-fac5-4185-de7f-08df45b42870
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:40:18.5646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npHnAiuLajxrSSnyfIkrruZTJv9X+P5hPbpUlPz2im/JheACzP/ADGDAKGWgbB94IF2UFFx1gi+4ClpaBnUBk8HAmSbh3uTQE3r3XHsrlmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB6029

> Should mm_cid_teardown_test also be added to 
> tools/testing/selftests/rseq/.gitignore like the other binaries in
> TEST_GEN_PROGS so in-tree builds do not leave an untracked binary behind?

Yes. The next version adds it.

> Does incrementing i before checking target cause the first
> sched_setaffinity() call on a newly forked child in run_exit_case() to be
> a no-op half the time?

Yes. A child inherits the pin to CPU a, which is mask one. A change to
that mask returns early, reaches no mm, and still counts as a change. A
child that exits soon can then get no real change at all. The next
version restarts the alternation on each new target, with mask two
first, and makes i unsigned.

> Can victim reach its end timestamp before the parent reaches waitpid() if
> wait_first_exec() and forking/reaping the setters take at least one
> second?

Yes. Its end is set before wait_first_exec(), which can wait up to 5s.
The next version adds that wait to its end. The case kills it with
SIGKILL anyway.

> Does leaving execs unreset after wait_first_exec() make the execs check in
> ksft_test_result() always true?

Yes. The next version counts the first execve(2) apart, so the check
needs execve(2) calls after it. In 8 VMs, the case saw 594 to 758 of
them.

All four were found by reading. The tests passed before and after the
changes.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
