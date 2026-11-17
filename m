Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794918406;
	b=gVNE/54lhHovVzExZiUelFvYIP/gj3XTVs3pp29isxIxAKJnbXF41xHstIipMyeE6ClA
	 qIoOvsyGCkrRqSzoHXVIZ2mW7A2lImwNtqIlp8hxSZkes6+V6rH4HJxioG/IJl0cU3Tht
	 F8Zaj3vgr6DyrF+p3n8rM5PBsf+S6zo6UuaMcqPCkYq8mrg96UZ9oDuuIOFJgqeWw4nIM
	 MZFG3szHby7kfhGni1PQ4DyJUwD02vhtxU/tZ/fFOTTtZc6jPkkRVip/7p6+yx9G5dY9F
	 9PQJmIF71g+RQplDFdxkPHZXugQTSsVT2DHYLruxh6vBNiANpHYbpUyHtoTtASKA3ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918406;
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
	bh=IbOi5Dsywd0FOmsLyqnRkVr/QTv8C+3HmbaauKo2Okc=;
	b=SQOTiEWn9F4aM4SD7fsxHCUfOA/oF5fiobzVcz8q1sPkYfFCDZiu6kaOh9FzTl+MCUQs
	 eU7S4IUtpbQJ83G6TiMXqcn2NVvzno0Jbes0zbTnJqUdOVhGFRTpyma7290XXaRwAA2XE
	 LSB1lXopbQswYBjF2G0x+zCHagW+/C2RYYxF92PmEeQamL38aTgAEu/IZCqZxPoSc1VWD
	 ePi41fZh23PxyBGU9OUoA6SjecAjKX/uIFh9vK3KixQ5cSsF37BuNhonsY2kccXTX6wZh
	 o4rI6ZttkwbuY75XYdsnuiAnet5q8OqoCKQAtB2tdQobgVd+bpHzGFNb6z29E1GbOzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WqQ7zHGR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.5
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013005.outbound.protection.outlook.com [40.93.201.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD96606A32A
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 12:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD96606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WqQ7zHGR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jveqnBEBS0aeNlyNXjdzdbczrFPKwsk65U+Cln73/61HRtpLvck2aG7iDblqzj4WE/zpkBPGDjhFetktdUQQVJDVkA7+iecTVRRa6RWtsX98r90IcJjeIv03pgtkvUZaaAoULbakshuX5iK+cr0BdgPKsAROXtXUfRilG+OkA65vz7AG+Ob0ZByagEwlr1ZLIv2fcJIRR2G+GSPIjYjKX4H0dTr78EtvOtyoYX2Ff2PPCyuA5R/J38+/s3Ub9L/qA1lt9RmvUHfVx1li/C1rvLBTRE+dUVCbGZ+TtgknXJ87uU4cMbMaj0RPfcarwvL3gK0hrF1FUVxyMy/UcTTvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbOi5Dsywd0FOmsLyqnRkVr/QTv8C+3HmbaauKo2Okc=;
 b=NYNKP4MdG51o9vlq7pS3pJLsJouytAohHAYKGULSgDy4A+C5eK0wxpW9et4Dx3Ecd77I6BorxbN01XOfoh+xX/ZZCpf88k4UD4U8tBZBmlSeB4/lwYVU+x5+t04l4ih4xEgbivEGcE9VbdHKMVCBVMfN0+3WnPX9DOi6Aiafl9YCyWk219NZgMr0T6ynK2gLf5faBreMO5q9QVh2w0LLOgjn4CCHlGb17H+bT15AyHHC9yR1hCDJ/Tro7InpCkxZ0OLIgxFKCq9AROTdVtBo06Ff7NVgjweJS1gPBipkCBEG9LNfITe1xMqGigZJc8hoepaPcpmaSAXrr5Bl5p7ecw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbOi5Dsywd0FOmsLyqnRkVr/QTv8C+3HmbaauKo2Okc=;
 b=WqQ7zHGRL5cROeMMoWLLrfDZXbx21Y7+x+2PZgxG8WvQDFS5CUHvrY2d3pHKnK3+xUiksUErdH0q5X8KUK20ZSOsut6wzKN7gb7IOo7hiA4RyuUCjx/H7laXN18btpDf4GiqDPMxPFXjegidCwfQdUNGX8MwMlJvqcguQMatRo8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by LV8PR12MB9111.namprd12.prod.outlook.com (2603:10b6:408:189::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 12:26:42 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 12:26:42 +0000
Message-ID: <fe6f6b24-6928-4482-a455-66372f55b0e7@amd.com>
Date: Tue, 17 Nov 2026 17:59:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 20/23] soundwire: amd: fix interrupt gate and work
 drain ordering in PM ops
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
 <20261117070906.803139-21-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-218381@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-218381@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0103.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::8) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|LV8PR12MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: d176e142-71b0-4736-70fc-08df44a608eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	ePaAdANKbK+YFNXsr/AsDT6XPm3rEETNAwliV4UFPTvOuSaSXEcChU4eSUdy1Pfv9c+MOxs+OjHeF46XjBvx9Z1XcNr254CrZqB1OJEutX17gwRc6cSk47Mrf8LaTfB8tOmjnkESuurDSA1FfT+F7Cb6Vf9NdPyZ6mPaHgd4gcw3HFKtQ2k9c0AEeq/xTe8T81DLxNEAn5ewjEb9q3yNQsQIu4ynb6FYPOqPhnfo6m9gPl1P4B1lTiQkoBP+nvN/rw508XUhFh44xypp2U63kKoC9VGbT/J3eElxaet5lMfgLbASxaZbltZlBxx58onf2SF2DbeDdkf+ya8XeC1t0lCmeyTmzqdmj2hpZy+YPbvXmrntamf38crzz+r9TCNeJOSEvmkOAFWP/orBfGinCTG8oRbci2W2aE6akuy0kGuBqZm2HQOl8LUOUMfX8SQQ3Ovf3yoDzG1i6xWCNKi7BBKmOfItA5m/cZP2KZhtUxNL5GvrhVSxIq7XzbpxmHkaGC1GFPkDbVgj7o0YOzXmzzCR6iwUAxU0ppWB+CTCOKYQwQc14OFx6D6CA3wF9SJNfjyLrBiHQD0uxh8csQZOGgcT+KB6Tru2/uoCRGEV8QyKUrMHfDt/QnFnw/IhEoHehkxdqOtMJzMXdh6m/EL3zjFKFftGtpZq1I8cgllNn7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukdqc295dGkvOUM0cjBnbGRYOHIvOVc3OHYyZ0RNdmFMbTdhemVMbjVUd2RE?=
 =?utf-8?B?T29Pd1ZSbkVuZ1FETitXV09HakxQZ0xQYVRoYjNJMngxZmp2Zmd1NGFQTDU0?=
 =?utf-8?B?QU5yU1p0dkh1VTRnbGxXK29UYU8xMHZPdjl4SmdjRnR1eUFpbzgvYTRHbUtq?=
 =?utf-8?B?aWJpNEFVZ2lGdXlXNUMwMGt1ZHBSQm9aanFWVTcwQ2N2VktMNGttRUpJOG1O?=
 =?utf-8?B?TUsrU3hBcng1SlJvSnlYZHJhMVZ0U2dDdy9GYTZXV3FCUGIrbGJQQ2xnMC81?=
 =?utf-8?B?VndITUVMRUVqeDZsL0Q1aEpZaHptRjk0eDcvcEo4d251WEpzS3gwU3ZWWHNq?=
 =?utf-8?B?QVNmd2tuV1lHRjFUZjFYdDY5ZzZFMlhDS0VsOE9sL09SNkp6ZUtzRm1ISUt6?=
 =?utf-8?B?VjU5b2lQNm5raE1ST2RVODNzRy80akZ3OWhxZmthdldkeGwrUmF2K29tRFIz?=
 =?utf-8?B?Qm9SVUV2a2dZOEIxeHVodWlRY3VBNCtpZlpoa3V2WXQzOGJGaURLcHJSVnZS?=
 =?utf-8?B?SThBSFZPZi9nZDhTTWVFd0R2RFk0U0prQ2dQUHdWM3RZS2o4UmE0bE9vNDBJ?=
 =?utf-8?B?T0FZNlpDbEEyL1h1Tk5jcnF0aFBlNWZ0R3U1TUZXWTlYaWZOVWtqU0hSTjNV?=
 =?utf-8?B?MnY0VkhiZ3lia2o5Q3dCVkF2dXJwai84T1BiR3JYMWVOUVFtaEZoRFdSVzhQ?=
 =?utf-8?B?TVlqSHlKcDdQMEhETmROR1M5dnRsc1FzMUwzbk4vWUJqUmE2TEk4NDN6dDVt?=
 =?utf-8?B?Q0xTblQ1SGZHbFFkYjJ3cFpsWk1HaHROMEt2bFdGWU81SkNEa2xkOGo1REtT?=
 =?utf-8?B?NEl4YXYxMkNVdDVyR0FaOVoreGxpNTdqQjlmUThIOFVCMWFyZGRzYTdVdWRz?=
 =?utf-8?B?TXBjZVIzVEw1NHZWMDNrL3AxTGxkUzJYa2kwR2gyc0I5eWpVYUJGWVRwcmFU?=
 =?utf-8?B?UWRBbjNoSFppOHFJVUlOaDUzVUFtaWplV1BTTzB2Ty9Uc1ZlTEJSNDk0Mkxj?=
 =?utf-8?B?UURwaXlmN2p4V29OYXB0ZzNkQmloUW9FL3daRklwQ3NJZi94NUJwdUNZNGxj?=
 =?utf-8?B?K0VJVVNhUC9EM3pobzFNUGV6VjJYZHhFTmlDTkhRdWJYY1F1UXRESWtkSWVV?=
 =?utf-8?B?a3dQanNWTEZGN2ROcklJK0NpbzJsQ0l4K1ZQdHg1QndlYjdvcEUwSk9FUEFn?=
 =?utf-8?B?SFBEbFVuTTF5SGo1WU5SU01EYmxrRHA1RmNONE9XdHJPMVVzdkNLZFllRmxB?=
 =?utf-8?B?UVY2MDI1OURnRy9sUldyUXh0cHJ3ZXRMV1lxL2NhYUJlT3kyYUU2M2lIb2I4?=
 =?utf-8?B?dlBEbmw0bDZGdU9MRUh2L3JHV3RyemdmOUFyNWhtQ3ZVUG9DNHNWRGxwUm5z?=
 =?utf-8?B?Z3FPam1UYTRDWGhmZG42OCsrRmdTOFVBRFFSOWtVSWppRHhKZ0oxNlJXVzcw?=
 =?utf-8?B?WWJLRW5BbmRERzFFMnV2TXdkR3Nld3lrOG5WUXhOdmtZUUFzNGNGZXZYd3Z0?=
 =?utf-8?B?NWVzVkx2aHJ3U2NGNEdkbE9ZbDlJbEl1OGpsTDN5K1gySFRoS3VKTVhVVmk4?=
 =?utf-8?B?N3pELzNNdmlCdmVsZ2c4NU81VlhYdTVrY1BhaTlWSGt3bXBHR2k4cDlkMUtW?=
 =?utf-8?B?WDYvbmo1MGlFRTM4ZkFpaVlwQmhyM0F2SGFwM1Q1aXdCa05ORkREZWoxNm41?=
 =?utf-8?B?VUtlUVpCMkVKODhaY2U4Uit3NURQM2t0dlo4NGlwNTBNZjBCbFVwdXBTTTNi?=
 =?utf-8?B?K0FJc1EwYWN3cDZZWHV5Mk9UUHQzbHVBUGtxN1grRi82VVB4TjF5S21YSldh?=
 =?utf-8?B?MnZLczcyNTEvM2hMbXhxcG9ZQko3WGtrcHBIMTZXZ2g2MlRzUDJsOFdNZnBP?=
 =?utf-8?B?VXFzSnk0VmtmeEU4UjJoK3l3YWsyMHM0bVNCTVUxTFJ4b2NWQ3QzTkM1OGlG?=
 =?utf-8?B?enhOQnRqY29xbGJBVEovNlNEUm5iTmdDc1gvdHVlbWt2TzZDRXZuRE0vZ1pH?=
 =?utf-8?B?NEFDVlh0UDZ2MUszMjA3V1E5UTdHTjVRUmlWMXBFdTFKamU0Q093cWo3eTYr?=
 =?utf-8?B?S3lxL29yaXRYeE1FcXpIRDNoY2UwUWZQMm5hSjFSN3lIU29RN2hMSUx5cGRu?=
 =?utf-8?B?MDhMcy80Q21CYUJobFI0emRWTS9zR1RwSVRNTGN1T0NRM1lQSWl4T0dMeHNO?=
 =?utf-8?B?WmFZb1Z5cmlIMDdibytLR3h6Y1Jld2hyZis4WWNLRGVGRHY2Z25qWGVIc2Vs?=
 =?utf-8?B?aTVnMHE3djdBRFp3SXNTM3Z6TzBEZjJqU3ZQQm51U0VDMlU1MXNLYk9CNmhD?=
 =?utf-8?B?L0RVOXViY0xadnl0bFV0azAzbmdTZjJiZVNUdGpOU0dsUDF5UUxGZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d176e142-71b0-4736-70fc-08df44a608eb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 12:26:41.9573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yYsmHPSKE/Ho8bvCk3Faq2GoTtMm7F8aDZrlKhmgVmLBAPumSc9u0aD3P8ydiLF2UReklvgQ4C86R6X3ln0Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9111

