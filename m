Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792650505;
	b=UVdqxG70A05Mhk1gr2EdM862BekHTRVKsY0k6QD654AyKvAdbSD71Wh6+fkwxqVV6khL
	 yLbzSWwwmUXZKhKWT5hsEiE+lydcyx0OKHgf6mcQTOADO4RUvLHbeWCQ233jVFh0/mxNR
	 hQbMlKCnxoYCQdq9cesUOU9Vj1X3u3D56fXzgZ+qylqN61orhLfWbJbep9zGxMPnszhL8
	 HXa4wp8JRP5eO1l1XP1qAVUwAEGdKLQjIAl43unESsAdSw+SmdcwVyHG+6+hKO6FsNWwJ
	 z0VDHa/LbRkxjSIsVjgvQV+FQ5DeQv7r4byCHhN72q1E7lZ/nsdF/6vMqBHX7WKxE9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792650505;
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
	bh=gaM22IiUHDvc4gLoUHdyuRvrMuWQwlASeRcTtGJtyrQ=;
	b=A8MLansp89cUG/FTvvX6oIH+lZCL7Fyx8re5Gy0fJ1l3HJmgXECc4jo2/yaaSY029foR
	 kHy322FIpgVbg/icGXHvP+d1FbDOyqxmcX2e4oT3Kgj9EG82MxsLBRjqciK8tHi1cGF5w
	 2AkYBl/hW72eEWd5+HpqHgRDeJBsxBwGhFdEt1yZ5FBb66lPVjhXOZJhQkp1N72gozmjw
	 nHKquwLY2cMpZVIsUKDR/lMmqgYZCfCcxCBjbsmRH9WD8hqYHuT+5hjV82BSKQMrKEBKb
	 azZpu5CW06oiSEM1VuRVbOKlTiItemQDR7d873DhED6iS5On1qXpZ2uSE6fCdpkcXaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uLTGYqlR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.3
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012003.outbound.protection.outlook.com [40.107.200.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B59606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 06:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81B59606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uLTGYqlR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=em5W5lUCYKpywwt40t0BLVP73cnu4giKZPO30eNuO+Pn04FtiYUKlh/7esYwBQWklAwezLAS/macG35elL3l21VoGmwn7HL5SPglFXO+bAxU7TPzoaD2/O7VRMzScCyog8dnPFttfYyn6t/K06lc8Ixhc9ehW4efudeor37auvvSRvc/xXZIAGcVblVm68WnadP1grqjEpGy6TkhjhQ/OOlgv8Qd70AKEZtGHztHTXO/rqfcC52E0NWcV+Y96iCWnSu0TyNMuVC0LcWCCtzd6D5km/WoMa3zSoMr8JlF/41WHoqmVSO1uZKJMRGaTQ3c4TtYq3nkj+A4AUNsnenhbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaM22IiUHDvc4gLoUHdyuRvrMuWQwlASeRcTtGJtyrQ=;
 b=MuL/5i4YaFn1Qb/63VtLYyvVkweJ4ZPgpI8ZD+O+Q/BzvnIypJ6bMC6SsPIw9m73LezhqcIOmtJiQ0Z3wy+XdrSNLazBUsLDnPxwnRfQ5SzKxn5TFhAkNjZoVayDQvjD/C7qfjZOdNrgveV90qJ9DtN1Z83nwS1P0YZUwNp13tOK/A7e2DdrlJi3abyFe9WHQLWqAtZXmNJ9IxwmrcKlJ7WEX2gTn+dFCVHid/g95kedy5OePAVYmnZKSB9wyv3k3XGuyvvTUmr7GMY5TT41kZGqDY2H0FHR13Xe10mhVxHlKdBB66XvSQN/trDz5ZVZF3HuK2cbBO1i2EQ2C+f3qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaM22IiUHDvc4gLoUHdyuRvrMuWQwlASeRcTtGJtyrQ=;
 b=uLTGYqlR7TvGD0APNz/OSPssYDFwJuInzlWK0aUEwXU3FQ1IRSvYV+YwGhjTcy126wuXFwBjmUKv9eNZOWBXAeIZtdfCYn4up9P1svYFInoQ8YHaw33jCVSdJKWZs5P6wMxEH3zGNnFhPT4bUMCraMcIufYbOeEkEf+BwSzqig0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 MW4PR12MB6974.namprd12.prod.outlook.com (2603:10b6:303:207::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 22 Oct
 2026 06:26:45 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 06:26:44 +0000
Message-ID: <b2d46dc8-a1db-4f74-b228-39897cede600@amd.com>
Date: Thu, 22 Oct 2026 11:55:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 03/13] ASoC: amd: acp: fix PDM1 quirk and PDM
 controller selection for ACP7.B/7.F
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
References: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
 <20261022060724.1814741-4-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-181091@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-181091@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYP287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23d::15) To DS2PR12MB9567.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|MW4PR12MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0b07d5-ea4e-4529-b924-08df30057124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261009223327099003|56012099006|4143699003|11063799006|261009221727099003|261009223027099003|261009220027099003|261009221227099003|10067099003|22082099003|18002099003|6133799003|3023799007|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	lXNpTfPB7kDcvzzBXVODmBWnq0gPJmbA3vtHX8Y1nwGUG+B46EEmQTfKTIkSn+R0AyF8gvyUhLSY9T/lXHcB2e2IAgT5RLiIp+3o5Pwtp1ZdkM37wqi4C/Td882upuid1fNOsCp9oxCSIEhzz8NPNFZC4UFtsDNTffLS81ov41CY1M/rJmbkv9xUA73k418Gid9SL16o56TS6FwKqhBRe2D5EnEzoIZitLwqHToN1FWlWO9PA6lLfbFSZiklKLR7Jnbz3bFYAdC118hLIAu4VLJjsUl1ZZBZdIP5UBKC7ha27t63ZZKFGN8EFzq1i1KR86A9bZofSnvGNFIrMTkvzT3Dbhon7wox9RUZvkp8dy99pr/t/lfIjV7+KNoe2z2skoC36KaoOr6EhLZnYItrdXmev2/YFqC3Rn8v96vMPjLZz53kLBMFZOC2mN1hpsvGV7qBv/PWIvbN+XRDUCRDkeajd6ry0hmLRk0+7FG7o/yJlYt7ifv54P9swG162YB8vGPAnXu4+pQrZQYQpxxoNUfReBM6ggbLZWs4Jzn6dUPSRABsn046sCr5Gv7r7DlqvHpJCQpH3qw54kX1Glr+XTj1ar2nfVfwQoYi++Qi6To=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261009223327099003)(56012099006)(4143699003)(11063799006)(261009221727099003)(261009223027099003)(261009220027099003)(261009221227099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW9mR3cwUXRsSG83ajdiZmlDVDQrWWRuU2VnNlViYWpOT0M2U3ROakIyekxv?=
 =?utf-8?B?eUg0L2UwV2dYbFVqS29pSGRPZlUrUGlibW1aQjVEYlQ5T0ZZNEczQlJTd1JN?=
 =?utf-8?B?YlZSSW5OTUpaL01HamdFSXFCa05zV3dYVWUvKy9idjFJNElNUkxjSE01NzlO?=
 =?utf-8?B?aVNITUF1d1B2VEF5TE5VQ1hjd2k1YnVNdGRLczMxRHpvOE1mYzVXcXRoNkJ2?=
 =?utf-8?B?M3Uvdm5tZ1ZkbFNueVlvTUNBSlR3dFJSNEFQamQvREJlTmtOa1VJWVNMVVRp?=
 =?utf-8?B?YTBGYTlXblFTdWJMNklaWmQ4VmtTamFLSXVZSHoxRVVlTjQ0WnhDbkorcG0r?=
 =?utf-8?B?ckNNdUVtOFB1d0J0a2FhcVcwWkxSQjFlYmp2aFNRTTJEQUpIU3IzR05TV2k0?=
 =?utf-8?B?TkhJVExJblpKcWRPbGRQM1JpckVjand0Mll1cTF3dlJ0aFk0a25SR1E0SGpt?=
 =?utf-8?B?WEJMNG9kQW5VOTg5ODdKcms2KzZxdjFMZHZMUVk1SEhtYUp4VlVKMWp5Z1Bp?=
 =?utf-8?B?RFE2TVFSbGQrc1d1YjZham4zL1VxMUxBOEk2MzBCcUJDeTNTUnV1WDhnSnF1?=
 =?utf-8?B?dmFJMEJzcHQ2cGtIMWxnOTdFbXkwYUQ5T1V1MEluamNQTVBMOE5GdUx4QjMr?=
 =?utf-8?B?ekpIQWs5RWhzUTMxS1l0Q3FjSHZZaUpJS3dXeEtqTU13UkdQMGpYY3FmclB6?=
 =?utf-8?B?Wms3WkNZK3VCd1FrVFRIaXJBMWVKRFhnVUpHUmlKdmVNWDRibzdidEtWYWZ5?=
 =?utf-8?B?OGw3VVdpZ1U2cHhQV2FVZWJ0c3V1ZldjQlpSSGU2ek45MWNTSnNmcllyTzRB?=
 =?utf-8?B?SEsvaTFtZ1ExVFZpRlFMQVBWWExiNkxOYTcwaXpDODJjSi9JaVZkNkpYeGYr?=
 =?utf-8?B?NitPV3VsRFFJUERCSC9KQ1EwbkZIczZiUEJ4T1I2anpLZ3RwSUVmdm1SeXBV?=
 =?utf-8?B?R0U2Qk1rMXNIcFJZVVQwQmVTdm9yODdXT083ZzZQSElSaXFJSzZZT1E4WFFO?=
 =?utf-8?B?RjZkemdqRVppbkloZVQ4RWo0eElHRnNuMm0rdjFUR2phNUZMMjIyVzlsa0h1?=
 =?utf-8?B?Y042bkNmRkFNcERpdzNBZUswRlI5a056c2xQOTZxSEhMQmtuSFJ4MnBjV1Iv?=
 =?utf-8?B?MTBrdjBlQzFBbGdNaVZSZkZkdXc3MGtVaTNocndQSjVRNUJXM1kwTmNySzFH?=
 =?utf-8?B?N0JqWDQ0ZFg5SGZ3Q3ZNT05tL243RFU0QUdKTkZqQVFaR2IzMnhUNk90bGNs?=
 =?utf-8?B?R0xaN1Jhd2Y2cHBpampJcjFPYkx1Ky9VQnloZVR5SDVoK2tsK3RjVEI1eDFL?=
 =?utf-8?B?RVVFcGhCQy9TZlc5YlZlSnpVWGp2Nit6bnY2STJhQlMzUU9zZk44Zzh6eE5h?=
 =?utf-8?B?L25tbUs2eG1XSmV1ZWFGM01wTFFMTHM3SExKK0hoOUdZRmRsTWY5ZzRTT1dh?=
 =?utf-8?B?UXJGQS9HckwzSGtMU3pldW95dzB0Qk1tZDhFZVhiOG9YaHduTnBDdDNUQkxG?=
 =?utf-8?B?K3Z2SjkwbkVUdlNwOTlKc0tuRkJMeEVlbHBxaUs3VHZKWTNTTWF5d2gvZVNa?=
 =?utf-8?B?Z3RzMHRYSzlkbzBVZStOaUtpZHFFN2xXQU02REcwbVByc1NMbnhHU1Q3dnJU?=
 =?utf-8?B?bEtmZUVvbjZRSnpMTW9UMENtcXVNQ0RTZURnWFVGLzcvWk12czBUcmhrb0VF?=
 =?utf-8?B?Z3BMa01SVzNEdzdwWDBsSHF1UDY4SnFZaWF2RGY3ajlKd3JTWkFadUZwaWhJ?=
 =?utf-8?B?dDZvSmlkRTZVZThoK0RCRklrYVA2a3BmL3Y2b24xZG5rL1R0ZzcrZ3lFcHVZ?=
 =?utf-8?B?YTlRZ2FUTWlVc1h4MGxWa3FxTDVQbTJWdyt1bzlWWFQ4RHBReTY5TXFkTk5u?=
 =?utf-8?B?V2E0Uit1ZTMvNHU0cUFKZit4c1V3eW1lTTQvVFUvUFpSTVh1bjFVUEJiMUE2?=
 =?utf-8?B?eW0wK3V4cUJIVFFVNThPekxBWExmTzlSRFpEME13TTdqN000eUxUQ1A0Vmky?=
 =?utf-8?B?d1ZCeXdscnN1c1B5ZW80WjNlK0hwcUpVNkpUY1FRN3NhQmVLMXZlN2V6U254?=
 =?utf-8?B?Ymg3ZnE0SitwZmtuS2FpYXVVUWVQWUl3cVgvZHhWeXROcjR2MnV6SkZHemEy?=
 =?utf-8?B?S21WaVFBRS93MFBaTEVhNlJmYjR2QXBYNGxDTkdlMG5xTXdISnk4ZTdiME5v?=
 =?utf-8?B?ZGw3UEtLd1BBTWZkSU14MjAvUW0yVHM1WmE5dGlxNWdrREg0aXdGL0VOVXdo?=
 =?utf-8?B?dlB6em5JeGE3NHdQKzE1T0V6eVBxYnc4bHQvVTB0RW9SVkRBSzFKMkFCNWJ1?=
 =?utf-8?B?RG13cStzK3VQbUltNXdkZnl0OW1Bc05Rak1GMkhOclFwem1pZ0kxQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0b07d5-ea4e-4529-b924-08df30057124
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:26:44.4812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICLJe3ScA+ImiBiTk8pAc0sUmR21OvhuEqbZdfNp21GJI2Yh8BVkIRTr2UlJZ9OcLvQOVykxbOo+3aFtjkUEgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6974



On 10/22/26 11:53, sashiko-bot@kernel.org wrote:
> [You don't often get email from sashiko-bot@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] ASoC: amd: acp: commit message describes fixup instead of new PDM support
> --
>
> commit 1cff813ba92933eeaa9d776d31dbcd42c0513207
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> ASoC: amd: acp: fix PDM1 quirk and PDM controller selection for ACP7.B/7.F
>
> This commit adds ASOC_SDW_ACP_DMIC1 and pdm_sel support in
> sound/soc/amd/acp/acp-sdw-sof-mach.c to select between the "acp-sof-dmic0"
> and "acp-sof-dmic1" CPU DAIs on ACP7.B and ACP7.F platforms.
>
>>      ASoC: amd: acp: fix PDM1 quirk and PDM controller selection for ACP7.B/7.F
>>
>>      The ASOC_SDW_ACP_DMIC1 quirk was evaluated before dmi_check_system()
>>      and quirk_override were applied, so the pdm_sel fallback always saw
>>      the compile-time default and was effectively dead code. Move it to
>>      after the quirk is fully resolved and restrict it to ACP7B/7F revisions
>>      where PDM controller selection is meaningful.
>>
>>      Since ACP7.B/7.F exposes exactly one active PDM controller, use
>>      else if for the DMIC0 fallback: check ASOC_SDW_ACP_DMIC1 first; only
>>      fall back to ASOC_SDW_ACP_DMIC (DMIC0) when DMIC1 is not set.
>>
>>      Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> [Severity: Low]
> This isn't a bug in the code, but the commit subject and message describe
> moving an existing ASOC_SDW_ACP_DMIC1 check and fixing a pre-existing
> pdm_sel fallback.
>
> Looking at the patch, ASOC_SDW_ACP_DMIC1 and pdm_sel in struct amd_mc_ctx
> (in sound/soc/amd/acp/soc_amd_sdw_common.h), the mach->pdata extraction and
> quirk fallback in mc_probe() (in sound/soc/amd/acp/acp-sdw-sof-mach.c), and
> the ACP7B_PCI_REV / ACP7F_PCI_REV CPU DAI selection in
> create_dmic_dailinks() (in sound/soc/amd/acp/acp-sdw-sof-mach.c) are all
> newly introduced by this commit rather than moved from an earlier location.
>
> Was a fixup commit message retained when squashing an earlier revision, and
> should the commit subject and changelog be updated to describe adding new
> PDM controller selection support for ACP7.B/7.F?
will rephrase the commit message and push the v3 version.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261022060724.1814741-1-Vijendar.Mukunda@amd.com?part=3

