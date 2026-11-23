Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795463563;
	b=c2vjOLXwM170g5fVV0yNmaPUHPmoY9kj+EwjCzgYUoxH/nX9aqrZoGu/CVw475zf85Yp
	 /W5mFHWT1PCE+H2RDMH+HkVWH+fxJereaVMZBvyCjF7etupKfvAAgZxLkABxsVDePnX1y
	 wBmz+ZwyLq5xQrTA8SSCEW0Q9weHfrjbpBe4Yy1Uaa6+pmawhqykO3VrgUzyd6JNaXNfz
	 dZJNf/tbkVtpY0o4idPvYL2+pGsdiBe3CnBmT8f6s7walAmOm3DGzqcHtt2Wlt9ZdpIHC
	 13j4CbYFpGb5cSu6gguBscgKIrg69GmPzp0j12BRiLMZ6TuL559hjuqA3SKwoGGG34g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463563;
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
	bh=af/5dapHzgjrtsNRnlqlwo8RtPwALRlfK6OOSSiluzI=;
	b=K0vh21zT0oG+N4oon7K4i/tGFLG2VFJ9O1KMcrbBujK70EE3Du/vpyaTXo5L7pgFb0mg
	 0Aak6wpGTGrxsagjJF1cWxxE2BYyDdJSM1R+q02VhfzKffVF1ICi+c4z02b//861sW7BX
	 6WthbRs6XmGfpYh6cercoJ6BdUkLIyIR6GV2Iy/lFJMABuQc+XQG67WcyJyYlYcDzaZfJ
	 eyWHvuehIhxZRiAVsmG4nbVZ07ZiRNoo9bvfr1hHfBEnN4n4aAUUPDcbsGvKNAc58eDyy
	 i08wwJ4oXRzxywpcK7vhYX/bIkKIpLsrj1ZJpki9uix+rAR+KfSuyNtYAI/u2x02L6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MK9YW4kr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.31
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013031.outbound.protection.outlook.com [40.93.196.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2948606A333
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 19:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2948606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MK9YW4kr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=or8pV7geCnykLM5WOZ9iwNgxkw/cOq9nER3H9jO5RgPACg2G1iUXHllso2nOJfgm7lI4OT/rZC20MRmSckbkDrTzbftFKPsIWjPsTvpCQms04v7T7rvPRLhC97i7MjItbD14tvlteys7YeCEr7GRGVklv0mPm6y6l7FbH9YkOZjjMg24BcfFI8G1aa3O2uvDoSmzqRSwmPnIxrc9xG0Dx7ySLMB8wsE9ovnHzoKqmCEU23OfmTdhk7owXyAMYXJHs/Y22LAJrL0AsQr4g2tnNbdO1gKpDHKp0kUjxky8pGWjnyg1/8ss9Rtyzoo9Z0YdLahsevR4BWthPOnJzjDGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af/5dapHzgjrtsNRnlqlwo8RtPwALRlfK6OOSSiluzI=;
 b=GXUu9meWNSgI7sa0E3SzLYHF1Cpw0LXlWc47SMY/OqyLg/MJRde1RhIfVkyTiIohfdHBfq76Dtk8I9Oj6mUZwAf6mcPq2b9wnPljH/TpAnsohCWnHVi72pG9pWKfDRFcQiS0mzPBcOtXML6roo1+bmAIjx2+hm4aaDMJYqMl3BwFgMcgnp7l8sA3gMG2qm8adZ5olO9kMovs5AcSNHqlxWfYoo9LnOvrHHDnja8VtqzsR7TKiJOezs7OUmNjI2j38minTFuQL9U5L6ezwdfGgRCmfiQbCq6+u+TM0VVXASxz+KBEjwUG9wKr8x3k0hd9F3oVUedSliUt2rs9Sg3UKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af/5dapHzgjrtsNRnlqlwo8RtPwALRlfK6OOSSiluzI=;
 b=MK9YW4kryZiO+IL6FFjhZDoI7CDfqXmDV+rEvCXzUui3t2V969L8L3z76fjP29Jj5U1ZWrFwTCl8DbP+n7YQMKS2ARMLLl+ZXetKe57NVAZNcXlEplvwiTi238yO/jEQYaJccHx36Ay3bUuJ11VOz8K0JvaenSuJGyi0WWTNPCI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 19:52:39 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 19:52:38 +0000
Message-ID: <e728d918-39d7-47a0-ae94-e85c34d98b4c@amd.com>
Date: Tue, 24 Nov 2026 01:25:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 20/24] soundwire: amd: fix interrupt gate and work
 drain ordering in PM ops
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Venkata prasad Potturu <venkataprasad.potturu@amd.com>, Poojitha.N@amd.com
References: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
 <20261123170520.1380924-21-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-229759@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-229759@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::9) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|MW4PR12MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 7834b942-cba5-40da-2f68-08df499b5383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|56012099006|11063799006|5023799004|261022105027099003|261021123027099003|261026121527099003|261021121427099003|261026140227099003|261102123227099003|261028144727099003|261009223027099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	D8Ph4YslIU7HGHYC1ZjZccdm0wnUhmzMS9mreIIK5y0IRd501MroLwv6T97vkZK2AN6Fis7AFl7BaJwx2NOcdifQwvHOq78CC7vrKyBWZHWND+M8LZYyUUZ0hPadrSXqvOfM35DiWvGrfxUkwKt1DXv+FJ0Xj45Icw4b+eW3o5b4T7mJQb6c+YuppSvVvPLmT2dJgWFB1elTJggLio8QJRKlELckt7QXdE4tUdnTcXqhvgPw65X5jq0c4sRSMOP18WIdgBD2rJ5pGriNq1EeZwCWaxpSldZXAXkEI/jYTDPQ5VmzuuRKZlPttQxKTqsgIPdWvuyHiIhJ5rlflP+wVgpgjPVJEsFs7tBe3Sldk2Mc6SPgEFwtc0G5wTPqv+cfE1Y4GNm3uNpfZaPIP+h7ew1vWnsT2VwHAkip4uZgRfgxABzIVjdn2oXEmIKOVcWR9DdY1DNuxCvDbXeYCnNnCTfivrIDkA5Tsgcusz6F3oXhfqpoIMqhjZX7SaGvIfYsOuXObPAPIdYe8+2JwkPKjuMI/aB78hk0aZJfbogbXg7S1hNce1xVNVrdi9KwMPAgK77YeN7hGVH2DwTF7MQItgGTaVW5pH5AA44JbPYfNSzEoXdpvWEqo6AOhQ77VQVoY+vLlx+yrurU8Y+0yl3ERvfecBvgwC1E/iv6wgligE4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(5023799004)(261022105027099003)(261021123027099003)(261026121527099003)(261021121427099003)(261026140227099003)(261102123227099003)(261028144727099003)(261009223027099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEtGRmlISDhjY2sweUY5bG4zb0JMTW1vRXBBcWFPNW9JSmJiaFlPZzY5bEI1?=
 =?utf-8?B?K0pia0xDMFFHNldLN1RYcGZpSDZaaitoR2JJdHpZODBzei96aVM3VFNpMDVH?=
 =?utf-8?B?NUJaYk44TnRzRkxGTU04VjRLTzd1VlcxREdOSEQ2OEtKUzVhbGJxeUdtdzk5?=
 =?utf-8?B?ZVd1N1FPdzdCM1lqRVhxWWZnaTRvSU9IYk9TaTduWnBwbDZQRnF1WGdsc3F2?=
 =?utf-8?B?aS9hNjQ5Yk1SZU5US0tKb0ZLQmQ1THdEZEgreWFBRXAwS2R1VjZIcHUyUXBk?=
 =?utf-8?B?RTR6d3JpT2FXcTdlZXhPNm4vdHJzYVF5TUlXSXRHbWRoeWMzZG9KTzBZMDBQ?=
 =?utf-8?B?RHRJTUxlQ1JVZ2dDRXRhcExKdG83Q3BUeWhSK0RsRVQvN0FUazZLWHFkcEh5?=
 =?utf-8?B?MWpmbXpMV1NZTGZVQWtiNGhjTjJVQm4wUURnTWltRUxldVR2Unk2WTR0SWE4?=
 =?utf-8?B?cHU1bU9IVnRIV3B6RExKMW83WVV2eUIzWTFkQnJieTNkRnE2cTF2MU90Nito?=
 =?utf-8?B?YUp4MTNwdWhmb1FHRFlwZWQwSE1pWUpZdUJyQTkwbnQxWEgxV0FtaWw1Ym5o?=
 =?utf-8?B?NU82K0dVdnd0WnhzQitkbEhqcjJvQXlUYndoVTZ1N1hlRjdSMkdLT1M5REZK?=
 =?utf-8?B?UzFTSG44Q1c2SHFzK2w2UXlYSG9Sbmcxc1VocVpZS1ZMTkZQalkzYzVVMDla?=
 =?utf-8?B?YUFsUExUNG1FZTB5YUxvbDNicWhVZzQxUVRnaU4rM3NTRmR5MDhlYzRQbWJn?=
 =?utf-8?B?WDExY3c5bFptSUFkWjdOOVg0aGJ1Tk03QW8xSmZoZTJmWkdENkR4dVYxSG45?=
 =?utf-8?B?czZta3hXRzVRR2ZIQ0xodThlV0FiY1VvUGo1cVlzbmRiQzhnOC9kWXBkTUFZ?=
 =?utf-8?B?ZDdDSEZqT0FOMHhJVWdhSkc4KzN6WnR6UXdMRWpCcjdva3crTFU0Q20xK1pj?=
 =?utf-8?B?SlFvaEJyUHZVZ2xkb0FSNm43VGxWRHVvK1JDM1JpeDRTZ2YxbGFkTjZVSFll?=
 =?utf-8?B?cVNrOEdSbDB3NDZpTmFobjhCM2dBd0t5Nml6Mm9UeE1LcndUcFg0SnVBVHBv?=
 =?utf-8?B?Z1kzb3MrUEl0RVQ5dGdreEVGWW1nVjhrVkd2UVlZVEJZSkpSQmRpd1pCeUlI?=
 =?utf-8?B?OUs1ekJIVDFUMjJ0K0hqcDBFRzNLN05UUXFLZk5YNzRMR3lKWlduOFp1eisz?=
 =?utf-8?B?aW5nQjlvSFo0bUNXc3JrUzl5UG9DOG9NQUVZNGpzTGZlaFNvTmFNUU16b0Yy?=
 =?utf-8?B?ZXNaZFNCb1RTYTU3YlVtZmlqaFFZMFk2c3N3TGVjNER5UnR1dllQVzNxaU1G?=
 =?utf-8?B?SjcwdXZWMmR0eFBSejNtMUp4aWlLQVFhNXphSWMxM3p5bGJTTndJWG5WNFE4?=
 =?utf-8?B?SHNkOHZBWUU2dTJUdzB5V080MElxb1ZTa1dTUllNQUpEQjQzeVNqR1M4eU92?=
 =?utf-8?B?VkVqM3EyWkozNUsxUmNhS29qRDQ1SDhzcVNHamVkQmQzb3hRSEtkb3Q1bTE3?=
 =?utf-8?B?TGFoNDlvYWlkQVFUZ0k4Q2tnak1oL09CMitiYnA5VkxMMWtXR3NBMzFXTFFH?=
 =?utf-8?B?L2FyaXBPK0ZKWUJNYmFrcTJkVldIZlJDbEN1Qm9lY1Z0WnRXQXBpYisrdG41?=
 =?utf-8?B?TlplWUtIK21SMXZLYldKYllDdkY0RGNuUnRxL3czZGRlUTQ1di8zMGNSOExv?=
 =?utf-8?B?bDlKcityQkp2cExXN2pKeFlhcEd6Q2tLeUUrdURmbEsyRmNVTVFSN3hSNlVY?=
 =?utf-8?B?MWc0bytIbVp0WjJsWlp0YnJKNmE1SUhrYTJtTktGVkNyangvek5lK2hxTnda?=
 =?utf-8?B?Y2NmK1E3eDVrOUtoeVFxcjNPdTQvVXFKVU5iVUZ3ZEwwaGJ0TkZTZXhRNVdU?=
 =?utf-8?B?K0M1RFp3amo4TEdPT1ovcVY5eE0xRWJ0bEhsTTMyWFErOFhmTFlhSktPZzJa?=
 =?utf-8?B?VnZJMGhudS91b1RONXo1S1lTMi9XMHpiUnZKL0luaE1SK3VtOWdkRHBuZWF4?=
 =?utf-8?B?UDhOVHByS2cybWJsSlY4bnVQbUNZS25LUFlrTUlNbTd1NmlEamREMlpubGVE?=
 =?utf-8?B?cmNVZ003Y3R5UUZUQWVIeWdFRHI3NzFwS2ljUGVhTUFWcEZGQldqSHV1dHkx?=
 =?utf-8?B?TmFDWld2dkpDc0U4dmttUkx0YVNPcWtLaEZMRlV4TmV5UitDSXJLbXpmZUZY?=
 =?utf-8?B?WVlMdjR6Qk9WQ0FjbXA5ZTM4ZFZ4WE9YWDQ0UWlnY0Ywa1BZNDgySkRVVi9L?=
 =?utf-8?B?SERmdGhNbWJmZElUdXBCVkgrQ2dLY20rTXg4VjhoaFg3b3RGK3FFZjRtTFZJ?=
 =?utf-8?B?YytDdVpyQkgyeTZBWkhTemtpM3oyVUtldVVmbjZJODFoUERhYWVuUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7834b942-cba5-40da-2f68-08df499b5383
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 19:52:38.4898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLX0wBLEdowUWl7UJq4HWBGqdnLj/D29oWYqWvl1OWoYet096+BJGh8G2LyxsvBYJu1x8jockv20NfupYuy9rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825

On 23/11/26 23:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] soundwire: amd: draining amd_sdw_work re-unmasks IRQs in
>   POWER_OFF_MODE
> --
>
> commit eb9a0322b337ad61ced64ca897101c35c70d2a33
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: fix interrupt gate and work drain ordering in PM ops
>
> This commit disables SoundWire interrupts and drains amd_sdw_irq_thread
> and amd_sdw_work before stopping the clock in amd_suspend() and
> amd_suspend_runtime().
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 54f337e22b03a..862ca8cf575b5 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1449,17 +1449,20 @@ static int __maybe_unused amd_suspend(struct device *dev)
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
>>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
>> +		amd_disable_sdw_interrupts(amd_manager);
>> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>>  		cancel_work_sync(&amd_manager->amd_sdw_work);
>> -		amd_sdw_wake_enable(amd_manager, false);
>>  		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
>>  		if (ret)
>>  			return ret;
>> @@ -1470,7 +1473,6 @@ static int __maybe_unused amd_suspend(struct device *dev)
>>  		ret = amd_sdw_clock_stop(amd_manager);
>>  		if (ret)
>>  			return ret;
>> -		amd_disable_sdw_interrupts(amd_manager);
>>  		ret = amd_disable_sdw_manager(amd_manager);
>>  		if (ret)
>>  			return ret;
>> @@ -1510,18 +1512,24 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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
>>  		ret = amd_sdw_clock_stop(amd_manager);
>>  		if (ret)
>>  			return ret;
>> -		amd_disable_sdw_interrupts(amd_manager);
>>  		ret = amd_disable_sdw_manager(amd_manager);
>>  		if (ret)
>>  			return ret;
> [Severity: Medium]
> Can moving amd_disable_sdw_interrupts() before cancel_work_sync() in
> AMD_SDW_POWER_OFF_MODE leave ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and
> ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 unmasked after amd_sdw_work drains?
++

