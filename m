Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637591F942
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 02:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994894; cv=fail; b=UjRphMfVyCgo46PWEPtE1cjQjOx3yWarBfCZ1sHZA0cAeLhzLlgcXN3l1MPvNpy2oQKQLaXOxKsyXuEurwvYQQlMDsPOCQoOZ7bVX1L/yHsThUmjzLK2IaeI2FRyrClIk14uAuI1n5xiUozeI50TDlGgzI1mT6UlFYS+JG5JfFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994894; c=relaxed/simple;
	bh=1q+BRrRNTq3aW12naT3Kj7I9Nl7Egv1ROkmPxAXvmBI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nSzTdnQ28E+ePD9B8r6A7ONx2+1K0YIPVIZclAPYRKo6cBllqcH5H+qazwLRWKSH830co5bZR9PzEurkwTjU2H9SJoeSU1cX7od7twfjeeudSz42nO3yGqcZNbbHRps+scX/9Sx/NckvD+NjkaLiHYUzNdupLtAKlbfgMwPNeNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=l8gOiqsG; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="l8gOiqsG"
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E1gBfA827833
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 02:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=7ssDj6ZPQ1b5T0SNWq3k9+lXvxTkN4MSA2IOGwqD62g=; b=l8gOiqsGEVyS
	mDS0VREowtNqw0k/bmCDFJ02wX6DASTNs/OxTOd8anr4q8TWGhVEjxg05/r3dK+f
	K/ejM5vb/lsHHE86qkY6d5cG/8gP6masNzQ7gkae/ZMsOQ7KoBLTHk9LD7CfZIwO
	ASd6mGoy3FuOuhNkMn5VZ92XLkF+/6dErkTzwkHhnOC13q882FInHrxY0Qodo8gk
	mDNA55gEBu1l33McdQ7RJvdvAJbFFgX+v3a7rBuD01b/HG66Yn3EQoLZtQk3r3xd
	il2RhmiT5PDMaIImfaSXFAQK9moCH+rDpsmEWBBsj2Aepe2M+zpSoqTosphFmgio
	KmILBSKohg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbct4ke95-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 02:08:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEYM3KslHt+SrWm2jdOjsyi4wMNGInYP/MaSK40GHA/S7birCvuGluIP7Qwn+MKzwtRhrto4lkgGcy3O5KeVDlpk3JqgkfMqF73zuz98N1PUXHnQDDNyq5viOoIEb4R/s13GsGHqx9qVlePYLm9avInXOFkgbqqJ8Slyjsruea2Kg7uMZcmNywNbhXseQzmE4e98Fmd7uO7E9uyYRo5nZijqxOHdC5W1iVPIV3Le5XQh+lOaB/fMyjUv53GvyQ4IvFNHBGiBTILyIatqfJDD0kd6o7lDbOafcjJRGXWJItsX+x7u1ICK8vOyOtCn972gOsR0EVnW44m61cEaBDNpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ssDj6ZPQ1b5T0SNWq3k9+lXvxTkN4MSA2IOGwqD62g=;
 b=CbuMmQcw+8LKwmKvfMlzUm7vTC4DE1bsbNkfZ3FHh4wZ0XuHXSlb7DrWNo9Pt0nH7Gd9O7BNXgQIDRCzxp9VTOvQVg6CeIBsXMiwtZwCNOedZaxqsO7jz1jJ/XVA+DpeQO7334YRDCR38J6aZgLkHMPcNa4/ndKZ853rMLROCftOmeN2N8LBP0aOQ+wqPrWqVoJwnXkGWydzL9+huYw3FqsE3L5057s9llV14ho6aaPxE4fTOnopRH0Eqm3TKXMW65ludkuOabAe5E2Kdm0ywfPnKmbLOGOZoVKuYDvXayJnSJob4/C4zEG/M8D79wFr2vRHGQW8PFXdT3BJNZa/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 14 Jul
 2026 02:08:08 +0000
