Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0341D9A5F
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 19:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788722659; cv=fail; b=L7T0fmM/KqcR5wo0ed7uLgn4gYdZooC75ZX3JwS+6xoM6gcDFL3xncZRQuQqjuinu5a5Shrtz8iJRXhpI46NjP/uNHMROc4PIKsI/hDjUerGNdtuPbRXDHDG1pFha7hUoziP3rMm4TJ8F5a55wbD67eVVWOQQ229Sl5QHmI9I0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788722659; c=relaxed/simple;
	bh=qKWxaFgnVm3y1UKEXsBzKMRISPDeK/qOUZ8OjgV/S0o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o3SRuuVWAT/QUz5idUcjvaUVkqdxtBMynV9aPaNNWhMxP8NvJjgpePh+w9emycxWS2OK2kIlOt//cYXEb/mLo/9gfN2/DVxP5lZIrPSpzgyB3enjK55hCvdnS4ZH6AV+tDUlxdCBj/D7gSocTewoOjcreVlCSxwG5kepsHHnlhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G3V6ucwA; arc=fail smtp.client-ip=52.101.201.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G3V6ucwA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDnYqptO3thSv0jRv6/W1UlvOCqyaCMpPh+KfgoRCc0YuaVBo5SgzRBLO9O+GWYrBZlg6OcJcSFu8ZhVVlQI0DlH4DWZ67bEijhqzxSNDbabI3zFF3E1aA4FJUhUcrwZ2lZRPXiYLa5TWQwxttxCdb2zMy8SFU4PqgdBGNHg1xa0JBTIfxE5+QBtlD1VOP7eW1VJoj1iZrjOGdYhQx9kWcHUtmQBygS1zKr6d5B0uQ7E9e84lx697xjQUBUl9QDYqqXQ2UfBX4d5i1f2yEPbSXgVdYbPzaloXn2VMjveH01u/j2F135SmkwJQumfWT6Zp/mtZXe/kej214klZPUrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGg7jaN+O7gQUyzafDrWh3Gt3Q/UOdjBeeUCbxZe9xw=;
 b=tMM+q8kL7Pta6TxJfKBPHiFs35Npsxtsd9HMOQSqWzzjy89FDzRXe32wuP45vPpi/bLmX3lyZq7gwZ3mjLOxczCWZx/N6exm6OFMkNpxUgCmOeJm39j7ZmZStpNvIOjzPfXrpusDQsbNXs5CUEpAkxjyteSkWDkcwiWb4Sj26FwHz9h+yBUJuuQGbU81k9SYUFfZ6SJy5Inz6L292J9PlPBPmNk0DfXX0dQlWWEP3ib6cnzxW+DYI0KAl+dvWtAhdAsMUMXP7k9b8fMGOuyKbSTDVtqqoNgkjD2AEreMaQcXUE9d0Ym6BM4WC0L71Wn3hEutI/knW1WfHSp75XSaWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGg7jaN+O7gQUyzafDrWh3Gt3Q/UOdjBeeUCbxZe9xw=;
 b=G3V6ucwAeTvAm5fEQbezwty3q32H/4eUripJJT3bzG9E0kIGCdytQ7OSEv93JRaE9b7Z6wb/sRtW+xOGJrn6z6oNCmH3mprix7+m7p4U6r+ihF8PiOqyKAcd8InmL2FYSeGyvwW5ofLAs67sB0sQbg5f4BbPKgitgrCDG9TeMw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by SN7PR12MB7372.namprd12.prod.outlook.com (2603:10b6:806:29b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 19:24:11 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%5]) with mapi id 15.21.0382.014; Sun, 6 Sep 2026
 19:24:11 +0000
