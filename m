Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794076456;
	b=mm1YcEw/Cr6iqcWcWFDYA31XcdAnVks/IYqP5bRjQGZRb2alHibKDei49/d0/dTqi68n
	 1ToiXUvyEIy/Z8nvhI+mTCQ4MJEn0KfeuLK8ttxBe0e253FZdTBxdpsdkQXkXnHnE2h0B
	 yX+x4g9MSn0/Db+Vgk+nY3nwJPRQqkTon/vevEizjDF0sbhAGl4sy/JCshnxy0pMMySIM
	 i20MbQE6jvqdq49G8gPcylSPtdk0Iub9/L1gXymdFwez5JPv51vPXX9YSoopr4czBl2oW
	 EPmIldalvQ81g+/9dWFztBsTQyPgYImY9pwwmMYdKUZLplmKHNdIESs0D/rc5qaDDlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794076456;
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
	bh=f6xTyKT9g5Blv07lMVe/UZy/iJ82ZahA+35e/T+Pk7I=;
	b=ye9/Oq5slAXEgzZrBX+CEQ6D3WmZ1WffR1GZQnyPXhBKsz09APAZ/b30q8vAaO7Y/iId
	 tIbK+7d7efuebi15n22zWLYTkiEwgbXMzeF3j87t9rpghb2ut5nDY0UGS3HXgDFzlMBF+
	 aC9e0JPzL0/Ajyl6lvIj8U8SJUd3oSDj3EhguJy3mXYJpZkBBqevD8gyiCiHGnc9PctqB
	 1s8XAGjysUKDOofO/uQ4J8SvTF6/3B8MCjUjo08u25VCYmMnFWcvcH7Ni9Y+tXnylkagJ
	 tcCSRNDid89tT8EIR3zvRRYNaoEkZWlkRH8um+zouo9X3Mzukna82cqpipqCIemT2jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0p1jJZ93;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.15
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAFA606A326
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 18:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CAFA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0p1jJZ93
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVp3SH2NdVniEvJSF6hduWGRzTmsydNDt55PWx2mYcXiQjS9kRGuomZ6DzXaCMzesdDNlI1ulziR4sPIG3lTLIpZ1UlBK41wZPoZ5drAbnDbVOOvNskq7HeGiw9/QtYY7LpGmxcl0Ilf8jGM+JCxpxURKb5qhat61+V2HiekrAEc82DxwUHhCE+gFj3lUMKug9T71ck7mIdy6rHbxt9mx03zALkABgLyfqifzJNcvX65OZmn3LS8M+Mr23IftZME0R/QvwU/KwDop/qSQGQiIfoJNdXq3B5q+yubJni1x1IP4JJVipsRl75h8wOhqWPg7AXj5iAFz8T5ncWjkXga+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6xTyKT9g5Blv07lMVe/UZy/iJ82ZahA+35e/T+Pk7I=;
 b=mceTigYi4JX+2Z4Pjbswx1HAJmxNTfdbNLpKzDrLnhx1ZkgxPhbvxZqPdWA0F4/4WP7bbjR5MnU4nQp19pFjJI+0aSDuiNjFuF1fYesVf9XW5uvqJhjeMXhvBfEsZZQZXJqED2eVnD0Pp6rEe+d8BxZjDKfFN7UlN3N1Gs1LPclb7DTsWOJEtdhslJUREmdgkh8/D18tnxMTdAG+Sd9AzfnRPyhzvR3+s7IPsShmPwYIYcrObKcBJC7eaayupzs8kUCHEJAAKEPbz0ruJV4cHGXNVRwEC0cXUAA+q58kXk8TgtzMgDlZYTLnRL7oR6Kdg03tuemXhhGNXaFxuI+sLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6xTyKT9g5Blv07lMVe/UZy/iJ82ZahA+35e/T+Pk7I=;
 b=0p1jJZ93cb5i/SMfud0shkWHKycAvkrTZGOHTjc8JA4K3TLb+K9/+9aCa0sFvVR5hBXz3OSXeLFe6z4RrHRRzhgtmcmatPFvuA8Cm9r4cFiSXJ4xcX5YmMOgrla/FjSR9Jhz1c4MrtyRQ/RAHEXnM2JvUM8jImLa2vXLT6YtavU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 18:34:06 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.009; Sat, 7 Nov 2026
 18:34:06 +0000