Received: from DM4PR11MB8157.namprd11.prod.outlook.com
 ([fe80::c801:fbdd:4e88:e291]) by DM4PR11MB8157.namprd11.prod.outlook.com
 ([fe80::c801:fbdd:4e88:e291%4]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 02:08:08 +0000
Message-ID: <b090d46f-5270-4679-8e06-5769b8019c52@windriver.com>
Date: Tue, 14 Jul 2026 10:08:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: cm109 - fix URB double-submit due to missing open
 check
To: sashiko-reviews@lists.linux.dev
References: <20260709073133.373657-1-Xue.Lei@windriver.com>
 <20260709075108.CF6121F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Lei, Xue" <Xue.Lei@windriver.com>
In-Reply-To: <20260709075108.CF6121F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0086.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::16) To DM4PR11MB8157.namprd11.prod.outlook.com
 (2603:10b6:8:187::20)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8157:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3399b6-a2a5-4c06-61af-08dee14cbf8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|42112799006|1800799024|366016|6133799003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1nXegHi2unLK0JM+veR5JjDaXZa4NleAjtT4pKzKwfGdDsEDRefYcYjQcX9shnjoKfqAuRvz4LoS4+6Ygcw0X2er24UlieX/uvS0hKv1IeEOs2SSCKw96Sd3g3ArCPdfUXIVaUtrhS81ytEnbLiKUeD7dQGQqhjNfX/0oMAT20yGhGeSajsFy7+sOBPZBwgsG2zIXcJVPfuHCEyjEHk2DCorPcLLGQywlXZi3m18CbBJTnevBncDupoqbBA3H3zGwanFW6XDG9txHzXX2WAQJWRBJTOqsaC528jaOx20UmUrPtvSlzc0c7t//SQRyTle1TP7QWRB+s1MSCaoorYDVQGGQ/zoXnXgdKOU5ca4MJXZsDHpJLknTZcqI66AUfS+oPs1Y51annSEv/VpF6U1CNB0pacWBuFmkjBdAeEXM3HIYcoijB589f+GkWq4Y88Yk4eOEs10nk4HGVRtqk8Hc0RmFYgZWPtirCGmiOik0mE50OGiKwgpt6dj5fSoMLELm7odjkR1iOaJVMuPoMaXqOZCedLSksJKd3/VWycO7ORYSIhkp+5iGXVfKpS30anpUsg8W4mehOAjuGQlee41vnwCxpdI0c0zJFKf7DEK/mA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB8157.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(42112799006)(1800799024)(366016)(6133799003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2dTY0VlVkJpWGpFWERCTkdueEE2NkZBeEJRQWRBbTQ3VGRJQ002dmp4aGZZ?=
 =?utf-8?B?NzRlamxkZ0Uwb0w2UXp6VXZua2dUc0xGNWpDcDRVdk90N1pNZ2hLVEwrMktV?=
 =?utf-8?B?MloyQVF1b1F3T01VTC9NZ3FVQ3h0STZQeWJiRVI4VG1IR0FDV0d1cWV4M1Jl?=
 =?utf-8?B?STVmV3VoSUxkd1I4c0p4emxkVFBvdFE4cFRDZ3hFeEM3RTVqZGNqSzlDbDZu?=
 =?utf-8?B?ZUlBWkY5QVNtOEEzYndzUDVTMVBNVjFqejU3cXdzSFR1WS85VDg4ZDVjaDFY?=
 =?utf-8?B?WnBOZGF1bjVjL1k4VUpsT2RXWlUxN3pGNmV1cGVIOVJFSEVuVDA4NnNEOFBT?=
 =?utf-8?B?NGxBaVN6emloMUs3ZFRpK0VCYmZHTFRUSzBaOHE3Y1ZHUGFDTWF4VHlxRWlw?=
 =?utf-8?B?T3lvWnNPWjgyNm92THhKYW50aGJqSGNoUHlUWEdCNlVYSlpUTTJkWklHWUFM?=
 =?utf-8?B?OWdoMkZJNG85N3FNOUtscVhLN0lkUzJRVGFVcmZiMndWZGQ5bGdjS2I2dDc1?=
 =?utf-8?B?SGhsWkh1RzVZT0VoNXFjeGN1NXJvOTBiSHVYM0VKWE1MOXJWbFYzeldNK0tV?=
 =?utf-8?B?aGY5L1dud09YVDdINXlBMjA5SHJodkd3aXhVbTR0UWJkS0F2cHE4TDhHbjJv?=
 =?utf-8?B?b09lMXZTOTlQWEpUQnpPQnJHbjRqQ3NVdWdHUyszMXZSdk5ZcjJiUEx6NktK?=
 =?utf-8?B?UTVQYWEzREJleXlkNUNrSTF6Ym9Teis5aTY3V3dERmUzWU55YWZoRm9VT1Jm?=
 =?utf-8?B?MktKOXd1L1FtVjRaQy9ubCtRRzY1TEdJVEV1SkZTZGJvQldkWEljY3E3Y1l4?=
 =?utf-8?B?OFNxcjQyUmpabkFrK3hZTE4rczJ5T2pmZjhSVnlDTTRzajI5cEdlZk1IK3Er?=
 =?utf-8?B?eTBhbHFWTVI0YTR0MTJFU0dUam9VQzBQV21ObUpXakhqdm5mNHNNaHBmalRM?=
 =?utf-8?B?T1hMUWg2d2ZTMHF1OUh0QlQvTTJSak9oZzBKT2tZUG9uM216RXo3TmhGUlRh?=
 =?utf-8?B?cDk2OHgzRWx4Z3Y1NlBIdjh3UjMwTW8wSng5MzAxNGpaS2krVmdVemtBU0l4?=
 =?utf-8?B?S3p1ZElJei9QV24weE1KbkFnWkRKU1F2VXhhbkVFclBHUFpWZmk5VDFISVFt?=
 =?utf-8?B?bUtyNHdXci96RWtBcS8xOW5pMWE3WFQxTkpnYTNqUG9WTm5vakJGLzVxbWt1?=
 =?utf-8?B?RmFMQWk3Ymk3eEpxcWE4WWdObFQzZFhhNTA2cDRhRkRKZ3J6dVpGVWorSzRS?=
 =?utf-8?B?RVNaQW1TdWM2cFdTVm5QMUNSVjNBSVljZFJaNVNHalZOeTlaeC9FOXdoR2xJ?=
 =?utf-8?B?dlhoWjkwZkFOQmhTTHdtY2FlZWRodG1qTVJ3ZTM5UkFxQW9qTVhqOUY0aFQ5?=
 =?utf-8?B?Mml3T1V1dXFjekxVcFpVanR5aFdDREVmM0UwWExERjA2aWhBQ2VKUUNJb3Nm?=
 =?utf-8?B?cjlzUGVqYThNZXhlNGdjdFordEpEcHBIQXBDYm03U1lZNDRUY0lQOHNUbTBl?=
 =?utf-8?B?elJHWmhWWWhCTjc5QjdvcHNwbUYyL201YWcxK09hcEc1SU01anFEY3NGOHFa?=
 =?utf-8?B?UCtvMVkrM1lMMnM1cnk1UGxlTlI2Tm1RaEFkWXZyVXFJd0xBUTlpTzVCNzg4?=
 =?utf-8?B?aVFVajk4Q292V1NaNmwwaC9GU0dUMDRtWkVvMXVXQmdNQVNDSUhDdUIwMlNu?=
 =?utf-8?B?bWhGdUdkeEtIY01FeTk3ZUVjeDI5OU9hTzNZTm5yUjh4VXl1NlNqRFoxcjBr?=
 =?utf-8?B?dGx6bkhuTjNqNW9vU3lHZytIay9qUW5KeGFlTjEvL1lMUGsyWTc1OTc1anQ0?=
 =?utf-8?B?VHptVGFXWXVQZlh0SER0c3dVTU55UjZiWGZhVmxzam1kRGtMYk85WUxDQWt4?=
 =?utf-8?B?WFF2VUtITTcrM3RzNjQvdnNwRnB4Ym9MK3I4MnBtY1ZhRUlXWGVXSUo4Ykxp?=
 =?utf-8?B?dnM5c085N0tVRi9LRXJtaUpWWE51a3VXK3RtSXRoZytLMTVqN29KWVl1N2pI?=
 =?utf-8?B?L2kya1VUUDQ1cVZYSTZ4MUh3ZVlxemx2R0hBM0dJU1dWSlV2NHpBMm55TUh0?=
 =?utf-8?B?RkZGZTd1eTNaZlBwV2habjZkSU9ENGVBS2h4a0Y3bXR0OTlCZVlCRzBZUWVQ?=
 =?utf-8?B?aU5rN2NNdmZxUmFoWTl2K0tjeUdIRmhjeGhnNUV0RC90NVQ3MFRJVFZodXJY?=
 =?utf-8?B?YVF4TFNRRENYY2VWVlVSUDdYUEExU1dhcnZ1S29zUWk5bGp0d3cvRVZuLzhn?=
 =?utf-8?B?VW9Pa2ZkQjVJZjF0RXAvUEJobGErczIxVEFqYitnTW9vV0VBNVNidlMxSjRR?=
 =?utf-8?B?NDZSV3pGTHRvYTJqaEtMbUJURlo2U3ZWQTlTQTV6M3BSSWVoMUh0Zz09?=
