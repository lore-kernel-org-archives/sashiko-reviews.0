Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012009.outbound.protection.outlook.com [52.101.48.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762EE1F2380
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340318; cv=fail; b=GVh7EHVwyJGCVToOvPmBJR9c1QpIP7vS2D7Mt2BVS3wIFjinYhOWWowBC3hysXYPfdx6+6ZibBzifP/k7OyZJEZ+TpVg8xsfySSD4NOftQq4or2InDob7myC4dcIU9YriWMyOho3i4DC8CitQYRkdBnCHpi/8j1SYkDlQEH0Ygw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340318; c=relaxed/simple;
	bh=oEi2TxBsZewK5hZWG92KAPbBN8l+4czI8Kq88syZLYQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N6UsGAUYMpry95qF2KAwByf+4NV1dNmQL8ZwYhqT4GTfPwb8bJQnwvKb9ZxqsbiAqmSfwSbaC4Z1bmvQNXaUkhI1rkZXKRKIh69dHn4yhrjNsYRhUQET9CTy9mbB+mdtxpqF12mdC7ZgRwsudfTg9WB/hiYDTXGbBf2O1HVlayc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xAhHRK8k; arc=fail smtp.client-ip=52.101.48.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xAhHRK8k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBXQqZ6B4Mb7XpfQe5JA3aLjYaVsjCW+tV3wAx9AhyrJURLF8SvJjeU5+FsW8MkvFWXELLjGACiZN8r473439ig8aNM/Va3G2nDeCmiWBfMvhncplrhyoTEaRfAqi9GJ0hMk4dr24eAiWAHznpTAU4fTrdCK9mWfSuz3xrMw/RzbwrwT0PdXEP+sJIi8SXNy0ycmxF2hcbr6CB9cc++WyejHkbamyCa48wHCBze0ju/hV1qySt/Cnegqj9rqXlx8lqP8GjcSkbrtHDPc/w0PtSutYKzis4P9orVXEwg14t1XlAHv5fEi1vooBCfNShIV5jeL7OMmLHqI6cEDW/cS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzK5UMzv3MFSYxVwybeRHsy/jgKckctqsQoA011ie2s=;
 b=hrQCxpYKVdErSPkisf6f8bz0IZZTXP2WTZN9apCY50GhwxQxSpxdC2Pa9WWLYm30xrhNfa/ki9jFOT+ipFid5Ek2oDfMrbEiZWXsOOGAn+/y4dtNm6zOh/QudQcc+joXrkvM96f65pmxpFNtUMvJJk5jLxuirGoX3UMbVftbCDAbjD3DsxT8xJlnjFm0+DdinluaU0ryj/3mGl+R30yQuUUyyGWNgtore5/w0oofW8gy9FBWoDIuibfZ0ViMauf1iZZy7i85prVT6xom5AqzORsN/PzAZMh1Jy1Rom02iaFLjhuRmnoar0EDf9o2SKeJrrhTjMAjRrmXqS+iU46pCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzK5UMzv3MFSYxVwybeRHsy/jgKckctqsQoA011ie2s=;
 b=xAhHRK8kPP1/rXEt/dj7f4R3hCVABZazrRPA5pg6vd572AXLIQuZKFeDA6rpCAHVtWkUQ4ZW4xgLF0I4DbusI750kft/7iMduniGUExTQjPe8eL8IA1cCj+PINbXjh8ifAd4/u97UfTOT90TgmqzBwbIL4fV/VA9IFBUiRsa3sI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by BL3PR12MB6620.namprd12.prod.outlook.com (2603:10b6:208:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 15:51:49 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 15:51:49 +0000
Message-ID: <f0155d9f-aeb0-4118-b39d-1be22b6680ed@amd.com>
Date: Wed, 29 Jul 2026 21:21:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] clk: clocking-wizard: Move clk_in1 acquisition
 before static-config check
To: sashiko-reviews@lists.linux.dev,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
 <20260709111403.1579159-4-shubhrajyoti.datta@amd.com>
 <20260709112505.05C9F1F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Datta, Shubhrajyoti" <shubhraj@amd.com>
In-Reply-To: <20260709112505.05C9F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0077.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26b::13) To LV5PR12MB9828.namprd12.prod.outlook.com
 (2603:10b6:408:304::19)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9828:EE_|BL3PR12MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2b6872-6ef5-4950-2d29-08deed894ccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|3023799007|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NQ6v/2mkmf86SmlrEp19eld2p9gkwWPVdKLD8Ex9Q/mt/2Pp/ht/4GNFq4NUj1gzSC2dcNcdPkrGQu8+pR9RNTbrKUnN2ziMHJx7aoXlTAwordz7UIOld4v92xRGlIgV1vwJlBOqPtcibGIzh01zJ7rD6DVZbzbOZbN0lb2WkK2LyI91yqWBaTX710EGxLN0vVFia0Mf4R1qSJI1yWsfSx1bsk71l21+Fl4wXe+Ci+5LLxtqcuQDv/+xbsZydfyE5vBn3hom6qTxg6XeuVzJivXe7g+YhVaQE3OxYSETskXGxJfiSVlOyFwSg49oJuPwjU2iAmj6IzTuo4TqZvrLDw5A5PgU5END0V/u2RikdXsaVp78tVZX23zlDrB9ltbrPaKU3IcgGlToMeyoQsLB5wGf3NbNGPDWCqqII8/IVjuyybr7nSVMr9w7Hin8cj9/eH1E6LDQeKzwm2cz9E80O01NDJKq84cWx/UvTiiFyQ5msLQ/jrS9nB4XRpWjY6pNLmdy0ReDHiezfZ4VV7PK12+kATMoFaCdfRAfPh456ghmNtgJYXDaImbB7/7q0/KAfCVFiUa3j92yGQ8ImdVQYtnjOxXoI6KAZiVJJlusbgo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(3023799007)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDhaWFlQQUY3Vnl6WTJ2S1dPUFU5Y29aTlB2OWtONm9CVlZPQTlsa2VkZlhT?=
 =?utf-8?B?VHpRRWdLL1BiZVMrdWx2eTBqNnkwaEFpQldFdHEwOGR0T1pPUmVaMytTb214?=
 =?utf-8?B?dlhBV3o2akhobm5OOVJoV2dCbTR0NmQ4bFdhdW9kUFFuQUNCWm1KU2xXa0Fa?=
 =?utf-8?B?Rjh6b3Z3UGpOZnc5QTBEaE5hQmJUa1Y4bjJyZDEvWWt0WEk1Y1JxL1VKckR6?=
 =?utf-8?B?RWk2dlF6bUZ1SFdpQjFCS3lwWkNINENrNEdQUVBNYVM3Z2hrM2c5SzlkQ2hC?=
 =?utf-8?B?d1djWWIrbUNMQVV1NkpNVWVmc1Z3b0piRDZ5blQvWUpMdWVyMEVWL1RFYWw0?=
 =?utf-8?B?Ulh4b0E4eVFyRUhicFRTNXMyMm1JaGw4akVxcFk3ZG5oSjdWVG1DVHp6aG1k?=
 =?utf-8?B?aGlZR01MRy9YMENzTFluSVFBOExPemFlKzE2alUvd3g1T0txZVc0Vjczc2Zl?=
 =?utf-8?B?bDRtRDFqa05jLzlZWFU3WUlia0pxNlBES3dpWjFhZkxsUG9HdFRsTUdGeGRU?=
 =?utf-8?B?aHlYWnZyL0FLYjdkZXRsQWw0OG9udFIrRFU1MlhHVEh1d0lTend0WTZpTXh4?=
 =?utf-8?B?UTk0ZHJzS21WMVY3ZEpiVXMyeCtqcXd1SFpWZUNmcmUybW8rb1RMblFsdUti?=
 =?utf-8?B?dVB1emNpS1ZVb08xM1YwamFJVGhxL3BZclYxbGJxTmwzK3VzSjEwaVpvTmxs?=
 =?utf-8?B?MXlmNWJXK0s1eEkxSXZyTUlybHNEMVlEcTg0a2Ura2R6Sm5zdWhxY21RNVRZ?=
 =?utf-8?B?Rkt6dytVaWFYbXREQnhmYS9KUGdtdVdiZGtkR0ZlVVFybHM3UmZyOEl2ZDA3?=
 =?utf-8?B?V0FYa0s3Qi93MHUvOVJWNStxcDZpYzZFWmp3YjBDVDdPVTVIWUxEaGFZaWVp?=
 =?utf-8?B?V2pVOHdES1FJeHBuL01JN3dFbXhRbFhaS0lhRit6YkV3M3RmcEhhenVYazVq?=
 =?utf-8?B?czJGaG5hNWFGRzVzN1V3MGxQd2k4RDQ1bGs2T2M2eExDelpXSVVSSFB6ay9Q?=
 =?utf-8?B?RVpDY0FXTXpTQXpJdlJwSzRuZmtUbW1wM3JPNWdlL2VLWHRmY0dkWGtEd1c5?=
 =?utf-8?B?Tk5yS09jK1c1aHpEc3hVcGRkVUY1dW5YVnFDdGQ3eXFXM1B5dTVDU2poOWVK?=
 =?utf-8?B?U2k2WmgrRG0rOURoMEZjRFZWaEsyOUpmektDN21acDNNcjd3RE9YVUNRN1dQ?=
 =?utf-8?B?US9ZOFludVBvUHJ5SktNUGdVcHNxQWVyZGRxcHNjeDRrR1dncG5WYXVaVlls?=
 =?utf-8?B?NTFZSWo3TWZhOFZ0dHVzdDYvMXZVWkQrYkROUTF0VEhneHBkaEpJaFovWUFs?=
 =?utf-8?B?ZU5CMUY2Qi83OXdoMXNmNm83MEFjVWNJSFN2cUFlcVZneFBEWWdqWkJhL1RT?=
 =?utf-8?B?UzBkTFZKcXVGRHAzQldIenZyYllVY1hITmZ1c3kzbnF0QkRWcmFCa0hEVHE4?=
 =?utf-8?B?ZHJDMmtnRDJJUTgzNERKMmljSGpBR1dJTkdYSW9yZVoyU1hlUjJDd2VKMnBS?=
 =?utf-8?B?Yjg5VFBnSFo4eGx1b1F5aEVUelJJN3I0RldUR0NTK3Y2SGVhaG5WeWxyMjBy?=
 =?utf-8?B?SGpkNGM0TWRnSXBrbTZiK1RrSHJVdHlrOGFrbVFERjBHSU04cERDekozWFdF?=
 =?utf-8?B?ajB6NjBkaDhENlNTUUFrNEplWnI0Q3l6Mm5HMHpCNG1hdlBKRUYwV21seDJu?=
 =?utf-8?B?dnBqQmlCN0dERGpaVTJIUENlYStGbEpYYWNvM1FVZ0FXSUl5L2hjSmJxcWI5?=
 =?utf-8?B?SktYUmtWeUF3UzZldmY4eGRkRUR4K3B1U1VnTUtydGVpWUNIM2pOSDQvWExk?=
 =?utf-8?B?c3RVUlh5bEswTWdnbXR4YnUraDQrcVd0cGNNNjQxaWIyZ1l4QmhwZnhWVjVN?=
 =?utf-8?B?a3Ftdk93WVhsVmNpK0pxVkEvcUZ6M2tWa0k3Z0wxUEJFRzNSMm5nUVJXOXFr?=
 =?utf-8?B?U3NKSG1PWjJHMjVPdlRjUDJIeTZzTkRINjdIOEw5S1VlYTdjcStPaFk2ellw?=
 =?utf-8?B?UG1UN1MwRzM5SVQwT0pEeVppOUp3UUhjTGFCMTlEYW1UNHA0bVJzd2EvTG81?=
 =?utf-8?B?ZUl1eUQ5OEVyZXgyZXZ4b1pJcFk1d0dyQUsxZjUza0pobXB4RTZWa2ZPQldV?=
 =?utf-8?B?N3NMSUM0ZVhYVzRQQzNhMmY1dDFtN1BSc2xhR0JmWDMvcFFoN1k2Wmt3RWdm?=
 =?utf-8?B?bkhnb3NuLzM1ckU5cysvOE15bzZJUXZmSml4RVhIN1o3Njd6MnNDbW1pcWJP?=
 =?utf-8?B?Tys3YnpNaDJuY0ZuVWJUSVovbkVxcWg4c3BpbjZrcDg2TEVabWVlT0x3N29j?=
 =?utf-8?B?NE9qL0daYjJEcVJkcG9ZVW9LRytsOGpSdmdhcjMvRmlPUC90OGhDdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2b6872-6ef5-4950-2d29-08deed894ccc
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 15:51:48.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZ/0uIgImXwcBF2eFbq0IquXeHpE2QxnS9NXfwTD/a2HB/ZuMdCksggOxhGOvT/aXQLwR494KZQBR9nk+x5YgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6620



