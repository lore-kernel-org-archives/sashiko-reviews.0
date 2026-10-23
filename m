Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792743130;
	b=Z3qzLYDusUxWpQbHPYseIW/VJzp5nur9r5zWR1RMQaBEudnBcqbokUeOQrDAlpFU3qg+
	 azLVfQXLs0Xl6ZkewxOCqLs1m/tkEa9XNOhm7vxT4/sNkku0yz5Ys3oJ3EFJKuob7Qxv/
	 2pqL4UJaOXycohrQbbgNhl6vU9PPrypUMRAhee8mmrqosF/felT2Hg49SVpNR/gYVokFV
	 3hMm2HPO1IbRVvRjQp1jWOmBQ4s4zGa2HrvolKFvOTNavf9IHNGJUMnyS/DNJBxL4MWYS
	 A+BClNDG9875EMAdgUyKo2Vow2OVQIIgm3iLAS6uiWftIk7U95WLF0v2TeRjgwZMvTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743130;
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
	bh=sJ+LWRE25w+reGrbjybk4X63+5mXT9YYGQsw8Hsxxt0=;
	b=Z0OxgG2xpw0+wYgsJ9IFTVRKtKIkqOHqwYShPdsdkS08vD5g9yBYnalzVDv/h1co4BYs
	 tC8mHLzvYtr8VCurPvfCvU+MbXJwhyWwDsSaMEoXEquEeQvArpcAkcOQA3ELG9K/POxF8
	 yaj0hhSZ1QJAjQ1oJd5RKLIqhlnRlWv3Yc7EypRUSbjs3Uou/fNmBTOJ0hQGGunIvXI2m
	 NS2wrUTX+/Dyh9H3COTTwisiM7Ow5iQcPHbBGHhM3jpK6dIcSwN25KCgNLbrqH8i/PFAw
	 WDfTid2rLnNRD+EA3ikXBQnsylwj6aUKJgJo5DICjwOuZ3TRljKow/KQtergnYO61sA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="Azy/Vf6J";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.49
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010049.outbound.protection.outlook.com [40.93.198.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D484F606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 08:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D484F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Azy/Vf6J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iP2zAa8KsrYS7M8X5zpZgfNbnCEPn2txWMCnAINGshv+d07S2+VvNPe5DobLOiKY5qc95OGamKys9+hN+MtsMTzu/iQcHp6C9Zfni5ok6hibDRKLm/pnmM95v08QOIDpncW01xFLfeKwLN88N0GI/Knj4CdQo4eTRUvklkoNRb0mKKGu6CeJunB09jaCmikP/I9ObpxfqbSh/03MsvujBtk456g1wDfdLpHR9NfkuNgIInC82sNroRHMyqqEckwwxnur/cVL4XntBetBEOvlOdD/CsKqXVPebvkw8v2293wF0Q1WeK9T4O61kQJBGHLMClb2QOjvRSgBAgfvVZV+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJ+LWRE25w+reGrbjybk4X63+5mXT9YYGQsw8Hsxxt0=;
 b=fUQLN0nrLSnSmUme4z2InN6Y3PWF30iLygbXA5Zyx/ZGFgjAygWCjvp0PnZltzdhnDg0Z4oRkX2VFSP+/EOGbMuojKhOcKFGIs5UOnNncAubeOzRBoLC9H4n4/Lvz47LNFSfa34JI9TuHD9bkvu0eki7rcKM+tmSAw9H1SuiJsn7FTv2hUoFA/M685Isgee1rbhiXxwPk2iuSG81kz9IUwq1EEAPgHSdgfZdP7RHyIVRsJjsQY8x+O6Ly5QAX8wLQMQ3ZZXxgKAltFqZwyHDECrO36VmpTEyevEklGmozNl7/IlIpdgOITE6fLdbsUbsL+oyab6OnT3E9+n0VXQY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJ+LWRE25w+reGrbjybk4X63+5mXT9YYGQsw8Hsxxt0=;
 b=Azy/Vf6JzkMYfvpsQUsxCWws3oCgBNPd4ay4wnV0ysJYnt6sSecTL9p4/5CNMCjHGyoqFrCWqFK6LWWcQnefqd0Z4RINOxLTKjKjqJNfblYTdCQ4yAU8LDdRCv0wxGcwtSox5xRl5djsZXzScadDfNDym9p2iSAVJL7mWkc8Hoo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CH3PR12MB9124.namprd12.prod.outlook.com (2603:10b6:610:1a7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.19; Fri, 23 Oct 2026 08:12:06 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 08:12:05 +0000
Message-ID: <f6841a67-f908-41e2-aaf4-e1d306b3f824@amd.com>
Date: Fri, 23 Oct 2026 13:40:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] ASoC: amd: acp: add DMIC components string for
 SOF SoundWire machine driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 "Prasad, Prasad" <venkataprasad.potturu@amd.com>,
 Syed Saba Kareem <syed.sabakareem@amd.com>
References: <20261023065216.3473883-1-Vijendar.Mukunda@amd.com>
 <20261023065216.3473883-8-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-182386@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-182386@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYPR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ba::7) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
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
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CH3PR12MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: bdcd2810-4e14-4198-c999-08df30dd532b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|5023799004|56012099006|261022105027099003|261022075727099003|261021121427099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	HpmB+0xVeC81bKTOkqFXl4WlhyyH2WD0X6SfGWD9nnVCGd1Nf/tcaZeGeFb7idTcPdN2f/h3n6prSGmK/ZUtpxATyaApYA20ax33hRqnr7HKkepWoS/1a/1MGbI9/gI7hnCr19mMMDAPewdgDIEXpePx9c4rPGdUYqCchzzgxjAlURMdma/GZEGrfltf+CLiSvvoqfj2xNsMTV6ccFGJERzEYvJmqLxdsry164UP0PM/DO4ulfnV9RvoEAFNIK2YLZlYtd5LDBKd1LMiUbbnmc9GgTF3Eof2mH7eDGnHXw6vY2eU8hsGabR9ssUkzHnJHvAm8Q8CU5mJo774l4NlLFuu5y3M5zfwdUuduxt83oKQ/7taVUKsg6VS1N7DQio7Fdena/dHboAGxuJpO+ln+opEk4DBpQ+KVM3uH5YkLVE+Q61gnwyvuwuOB37dqLhiUT66znwI3KX8zd51O7XdeKE7JnjL0S1cnufmYw/ELWt96og9NB6T2eb7OsjDTjIt4JCN/2mKQHxW8L8STNkrfCN+KpwAPeZl792thD0xvbE7mlumJHfwMnNEYfdlC48Z9R2JznlwMiXI9E9KT/2aGVaVrDC2NcexbnGY/brHcmU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(5023799004)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1FSYngwbms1Z0UwV0thM0Z0bjV2cHNDaHlpRkRPdFozdDhSa3d0S2VtUmZm?=
 =?utf-8?B?M1hhcUN1WktkcUZhVDU0WllBNG5wZlBPOHhITzFHUVdOT3pYSHlsZHUyR056?=
 =?utf-8?B?ZnVySzl3MzlWcVh2d2dCUlV0TDZxdnI1T2UzWkNlUDZSM2QzTy9iTURCZm1B?=
 =?utf-8?B?bjV3WkJyT1dOL291SGFhTUFOTytmaW43Ym54SWNOK25Yb0VlRXhjbC9jV1FB?=
 =?utf-8?B?ZkhxSWQwSGpDUUVpYTFZZ0l2anMzNHE5aEh3WC9XZkhlZzg5K1AvTHdVZmlv?=
 =?utf-8?B?ZUVXYlpqdmtWNUFMTFVYN3NjcGVtTmJMaVRjWlRKRjFvMVREbjVoWGl5S1Zj?=
 =?utf-8?B?TWZYSHJkNWV2R0ttTk1jWWZvTjZKL0lkV0sweDR4NXgwM0lpQzNoVkdyaFNo?=
 =?utf-8?B?WkU1TWpQSFFTcE5tajMwSjU0MTcwNTVCaHRhcElLR3RQRHdyb2NmRitsQ2d1?=
 =?utf-8?B?S3VDNStYa2g4V1NZUStod0JXVjRhK0MvRWl3bVZReUdlMitid010QmhFekJx?=
 =?utf-8?B?Y1JwOUxKcGZkSDFNazFQSFAwQWRLSm5NUDIxbFFsM3N1ZFZyVzZpZzJjWGlx?=
 =?utf-8?B?b3VXcVYzY0NKc3Axb3dkWXAyYk9icjBFODhlek5ySW53RGM5MzFlMmdoRVZ3?=
 =?utf-8?B?L01uRTNzdFlqQ2Y5d1JEN2xNMThSamg4aUZpQmUzREozbzJJQm0xSlNGZmZQ?=
 =?utf-8?B?dkxhZlJoeWxXem5nWUN4YVJrVVQzdFhwdnlFM05jdnZ3cnpWSUJVYTdxVUhG?=
 =?utf-8?B?OWlERzZ6WEpOMmlYTHhqcnJ6YnlINGhZaUdKYjViVHJWRjRUNGdHQTdPVDlp?=
 =?utf-8?B?a0pmSkZLUjd0dm9DTkEzUTVQQzc3UjMvbFlPbUVUYlVDOTJReWFvd1dwS01t?=
 =?utf-8?B?Q0pxSWx4SCtqd2NRNU5zSWtUYlFRellIcWIxTXZHU3Y4ZU1uZmEwWm9wdXpO?=
 =?utf-8?B?aUZEMFR3QWwyRlhLTTZEUXNKNmJUWnpLQTZab3NtTjFTYnNWQzFrWXpDNjNa?=
 =?utf-8?B?REIrTE4rOHhlQ2dHb2IwQzBIZVlFazRlbzVnbnorSzlFYWw4cWxRRFovNVdw?=
 =?utf-8?B?eFRHWlFUakY1R2NiRE5TblBseDlDWXVML091LytKWm5PaHBHdkRWaEk3Rmpi?=
 =?utf-8?B?eFhkRkFDZ09nNlVQVk5mZ1pxOGJJVU9SWll0VW9MdEkyRGd0WUFaakJpOWRj?=
 =?utf-8?B?T0RkTkI1a3dPc2ZkTG4rV0E2VmxLWThOZnFjUVVabDlkQmpoUmxnZHFwUWk3?=
 =?utf-8?B?SFJ2ek56Smdwa28rdDlSaGp1Vlc3cEllVEo5T091cTkyVlFpVUphdU5HOHZQ?=
 =?utf-8?B?U1Z5bEgzcE54RVB3SitNQ0kvNDlqb2p0ZmJFSVM5c3V3MVYxTmtaZXpnOWJk?=
 =?utf-8?B?V0RaTnhvWUx1b3Z4bkVmcTlYakpGeHB6dXVmRzh0L3pnMmE2L2s3YjJzMWRp?=
 =?utf-8?B?bzdnL2FvR3liRzJwaGNrbFU2Y3pjS3JDZGltWFNTVWZ1bkQ0NUU2WTkxR0o5?=
 =?utf-8?B?aTkrdkRiZWlvMzc1RTNQV2ZIak5vb0xCbS9oa3pZaXlPSTVjTDkzUk1KMVdD?=
 =?utf-8?B?NUd0clVoTlAvNlEzM1ZDZ0lONENpdnBxeU0xaWNKYlRpV1lVTGFBci83dkhD?=
 =?utf-8?B?elhJUmNiWmtxNnlEaVNsOGMvcm91QmxTZXllMW9sTDdKOC84MUpTQnloUkpW?=
 =?utf-8?B?QVBpTEpHK3JYY0pQSXJXSXNtY09hVm9YbS9FU1dEbktDNk1JbURNR0l4VStW?=
 =?utf-8?B?ZCt1a3JCMktES08velJhU0t3Q3VNS2MzQmV1WE9Eem9yTVh4YXlHUkFBMTRw?=
 =?utf-8?B?ZmhTVm02aWZIaGJIdnRJQkhXY2RKOEw3dXZtdkNUNTJqeWhhNVFqV0E4a0Zo?=
 =?utf-8?B?ZXVWMWlDUW0xMzlrNkFpZGdTZzVKSklUYkZUTmhIWTR0bE1ZbzNTYXdXVmxk?=
 =?utf-8?B?WGhIQXJLbEUvQ0JPczZtM0NtMkVKaHYvOTNqNGtuc2FCZ2xwRlJiLzZ3aGh6?=
 =?utf-8?B?dHE2RjJsbHpWR3pocGVNdWRzT0d2Wm1nemx6R21kdDV6bi9IRDFkbGFZTFBi?=
 =?utf-8?B?ZWM2K1pOYyt6ZzJCVUhEV0QvMHNEK01IS2tHV2ZNVkZvOHFtN0RFY2Nmb1Vq?=
 =?utf-8?B?eUF5WnorWlBtd1NMdittUW45dldqdXlNNThnRG9WcytMZzZUS0J6cTNpUDlT?=
 =?utf-8?B?aHBMR0RFbTlUcVI0cUlVM3ZYNEg1M3VseGVyeEREVW9XRVN0VnEzT2pwMXN5?=
 =?utf-8?B?VkNMNnZYWGxEMG15QUErMlU3eldpZGN3eXFWaXI3aVFBTTNzWllvYi9yTm14?=
 =?utf-8?B?ejc0YWxYbVgrWkwzUWlNbUk4azYwdGo4SnVCZjE3SFJVcUJUbnpIQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdcd2810-4e14-4198-c999-08df30dd532b
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 08:12:05.4616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/8I4rHdx2f4L1r5lw2qWiWZGRXqNO11kDLtnY+C6WH0YdwcAMNvokkPGWisxD4+g9OIANxJSmLgRfMnjamsMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9124



