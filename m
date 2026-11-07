Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794078601;
	b=iU8bI143dAmmJ+MErdUEXu3JC24klhRbLo750hqPiZzAgywCRFdiKyZ5nYRU5NCx5IZg
	 Q1VIm50KKJHGuoXgJ9y+totuL4vBjZCmOU2kYSTl80FgJIk6OEAtJaclmjBuUnj6OXLQV
	 tXmT4UcbxHxdYlOqgL5C8WGyFo6Ivy88AyOQCyiiZfiY/ZpIk4TD1X7FkcKv3IqcGgSNe
	 VsYICICWmhOgej/dDuEwfCcU+R2QLIYtbaAxqUOCvcevu7WHY92qBHotZ8nXZh5Srncp/
	 Mk1sOsnjbVOj6x6+Rnc7TlVdMztNzeE2TJLjvFE8HMSK2oHisZ8RfRRN4z+bnYviQ+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794078601;
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
	bh=QluwjBNotRS7YJrZly8meccVnM4hBS0H0GLpT99TJbg=;
	b=N+q+DTlFZDgAt77zk3CxABu2+mKIuTAZP3M5OidG9CszIDuR9wk0U/8/5rU3eYl0AIPf
	 ky6H6PvukYiUWGT2J9s0tnsBZkDBZmBA6Q5/sidWBgEYZE3KpVCAw1gFij/oV5pcSBNJ5
	 dlXWDg0zp3HxSdITqWDkHP1tf/s0RLtSLeobl2eUNJjId0JACi1eE30gaco+2MqNN69NC
	 MqAfh+hOPbfQd58hEZMaTcLNV2Pn68hWlOe9cx2Cpk4v9HCPKcWdaXhSRiXLlN6P7rzex
	 IpkCGPkUbgQLxQ0+tSpuF8esQdoQixqW4FyDBSagWydEZvRoRFvtPfyOrJpmOEpqQDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xrKmckHE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.60
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5AF606A326
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 19:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5AF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xrKmckHE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+uKn37PCgz1RW13Cz/fD9tW2uUriYOjTRAuxNwW0vNvfwniyT+t1L61f+x3G+F4LC8e65w6eiZA462CZK/KALMiEHYGV1UoBTd7qEdV5q/2N1JSG9p7gsrIuu0zM1d7v6xQ6kHWY2Wbtgs642xcv6RMJOoWNBGnfINGK/pAZsDloXtCrnn5rvqqvGve33A11d3CzZsZ9UNs+kijbeftY17MiOLq6/oXbQtxPTg2PLt9PHTtZ95A6RWyf4nap4kCuAhkaEqQBRZnIfV4nwnufWXYit1DKol6lUUJYcKtV0yAX8JgKdLnBF3Sb/z+CPUejtIWof9/bEncB0svvtZVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QluwjBNotRS7YJrZly8meccVnM4hBS0H0GLpT99TJbg=;
 b=wIFZWDRNQVIbDUaxpQXF1uefUiUFo/7u6iLRqjzR/m6TYfHyjroshBkVH49FyLDvPeN+SVkBpkTMd7xeDdn3Q0BMsRU7wa5y7jvruKdJeZh1pAQY3YIpidPhYf5kfEg3aAhud9HUsGG3q3oWHGiv9qMWJC/KL8WGi6HaEnlIbxFTDbNKayJ8DGkPc4T1zq2fKJozsogXtof7TJcxFbGRhqgvfQcKo4+5heKzEt5UDDinaMYVTI4qNhUZ/zBsdcTvwjeHW1MStUAH0IwKvMpb660EVeC1+kuYfp8hDUE9vmWxOAYzDay9rXvx647zsH9j6IZIY+XtpnGyieYIMVkFPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QluwjBNotRS7YJrZly8meccVnM4hBS0H0GLpT99TJbg=;
 b=xrKmckHE2eCv0s3ZOVddj78EtglZWjpBzwejBm1ngnPEndjnlNtWLutAsSsyHxAhbElt22cP/zpuEXXke6wC4EsEWQ8PDndfcpQpuNYwv5Dbx8fEPeIuqU+Cbi2Ee8xX4Hi/Np2AbhyVoPgtqND/j7Q2+CEpIU1NwQlI+C3cYmQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by MN0PR12MB6271.namprd12.prod.outlook.com (2603:10b6:208:3c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 19:08:09 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.009; Sat, 7 Nov 2026
 19:08:09 +0000
Message-ID: <7dc2472f-4d08-4661-842d-c38427aea0e4@amd.com>
Date: Sun, 8 Nov 2026 00:37:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/25] soundwire: amd: fix work drain ordering in
 remove path
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-15-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-203033@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-203033@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYP287CA0072.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25a::10) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|MN0PR12MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: 8103059f-676c-411c-6238-08df3d027618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006|261028144727099003|261026140227099003|261022075727099003|261022105027099003|261021123027099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	H717wQoPM6GQQEs/4Lt03pyul/Th5zjTiMBE1JV9xneh95m8tx7AmD3+XBPB8xDUe8+UV5VpHLJwXCqNHjhya1zR2ycoW+9B1i6DbIufv2cUbBERr74J2Q2mTa7o03ANl/wedk5d92VxEm4ZNEARZ/Wc+bOv4HMXiUEpoh+XDZKVNWBiETYV4VH7YWkmodMlYFPVHrBDuYEWv+XQip+WF5UntzwVbtkSL/S9AWCWEL6Zn+NFNaCGWGQXUfSjrlTkM3xBuqw7Q4ZhKCPWqdsQBB0cSz0Bt7OR86qk8BdKDrTtD8JMxL5LlqSYiJoTKZ5unIoLoD6LMVEPSXHeLq9GotVhzIiUAtlFsd/LjzxRpKR9adCeaM+pDaqrLCyr6HOOaciF2kR6lsq8TlbO/T/sVj5AD6s57rj5jS9wjIzVpVLFOv/KAAFcdalDPqFvEAaffR90c+ZMajrObDWzPDrIt7ApdAv1UbPJt1buvp6lgD4B+kkHl0UDHUquFPAFtw3xv+A/fKvBGMbbstIEa78uiOXIxVsGRGz0VeNh2TiBa19qqi3il634l+3MOPCgfE1fiHgA7sGV9qFuBW2k0jt6joUIW34lkOiKGXaej+ihOgF9z/DwElZiYbMQzVVXAlSV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021123027099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHBiUzlqajhFZzU0VE1oaVJIKzZFWXhnd242SW5BZFdKNFR2L2ZKQWVQaTFJ?=
 =?utf-8?B?dktsanpDbVpkYVpkZ0p2TnVsRzZQQlBUVGcyaXJ1UDN4NFU4MXlIeHkrcTh4?=
 =?utf-8?B?RmljSXljS25Eck1PQktDMHA3d3lZMkkzcGhNdkwyMzhqcDZEZGdPTzBzTmZF?=
 =?utf-8?B?WFZ2ajdjQWJNK1NwMHRVR290cjZGMHloU2plc00rVjREbldFTDZoeGdWRWp0?=
 =?utf-8?B?TWFnSk5QNkNNczZHenRvN3RHdFg5cklFOGFCdDM2T3hxNjJuQTBiQldwblJo?=
 =?utf-8?B?R1pnUjlFcWVyMW0zc0ozczg0S0dzaG9PSEJGRDR4KytGOHR2NHh0dis2dXRx?=
 =?utf-8?B?QzJEVjNodW1zcG13Ym81RDhJUElmT3IvOVV0OHNwaEdydWtmVlpGaWY2OWsv?=
 =?utf-8?B?WnduNHZHaWR2RlpQV1FZTmFuQWUwcFBIbkRycFlSYy9QNGMrbWwyVUova1Nj?=
 =?utf-8?B?UkhSRGh1UmFjSjYyaWtpUzNQakNHamZVRVowem03VVpGWFVqaDZZS2lpcWNr?=
 =?utf-8?B?QlUzYXFla1lvMzVPWDFLdEMwbFIzRUZxQW5jaDdYQmZrK29VMlY4L0g4Rzdm?=
 =?utf-8?B?bFMvS21TOUFZd3lScjg3dFBhZm9SUlhIaVRnSUFLdjVwMTdYclhoc0N4c0k2?=
 =?utf-8?B?SDl3V3JNV2JxS3laMkNGYlIyL0VqWDJlcVhpRlZnNmRLNUp4RE1SSVlaVG9l?=
 =?utf-8?B?dDU0K1hZTVFXekdsRXpqazVGQTROeEFHTWJkQ3JxdFplOUZ0akpmTUZMeHRY?=
 =?utf-8?B?a2tTNnExVnpqT1RUcXByQWtPaGRJaU5tSXNMSVEyL3J3dGRRNUkwNkJJNFlG?=
 =?utf-8?B?TDQ4NDVZV3Q0WnhFdXFkVWh5Wng0QmVFU1dFenRPbUNWaXU3dzdteGkvSzdj?=
 =?utf-8?B?QU84NEJBaXZaTk9tZGduZWdoZEhVazhxYzRrTmdPdjJGaUt6KzUrV2pTKzNH?=
 =?utf-8?B?SUVDSE9sa0pPN3dSMG1xc2dGTFNNYkFtTVdFUUdheWFOeGx6U0tJUWpJaUor?=
 =?utf-8?B?dE50L29Vc29LOThPSVZxYXJDNGYzdDI4a2g2TDZwVkJUYXc0Z1c4eWYzd0ZF?=
 =?utf-8?B?QjROREp5ZC9zOFpNWlpqelRCVzhQYzZ3ejJSOHk0a3hKZnFHWm51a1Vlb1Ry?=
 =?utf-8?B?NlkvV0hjZEVyWnhvUE9pZXZ3b3lYRGhIc2RoL0lsdlVYcUxjK0tIc2trS0lt?=
 =?utf-8?B?dXcxTXRZZ2FZcjhDN3RZWEQ2ZEUvdVNjL0F3OGs5UE5OaEtYRGpSb0FMcW9C?=
 =?utf-8?B?RllKM09mQ3Z6SzFTcmcyNlIzeVBYUXJNYzFQL1g5YkFzcnpMVUZSN1FnVGxG?=
 =?utf-8?B?c1F3ZDVTWVJUbnFxOGVBeTFsZWZlOFRQMTlJZXMxMExWYVRxSkdNQmVaWkFD?=
 =?utf-8?B?ajB2Qit2OTdOd3ppR29Tc2RqaVpwTW90V1BPaGRyYzNxS2NIWk10Y01VYUFn?=
 =?utf-8?B?VzBSZ0lSeFRXTFRtdGt5bm50MFlTSWdaUUh3UHgyUVUrYTZBYmplelhYVklK?=
 =?utf-8?B?KzdRdEovMi9yUndCUUJjNHliNituTHJYTXZuc3o3bWZMejNCNS90dHpWRzdN?=
 =?utf-8?B?bmNialV1RlBmU2dzVnp5eCt3Q0xqbjI3T3YyK2ZoSEpHbElORVUrZE11ZWNC?=
 =?utf-8?B?Sk5keWQ1OTZnaGdOVnVlZkNCS3loT2MxUlk1OHJpdzY2Y2ZmWGFzdXhiTXJU?=
 =?utf-8?B?RzVnajJGdnVGMUdOaHVXMEd3d1BpNTZRckxhZTQxUHQ0Rmg1UUd3UU9kWWtv?=
 =?utf-8?B?RmF0amptVkNKVVNyWXVoYjQ1eVVsR3ZIZ0NFbTNoSXRNeVJwQ0dmN2NNdEZs?=
 =?utf-8?B?VnVRSU90NGtKUklJL3NHYUxCSlVWbzc1NVk2ZWc3SVVEOHVBNTdUMFZaYURC?=
 =?utf-8?B?RE1tN2NoZ0ZIUzJsUVhqUzl0RktIMGZpVngwbmN3b3ZtSUtlanVEeEdHNU9E?=
 =?utf-8?B?ZktaQ3N1Sm5xVEhjVS9GWXRRUUhPVEdCdVNmNUhkK3dlZm5rSXBibmMxR01a?=
 =?utf-8?B?RnkvcnZOK0d1eGo2S3lkczNJSE1VdExzRHFRa1YvYXBDUm9XUnFuL1NvbmdT?=
 =?utf-8?B?b3NyWk1XQVNIOGlNMncxTkhBVTJVMDNaYjFvTjgxZ3loaTNVbmZXOC9GOHhS?=
 =?utf-8?B?U2pHMmxUeGlyOWRnZjdjN0ZvZjFmUzg4K01rRVhENDFSU0VxcFFXM2tNTGZx?=
 =?utf-8?B?dGt0dkNHU2tNd0RUYlByYVg2ejBoZjlFVlFrZGJWUXhETDNZY21YV2ZETVcv?=
 =?utf-8?B?Mml2cVFzNXRPd1c2ZjRhMmF1bVhHKzh2R2dOQUxQYjJIRzVKYXlERmphQ3l5?=
 =?utf-8?B?c1J1SGsxUVFpWlpmNmVJT01KbnU4TG01eEFjSVpmaUowb0FRVWN4dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8103059f-676c-411c-6238-08df3d027618
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 19:08:09.3731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPSoMHKTzSVzz2GzStK8ohkTStDnX05YYYqzVpykLeSOmAsTb4T+3t8tta2gCNk4aKedCAI6AFEgguvqJM0j4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6271



