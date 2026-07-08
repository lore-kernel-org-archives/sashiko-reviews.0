Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011069.outbound.protection.outlook.com [40.93.194.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2947D41DEF0
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 10:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508381; cv=fail; b=tgKIwxosCeJqUmT1mV+6H8P/aeMLDAxmoIlHwx524nCkihjoUMZ2kKUKWM0EIZpNSX8S42eQPsGGUN0Ue7FvwRD98AfeWjV5DBK3H/uwgWAYkMhCctUaF4WNZEZVvl0twI4KuUbkCz4kCXwXYFpYj1seVvP/onp7Aw5/Pu4J654=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508381; c=relaxed/simple;
	bh=EF1gIqSdUBY5SR+7ghpD7xc/c6AxQznOvBfIYVVDpbA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hy48ppM1uvdhxzNylx6L6PoMhQDdYDSX+Zf3maYK861bPuKMVu6u03Kej0ZsT1Bnm8jFBF8wb5jzXSAX8u3jmscHAOCtsAxo78qNR2f6sllOHdJ8wGgdy7+rysUcvXMOiCYX8X5RYNUfjMZ6RUtTmioK7B/cYKvpo4fHYnJRvVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QNQYFSOz; arc=fail smtp.client-ip=40.93.194.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QNQYFSOz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krdP6ybNW6RX1o03xfhudYbi3VcCBaIu3gX3VYRQz34mz01vIYQAvVpKEOD+LZMxXUaD01t/FaMt0cVvsipszIck677xzu6TBVPxxNeQqyBVPfeZBhLcCnSk+2PbB4i/nX+4sPv3bo8KSphewopMkvbNJxnZHBsOOACyhRXqGzKPboIU/MMasjLci42UeL4n0goSrRTKeMT3dsQv4CSbIiPnNKQTj2LkSTLveRibRmemvW7/lDIOq26ZvMxSgznnKvQ7Gi3ZiWjApGg/LRZ5ouyeJk5cQp8T4vybhB08j+2VV3jusULd4qceLQ36qwTJav/Wcz2GLlQ4JGgfVhqA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fd+nKYpw8RSt4OHC+DMnhKsbW2rEqH/OimvfGV/aKNQ=;
 b=SwdN6/mSXntHal435E1vfZGTZKC/tyXNmZrk6DeSyC9ReR6lHr7jb5bYS4a2UxH52hSXTxy8czel6bUPCcx2bfBA0QpLJxrGjzKAq9UyAggfdUvbUix+xH58lwpsCESq8+QdeOZgYg/KOwk+CieKNI+HkWbd5QmKtmZFgr3pxEbNvWacJeLfdTHh7AtVBHGvCstZct3I+vYEWHdQSoxOUANsGwCwKv4YruxZn3lQgnO+uBvxPXYMEa1Tgm+eCMKm3A/2g/6tXhUlwchwfMPTIgO0aqGnRHhemE5YQTMlFo0b4DRgky18UhMau4QnAxoVUCZumZuwLCboMAYDeGV3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fd+nKYpw8RSt4OHC+DMnhKsbW2rEqH/OimvfGV/aKNQ=;
 b=QNQYFSOzgmZaowSNKIz0mNP7JkxDaWO1wVcJLxbCMqh9gwjcqb5zWBy/mwNoEKEeX+4IaIephpDNAbCYuwejpj4/Kwe1uNyMHnTYjR4eiFDs7ma5TxWMwjgqdW/GYANyjl/SYocPL5iRxvU4POlLIT9qY/YW/4+RjLPvUr09ThQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 10:59:32 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 10:59:31 +0000
Message-ID: <c861bda3-87c2-4415-9706-40b00d0311de@amd.com>
Date: Wed, 8 Jul 2026 12:59:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] dt-bindings: clock: versal-clk: Fix mio_clk index
 range in clock-names pattern
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <cover.1783495122.git.michal.simek@amd.com>
 <f0ef921cf0a5762c0530d0f5c4fe252ab35854f4.1783495122.git.michal.simek@amd.com>
 <20260708073206.5B8151F000E9@smtp.kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260708073206.5B8151F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: a32d2408-76b9-4118-2ddc-08dedcdffd10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|3023799007|18002099003|4143699003|56012099006|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	BS/YcLehPhTrcgMNVHqfmW6m/B1B2W2A6+ICq8sJPIjZ3GdJP7p03QZzoUi9Ko1BA/CYAQ2Rfo1hZLm96DSuxjMONYJZwUxTCFfqLfYN43zJ4APwvB5KbqPGezYtaY2aXxXSSXHRSMx9TxBO+XxJbbUWllvllynsbHyeOm5pttJ8dHcB47hMUfXU+p0n8tY5ZpGHat7rUODBG7b8CTeAL2PPS0c4Qq09SiES1li8VRuTtbLI7e++wvYEorg1CW7/ld5iBXP72TbkCqTuTscruXx19Bayx+nKYqNBtSyAVic0OC2+eeminplXovn6FFmN0brl4QcChJB0QBEK+waOMIyMSS06I+5G4ush3cHW36BLhYuailInzpUGfgo+lAaICfzIz8Dpx0MJwDRk9PjXaJdFGrArVl8PfGZEBZWWLCzU2lco05Bg0fxRBv5Ee1p/Q522pDvJa6/snz21A/e2Rn2sJmDBj/elIaS8XLrZxr2VU/ekO6E6F6hhkERaUEAjxGl/Hfnzn6mn3QxHd9SXwJghMJukHr2RUsrSdlmZUTohskkEfPshgoxTqSqVdrCNBsOUcyCQk7I0l4VCDomg2+6Zr6+ROVK67EKLvgAn2FGcwne45GkcINLahieNpR1eyeGkGqQQVLvSGSOWGGKGpIO9E2TpEvQ46hLwT7gwh2g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(3023799007)(18002099003)(4143699003)(56012099006)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3RvcWkzTTVUTFhocUZmTnpRbU5YZ0liU2ZqeXJwZnQxdENRN3ZVNFAzZTc1?=
 =?utf-8?B?UXVKSTgzWGxmOGlFQlF6U1FsRnIyaXEydVNoWHhNOGhmdy9Qd1R6L2pVZ1Yw?=
 =?utf-8?B?NDMzT0xaUzhTbkJadC9vWGlqbHNtRW8rWkNlazdNcFVxUDJxQS84THNyRmpr?=
 =?utf-8?B?WXNhRTZWNXlpVk9uLzBCMWk5dDJmL1R2VXpOTFRPVXRVQ0dDSTRZdG5xbVho?=
 =?utf-8?B?WVlwTi9OcGkzWlhQQmZSZ3dBTGdVWmJ3a3pPT21xQm9Ra3pZbWhPeER2R3Vo?=
 =?utf-8?B?dlZSU1FFSkZ2RE10L2V5QTR6Y1lBK1hpS0NPNXBPQ2NRanQzY1pCSFE4dmx4?=
 =?utf-8?B?by9wZFRORTJoajVydXdYZVFSOVhuS3FmM0ladkFNZWNSNllvcjFqcWhEVkVw?=
 =?utf-8?B?QkRKWGJqbXZOYm1FUWZiaWNaOHZBZlk2bGl4UnUzNHY1c2E5bmt2QWNEV0Vq?=
 =?utf-8?B?d0ZIMjY3VklxOWFiNjI3dnYvbGpObVZTSFVWaytRQVFHdzNiQm1TWHZDMzRK?=
 =?utf-8?B?eXVWRmtlNHEzZi9vdkJJVVlLMWJnUkx3QS80dmZMVHhXRzI3S3pIZU9Dek1y?=
 =?utf-8?B?TGkzSDJLdDVvbXU5ejF4NlpQWExRcDZiQndaM1I1MnpVTDVlaGtqVlQ5Wjc0?=
 =?utf-8?B?ZVBmR2FHU0FQQWFidmNxY0xoZVJpM1NKU2c0b1pqSUQyTWYxYTFMck1YUmpv?=
 =?utf-8?B?cFVOZjRmcXdQSUpzUmdVNkhjNjg4TnBCVzVBdkMzZjZVdEdreFhpSVRkSVVU?=
 =?utf-8?B?ZzBVYW1seXVnU25XMDVvWnY4R0tUVmRadXBUeDJ6OXFrWXNVdEU5cmF1VkNP?=
 =?utf-8?B?YmRkcERWYkRnMGZPZDc0UTI5eU9kYzBRZllFVHZ5cyt3Mm5MTk9zdnhLUUla?=
 =?utf-8?B?Y0xqaDFxNEgxWWQ0WWtLdXhLT1AvQ2YvM0ZYQ3dRbUlJakpkWGlPOTNzK3Z3?=
 =?utf-8?B?bnMzR1czelp5RVhkY2ZBR1Z2YWN4TUY3ZmIxOVJucWJ6OFA0M0hFQ0NCcU9u?=
 =?utf-8?B?azBla2FSN0FEYlhXUWhiTFBKOGRHbmFpa2xGTytDd2QwdXUzdXZRdXF1V0ly?=
 =?utf-8?B?UDVZb1YrcmJ1ZWZ4UStLN3B3amp5dW04Tmpra3UyYTJuM2UrRVpSMTczcWxl?=
 =?utf-8?B?RW9TUUNGM3ZrL0lZRUNyNC9LMWROMHQ3MndkL3FxRlViUktZN2gwSG1GbVRB?=
 =?utf-8?B?V01JQWp2eWlnMUtsSWRMVTYzY1Fxbk5xRlgwNXpFSC80RU9sS2lQVUpsNWo5?=
 =?utf-8?B?L0hlNFJBZTRsRGpRZ3dKN3dBVnBOempjUHFISzRSTVN0R2ZpWTJDckZFVVor?=
 =?utf-8?B?NXF4S1JYN2gzdWVmUG0zZ1FDL0VKTDUwalNiOVRPM1JxYUlPWjdhb1FxRkFE?=
 =?utf-8?B?RzlDU1dCemNpak9SdmptaXU3b1dKd0xpa3pCenRWYmJ6aHpweENwMU1IZjV4?=
 =?utf-8?B?eXk5aDRvR0UxeGFzdUFlTHA0RG9qRURBZTBGTU5LcjQ4R1Nwa3BOTXpONytr?=
 =?utf-8?B?cXZHcE5CSDQwRzJ3c05ic2hObjNhNTVpMnZkYWFVNXRBVlRmNkx3YW1hV3JU?=
 =?utf-8?B?aUg5cGl5d0hqVHFBTjdUVTFTNVp5MndwajlnT0VrRzF0aHVMMWxURjBMOGMz?=
 =?utf-8?B?ZEg3dmxYMG1yMlhONXFIdDNCOFFmOVR1TTE0UCtFZEx0VUd5ZzFxa2FXbzdM?=
 =?utf-8?B?eEVKYVZjVmI2UXh0KzM3aVJJcWUxVC9FOE96R0lHZUVjVlQyOU5XcjkvZUph?=
 =?utf-8?B?eWpibkVTbC9udUdYODlCMnBlS3g5VUoxMW82UHpqVnhudGRDdlhQNzNOOFhI?=
 =?utf-8?B?bTFET1RkRFFtZU5LTi9UTWRtZW1QZmRzVlZ0L3ZKRG9RU2pZSFp4SVVBVTZx?=
 =?utf-8?B?UUV0UXBia0xvNG5KMGpVSFJ4MUdLNDhFRHRPcW9idkdaQWt6RGQ1TTBhSDM1?=
 =?utf-8?B?c210eGhxeGJlS2h6SzJCVk9LV1BtK0pIV0VFOVNVYWpYblFHdXp6VjhKZXRO?=
 =?utf-8?B?SXh3SisrdXFnZGwvaUhWWVJWMHc1bjBCOFZoMnJYVGQwUi80RHVzWXVoN1Zu?=
 =?utf-8?B?WWZBWEJoRVdtS3F6V3lyTnlGaFQ4RG1EU0IwZnJLRXk5Rnp6ZVF1SGZEQmRs?=
 =?utf-8?B?aGRCSnY2M0hPVmcyRkVjUktZdHpJNHV1TVd0bXBTTDF0VTVSUlVISkJmUE8x?=
 =?utf-8?B?NlNENDRtUCtkanl3R3lUR2ZGeGZwS2FmYXpXTW0rM0hSTEQ2T1pxNFhlZjk5?=
 =?utf-8?B?ZlgraVpsN1BTM3gyT3VDYnNRMXA2MmYweG03bGl5dDNEVm5EbW5maTN5c0tm?=
 =?utf-8?B?Ymg4enViMnJ2anZQYjBseGpaUGkybGNTNU81WEx3Z0V0Skd1c3V6UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32d2408-76b9-4118-2ddc-08dedcdffd10
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:59:31.5893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUP3P4tpJx12C/RmS51nhPqt4Ygt7JoJSTb128Ctkfngwhorpb0aI04QYreUBI0Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945