Message-ID: <79473063-b38a-4826-bb20-3b38b9d8d9fe@amd.com>
Date: Mon, 7 Sep 2026 00:54:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/6] net: xilinx: axienet: Introduce
 axienet_config for MAC-specific ops
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260831150816.1020883-1-suraj.gupta2@amd.com>
 <20260831150816.1020883-2-suraj.gupta2@amd.com>
 <20260901150908.150101F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <20260901150908.150101F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::7) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|SN7PR12MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc59550-84b1-4633-cec9-08df0c4c6db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oyLwmsPGMOh56BLKBXaUQZy837PnrNcxhzQt+WZx8GCU/fKcad1Vm/N9OlcbgFNIC3Rqxx67fpHlIU0Mb5Dk3jBmz4m1GByGAaYyIZjaSbk1QytDzDxsTKT4VSZrs0GLv+UbZ3G0I6tyexY0gvTdWKIszevalAxYMyqdtrL1nHOD383/dM+FhcA78wjmuq+2kOyeD3A8iqC3UTFynfm+9QIqtLz9YfyTaCPBPO7r0x+63RAkhwaaQ1YR2KOa+x9Xy5n975V0H964fnBjCNoFGXSthYMBc2t8AXR96AxL9Wy+QyQnz8R3La7tjTh57U/RO9rdOnnwCPJpZ2NJAD7yS/X1hfYvmizVQGCdj0vJ/4UhLz/RkTORZbFytB193QOALArfeoINH9WLcGXzid4t1LkUPYU7Dx1qIBZIDJ0XBCYgkMI+ETwgLw9xLWQimj6gm7aMverB6W6q9NXLYNZNATioCpmJAVqe+Ihzo8Y7cP++lBzJV7Z+MRcjE1HsU6ZfM1aCKc/zyjEbbKsUcX99YchP60w4DZ/F1zh6ECuopDeZvbl96U8tnWAS/O0Ng3QWK9XrlotrMDDe9yJXvMcMSkP0NlMIXnGi9nT/2LHrAwHap1sJ0sF6Ry0Wdw3nZjPaxXcTON2lm8/BbFhVurz95xQc0TXAlKurTSS1pwM4FJc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2VocTNNWDZ1cll0dXFpMTdHd1JpY1RnU2FKVDc5OFVTQldsbEFPMmlFM2p1?=
 =?utf-8?B?Q3lUaExLdUVIUGE0ZWx1TFA0dTFiR1d6aTA2THgyZzlNTzRRUUFRWDNhZ0dD?=
 =?utf-8?B?WkJhZXhqTHV2OXNLNXYwQlJyVG9KZ1pra0ZnOVFxTnU3WHFkWUYyZkg3andC?=
 =?utf-8?B?TDRnKzg5dkhVQlBjeDgxWjY1NWFzbG5DVnV3dU00QzNNK0JlbEY2L3Y4eHRD?=
 =?utf-8?B?bkE4K0lhaHJXSjRFMmN5eWR2Y3VVYmlMK1M0Q2lYSzFPYjlSd3NTQ1Q5UGZj?=
 =?utf-8?B?T2ZJSkhKNjd4OVlHNFozSnBOaEZoMGFXRXliVTJCdjc4Zkw5aEFVRzJSeEJ2?=
 =?utf-8?B?U0FKVjRRYlErNjI1S0w4QmNKL0JBUityL2luMEEyOC9RSlhYRjNKTnlrNmxT?=
 =?utf-8?B?bG5zbkZ2QU5MK1JSb3RZSE9xSXpGWklaMmNOcml5czNyajJoWkFnTGNZWjAy?=
 =?utf-8?B?Z05ONWJBa08xN01KU1lvMHQwMlhkOHRERjIvUE55M2JLS28yK3kwQ3B5enRq?=
 =?utf-8?B?RnlBclU4S3RrNVNzcDR5eGRiRVpQNlhBMXJodEdwS3daRnFOcWRLckpFdkpB?=
 =?utf-8?B?RmRaNCs3aVdZbjF5WENEeVBLN21KV1dFalcyTXR2dDFvM0kvNm91Y0lKWnBu?=
 =?utf-8?B?bFVRT1YxRWtXQ3RUMlVSV1BKeXFjakNjSTBzVjJCQ1Q1SFhNWjhFSTFxbzZI?=
 =?utf-8?B?OGdhelNqaFkvMHBMN1JRQSsxWGxzVmJ2MU1aUng2UGpteDRKRklQM09NSXFX?=
 =?utf-8?B?c3ZFQk5JU21EbjdMbmRqSzBNUHYyRjJBQmRwUEptK2IxK0VVcnZJTExmVFlR?=
 =?utf-8?B?T242VTF3ak45ekpuVld3ck0xUHN0bUlXZldybUJOeVp5VmZta01CeUdHZkJD?=
 =?utf-8?B?Z3JaeHZ0MXlMeGJCV3FhOUNnS28zd0RCaHdaTUVyazExYWNYaGoycVVQR0pO?=
 =?utf-8?B?YUM5L2JsUVM0a3dFc0lTZm5jeVdvYVY3VVdaT0lRU3FvSWlQbm5JOE9sM2ow?=
 =?utf-8?B?NjBtVTE3ekhoREVmQWZPUWNTbUdIZVJCbVhzR1VJYjRydWZxV0dpK29LL1c1?=
 =?utf-8?B?SSt3QmRwdXBMekRJK2NabUtaejJsU3VOVk1maW1ldVkyNk1ScnlJcFZCbDFE?=
 =?utf-8?B?bzZSOW9oSTRRUko0L05rcjBPSzVNd3p3WllQSGlKenVqVmtZRlY0eUlhNXB2?=
 =?utf-8?B?T0VvZHV6WEZmR1I3SlU5ZFhqVVA5cUZTTFpoSXdLOVZNajVXaDA1ajd1Q2JF?=
 =?utf-8?B?VjQ3aHRJN25QMmFaTStOMjFFa1ZVdStiOFYyUmJ2UjhJQ0Z1Z1ZJNnFPVmZZ?=
 =?utf-8?B?cWNlWHVYUSt6N2gvZXdPVTZxNHBBdWhpUS8wWkhkUmg1YUZDM0VITk9FeVNn?=
 =?utf-8?B?M0JmbFpWRWY3WGxBSS8yUTRsVDZ4a3hxbnlyNFFJblFQbXQvNHNITlZYeXVo?=
 =?utf-8?B?alBwbXlXRmZJcTVMQ0o2NCttNEk2aVFQbEtkUndsVjdycGR0RkFoUUk4Y1E4?=
 =?utf-8?B?L25LU2tMc0pVYm9LM2s2WVRLaWIxbHN5QnBGTkNJelRQYWlBQ25OSjJvMnE1?=
 =?utf-8?B?SldqZDVUYXU4b3QvS3ZXT2FLamlnVTBpRzdBVlNaK2dCaVpzZkdVcjQ0V2R0?=
 =?utf-8?B?SUczeTJtQXN4QVhIMXgxM1JqQThVdEJBK1FzZU41M3FFZU14dEZBa09VaGdG?=
 =?utf-8?B?K3RxZ3piZnRZQXIzTTVjZUU1R3VWdDczUDRycldLcHNSYzdqOFAvZkJwaGRs?=
 =?utf-8?B?NlpEeWErVm5zdnpyMFN6VmF1TTEyQmc5bzB5KzFmakpObXQvKysvS1A2OVpS?=
 =?utf-8?B?LzEwY2NTcWVkYUc1bmVVMmRqRWtDNDNibEU2OEJyOHpXa080c2NrdnBidTc5?=
 =?utf-8?B?azF6bVNvVVBFR1UweGVmMEM5K1lmK3V4RitYS1dySmZOY0ZHNjBVbEIzZGNQ?=
 =?utf-8?B?aC84Q0hOZE14OHRGT3V5QmZ4MTNiZHU3b056dStjTUcyQ2lYVW5qRE1vSVVC?=
 =?utf-8?B?VjdqNWFPUXV3aWlSY1dwVzYrVTJxc092bVBSM1JmU3BMSlpCWFowQW10bGxS?=
 =?utf-8?B?ZmQ3NjV4a2djcE1xZWRacGJIUFNLOVZUdDJJME11S0swdkxvODArVE4yUERT?=
 =?utf-8?B?Tnl5amIzNzNzdVZtYWIyY1VHaHkrcmM4NFdNVHkxUEUyQytnL0JvaXRobGdr?=
 =?utf-8?B?cjdOVmNYVlNWUkVvbDlmbDlETGxzOW5xTWY3dnNVTWFMMk1POHpIRmVQZGZj?=
 =?utf-8?B?VjdPaTd2WEk3SzRnTkd6ditIc3BlNGoxWkE0MjB3aDZONjlBQVBMUWNKbVlI?=
 =?utf-8?B?a2RXbnFLcDFpc29laFBNRURvL1lUelAyWTgvV3M0TkZMSmd4bXNOQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc59550-84b1-4633-cec9-08df0c4c6db5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 19:24:11.0806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22vEetFXHe45p+Inx5ZLhbitUgN8xHEFxXAxfxlR47fxN/pugsu2v7BSaEE0HfvyufLhrHIr27OWRxafI9TJsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7372



