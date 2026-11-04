Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.140
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793811362;
	b=XpZkTpFI02M5gQQGnJ7xouJnca19BdhorpPqj8AKmA9CpCA8ryYV3MXss01oXlNqAwSQ
	 2AJRaFJjWYzkN39baiDyMWawqSJi3gEFtYZJdyzMuGjd7SkqC4oxfjToa/geMSpzYDGUl
	 D+NJsi3AKxQelU+B7biDQSkFj4Kfwmfe53IRauUu9rsDk5wsTNu9vqgZtXb/+e+ogi/LX
	 EGpoMONY9YQznsY4RqoERQtWoOSyRGkLorf1x6NcVXKYUQtbIhM7YRXYiQONlEamkMCQI
	 TQ1xuUdj6GTrXie5ArvZZ99YtAj1k6qQ3j1PBWueqdM8yT+NEC5m+6pMGAbweEtLAtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811362;
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
	bh=aiPVd5nraXEtQ4S3a1xfiW+Z2T72UsVSn91p6k1uNT0=;
	b=L6JO2eTG6LVB6TWK5Y0EUtQoG5WNK5nP0LzMjS884t3+7Z4vNjWpKlUUlBztSx102pDX
	 UNVmjcPboYZKGeDLur5sgvLqjTc2nRpO84tqamebJLp3wzOH0NR9EOgmCLoj/AlJ5vERQ
	 E591R8IGoqDegT1axyPrJXwUgxwD+06d1L6/Q2nyYGSv07+WjCY6kwA2i5OMDUbH0BJ5s
	 QxdvfCPE+UdpNDEXdHMcPAkUmDBKfn/eeyhJnn7UIn/45IM8Ea0eA9HgpJ5YhkjFRUhiM
	 z/iDHqioxn1yAoCsIBoFJwOEUcHxg/UUjpQXM+D/+nWFwBqzuxW0gr2Ao38//x93BtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b="S/TgF/Ye";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.140
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023140.outbound.protection.outlook.com [40.107.162.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30AB606A331;
	Wed,  4 Nov 2026 16:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C30AB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=S/TgF/Ye
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A33SUZBwhH0yXTc+a/iUrnURdvDiHoXIa7gg9mqdsh7R2HaPSgqSkkOzclwTeTs1VaC7tDYeBSoKcOQIhgo6V3cT0vDcFEyNMzNVOArGGDudTnkqzCLKL3MM9EssQRgfJM+uT8DWxtWflxcj8+91mAGstScAdA6PaXn1b4DTKGWQNCHwEJS47ygpDD8FPwhsM3I8LCap+xbxO6idC9ZI8dtKEiYWnpSJagGd5r235iWuRWxdaA2zP955O8F05oIhfYavGfYtYN7ypOBApWRtrcNWDIYxp1Nc7Xnoqkwq/ijRM5oogSCAouwVE/j23uBxt2mukyRzCp8ayc2MZDlSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiPVd5nraXEtQ4S3a1xfiW+Z2T72UsVSn91p6k1uNT0=;
 b=Helw5bN16tMpNxprtrWzDD1T8StK13/MNloGPx6VVQBvvLqe8NFaFD3XUP6nnFJOtmw05cZNOHmTq37OiJbUG9zxbotirWEjfvjDWiLnXfVrd/LXcn4HpdOwjBhNODdbXZaMrW0blD2tPcWuIXrSyz1+E79AujC525jTjnABCpEj1CgZM/0/k4iUz6lDXAGnwu7cbXd/K8nSeqYCRUVqgMTGdByN0NP2zVlyGiiCJIsfLcO4BdMId3V89RE2DSZzakIUws/HKvEpJsnOVyhQzl7WDhORSqneo+kpDoOxBHTaLFC8pBFTQ/APPMR/CoQFhHl8b9qDBH6gaoRR/CClKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiPVd5nraXEtQ4S3a1xfiW+Z2T72UsVSn91p6k1uNT0=;
 b=S/TgF/YegqOPrf7EcqB3SEBCL/xUSx2jcxJRV2MNrEzELUyWoT6YOivhl1J5WFGSOi59j+yb33ekpsNcgKeu+aW6BRGITi57lL1PUb0QlSBejt7QSEf4vdzfOKC4eva4d8pyVBOprh/3tZJ2p5KMyC5gSI5dqN5vQqbrW5t2Z2gv1ULOSZMCw2BB4U1svlCF5INVSNmNYKI8l4ZsUEYVoV4xB3yxsOJGrIY8JiOaadpYgLqxsFkxI8UQQQ85G/32dZaZKINb/gqMVePiTriozzLc1sHZA2EpppYZ1yOkOBa5agdFs8ZDNKEc14/jntrdN2aqO/YKThdA3grRz93oIw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:159::10)
 by PA1P195MB2539.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:460::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 16:55:57 +0000
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894]) by VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894%7]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 16:55:57 +0000
Message-ID: <29ede6dd-cf0f-423d-aef6-ceee0303ceff@phytec.de>
Date: Wed, 4 Nov 2026 17:55:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dts: imx95-phyflex-libra-rdk: Add overlays
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org
References: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
 <20261030-wip-bhahn-imx95_upstreaming-v1-3-1c1cebb5be99@phytec.de>
 <sashiko-outbox-191079@kernel.org>