On 7/8/26 09:32, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The `xlnx,versal-net-clk` compatible string matches multiple contradictory `if` blocks, making valid device tree nodes mathematically impossible to validate.
> --
> 
> --- Patch [2]: [PATCH v4 2/5] dt-bindings: clock: versal-clk: Fix mio_clk index range in clock-names pattern ---
> commit bbeb0fbfb689e023d79c16fd79850f4f854a36ee
> Author: Michal Simek <michal.simek@amd.com>
> 
>      dt-bindings: clock: versal-clk: Fix mio_clk index range in clock-names pattern
>      
>      The clock-names pattern "^mio_clk[00-77]+.*$" was intended to constrain
>      the MIO index to the valid range 00..77 (ZynqMP has 78 MIO pins),
>      but a regex character class cannot express a multi-digit decimal range.
>      Replace the bogus character class with an explicit alternation that
>      enumerates the two-digit decimal values 00..77.
>      
>      Fixes: 03d4a1004053 ("dt-bindings: clock: versal: Convert the xlnx,zynqmp-clk.txt to yaml")
>      Signed-off-by: Michal Simek <michal.simek@amd.com>
>      Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
>> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
>> index bef109d163a82..b1623c2ab0f69 100644
>> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
>> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
>> @@ -116,7 +116,7 @@ allOf:
>>               - const: pss_alt_ref_clk
>>               - const: aux_ref_clk
>>               - const: gt_crx_ref_clk
>> -            - pattern: "^mio_clk[00-77]+.*$"
>> +            - pattern: "^mio_clk([0-6][0-9]|7[0-7])+.*$"
>>               - pattern: "gem[0-3]+_emio_clk.*$"
>>               - pattern: "swdt[0-1]+_ext_clk.*$"
> 
> [Severity: High]
> This is a pre-existing issue and was not introduced by the patch under review,
> but does the current allOf schema make it impossible to validate
> xlnx,versal-net-clk nodes?
> 
> Since xlnx,versal-net-clk uses xlnx,versal-clk as a fallback string, this
> first conditional in Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> will match:
> 
>    allOf:
>      - if:
>          properties:
>            compatible:
>              contains:
>                enum:
>                  - xlnx,versal-clk
>        then:
>          properties:
>            clocks:
>              items:
>                - description: reference clock
>                - description: alternate reference clock for programmable logic
> 
> This restricts the node to exactly 2 clocks. However, because both conditions
> are processed, the following conditional for xlnx,versal-net-clk also matches:
> 
>      - if:
>          properties:
>            compatible:
>              contains:
>                enum:
>                  - xlnx,versal-net-clk
>        then:
>          properties:
>            clocks:
>              items:
>                - description: reference clock
>                - description: alternate reference clock for programmable logic
>                - description: alternate reference clock
> 
> This applies a 3-item length constraint. Could this cause the schema to
> unconditionally reject valid xlnx,versal-net-clk nodes since it forces the
> node to have exactly 2 and exactly 3 clocks simultaneously?
> 

This is fixed in 4/5 patch.

M
