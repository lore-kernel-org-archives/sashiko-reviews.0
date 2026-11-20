Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795166493;
	b=0jqN2st1oEcLrI7AX3ceQE672lHoXTqbwzzMwS8pv2gX+KdnOkaGhlCfQGyF0pUIBJXq
	 wXk2K+e7KwBoVRxNjHVofG/8bm4CTEsB+Wgw1Cyrpe6QLi0lCO7YiQlhK9/jtC25OOPfx
	 1oY8N7/HqI26zSrJvhwaFGHpO+SDk3cS6fppGI6Rj1X6Dzj1KdGWIvx1sOcjWN0YvW0s3
	 RrGqkE9jVzlFiKRFy1WMDdgbItA3jyK8FO0XKOEnW8UhhmARgVJnizl5MHfoSr/NGatlQ
	 K60Jlp3noLbl23YCyW+VqkTEl9arJuEznfZDmiusQoFpheoxccap5H62GnwB9FmosFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166493;
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
	bh=WhG8BMTdfIRSxMF8pxSc8qSh9gRDBzGpG4ML3i5B9X4=;
	b=E5XRhPHNtGa0n6X9W9oDL9wFT/AtTWL7RuIzPflFxoJ/hN9wgt84iq8Q0/ppbpKulquy
	 fdj3d+XwOtFwcIurBSiek95r+i6tgYlMJdZZ8I+VPPKK26Jf7EqR+doC5CcdWLfsKQwcg
	 2w7mB53S2MJk+j93euyna8AkHrws7lkVvcrDnPGUvBEEsoFE9QyT+zK+brgappZ6VZLyw
	 M3ilaGCG/n6uS9uyVXeEMUA3jYX6Hyg9qK6tph92RlhfhYKH7ubl+FfXkcwGVUMHi7N36
	 Sidf6JobR5wR4Nyeqw7ZAvjUPxJbAqtDRY/L3XHZuKtP0cIGflHy/Lcan7LRkYbrWpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ccaUbRwG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.19
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011019.outbound.protection.outlook.com [40.93.194.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B793606A326
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 09:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B793606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ccaUbRwG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcUYJB7cZXmWJSgqnu/Wshviz42y2ZuwmNiH9RxxDWEVOf0vG3C+VFBamMOG4W+0vMAczRurKbOPc5ZBpk9waYQ5WvRW+PzJ3LNchDoB22Nk3pB5lyrh9CuaR8uNsO6YC0ntoR3v9x0+JOoDNyid+HvH55V4rz8SoFgPVVDi6bQRVDIwV+ncPPFiO07pFJU0RAE+8r62C8OUAgweTC90ZxmWCH8c4G1JmBTnaG0Wg6jSoKjxu7lUM4z8XQijIKS6MEQPHYkULRZLDB7vgQPUt8NeD9hj4NSNL+Hr2EvqviE1oeV2uXfyZb7OqkQH7Wig4Le7MA8DMZ5QFSQtPzRT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhG8BMTdfIRSxMF8pxSc8qSh9gRDBzGpG4ML3i5B9X4=;
 b=YnfsqKFCJi1EtggAZgs4ueyS0OLkg+IgHvUH5eWUDWNvfnhX3I1L2hb9UDESfJ5LlbDmaSmjvVdN57zvwCyyIQTIzhG9TTwZskO3vCQleLm9W6lT/2ipv5y8Z8awUdAbW+ipQEQly9mSeNPNG99n2mwCBIYhEVJfU3p155a3nZO9qS5zeCZJvcAI59QVn3KHXG8VvwzSNR9uLlzgLINiY+TBh+0VzdaLPJ1X4ubVscMnlTRAiiFcmxLn83a/YMsfex68BQXAkDUjBHaRXtG9JGsbGpKm0MGifKYl62AIjzwQQIwyU4JJvY5XoiwAiYFEx37JCf3m6J12vRuhxG6vrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhG8BMTdfIRSxMF8pxSc8qSh9gRDBzGpG4ML3i5B9X4=;
 b=ccaUbRwGsNIQD6XSAm8z/rTIWJPYHyAruuR/YYjtL1q4CjRoRL3Kyx5fp4lN/mhait0LIpCMC0dEoZug/udKQT0/lHbTlcnkjZqMmCb3VC7hVizKr/NvwCtWmovO7ePTOxr1nif4mf3TLaix+d759fSg7NTlKIJqHFYG2+jiV50=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 09:19:56 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 09:19:56 +0000
Message-ID: <9466c3c5-50f7-4566-9ff4-3d7d8aa4491f@amd.com>
Date: Fri, 20 Nov 2026 14:52:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 20/23] soundwire: amd: fix interrupt gate and work
 drain ordering in PM ops
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev, "vkoul@kernel.org" <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Venkata prasad Potturu <venkataprasad.potturu@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
References: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
 <20261118104353.331556-21-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-220819@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-220819@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::11) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|SA1PR12MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f7da5c-71fc-49dc-d7c1-08df46e770f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|261021123027099003|4143699003|11063799006|5023799004|56012099006|261021121427099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261009221227099003|261009223027099003|18002099003|6133799003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Rg3mCiyE7LSSogvjd9vy+TTOkxa89G0zetMSaWF9n8NXpaq2xmlu9AbBFsxPZmw/XgN92b8XZkmFy2Hfdf8wBzKJMa153R7wiHnyjq4H/Teadopt7P1eBOGsosfUJtAu1DxGUN4P7N0Fp7xc2R3ilFsdXKn+WhFuLcoMwL1mTcBk5zXgdKu0IN8eKo0Ekl2lseXcsYp0qNF71okkUh3XJ0WF8tST6/GofTq/cgjgSYht2rzAnroSJ8Pr005zu/CMePi12gSXJV7TFf82iCuWAaO8c3rmaLBcnOazkX0BRAfLEK0uyys2CpozfX47VBM8CgSvLKm4HE8bAfoTe9O/5tHRWhPBluyNErgB9WYSDdxn8y/S1YsxR6uPVg3IUhceJqVs7EWrpzbzf8IwH0qVSH6spknBjHaL3eZsLXq4YbJeUZZbAAlmFjn+F2OrJUSjxw6u9xawqiwfYt5qS8Y7On9SDDhp2G05t4DhmWMAMlZRaxTgH0rm/Fv6lXmHK+oiiLBkCqGM012ykOaBVT7qWIlEdrnIbDShK7Av1uGGZn7rukTkwRjn15sGeImvHJhBCBQR+qJz828Zg5R0DZ+8lrf55X3Xcj+Ew14lCHHhAzG57PYwPaJhAiRzF0vn7FgU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(261021123027099003)(4143699003)(11063799006)(5023799004)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261009221227099003)(261009223027099003)(18002099003)(6133799003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2s1SE82WnM0bXpLNElFdm54ZkdGeC9Xb2pVUmV6Y2VPZlJMMWVCSnRhYTRO?=
 =?utf-8?B?Q1Nlb1BaUldsVmE1eHp2UEt1Y1U4SE1NZjEwL05RRWpzMTg2bnRtZHNabTRt?=
 =?utf-8?B?VzhXL3FKRnJzbUNOaTQ5U0M5ZGhEZFdUa0dYelZzd1hzVld2TUEvMzlmU3Yz?=
 =?utf-8?B?NGRSSVFSRmxiSE1QeHhFdEtiV1dhRGJSeWU1Y2xDNDlaTVRsclloemJUc2FD?=
 =?utf-8?B?b1Z6VnFiNVQ2NnplMEZrejFrZzJBNm9EV000SllZQS91eGxYR0ZaVXU0dTVI?=
 =?utf-8?B?d214TUdnSHRNRzFNajMySjZNWjVjSGFtVmw2c3UreWxxMUVUbHR6OURGOTdx?=
 =?utf-8?B?T0hScjdLZGFUZC9Ia2RZQTV4a1N6ZU5xbW1ocG8wd2hjZjVhRkFyeFlvOWxj?=
 =?utf-8?B?cmt5dkhwUjJJdlVzcDlmaEMvU3BLUE5TQmJlcFo1MWI2QWlZaUxGUzRIKzhn?=
 =?utf-8?B?THc1NkJxMXFONHd5eDI3OTJBNXZ3b1plVnB6a0E5Qk8xL3haK2FieUtZWU1q?=
 =?utf-8?B?RytvRnUyNC9JR3A1NmcvV1ZIdVREdCtNbWNMblB6NnN2VFVaKzRFSkJPcXp1?=
 =?utf-8?B?MHN0ZGV3eS9OUlBXWUxVUnliZndjZndINmRVK1RhOHdsQWpaSDVJeExETUJz?=
 =?utf-8?B?NGU0b1I4Wlh2dVFsRFpXQnc5cC8vYnRmZXNSZXJ5OVNQMnozeDdsWS91aHV2?=
 =?utf-8?B?cGtaeUQ1bkV5US9Rb0JxWHNZVUpKNlN1cEh5QmxsZGJyRHdscVhKTDdERER1?=
 =?utf-8?B?UFZYdTNMeXNYUjEwTkJRTzVnaTBaMFZPak5PbGxLUDBkdDkreWFycWN4TW1F?=
 =?utf-8?B?QmJmWDV2RE9NZjZnYi9LdEhwZ05VdWE2aUlhTnZHSm9wbEFxUVBpbEFPVHJH?=
 =?utf-8?B?cmxZSTZvRVUyenhTQkI3eGJoenhnM3pNQllQb005L2Q1UG90Vm96NCs4QllO?=
 =?utf-8?B?bCtJVndrOFNEa1d0c3hJcnpiejVuNGJ4dkg0QnZmQ3BvcVBjdkJvbXluKzN3?=
 =?utf-8?B?VG5TMm9xbWsyZm9WOVcyTmpYYWhydlovN1lMYVFpQ29vMVFuOTVSQmUzdXZI?=
 =?utf-8?B?ZWNRSlN2OVRmaXZpR1dUL2RyaFAvNjBra09LSHkyM1dGMm5aK3V5TVU5UGFV?=
 =?utf-8?B?U0FLcWNmMUk5ekgvcW9TMGlvQWM0bmNHS3NXQkF6RjA1d0ZRTEtZYTNrNTJ0?=
 =?utf-8?B?ODhFMmgzRnFOSDNKdUZ4endtVWhQZU5JNWhWV1NzRElHMXZFeG4zL2FPT1dy?=
 =?utf-8?B?TjRMSkdwTU5JQnViQlJkUjgrNVZtbWQxRHViejAyeU9sZ1p5UE0wajhYaVJG?=
 =?utf-8?B?a2NuS0JZSFlZQUZWbEFIeStmaFNiemxyV3I4cXp1bzV2RUdHVDBDODFLSlly?=
 =?utf-8?B?TGoxUTBxVFhPeWZVRlFMM3JwUnNVbU5TR2Zwenh2RjlGQ0FUUUZTMklEdXp3?=
 =?utf-8?B?STdLc3hlTUczN2lDdURBTG9JZVpnRGVmR3ZVcldVNW1pZDhXQ2t5RXh5elUr?=
 =?utf-8?B?VXJFRkRNM2tRTXJJWG1wRkhRbWZLUGltSGlLSm1UYmpiWmVjWTNlellUUFN5?=
 =?utf-8?B?cElvWnlWVDdLWG9PUEZRNVFyUWFJMnZpTlJ1YkhlRTdyNGhMMUdXZi9OZFps?=
 =?utf-8?B?Q2dUanVaTllUVzBZR2tsWStSV0tFejdwMklrU0NBTUx5NmJ1b3djRjdEOHBH?=
 =?utf-8?B?TmFGWlh1aUFFengzZHhhTkowd0xSM3k3OHhZbWNqejQ3eUZLZ29wckVvQndx?=
 =?utf-8?B?T1g1c3UycUpTakd2REhzNUxhZnc5dmczMnBzSStQNmhXT05oZ1BKMEZpdktx?=
 =?utf-8?B?SHN1UCtLbVNibTdxRWJuZ29hbWZaNjJxOVloSlovUGwrT3dDVU05WTRjMkNp?=
 =?utf-8?B?MElTR1QxZVEvUFowZ3UyN09EVkdpeGEyYXMwWWNrbWxCZlRRc0k5RjRLOXpK?=
 =?utf-8?B?amZIWkEvRHhoSVp6TUNXWCt5VTZzTjhhVXF0K1hKNC9TRGtrUU4rMDJ6Wjdp?=
 =?utf-8?B?ODVSWGkrR1NkWXBmaDcrb29VWGtTTTBINlpqcDk1M0VNQ3VlL3R3NDB4UGFN?=
 =?utf-8?B?SDlRSjBIck5PK1I0MmRXNGIzUGd3NitwOXJHQ2haSHBlVE1XQ0JUdjFENzNV?=
 =?utf-8?B?bm5JTG9mY0IrR0hYUStBcFRKdGR2ckIwSmd6b0lCbk0zREt6MFEyTVpJU3Vu?=
 =?utf-8?B?WWc4bmdjanhTSlh6TUduZ3dsUHNFSm9FalFYdWpWSnlFMldUQ3JLVnZPSzR3?=
 =?utf-8?B?WGFjVUtWdFQxSzZ6MlRnMWZCU0ZPeHhsbmZVZHF1bm9hUVV4STFMQzdpZnJK?=
 =?utf-8?B?WjE3ZktpZVI4S3B4U2hYZjBtczNPSE5jUkFqUTYwR3g1YU1adHFBZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f7da5c-71fc-49dc-d7c1-08df46e770f1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:19:55.9261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jr2gfrmOi+Edn+aTaoCzrJDk7dfWH1lhEfyjf8S1hqFVIuBsxl8amuRQiWXV2gOa7x7Z61WPa3T6VyYYi3An5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038

On 18/11/26 16:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] soundwire: amd: runtime PM deadlock in amd_suspend_runtime()
>   work drain
> - [Medium] soundwire: amd: stale status bits and early IRQ enable in
>   amd_suspend()
> - [Medium] soundwire: amd: draining amd_sdw_work re-unmasks IRQs in
>   POWER_OFF_MODE
> --
>
> commit 51e6c84ae75bcfe935e29acd598ea807a66790ac
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
> Can disabling and draining interrupts without clearing
> ACP_SW_STATE_CHANGE_STATUS_0TO7 and ACP_SW_STATE_CHANGE_STATUS_8TO11, and
> then calling amd_enable_sdw_interrupts() while the bus is clock-stopped,
> cause stale pre-suspend status bits to be processed while the link is down?
>
> When a SoundWire interrupt fires just before amd_disable_sdw_interrupts(),
> the ACP hard IRQ handler clears ACP_EXTERNAL_INTR_STAT and queues
> amd_sdw_irq_thread, leaving the status bits latched in
> ACP_SW_STATE_CHANGE_STATUS_0TO7 and ACP_SW_STATE_CHANGE_STATUS_8TO11.
> amd_disable_sdw_interrupts() sets interrupt_enabled to false without
> clearing those status registers, so an in-flight or cancelled
> amd_sdw_irq_thread() exits early without clearing them either:
>
> drivers/soundwire/amd_manager.c:amd_sdw_irq_thread() {
> 	if (!READ_ONCE(amd_manager->interrupt_enabled))
> 		return;
>
> 	status_change_8to11 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
> 	status_change_0to7 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
> 	...
> }
>
> In both amd_suspend() and amd_suspend_runtime() under
> AMD_SDW_CLK_STOP_MODE, amd_enable_sdw_interrupts() is called immediately
> after amd_sdw_clock_stop() (and in AMD_SDW_POWER_OFF_MODE on ACP63,
> amd_suspend_runtime() sets interrupt_enabled back to true).  When a wake
> interrupt later runs amd_sdw_irq_thread() during runtime suspend,
> amd_sdw_process_wake_event() only queues an asynchronous
> pm_request_resume(amd_manager->dev) before amd_sdw_irq_thread() falls
> through, reads the stale status bits, and runs
> amd_sdw_read_and_process_ping_status() and schedule_work(&amd_sdw_work)
> while the clock is still stopped, resulting in MIPI command timeouts.
Valid concern. Will fix in v8 by clearing
ACP_SW_STATE_CHANGE_STATUS_8TO11 and _0TO7 at the start of
amd_enable_sdw_interrupts(), before setting interrupt_enabled =
true and writing the mask registers. When
amd_enable_sdw_interrupts() is called after amd_sdw_clock_stop()
in CLK_STOP_MODE, STATUS registers are cleared first so no
pre-suspend bits are visible to amd_sdw_irq_thread() when
interrupt delivery is re-opened. After amd_sdw_clock_stop()
completes the hardware cannot assert new STATUS bits, so the
clear loses no real events.
>
> In addition, amd_sdw_clock_stop() returns 0 on all failure paths while
> leaving the SoundWire clock running, so if clock stop fails,
> amd_enable_sdw_interrupts() re-enables state-change interrupts on an active
> bus as the device enters D3.