On 7/9/2026 4:55 PM, sashiko-bot@kernel.org wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unmet dependency on `s_axi_aclk` in static-config mode causes probe failure.
> --
>
> --- Patch [3]: [PATCH v2 3/8] clk: clocking-wizard: Move clk_in1 acquisition before static-config check ---
> commit 2d23efc5eb24a84c2dc3c21068e9e68c699593d8
> Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>
> clk: clocking-wizard: Move clk_in1 acquisition before static-config check
>
> The clk_in1 is the input clock for both the dynamic reconfig and the
> static-config paths. Acquire clk_in1 for static-config as well. Output
> clocks are registered as fixed-factor children of clk_in1.
>
>> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
>> index e082051221bef..ffc78c90bee6f 100644
>> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
>> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
>> @@ -1178,6 +1178,11 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>>                return -EINVAL;
>>        }
>>
>> +     clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
>> +     if (IS_ERR(clk_wzrd->clk_in1))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
>> +                                  "failed to get clk_in1\n");
>> +
> [Severity: High]
> Does this probe sequence correctly handle devices using xlnx,static-config
> without an s_axi_aclk?
>
> Earlier in clk_wzrd_probe(), the driver unconditionally acquires s_axi_aclk:
>
> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:clk_wzrd_probe() {
>      ...
>      clk_wzrd->axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
>      if (IS_ERR(clk_wzrd->axi_clk))
>          return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
>                               "s_axi_aclk not found\n");
>      ...
> }
>
> If a device tree specifies xlnx,static-config and omits the s_axi_aclk clock,
> wouldn't this unconditional acquisition return -ENOENT and cause the probe to
> fail before it even reaches this new clk_in1 acquisition?

For static config the axi_aclk is skiped in below patch.

[PATCH v2 5/8] clk: clocking-wizard: Skip s_axi_aclk for static-config - 
Shubhrajyoti Datta 
<https://lore.kernel.org/all/20260709111403.1579159-6-shubhrajyoti.datta@amd.com/> 

>
>>        if (!of_property_present(np, "xlnx,static-config")) {
>>                clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
>>                if (IS_ERR(clk_wzrd->base))
> [ ... ]
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260709111403.1579159-1-shubhrajyoti.datta@amd.com?part=3