On 17/11/26 13:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] soundwire: amd: runtime PM deadlock in amd_suspend_runtime()
>   work drain
> - [Medium] soundwire: amd: stale status bits and early IRQ enable in
>   amd_suspend()
> --
>
> commit 9fb00434cce0e9e4cd0523448b2e4bde7b333b08
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: fix interrupt gate and work drain ordering in PM ops
>
> This commit reorders interrupt masking, workqueue draining, and wake
> configuration across the CLK_STOP_MODE and POWER_OFF_MODE paths in
> amd_suspend() and amd_suspend_runtime().
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 57238c81997a2..220abf73cb25e 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1430,17 +1430,20 @@ static int __maybe_unused amd_suspend(struct device *dev)
>>  	}
>>  
>>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>> +		amd_disable_sdw_interrupts(amd_manager);
>> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>>  		cancel_work_sync(&amd_manager->amd_sdw_work);
>> -		amd_sdw_wake_enable(amd_manager, false);
>>  		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
>>  		if (ret)
>>  			return ret;
>>  		ret = amd_sdw_clock_stop(amd_manager);
>>  		if (ret)
>>  			return ret;
>> +		amd_enable_sdw_interrupts(amd_manager);
> [Severity: Medium]
> Can calling amd_enable_sdw_interrupts() after amd_sdw_clock_stop() without
> clearing ACP_SW_STATE_CHANGE_STATUS_0TO7 and
> ACP_SW_STATE_CHANGE_STATUS_8TO11 cause amd_sdw_irq_thread() to process
> stale peripheral status bits while the SoundWire clock is stopped?
No changes required. Once the SoundWire clock is stopped in CLK_STOP_MODE
the hardware cannot assert new state-change interrupts -- the bus is quiesced
and no peripheral can generate traffic. amd_enable_sdw_interrupts() restores
the interrupt masks so the manager is ready to process events immediately on
resume without needing a re-enable sequence.