The timeout handling is intentional. We have observed that propagating a
clock-stop timeout and aborting the PM sequence can result in SoundWire
peripherals failing to re-enumerate on the subsequent resume.

Propagating -ETIMEDOUT would also abort system suspend and prevent S3/S4
entry, or abort runtime suspend and prevent S0ix entry. A transient SoundWire
failure should not block the platform power-state transition.

For S3/S0ix, the ACP tiles remain powered in CLK_STOP_MODE and the register
context is retained. amd_sdw_clock_stop_exit() restores the SoundWire clock
on resume. If clock stop failed, clk_stopped remains false and the clock-stop
exit sequence is skipped.

For S4, the hardware context is lost and the SoundWire bus and peripherals
are initialized again during hibernate restore. Any failure to recover or
re-enumerate the peripheral should be handled as an audio/bus recovery issue,
rather than failing the platform power-state transition.

A similar timeout-handling approach was discussed for CLK_RESUME_DONE:

https://lore.kernel.org/all/fbaae15c-f3f7-4125-96aa-41b6bb4f174b@amd.com/#t

The longer-term solution is explicit bus recovery on timeout rather than
propagating the error to the PM framework. This remains a TODO.

For this reason, I would prefer to keep amd_sdw_clock_stop() unchanged.

>>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
>> +		amd_disable_sdw_interrupts(amd_manager);
>> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>>  		cancel_work_sync(&amd_manager->amd_sdw_work);
>> -		amd_sdw_wake_enable(amd_manager, false);
>>  		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
>>  		if (ret)
>>  			return ret;
>> @@ -1451,7 +1454,6 @@ static int __maybe_unused amd_suspend(struct device *dev)
>>  		ret = amd_sdw_clock_stop(amd_manager);
>>  		if (ret)
>>  			return ret;
>> -		amd_disable_sdw_interrupts(amd_manager);
>>  		ret = amd_disable_sdw_manager(amd_manager);
>>  		if (ret)
>>  			return ret;
> [Severity: Medium]
> In AMD_SDW_POWER_OFF_MODE (both here and in amd_suspend_runtime()), can an
> in-flight amd_sdw_update_slave_status_work() re-unmask
> ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and
> ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 after amd_disable_sdw_interrupts()
> zeroes them?
>
> CPU0                                  CPU1
> amd_suspend_runtime()                 amd_sdw_update_slave_status_work()
>   amd_disable_sdw_interrupts()
>     writel(0, ..._MASK_0TO7)
>     writel(0, ..._MASK_8TO11)
>   cancel_work_sync(&amd_sdw_work)
>                                         sdw_handle_slave_status()
>                                         if (status[0] == SDW_SLAVE_ATTACHED)
>                                           writel(AMD_SDW_IRQ_MASK_0TO7, ...)
>                                           writel(AMD_SDW_IRQ_MASK_8TO11, ...)
>                                           <-- masks left enabled
No change required. ACP_EXTERNAL_INTR_CNTL is the top-level
delivery gate for all SDW interrupts on this hardware.
amd_disable_sdw_interrupts() clears the manager's bit in
ACP_EXTERNAL_INTR_CNTL before returning. An in-flight
amd_sdw_update_slave_status_work() on the SDW_SLAVE_ATTACHED path
may re-write ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and
_MASK_8TO11 after amd_disable_sdw_interrupts() returns, but that
work never touches ACP_EXTERNAL_INTR_CNTL. The top-level gate
remains closed so no interrupt can reach the CPU regardless of
what the per-instance mask registers contain.
>
> Because the post-clock-stop amd_disable_sdw_interrupts() call was removed,
> those mask registers stay set to AMD_SDW_IRQ_MASK_0TO7 and
> AMD_SDW_IRQ_MASK_8TO11 after cancel_work_sync(&amd_manager->amd_sdw_work)
> returns.  In amd_suspend_runtime(), amd_sdw_wake_enable(amd_manager, true)
> then performs a read-modify-write on ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11,
> and on ACP63 with wake_en_mask set, interrupt_enabled and
> ACP_EXTERNAL_INTR_CNTL are re-enabled with all state-change and PREQ masks
> active while the manager is disabled.
>
>> @@ -1491,18 +1493,24 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
>>  		return 0;
>>  	}
>>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>> -		amd_sdw_wake_enable(amd_manager, true);
>> +		amd_disable_sdw_interrupts(amd_manager);
>> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>> +		cancel_work_sync(&amd_manager->amd_sdw_work);
> [Severity: High]
> Can calling cancel_work_sync(&amd_manager->amd_sdw_work) inside
> amd_suspend_runtime() deadlock with amd_sdw_update_slave_status_work()?
>
> CPU0                                  CPU1
> rpm_suspend(amd_manager->dev)         amd_sdw_update_slave_status_work()
>   runtime_status = RPM_SUSPENDING
>   amd_suspend_runtime()
>     cancel_work_sync(&amd_sdw_work)
>                                         sdw_handle_slave_status()
>                                           sdw_handle_slave_alerts()
>                                             pm_runtime_get_sync(&slave->dev)
>                                               rpm_resume(&slave->dev, ...)
>                                                 rpm_resume(bus->dev, 0)
>                                                   rpm_resume(amd_manager->dev, 0)
>                                                     waits on runtime_status
>
>  *** DEADLOCK ***
The scenario is theoretically possible. However, AMD has not observed this
deadlock in practice on any shipping platform. The window requires
amd_sdw_update_slave_status_work() to be actively running, rather than merely
queued, when cancel_work_sync() is called, and to have taken the
SDW_SLAVE_ALERT path in sdw_handle_slave_status(), which calls
pm_runtime_get_sync(&slave->dev).

