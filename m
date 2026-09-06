Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013029.outbound.protection.outlook.com [40.93.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A55379EEF
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 19:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788723719; cv=fail; b=EROJhP2oZUupB8ARwgtiT25EeOLn2m0sdZWRZkKFuvnARckkBAZIcdBwSZMWRB3aemNXTpuaBmD1NmIUjsZme80v5az1dpTsebfBzDhWM6ta4ByXfYQkL9bam+qlHgdUKyqSvMszAlauqlWYCDj1n1FrKQXMX5Aut4ER2syUiJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788723719; c=relaxed/simple;
	bh=VIxDJ5uLDsJyVbCpa0Dwqb5UAGmC4kJe3gInfQw5Np8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IsTAQPJTAPgvprtN092ME9Ij1AwPbc1KjoWhoQ9FvFZpKVTdHFaB4+Y9eRFkYV0O+C9PVFtTh/tXDr7frAm+aoCunLHtBIu2UOy5WimI2fjsq5rUUmKXgQQxK4nv6wzjVPZ2+4twD+QjRv8uhnaEta4Mg2lL3+5r4qzRxn/Wf4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=A0r6f5SG; arc=fail smtp.client-ip=40.93.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="A0r6f5SG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKwaemzlEQTl4HszT3YKiI+2gRlgH4RuEXULysRz09nay52s2s1w371odF5eyZs+IZxyAicBMaKl14awa3PpE92ZJcxCOKSzDVmRI+dHpiqMoM1jm2iECDxowmwk585XD+cCjG/vpW4gyARtwWOV+Ok2iESlW94aGL+3+lCQkI0F9snwHkd2tcU9/VEsrb9XtE8D3IAEv2OvjcO2LoaqUxZnkFCk9/Alx/SCRtcnKVzEYvDOLpQoxEm3QQdSOycrCVi6H7TOJCZ/4FcBurlmDPesvcWN6OFqh5zJMbPngSYozFklkgKqcqQFpMA7TR4VqZuDpY+ahVxuse/EpS+UJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CW3NZGLcCHWl/gOnbPl/idww+oPTYOlKknXY+VKsg8=;
 b=j75nk3WUEWtSSWt2QBUaneH+7EX7qUQJKzE07LHXm9oA7Cqe6TLetzRJvovjmXdFB38uxUU8zEJES7rAuEAIr2ZzImUfLPoRtX24LcoKYRUZpi+ZakTEWCXddMMLUyxQmQuq2xq7UlLZt/3o0ehlQxezBuKRO9l7pMNXNX1tnMEJk1KofzhkyjRgkfJPo+oOAfsqzrL5HqwoB4OBzy10JnRbyh08pMfVJkobPxdxIhqQFZ+a7S2nDIvU2LBBCeSjSOVPBGRMWIPSWHsp8uxz3z8DWXtw2pvKZNnInJNATMtBauWinRdxvvfuwowaQPrBzVM2FAbfeq3f5hh2v6v62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CW3NZGLcCHWl/gOnbPl/idww+oPTYOlKknXY+VKsg8=;
 b=A0r6f5SGFgimVy1x+7apN2ID8nd9HrnwoFEvQ1UcvgqyonfJIEPxbIZwCmLofGUbdgqErIhq8vukZBrk39uygc6IyakwloaI4KYFgw1wycD6XxgULX7HNAUpxTrOwXS2zJZx1pwH1+K3fOjnUR24/4JMuNcbsTT6kQifEaze8kA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by IA1PR12MB9524.namprd12.prod.outlook.com (2603:10b6:208:596::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 19:41:54 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%5]) with mapi id 15.21.0382.014; Sun, 6 Sep 2026
 19:41:54 +0000
