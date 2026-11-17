Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794910855;
	b=Xh4Cg3C+Lbh6DuDIx8Ukkhih6TTXfHLjj77VyW7Wx8TfqMQflExFZ8hfb230aIvqafXi
	 dxE45PjnXv74GXd8+JLmZJIGwO0UvagS2y2dARmBzK3KIo5/zPwK3YXK/nt2ravRYtGl+
	 +lUpxgoDGHfvBbXxtPRQqEqoyf2v0+KryhKeuPC7a+uz/ePXs5dzU3waIf55/6yVYImCH
	 nH4GlVOjQAFa/wcSv92lVXFNjLimONgry6vNrVZsTSuynKDVtZ2nemzHEreS9P75FakBZ
	 YkP27AySbzgF0ufcXf4WxSSis2Z/kxFKBIjwbjmrCAUE+PQvOLw1Pbr+zahxKy72toA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910855;
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
	bh=J94iqU6qKjMnyZAprNjmNDAQ9qjTz5XSmZ0QBFbCW2U=;
	b=MttORR33G9/5p3+OjsGRZtnKaZS3TH52k9dZD4v8Uz+cNEN6LKwZhquikQ9Pr8VBSRF9
	 hNZdC2zN8rjnxmKzT9TjLNVJGaP+CuoKv36AmG/RKO70Z3eEdmu3jPRze9kuk/kfclMSU
	 FeriYid2a9rW6POyxVBHmyY96kY8RMDAur5uO7KmZsw9c0eGlqIVR9SmA4OuFnj/GIF7c
	 POBTVkgjIhicMImov7CRnjoE8CnfoTBMk9Yfc0cYmNEgf3EKzNvFZrsXUGQDKdtiQqjm+
	 xCzRijej9KOJX9JwgaR7Gr4Gndlygzp6o1nzja9eHg2WqxYfk0ci9MAyHBJ8qOLd41w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vx68QpcP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.64
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010064.outbound.protection.outlook.com [40.93.198.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730F2606A32A
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 10:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 730F2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vx68QpcP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gO4PWLIQXQZMdmwKRFZOGr5t0E8Hyes8/+huDOInPmU7AuOFUhBsliFv2czH3DMIgHeCrbPNoXZkYU5vaA4O2jcw5sufUWQ0T+4qm5LIuoKlOtc1FcnU5/SDqokh6zUGj4IS3PBJvKzjry+ApfT2xhYikDCDbD+NY8nufkNJbNTN4cHpZDQ43ScPjT4oIHdmh1sLixsmRe5acjerpN8jxLHi/uvdQXm3rSiZJfRFlDNyk1C4A+Z2+jZ+fCBtEjcpL0lwA/SMJTmaJNTzMn4M4eU2lnphYJlNRweVi1stQPAPKmrnhLFz3lI6Y1uZeazQQt8/Cfint5Ms0ZTotD3oOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J94iqU6qKjMnyZAprNjmNDAQ9qjTz5XSmZ0QBFbCW2U=;
 b=DvtWjuXHsz/K4GGt2Mzv+YOKeV9/QVxS6bUivDVEf0XTpiUWU2Y21OmVJon2VQpXaUhSRBUdfuLFD77madpJ045Cq5fg/2po7VNhywFI5AgTouxZvzRxWFe4asAwYmzwgDM5CNjZ9B7zvz+KI8gxbcqHuEA0O3URx/05H/biiINoCfiWSwNK7pfKnXjRn/PCj8XrBowWM+zSZYuLyVxWR5C617LrNuH3t7qpubPoy3vTyuRXExvGI1yO2VEXMcuFo+vEz2qqB/IDCgg5kbC+RDn2IVUCgRyeNCx8VtvkrNV1Q0gh6boSgLcCyJQpeiKeej7pT+SqsNHtWN2O/aAW6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J94iqU6qKjMnyZAprNjmNDAQ9qjTz5XSmZ0QBFbCW2U=;
 b=vx68QpcPdIFpO3FLMtewSEj7LBS+QfhLXc9zJbOiL3vhMwpTQ7ihnH1NfRgv6EFCKPIHh+rzkMvFtDQyfwi0pTGN69py39wGhEzWgZaMBbiCZ0+yjoThqN+V1Wp2trIw3E04dNaoRWLRaFCNw1iRizey889NEmrFiDYPjOj5m1U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by DM3PR12MB9390.namprd12.prod.outlook.com (2603:10b6:0:42::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 10:20:51 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 10:20:51 +0000
Message-ID: <bc566630-fa85-4ecb-b7e6-31d5096f68ff@amd.com>
Date: Tue, 17 Nov 2026 15:53:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/23] soundwire: amd: use interrupt_enabled flag to
 guard IRQ work scheduling
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
 <20261117070906.803139-16-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-218362@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-218362@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0128.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::18) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|DM3PR12MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb3e4ed-7b70-429c-9934-08df44947459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|11063799006|4143699003|261021121427099003|261022113327099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261021123027099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	1Huben/nJlPIoV4pGVMoRpysrYiTTpzKJZ74GKKFdBMIEJElYq9fHi9cWQuxJ+PNgWRryh4Pb3UzQvrkJnZc49/xFJscOZJ2T2u9naV6e2p1v26AAlZ5ot/iS1DzNTPrtsOBYhkrc1S6/exwH6d0fwmH/7Uwceru+CzOsMX+avNAZQBIocld8RuZy0zm8X+/9P+8ksBYHH2aa8IyXUOOG/HsybOLECrG7Z/TQTiPV2UnwxsKXK4DV+TvWgZP2SStGmH1tO8YyrKSnriI3vEBhxgJ8JZZHL1JrqwKFMsvOIrztgIsDNWjMQdBJ1FCUjv53Hre7nQFx9ijvqN/7Q8k8eYia3ntUTLkBTRAfDHudLtX0W7iitd6JcTaISVDv4b7iM6Zz9a/1K7RVlbqa8Z/5l/syeVKLRjHEYVsQO57/HyViIk2F/2WAJIVPBehrum0p6NwqWUFPJ/ylfwH9ezt3IXWKKaLZMe2TP5WS3V0l1pVxXorvq9DjivlDl5ZxddrqOSIN9T4z3Ei52R64ZmRRl9PzP5APWEQpAW1+3ktQKXXKjHP+qa6eadkr7KrCFGsPyBTTS4Y+LSuwVbMAGIn7GiviflPrrkDDEWzTD62+RSthWhJQck7/Rs1RBt/aHLs/nOPUr9ZU+TwTJZZu+COxs9eB0OZisfZKcZB+HnnnWI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(261022113327099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261021123027099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1VGUEp0U1lvVFVNVzJ4bSs2Q1FTOHAzUzVMODhaM1hHYkp6QVFCVUFKdjl0?=
 =?utf-8?B?cHkvaUl4b0ZpUlI0SW5vWVdna2diZTFCczlRdFA1akV1UWNNY2Z0OFF0aXd1?=
 =?utf-8?B?clNzUTRhWHFiblF1eVVDSDVFWi9qRUtCUEZXTXdtcERTZm5lOGIwMFh3VG1m?=
 =?utf-8?B?c1FOWDRmdDZzamR1WjMxQTRrMjV2VHBKdU1yVnBHWHhCTkhSUmwzZFVrTjdM?=
 =?utf-8?B?b2ZCTmwrb0didTVZV1kxVG12R01oSWcyMGkvNEhsSUx1R001elYzdHpRYlgx?=
 =?utf-8?B?eTJUNnBDSndSUWVDcXpUZ1Y4TWRERmFPRlc4OTdmMktWNU5vY3JYTVF5eGlk?=
 =?utf-8?B?Ylc1aHZVZ242akNJS3VRdWE4UC9MSURvcy8vTndwWmRqNUhxRmlCNGdFL21V?=
 =?utf-8?B?Z2hCV0w2d2RiZ1BLMkNUSWxXd3FuY3pZaDYvZ0VuSkNMVlpSbVJ4MGdpdjdk?=
 =?utf-8?B?RVgyWDFxU2VuWE81ajEvNmhsRDFnTzZncmVJRGVCemxIY0RXYkw1VWlqWGRQ?=
 =?utf-8?B?UkZlcnFUVDVqVENrWUQ4QVA1VmxEMGVOSFJsVi9sZWNaNjkvMU5vb2ZObVBj?=
 =?utf-8?B?QkErMHU0R0dBTXpXY0hOWXE4cFRYV2tUS2p1YVBkdk9PYU9XSXk3RkRwc2pL?=
 =?utf-8?B?ZEdvRld4amNmeHI0UnZmTHhhYkpKbGZUa3lTVnkxKzRORDRmRjM4aXQvZmFX?=
 =?utf-8?B?MTU0UGxiNjJBa1h0SzNac1hDSjFtZ3dVZEw1K3k2N2NhL3p5UmRsemw4MzEv?=
 =?utf-8?B?VHFrQUF0Y1RYbmlZd0NzY0gyWFU1TUhWN2ZOcitOWFhNLzNzN2JJZFV6RFJG?=
 =?utf-8?B?UmZlbHN3cVBMUHhlTEhKSTZueWRIVjJZZGdOQjRIbllPcTJSNGUyT0wwcFV5?=
 =?utf-8?B?S3ZENHQ0YXZkMUZsNjVHNWllUzVoYTRKTzVJVjNOTzI3UkthTlg4VGhCMUxa?=
 =?utf-8?B?aHJMejJOMWp3UTNKbnZxbDNhSVhiZFpYZkVSQjZhSEhLTHExMXFPTkxXeGhj?=
 =?utf-8?B?aUNjWHJ0b05URzVscGRJU0hZUGl1MDI0ZHpDVnU4NVZDcGI2Q2FNWWE4UWw5?=
 =?utf-8?B?OUpkTDNuQlN2K3lVSUd5U3llbFhMNUVRRTAycElmRmNQM21xM1Zwek0rcDlk?=
 =?utf-8?B?V0dBQUFuZHlJbjFXSCtwNjYranROSU4zWE5rMGQwcVBjVCswT1JBbzYzRkZ4?=
 =?utf-8?B?VTFHblJENHhtZXg4dGY1bHJRM0JZQXVQd2VnWTZGTUJBakt6MjlRbTR6ZXRI?=
 =?utf-8?B?WG5FeDliN25IbGtHcXU3WGFlcFNMMHROckU2NDRHTjBoVGVDdlhCTTRsaDR0?=
 =?utf-8?B?RVJBaG5JaVZjOFNTMlRCLy81SFlQU0g0VTVkODJ5bVR2c21tUVR3UHR1MTlz?=
 =?utf-8?B?M0l3SERNVXppdW5CanlZcldiZURlZVhjdjNPanV5L0lsMUR4ZkoreFkydW9P?=
 =?utf-8?B?bURsdFFvbGRLMXZBMEI5d0Z3VWJkTnlVSCs3aUx5dlBjZUtZKytpT3JabHAy?=
 =?utf-8?B?NFRXTHk0bU51QXNxdExsWmhQK05sVGFWeG9VVkxJaDJaMUl4akZEdmp5OUpU?=
 =?utf-8?B?ODZBMUZBb3Q5akg1OXpOQTNGdXVKazVveWVqWTNnZXYxMndmVTNtc1dYWVI3?=
 =?utf-8?B?azJOekJVQlZzck4rNW94L0ROVlJHZUpocEtnclI3NnhqYjllUkpRL1VqWFc1?=
 =?utf-8?B?RjUrdHY1NTl0b3VteW82TjR5bkJNN3NNdS83ekkwc3I5QlRTK1RXQ0dKSlFC?=
 =?utf-8?B?Mkd4S1g5cTVhc3pTOHVsaXpTU05ld3pHbHFkajJjOVh1SXVGVVRFZllqU2Fm?=
 =?utf-8?B?cmhLaWpBa3YzZUp3SWFnajhaOHE2Y2VPTTJZOUQ0MmJUdUJPaTN3a1E4b2po?=
 =?utf-8?B?Uzh6cWFUYmY0c2IwR2RsdkF2dVEyMFJZRyt1M0xhTStJZDdndk1NOGpiQXE3?=
 =?utf-8?B?S0FJUHdxNVlaaWhhbTIrci81WnZiOTNvNTJJekF1VkpiN0hDVnVFQTNHdzda?=
 =?utf-8?B?RzZtWCtVdnliVkhDT0lGQk9DTnBmeHVpSUlMYXh0dmVQRHVKVlZibHhkeUVq?=
 =?utf-8?B?d3lIaVEvWkw2T3JQekEyLzdWYU9NVWI4cFJodEx1L1I5bzkxMm10TGxQdjZo?=
 =?utf-8?B?NjUvbjlxQ3NZaGRuYmtHckpBNzgzMUhpc3NaMHdEemFDMmVrT2VueHZqdUY3?=
 =?utf-8?B?OFlOSnRVUStJWGhYdzRma2RINUR2Z3VRRjNKY2h0bUlxQ3gvTGF3VUw2SC8x?=
 =?utf-8?B?K0NjQ1g1Q1gvQUZ0TFVQeURxQzZXQ2dWY2lQNXcyWEV5Zk1mQXh6ZWNlUXhz?=
 =?utf-8?B?MzJhdzQ3ZUliQzlOWEQvTkczMGdPUGVvYVhscmR3dzI4bEl3bU9Ndz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb3e4ed-7b70-429c-9934-08df44947459
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 10:20:51.1177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMn2sBKWgA6B5F6cmFce1RySNgffxd+cNPdGwi+jaflZxjbjWTmPFdEvHO0uu6n7dawp/mtpYznUcem+RwHjJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9390

On 17/11/26 13:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] soundwire: amd: race with in-flight IRQ queuing
>   amd_sdw_irq_thread
> - [Medium] soundwire: amd: race re-enabling IRQ masks in
>   amd_disable_sdw_interrupts()
> --
>
> commit 14261a7c7d9c5975a602a89ef71b261091c3414b
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: use interrupt_enabled flag to guard IRQ work scheduling
>
> This commit adds an interrupt_enabled flag to struct amd_sdw_manager to
> prevent queued amd_sdw_irq_thread work items from running after interrupts
> are disabled.
No changes required; both concerns are addressed within this series.
Details inline.
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index f3e9614b9ac82..5536a4fd137aa 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
> [ ... ]
>> @@ -135,6 +136,18 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
>>  {
>>  	u32 irq_mask;
>>  
>> +	/*
>> +	 * Clear the flag before updating hardware masks. Work items already
>> +	 * queued but not yet started will see the flag false at entry and
>> +	 * return early; work items already running will complete their current
>> +	 * invocation. Callers that need to ensure no instance of
>> +	 * amd_sdw_irq_thread() is executing on return must follow this call
>> +	 * with cancel_work_sync(&amd_manager->amd_sdw_irq_thread). Once the
>> +	 * mask registers are written, the ACP hardware will not assert any new
>> +	 * SDW interrupt.
>> +	 */
>> +	WRITE_ONCE(amd_manager->interrupt_enabled, false);
>> +
>>  	mutex_lock(amd_manager->acp_sdw_lock);
>>  	irq_mask = sdw_manager_reg_mask_array[amd_manager->instance];
>>  	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance),
> [Severity: Medium]
> Can an in-flight parent PCI IRQ handler still queue amd_sdw_irq_thread after
> amd_disable_sdw_interrupts() and cancel_work_sync() have returned?
>
> The parent PCI hard IRQ handlers (such as acp63_irq_handler() in
> sound/soc/amd/ps/pci-ps.c and acp_irq_handler() in sound/soc/sof/amd/acp.c)
> call schedule_work(&amd_manager->amd_sdw_irq_thread) without synchronizing
> with amd_disable_sdw_interrupts():
>
> sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
>     ...
> 		if (adata->sdw) {
> 			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> 			if (amd_manager)
> 				schedule_work(&amd_manager->amd_sdw_irq_thread);
> 		}
>     ...
> }
>
> If the interrupt fires just before ACP_EXTERNAL_INTR_CNTL is masked, the hard
> IRQ handler on another CPU can schedule the work after cancel_work_sync()
> completes:
>
> CPU0                                  CPU1 (<hardirq>)
> amd_sdw_manager_remove()              acp63_irq_handler()
>   amd_disable_sdw_interrupts()
>     interrupt_enabled = false
>     mask ACP_EXTERNAL_INTR_CNTL
>   cancel_work_sync(
>     &amd_manager->amd_sdw_irq_thread)
>                                         schedule_work(
>                                           &amd_manager->amd_sdw_irq_thread)
>   devres frees amd_manager
>                                       amd_sdw_irq_thread()
>                                         READ_ONCE(
>                                           amd_manager->interrupt_enabled)
>                                           <-- use-after-free

