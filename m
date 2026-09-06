Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308842C3757
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 19:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788722768; cv=fail; b=OFz3gIrSs32FLOgL7g/7hjOxf/wNqFdgm5ttvDdUdebZnCwlFqolGrgb7KZqIpK19q5+hk0zISz/o8lMCeQj+ezm4qokwXaKSP67OXPHxjDqFflCcJuv2iYxkNDb9/BM0ht6VD+xS250tBNq4OAWQwTnOjC1Y/gJN3yEIlzQMi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788722768; c=relaxed/simple;
	bh=b2aOj6IMJF9e0mRHuwiCRX22JJTUzFuGlHKtkAH+j7E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PbXS4tArYFoFMC+HiFH+8rGU+SgpPh5xQev0S9qDlTRGYc8CCzd3tLE8VTF8xcWlKIJkv89J0reAdAgt/katyKoAwXgzR8nSDmSvZIw+AjfXeska2s4gdxbsGb1vphfxymL7ED5t6TlCgz5iKAqj0L3rldf0qTysUEOOmxv3Ewc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5YECHike; arc=fail smtp.client-ip=52.101.48.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5YECHike"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ddmq7woK9UOVl7LPfThQxwqZdGE8+GRmUMruvg1YlTY0ou6bGRxEv8DjG62J5X5xfImuWED8G1Sn4qu4F7UXvLXsgLAE3xylFhdPqbwh7pppPeIo3js3ekRoInbJOxRiMK/lQxLtm+5et3UqFVwOtujNeh7zX3qsIR6w9alcQyRwvpydBOz2I6pV/JYMyeMmnAnjqH0amHQ3NW9nfETcBcFLfArudFwRJ8/rhoKjdCSCBEroiZALl9NKHUz1qum8bydFXC6VR+Qy7ov0XTfMEsjpHjSUrFnKIEN7mtBoMl5SZvFiG79uIP1/gItavGg3yRDQYBXSfNVkx2WnqXfi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9PCPhzbQm9AgQrNodvrpdSpQZOfgR/cE1yGc6BqbKE=;
 b=SCxYvYceXISKySIcCNohFmlCO7n1xOd/BVtbSmopZ+gdvNKzwLPgtcPMkVLaYnNSUvU2LyP4MzwTXGBxBPUoTleoKDn2Y0QxrZ+fsRE126RgoULBiz9tlpVpiqCZ3ksgDapiXomHvBdKcMkQn5rBbHMNrAkklqprwdIH3JUYIn8gn31yXXNlsJevV7fs5fF805+7tP+lqrV1C5SfkwTwuG16ucUxDcx3Ge6pOKCCMuYUwJYrF9zPHceNBbYpIYosw61NMbej0J7j+kpyEGBnGHY1juj2goAJMk3d4SrfNB/VUrddkV+48Y+A/yHLbUQgFjTl3v/OfPfoEff/J0iXpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9PCPhzbQm9AgQrNodvrpdSpQZOfgR/cE1yGc6BqbKE=;
 b=5YECHikeqiDUe+bFuilxjoeTiCpnFNjp2hyd/qvLMcQlmpOcPm+IYVRMen2K5KcSEGmwrPRfGLtjhaE56OMbwXaVFDe2toS/7ogaClRylZFNLP0X6x4SY3kmxW8Yj41YedWKKHogaY1OpMybHz8OWHHzSArx3GqrM6MvmITV+go=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by SN7PR12MB7372.namprd12.prod.outlook.com (2603:10b6:806:29b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 19:26:04 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%5]) with mapi id 15.21.0382.014; Sun, 6 Sep 2026
 19:26:04 +0000
