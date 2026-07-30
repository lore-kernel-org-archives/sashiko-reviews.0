Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022110.outbound.protection.outlook.com [52.101.126.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B811B3D5676
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 08:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401065; cv=fail; b=qFEEXEMifSh/gm2z+WluH1RJceR9CtJDPcPHEIIl+Rb9Oyhw0Br7GzUaQzIVyq82S5CXTIJ5cLM3kz71txY0Q5x92Ek2EI+VKzEsDRXufSlC1l/5YQMCYybvuqPBPa1OdAbEW6YhnNiZ287/UhZ4Lmk8y38UMhep2ZP1czpqk2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401065; c=relaxed/simple;
	bh=PS0TwEixTpe3JfIRQYRVS0PU+Hhbo6chZ0Fe5flPjjQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G20oZAno/W1nRmcANHGHnWr85YFJgBh5QugjIULygrHXKR+xPIEoPDe3qPHHs5pBdO5lUF0soIn7ywC26BHbA2jz9VQ/jH0hhMqp3IdiZgBD0++19ZqN8U6carU2zIbVDz9i9AW1Ook6siltpnDVIToqtQRscbYbt6W0Qs6n84M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=H+D6a6Bg; arc=fail smtp.client-ip=52.101.126.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="H+D6a6Bg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jV61fowzJfGidxHphiDoQrec6L9gSYo5eb0XC7c3gyFpI+jVscbzuK6gqXRC486DTQ/X1hyhOcxfoRN1jLDlPl6t7zPaw+LBnl1nGrPU+duI7okjVlSRp/YyAtc4+IHlhhpAjZaIRp7bE6AhtJGm7FHLT8qnYsev+XJF4TNotIXMXs9T7H8X3V+WGRNybeiIOHpvH9NAjMPSHQ8rC/b26ZTVTrBpLfw+mhQcboF4zMnXqumIRDkrH/FyTIS5Z83ynZfVlRZ1jkF6xSeipx7w0/CKiD6OF6auxYjhs64zCN6gXjnNTZsbasjTpBuyAsNV+bno88EgC70+PyRL2YxNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIYONSwOdeVPwMlSpNF0W21+ewW93qKMUd2hEavZNrk=;
 b=s28oVpPw7EylyyfnJ2cR+LGh6twx9BwYCWgnq+zZRf0k48bVjADXMX2bs76iiNh4EgLFxQhXrGrW8g1RM31VlJZRp5cuacjXtiUMo1fiGb3cOmmdv9ncPpbE/bwEcqLazp2APAi/UoU/TAJggAPx5ZcfCIiVzINchjg8opwlzpkzthFqp25H7WlAlsp1lsLwd3OF1coGUtXceH+5o4n1NRCtr0FQk4EC1Y4nHJo++a+MBh8yx4F87uWeHcMEzm+uIASvdlRhKKkw+1H39d9NHqo6w+9j2Rfa4sAQJ27rGas3bj+7EWF8RAVYuReXKqyrslYenRl/u2ZLFBqX8d8ASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIYONSwOdeVPwMlSpNF0W21+ewW93qKMUd2hEavZNrk=;
 b=H+D6a6BgItWq+O7FMjhjkZePQJZI2PnaNR8Z29JV42wRc4sYMEMts199xwGKB0sRXlKBWpA42EAky44qDDAjJBTkiwijpSwNeR10KfqukDfk/maSSyvdQ8Ps2t96IZptXsUH2z8QcFLIFqAjYwzgXLZ46STn3kJfgNL77e2xFbkkUhv4Ei/gzvGM3G5uLztog7P7tZtOH3p5JKp9HLV5eZ1ShuJ6fUtn2bKuZkew4P9ehmYbQ9A43F1W51LNHhyx7e/ljyxmpNJ6zP43CXpeGDh1Rj4nb/apXzJgGH3wie5Ew65zsD2XK/9vQ7H8tpgXCVpVwzEC7UXNexJpGFrVMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB8259.apcprd03.prod.outlook.com (2603:1096:820:113::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 08:44:18 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%5]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 08:44:18 +0000
Message-ID: <9dcfcb6f-ecbd-43f9-976b-d28f942d0bd3@amlogic.com>
Date: Thu, 30 Jul 2026 16:44:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: thermal: amlogic: Add A9 thermal
 bindings
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
References: <20260730-a9-thermal-v1-0-d786d37cba58@amlogic.com>
 <20260730-a9-thermal-v1-1-d786d37cba58@amlogic.com>
 <20260730083949.AE0351F000E9@smtp.kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260730083949.AE0351F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0164.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::8) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b48a80-fa6f-4347-d0c3-08deee16be34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|4143699003|11063799006|10067099003|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2D2QIRwQCjMtqd2kcXa5X2y4/KRE7SjK5R1GP82zavunKAn9tZsE4xzuRkn1JNqT0BEARVKBOtdotDJyPrhctoODg6sBIu22gPzP3Mk3KM3QUJPhSv0R/TxAb87iyc+Lrv7ATPG8wbwgSo1FdivcrW6nYVLglaDRwEpxRiEDGZ/YX/QG9adwye+p57s+95WfsQYXulWM218kQa69VIw7mL2V8IDN+Ka3h9GDs/HjWfwibYfeGAxlXxu52ENTVVJtA3Qqv5X6ojyj/5G3W7WvUZ8Z2gjd8670wZywwefIpNoSJQu+dXr9KBt1jBbvZNLoh8lygZK1iUcQ/8rlPNE86MkqLJnaxME+STVjiiuGm//MUNGZgcvQQCRG6ahq8OUfCQw/sSGoksMiiaUY7BlV63NTqsmi64ybugmHt5Do2HFh3rKF3R+deNeH7PSz+SAVrtKqXLlhfgzspG/XZyPgGN0AW0OnHWm9GyGsPPLlvxrmhztIrcNSCCxn+C+0YbASs8Yg6zGa9zCqfHbO+wn6rkUeTqaeeq1icrEznZMUy8ZV5eosHK56t3szy6UNS0F+F0DmWNWiLRLa40E+1ENefAtoUcBbKJw4T4nQPc4Vw/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3pRTjRqdHNzQmNnb2F3VDhiZmgwZUpRN0JWbVJHNjhHbVZvajVjMnZmUzJu?=
 =?utf-8?B?Rm5rakFvZ0JSbytSMkxHZ0p5M2dNVjhoLzZzZ0JWSmZSS094RkZ6YjhyNDVL?=
 =?utf-8?B?MXFKWVVYRGI3U2FCa093WVFHN2pLbXZCeGpzT1ZnTVhWbHVLVDA2Zlo5SkdB?=
 =?utf-8?B?M3g2S2NHajFsSTByOWVUYVljdzNHVXpUNWxhWGlmU2R2K3UrUEY0N05QdWdk?=
 =?utf-8?B?RXBsS0NqTmxpYk1CWXl5R2ZzdW5rdU5wN3g0Z0xQSjJ0TG1GZUU1OUU2Tnhy?=
 =?utf-8?B?RkhwZ2p5bUYweGxSaG5FcDcwamlZZEFUTWl5SWpSYzNMVzk2aHlnWkQyQUJV?=
 =?utf-8?B?cElaY0RvN1FlTFY0MTFBbjZkQmxTcW5tVUFyaXlKTUZJTktaeEhtMmlzV3Fs?=
 =?utf-8?B?WXlSbk9NUm8vQy8yNGkraGpkQTdDK09ScmtIVzkwd2o1TWxSOHNFUmFtNDda?=
 =?utf-8?B?WkRsY0JrbCtDemY2dWl0QUtLbW1nTlg0T0FiTUJQZzR6SEFPVU9TM1dHTUVE?=
 =?utf-8?B?dW5EMnlwL0djbFAxYWhKenNseW1ubmQ3Vksrc0swRmlkUEFsaExmazJXcHlW?=
 =?utf-8?B?bG45ZG5CdTl1VDd3b0M3RXlmVk84bVI3ZzJTRGtLOEZnN2trcG5qWThjd1lG?=
 =?utf-8?B?OWM5bGVSZzJzUXZWdFRiUlYxaW9ob25wa1pFbU5zODVWMUd4SCtrY2drQlFL?=
 =?utf-8?B?UnlGT0xCK0NpVlE1alEvak1iYWhyN01QbG1JRTdUd2MrV0tIbDJjc2FoWmxy?=
 =?utf-8?B?V3lydTRtWWVHdnJ6RGxCRlVCalM1MUhOenZaWXBTQ3NwYlpMZVJXc3JUTzhQ?=
 =?utf-8?B?QUd5U0V1MnNYc2o0d2FhY3VNN3BtaEt6eDJxenJ2Wlo0UTQ4aTRJMGkzNS9N?=
 =?utf-8?B?bXlKY1RpQUhWdFNzQWtVSE5EQTA0QTZWMzRYVVl3SEJtMzErQVY5SU5qRzVy?=
 =?utf-8?B?NWR3VitwQ2lUVXorWEF4QjlkcitsNmQ1SVZ1YVJJVGhGYU9CTENQSlJKVTE2?=
 =?utf-8?B?MzF1RW5VRHZRdW11Ky9IS2w2QUp1Z2phcXVvaklYWjYvVU1za2lnT1JTbXRp?=
 =?utf-8?B?ZHNzR2ZxcWNXU0FERkYvVnd0aEk5Wlc4S2NDOFpHY3dGZlZIMVlqN0ZUS0g2?=
 =?utf-8?B?QjAwZ1ExQnRSY1ZVM2R2VnVPLytIRGltTTZvQ2xmNjdiY2RYZnF4cnh2VjZa?=
 =?utf-8?B?bGRES3QrZnpPU0VSSUJCZHl5Y3NIZDlOVWtmRlB1RnBoZ2d2Ly9Xa0pjamVp?=
 =?utf-8?B?SDMzcVJTRS9PcmY4Nisvemd0UUpQK0tkajFLYVNIeThFcEZqRFh4dUp3TVk0?=
 =?utf-8?B?M2N4d0pJTURDbVlkSTRIclNDWHdXaDFEY2NhNnBiQ01aNzBLWVIwUXBJdEFr?=
 =?utf-8?B?b0dHSEo0NFlrZS85aWE0N1Q4cUpWSmZtbTJ1NGpjdUl6V3dRZ2ZRYWRrS1lX?=
 =?utf-8?B?V2xmVE5iMk10ckdUOWgrQzE4cVRUK0EwMklKRzdOZXdETXkzSlhGeVUwV3RR?=
 =?utf-8?B?UDZJYk1LeU4xNDBaSHdvTzVnUFp2RnNVMjFiWG8wd0QwU0xqRzFaUWhjMWp6?=
 =?utf-8?B?UG5nRGUveWNwWTBZeEtvVVhSQWVxZzRWR1RhNFZ2b09MVEphTnJuMGowbnN1?=
 =?utf-8?B?OG5kdXBtNTlsUUFZTlRwVXhTS1pBZEloM2F5YThwR2pTdEFpQTU1Sjh6M3VQ?=
 =?utf-8?B?dWtZYzJUR1prRUhmWjg5ZG80MEYzS2tYNUJRNzlwSGZJZ0lZWTFtN2ZoUnZx?=
 =?utf-8?B?WFlGbkZ6V3g2QlVLdDBua3hjYUdrZ2ptN1czcENHNjdtVUZHem9SNU9CMm1E?=
 =?utf-8?B?WEtxL2hZdlE4TC9FUXBocXhDVTZzZUVJdTEyWVhEQjdxbEhkb0FNWW1tSHl0?=
 =?utf-8?B?dlJ5UUxHOVZTdjRqRjlUMkZBbTFJYTV2WVg3R24rNlBjT1hVeWlmSktGaDZ1?=
 =?utf-8?B?aXBQMjQ3NXhqZkZCcVcvVXJXL2xhUDFHaUJpTjlZVlZDREduMmFBZDhLZ0FG?=
 =?utf-8?B?SERwdXJrb3NJeTh0WnN2OC9GM1M1TVNHekdDN0tpS013OVliaU9YSU83VnlZ?=
 =?utf-8?B?ODFBaXVxSlNMd0FsNWRpY24yZ09mRWRWekFQUWVsbll5WVVJTms0R29UWmlw?=
 =?utf-8?B?SXJEV21WdjJGRUZ4dDYzbExBUzA5VDZBaExSNWJIMnlPR2NNSmxsYU9HTnVR?=
 =?utf-8?B?blZjTGNHMUNkRFNiVnFQaDRrSWpkcjFTdGJ0bVFxak54WWtBdnZiSXJ1Yzk2?=
 =?utf-8?B?Wkx6VTBCUTV3citlbThkS1hiUXRmdE12OG05VXY1eGVtODFqUk5YN3VpcjNh?=
 =?utf-8?B?eVc2cEZEZGdDTXRpSTNYNTczbDJITC9UY08zYml6NkVuT1huWmw2MlhYa0Vk?=
 =?utf-8?Q?dvPfxZ4ezxTze/uo=3D?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b48a80-fa6f-4347-d0c3-08deee16be34
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:44:18.2393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1t5Q9ezOnOxOByjsUjB116+LVnNpRRz1EivvbdAHvLis3o2xonz7JiOP1gUnexZxJkQQy78J80gYNvDKzaGx2ZJU6NpY4U3WIcd8K+vA0s8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8259