amd_disable_sdw_interrupts() clears ACP_EXTERNAL_INTR_CNTL before
returning, so after it completes no new SoundWire IRQ can be delivered
to the parent handler. The race window is therefore limited to IRQs
that fired before the hardware mask was written, whose handler is
still executing on CPU1 at the time cancel_work_sync() completes on
CPU0.

For this to trigger, the parent PCI hard IRQ handler would need to
remain live from before the ACP_EXTERNAL_INTR_CNTL write until after
both cancel_work_sync() calls complete on CPU0. Hard IRQ handlers run
to completion without sleeping; that window is not realistically
long enough for both cancel_work_sync() calls and the subsequent
devres cleanup to complete on CPU0 while CPU1 is still inside the
hard IRQ handler.

Should such a re-scheduling occur during the narrow window, the
interrupt_enabled guard added by this patch ensures amd_sdw_irq_thread
returns immediately at READ_ONCE(interrupt_enabled) without accessing
any hardware registers, preventing the hardware-access UAF.

> During amd_suspend() (in AMD_SDW_CLK_STOP_MODE) and amd_suspend_runtime()
> (in AMD_SDW_CLK_STOP_MODE or ACP6.3 AMD_SDW_POWER_OFF_MODE), interrupt_enabled
> is set back to true before suspend finishes, so a work item queued by an
> in-flight hard IRQ handler after cancel_work_sync() sees
> interrupt_enabled == true and accesses SoundWire MMIO registers while the
> manager is clock-stopped or powered down.
Patch 20 later in this series ("soundwire: amd: fix interrupt gate and
work drain ordering in PM ops") addresses this. It moves
amd_disable_sdw_interrupts() to the head of every suspend branch, then
drains amd_sdw_irq_thread and amd_sdw_work before proceeding to clock
stop. interrupt_enabled is set back to true only after clock stop
completes in CLK_STOP_MODE, by which point the drains have completed
and no work item is running. In POWER_OFF_MODE interrupt_enabled is
not restored, as wake delivery is handled through a separate path.
>
> Using disable_work_sync(&amd_manager->amd_sdw_irq_thread) when disabling
> interrupts and enable_work() when re-enabling them (or synchronizing with the
> parent IRQ) would prevent late scheduling.
>
> [ ... ]
>
>> @@ -1481,6 +1497,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
>>  				return ret;
>>  		} else if ((amd_manager->acp_rev == ACP63_PCI_REV_ID) &&
>>  			   amd_manager->wake_en_mask) {
>> +			WRITE_ONCE(amd_manager->interrupt_enabled, true);
>>  			mutex_lock(amd_manager->acp_sdw_lock);
>>  			val = sdw_manager_reg_mask_array[amd_manager->instance];
>>  			amd_updatel(amd_manager->acp_mmio,
> [Severity: Medium]
> Can an in-flight amd_sdw_update_slave_status_work() overwrite the zeroed
> interrupt masks during amd_disable_sdw_interrupts() and leave non-wake
> interrupts unmasked in runtime suspend?
>
> amd_disable_sdw_interrupts() zeroes ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and
> ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 before callers drain amd_sdw_work with
> cancel_work_sync(&amd_manager->amd_sdw_work).  Meanwhile,
> amd_sdw_update_slave_status_work() unconditionally writes AMD_SDW_IRQ_MASK_0TO7
> and AMD_SDW_IRQ_MASK_8TO11 back to those registers without checking
> interrupt_enabled:
>
> drivers/soundwire/amd_manager.c:amd_sdw_update_slave_status_work() {
>     ...
> 	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
> 		if (retry_count++ < SDW_MAX_DEVICES) {
> 			writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
> 			       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
> 			writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
> 			       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
>     ...
> }
>
> In amd_suspend_runtime() under AMD_SDW_POWER_OFF_MODE, that race leaves
> state-change interrupts enabled while the manager is powered off:
>
> CPU0                                  CPU1 (kworker)
> amd_suspend_runtime()                 amd_sdw_update_slave_status_work()
>   ...
>   amd_disable_sdw_interrupts()
>     interrupt_enabled = false
>     writel(0, ..._MASK_0TO7)
>     writel(0, ..._MASK_8TO11)
>                                         writel(AMD_SDW_IRQ_MASK_0TO7,
>                                                ..._MASK_0TO7)
>                                         writel(AMD_SDW_IRQ_MASK_8TO11,
>                                                ..._MASK_8TO11)
>   cancel_work_sync(&amd_sdw_work)
>   amd_sdw_wake_enable(..., true)
>     /* RMW preserves MASK_8TO11 */
>   interrupt_enabled = true
>   unmask ACP_EXTERNAL_INTR_CNTL       <-- non-wake IRQs remain unmasked

Patch 20 fixes the suspend ordering so that amd_disable_sdw_interrupts()
is called first, followed by cancel_work_sync(&amd_sdw_irq_thread) and
then cancel_work_sync(&amd_sdw_work), before clock stop or power off.

After amd_disable_sdw_interrupts() sets interrupt_enabled = false,
amd_sdw_irq_thread() will not schedule any new amd_sdw_work items
(patch 15 guard). cancel_work_sync(&amd_sdw_irq_thread) ensures no
instance of amd_sdw_irq_thread is running. cancel_work_sync(&amd_sdw_work)
then drains any amd_sdw_update_slave_status_work() instance that was
already queued.

If amd_sdw_update_slave_status_work() was running concurrently during
amd_disable_sdw_interrupts() and re-arms STATUS_MASK_0TO7/8TO11, the
outer ACP_EXTERNAL_INTR_CNTL gate is already cleared by
amd_disable_sdw_interrupts(), so no interrupt can be delivered to the
CPU regardless of the STATUS_MASK values. cancel_work_sync(&amd_sdw_work)
ensures no instance of that work is running before suspend proceeds.

>
> Draining amd_sdw_irq_thread and amd_sdw_work (or checking interrupt_enabled in
> amd_sdw_update_slave_status_work()) before clearing the mask registers in
> amd_disable_sdw_interrupts() would avoid re-arming those masks.
Patch 20 addresses this by draining both work items in every suspend
path after amd_disable_sdw_interrupts(). The ACP_EXTERNAL_INTR_CNTL
gate closure in amd_disable_sdw_interrupts() prevents any new interrupt
delivery irrespective of the per-manager STATUS_MASK register values.