Message-ID: <330a7083-7280-4430-9fdf-0dcf7349cc26@amd.com>
Date: Mon, 7 Sep 2026 00:55:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 5/6] net: xilinx: axienet: Dispatch statistics
 through axienet_config ops
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260831150816.1020883-1-suraj.gupta2@amd.com>
 <20260831150816.1020883-6-suraj.gupta2@amd.com>
 <20260901150909.9EE531F00A3D@smtp.kernel.org>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <20260901150909.9EE531F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::13) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|SN7PR12MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: 801f0f2d-803e-4b78-403e-08df0c4cb14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|56012099006|11063799006|4143699003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tIwMNyZXCRxEOnjUZBCqUMA2VW/HQjbYbHKJbiKbd5gkcSm8fyMYWDLWYLmTwfqqjYZPs5jg88saxNqBGC2VqFp/TLf2KxuUGzbJKoe7ZNmJVuDfuyRfC0OlNYubIqwth+aoQ+pdk7OvcTsBtOP8UacHYwzXuh27RtwZ70gMN+nggwLK3PpVT1/bjy7i/DLv1WTK19nOvI16tAaacADGK9lCrUtiA3WTrXvU3EZi/GlzkCrdzOPRkdf7M6WXO2mam6OqbNAbdI3LomPqnBjbW+GsFsgXP/THaf5St49MImjuyT3dWZDMu/54or/rA2wGVAEz5Ls7gQV7mGjn4UFlMg1CvHV00U656Ml6gzUkGylAeQJGrtmgo5JE3yBLhJoKe3GFLj/EPDzkTrbGHv9oQJLf8IW05ywxUHhvHxwrzBDgR2iGeYEQsz2rsma2YfgxvqIbPShMZZX0WB0k69J//HB1qkC24xJfOxTsMagvABfSf3ngUhTCZvu3gn3cpHYTy2WXwUPPRxy9BeFzpHRJ6+wzBnkHSJ2++sDVJ6jlDnrts28f2W8z7egJKT6mnWNrZmSvWe6BQCHe2/1LsM3QwEfNJAavem8qkkcuRI0Ni+SwFnQtIc4cAm26kT/15nPxfj8OFBPLsNLAZVx/C9CCLNugC1iMr9ZvrEYDEeupdoY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(4143699003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RC9EbTNmTFJnSEJFSEZ3NWNkYmx5eGNId2VoWURKeFJRNFZ6LzRudVZuQ0V6?=
 =?utf-8?B?TldjZktURXh3RmVlWWI1a1BHWk9UT09jM2ZndzRKd0d3b0t3RzFOUmpSdGRv?=
 =?utf-8?B?NjZDcUo5T2g1OU5rajh4aVhDSVdqSDAzSWNOTVV5OWl0aGRNNFZ2TFdHblhI?=
 =?utf-8?B?MWZTVjVVL2JGTEhVOTlXV0ZTQUtNaWdSZmJWeUloYWcxRHNZcE1COGlNVVhM?=
 =?utf-8?B?QURJUFNkd3paOVd2UkxHclFCMVhwRFJXMjl0NHk5VmFZR1U4VmsvOVZSaU9S?=
 =?utf-8?B?cDZXa3hTL09qZW9JUVJkTWdYZmpBa2hxYzdJZ282NVhxbzBDb3cyRTVVTnVz?=
 =?utf-8?B?cG10MXY2WWNUaUlZN0Uzek1iVVg3c2hBYUtiY2NvT25nR21WVlFYQlpCWklT?=
 =?utf-8?B?V1BwNzJsdzR0Z2ZsNE96N1dnSm5QMTVZUENvbXZOMEJjYjJpMzcyVk5sUFdv?=
 =?utf-8?B?SE0zOTFQc25USDFBUHVieitYbW9Ud3NZRFlXdXN2aUJaNTRnZno4NU9NSmhD?=
 =?utf-8?B?WGhyR29taFI5ZHlCQUc5MFFVcDdLbkRSRnRWTDlpV1cvQ2JuOWRmNkFOZUVH?=
 =?utf-8?B?SE9aT0ZFQjUvSmJVQlRuTjBnUEFWTGdKM0JKbHVVcnVMT29QemdwaWVJT2l0?=
 =?utf-8?B?SlJRejN4dm85RzlOcjVqVUJjbWpReDB0cDhTQnJReWJUL2JzVjRjUVFOeFRW?=
 =?utf-8?B?MXVNYk4yN24yQXlkbVAydFZjbzhDUnNUOG5zZGpTczZhWWJaa0tYZkdoY0l1?=
 =?utf-8?B?SnNNamlZNzRoTHRGYU5JVlcrelkrNjFKZGN3WWUvR2dCMkYxVmpGMWlxQWlh?=
 =?utf-8?B?STUxdDRIWkVEa0p1a3pnbUVsbTBQTGhqVnJ0QnRKQ2ZTMzBReFdzRXU5VVBN?=
 =?utf-8?B?c2xlSnVJR0pRczBVSTJ3bFcrTW02UDIxMHFBeEN3bWZMOTBvUHBTTzlNNGFM?=
 =?utf-8?B?MTNuK2EvYjhibDMzZ2VCTnE0TE9YcjRMU3hGV1lHVzl2ejlNd2VRVHUzLzBw?=
 =?utf-8?B?ZWRnNE5HOTlzLzZudkc5TlR0L2dldC95cXkySmZUakRUYUtna2JzRUlrdVA0?=
 =?utf-8?B?amlycG16dERLMEF3OTQwa2RmalVwUDJaOU5vdjBmR1Fxb25TVGNnRzZ0NDE4?=
 =?utf-8?B?TTAyY3hoWDZncnU3amhjY2hNWlVGaFNKT01wOGFkS2hXdkZPK2NVc2I3ZjN0?=
 =?utf-8?B?QVFQZDRJRGd1TGN5VWtEOXh3YmtkeEZ2S3ZnTHJjYzhGeWhTVmFVQ1NoU25D?=
 =?utf-8?B?YXZ4UEl5aW5YcWRiR3MyRjFOQTJZZll2STh0NkQ5TG9xbG5JbVR2RG1LbHNV?=
 =?utf-8?B?bFZBSFFQelVPMmsvaThkL05UWE1JdFFuRTB1NWhnajVPSlhPUXd0dGpMbHdI?=
 =?utf-8?B?YWh3WWpSV0RlWDBGcmJCUnFJOW1NS2VaNkU4YXNrQzR1ZDBuRkppaSs2SWZD?=
 =?utf-8?B?R3VaYi9ZZVJPMVpxSk1OV0ZYT051ai85Z3U4Vm1WbVZwNjZoV3NCWDRCaFh4?=
 =?utf-8?B?Y2VmeVpaYkpVYitXNVRlYWZPOTYwWTNvNUdSK05pbndzazNEWGxYTTkvbkpV?=
 =?utf-8?B?cEp5VkIyY0I0amdEN3R0T2IwZWFuNUFhM2lzWGREY24yWUdVVHlsNHBpNS9u?=
 =?utf-8?B?MVRnU3BLRFUzblJPKzBwK2FTRDRnaGVWTnBNSTZ3VG1tSFJxK1hNMHFVNVVO?=
 =?utf-8?B?RFpaNW9PdURjTnFmRXFEVHF0U2gzbU9SdXl1N2h2SExuaXQzR2JLTENTZThy?=
 =?utf-8?B?bDVkQUZ0U3JneXAxa3p2bTh3a3h4ZmhPbmE4aGhwNnhsY2tqWFR3cUV1RTJ0?=
 =?utf-8?B?OGlmSXhXaEVLRzRlWmxteEpFQjNQSzAyK25RQXIyUC9LSVAxY1JhbGJsR0sy?=
 =?utf-8?B?RFVBRWJxb25jN1NvL05ydExOcnNIUDkrODhRMnU2dEdXQ3Riamw1VjN1NGN2?=
 =?utf-8?B?aFNnc2ZNc1BBVkFjREIvSWd4YUROMzRxMmplaWQ1S3pzRml5RDhJalBXSXZk?=
 =?utf-8?B?UW95QXBpbFBSVDJQY2NJSnJya01mdkZUeFJ1dkYrRkprOGpwbU83eldHeEhY?=
 =?utf-8?B?Mk1LSkwyTXYxbndRSUM1V2dWelRON2VRTjZ0endjcDJyQjRwSWdERG9SWkx1?=
 =?utf-8?B?T0JPM2dNL1dRZzFoUC9CQ054RWtZZTBPRkhRQ0RyVTJjbnU1Qi81UjY2U1py?=
 =?utf-8?B?cGFnOWp5OGYrekRFa0ZIUDFoVGN0cFVBcGs5VEVGZjlnZFFkaHVuemZTRnow?=
 =?utf-8?B?Z0QxdE1IQmMrSWg5bHViWnZuN290VVpCTDU4N2FORzE5dHhOaUVTNEh6VnFh?=
 =?utf-8?B?ekhQMVpkWXBIS09IazVMRGJBT3RmdHZickJXSEFQU0tkc0MyWFh1dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801f0f2d-803e-4b78-403e-08df0c4cb14c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 19:26:04.4613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8Knl29B3HFi9Lry2hAicSGPEwf0COICas6tE9yBUWv1TR7rH74bEG5XCYdlFS2Su4vC4wjKd0C5DKzlqFso+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7372