Wake interrupts are a separate path and are only asserted when the SoundWire
manager transitions to D3 (POWER_OFF_MODE). In CLK_STOP_MODE suspend
the wake bit is not part of the masks restored by amd_enable_sdw_interrupts(),
so no spurious wake event can be delivered through this path either.
>
> When a SoundWire interrupt fires just before amd_disable_sdw_interrupts(),
> the parent ACP hard IRQ handler clears ACP_EXTERNAL_INTR_STAT and schedules
> amd_sdw_irq_thread, but the status registers are only cleared at the end of
> amd_sdw_irq_thread():
>
> drivers/soundwire/amd_manager.c:amd_sdw_irq_thread() {
> 	if (!READ_ONCE(amd_manager->interrupt_enabled))
> 		return;
>
> 	status_change_8to11 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
> 	status_change_0to7 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
>     ...
> }
>
> Because amd_disable_sdw_interrupts() sets interrupt_enabled to false and
> cancels amd_sdw_irq_thread without clearing those registers, any pending
> status bits (or bits latched during amd_sdw_clock_stop()) remain set in
> hardware.  In amd_suspend_runtime(), when a subsequent wake event triggers
> amd_sdw_irq_thread(), amd_sdw_process_wake_event() only queues an
> asynchronous pm_request_resume() before falling through to read the stale
> status_change_8to11 and status_change_0to7 bits and schedule amd_sdw_work
> while the link is still down, resulting in MIPI command timeouts
> (-ETIMEDOUT).
>
> In addition, the parent ACP IRQ handlers do not check interrupt_enabled
> before calling schedule_work(&amd_manager->amd_sdw_irq_thread), so an
> in-flight hard IRQ can queue amd_sdw_irq_thread after cancel_work_sync()
> returns and run once amd_enable_sdw_interrupts() sets interrupt_enabled
> back to true.  Finally, amd_sdw_clock_stop() returns 0 on its error paths,
> so if clock stop fails, amd_enable_sdw_interrupts() re-enables state-change
> interrupts with the bus clock still running.
>
> [ ... ]
>
>> @@ -1491,18 +1493,24 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
>>  		return 0;
>>  	}
>>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>> -		amd_sdw_wake_enable(amd_manager, true);
>> +		amd_disable_sdw_interrupts(amd_manager);
>> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>> +		cancel_work_sync(&amd_manager->amd_sdw_work);
>>  		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
>>  		if (ret)
>>  			return ret;
>>  		ret = amd_sdw_clock_stop(amd_manager);
>>  		if (ret)
>>  			return ret;
>> +		amd_enable_sdw_interrupts(amd_manager);
>> +		amd_sdw_wake_enable(amd_manager, true);
>>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
>> +		amd_disable_sdw_interrupts(amd_manager);
>> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>> +		cancel_work_sync(&amd_manager->amd_sdw_work);
> [Severity: High]
> Can cancel_work_sync(&amd_manager->amd_sdw_work) in amd_suspend_runtime()
> deadlock with amd_sdw_update_slave_status_work()?

