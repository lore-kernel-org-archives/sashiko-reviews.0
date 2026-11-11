Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.100
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794375425;
	b=K7Q0xMHM4C+JCps3x2LnXJhR+wRVXAwNVxzHFzkN8evXH9M4/AF36RLZBffCDvsi6DUv
	 vb9RsVvf2HT8zFdaqe5aRLvhrtBPs6/qwSYqZyvEUI3iX98WRuVTF2Z7iDpHJW6foTcTG
	 ua9sUIMScsA+xHM/cTnffvuAyW6Gvv1nc3zkAJ93HRcRCFyoKl8EaGksDC+8ui9uo0nGU
	 ybD1KvdVgXIDQCSdYWlGWbuEXr3W3z08ABq9MzjHkeQ6vIVDLxvlciFekPokvyAilTbTP
	 KwdIpOhAW1+hVRWRMf9xdQS0YwbtUkEIUq21CddrQ61OiiR3w7oZYQFJVGoIQwc+Wtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794375425;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
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
	bh=OBEriADnAD2XNVbeil98/yzhdzNP+y6zBldIjgN3zeg=;
	b=dIBujjOZ+5Wzhu/VIUcQLViLMmLTS9BQYqIjyCDvX7B/Yz2RO84lgBFMWdS6JXUydW2O
	 X0rZ9ZzPxTY6aJVaICP/aONKvz0JIB1BlgwqvGmx9SQvp5B097DgjnzbsteoLffLx0kN4
	 Av+L1e+ditNA4HSmcBsAbyWb0WX4GSzaBRlxF6x7ZmrmzVQkj2n+7pubQBZmqlUoA/XO3
	 8hjeNKHj5RP3GePLOOSCh4I3SYzX83uMEHKbK2KH6bXC7/dAA8yPEwcpWbamdeP2zWDQe
	 IH/6PIqo0I37YwWhYYIVeHv7RnqPyoAesXzsUHstjg8d8HmZ7OKC2bKqs4iH68chxng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=ik5kTkEM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.100
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023100.outbound.protection.outlook.com [52.101.127.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02AB60A260F
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 05:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C02AB60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=ik5kTkEM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dl3Dt8AnjONu/u2QvmW19C5nWrS9qQxe4RWSKSQSJIC1zu30fHQasiyMkZcQ2atSiZKZRb4iPA8Q2NqMeX8XBUkyhkq7moa4eAUWFM2A+QIe6XlZkFjtwtTC2oaXE0NP+GWnka3EmO18cnzqr74nDhwu0/dAfyqPD9EeVIyKyunrggH0gl9BCWzww1IRxEQkJamLXNftqNtImMQDjl0UGiGcMGSce/4DGXXCu9Q4iJ8iCA9qC0XFC/KVGZsX5bRLlD54Dsv008yjYDZt+xK49IyppwOd66C8ZmOWMyLaUYYl4CdgtrWi4IuqjQsi6IECRzmXUShWOy5USaNAX6SAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBEriADnAD2XNVbeil98/yzhdzNP+y6zBldIjgN3zeg=;
 b=qllvWm58Prk0cUgZ6pR6uWX2aw4d+qitIX1RdlWw1CC8yaOwTMhN8FxKXTWhOEX2AsrDM5YBw53UytEs5k1zuUc5NT4bNYjOauAO0dhz8nRI9Vfg1+iIjJkvMdjYQIRaWbKT+zCyqTC6i+9ABvZwPI9RLELZsgTcJSxcJ4XrFoFe1WNItWEcbj65bgj8p8Hgd57vI505s3eBnX5E5uEeHHJw5HoypPeyHlbcs3PXDozAQ5pdAJf7meVMmRxCnSSbTtmJBOM1aQLEcB0/OYo0TI8j6Yr6kUftcAG04EKawLBdAx5s6jR3FKslafBxIsAnIxI0FXhfMEgri/hDWjCOTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBEriADnAD2XNVbeil98/yzhdzNP+y6zBldIjgN3zeg=;
 b=ik5kTkEM4/rCRG0huZFDXak4Sib6NdOVVkiP6RTNfv+WdR+I+rK/9yF4ZCqKhmLLEACWkjYvucQ4TwPiUZ5PKQR4zC6Qg3FO84lb9OTAy6gGqmFhlmxRSu+Gsojzn6ktR5Dw/XPyP8tLbC2e2G+7hgB+Kzz52Q1LQa8w0YrVhRZ5F6yxJthFV96+h+Iyyrs/1h9st5FsM6vOu9Oxb00lmbZQd9jKuuNe6moxNFP6UJC3SHA+I2IWkLzsUvVs3GcIpHL5FnlGX/1d7fP8qNAvGhnYBUlBOKJJicIkLxeBbNet1KR6rImMNyG9+sXNpG3YcW0fmaOvjhgEIBMfR+6sCQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB8438.apcprd03.prod.outlook.com (2603:1096:405:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 05:37:00 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 05:37:00 +0000
Message-ID: <dd480678-1569-4e3f-88ab-1df1524e3121@amlogic.com>
Date: Wed, 11 Nov 2026 13:36:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: amlogic: Add Amlogic A9 I2C controller driver
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
References: <20261110-a9-i2c-v8-0-1e9d2682f86b@amlogic.com>
 <20261110-a9-i2c-v8-2-1e9d2682f86b@amlogic.com>
 <sashiko-outbox-206651@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <sashiko-outbox-206651@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0002.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::11) To TYZPR03MB6896.apcprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0b837f-4883-42cc-572d-08df3fb5cf0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261009223027099003|10067099003|3023799007|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|4143699003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	w7F5nZIsSuIvlFEhRLtylzvlbalkQ/kubGjWw0ValZQQmzABDdoilVjZAW1rXC6Wgxcne2XqR/FPY3Pwz8QPvkMZDXpQGdFyBHdWQbX2KnXEScw1yYbGClGq7pM+rcVqJ9HqxY40Vx8+c4z2fAHNwVb2h8dAp8HLJpavEgaBIzGv8yxlTZyJRuh1L8pLS1hBKwMq6g0dqu7CoE6nxeHHb0Yrx00zp0zAsQR8FenHgI6+/SZxHUyqk2boRScKlDM/LlYMzxk8mFqnMwXvOjXRKnNiZrWwdOHsxeeIj3ZaUS5IJckxa4IQWPGIM7plu4CD18KvM/JO+aXGVO8XUQdxPlV+FWitz0ButEsJ+eeoWBR2SgT+VdWpKqBeMehEAQZdxomF8CYLsWfiMr0RDZM3nby7KLlFxVru4IUk40j4+PmLyyntNblxOYlTugXGj+LZ043qg71fLFHPFtTiJSG5muEon7cE2rG8oVBmj4wX0J9KsXw8yYXw8TqVtTlt9e4GJLonMVd2hOu2ydbv3UOdMTTVOU+ew6WcoXpMNRtLDjJ+eFgYmiAiYFJWMATqxKYM5QLrUyDArOnJbo/rm6D9UiPRh8OAqtg1olJMvGVuGRuu07mu0O6xFJYSxwTS3l+syFh48R9FO5+LmquNFEnxVIkwRDDWytD6bnu8mdPAJEU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261009223027099003)(10067099003)(3023799007)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(4143699003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUtZdUxNT1N6aCs0aHU1U09UMjdaN2c0dm9uTXExanVNNVNKbjhXc015Q3J6?=
 =?utf-8?B?S3BuUCtZeWs0VTFzcGFObHpQZ1JaZ1Bvejkya0pUMVp0dnphTHFjYTZMK3FB?=
 =?utf-8?B?YzhDREpja1MwOTkwVG51SkVadndJV1h1cjZDUStmNlRTbHVnejNjTCsyMTFH?=
 =?utf-8?B?aG1jS09qeXlUMFN3U0E5anhLcEpvcWszaExxM1Bubmp4cHRpS2ZRSUJzKyt1?=
 =?utf-8?B?K1FybXJScW54QURBNVZHY240UXZuOTYvKzFqTzFIcEkwY1ljUStmeXFXNlND?=
 =?utf-8?B?bVBHdENKSlV0MnJlb0JLVDBsb2lPcjYySmR2NEtyNndNMXpFMmcxamdUZlBM?=
 =?utf-8?B?Mk9ERVBINGg0dlJtTlVLWFJGSWV4Q1J5OHBBY3paVDIzTE4xRzNiRGhiZm5R?=
 =?utf-8?B?azNScUNCeDM2emlNTTBER3lzRmIwaG5pbFRmTEJKY3RpU01iNDhjYVBaanB4?=
 =?utf-8?B?Vi9DVWw2T3REbkJnTzFzbWdhdjlWM3QvUmxaemROZkpjWGRVaUIwejNyTjlE?=
 =?utf-8?B?TG5NSFRKeDJobGRDZUhFSDZFWGR6cU83eW9sTnNhVUU5cXczRXdPSS9mZ285?=
 =?utf-8?B?c0RmYzR6VlNKNlFTOVMvQUxJUjhqUng1NGhzTXFvak4xL1l5R05yb1QyUk95?=
 =?utf-8?B?a1FTUWkvcEFrR0tnbzk5dCtpSDd1OTk3ekVzWUNTVjBZcnFsMlZJSFI2bXEx?=
 =?utf-8?B?NnFPL3FVMUhtenRxUmpXNnlMc2xxSEhPKzZHaThxbkNyK25XTThITHhQMFdu?=
 =?utf-8?B?M09EYXU3NHhna1JKYkxqU1psTkw3RUwrZW92UVFZWWt6V3BDUnE1Mm5iS1p4?=
 =?utf-8?B?b2IvSWV3VzJHSVBqcFpDcTk4eGE2QVJLejlpWW9KNDBoK2I5dUZQL3h0ekdD?=
 =?utf-8?B?enJ2b2VrNEY1WUcxRFRsWWRzbERzeUZiTE1NUStNVnZMZ3Ixc2lNMWY2Zmp5?=
 =?utf-8?B?Q0EvK1drajFWK3pUZmxNWklnNXJBWExiWjI0VnJud09sNDdnWUJrd0UrbmU2?=
 =?utf-8?B?cGhIMUJ2RGcrWXZINlJpL3h4SlFlSGwzYVdlVzVMWmRZeXk2NGwrT0l0MUhE?=
 =?utf-8?B?VzNLV3lGckJoR3FmZWE1VFl5Y2RMNHRJQ0hLTGV0R003SVg4bElWNm1YaGpP?=
 =?utf-8?B?RnZLVjh4MlIxdVE0ekRINWpVaTVjOFVObnlUaFB1dGoxNUlaUVBVRENUQVhy?=
 =?utf-8?B?YmowYVhNT0RCUjNJZEUrdWY2bk1MM1NHWnVXTng4ZDM1SjY5SWEvQnhVaVhz?=
 =?utf-8?B?U2t0QTRhUGtVOVdnWTR5NVBHNEI2b0FPTm5VcEhXaUEvaXRqTHpKY2Vibm8y?=
 =?utf-8?B?Q3R0Z0UrdTF0dkJSRkpWcHhxRHl3THQrY0FQNVFDMExsd0hKZ0JsdCtzRjNP?=
 =?utf-8?B?OUJRbWw0YzZOZXYwL0s0OTF2N0hrSzZvSnJ0VjhUNGM5VE1MdE5ROEZYdGJn?=
 =?utf-8?B?TzZReHpWcU9nM1ljaWhKUG1uV3ZNV3hpZ3BqTVBFeEhrZERud2xLTi9pWTV0?=
 =?utf-8?B?V2prT2UwWXZpUUVhZkdGWnlzRnIwaU1ZWDZlYnIwSnFVeVV0TmZZRjlDbVVx?=
 =?utf-8?B?Rmp1Zy9mTXIrWk9icGVnNzJMeHp4dE1VblI5Z3JnWU94OVQwTVJIR2JGUk5J?=
 =?utf-8?B?R21zcG82eTF0ejA5MDdVU0dobmU4N2xwd1VhcWJnenZvZ1BYWUpCYTZNVUFR?=
 =?utf-8?B?ZFp4L1VwWkVuWVNXbDBVUDN2M0ZIZmttZm54OHJ0eDJlL2RoR1lLNjE0MWVJ?=
 =?utf-8?B?WldRREVQVE9sMGJkUFdRcUdtV0p3ZWloaDZnSFdyU0Jsc1pzMFExS3NmN2I0?=
 =?utf-8?B?VXJGb093SkdrNTZQUUIzemlrQ2NlTHowMjNqcjFxZ3FhM3BOTHFubmNPQWNS?=
 =?utf-8?B?UkxLWHh5Qmh2ZXduRHhoVmxGbG80bDloWXVFTmhrVkhLcUR3N3c1TEVwV0Jm?=
 =?utf-8?B?RGsrbktzaFJJZVhZdFVZOSsyYnhCV3JqVXoveVNqb3A5VFBoeS80OUlOclNk?=
 =?utf-8?B?c1hrd3RhVHBDS0VNYXNjRGZuenZsNll6emlIL3RaUmplZG9Qc0pHWEhIL3F6?=
 =?utf-8?B?bjF4MzZPVHo2Nk4rSElsanE5UDczOHpJcHVyUXN5bFhnOHYyOXEwcXYvSCsz?=
 =?utf-8?B?eS9mL2Q5M3VmQTJTbjBxbUxXaE5ySFJlQW42S2hvbE5HN2loemIxOEhxeDlQ?=
 =?utf-8?B?c1JvYlhuTktnTFlWQkNRTkFVdUg3NTRoMjdsSVVzWkplVXliY2w5aDVyNVJ3?=
 =?utf-8?B?bzV0cUdqNlowNmVFeEw1VE5TeFltdmwrelc4TkR0YWpKT1EvQTJZSlJ1WWhU?=
 =?utf-8?B?WmJsYUhReDAybWxjYW0xY21INTVORFpKTXN2Wm5hTEV4endYWjI3UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0b837f-4883-42cc-572d-08df3fb5cf0d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:37:00.6395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Am8/P0wQrsvRVijSLEfPQxEpEBZa7MkBOcqXAOS5wAHEmDYVUvL2z2eETNVlyQRU/XCdnCvEhltes9sulJqP4E0MOOABkpViBCH+ukpPZno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8438

Hi,

On 2026/11/10 16:41, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] i2c: amlogic-a9: transfer started before IRQ setup in
>    aml_i2c_do_start()
> - [Medium] i2c: amlogic-a9: stale irq_state and edge IRQ miss in
>    aml_i2c_irq()
> --
> 
> commit 75985e9b577bcde7a76a8a6f844a5a7564d2426a
> Author: Junyi Zhao<junyi.zhao@amlogic.com>
> 
> i2c: amlogic: Add Amlogic A9 I2C controller driver
> 
> This commit adds an I2C controller driver for Amlogic A9 SoCs along with its
> Kconfig, Makefile, and MAINTAINERS entries.
> 
>> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c-amlogic-a9.c
>> new file mode 100644
>> index 0000000000000..3e08a0333ceea
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-amlogic-a9.c
> [ ... ]
> 
>> +static irqreturn_t aml_i2c_irq(int irqno, void *dev_id)
>> +{
>> +     struct aml_i2c *i2c = dev_id;
>> +     u8 *buf = NULL;
>> +     u32 rd_len, i;
>> +     u32 rd_val;
>> +     u32 irq_state;
>> +
>> +     spin_lock(&i2c->lock);
>> +     irq_state = readl(i2c->regs + REG_CFG_IRQ_STATE);
>> +     if (i2c->state == A9_STATE_IDLE) {
>> +             dev_warn(i2c->dev, "i2c irq triggered abnormally, irq_state:0x%x,irq_en:0x%x\n",
>> +                      irq_state, readl(i2c->regs + REG_CFG_IRQ_ENABLE));
>> +             goto irq_trans_out;
>> +     }
>> +
>> +     if (irq_state & A9_TRANS_ERROR) {
>> +             i2c->error = -ENXIO;
>> +             goto complete_irq_out;
>> +     }
>> +
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
>> +             if (i2c->pos == i2c->msg->len)
>> +                     aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_TX_THRESH_WRITE, 0);
>> +             /* Tx must clear thresh after write fifo */
>> +             clear_irq_status(i2c, A9_TX_THRESH_WRITE);
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     if (!(irq_state & A9_TRANS_DONE) ||
>> +         (i2c->state == A9_STATE_READ && i2c->pos < i2c->msg->len)) {
>> +             spin_unlock(&i2c->lock);
>> +             return IRQ_HANDLED;
>> +     }
> [Severity: Medium]
> Can multi-chunk reads (msg->len > A9_I2C_FIFO_DEPTH) miss the completion
> interrupt and time out in aml_i2c_xfer_msg()?
> 
> Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml:
>          interrupts = <0 164 1>;
> 
> The interrupt is rising-edge-triggered (IRQ_TYPE_EDGE_RISING), so the
> controller's enabled interrupt output must drop to 0 and transition back to 1
> to latch a new interrupt in the GIC.
> 
> In aml_i2c_irq(), irq_state is sampled once before draining up to 32 bytes
> from REG_CFG_RX.  On a 64-byte read, the 32nd byte of the second chunk asserts
> A9_RX_THRESH_READ before the final NACK and STOP finish on the bus.  If
> A9_PHY_DONE asserts while the handler is reading REG_CFG_RX, prior to
> clear_irq_status(i2c, A9_RX_THRESH_READ), the interrupt output stays
> continuously high across the clear without generating a new rising edge, while
> aml_i2c_irq() checks the stale irq_state snapshot and returns without
> completing i2c->done.
> 
> Similarly, if both A9_RX_THRESH_READ and A9_PHY_DONE are already set in
> irq_state while more than 32 bytes remain to be read, aml_i2c_irq() reads 32
> bytes, clears only A9_RX_THRESH_READ, and returns early because i2c->pos <
> i2c->msg->len.  Because A9_PHY_DONE remains asserted in REG_CFG_IRQ_STATE and
> fewer than 32 tail bytes remain in the FIFO, no new rising edge is generated
> and wait_for_completion_timeout() hangs for 500 ms before returning
> -ETIMEDOUT.
> 
As described in this v2