Message-ID: <b7431514-8999-4f22-8b89-38ac1b960e68@amd.com>
Date: Sun, 8 Nov 2026 00:03:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: amd: ps: guard adata->sdw dereferences with
 NULL check in IRQ handler
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
 <20261107175339.3547918-2-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-203159@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-203159@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::6) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|PH7PR12MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d51cc0-54c8-46c2-1899-08df3cfdb49a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|11063799006|5023799004|4143699003|56012099006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	GkatCbCuBRRNwYgXdGHbS7jzr+4sye9CXsJy1UNCKr0iFo/hhbmbsSIXZDcMVdSCXxxQpZQIB9XRemXCH0DpRgJ56FDfsGKNxLdGIuL3ByWk5cRE3JGKrk+NStzQRR0a8Y8zxSMGXnyhdbNbHAd1icNdZDAapoRs4r1fX+X5cts9FIS0FNVtW7polDBYrwPSH76WGhdI9qhplTzdWP3oYL1/Hl3KCA7QJMXrwU+7EU8yyS51qDPGKBOMWE6GAV6mNV1Hyi8Fk/jFUiT9vOOaw5+Gr9AT1X5zoXamiC1S+x94ct9kYXZA7mGhqf92bLnnQMPejqnPacSV1T1tI1+DBmulJWCBFZj+uHc6JIMceCwc2eOcz+pV0R2j1GZAXc80lJgSMkcxNcBB/rc4WpPGmfCOW7MQQxmN4ySr1at3hxjLgDePOapWtiyvZ4Osdm4ngJzn6mLXDzaTMQ1F/lqjM5s+eSEXoErWJVScfolsmtMh5toskxMCL0/aHDVpoB9xcg9Ouqzdw9aH1XF2mYKcah58xUiJ690ig3f7M2B6TvKr91lw7yn/j7wlF5mDaZrwgXnUgF7TJEgR8iRQ+Bb0IapRb9Slg7MmE4hCZvFeeXs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(5023799004)(4143699003)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGtldjRDSk1yMHlnTkp4OXE0UUQwRzA0MjFvbnN1c01OQllJOG91Sjd2b1Nu?=
 =?utf-8?B?Y0E5eGFRTGpNeXNlRHNQZVh2UVhWRFpGaUtrbC9LKzJRRnk4NDZSbkYxa1p0?=
 =?utf-8?B?ZjdmN3ZaL3RYV04rbE4vYjBpTjdOSjFRbi80M2YxSDJtQ1pGTHptVjdCT2xt?=
 =?utf-8?B?dFp4ZjYxZ2hoUzIrTEViWVhxWkEwZmkyY09NSWM5TnBReWxLdlg0VEJVVWh4?=
 =?utf-8?B?VHErZXdhalpaby9xYWxsL25mVU10S01PdCs0bStzWDVFbHdIOHBXR3Q4bzY5?=
 =?utf-8?B?dTlLaExFTVROdEsrbnZOdEtSZGJpOUpTeTVBZzdQSExFSzZUbzlqRFhyRlpC?=
 =?utf-8?B?QmFacGFVRmt5M3hUb3VhblZCRVorcWFVa0ZiT0JBaWp6YmxoeTRNU2tNNitV?=
 =?utf-8?B?SCtuSWNYNWpjMGVodXJYdXNwVHdDc2QvSjAwWURMSmM1U1UrZDErWFlVOEhP?=
 =?utf-8?B?eWxDVjZVTFpTSmhkT2pvSnBTU01HdTVqN2pmTUpwbWZ5V0kwcFgrc29RaXBQ?=
 =?utf-8?B?SjJiS3k5bmd4UXVlWnNWTERnWldsMzdpQTF6ekFFN3B2Ylp3NFhMWXE0U000?=
 =?utf-8?B?QkduNktoTHBxUUpRb040SlBpWExubXZxMzUwN2JCSHNJWkZnSCtheURLNWtT?=
 =?utf-8?B?MHlOL3BvMU5nWm12MURDODh3bE9jNmxDeFdzcTZFU1ZDbnYya2dGQ2JIRDZD?=
 =?utf-8?B?NkZxTUJtcm9jUmVyTlBnVjBvQm9VeDNCMGgzc0JHTVpPOVBVbzQ5Uys0SVl2?=
 =?utf-8?B?eWRyRUs5a0V3R0duSFNuM2I2SUVKNkVTN25DTVVGdGFRYS83QjVOK3BRb1Z0?=
 =?utf-8?B?ZXBpTXVCeENFRWx5TjJRTml1bE1NUGk1Ymk1UytJTlVvb0VGMXVUdXVCVkxD?=
 =?utf-8?B?eTJMQTJ2aU43NmdJc1c2TGNrdFhZdlJvaC9kT1R6MUNrY0ZPaXkzR1NjdTRj?=
 =?utf-8?B?OWZvYlZOU09lRThJajNKaWZFOHdya3FUZ09nTkxYWHlHVll2Y0dqNnNDTW0v?=
 =?utf-8?B?OVlINFhJOHczM0d6Yk8vajVsM0xnSWNXS1lHTUEyamhBUXAzRWdoZktZRUVM?=
 =?utf-8?B?SjQ2dzR3SzU4UEpxRzd4cm9DNGcvTmdKYWVkTGYveGtSSFUrRU5LVnBDUStG?=
 =?utf-8?B?cm1VRDBMVExkVjFWRUtSVEFlVGNBMERlYmNtOXlLTGR5YlZDbk5SWnlqUHh4?=
 =?utf-8?B?QTBkQ1UrUndWbFFITWh0WEdWVjdmZzVZd20zVGRKZUFzNit3aEcwOVFKYStx?=
 =?utf-8?B?T1Y0cWh0UTBIWlpxSEhDZStzZ2JNd25LaXdqREc0Tko4RXVFeHhmbXI0eXV5?=
 =?utf-8?B?N1hmWkd4UnlBSnkycWtsMHgrMjdsU0MxTUxZeWlmQkFLcFhtYlRpYTNNQ0ZW?=
 =?utf-8?B?dzhVNEl3V0x3UGtpNzZadnQ1Z21hQkRPcHFJTmtDdW5BVHB0SGRUWEdzMHpu?=
 =?utf-8?B?alNheWlwUzFOVUlOVDVWWExxV1lreWZWanY3U2lUL0NKckxQRWpJRkVGSWM1?=
 =?utf-8?B?blQ0M3FUM2VmRGVnaHB1aDVwSTNzaUlDc1RyR0J3cGhVVlBWNUtYY1ZCRlBP?=
 =?utf-8?B?dGkveWZaL0xmazVjUWlHdFZwUzBVMk5kMjdaWG5ZaHBxRGZ4T0s2N2hzY0d5?=
 =?utf-8?B?ZGNueVNRdExMM1c4Q3JBWDdMK3JGU1A5dEtZRUdTUjR6NFg4amQ0S1g0dEkz?=
 =?utf-8?B?WUQxTFlBUi9QTldRYVBjQ3JUaGh4dUVZK1MwanpTTTVsTkZ4dUQ0dVgzWXRw?=
 =?utf-8?B?dERabEpuSUloNTRqMURDSElTME5HQWhvKzJldlkzZnhDY0xtUFl3c3kyUEc1?=
 =?utf-8?B?S0hoYUxkYlppNEttSEwxUkJvb0ZqMUMrbjdNVEhyVUJCRnlyT2NIMHN0SE5J?=
 =?utf-8?B?U2ZPQ1cvNHBtRCtTLzQ1OExIeDcvM2dtU2ZCZkVvTlJ5aFAwb0tyNEdVNXox?=
 =?utf-8?B?ekswVmFacjhNRHRJMVA4TWc0dDk2bVR1bEZPZk9hanJiQXVtKzRlM1RYa3pn?=
 =?utf-8?B?WElHK2RhZExmK3VoRnl5RXgycnhqdjRBT2xQZzJ1QmxjQis1bjVmVHBQNUp0?=
 =?utf-8?B?ZDl5TnZsMVMxbmdld0FrdDR4Y3l5RFN4NFJ2SXhQWm1XeHk2Y3p5dFRxMGhz?=
 =?utf-8?B?QTE0dUVXV2hIVE0zc0pOcjd4akR2bWxORXh0Qm9oVmh3bWxjczlGME1zeXYv?=
 =?utf-8?B?bWRTT2t1QXQ4U0kwdkJZZ1RmU3VVdzQwNXl4OHVFQXMyeWxta01TVDIwemxo?=
 =?utf-8?B?QldqanB3c09UN21VcEh2Nm5ITm5Vck1jNllHT092QnUzbncwRjdCRkx4UVBJ?=
 =?utf-8?B?RmNPdDIrbGMxbWFsRDFGWjBqME5OMTBkSXF6OEpjYlJkbXdoYUYrUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d51cc0-54c8-46c2-1899-08df3cfdb49a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 18:34:06.5552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drI6E83z4ndumCz4OYeAEn87HMxsMpU/XXbBZA1AEAgDqEjZOh1gazjeXv+Urp1NnROSk3yfJUrRWiJzMDJwZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562