X-Exchange-RoutingPolicyChecked:
	aRjJHZ5LW36nxiYFBWMnbAuYUUnhqEnQEYmU6Vn7GE8MU38vc3iVpRQM8HW2PK3beYaUhFfRBLxwBPGor4vGDHYUTT/fYzTZk9NYrPjfaKFw26yvdryNef8i3KuLsz2zvTCQut5wv/aZFCiA6zYYftkhiPzT+VcvzoHmM6AxkP7H/wdRX2tGfcq7rjux+pC253mB9HDZ9tE1SWoRtxSV0fg4oXj6rhzky3017YCI25veyz1BEx4MjOpPqRzpho8/DffWGC5GYqjQhfZ3/9N+EseRtMmMrtnk8ddOWwSIjr5l9q5WDltdUvZX5WTS8mvyIHvOWl0DkCylo8KqbdbR0Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3399b6-a2a5-4c06-61af-08dee14cbf8e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 02:08:08.3860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhRI2weTnKlVPlVB6dopFLOOsBiDvRSZUrdODtlphcPd6hrScs2YR6QOKmfmMO7u/5v6HCXdn5Iz0GErh1EFkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
X-Authority-Analysis: v=2.4 cv=J9CaKgnS c=1 sm=1 tr=0 ts=6a559a0b cx=c_pps
 a=EZwmcie8zcfNvCQIxZ7BwQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=edf1wS77AAAA:8 a=c92rfblmAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8
 a=i-17Fur-fBwPJ7rp4msA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=DcSpbTIhAlouE1Uv7lRv:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAxOCBTYWx0ZWRfX2BIpXHRUWcyl
 /5CMouweRo5eF10QeZ91xlBaosP9cpnH/ZBLfi03rMya8UWrs81yj3ztukmW0VBhO4vndRQzknz
 NT0qZb9tDhNtk3PYgWT3fAKG2mp8TkykGu0KJjCXWWiEzeY6txGe