Intel's cdns_update_slave_status_work() follows the same pattern without any
additional protection, so this does not appear to be specific to the AMD
backend. 

Rather, it originates from the common SoundWire bus handling.
The potential deadlock comes from sdw_handle_slave_alerts() calling
pm_runtime_get_sync(&slave->dev) while the parent manager is in
RPM_SUSPENDING.

One possible fix in drivers/soundwire/bus.c would be to use
pm_runtime_get_if_active(&slave->dev, true) instead. If the device is not
active, the alert handling can be deferred until resume rather than blocking
on runtime PM.

This would require some additional restructuring, since the current io_err:
path calls pm_runtime_put_autosuspend() unconditionally. If
pm_runtime_get_if_active() returns 0, no runtime PM reference has been
acquired, so that path must be bypassed.

I also considered the possible side effects of this change:
- sdw_modify_slave_status(SDW_SLAVE_ALERT) is called before the runtime PM
  operation, so the slave status has already been updated.
- SDW_SCP_INT1 and INTSTAT2/3 would not be cleared in this path. Since these
  interrupt status bits are latched, the alert can be processed after resume.
- interrupt_callback() would not be called during the suspend window. It
  would instead be invoked when the alert is processed after resume.
- The RPM_ACTIVE path would remain unchanged.
So the main behavioral change would be to defer alert processing when the
device is not runtime active, rather than waiting for runtime PM from the
workqueue.

@Vinod, @Pierre-Louis: would you prefer that I prepare a separate patch to
address this in the common SoundWire code, or should we keep the current
behavior unless the issue is observed in practice?

For the current AMD patch, I can leave the implementation unchanged pending
your guidance.

>
> Each peripheral slave->dev is a child of bus->dev, which is a child of
> amd_manager->dev, and both children are in RPM_SUSPENDED when
> amd_manager->dev enters rpm_suspend().  If a peripheral alert schedules
> amd_sdw_work before interrupts are disabled and
> amd_sdw_update_slave_status_work() starts executing before
> cancel_work_sync(&amd_manager->amd_sdw_work) cancels it,
> pm_runtime_get_sync(&slave->dev) propagates a synchronous rpm_resume() up
> to amd_manager->dev.  Because amd_manager->dev is in RPM_SUSPENDING,
> rpm_resume() sleeps on amd_manager->dev->power.wait_queue waiting for
> amd_suspend_runtime() to finish, while amd_suspend_runtime() is blocked in
> cancel_work_sync(&amd_manager->amd_sdw_work) in both AMD_SDW_CLK_STOP_MODE
> and AMD_SDW_POWER_OFF_MODE.
>