On 9/1/2026 8:39 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Incomplete abstraction for TX checksum offload leads to broken checksums if misconfigured.
> 
> Pre-existing issues:
> - [Critical] TX ring desynchronization in axienet_start_xmit_dmaengine() error paths leads to use-after-free and double-free in DMA callbacks.
> --
> 
> commit 166384442bde8d7169bb6c9fd071e535fa3f9c73
> Author: Suraj Gupta <suraj.gupta2@amd.com>
> 
> net: xilinx: axienet: Introduce axienet_config for MAC-specific ops
> 
> Introduce an axienet_config structure to abstract MAC-type-specific
> operations, preparing the driver for supporting additional MAC types
> beyond the existing 1G Ethernet.
> 
>> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> index 1722b7038f340..a4963da53b306 100644
>> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> [ ... ]
>> @@ -939,19 +976,21 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
>>   		goto xmit_error_drop_skb;
>>   
>>   	/* Fill up app fields for checksum */
>> -	if (skb->ip_summed == CHECKSUM_PARTIAL) {
>> -		if (lp->features & XAE_FEATURE_FULL_TX_CSUM) {
>> -			/* Tx Full Checksum Offload Enabled */
>> -			app_metadata[0] |= 2;
>> -		} else if (lp->features & XAE_FEATURE_PARTIAL_TX_CSUM) {
>> -			csum_start_off = skb_transport_offset(skb);
>> -			csum_index_off = csum_start_off + skb->csum_offset;
>> -			/* Tx Partial Checksum Offload Enabled */
>> -			app_metadata[0] |= 1;
>> -			app_metadata[1] = (csum_start_off << 16) | csum_index_off;
>> +	if (lp->axienet_config->dma_tx_csum) {
>> +		if (skb->ip_summed == CHECKSUM_PARTIAL) {
> 
> [Severity: Critical]
> This is a pre-existing issue, but does this error path permanently
> desynchronize the software ring from the hardware ring?
> 
> Looking at axienet_start_xmit_dmaengine(), if a failure occurs during
> mapping or preparation, the code jumps to xmit_error_drop_skb. However,
> lp->tx_ring_head was already incremented earlier and is not rolled back.
> This leaves the abandoned ring slot containing the skb pointer and sg_len
> from the previous time the slot was used.
> 
> When the next successful packet finishes transmission, axienet_dma_tx_cb()
> will pop the oldest entry using lp->tx_ring_tail++ and retrieve this
> abandoned slot. Can this lead to unmapping the wrong scatterlist and
> double-freeing the old skb?
> 



This is a pre-existing issue. I'll address it separately.

> [ ... ]
>> @@ -2861,9 +2993,6 @@ static int axienet_probe(struct platform_device *pdev)
>>   	/* Setup checksum offload, but default to off if not specified */
>>   	lp->features = 0;
>>   
>> -	if (axienet_ior(lp, XAE_ABILITY_OFFSET) & XAE_ABILITY_STATS)
>> -		lp->features |= XAE_FEATURE_STATS;
>> -
>>   	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,txcsum", &value);
>>   	if (!ret) {
>>   		switch (value) {
>>   		case 1:
>>   			lp->features |= XAE_FEATURE_PARTIAL_TX_CSUM;
>>   			/* Can checksum any contiguous range */
>>   			ndev->features |= NETIF_F_HW_CSUM;
> 
> [Severity: High]
> Does axienet_probe() advertise hardware checksum capabilities without
> verifying the new MAC capability flag?
> 
> While axienet_start_xmit_dmaengine() now correctly gates the DMA metadata
> setup behind lp->axienet_config->dma_tx_csum, axienet_probe() still parses
> the xlnx,txcsum device tree property and unconditionally sets
> NETIF_F_HW_CSUM.
> 
> If the device tree specifies this property for a MAC that does not support
> TX checksums, will the network stack pass partial checksums that the
> hardware never completes?
> 

I agree, axienet_probe() should verify MAC capability flag before 
checking for checksum capabilities, otherwise it might be problematic if 
device tree wrongly specifies this property for unsupported MAC. I'll 
address this in next version.

Thanks,
Suraj