X-Proofpoint-ORIG-GUID: zQQFI2kwYLKjkfI9vcwG-hF_htPG13e4
X-Proofpoint-GUID: zQQFI2kwYLKjkfI9vcwG-hF_htPG13e4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAxOCBTYWx0ZWRfXzgRv5wlkutt0
 GlwddDyjdgZ9nnWuhWAB6cvetyfFgR77A+TEMBRSX0r7I89DBaIzZqFbRu/Hjkxx/oDYeN7nXng
 k4W9579JI1Q8zv2pRC+Y1lhDaUQK16mnAXig9oH3YRqWwrRW61zAVn7dgOHy52nhX8qdwgCFwdv
 4asdC5BQjA5b7Q+QGifxoTUdgTdq37OvpSexoDg+XP0PezpBk0ZzKMWJ9dtt8299QRG0idvcGri
 PBLFpjD8tiRMqBq4JozvBYAMrW7OnDndESS1I6kyJGiRrnT9AavGyj2ybK2u30dH0JyJI1Au+VY
 njV0sa1smb2rA8ZpL8WEvtHTobelzbwWF22+ZQFoS2saPlUk4hXSk3dFz0IXNA+Xzaz713vqbw1
 FE7pxghlEkhPyZVtKBTYAt+lCVQs9Sy5HhE3ihDbwt5AqBgU96mvzqu+FI+zhKLwiz3EZTq/qV/
 7mWzuN7DQK3cwA3v3mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140018

