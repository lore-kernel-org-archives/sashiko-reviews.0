Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794078233;
	b=e8ein6DDVTR6VcctiBOsrGErKggGP6U0iwZ0E/yV52X+07OUJrUy7gJ19uOKXlcPAYs4
	 2cm9neIcQ5QzqQFatCMqgwiWqTHmMdRbqkKDX2gjpYw7mEglCt+ZFBvEmx8/ygQ+SLyzp
	 Ph6T6DMZOhurCin1COqccB+XRJVxX8dOiEzxjbmdy5O3qvf8ZwBggEPe8+xd+uwhUzbd8
	 IdcGhIOlRPE6bY8V+UthtAG0xLWRN5D8CXQocN6lKbGg6dNy0XiwGwAsP8sET5PJx+aLE
	 +I+ME0rL6BSXk6cXnlbtu6t16+ai5ZNAkbdCNj4wEiZP43ivGVSiWjxn7Hslq45GNVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794078233;
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
	bh=zEUfZlb99ZpqQcZ8sJyZdUycQX9iHWDpka0RjhWHlxs=;
	b=l2oJFnsNeJPesC2j+easyOUWEP+/1yrRlb/jnIUoyn4dEA1tL2jHB1WgyvpIrNq0+Ftj
	 iyere2zWmZ9O7D6MgWOOKm/wE7HUbZbNldFc1tbXME4UJKAe8FFFF7OyRIeKK+fnrrVzV
	 e9uIiujT3qmvJz+Cymek950GCmyheZFbYZcYQOagNUv9vDf2NLmVDMZR1CPfceF1f6YTa
	 ThJcwd0qN2vGEQr4vuF0xxGvSyk1IFl5ixYGYww+PYFdBBA/TusQadq+s6fga2fAUOlij
	 yzg6RUCaYne9t5Dh5HnYQZPhVpAPlctpnSg4bD+TeLb7dF6FpsRFpzjxca23y53fB3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BlUWk+TZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.68
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011068.outbound.protection.outlook.com [52.101.57.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE00606A326
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 19:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BlUWk+TZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATLptIsP6dFGzEYXwjNsi45GjJSTv5BlDw4CqgLMxiYdb8mwGmmf0lEfxW+x0ndJZGb+8bmJxt1VG16uov9IzSpeINJzWH+/aF8bCUxBdt5zeQoL9//OM4htTZZotntAtxKRojJM92ydDZaNCZM162yR/l5gwcgSjEsrtwhVFKrlMqL+hS1oBUD116RlGRvjybbXnsykD8gmrT43kat6pMiWUYOoENWt6iARfOAVFI3LkFuLkYy/9Y7FXWRsk0uNhgdYa4yC9XB4cbMa33G8uNCh7edfnx0kkzf0AuxJs/OuwYmvxYeY+gqQ3dGlvXdIYBu11d+zD4uAy5yMcMeIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEUfZlb99ZpqQcZ8sJyZdUycQX9iHWDpka0RjhWHlxs=;
 b=F6ik2DBY481eJwzBib8LNwxByXFI93ZLt1lsZfp7WWoiig1VG+i/oKf7XrduEwoMmEdDrt7KK2Ob7HXxqIF4lXkIvaw9KbZkEXKAWjyAPqs+fTSNOeaWbhYxF59MmVTHCfK2it0E2HtVvMTXufEE+cNP5s330ygNhyip3PGx9c5kXETY5C81L9aBYyJQDhDFeYTuiymVSNdm4WTKn0Kl5mEK6R0WKPmGIeKC7TaxBJnuJYnCABni4an6duEoAAibk96u16Fo+XIxTtsJDbBmyIz6HRwRQB3RwGyc+u5yhmlFNRyqk9B6bMlLvraRoErqthoQbivzPb5RJUGfjLMuww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEUfZlb99ZpqQcZ8sJyZdUycQX9iHWDpka0RjhWHlxs=;
 b=BlUWk+TZmwMwo7la8x09OYuDrG4dF7ZmjsLTjcYmotNZ4BpO4SXNpk4ILoUm44wXWSK2HwiXzQhpeaYqZEfEPBhnG3tc/lbUTCJqCE0Fwmw+QxbaOjADND77SlZWpYTHzkC9Yal8DA3Gi0ZVdBd5iyQKNKwFJ0qy197pccJoLqw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by MN6PR12MB8544.namprd12.prod.outlook.com (2603:10b6:208:47f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 19:01:42 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.009; Sat, 7 Nov 2026
 19:01:42 +0000
Message-ID: <86468760-96ec-4962-bce6-0c232acb82d9@amd.com>
Date: Sun, 8 Nov 2026 00:30:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/25] soundwire: amd: program pad SCHMEN and OE
 control for ACP 7.0/7.1/7.2
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-3-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-203029@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-203029@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5P287CA0042.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::9) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|MN6PR12MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac72d96-6764-4796-39eb-08df3d018f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|3023799007|261009223027099003|261102123227099003|261028144727099003|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	hH58R63791evX32PpcxsJfLCx7DVLVgP6j1qByw4lKVjjDne0p/DAewbU1Gi2j2T1+wWf5F/PxxGXp1davyIsUKf1RpxQ+iCs9nePRKQztNaUklbL2wEcPTR/kqlMbzvq6MkZWHhu4P9ijGDD1CLNWiTNVUuCCuugL0e4uDRGZSO5gVdNaUnoq/66Ir6UaRORzq9vmuChM6QbkKtG4RlnQFh7d6GGbwQo+XISdzqQO1SubXctFgwX+9+sBjrPfnqKhmrdDGuWC2mUN7AQxzcINxI7D2fWGza+cawnwOgQTvG7/+sLnInzc3ys2mxQ5M7bjk7mK+CO5fRL3QjCIr7eCqwK/02iExtjFOEKzl/9v5pSB9XPrp5qopLroUDUFrckAKmhfGqog0pfhYebux51SmMyONL7jy7/0JokJcp3Wyhab5Vxe/Jm8GqFMJzSB5CHm2cENe+mXGlboxDVdkmqX2Z3Kbdt9ruqJf1Bacm1+aHOKwA+wti7bs/rs6FgI9rPAcDe0SJSyESZ8x6iiU5POsShRSPF3A6afXNuciFHRXeToe1p8F9PWLeDYVziHFsPA0/sbkWdttYS2p/gyCvYxV1sOs3+7Ly416oOjZRzluT2Zlm9v4/8pBAIwAWVz+PFvMH7OQ1DkrAYCJt0Rv6H5WEu1ZA+2qGz1UZtltaDtc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(3023799007)(261009223027099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTVneWpVeG1CZGRBb3lUeG1CWlBTU1BMUmVkOTFrQVRrT0l5ZWlVbmxHOWxB?=
 =?utf-8?B?Nm45SEx1UjNYV1BVeTBVUTdEdEgwQW9ld0hLdExmQjVPL3gxN09DR2RPcGNY?=
 =?utf-8?B?ZkJnOHhKYlBWaFNlK0pIcmYyRzVJMnJUV3lXSUsvc2FTWEpuQ3kySStDMzdZ?=
 =?utf-8?B?ZU9uUVIrVWMvczQ5Ukt5M3lQV3huN0l3Wkhobkg4SVhBZkdUbXJ2dUpuKytn?=
 =?utf-8?B?UEx3aCtOTjdyUkZJTXBUNWFvOXZTVU9kRWVBMUNLeDB6UURRVmN0TFlwWlBi?=
 =?utf-8?B?ZW1xRXBuZWtUSG9IQm41dHdUNFdQempoUUU3N3ZmYktpWTZBRlB6UlN6dFlo?=
 =?utf-8?B?VUF3cE40RkdOSHRNNEk5ZzZsc1FOQnN3WGRpaXV5eGZlZzc5Rll3dml1bWoy?=
 =?utf-8?B?YmlaK0tUYU9ySWVVS2tOVUJ6dmQ5c2dJdFcrSHJnS012SkMrd3puY0FJNUxD?=
 =?utf-8?B?Y2ZOZnJMWFVmY1ByU240NFU2TDVNcStLUUpLUmF3WVp4RDFKMk5TRGVFYVdU?=
 =?utf-8?B?VWpkKzRKWUFEckxSYWhWaUtYNk9Ja29vZ0hKS0NQV0FvTzJKd3d0cGgwRWRq?=
 =?utf-8?B?U3NoUWk1OXlselNIRTgrcGVCY2MybDVNak9PNE1zM3o4MjR5YUxZS0xZYW9q?=
 =?utf-8?B?OEtIMzd2dUs4UXhYKys1cUVzR3B0a0Y4ZHRSeG0zVHNXQnFaYXpRWEdTa2cy?=
 =?utf-8?B?OWYwT1JvbnlGdTU1elJtSXA5YWJzOTdBTnJPZVdPb0ZqUEluTG9uL3lDYXU2?=
 =?utf-8?B?SGIrYytMQWJnYVVZNU5YSXZnb1Z1TmxoK2wzTE03VUFTVGFMOHBGMXlZem94?=
 =?utf-8?B?dFJVbnp5Ukd4TUJvK3JYSXVIM292MkVSSXo1NDlsU2VZRXM3akl1V05rN1kr?=
 =?utf-8?B?bi9ZT1hNTndFZUEwVWRXVEcwK1VaL3R5ZWNqTjF2MlZKclFhMm9RZ2pSWWZm?=
 =?utf-8?B?RjU4cHlFU1dYVFRVMlZLRVJGendFOEJiMmEyTm5JM2h2Mzd2RVVSV3RHU3dG?=
 =?utf-8?B?QzVSQktGQU51UzRkay9ablRLYi9ncXViY0o3eHJGa0dOWUhPZmU5RkdUY29a?=
 =?utf-8?B?bUdLUCtsOE1zUjdGc3FoNzErVXNXdXlLVmxoVGhKbStybUUrU2dNeVhUUXI0?=
 =?utf-8?B?Y0N0Tjkxc0ZZd2xsdThPV1RiaE1PcDdvU3kvSFNES1BvMCszWUg4UXVBK2ZB?=
 =?utf-8?B?Y1N5NU0vVll4YnRJVFg2S1F4NHZWaHVlRThhMi9RazNJS0xvcHNRRWdTUjdI?=
 =?utf-8?B?V3VORlRkTVRxdWVrVS9EMDFQNWNnZjVES1k0N0hUcXhuWEdTMEc5dUFQcEtv?=
 =?utf-8?B?U2hPZFhlR2VVZ1Qvd3p3Y1FHMDJocUxUcEN3aWY0aENWblg1Wk1LUFZBekdU?=
 =?utf-8?B?R1YzMDYrNVhndVBVOElnbVppNG04aTVraEphc1M1TVZXN09nRlJtbVR0bk1k?=
 =?utf-8?B?cEJteWJsZmZ0Rnd0ME51ZnRZQzArcHd1bFpTdHVvcHlpNzc3SkxNZTE3RUVi?=
 =?utf-8?B?NFRMWElQRStNZUNMb0JjdUwzcFdleGVGbTNPTUNudlNDL0JJNjcrV2MrUXNV?=
 =?utf-8?B?dTdza3RTbjg1b1ZwUUdsS2lxZkhjSk9IU2JUL1VtSFFTZU96Z3UzL0FxdUhx?=
 =?utf-8?B?OXFaMVBGZnR0OW14bERRNHBFOU9vbXhVR0ZYZDdjR2l2V0J5YVdTWVRWMzhR?=
 =?utf-8?B?ZFIvUXBWYzh0Z25wZ3U1UmNMd1ErQll1QVFZdm1NU2xZNCtIZ3R1c2t6bG5a?=
 =?utf-8?B?aFVUTzZsd0hXNU1rbHU5ekM3RFpqSTY5OW5iemxDa1BoZGh4UlprQTM1emlU?=
 =?utf-8?B?UW9OY2ZyamJ1R3p4cExqL25NTTB1QitZcDl0MjJoWC9tVGpqZ0RlTWlPcmJl?=
 =?utf-8?B?MjRWSzk0UGJ6OE9UMDluOG1leEkxNUxCVGdSamg4VGdUalBsZkU2RjdFYzJv?=
 =?utf-8?B?all3M1R2dTNPNWpLZ3VHdWdyd0FpbWJiNGtWRmtPNXpXYWZBZmFWejliaDNG?=
 =?utf-8?B?cWg4V0xRMW5WY2U5L3k5UTNHWlhuL29Ta3Mzc0swWDRKVEpQbzFBbk0vR0VS?=
 =?utf-8?B?VkpkazNIdnVxUDZ1K0dNQTNEUzRGK25rcjR2S3EzWkU0dCtBSHNBbC9YcWF3?=
 =?utf-8?B?a3BTVkNRYVpMeEw3RmU4Ui9VcytLaGRYb29kOTlrc3dFdCtUeGxHNEJSOExL?=
 =?utf-8?B?NnlFcGZxVHlSYkk0MHZrYkZXanpVWFBTQlpJSzV2SkJ5b3J2d3NIbzhES0t3?=
 =?utf-8?B?YXJrTEcrYjUyakJuNDdXdzF4U1NhRFNjV3lXNHRtNUNjYkg3dVl2UTBkTlFV?=
 =?utf-8?B?Z1gwRHpqT1dzWFZKM1NueksyMTFRdXJ4Y2lIQTFrREJTR00zMmtrdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac72d96-6764-4796-39eb-08df3d018f96
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 19:01:42.4119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ShMrQdvrfeOGK9uJ77EnmTwcirmqxtieQolxBrUi3/CQ800BYq9E3gGl1qv+uBfek2bJBfVJxlK+rWehzj4qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8544



On 11/7/26 21:43, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] soundwire: amd: Fixes tag cites ACP 6.3 refactor instead of ACP
>    7.x commits
> - [Low] soundwire: amd: amd_enable_sdw_pads() writes pad registers
>    before acp_rev check
> --
>
> commit feea96d1feca02ca2e3cb0b4f0b3f33fab424dca
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
>> soundwire: amd: program pad SCHMEN and OE control for ACP 7.0/7.1/7.2
>>
>> ACP 7.0/7.1/7.2 hardware requires SCHMEN control and
>> output-enable (OE) registers to be programmed as part of the pad enable
>> sequence, in addition to the existing keeper and pulldown writes.
>>
>> Update amd_enable_sdw_pads() to program ACP_PAD_SCHMEN_CTRL and
>> ACP_PAD_DISABLE_OE_CTRL for active pads. Pass acp_rev to
>> amd_enable_sdw_pads() and restrict these writes to ACP 7.0/7.1/7.2;
>> ACP 6.3 is unaffected.
>>
>> Define per-register masks in amd_init.h replacing generic local defines
>> in amd_init.c.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> Fixes: cf0ddbc29dfa ("soundwire: amd: refactor soundwire pads enable")
> [Severity: Low]
> cf0ddbc29dfa ("soundwire: amd: refactor soundwire pads enable") only
> supported ACP 6.3, which is unaffected by this change, and predates both
> struct sdw_amd_res.acp_rev and the ACP 7.x definitions.  Should this cite
> 2c0ae8ef1e5e ("soundwire: amd: add support for ACP7.0 & ACP7.1 platforms")
> and 34b1cb4ec286 ("soundwire: amd: Add support for acp7.2 platform")
> instead so stable tooling does not attempt backports to ACP 6.3-only trees?
Agreed. The missing SCHMEN and OE register programming was a gap
from when ACP 7.0/7.1/7.2 support was first introduced. The Fixes tags
will be updated in next respin.
>
>> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
>> index b4f45bdf3c171..032697ea35906 100644
>> --- a/drivers/soundwire/amd_init.c
>> +++ b/drivers/soundwire/amd_init.c
>> @@ -16,37 +16,49 @@
>>   
>>   #include "amd_init.h"
>>   
>> -#define AMD_SDW0_PAD_CTRL_MASK				0x60
>> -#define AMD_SDW1_PAD_CTRL_MASK				5
>> -#define AMD_SDW_PAD_CTRL_MASK		(AMD_SDW0_PAD_CTRL_MASK | AMD_SDW1_PAD_CTRL_MASK)
>> -#define AMD_SDW0_PAD_EN					1
>> -#define AMD_SDW1_PAD_EN					0x10
>> -#define AMD_SDW_PAD_EN			(AMD_SDW0_PAD_EN | AMD_SDW1_PAD_EN)
>> -
>> -static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, struct device *dev)
>> +static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, u32 acp_rev, struct device *dev)
>>   {
>> -	u32 pad_keeper_en, pad_pulldown_ctrl_mask;
>> +	u32 pad_keeper_mask, pad_pulldown_mask, pad_schmen_mask, pad_oe_mask;
>>   
>>   	switch (link_mask) {
>>   	case 1:
>> -		pad_keeper_en = AMD_SDW0_PAD_EN;
>> -		pad_pulldown_ctrl_mask = AMD_SDW0_PAD_CTRL_MASK;
>> +		pad_keeper_mask = AMD_SDW0_PAD_KEEPER_EN_MASK;
>> +		pad_pulldown_mask = AMD_SDW0_PAD_PULLDOWN_MASK;
>> +		pad_schmen_mask = AMD_SDW0_PAD_SCHMEN_MASK;
>> +		pad_oe_mask = AMD_SDW0_PAD_OE_CTRL_MASK;
>>   		break;
>>   	case 2:
>> -		pad_keeper_en = AMD_SDW1_PAD_EN;
>> -		pad_pulldown_ctrl_mask = AMD_SDW1_PAD_CTRL_MASK;
>> +		pad_keeper_mask = AMD_SDW1_PAD_KEEPER_EN_MASK;
>> +		pad_pulldown_mask = AMD_SDW1_PAD_PULLDOWN_MASK;
>> +		pad_schmen_mask = AMD_SDW1_PAD_SCHMEN_MASK;
>> +		pad_oe_mask = AMD_SDW1_PAD_OE_CTRL_MASK;
>>   		break;
>>   	case 3:
>> -		pad_keeper_en = AMD_SDW_PAD_EN;
>> -		pad_pulldown_ctrl_mask = AMD_SDW_PAD_CTRL_MASK;
>> +		pad_keeper_mask = AMD_SDW_PAD_KEEPER_EN_MASK;
>> +		pad_pulldown_mask = AMD_SDW_PAD_PULLDOWN_MASK;
>> +		pad_schmen_mask = AMD_SDW_PAD_SCHMEN_MASK;
>> +		pad_oe_mask = AMD_SDW_PAD_OE_CTRL_MASK;
>>   		break;
>>   	default:
>>   		dev_err(dev, "No SDW Links are enabled\n");
>>   		return -ENODEV;
>>   	}
>>   
>> -	amd_updatel(mmio, ACP_SW_PAD_KEEPER_EN, pad_keeper_mask, pad_keeper_mask);
>> -	amd_updatel(mmio, ACP_PAD_PULLDOWN_CTRL, pad_pulldown_ctrl_mask, 0);
>> +	amd_updatel(mmio, ACP_SW_PAD_KEEPER_EN, pad_keeper_mask, pad_keeper_mask);
>> +	amd_updatel(mmio, ACP_PAD_PULLDOWN_CTRL, pad_pulldown_mask, 0);
>> +	switch (acp_rev) {
>> +	case ACP70_PCI_REV_ID:
>> +	case ACP71_PCI_REV_ID:
>> +	case ACP72_PCI_REV_ID:
>> +		amd_updatel(mmio, ACP_PAD_SCHMEN_CTRL, pad_schmen_mask, pad_schmen_mask);
>> +		amd_updatel(mmio, ACP_PAD_DISABLE_OE_CTRL, pad_oe_mask, 0);
>> +		break;
>> +	case ACP63_PCI_REV_ID:
>> +		break;
>> +	default:
>> +		dev_err(dev, "unsupported ACP revision 0x%x\n", acp_rev);
>> +		return -EINVAL;
>> +	}
> [Severity: Low]
> Should acp_rev be checked before programming ACP_SW_PAD_KEEPER_EN and
> ACP_PAD_PULLDOWN_CTRL so that an unsupported acp_rev (such as 0x7b or 0x7f
> from amd_sof_acp7x_probe()) does not modify pad registers before returning
> -EINVAL?
Agreed. The current ordering writes pad registers before validating
acp_rev, leaving the hardware in a partially modified state on the
-EINVAL return path. Next respin will move the acp_rev validation
to the top of amd_enable_sdw_pads() before any register write, so an
unsupported revision returns -EINVAL without touching pad registers.
>