On 11/7/26 21:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] soundwire: amd: race with in-flight IRQ handler in
>    amd_sdw_manager_remove()
> --
>
> commit 96eb0e85d023d4d06d5fe26f4e91328e3104ebef
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: fix work drain ordering in remove path
>
> This commit reorders work cancellation in amd_sdw_manager_remove() to disable
> SoundWire interrupts first and then cancel amd_sdw_irq_thread and amd_sdw_work.
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 767bc5510dfef..4083a3f0ec2f8 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1278,8 +1278,9 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
>>   	int ret;
>>   
>>   	pm_runtime_disable(&pdev->dev);
>> -	cancel_work_sync(&amd_manager->amd_sdw_work);
>>   	amd_disable_sdw_interrupts(amd_manager);
>> +	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>> +	cancel_work_sync(&amd_manager->amd_sdw_work);
>>   	sdw_bus_master_delete(&amd_manager->bus);
>>   	ret = amd_disable_sdw_manager(amd_manager);
>>   	if (ret)
> [Severity: High]
> Can an in-flight parent ACP interrupt handler still queue amd_sdw_irq_thread
> after cancel_work_sync() returns?
>
> Unlike disable_work_sync(), cancel_work_sync() only drains work that is
> already queued or running and leaves the work item enabled before returning.
> Without synchronize_irq() or disable_work_sync(), an interrupt asserted just
> before amd_disable_sdw_interrupts() masks ACP_EXTERNAL_INTR_CNTL can already
> be running acp63_irq_handler() on another CPU:
>
> sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
> 	...
> 	if (ext_intr_stat & ACP_SDW0_STAT) {
> 		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> 		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> 		if (amd_manager)
> 			schedule_work(&amd_manager->amd_sdw_irq_thread);
> 	...
> }
The acp63_irq_handler() code shown above is the pre-patch state.
The companion ASoC patch posted to alsa-devel adds an
interrupt_enabled guard in acp63_irq_handler() before the
schedule_work() call:

   Link: 