Content-Language: en-US
From: Benjamin Hahn <B.Hahn@phytec.de>
In-Reply-To: <sashiko-outbox-191079@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::15) To VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: VI1P195MB0623:EE_|PA1P195MB2539:EE_
X-MS-Office365-Filtering-Correlation-Id: 84659cc7-c509-41a0-84a8-08df3a947f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261028144727099003|261022105027099003|11063799006|4143699003|56012099006|261009223027099003|261021121427099003|261026140227099003|261102123227099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	sIxiHob8mczvr1JTs2DYv8V1fB35zjEqJBrOBGs2vCtlOp8L8gCoxBpte0iH/1EnlskC+LqShN4dZgrYh9FB6+cFNgH+cLmiWnj15n502QW580PlJLCFXa+CgYcX8a9FL5RGMlJ19zf16kcf/BeUqEhZ4umtynidAL+a1r+9+Skk7FRmjyZV0WREIf/u2ybHlraabCcwSs1vd+MTsO3qBWipM1SyxNh9lg/JUWjQGWjdsODNj1qCf7+9sQhsJC2bwWVP23eHgj02iT62H5SqgcayezgdW0law7pd0hoszrSK4ji2PZ17rfEwP6Y5wsQt1O8cR6T62HbURalkrLECEbHS3/8cAgKUcReZkWQ6b4iIODZW6slsHFg+TW9TL34lBLujLtMhfzJGiBIWIPuKQqzRcBzZfgymhHzh86XigAH2RnXkJAzTV+e7udnWs1RX+SWSvdYGs1wQ/N5U8u158XPUvp8Xl43dySZ/Mddrcu5a5e26mNAw0YdW4gdzf3mvPF+Iu+MrjKd0t+SVHQGpN3ji/s13dQ0ejP2av9kNPP7jHeKV8SHcuP4v5eGKJJD7qsvtGkZncu5ufA5+moZ3nPXF7f6MVg0prDrPu/QyNjJR/5EC3h5BwXQz68XJwN4hiH4aYJwg+atkK46qSacxgOj2L1XAr1T+HDQKQVEdOh4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P195MB0623.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261028144727099003)(261022105027099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NThlNnhmS0ZydkxyMDlXMHN6WFBqV0ZXYXpyUEU1RTFYS1NTSGtpRUN2emMy?=
 =?utf-8?B?dXNZTVF1bTFSVGF3cE9BNHRpZS9RTzFBOTlIQzhWclNiUkQ5SDN1MEhIcGQ0?=
 =?utf-8?B?ejdibzRmeVMrRXl0YWcvUkNmWUhhb0ZwU3h1bCt2YU9WSnhRTWRYOEpzd0dF?=
 =?utf-8?B?ZzIwODlKY093azgzT2FDbEV5TVJVNStsRmpzSExsYXZYb2o0bXp5SGhoRmJt?=
 =?utf-8?B?MDhTMDY5SWNzeEZsSTBUMU5Jbkgxb0t2WGVJSnNzM1RRY3B6U1ZVcmhYWjZN?=
 =?utf-8?B?ajMvYlp0T3EyRVo5aVRzalF1TFlzWnNDR1BTU1pKbzdvckMrcjd0TkxjUGlt?=
 =?utf-8?B?ZUY0RzJTRXI5RmFHMXA4T1hJT3hTRGVlK1lSR2FKV1hPU28zT1MwQkw2amd1?=
 =?utf-8?B?MnI3VTByUzBmNW9vR2RESEdadGZCNGw5TlNrL0FpTnRzYS9HcnhnOTRMdnpa?=
 =?utf-8?B?NGNlQ0lPZ2JNSS9oUWR3UDQxSUxYOS9lNGduTGtISDdYandXMWJ6LzY4MzNK?=
 =?utf-8?B?YUw1bmsrMHlOL1BuK2dVYTB5NnBZNVN1dHVQTEQza2hiZkVOTzJnUG9BUGl0?=
 =?utf-8?B?dkJha1ZhekNlTDFGRUsyM2tUbjM0bjJrNTJDM3R4L2dKZDZNOEM1NnFudzE0?=
 =?utf-8?B?R2VhUFRIT3FIM3FXU3hYc2NUTTVUYi9VSDBqelRHeEJBVnQ4aHRraitYZHZm?=
 =?utf-8?B?VFRzY2RLalZ4cWRMM0hROXRzNVh0N1JqenZEYmh0RzRkcG1zL1Vqc0pwYlIy?=
 =?utf-8?B?eW4xWXE3ZnhlU2w1dTRGU3RyNG44M2pwTTlPcU93K1JTWWRTYzNWVnhBTkRl?=
 =?utf-8?B?SU9OU2VZMUZVV2FZK0ttQU9pQWNzNjVvWlNUODRRRFlUQS9PWDY3NGlxcGNu?=
 =?utf-8?B?RlpzbDNYbkpZcm4zUXNzMk55L0F1Sy8zdjc3Z2ljMzlHdmVwSklyTUFzR0dS?=
 =?utf-8?B?SW0vRXpNYWdGbEZ4cjNDSEhZM1NROHZ0V2JUVFd5am5nN25JS3lUYUxzQjhv?=
 =?utf-8?B?ZGhFRFVlNE45UHg2RVI0dE5HMUFQOXdjQ2FYVU9hT01ualUydkduQ2MrQ0RN?=
 =?utf-8?B?S2dncGZabE8vajVBMUYzWkNROFp2d0NCUk9nUWRRSUUzVkhGMHNPcE5jYk1h?=
 =?utf-8?B?OUEybEZjRUw3QnNrZDlDaVFjQTM5YkVqMEtIc3NzNWZPcE82T3NHc0FpTFY0?=
 =?utf-8?B?NDdxU1lnY2RyN0ZJVXAvR0s1YjZuTmxSY2JJNzJCZGxvN3FPN1FGeEVFTHR0?=
 =?utf-8?B?c21GWEN1TE8rZEhBeUUzejB2VHFWWGRlYThacW9BbTk3UTE5cW9MdXdxdVZB?=
 =?utf-8?B?L05nU2Y3NWJTK3VINUp1Qjh2NE41bTd4ZldNMVRxeit6SWMwdEFUckhRMDRq?=
 =?utf-8?B?NFBVbkhKcWhWQnNvdlpNSExaNHpOcnFOV0dIbWJQdDdCQjc1aS9wUk5ZbmNt?=
 =?utf-8?B?L1pwSjZtY2dCZ1laU1lpVlkwT1ppbUdLQjM2TWh6T0RYeUZ2Y05MdHpYVXhC?=
 =?utf-8?B?dHBVTk5KeGc4VGt4R1Y3Q1NwR1pJeGVDTld2V3pva0sxdWkvMit5WU9RTzdu?=
 =?utf-8?B?c3U0bUsxVkZ6cm9yT0NmVk03SE9qeTZ3QWExZkFyY3BoWXNhbUMwaEY3VU9J?=
 =?utf-8?B?QmNTRjAxR2pTSE8wMWlSSkUxcGhhM3o0K3N5WmtLMmcybXp5QkFPVVloZkJL?=
 =?utf-8?B?R1l1KzdHMzBNdFBZc0Q4MHhJaWdtNkduSlpYdTNVTmhYRmVLU0RpME1KbUwx?=
 =?utf-8?B?MHdhSkhQZXBmSkR4WFpRNEZmZ0NDdHBYUWFFUFR2NU5FV0lIZHBpL1ZkQm41?=
 =?utf-8?B?eFJ3NUQrZjA4SXZaam9DR0UwdXlXa1E1OG5hZ0tueEFDYVFGZkdBQ0lwTXF1?=
 =?utf-8?B?bGMrNzVoVkQ3Q3B1UnpSMjhZVUxyR3VoendwVGdPS2RVSFRIN1d2bjVUeTB2?=
 =?utf-8?B?aXpzSFlCRzFBNDJ3QTM2ZkRDVlBIL0lnYmx3TnJNcDV2TG1tZFRPR291NGpQ?=
 =?utf-8?B?N0VRcWFmcEhWZ2lXaGJGMDVUSmlNWkVMSFhUT1RVSmthQVZ1WjR1RDVZZk8z?=
 =?utf-8?B?ZURweCt4NXZBKzRJaStLQzliVkpDSnNWd3VKdnpGL2RXOVIvWTB2U29GUDla?=
 =?utf-8?B?QVhzVDJrK3ZoN3BZNEJ1Wkh2V3MxQWFDSXNBd0ZtT3NHTENNMGQ2N0JCY0Vn?=
 =?utf-8?B?WjFYZk5EYVFoNGplTmVhUFpHNWJPemNPejFnQzc3THNYZFlRSkZUQ0RlRk42?=
 =?utf-8?B?V0dKMXVwZ3lBNU0wREZJK21ycENxazhUQU9VUUE3T0JwUHhpcnpuYndlSVI3?=
 =?utf-8?Q?0O2MZbKO+9iNf0nI8n?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 84659cc7-c509-41a0-84a8-08df3a947f58
X-MS-Exchange-CrossTenant-AuthSource: VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:55:57.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DN0FT0XTpLEbDv/XWiZiOPhaBDGfaekxFLHqHmfL4+SfQPT3ym7zEQsyvx6KrIJKK4OKVujEyoPDGt0UgBUtMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P195MB2539

Am 30.10.26 um 14:44 schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] arm64: dts: imx95-phyflex-libra-rdk: missing OF graph link for M.2 BT pwrseq
> --