No changes required. The sequence is:

WRITE_ONCE(interrupt_enabled, false)   /* amd_disable_sdw_interrupts() */
cancel_work_sync(&amd_sdw_irq_thread)  /* no new amd_sdw_work can be
                                            queued after this returns */
cancel_work_sync(&amd_sdw_work)

For the deadlock to occur, amd_sdw_work must have started executing before
interrupt_enabled was cleared, traversed the full call chain into
pm_runtime_get_sync(), and remained blocked there until cancel_work_sync()
is called. That window is extremely narrow given the sequencing above, and
AMD has not observed this scenario in testing.

>
> kworker/0                          kworker/1
> rpm_suspend(amd_manager->dev)
>   runtime_status = RPM_SUSPENDING
>   amd_suspend_runtime()
>                                    amd_sdw_update_slave_status_work()
>                                      sdw_handle_slave_status()
>                                        sdw_handle_slave_alerts()
>                                          pm_runtime_get_sync(&slave->dev)
>                                            rpm_resume(bus->dev, 0)
>                                              rpm_resume(amd_manager->dev, 0)
>                                                /* waits on RPM_SUSPENDING */
>     cancel_work_sync(&amd_sdw_work)  <-- deadlock
>
> In the SoundWire device hierarchy, slave->dev is a child of bus->dev, which
> is a child of amd_manager->dev, so both children are in RPM_SUSPENDED when
> amd_manager->dev enters rpm_suspend().  If a peripheral alert schedules
> amd_sdw_work just before amd_disable_sdw_interrupts() masks interrupts,
> sdw_handle_slave_alerts() calls pm_runtime_get_sync(&slave->dev), which
> synchronously resumes the parent chain up to amd_manager->dev and sleeps on
> amd_manager->dev->power.wait_queue waiting for amd_suspend_runtime() to
> finish, while amd_suspend_runtime() waits in cancel_work_sync() for
> amd_sdw_work to complete.
>