Message-ID: <6841b0e9-00d9-4ad4-bdaf-ed40aa696dad@amd.com>
Date: Mon, 7 Sep 2026 01:11:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/6] net: xilinx: axienet: Add 10G/25G (XXV)
 ethernet support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260831150816.1020883-1-suraj.gupta2@amd.com>
 <20260831150816.1020883-4-suraj.gupta2@amd.com>
 <20260901150908.D57951F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <20260901150908.D57951F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::15) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|IA1PR12MB9524:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b7e49a-5f1d-4b99-95fa-08df0c4ee7a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|6133799003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5My5n0+5cH8+CfuSqBgb+xXjCVfQoZ44MWBBUix8ct+RScXS8g+IGP6svicuolXknRGR8fN+EQAQpC2ZlH9NxtOc/zsvPfYTLGQc9yQyYrPSC9G/Z9BSq0rbMk1618jdpcZOwxUYMD1CYJl/2svfPDMYHA/heW5opCLue7TR4HexEyPZ8lNwAj3Jy0oiC9a2lGB3sygWKAmJ1BwUx04hQGPl1A3CbUi403AvtlIKbNHDcbkFeYow0nidaT0AGEJWX5hVdIduis9XVKeUBsN+FosdEEIA+CYImLvO38IDUuRgsZ+zQ67MfKZ3DODLdgRd/9YHsCslFWMAr6LYkaKFFLVTrheqLYIU7Tu/kPgne+lJpxaasZlefBh+IXITg3pG+dL0jROuDQeNOePLqeBEK2aeJYbjTWtGuaY3PzS19aAFfGf+Et8Q2bgSRkUQmZyKGrjfbM6C05W8pkpANxJUoTjLOYDaeC9m3x7ONcvG/zApj0sDfxmgTqDNaPaTJ8W2k8hUT4BAnEkQGtfGg+G5/wLs3GMGwvGa5BuNSpMqy0Uo0LHlgDL7Ty9CHpAovGOtF2+HnsJ44DV+e1pGwVfQ1lycP9u+oYX3xaoxPcNQdJqEliCQ9VZcosads2tNj104eYSVmnPOeV257zp20Xkr5wrovp4IYP+CAU6AkA0IqmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(6133799003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzZzaDRSZWRrUmxPZWszMEVGL3NPNDlWQ0poT1pqN3JBeWlMTzdUN2QrN3Ba?=
 =?utf-8?B?aTZuNi8vc1NQUS9YYzl0VUUrUkNaSVhHeW5EZHZwRkFhNzdjVWhzSHVYVnBJ?=
 =?utf-8?B?RkpCNTVCMmRvbFVOK25HOE9Kd1NCQnlZSWVvQVBPVi9XOVM0UGo2VmFBR2pa?=
 =?utf-8?B?clArL3dPTElMT2lyakI0MjkrcDM5alZEbjB6cld0RCtEOGhtbUp2N3NYc1Zh?=
 =?utf-8?B?cnkvZFBUMUYzbFdNb3JvVEJsQ3dFbCt0UWkvQ1cxVjRUdWcwb01sRS9jOS82?=
 =?utf-8?B?bnRnaTV6QlhHQXhobzNDZjJCRWc3Q3pRT2E3UjNQYkV3VEJzQkxheGk3dWY2?=
 =?utf-8?B?M2JidCt3bmZpNU9kK08xclZ2clUwRUJ3T21uREVJMHRHOHV3ajNyek5XOE9v?=
 =?utf-8?B?VkcyMFBQZWFaNURzRzgxYWNmZ3JIZmJmTmd5eThkOE16MXNsYjl0RllGd2t6?=
 =?utf-8?B?Wnk5dmZienJjemorNDh4T2t5dVdQUEtSMldKSU14a3VnZzg2ck05cXNtWGpE?=
 =?utf-8?B?RFRTUHZrSHhkNldoOWRRYmc0K1EyYlUweld4OEZWU1dCL2craUVtR2M1R09B?=
 =?utf-8?B?NlNKQkdOL2NQaFhWS2EzbHVpQ2tBU1FZT2JFRkUybjBjMTBLbHVEc2I2OGxh?=
 =?utf-8?B?WnMwa0tNdzVVMkg0eDk5VENXaHFDVkJia1JsWmhlN1pLVlpuZXdpLytnV2dM?=
 =?utf-8?B?TUllR0NTd2lBOElIbjNCYmVaK00vdyttUHF0REtXcktlWGF1MkJqVTNIMnhk?=
 =?utf-8?B?UWswQVNHWHY3ZGwzRjhJdlV2RFZoYUhkMUZEUlNobXVCVXV4RXJleVQ1d0x6?=
 =?utf-8?B?NjFPaUsrSmcvcDdOMjlBOEFaTjA2bDJDS3c0NTJ1VUJZT3ZmRVFzQVFVQkph?=
 =?utf-8?B?dmVBQkJ0T0FpQWJNNTlUaUhHYjRkcHpBRFB4ZjUzUnl1S1VzYTFVWjhRVkZ3?=
 =?utf-8?B?eTE0cUVkaE1Ta0xBUGUzVjN4TlpNVWhNZFFiaTZPbmZQZHY1NjNUVE8vZ0NS?=
 =?utf-8?B?WUN6MGNyblNmS1p0VUo5QXJaOEVoZVJWM3puVTNQakIwbnVyZW5nSHhXSjNx?=
 =?utf-8?B?bWdxaUkzUE01cmhsc3NoQU9sNmIwZGlUOU4ycFZLSzhjTm9zVlhoU2N0cE82?=
 =?utf-8?B?YjRCaHdNQUpxUjQvNDZuZ0o2TXA5MXhMd21LV3pYT09jRmVXMDQxRDBPb2FJ?=
 =?utf-8?B?ZmdxUUx4UVdNSEIvV1I3Qm45NUFvVjhmbjJ0SU4vWGVIRlQyNnRQc3plc2Jq?=
 =?utf-8?B?NVlrKzVkSUhjUlFYQXBERzJFNm8wVVNrUjlXT0VESmpPL2x6N28rczFxaUxk?=
 =?utf-8?B?ZzcxRDB5Z2huQy9IN3VkUGN4QlA5OFUyNGl5QkdHMjJtQ0xRQlkrbkVHYXR2?=
 =?utf-8?B?MjYrK2xGb0JFZytxL3RVK0hFZlRDY0RGYjg1a2ljNWVCeXRtY3NvejR1ZDda?=
 =?utf-8?B?Si9QWTVKSmsrME13MElIVXJ6YWI5NFR2aVNQUlFqb1E4NXJXc0NtaXBRUVBh?=
 =?utf-8?B?NWtubnJkY3J2UGQxdlpTT2VWeVlyQlZTSk9jRXRGQ1gveXJHWkx2dk1sZ3Fa?=
 =?utf-8?B?Q2dOL2NMeCszTXN1YUwrNG5RcmVuZUQ2c0JDTXVqRnhvbUhmdDBYU2ZCeWx6?=
 =?utf-8?B?NDhBYXVpVDdqZWNpTnI0VktEU3NkMmxjaEU5WVFWUDNvZ2NtRHkvQVNQbVk3?=
 =?utf-8?B?aGhBWnV5K3ZteVk4TER0dnN0bE5KM0VldVkwOUJJVU1jRG1vWFl3aDcxMGwx?=
 =?utf-8?B?S1lTdGNrZ09UVE5jNW1vZ1BXY2lWREsvNXpzZmxONkZ3QWZabDNqL0VOM1k1?=
 =?utf-8?B?c1J3QTFySlovNnRST3B0Q2w1cmZ3ZEVQY2lzNWFPbUV3NXg5dnZ1MUczRzVo?=
 =?utf-8?B?YzRmR1F5NVB1bmpzTE9LOWxqS2hMdFJ0R1NzV0RtazBOMko5OGVwSFlDSm9E?=
 =?utf-8?B?eVluR0M4Y1N6eElmR2llQk5XUkdaR3VFRnNHcjBSRWpCQXlqUHA3QmtYZmZV?=
 =?utf-8?B?TlRKR3MzTkNwamZnL0xCeG1SL0c4ZVJ3K08vVFZ3Ym1XbjJGVk1Eck0xZ3o1?=
 =?utf-8?B?REtWbm0rV09MVzJkaDFqTHkrYWUvUG5mOG9FT1BkRW82ZGp2cXFZVGRxcFdj?=
 =?utf-8?B?Q25VWmNMV2s0SWVJbTZSTStlWHh5MDNFN3FSTHZYT2FaRE0vaHpLd0FqRmJ4?=
 =?utf-8?B?Z1REczhnMUZSQVR6cll0ZTJscDkwMi90OVVXbXQxVWU4VEJiU0FpRFZ3Nmdo?=
 =?utf-8?B?d1Zlazc1UkkwK2d6bWRMbmlwRmhBLzh2ME1aM0FRRkZTNG04Y2puWndnQjZz?=
 =?utf-8?B?TFhCMXRoSkh1ZjJISlVQd1YwbGFlRGl5d2pJMUxEbzF5RW5MTUdvUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b7e49a-5f1d-4b99-95fa-08df0c4ee7a8
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 19:41:54.4325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7eobmQDFl887dCNGX0leJlukthABQWBwu+8kGFgMO5+3uIu+YsTqS+rF9ug2UDFXxl6wLSy0wM9uh9v+j0VUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9524



On 9/1/2026 8:39 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Missing mac_link_up callback for XXV MAC causes runtime-switchable speeds and flow control to never be programmed.
> - [High] Legacy DMA descriptors and SKBs are leaked if mac_init() fails in axienet_device_reset().
> - [High] Failure of axienet_xxv_mac_init() is ignored in the DMA error handler, proceeding with uninitialized hardware state.
> --
> 
> commit 0e020a3d14a024a203937c2f29cbb4fde9c6c31b
> Author: Suraj Gupta <suraj.gupta2@amd.com>
> 
> net: xilinx: axienet: Add 10G/25G (XXV) ethernet support
> 
> This commit adds support for the Xilinx XXV Ethernet IP, introducing a new
> axienet_10g25g_config structure and associated callbacks. It also propagates
> axienet_device_reset() failures in axienet_open().
> 
>> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> index a4963da53b306..222c82a1de914 100644
>> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> [ ... ]
>> @@ -2818,6 +2819,9 @@ static void axienet_dma_err_handler(struct work_struct *work)
>>   
>>   	axienet_dma_start(lp);
>>   
>> +	/* This error handler runs only for the legacy embedded-DMA (1G) path,
>> +	 * whose mac_init() cannot fail, so its return value is not checked.
>> +	 */
>>   	lp->axienet_config->mac_init(ndev);
> 
> [Severity: High]
> If the XXV MAC falls back to legacy DMA due to a missing device tree property,
> couldn't this error handler run for the XXV MAC as well?
> 
> If axienet_xxv_mac_init() fails here (e.g., from a timeout), does the driver
> proceed to configure hardware options and re-enable packet reception on an
> uninitialized or failed MAC?
> 



We don't support legacy DMA for XXV ethernet & fail probe if dmaengine 
properties are missing. So this is a false issue.
> [ ... ]
>> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
>> new file mode 100644
>> index 0000000000000..46b48a773c15a
>> --- /dev/null
>> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
> [ ... ]
>> +static int axienet_xxv_mac_init(struct net_device *ndev)
>> +{
>> +	struct axienet_local *lp = netdev_priv(ndev);
>> +	int ret;
>> +
>> +	ret = axienet_xxv_poll_link_ready(ndev);
>> +	if (ret)
>> +		return ret;
> 
> [Severity: High]
> If this function returns an error, are the legacy DMA descriptors leaked?
> 
> Looking at axienet_device_reset(), which calls this function when using
> legacy DMA:
> 
> axienet_device_reset()
>      ...
>      if (!lp->use_dmaengine) {
>          ret = axienet_dma_bd_init(ndev);
>          if (ret)
>              return ret;
>      }
>      ...
>      ret = lp->axienet_config->mac_init(ndev);
>      if (ret)
>          return ret;
> 
> When mac_init() fails, it returns early without calling
> axienet_dma_bd_release(ndev). Can this cause a memory leak of the TX/RX
> rings and their associated SKBs?
> 


Same here, XXV ethernet driver supports dmaengine flow only. Probe will 
fail if dmanegine properties are missing in XXV DT. So this condition 
won't occur and is false positive issue.

> [ ... ]
>> +const struct axienet_config axienet_10g25g_config = {
>> +	.sw_padding = true,
>> +	.internal_pcs = true,
>> +	.regs_n = XXV_REGS_N,
>> +	.clk_init = axienet_10g25g_clk_init,
>> +	.setoptions = axienet_xxv_setoptions,
>> +	.probe_init = axienet_xxv_probe_init,
>> +	.gt_reset = axienet_xxv_gt_reset,
>> +	.mac_init = axienet_xxv_mac_init,
>> +	.get_regs = axienet_xxv_get_regs,
>> +	.phylink_set_caps = axienet_xxv_phylink_set_capabilities,
>> +	.pcs_ops = &axienet_xxv_pcs_ops,
>> +};
> 
> [Severity: High]
> Since axienet_xxv_phylink_set_capabilities() advertises runtime-switchable
> speeds (10G and 25G), shouldn't there be a mac_link_up callback here to
> program the negotiated speed and pause settings to the hardware?
> 
> Without a mac_link_up callback, when phylink resolves to a non-default speed
> or enables pause frames, will the hardware remain unconfigured, potentially
> causing the datapath to silently fail?
> 


As mentioned in cover-letter, due to phylink limitations, we aren't able 
to advertise both 10G and 25G base-r interfaces and are open to 
suggestions to handle it.

Regards,
Suraj