On 11/7/26 23:42, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ASoC: amd: ps: NULL deref of adata->sdw->pdev[i] on
>    single-link SDW configs
> - [Low] ASoC: amd: ps: inaccurate commit message teardown claim and
>    Fixes tag
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] soundwire: amd: use-after-free in amd_sdw_manager_remove()
>    [1]
> --
>
> commit 929ea19624010c51ae72f2eb65f2e1a41edc5971
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
>> ASoC: amd: ps: guard adata->sdw dereferences with NULL check in IRQ handler
>>
>> The ACP external IRQ handler is registered before sdw_amd_probe() assigns
>> adata->sdw, so a stray interrupt in the probe window could reach the
>> adata->sdw->pdev[i] dereference with adata->sdw still NULL.
>>
>> The same window exists on the teardown side: after sdw_amd_exit() frees
>> the context but before adata->sdw is cleared by the caller.
>>
>> Add NULL checks for adata->sdw in acp63_irq_handler() before dereferencing
>> ->pdev[0] and ->pdev[1], and in handle_acp70_sdw_wake_event() for the same
>> reason.  The interrupt-status register write that acknowledges the IRQ is
>> kept outside the guard so the hardware bit is always cleared regardless of
>> whether the SoundWire context is live.
>>
>> Fixes: e1cb350610ce ("ASoC: amd: ps: handle SoundWire interrupts in acp pci driver")
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> [Severity: Low]
> Is the teardown description and Fixes tag accurate here?
you are correct. During teardown adata->sdw
is non-NULL while sdw_amd_exit() runs and is set to NULL only
afterwards, so the if (adata->sdw) guard sees a dangling pointer
rather than NULL in that window. snd_acp63_remove() avoids the
race by calling acp_hw_disable_interrupts() and devm_free_irq()
before amd_sdw_exit(). The teardown sentence will be removed from
the commit message in v2.
>
> In amd_sdw_exit(), sdw_amd_exit(acp_data->sdw) frees the context while
> acp_data->sdw is still non-NULL, and acp_data->sdw = NULL only runs after
> sdw_amd_exit() returns, so an if (adata->sdw) check in that window would
> see a dangling non-NULL pointer rather than NULL (snd_acp63_remove()
> instead avoids this by calling acp_hw_disable_interrupts() and
> devm_free_irq() before amd_sdw_exit()).
>
> Also, e1cb350610ce ("ASoC: amd: ps: handle SoundWire interrupts in acp pci
> driver") predates adata->sdw.  The adata->sdw dereferences in
> acp63_irq_handler() were introduced by eaf825037d6d ("ASoC: amd: ps:
> refactor acp child platform device creation code"), and
> handle_acp70_sdw_wake_event() was added by 3898b189079c ("ASoC: amd: ps:
> add soundwire wake interrupt handling").
Will use correct Fixes tag
>
>> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
>> index b604db4942dd6..d0b66df101579 100644
>> --- a/sound/soc/amd/ps/pci-ps.c
>> +++ b/sound/soc/amd/ps/pci-ps.c
>> @@ -26,16 +26,20 @@ static void handle_acp70_sdw_wake_event(struct acp63_dev_data *adata)
>>   	struct amd_sdw_manager *amd_manager;
>>   
>>   	if (adata->acp70_sdw0_wake_event) {
>> -		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>> -		if (amd_manager)
>> -			pm_request_resume(amd_manager->dev);
>> +		if (adata->sdw) {
>> +			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>> +			if (amd_manager)
>> +				pm_request_resume(amd_manager->dev);
>> +		}
>>   		adata->acp70_sdw0_wake_event = 0;
>>   	}
>>   
>>   	if (adata->acp70_sdw1_wake_event) {
>> -		amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
>> -		if (amd_manager)
>> -			pm_request_resume(amd_manager->dev);
>> +		if (adata->sdw) {
>> +			amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
>> +			if (amd_manager)
>> +				pm_request_resume(amd_manager->dev);
>> +		}
>>   		adata->acp70_sdw1_wake_event = 0;
>>   	}
>>   }
>> @@ -209,18 +213,22 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
>>   	ext_intr_stat = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>>   	if (ext_intr_stat & ACP_SDW0_STAT) {
>>   		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>> -		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>> -		if (amd_manager)
>> -			schedule_work(&amd_manager->amd_sdw_irq_thread);
>> +		if (adata->sdw) {
>> +			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>> +			if (amd_manager)
>> +				schedule_work(&amd_manager->amd_sdw_irq_thread);
>> +		}
>>   		irq_flag = 1;
>>   	}
>>   
>>   	ext_intr_stat1 = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
>>   	if (ext_intr_stat1 & ACP_SDW1_STAT) {
>>   		writel(ACP_SDW1_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
>> -		amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
>> -		if (amd_manager)
>> -			schedule_work(&amd_manager->amd_sdw_irq_thread);
>> +		if (adata->sdw) {
>> +			amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
>> +			if (amd_manager)
>> +				schedule_work(&amd_manager->amd_sdw_irq_thread);
>> +		}
>>   		irq_flag = 1;
>>   	}
> [Severity: Medium]
> Can adata->sdw->pdev[0] or adata->sdw->pdev[1] still be NULL when
> adata->sdw is non-NULL?
for ACP6.3/7.0/7.1/7.2, all link platform
devices are probed and registered during sdw_amd_probe_controller().
The AMD-specific enable mask only controls whether the start
sequence is invoked for a given link, not whether its pdev is
registered. So pdev[0] and pdev[1] are always non-NULL when
adata->sdw is non-NULL. No additional pdev[i] NULL checks are
needed.
> In sdw_amd_probe_controller(), ctx->pdev[index] is only registered for
> links set in link_mask:
>
> drivers/soundwire/amd_init.c:sdw_amd_probe_controller() {
>      ...
> 	for (index = 0; index < count; index++) {
> 		if (!(link_mask & BIT(index)))
> 			continue;
>      ...
> 		ctx->pdev[index] = platform_device_register_full(&pdevinfo[index]);
> }
>
> On single-link configurations (where link_mask is BIT(0) or BIT(1)),
> adata->sdw is non-NULL while the unused link's pdev[i] remains NULL.  A
> stray interrupt or wake event for that link in acp63_irq_handler() or
> handle_acp70_sdw_wake_event() will then pass &adata->sdw->pdev[i]->dev to
> dev_get_drvdata() and cause a NULL pointer dereference, as
> acp70_enable_sdw_host_wake_interrupts() unmasks ACP70_SDW_HOST_WAKE_MASK
> for both links whenever either link enables host wake.
>
> Should these checks also verify adata->sdw->pdev[0] and
> adata->sdw->pdev[1] (like handle_acp63_sdw_pme_event() does)?
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can unbinding the child
> SoundWire manager device race with acp63_irq_handler() and cause a
> use-after-free of amd_manager [1]?
The IRQ related fixes including this gap are addressed in the following
series:

https://lore.kernel.org/linux-sound/20261107154659.3358223-1-Vijendar.Mukunda@amd.com/ 

>
> CPU0                                CPU1
> acp63_irq_handler()
>    amd_manager = dev_get_drvdata()
>                                      amd_sdw_manager_remove()
>                                        cancel_work_sync(...)
>                                        amd_disable_sdw_interrupts()
>                                      <driver core frees amd_manager>
>    if (amd_manager)
>      schedule_work(&amd_manager->amd_sdw_irq_thread);  <-- use-after-free
>
> amd_sdw_manager_remove() masks SoundWire interrupts and cancels
> amd_sdw_work, but does not synchronize with the parent ACP IRQ handler or
> cancel amd_sdw_irq_thread before devres frees amd_manager.  If
> acp63_irq_handler() reads amd_manager before removal finishes and calls
> schedule_work() afterwards, it queues work on the freed amd_manager.
>
> [1] https://sashiko.dev/#/bug/linux-ab458b2e-f505-4a41-8238-a93ceb5d9c77
>