On 2026/7/30 16:39, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Typo in the YAML schema `else` block: `clocks-names: false` instead of `clock-names: false` fails to forbid the property for non-A9 devices.
> --
> 
> --- Patch [1]: [PATCH 1/2] dt-bindings: thermal: amlogic: Add A9 thermal bindings ---
> commit 3a3c5b1f7b65f4d86068deda76be1b7141170b8c
> Author: Xianwei Zhao<xianwei.zhao@amlogic.com>
> 
> dt-bindings: thermal: amlogic: Add A9 thermal bindings
> 
> This commit documents the thermal controller compatibles for the Amlogic
> A9 SoC. It describes the core and pclk clocks, adds a hardware reset
> temperature property, and updates schema constraints.
> 
>> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
>> index 8cfa44dcda58c..5f5dc6f12851d 100644
>> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> [ ... ]
> 
>> @@ -73,6 +84,22 @@ allOf:
>>         required:
>>           - amlogic,secure-monitor
>>
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,a9-thermal
>> +    then:
>> +      required:
>> +        - clock-names
>> +    else:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
>> +        clocks-names: false
> [Severity: Low]
> Does this code intend to restrict the clock-names property here? It appears
> there is a typo in the property name (clocks-names instead of clock-names).
> Could this typo allow non-A9 variants to define the clock-names property
> without failing schema validation?
> 
Will fix it.
>> +        amlogic,hw-reset-temp: false
>> +
>>   unevaluatedProperties: false
>>
>>   examples:
> --
> Sashiko AI review ·https://sashiko.dev/#/patchset/20260730-a9-thermal-v1-0-d786d37cba58@amlogic.com?part=1
