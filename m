Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95179436BD0
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511527; cv=fail; b=nr5tMsSWYzVh8T1uKY6S4ats0ZA8lDn+dLX2CBuvXY3Ux222KQDlusJ2+jZQnThFmXB/yF6CYgyYPF0pYmulQihlrstYYRNQduV9ol1eIdyxwWG2ihFpZIbGROj/5XoSoWcbxt0GhsRt4qn4K5rtZAd0NYSQH0ADNeIVPbRQ7Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511527; c=relaxed/simple;
	bh=GY2+GXQ0BQ6aS3mChGt2abL4BdyQMN/Z9ENBwQr9KQ8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XZYv5/nLKsTRTld9UjWVfjmku0P1/i0YKt/4h1UvAiOp7tLMVSSUHlnLvv95agAwasYKbz768BmV3k8iegNCxteQbaOJQSaP/s7wCf8w3EP72kHcwI13oi3y+0zYfuzSipo/xGzN8/Vg0JotAr8OsnrzqIGJwIaeXus4GCRfeNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u9x8PQjT; arc=fail smtp.client-ip=40.93.196.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u9x8PQjT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFYynRYUbxkKcrgAPO6yBRDFsbNWEJnHDZrDTk8etUhfWYcxkBHmDvhWf6hq2D6zamlgZshWIsENKMgIS4/9HR0/N3O3kEPtjCNcmH4cJaQkHS7N76NvJL5LHvfVWvgKhjbdJ0M2r/GFMll85TE2OloJo2b4MnDjvTi3RnaW1V5zTDOFc1tRzaRMWtxRDz05FIOpPHdXoySI0kPmV3tyMBs+yNr+2xiX1LLvGbjW8r0SaEnDSjdDixojV522TvpMSJJULBkyo4sbbqvwgUQyMOCzBoJh+za9h5VAndjhK4ptaNumbfPbSA31WUDw5Qul+GF+n5akAkeb2OIJtvk1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf5to98w9ktnpJe4o+TnWHxRWo9tzL2yrgFdOaGukuU=;
 b=P4zlvnsBEHuHVgzR4ezLd6qQrC0vO9pHyR096FNJwuP5vCTSpBuTCEPciTw/1wsuYejOtc+eviTHg0IUMWIZWMZ+s9RZ7z7Kn+Ff1Vua7/kEoVmYMKSnL661bMlFA3SEEpfPvzSJ4GM0niABf0s/BapGxboBJedS/u8rp5wys2eyZQ9S68CmM4pS3v6tl2I580cLR2CofcFk0RC4XpnTCJ0NH0y0VLwzIgPITEiPrYzT9Sj5Vx66B9HkORU3EtmJcX1Xu9ZjnHEHu7AGxB5sB5OYgqwrxUF5b7ElUlcj7u1gNjoAH/OOlCkUulTQ9bVlWmakWLFKt3OhUMfmxWzGTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf5to98w9ktnpJe4o+TnWHxRWo9tzL2yrgFdOaGukuU=;
 b=u9x8PQjTpOwI4cQ/odim2PtIMLsJxd1Yx/uoKjQmgci2OLPkXb6c+BsS8aPQBL/NoefJbBZZtjVFqGply/Kryh4OrynmZAerEi5ihW9OaQRWsWGEZiAmceMmP0Msiq7pD9a1KA0xrIhpyyHp5WBRiW2C70ORRPJY5svbT869ALA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH7PR12MB5928.namprd12.prod.outlook.com (2603:10b6:510:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 11:52:00 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 11:52:00 +0000
Message-ID: <5f492b86-319c-4fa8-8d0a-c729f21d643f@amd.com>
Date: Wed, 8 Jul 2026 13:51:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: versal-net: Switch Versal NET to firmware
 clock interface
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <cover.1783495122.git.michal.simek@amd.com>
 <c1e9d7f1dd555ff96bfda6afa727205a8a3e53c0.1783495122.git.michal.simek@amd.com>
 <20260708074202.74D461F000E9@smtp.kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260708074202.74D461F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH7PR12MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 24246ee1-7dac-494b-e99a-08dedce751c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|5023799004|3023799007|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p+Xa57RqxzqHAy1Bt/5bFeLTJ2oPi6JZGPUVE65NKTC/Rdyw7HBZA4KUaKuo0t3Hn3GHuO/IYnSz4R+6g5BRAOf6AyE32YM3VPvEYbU5Z0rOIVWj5q/JiDmFzeA27UC2IXa73NVsaVeKZFM+W5RfeMOCtyuv2gMGPx9e0Cpi9ecEIh50ZOAUnN4r2HB+07e26dyVPU8C8FvYY9JPQCGzHjwjeCEcMMAmPItZZOBsmYNF5ojHGk4EZT8+5fLfKZAFq3V0AlvqY8gTkWhCe4a15B2ibT1nZfM1C3L/7TezhuclqdL76AjuhYQ7Fn67nC6n1pOSJKwq5/YaMNIU1TgR91m0RsoK2TiujhNKzyFOH+XPd6x3VijLFkkCBBLbNeKtWjRinDSljqP0hTJwa929VoOcMgPmlAr43N+1sV77kuWfK6vWNVkG7Rj/gDk1SHosMBvfs4JoLodWtgwUKOcaj4YnY5JOyZmJzc9SBKvEfkXuGrayJBWQJ7GnsrjwokdWb/OXnlrSHa1mj7QztzwJgica7OlsD8xLtvj9CBljrbQd1+FL/xdFc/3+Fv4dt8kIO0fmcv7Nu+2eiSCCGDVQCPh/md0DMQLQrAf0ZgR0y5hDOpeY1PuSqaxXQpUZ3sbmTpFMucUAXHPQ03rhQ5YcyIdoe2mLBuiK0Y+zFx8pPaQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(5023799004)(3023799007)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzIrOUpaM0owd1kyaWh5NEhUbVVOUlVNL09iaXM2NlpJa2JjS21ESVFtdERi?=
 =?utf-8?B?YzE1L0hOTndYWTBBL2hRSFJWM0Z1UkN5SmhrWmRJZTlZQmpyVWljVnlUZFl4?=
 =?utf-8?B?TE9Ma2ttckVpbzhtNEtBdjI0WGxxZHFiWGFESS9tckdYTHVuWFpraHhxeGJC?=
 =?utf-8?B?TlMrbjVad20rZnd5cmdjL2hmRjR6SmNITWk2T3BLVHE2SzNXOG9uTE8wTVJr?=
 =?utf-8?B?aWN5MEN2QUhVOU9TcmJlTlpuQVFleXpVbC9PNzFFeUdhUld4SEFtenVXeXJ1?=
 =?utf-8?B?amJqZGZTSlZWcjZTbUVvNGVlb3N1Y3BZYkRDbjRQTXFkQUR3V2RXa0oxbDM5?=
 =?utf-8?B?bjBUcGJJZHZ1N1B1SlNJQlIrNlVmYWxkSnpSTFVjbEdJNVIvYUZZekVZdmtt?=
 =?utf-8?B?aG9Cc20vTjVSTmduQW9aOTcrcDMvK3dldVVVdWVmNlF3Sm9vWGtTMzNTMVNT?=
 =?utf-8?B?c1lBc1BxUlpvc3VSSm9JZXpDMmpHelB3Sno5UUVYRDQvSWdGS0dIZGZkTkFF?=
 =?utf-8?B?eGhRTDMzU2dkRUs3eWRONUdTenFCbFVDYXlqWXNiQlZDU3YwZzViSU11TDZT?=
 =?utf-8?B?aThHN21aWVBRdHQ4YTB4RVdrZzd5QW5ZS1lFUXJsTDgrVTdwd09kbEFzWjRx?=
 =?utf-8?B?OXRKS1lNbkJxTGpLL21GOG0vM1h3dEdMQ3N2ZS9WakRHckY4Zjc2Y29WeUJB?=
 =?utf-8?B?cHQ3dklRdDRIY0VnSzVVbDdVTVdTWVM1UWJLSGFDYmdwcU4xc2xsdnFLdkhI?=
 =?utf-8?B?TU9DVXpkYUQ2VUVzczZoRzBNOGI0a1RFYXNMc21pajczZklvcC9TV0d5UXFh?=
 =?utf-8?B?dnViZE8vUlYxMUhkY1NZNCtnbmNoK1VVYlc5MldwOTlmWkcrblRmbjl1ZTlw?=
 =?utf-8?B?Nzk4SEtaTXEwSWttVFAwdHY2anhHNFd6TEhKT2c0TkJWSDEyc3V1V2h3YW1G?=
 =?utf-8?B?MWdVZ3RMUXZyMzJBMk1yTTVuOUhYWjA2Z2IxckpJc2M2RkpsU1kvcmtsMjVh?=
 =?utf-8?B?NTVhODM3c0thcjJKVU1qV2pGandLUmYyc2JQVUh1TWpFaEEzSlhPSis4UG8x?=
 =?utf-8?B?SytWaGNXa3JNbmdxNUdSNmljVHFOM1RpWmxNM3IzeXFnVGVId1pXQnlUdlVC?=
 =?utf-8?B?UmRjZVp2NEdyczJhUlNMWC83NjBNWlZnK3phLzl6Rzh3VUVsczk3UWl2bUFr?=
 =?utf-8?B?UzJ4Nm5iWDhIUnl4eDNIKzVzUngvSXFtUUI1VzZUNndJUXlPU1BKZURodzJG?=
 =?utf-8?B?ajJsUGxXSHBKQWs3OVIzWWwxUFB6Um5SanFWSTNnWU9PTWM0b3FVd0VSeDh6?=
 =?utf-8?B?NGNHMytJbkNGZm9XelJsbTFkS21VVWVnanMyeDJQSVI4NE9zekRWakg5VTdl?=
 =?utf-8?B?alFQVVRNOUR1N0E4R3N4MzRhbkR0TUtPdTZDV1gxcmZkbHpkWWowQVZEa0RO?=
 =?utf-8?B?VFVpRlk1d0lCWFVBcUtLT1FYOHBIb2s0ODIyNkFMVW1BdmdRVEpTYXZSUy9u?=
 =?utf-8?B?VG4xZHhhUXJJd2NrTS96Nnl4Y214WnYyYk5VbmJKVC9ZNm9HQXBCYkJBNHRG?=
 =?utf-8?B?Rmova1BESTl0Zzc5V2wweXhRaG1hb2RvUGJjenFGS3pzWS9CTER3V05KNXQ2?=
 =?utf-8?B?cmVSc2JvckVGL3hLcVJaeHQwLzZQaDNkdVAySlgyeU1TUExHUTM5a255Q1ZJ?=
 =?utf-8?B?eTdnM290ajlDdVlHbzVIZUZpd1VhQS9vU29nMkZsK3FRY3RleHVQVXFZM2Vt?=
 =?utf-8?B?dUpGZVQyQ1pmMWJ4ay9JSEtpTFFrUzBYS01TdVZsQnh0UnRoUWl3OTVnallh?=
 =?utf-8?B?c3hENE5GMnB6NjhZVitYV0w4L2VCaTZrcmJSMGZ0elMrOXNBRXlkUXM2OWQr?=
 =?utf-8?B?LzR6YzQwWE5HSHBqa0VoWGpURUxVZUZRUVdqL1Q3L0VjVUJhK001NzFlaGVU?=
 =?utf-8?B?d2VhODNTTTZ0Q2lqNkcxWnJ5eFVCcTlqZHJqQzcrd0h1aGJSOEMzNmsxRVNQ?=
 =?utf-8?B?WmFheG9uTDV3SWlidjc0SjN1TVlnMGN6MkF6QUhGNnJNWlJNRGxVQzhrYTZn?=
 =?utf-8?B?d3pWTXh2V05TcDhxMDJmcXlBVDlWNE4rcWV1aTF4eUNoVzNwS2hDMTRjYmVW?=
 =?utf-8?B?QnlCRGN6d21wMWJPNnRTY25HYW9sQWxQcjRxMWhCeE9WdHgwbWxwa0tSd21l?=
 =?utf-8?B?Tk5Nalg1UEtsNndOZGxSbzBoZ2Y5TWhyN1dxUTZ2TlZmYWhEZ1JSRnA4NktX?=
 =?utf-8?B?LzZRV2w1OVJZd3NmcHZZc1ZvMmRSVk5jREZkRklTcE1YRjNFcTRiUTBkV01S?=
 =?utf-8?B?TW9yOEh5cWlHRXRPMktZUjIxK3RPOU8ycFVjU05FdFR1S25WcDUyUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24246ee1-7dac-494b-e99a-08dedce751c2
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:52:00.1939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZLuWzvk252omIjDpxUT188zQLG78+V7M8XnInHFPblPmLVxImxm3fBraga6TOkb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5928



On 7/8/26 09:42, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Device tree binding headers are incorrectly placed in arch/arm64/boot/dts/xilinx/ and duplicate existing bindings.
> - [Medium] Use of #undef directives in device tree binding headers to remove inherited definitions.
> --
> 
> --- Patch [5]: [PATCH v4 5/5] arm64: versal-net: Switch Versal NET to firmware clock interface ---
> commit 768ce0b0d6c0eff83d929d6530cf30c0e1e4baaa
> Author: Michal Simek <michal.simek@amd.com>
> 
> arm64: versal-net: Switch Versal NET to firmware clock interface
> 
> Switch Versal NET from using fixed clocks to the firmware-based clock
> interface. Add DT macro headers for Versal NET and base Versal clocks,
> power domains, and mandatory resets required by the clock dtsi.
> 
>> diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h b/arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
>> new file mode 100644
>> index 0000000000000..d0c4abf78f307
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
>> @@ -0,0 +1,123 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2019 - 2022, Xilinx, Inc.
>> + * Copyright (C) 2022 - 2026, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _XLNX_VERSAL_CLK_H
>> +#define _XLNX_VERSAL_CLK_H
>> +
>> +#define PMC_PLL					1
> 
> [Severity: Medium]
> Should these device tree binding headers be placed in include/dt-bindings/
> instead of arch/arm64/boot/dts/xilinx/?
> 
> Placing them in the architecture directory bypasses the convention of having
> binding definitions act as a shared contract between the device tree and
> kernel drivers. This applies to xlnx-versal-clk.h, xlnx-versal-power.h,
> and others introduced here.

These are just holding constants and current file sin dt-bindings should be 
deprecated as is done by


commit f0ceedd52a69a8bf63778b1fe9e1c10e02ecd3fd
     dt-bindings: xilinx: Deprecate header with firmware constants


> 
> [ ... ]
> 
>> diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h b/arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
>> new file mode 100644
>> index 0000000000000..4a6add03c173e
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
> [ ... ]
>> +/* Remove Versal specific node IDs */
>> +#undef APU_PLL
>> +#undef RPU_PLL
>> +#undef CPM_PLL
> 
> [Severity: Medium]
> Will these undef directives work correctly with the device tree schema tools?
> 
> Since schema validation tools typically use simple regex-based parsers rather
> than a full C preprocessor, they generally ignore undef statements. Could this
> cause the validation schemas to incorrectly accept the removed IDs?

validation is not affected.

> 
> [ ... ]
> 
>> diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h b/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
>> new file mode 100644
>> index 0000000000000..fe00f4a0ba65b
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
>> @@ -0,0 +1,106 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2020 - 2022, Xilinx, Inc.
>> + * Copyright (C) 2022 - 2026, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _XLNX_VERSAL_RESETS_H
>> +#define _XLNX_VERSAL_RESETS_H
>> +
>> +#define VERSAL_RST_PMC_POR			(0xc30c001U)
> 
> [Severity: Medium]
> Does this new file unnecessarily duplicate the already existing reset IDs
> binding in include/dt-bindings/reset/xlnx-versal-resets.h?

as above.

Thanks,
Michal