On 10/23/26 12:40, sashiko-bot@kernel.org wrote:
> [You don't often get email from sashiko-bot@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] ASoC: amd: acp: missing asoc_sdw_mc_dailink_exit_loop() in mc_probe()
> --
>
> commit 418fccdf2ffaf02e2c03c094859e73443fbe31c7
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> ASoC: amd: acp: add DMIC components string for SOF SoundWire machine driver
>
> This commit appends the DMIC component and mic count string to
> card->components in mc_probe() when a DMIC DAI link is created by
> sof_card_dai_links_create().
>
>> diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
>> index 5c201d0b3bef9..4c171e52410a6 100644
>> --- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
>> +++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> [ ... ]
>
>> @@ -489,6 +489,17 @@ static int mc_probe(struct platform_device *pdev)
>>        if (!card->components)
>>                return -ENOMEM;
>>
>> +     if ((sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach->mach_params.dmic_num ||
>> +          amd_ctx->pdm_sel) && !ctx->ignore_internal_dmic) {
>> +             dmic_num = mach->mach_params.dmic_num ? mach->mach_params.dmic_num : 1;
>> +             card->components = devm_kasprintf(&pdev->dev, GFP_KERNEL,
>> +                                               "%s mic:acp-dmic cfg-mics:%d",
>> +                                               card->components,
>> +                                               dmic_num);
>> +             if (!card->components)
>> +                     return -ENOMEM;
>> +     }
> [Severity: Medium]
> If devm_kasprintf() fails here (as well as in the preceding allocation for
> cfg-amp), does returning -ENOMEM directly leak the SoundWire codec device
> references and software nodes initialized during sof_card_dai_links_create()?
>
> Earlier in sound/soc/amd/acp/acp-sdw-sof-mach.c:mc_probe(),
> sof_card_dai_links_create() invokes the endpoint .init callbacks via
> create_sdw_dailinks() -> create_sdw_dailink(), such as
> sound/soc/sdw_utils/soc_sdw_rt711.c:asoc_sdw_rt711_init():
>
>          sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
>          if (!sdw_dev)
>                  return -EPROBE_DEFER;
>
>          ret = rt711_add_codec_device_props(sdw_dev, ctx->mc_quirk);
>          if (ret < 0) {
>                  put_device(sdw_dev);
>                  return ret;
>          }
>          ctx->headset_codec_dev = sdw_dev;
>
> When devm_snd_soc_register_card() fails right below in mc_probe(), it cleans
> these up with asoc_sdw_mc_dailink_exit_loop(card):
>
>          ret = devm_snd_soc_register_card(&pdev->dev, card);
>          if (ret) {
>                  dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed %d\n", ret);
>                  asoc_sdw_mc_dailink_exit_loop(card);
>                  return ret;
>          }
>
> Should the devm_kasprintf() failure path also call
> asoc_sdw_mc_dailink_exit_loop(card) before returning -ENOMEM?
Thanks for catching this.  On a devm_kasprintf() failure, the -ENOMEM path
skips asoc_sdw_mc_dailink_exit_loop(card), leaving device
references acquired during sof_card_dai_links_create() unreleased.
This is a pre-existing issue, as the cfg-amp path immediately above has the
same missing cleanup. This change follows the existing pattern in the file.
We will address both the cfg-amp and DMIC error paths together in an
incremental patch.


>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261023065216.3473883-1-Vijendar.Mukunda@amd.com?part=7