https://lore.kernel.org/alsa-devel/20261107175339.3547918-2-Vijendar.Mukunda@amd.com

amd_disable_sdw_interrupts() clears interrupt_enabled = false before
writing to ACP_EXTERNAL_INTR_CNTL, so any in-flight IRQ handler
that reads the flag after that point sees false and skips
schedule_work(). The delivery gate (ACP_EXTERNAL_INTR_CNTL) then
prevents any further IRQ deliveries. cancel_work_sync() drains any
work that was queued before or during the disable, covering the
remaining in-flight window.
> This allows schedule_work() to run after both cancel_work_sync() calls finish:
>
> CPU0                                      CPU1 (<hardirq>)
> amd_sdw_manager_remove()                  acp63_irq_handler()
>                                              readl(... + ACP_EXTERNAL_INTR_STAT)
>                                              amd_manager = dev_get_drvdata(...)
>    amd_disable_sdw_interrupts()
>    cancel_work_sync(&...->amd_sdw_irq_thread)
>    cancel_work_sync(&...->amd_sdw_work)
>                                              schedule_work(&...->amd_sdw_irq_thread)
>    sdw_bus_master_delete(&amd_manager->bus)
>    ...
>    devres_release_all()
>                                            amd_sdw_irq_thread()
>                                              readl(amd_manager->mmio + ...)
>                                                <-- use-after-free
>
> Even with commit "soundwire: amd: use interrupt_enabled flag to guard IRQ
> work scheduling" later in this series, interrupt_enabled is only checked
> inside amd_sdw_irq_thread() before queueing amd_sdw_work, so the hardirq
> handler still schedules amd_sdw_irq_thread unconditionally.
>
> Also, because amd_disable_sdw_interrupts() now runs before
> cancel_work_sync(&amd_manager->amd_sdw_work), an already running
> amd_sdw_update_slave_status_work() with status[0] == SDW_SLAVE_ATTACHED can
> write AMD_SDW_IRQ_MASK_0TO7 and AMD_SDW_IRQ_MASK_8TO11 back to
> ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11,
> overwriting the 0x00 masks written by amd_disable_sdw_interrupts().
amd_disable_sdw_interrupts() clears ACP_EXTERNAL_INTR_CNTL, which
is the delivery gate that forwards the ACP IRQ line to the CPU.
Even if a concurrently running amd_sdw_work re-enables the
state-change mask registers (ACP_SW_STATE_CHANGE_STATUS_MASK_*),
no new SoundWire interrupt can reach the CPU while the delivery
gate is closed. The state-change masks only control which SoundWire
events set the pending-interrupt flag in the IP; ACP_EXTERNAL_INTR_CNTL
controls whether that signal is forwarded. With the gate cleared,
re-enabling the state-change masks has no effect on interrupt delivery.
> Using disable_work_sync() instead of cancel_work_sync() (or synchronizing with
> the parent IRQ after masking) and masking the state-change registers after the
> work items are drained would prevent both races.
disable_work_sync() is not used here because it permanently disables
the work item, preventing re-arming on resume. The ordering
(disable-gate → drain irq_thread → drain work) combined with the
interrupt_enabled guard in the companion ASoC patch fully quiesces
the workqueues without requiring synchronize_irq() or
disable_work_sync().
>