No change required. As noted in the V7 reply, ACP_EXTERNAL_INTR_CNTL
is the top-level delivery gate and remains closed for the full
POWER_OFF_MODE suspend sequence, so stale MASK values from an
in-flight amd_sdw_update_slave_status_work() cannot trigger an
interrupt.
 
For ACP6.3 with wake_en_mask set, ACP_EXTERNAL_INTR_CNTL is
re-opened in the wake block after amd_sdw_clock_stop() has already
run. With the SoundWire link clock stopped, the hardware cannot assert
any state-change interrupt: there is no bus activity and no
enumeration sequence. The wake block also explicitly clears both
STATUS registers before re-opening the gate:

  writel(0x00, ACP_SW_STATE_CHANGE_STATUS_8TO11);

  writel(0x00, ACP_SW_STATE_CHANGE_STATUS_0TO7);

  ...

  amd_updatel(..., ACP_EXTERNAL_INTR_CNTL(...), val, val);
 
At the point the gate opens, STATUS == 0. With the clock stopped,
hardware has no path to set state-change STATUS bits in D3, so
(STATUS & MASK) stays 0 for all state-change bits regardless of
the MASK register values. 
False positive.
 
>
> CPU0                                kworker
> amd_suspend_runtime()               amd_sdw_update_slave_status_work()
>   amd_disable_sdw_interrupts()
>     writel(0, ..._MASK_0TO7)
>     writel(0, ..._MASK_8TO11)
>   cancel_work_sync(&amd_sdw_work)
>                                       if (status[0] == SDW_SLAVE_ATTACHED)
>                                         writel(AMD_SDW_IRQ_MASK_0TO7, ...)
>                                         writel(AMD_SDW_IRQ_MASK_8TO11, ...)
>   ...
>   amd_sdw_wake_enable(..., true)
>     /* RMW preserves 0x000c7777 */
>   /* ACP63: re-enables ACP_EXTERNAL_INTR_CNTL */
>                                     <-- state-change IRQs unmasked in D3
>
> As noted in amd_disable_sdw_interrupts(), an in-flight
> amd_sdw_update_slave_status_work() on the SDW_SLAVE_ATTACHED path rewrites
> both status mask registers before cancel_work_sync(&amd_manager->amd_sdw_work)
> returns.  The comment in amd_disable_sdw_interrupts() assumes this is safe
> because ACP_EXTERNAL_INTR_CNTL remains closed, and in AMD_SDW_CLK_STOP_MODE
> amd_enable_sdw_interrupts() overwrites the masks anyway.
>
> In AMD_SDW_POWER_OFF_MODE, however, removing the post-clock-stop
> amd_disable_sdw_interrupts() call means nothing re-zeroes the mask
> registers after amd_sdw_work finishes.  In amd_suspend_runtime(),
> amd_sdw_wake_enable() then does a read-modify-write on
> ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 that preserves AMD_SDW_IRQ_MASK_8TO11
> alongside AMD_SDW_WAKE_INTR_MASK, and on ACP63_PCI_REV_ID with
> wake_en_mask set, the driver sets interrupt_enabled = true and re-opens
> ACP_EXTERNAL_INTR_CNTL while all peripheral state-change and PREQ masks
> are still enabled with the manager powered off.
>
> Zeroing ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and
> ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 again after
> cancel_work_sync(&amd_manager->amd_sdw_work) in the POWER_OFF_MODE paths
> would ensure only the wake interrupt is unmasked.
>

