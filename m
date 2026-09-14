Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013047.outbound.protection.outlook.com [40.93.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5BC175A85
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 03:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355318; cv=fail; b=KxE9R/dUXabB79Ij1yuYYi0ua3Vf37HBA/ZV1fhKP+o5bdZXe8ZjypVfGwKWzzv1rMGTE8+KjRTfBaIPk3+92jJZVHvCFRD7Yj8CG5KSyxt76A2ALwW9pmnLki3gN2XpkzERbBqtsles0tSmDzrZKmVxCkpuCCGDO6gmEDV03h4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355318; c=relaxed/simple;
	bh=/pGTSsnTs4C50cn9p7QrgFBGgz+W44hyvQwsIyFOkMU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FmhPPfUhcEk3Ld+x1i9ghdJmWgDvVqPXl7x4gym8nv+5/2/NY66SDQZl2zFYgImNEHQ6y7PteVXurVpYvpfVL+5BiYcOKq/d90IHM8CphJ1ITtNr3jhYC9gHMMAWyHZLalNTORfhx1gHhW0405DoCJXh33soQW2RxjwwKDy9shQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=h0L5fEWJ; arc=fail smtp.client-ip=40.93.201.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="h0L5fEWJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTwO4mI7XushO6YU7BRWgBoPdMJURl3P0q5UkijYFJhVZq6r0yGyDcTnUloRVGczVwMW+pSA4IErA9xigiBJXE7DfPDhF+c8aiVUnLFQG2TL122h3VTGBozAaWU80MwgOa7qHiGmODcUH3Yvbg5sif5ZBt4DArA6Ke3MpfpybAgKQ/yDTp+ZfvDvAuSYq/4GOzG8CgHtcuJOYdp3tQMhFo9rsV8tj38hzsXhRe9lk4cudrk+HgzJ7+QJe1wvmAwyokKqYV339+aG7WfmfTMVRqLzfrHS7RHoWjUsIgjNPZpQmUqyQLp2HVzILNrSssYNy63XdbSjpcbZOA5KrPWphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hxsxfi/0Ifrq4F/2gtq9Pa0m39fY4cfJdBpGkQ+FhJw=;
 b=TR5sqHXYAMasB+9wBGajZsywsQXIQ2le8ysr1AkvE/G+OmRD0Rt/B0AkDpmOYvs7tF6O+sig1OBtu6x7f570CCLWFK7L+pIIIHU2nV1qnFR7A48IyLsgG9oEZZdn7MK+xPmmxuQpPEo5gS0XjROYIy1zv3ob6N/U7wgCkEsz5rttTSdH52CwKgmokDWrpAa2O96k00uIK13lASmFSy+O0xo/bokPJjTo4yrPgiG0f/nJwpwAfuHbCHyXpvcpNOKjlYA237jPz3Wpfe3HXfKTP20b9MQcuBOHx9jw6oQHkc7f1PsYwegaat+oYRWd5ewDSZpJwlbmbqGWtOvXSnKiZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxsxfi/0Ifrq4F/2gtq9Pa0m39fY4cfJdBpGkQ+FhJw=;
 b=h0L5fEWJVKJOX4aBu/K92XYyOG5b4WniVRPOLBvsCsBp24qV61A6r+HnrWoGhP6lTfdNjchOz1iDfxnJaw43dvirp7JTkrmQ0+CuwZfPYbACZIJiOMYMYrid4FooDwGlfDW1n/QcrQ8ItnIp24rb6ZNVREnaOcxxBDnV4Ns+ppNNbjmR/6um3WQozSnuX5qxJZhIDttKjV4qMV5cxVadDmiWT38hAL6aajmz3zyTRW+sxGFUXdg4IsfQLQzFXtwNeb5JWkAtugUVCBL52nnayapd/C6ZzufGoUWR7sxb47JEul+E64pQXnAJ3V0V4oW5GPdi/Te68WJcRwx8XHd23A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MW4PR03MB6588.namprd03.prod.outlook.com (2603:10b6:303:12b::22)
 by SJ0PR03MB6502.namprd03.prod.outlook.com (2603:10b6:a03:38e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Mon, 14 Sep
 2026 03:08:32 +0000
Received: from MW4PR03MB6588.namprd03.prod.outlook.com
 ([fe80::dbfe:2474:d98e:ddf7]) by MW4PR03MB6588.namprd03.prod.outlook.com
 ([fe80::dbfe:2474:d98e:ddf7%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 03:08:32 +0000
Message-ID: <2309bdc2-f095-4982-96b8-f751a07d2ecd@altera.com>
Date: Mon, 14 Sep 2026 11:08:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: intel: agilex5: add USB3.1 controller
 node
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <cover.1789114403.git.adrian.ho.yin.ng@altera.com>
 <dba41aa636c6db86be9e0e2a3e2ae1a03095e1cb.1789114403.git.adrian.ho.yin.ng@altera.com>
 <20260911091955.52BF31F00893@smtp.kernel.org>
Content-Language: en-US
From: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <20260911091955.52BF31F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JH0PR01CA0092.apcprd01.prod.exchangelabs.com
 (2603:1096:990:58::16) To MW4PR03MB6588.namprd03.prod.outlook.com
 (2603:10b6:303:12b::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6588:EE_|SJ0PR03MB6502:EE_
X-MS-Office365-Filtering-Correlation-Id: e5337016-7936-49e5-1f76-08df120d753c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|55112099003|22082099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	M+73hyUGN4Kn7maNhja6n8v4YxgjZfp0JbUBbnqXe6rXdX5ng7gxLh27Cj08wsKd3ckYBK+QrHAlnJ3V+6WPMMjLcvQ6XtS0Mbrpv7dhRIL0LhrGXOXMfbXYETA0Sb4qcGkbyFr4/bE1uGjiiA1frTNsnGfLHcWBynLKtvDjQkogbUMpy7pccpcrWQUcjXtK1QPJ3i6R2Kh5C6KYjJw/KFkhL9RcDzQ40KsT6ZM0cBUFwoS5ACfY2BB78bWyBXaVCdJfhrILxH2BgCqsXMbkA0DWzDvx+QTlf8NWXY834jMNN5FUGGy5z1MnlezpDb7FCUoQX03gLaQ88FT/LoHrFQ++MeIaV2buZ08BdzTMgih+VU8RzlaQCqfbljQM5MTpCAqYHRyBhDlrGNUTda54uJt4Q5BBoAPh/jLSPrO9dA3Fnf4RbVjyjN7XpxOjJTeGaisnsdiGojUCEQAjLuqdxctQysd4pLzVnPYFZdg2ErGmgAT+XIQ18AN0dVu0IxjVMhqZo1JGihtj0ms7CG8hKVOqI84A1Ci7A4zTjvqk/yi4p0cGx4eRgVSyd1EDSHhaK12zhGutHJkcTmY6Ns2CQ2lzWe9QaaA2Ox22jlHxNsxlUOMwpbnnKTJGqoN+Bakmki1yiWVwr+EcJufNGZfiGH09a8tl0E9frPdc65BtQv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6588.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(55112099003)(22082099003)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXBEQXp6eWx4YXhIWk9VZFRnVTZIWVRRSFd1RTQ1Ky82ZDZYN1pJNTBLU1Jh?=
 =?utf-8?B?NVhZNmNZVy9RUmE4SFd3S3VEbCt2KzU0aGR2WHh3MU03ZDVmeERHTW05Snhq?=
 =?utf-8?B?NWpCZ2lEdEw2bFA1aFhaWUg4aUVqbTNPWG9laU5aSDBDaWxoZkhVbVByZXdi?=
 =?utf-8?B?ekp3UnZsNVRIWHFiTmJjK3Bhb1Z5OHprU2s0ZlBDaG1wSkQ4MGlFT0xickRO?=
 =?utf-8?B?V0xSb1cyNHo2azV3R2RtbjBHM3lCREdnVDJXbGVodXduYVhsUVF6S3pUREpY?=
 =?utf-8?B?VTUveTE1ek9kNDNkQnJoaVlGSUZtTWkwbnJndXBsaDVYWHR3UFFwMDdaaXlx?=
 =?utf-8?B?OHZsYW80bSsrR3Q1bXQxUzNkTWdHbkJHbVlqeGNhT1ZYalE4S1V4UEorOTVN?=
 =?utf-8?B?V2tpSHo4eEhkZkNvcnFpLzlHMWp0cFdnV1hWRU5mM3k5YlVka2R4TllEMTJK?=
 =?utf-8?B?SlJ3eUFnQXd2MFBNUXhyakd1eHR1c292R1hvMlkyeW1uZE04eXVkNzFOcGox?=
 =?utf-8?B?bUhwZ2ZYSWN0eEFWbm1TSmF0eXZ2b0VRSEVnVm4wNjduVDJqSHlvVU1ueGhW?=
 =?utf-8?B?Q1ZBcTk2aC9KOThwVnl4S3BUSzdBczZrNWEzeGdwK2dSWWNVSXJqdCt3Ym9Q?=
 =?utf-8?B?NjZFdDJBWlNHTHRISFU2eTNjckNKVC8wckZyVDM5VzZEKzJITUhBN2czTlVH?=
 =?utf-8?B?L3I4aG5mUDRmMmVpRnVjZ2p6QjdTSThUT1haT2JxYXlZZG9pNEhiMjVqbHlq?=
 =?utf-8?B?L2RQWFlSaGE5aTZxV3phSUVIRWZZNWpxbER6dHhpTHQ2UXVYNStQZThsK2J5?=
 =?utf-8?B?bFZNZVBKQkpFb0hCd21aeitFNDA2dWFPTlUybTN3MXNXL3pkSFZRd09qVFFR?=
 =?utf-8?B?Qk1SQ1kveFZCNEkvNUJVdytNcjlNTFZmajY2TzM5cU5MWHFReVZnMDBJL3My?=
 =?utf-8?B?cFlOekM3anhqWVdZM05qR2ExR3lweisyQUpiTUJUNHFkQUtoekFNRXcxMjBK?=
 =?utf-8?B?MUNCWk41NFNVZlloQWR4bGdhVkx6a0IwQmpWZmM1SmNidDVvbDdpVHR1M1BU?=
 =?utf-8?B?SlMxODQ0dzdUQStBYWIwN202NUZxQ0hiY0gxdHp3MmE0cHZJRlU5QjRvY3Zl?=
 =?utf-8?B?YU5wQW9KQmZXNFlpY1FVQm1yNU9OOUd0NXZaellodnBnd3UrMEp3QWgxUTVU?=
 =?utf-8?B?bnNGdkNXWS9uZEhRT1Yxa3F6ODlEYUxERjRHUWpvSnVXNHRva2psczlzWU9Y?=
 =?utf-8?B?MHFKaVBJcDFIN3A3dDNRcUlqRUN4cUNySHJtSkdrTERhdGdwRlJNdTA2RnNK?=
 =?utf-8?B?bDQ4L00vUEtlZ0RTRmlSQ2U5NVhIUmdUV3FGYlFqbnlYWGkzeDUyQWFYUUMy?=
 =?utf-8?B?Mjk0ZDg5OHpkTzIrbFZtWml2ek9uMTNuWlFqTDh4T0VHNjFDWWZ4M0pyci90?=
 =?utf-8?B?Y3hXSmhNNENBbkMyTXVuODlWYnJHeGhqSy8zZ0xWd1d2VFlraUVwa0xlQytR?=
 =?utf-8?B?eGxWOXg0QjRKUFVpUFdnZzBNWWNxS0ZFZUE5dzNIN05maWxRbHRtYjF2L3p6?=
 =?utf-8?B?eFlOT3VNWkx3K1VPblVLNnpUTzV4NjZNUTZacXJST0M2Nm9zV1NBM1BXa3Bl?=
 =?utf-8?B?U1JOZTl1VmhhVVptNFBXbFdWdWRwbk44V0ZWTEg4V0VYM1c4aC9WMDhja3Ni?=
 =?utf-8?B?bU12MlNhK0k2ZHdDQ0RSb05EUTI1WlprTXhkUVhQeGZkdWdMZ2ZMdVdpaWNm?=
 =?utf-8?B?NWhrVUZSK0ViMTV3eVM3UjFBeThVTUpFNHpmK0REVmZweXBVMEdzMFNFd3E3?=
 =?utf-8?B?RGxMOElyOHFRckxkc1JzdithVlF1ZXVHaHcyL0l0aUhlWU1IcmJjVlFLWGZk?=
 =?utf-8?B?UHRaSG1rcFZVNUJ0aW9JekZQMXRqR3EwTFJvREpZOG55N2VqS2lMWFowT2ZX?=
 =?utf-8?B?ajF1TjJmb09iaFpSUDY2U1N0K3daWlJubGtacW9NbTRYdnlHWnQ4SEJHVzIz?=
 =?utf-8?B?NUJTaEtMTkV5akRyekVISTJ5V3R4ZnV1R2tGSzdveE9hUDZQN3BpZVR3MXlX?=
 =?utf-8?B?anBYY0lxaEF1eUpJc3BtZFlJalpWaXM4UDJ0SC84ODRTY1BuN0Q0Vm05QmhE?=
 =?utf-8?B?K2ZMZ3BXelJrTXBoZlVEell0ZHBuSmlWa1loZUhVTnNKY3B0T1ovUWYxNmRs?=
 =?utf-8?B?L1BMSDJjbWtWTU5qem1YTTVqUEtCbTdLTkUycVMrYTkzb2dkakV2U3pFTWl0?=
 =?utf-8?B?SGtORVZzeVM3THdQRG9VeGJ2Q2ZBSngzZ201N3lOcWFDM29lcDJtSWlLS28x?=
 =?utf-8?B?TzFoVDlRaEhlY0dtSkh6U2ZJRUgvMTVONmtIbmRSRncxNTFlMk9DWkFIUFFO?=
 =?utf-8?Q?5EekofvQmg1XTZQg=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5337016-7936-49e5-1f76-08df120d753c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6588.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 03:08:32.4468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSeM4nhpD+fe9kckm0NZb49vles9FPbw/ZBpS8FxVB+5V70+wFEzb8mkLu9xevfNwaOKqyhVnkRrHQen18zWVpqLh7TIdTbuE+ER+X34mjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6502

On 9/11/2026 5:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing fallback compatible string prevents the DWC3 controller from probing.
> - [Medium] Devicetree Topology / Address Space Overflow in DMA ranges mapping.
> --
> 
> commit f5eee55ab58207528984fe03c0204fcdede698dd
> Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Date:   Fri Sep 11 09:09:24 2026 +0000
> 
> arm64: dts: intel: agilex5: add USB3.1 controller node
> 
> This commit adds a devicetree node for the Synopsys DWC3 USB3.1 controller on
> the Agilex5 SoC. It places the controller under a simple-bus with a 40-bit
> dma-ranges window to match the interconnect's DMA address width. The
> controller is also enabled in host mode for the SoCDK board.
> 
>> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> index f54767d1526e1..523f722a2a642 100644
>> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> @@ -493,6 +493,41 @@ usb0: usb@10b00000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		usb31_bus: usb-bus@11000000 {
>> +			compatible = "simple-bus";
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges = <0x0 0x0 0x11000000 0x0 0x100000>;
>> +			/*
>> +			 * USB interconnect DMA is limited to 40-bit addresses
>> +			 * (1 TiB window from 0).
>> +			 */
>> +			dma-ranges = <0x0 0x0 0x0 0x100 0x0>;
> 
> [Severity: Medium]
> Does this dma-ranges mapping structurally overflow the parent bus?
> 
> This property specifies a 1 TiB window (0x100 0x0) and maps it into the parent
> bus which only has 32-bit address capacity. Since a 32-bit bus can
> mathematically only address up to 4 GB, could this cause DMA configuration
> failures or silent truncations depending on how the OF core parses the tree?
Disagree because: the entry matches DT cell rules for this bus, and the 
size describes the DMA interconnect aperture, not soc MMIO capacity.

usb31_bus: #address-cells=<2>,#size-cells=<2>; parent soc: 
#address-cells=<1> => dma-ranges cells = 2 + 1 + 2:
<0x0 0x0   0x0   0x100 0x0>  /* child DMA, parent CPU, 1 TiB size */

OF parses this by cell counts (of_dma_get_range); it does not truncate 
the size to the parent's 32-bit MMIO window. Same 40-bit dma-ranges 
pattern is already used by dma-bus@10db0000 in this dtsi.
> 
>> +
>> +			usb31: usb@0 {
>> +				compatible = "altr,agilex5-dwc3";
> 
> [Severity: High]
> Will the USB subsystem fail to bind to this device without a generic fallback?
> 
> This node specifies a SoC-specific compatible string but does not include a
> generic fallback string like "snps,dwc3". Because there is no matching driver
> in the kernel for "altr,agilex5-dwc3", won't the DWC3 core driver silently
> ignore this node and leave the controller unprobed?
> 
Disagree because: Agilex5 uses the dwc3-generic-plat path with a 
dedicated compatible, not a glue parent + child "snps,dwc3" node.

Adding "snps,dwc3" would violate the binding and could make 
drivers/usb/dwc3 core match the same node. Probe does not require a 
generic fallback here.
> [ ... ]
> 