LPUART8 is also used for RS232/RS485 on  the Libra board and can be 
switched with UART1_BT_RS_SEL. When the port is specified here, it will 
not be exposed as /dev/ttyLP1, which will lead to RS232 and RS485 not 
beeing usable anymore. That is why the ports are not specified.

Benjamin

>
> commit 214248ffcd9454f4e28fccad2971f5e7db77d114
> Author: Benjamin Hahn <B.Hahn@phytec.de>
>
> dts: imx95-phyflex-libra-rdk: Add overlays
>
> This commit adds devicetree overlays for the SoM temperature sensors and
> for M.2 Key-E Wi-Fi/Bluetooth cards using the nxp,88w8987-bt compatible on
> imx95-phyflex-libra-rdk.
>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
>> new file mode 100644
>> index 0000000000000..1601e04b3940f
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
>> @@ -0,0 +1,24 @@
>> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
>> +/*
>> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
>> + */
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&lpuart8 {
>> +	bluetooth {
>> +		compatible = "nxp,88w8987-bt";
>> +		fw-init-baudrate = <115200>;
>> +	};
>> +};
> [Severity: Medium]
> Does lpuart8 also need an OF graph link to the m2-key-e-connector node so
> that the M.2 Key-E Bluetooth power sequencer can deassert w-disable2-gpios?
>
> In arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts, the base
> board defines the M.2 connector without OF graph ports:
>
> 	m2-key-e-connector {
> 		compatible = "pcie-m2-e-connector";
> 		...
> 		w-disable1-gpios = <&gpio_expander1 9 GPIO_ACTIVE_LOW>;
> 		w-disable2-gpios = <&gpio_expander1 10 GPIO_ACTIVE_LOW>;
> 	};
>
> When CONFIG_POWER_SEQUENCING_PCIE_M2 is enabled, pwrseq_pcie_m2_probe() in
> drivers/power/sequencing/pwrseq-pcie-m2.c requests w-disable2-gpios with
> GPIOD_OUT_HIGH, asserting the active-low W_nDISABLE2 signal:
>
> 	ctx->w_disable2_gpio = devm_gpiod_get_optional(dev, "w-disable2",
> 						       GPIOD_OUT_HIGH);
>
> When nxp_serdev_probe() in drivers/bluetooth/btnxpuart.c probes the
> bluetooth child node under lpuart8, it checks for the M.2 connector via OF
> graph endpoints before acquiring and enabling the uart power sequencer
> target:
>
> 	if (nxp_m2_connector_is_available(&serdev->ctrl->dev)) {
> 		struct pwrseq_desc *pwrseq;
>
> 		pwrseq = pwrseq_get(&serdev->ctrl->dev, "uart");
>
> Without OF graph endpoints connecting lpuart8 and port@3 of
> m2-key-e-connector, nxp_m2_connector_is_available() returns false, the uart
> pwrseq target is never enabled, and w-disable2-gpios remains asserted.
>