On 9/1/2026 8:39 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Out-of-bounds array write in `axienet_1g_get_ethtool_stats()` due to mismatched statistics array indices.
> - [High] Reading a `seqcount_mutex_t` from interrupt context can cause a deadlock if the writer is preempted.
> --
> 


Both are pre-existing issues, I'll address them as part of separate series.

Regards,
Suraj

> commit a22a50757854e007ab76536560cb1108e8d22fd4
> Author: Suraj Gupta <suraj.gupta2@amd.com>
> 
> net: xilinx: axienet: Dispatch statistics through axienet_config ops
> 
> This commit refactors the AXI Ethernet driver's statistics reporting by
> dispatching stats reads through operation pointers in struct axienet_config.
> This prepares the driver to support different MAC types without inline
> branches in the statistics callbacks.
> 
>> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> index 212816613aa86..8100cc53cd643 100644
>> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> @@ -1878,29 +1878,11 @@ static int axienet_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
>>   	return phylink_mii_ioctl(lp->phylink, rq, cmd);
>>   }
>>   
>> -static void
>> -axienet_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats)
>> +static void axienet_1g_get_stats64(struct axienet_local *lp,
>> +				   struct rtnl_link_stats64 *stats)
>>   {
>> -	struct axienet_local *lp = netdev_priv(dev);
>>   	unsigned int start;
>>   
>> -	netdev_stats_to_stats64(stats, &dev->stats);
>> -
>> -	do {
>> -		start = u64_stats_fetch_begin(&lp->rx_stat_sync);
>> -		stats->rx_packets = u64_stats_read(&lp->rx_packets);
>> -		stats->rx_bytes = u64_stats_read(&lp->rx_bytes);
>> -	} while (u64_stats_fetch_retry(&lp->rx_stat_sync, start));
>> -
>> -	do {
>> -		start = u64_stats_fetch_begin(&lp->tx_stat_sync);
>> -		stats->tx_packets = u64_stats_read(&lp->tx_packets);
>> -		stats->tx_bytes = u64_stats_read(&lp->tx_bytes);
>> -	} while (u64_stats_fetch_retry(&lp->tx_stat_sync, start));
>> -
>> -	if (!(lp->features & XAE_FEATURE_STATS))
>> -		return;
>> -
>>   	do {
>>   		start = read_seqcount_begin(&lp->hw_stats_seqcount);
> 
> [Severity: High]
> This is a pre-existing issue, but is it safe to read this seqcount_mutex_t
> from this context?
> 
> The hw_stats_seqcount writer runs in process context (a delayed work) holding
> a mutex, meaning it can be preempted by softirqs. The reader here in
> axienet_1g_get_stats64() is called via ndo_get_stats64, which can be invoked
> from atomic or softirq context (such as via dev_get_stats() in the Open
> vSwitch datapath).
> 
> If a softirq fires on the same CPU while the writer is inside the seqcount
> write section, won't the reader spin infinitely in read_seqcount_begin()
> waiting for the odd sequence number to become even, resulting in a hard
> deadlock?
> 
> [ ... ]
>> -static void axienet_ethtools_get_ethtool_stats(struct net_device *dev,
>> -					       struct ethtool_stats *stats,
>> -					       u64 *data)
>> +static void axienet_1g_get_ethtool_stats(struct axienet_local *lp, u64 *data)
>>   {
>> -	struct axienet_local *lp = netdev_priv(dev);
>>   	unsigned int start;
>>   
>>   	do {
>> @@ -2381,6 +2387,17 @@ static void axienet_ethtools_get_ethtool_stats(struct net_device *dev,
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this function overflow the
> data array allocated by the ethtool core?
> 
> When a user invokes ethtool -S, the core allocates a buffer for 9 elements
> based on the return value of axienet_1g_get_sset_count(). However, inside
> the seqcount loop in axienet_1g_get_ethtool_stats(), the code writes beyond
> these bounds:
> 
> 		data[8] = axienet_stat(lp, STAT_USER_DEFINED0);
> 		data[9] = axienet_stat(lp, STAT_USER_DEFINED1);
> 		data[10] = axienet_stat(lp, STAT_USER_DEFINED2);
> 
> Can this overrun the 72-byte allocated buffer by 16 bytes and cause memory
> corruption?
> 
> [ ... ]
>>   static const char axienet_ethtool_stats_strings[][ETH_GSTRING_LEN] = {
>>   	"Received bytes",
>>   	"Transmitted bytes",
>> @@ -2393,12 +2410,26 @@ static const char axienet_ethtool_stats_strings[][ETH_GSTRING_LEN] = {
>>   	"User Defined Counter 2",
>>   };
>>   
>> +static void axienet_1g_get_strings(u8 *data)
>> +{
>> +	memcpy(data, axienet_ethtool_stats_strings,
>> +	       sizeof(axienet_ethtool_stats_strings));
>> +}
>> +
>> +static int axienet_1g_get_sset_count(void)
>> +{
>> +	return ARRAY_SIZE(axienet_ethtool_stats_strings);
>> +}
> 