No. According to the code logic, if the data has not been read 
completely, the condition for completing the operation is not met, so 
the interrupt status bit will not be cleared. Once the data transfer is 
complete, the interrupt will immediately be triggered again, allowing 
the handler to continue reading the data. Finally, once the read 
operation is complete and the condition is satisfied, the completion 
interrupt will be cleared.
>> +
>> +complete_irq_out:
>> +     i2c->state = A9_STATE_IDLE;
>> +     reset_fifo_pos(i2c);
>> +     aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, 0);
>> +     complete(&i2c->done);
>> +irq_trans_out:
>> +     clear_irq_status(i2c, IRQ_ALL_MASK);
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
> Does writing START_START to REG_CFG_START before clearing IRQ_ALL_MASK and
> enabling threshold interrupts race with hardware completion or NACK?
> 
> If execution is delayed between writing REG_CFG_START and calling
> clear_irq_status(i2c, IRQ_ALL_MASK) (for example due to vCPU preemption or
> PREEMPT_RT spinlock preemption), an address NACK or short transfer can assert
> A9_NCK_ERROR or A9_PHY_DONE and then have its status bits wiped out by
> clear_irq_status().  When aml_i2c_irq() then runs, it reads irq_state == 0,
> misses A9_TRANS_ERROR or A9_TRANS_DONE, and returns without completing
> i2c->done, causing wait_for_completion_timeout() to time out.  Clearing
> REG_CFG_IRQ_STATE and configuring REG_CFG_IRQ_ENABLE before asserting
> START_START avoids this window.
As described in this v3,

This is a hardware-related issue. Some status bits can only be cleared 
during startup. Changing the initialization sequence may cause data 
transmission issues.