#syz test: 
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


On 7/9/26 15:51, sashiko-bot@kernel.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] TOCTOU Race leading to Use-After-Free during device disconnect
> - [High] State Machine Stall due to unhandled URB submission failure
> - [High] DMA API Violation from passing coherent buffer to streaming DMA mapping
> --
>
> --- Patch [1]: [PATCH] Input: cm109 - fix URB double-submit due to missing open check ---
> commit 8242b0347566c678c3b0f2e9b93934d136b010bb
> Author: Xue Lei <Xue.Lei@windriver.com>
>
> Input: cm109 - fix URB double-submit due to missing open check
>
> This commit adds a dev->open check in cm109_input_ev() to reject input
> events when the device is not fully initialized, preventing a double-submit
> of urb_ctl.
>
> Closes: https://syzkaller.appspot.com/bug?extid=e69c25cf38a53d0cf64c
>
>> diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
>> index 353d3c1d347d5..558cb73d5c6df 100644
>> --- a/drivers/input/misc/cm109.c
>> +++ b/drivers/input/misc/cm109.c
>> @@ -601,6 +601,9 @@ static int cm109_input_ev(struct input_dev *idev, unsigned int type,
>>   {
>>        struct cm109_dev *dev = input_get_drvdata(idev);
>>
>> +     if (!dev->open)
>> +             return -ENODEV;
>> +
> [Severity: High]
> This is a pre-existing issue, but does this lockless check introduce a TOCTOU
> race during device disconnect?
>
> Looking at cm109_input_close(), dev->open is cleared after traffic is
> stopped:
>
> cm109_input_close()
>      cm109_stop_traffic(dev);
>      dev->open = 0;
>
> If a concurrent event injection happens simultaneously, couldn't
> cm109_input_ev() see dev->open == 1 just before cm109_input_close() sets
> it to 0?
>
> Since cm109_usb_cleanup() frees the dev structure without explicitly calling
> usb_kill_urb(), could this allow an asynchronously submitted URB to complete
> and access the freed dev structure?
>
>>        dev_dbg(&dev->intf->dev,
>>                "input_ev: type=%u code=%u value=%d\n", type, code, value);
>>
> [Severity: High]
> This is a pre-existing issue, but can the URB submission loop stall
> permanently on failure?
>
> Looking at cm109_submit_buzz_toggle(), if usb_submit_urb() fails due to
> memory pressure or bus errors, it logs the error but does not clear
> dev->ctl_urb_pending:
>
> cm109_submit_buzz_toggle()
>      error = usb_submit_urb(dev->urb_ctl, GFP_ATOMIC);
>      if (error)
>          dev_err(&dev->intf->dev, ...);
>
> If ctl_urb_pending remains 1, wouldn't subsequent calls to
> cm109_toggle_buzzer_async() always take this path:
>
> cm109_toggle_buzzer_async()
>      if (dev->ctl_urb_pending) {
>          dev->buzzer_pending = 1;
>          return;
>      }
>
> Since the URB was never actually submitted, its completion callback won't
> run to submit urb_irq, meaning the device would permanently stop receiving
> input events and buzzer updates until re-plugged?
>
> [Severity: High]
> This is a pre-existing issue, but does the synchronous buzzer toggle violate
> DMA mapping rules?
>
> In cm109_usb_probe(), dev->ctl_data is allocated using usb_alloc_coherent().
> Later, cm109_toggle_buzzer_sync() passes this coherent buffer directly to
> usb_control_msg():
>
> cm109_toggle_buzzer_sync()
>      error = usb_control_msg(dev->udev,
>                              usb_sndctrlpipe(dev->udev, 0),
>                              ...
>                              dev->ctl_data,
>                              USB_PKT_LEN, USB_CTRL_SET_TIMEOUT);
>
> Since usb_control_msg() uses streaming DMA mapping via dma_map_single()
> without the URB_NO_TRANSFER_DMA_MAP flag, could passing a buffer allocated
> with a coherent API trigger mapping errors on architectures with
> CONFIG_DMA_API_DEBUG enabled?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260709073133.373657-1-Xue.Lei@windriver.com?part=1
