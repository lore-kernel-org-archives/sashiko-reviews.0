Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED352345EA4
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 05:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788672987; cv=fail; b=T2DqA+HaPHDlVisKGJMg/2rQBp/gA9arNhDdD3VI7/V4bKElO/HoWMZ9fBDcijo4ymbMMftZ4EtxK5a7qgWdjNVT5iqgib7cDLnQAStcPMqWozeF/MZ2+GKuCpk/w9su67+PrJ8T36DImPcW/3WoNV1JoK0XQci8JIFbpJXHkP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788672987; c=relaxed/simple;
	bh=JIXP6C2h662c+YhgG/kzSBZME7BZwhw3uszH/dyTr80=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mGMlT+h6u4NZEGRPj6DcSuy95ASZcX2ClW+St0MfAgPOx13qcwSsUEAiBd41F14NYZHi802WqqKuTWjOKWVhdOXdt8KGLgUMRfnRYr/jN2V0dgUaPOrMWGY8S/ivjUAz0YZPqxXYmwdHjOhTDJjnRRPCt+7wzGlhNwtpgw6Faag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGr+WR/z; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGr+WR/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788672985; x=1820208985;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JIXP6C2h662c+YhgG/kzSBZME7BZwhw3uszH/dyTr80=;
  b=SGr+WR/zf7T0FFATvaBGSkZBTH26EesCm4gDgQolh1viHLkw6x8k3uWi
   TlnorU2YGb74uUJvKKk8bJ/wovy6HWyKPEZemCOLEWn7keIx3nw5mvu9b
   cR9TODX9LtlPmzQ5YIVQUHcFI/vjAr5YB7vRXWn53UZfd14u1RUBek8Jl
   0Ll6w4hOfnVhMUjkBotU/FKzaOIeX5vaZG440QOHLrJ1RZFYjUVTImXx+
   B0eQGh1iPZeZZ0lSLdLvGwIQxphePlBRCZPwUpERaty8nvuFllAwSRLqi
   2JP7WNOllH+o7QxI1riaxXzXA0oyvDhhGqWi5tF/M7cvh6Cpq9URWy5aM
   Q==;
X-CSE-ConnectionGUID: NQDj39PyTjuzaUrdf+Zg6A==
X-CSE-MsgGUID: Tbl3kloxScCKy0WcxovG4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="100635018"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="100635018"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 22:36:24 -0700
X-CSE-ConnectionGUID: Yg8xKVIrTqWUXikmsM9IKQ==
X-CSE-MsgGUID: A1YVozbGTgOyzD17SagjUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="269096883"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 22:36:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 22:36:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 5 Sep 2026 22:36:23 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 22:36:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQvhTKQQJOMkpurz9U0CeI5njbJEaQoluSDKC1y/UdC3EJNJTWdYe2D5EVpirGczos9GFEVNjvODpmprd8wl8wQG6/rWptsryyYLxTBswY1EBcjyaPdWhnCxF/tjZ7mUagB3YsKtTQfexKus8XI+NzA2e7Lqh/T1G4ov7lLosOqo7rariENZ+mIbBMvEk/uJMIZfu+i04NcKR4ZAIJEWpy1SNOnzgb4lp95PKq0GvMvsjqb1f7pDDM+N/pOcgceNMvgRugpqgQaCz6pVrIuGegmzjDSKawt5H9QsiHvSov4YODNtBEXyj4zjAgq0+0Y7AAFb5awlbB2y3HF9bgLvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRVNOnarO3qG0125K6/qUyE1sbJfAfftwErCqlZWTc0=;
 b=qt9/if7T5zLfeQG4LwpSU08530E+OAaRF7e1s4HkWhpfUbdm+ByCEykZuqqBfafQnN0pCMY55HYYwtK2qlZxhAWZxxQtcuWj2ZhDFcCgOYGu4qwEZYriUZNbEaYUXcdzqdzS0GXTRWiXDuzK4I9cfhD36zsDg1umu79YUFdyFJB/0CjwZ8XsAu5wiotwezWzaCR7Cm7EwpEvhoY6uQFcrHBg8esjezEVQNGa4p13S2ToLxFarjufLknnWzFieLbfLiMvvueEDnCr3LyT3IWzRIEVAjmQB+E7bp2TR7sP7RLH64btpVy11SgpcDug1PoagttCgYyFgA2Vnp2exoj0tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS0PPFB53330162.namprd11.prod.outlook.com (2603:10b6:f:fc02::50b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 05:36:20 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0382.012; Sun, 6 Sep 2026
 05:36:20 +0000
Message-ID: <5e0bdf20-add6-4405-9779-8f1a283d844a@intel.com>
Date: Sun, 6 Sep 2026 11:06:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] drm/xe/cper: Add CPER structures and trace event
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-16-badal.nilawar@intel.com>
 <20260825175107.93D371F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260825175107.93D371F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0228.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::7) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS0PPFB53330162:EE_
X-MS-Office365-Filtering-Correlation-Id: c089ab89-10a2-45a7-9ef2-08df0bd8c78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|3023799007|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: yyP8PTJl372x9GGuMFqUypTfH5AcxErAt8BvXpHvMp0vlUMzGph0soa43nvm1J24pNYsBoJtF6w1uaLQq1jb199/Ud5NHbT91AMArkNJg9tw/0zu6V+qaIUulgPjLsKW3XtnxNHDzLgWLqMBfdcwybi5osqiDOP1dvcSgYRsEfUvgNUKGz6PNUS3CfVGGR7aSF5oib4zLphC2Lk1v3i7O79geyxt/fP4BmFc+NT7VRQM1Jay6odKk7FFiE5+svLrf41Yfeiq0/ESkExTgoSj9FMr72aheciSya3Uj4LQu9K++dPziJYrfLqQPfW/FQ4Yf8DMcPkfkZn5D1emHzw06sr6r7kiHEcV6l3ftiNkHrGX7nKgU8AzkD0dB3r6S9/GKhL6DpFyuf6AH7BWmsUnsniFm1QbZacTeRIEib5raA2/G5u8Nbe7YOssSEMzNbBI2GGTVr2rFfTvbRkAjqxctbir3Y1Q16K+EAWjuaOMXXnF/pyGIhcbyQ5VtyKLUjK6Tty+98ITikMcrRmJNB+CbnRJBX+DlgqpElFKiEq5NkzaO4u55Pw4wVQ5360hJmkCQr5zJneL8e4nFhU0KmAo250fI5xpNTID/aXJM6Fw3OmEHbhR/5zr5DTH9pZPsyAf4bUfCqp/gwcRLKapwXzULhjciauGJsUT3i7iTMY/CoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR11MB9792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajUvSVpXY2hJL1BKOGtVRW5Wb3hSZFpqTXBYSFhPdWhuT2NhUmhOSGdwMTBR?=
 =?utf-8?B?MVBYbnBmRW93dXhCT3FuenIrVUNlSnp2Z2JMcmhwZzd3NjJlOE5pbFBWczVF?=
 =?utf-8?B?RmE1ZGVHdnE5anRUZU5JV0pudllIdzRENm9wSlMyckZqa2hIOTlUKy9yek1Y?=
 =?utf-8?B?YjBNLzQwamthMkJGaFRkYTFDdm5uT0x5QUI4Slk5NVUzRGp5RmpYTE13QU9T?=
 =?utf-8?B?N3k2MVMvMi9EcE8yZDdCMVhwZWw3SXVMb0htWVROVk41cStTLzhFWi9MUVNG?=
 =?utf-8?B?cFd2amRmU0J0MlVJWDY2b0lxV0lvZzdMTTgzS1dtOThzVFZMaHoxNHI0THBt?=
 =?utf-8?B?bVVTS2FNMEx1NVFsamdOYkFRM2xpU0ZYQnYxVHQzakZyRnJ0RVJQby9LeDdY?=
 =?utf-8?B?V00xNkd1U0lDaExSVFd4bnhtVDZ0aHd2RDJtSUdJMEt3QnpMdFBVLyt6TEpT?=
 =?utf-8?B?dHFZRGJVNXRnUWg1aER0Yi9WeHBWamp4dGdIcHdZRlFYeTcvN3JjT1RQWUJX?=
 =?utf-8?B?MFVOQnNrb1FFamZ6Wi9YOC9iMlVPMGRLRmlxcXA2b29HU09HQWllL2pSN0ZG?=
 =?utf-8?B?K3lCdkZCSHNDV01SM1Q2UlRmTUtiYTJoRjhmaVBmc1Q4TDN6T2pBc1ZuZXpF?=
 =?utf-8?B?N1dCaUt2ZnUreFdSR3luelViQXMyUnh2WUtaVVBJczBxYUF1c3lYby9iaHdH?=
 =?utf-8?B?eUx3VHZHMHZ5aG9OVkN0c253Wk1VWk5ZM0QwN1hkNHZXZlgwYU9SWXZ3enNP?=
 =?utf-8?B?Q1ZES29Hbnd3d1dxNUszdkR4YndrT1pDMEMvZWQ2YVB0cG5CaTdwWW1rRVc1?=
 =?utf-8?B?RmpsVGEzUU1aelYzVWpPdDdNQmxTZzR4Z25YRG5RZDAvOEhCMFY0cHRZLyt4?=
 =?utf-8?B?VCsrdEtQVFpZaUgvRHN1SHFtTkpRV3NVQWNwUlIzWDVmK1Vmams5dVJkMzIv?=
 =?utf-8?B?RndUR0gwMWlxTkdaTmhOelNaRThyWFRDcDdYNkk4SWpPcGNvdzhvVGplYnFM?=
 =?utf-8?B?djlpQWdEQVZLdUcrUXFWTVEzbjREcy9TOThPcmhlNnIxbTBjRmFlT0pURUVQ?=
 =?utf-8?B?Tm9sbEN1Rzl0RFRYRERUVXorV1B6MDMvMDNwZ2xmS0IraEI2TGJPQ29PWFk3?=
 =?utf-8?B?V0QzR1k4NHNTT3d1aWhwc2Vwa25SVGlDNGRMTzNrcUs5MmxwTzNoWXZWYVpw?=
 =?utf-8?B?VTBYS0ZFZW0xejdJa3Z3bVY2L08zd3p1dFdpMlIwWW9qVEVJN0plZWw1b0JQ?=
 =?utf-8?B?MnZaczFiaGlKWnUwdXlzdHlJSitnMHZpaVJVRzNrQjdxaTdvOHNLSHkxY2ky?=
 =?utf-8?B?TnI4M0xlY1R4amZQVU9QWUs4UW82MWxXRkpxMkJLekp6VW5kdVpGblZsT0V0?=
 =?utf-8?B?QkhBNEN4NEJQQVhCM2lnOWo3ODAxYXRWOWJ5ODVLNHhRM2U3V2xmOFU3LzZx?=
 =?utf-8?B?eEZIeW1EbXUzajNBVWJYbGVodmZuMkxWaGdIV2c2c2FMSUxsNTBkQysySEtO?=
 =?utf-8?B?N0lqQWQzb1c4eEk4dTZJUDd5TU4vdkFlL3lERjJiVHRvOVA4dDlJWS9WMTht?=
 =?utf-8?B?TmJNNVQyc0RBakVESGhZKytDMk1Ib2ZYa1lQeXJiNEdCNC81MmJ0dVNXT21r?=
 =?utf-8?B?L2p0RDRhc2dPdk42VGQ1THEySkpxemxJTzJXcmNkVUVORWNueTBBamVmRHdQ?=
 =?utf-8?B?VTFROElOdFoxazFrUTgyNjFWUmZXb3c0YVZmbEVLOCtmRURqM0J0ckY5NVlF?=
 =?utf-8?B?YVduUVBxZVhtNnIvelJINTV3N0F1anp0QXZ2U0tpWWlBV0dEaTlUa1FLS01P?=
 =?utf-8?B?Q3hLeWU5L3l4dzdRRk9BZ0M4UTQrR3NuakVWQnFmbGl2UUNxTFhYN1l6U1E3?=
 =?utf-8?B?QVdBRGR6eUptQmdIbXNHZzUyS1pPbGJIeGFCNGtUT25vMXFpTm9SY2dQSGdZ?=
 =?utf-8?B?ZTJEc3BOdVVqaFJVVzYrZUZHV2JRbExSRUkxakM0eFN1bHp4UWtiOFZNQTdM?=
 =?utf-8?B?Tkk5RmpZYitGaG52aEV1OGlRSnBiNTkwbTBId29NU3FZTnRYSnRSMmpsTFpz?=
 =?utf-8?B?QVl5OGFpa1Y3cnZhMjg1ZVlIV3dXSEhCVFpRNUh0QngwbUw0U1V2bUZ2bVdF?=
 =?utf-8?B?Z2VKU01aU0VyRGhhbjFrRUdrSFJkM0YwN0hrc3NybW5MajQ3bnVMSCtFc0VI?=
 =?utf-8?B?SjRWbWZjQ0l2QkljQ2RFOTRkTDdHUjdjQkVjT1E3YlBDZE1TeHRhYmw3QThS?=
 =?utf-8?B?Z2NqdlduY1JQdmxibEpsbHE3eVZPQmxyOStPVFNUS2dxR2FqdGhyWWJucjVr?=
 =?utf-8?B?d2hyTHpwUHpoRjk4Z1BrakNWWGEwN1BZcC91NWFvMG5pb3ZaaUlvdz09?=
X-Exchange-RoutingPolicyChecked: 4u5CELhAfuxW2FGqoc3ovNeq5aGuHkfEt4rWr8Q2+HpYrpdg12dqYjq40AkVmvwpRQa8A/HzZhAMcrQ62m/eKILCqUU0PyFh3UjNRbXVsT8sgxyh8TciVcJQRfbPJee2CXPuR414ZFQsC6p5gbJwcOlpl0aJeMQbssGQKhj2px/DaplRLJq1IY0gMgjHpZO/JaMpB0Rw8SfocXjmdeFsRBcEM5x6FFNu4LRsAeGjRFfefgJGVy4sXAG/mSwSY6feZzHZ7FAPd8K58bn4oSMm3yOgOaQi+PMkQA4kFiq2Yc91wm9KElSMIbsq5k5MybsZxJmYl85eEYki6skuUHTdKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c089ab89-10a2-45a7-9ef2-08df0bd8c78c
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 05:36:19.9398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nODcHilEiYdZ30P/3f2tfOM4GwKU+/jA4y3GVgxu7aEOjzp7Ht2ttgFpB5X+fYt6a5iUM0I37xjnetWOlzIVuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPFB53330162
X-OriginatorOrg: intel.com


On 25-08-2026 23:21, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] CPER structures use native integer types and C bitfields for a standardized external binary format, causing ABI corruption on non-little-endian architectures.
> - [Medium] Tracepoint uses `%pU` to print `guid_t` fields, incorrectly formatting them as big-endian.
> --
>
> commit ad510a6c4b7008ac7d33a168936259e5f8400da7
> Author: Badal Nilawar <badal.nilawar@intel.com>
>
> drm/xe/cper: Add CPER structures and trace event
>
> Define packed data structures and Intel-specific GUID macros needed
> to build Intel GPU CPER (Common Platform Error Record) non-standard
> records.
>
>> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
>> new file mode 100644
>> index 0000000000000..82167ea4eb161
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> [ ... ]
>> +struct xe_cper_sec_intel_err_hdr {
>> +	/** @error_class: Error classification (type, component, location, cause) */
>> +	union {
>> +		struct {
>> +			/** @error_class.error_type: RAS error severity */
>> +			u8  error_type;
>> +			/** @error_class.error_component: IP block that raised the error */
>> +			u8  error_component;
>> +			/** @error_class.tile: Tile number */
>> +			u8  tile;
>> +			/** @error_class.instance: Instance within the tile */
>> +			u32 instance;
>> +			/** @error_class.cause: Error cause code */
>> +			u32 cause;
>> +			/** @error_class.reserved: Reserved, must be zero */
>> +			u8  reserved;
>> +		} error_class;
>> +		/** @class: Raw byte view of the error class */
>> +		u8 class[12];
>> +	};
>> +	/** @first_timestamp: Timestamp of the first occurrence of this error class */
>> +	u64 first_timestamp;
> [Severity: Medium]
> Can this native u64 type break the CPER binary layout on big-endian
> architectures?
This timestamp is reported by firmware, represents ticks since boot.
>
> The CPER standard dictates a strict binary layout and requires multi-byte fields
> to be little-endian. Using architecture-dependent native integer types like u64
> causes the struct's binary representation to vary based on host endianness,
> which can produce corrupted CPER records on big-endian architectures.
>
> Should this use explicitly sized and endian-specific types like __le64?
>
>> +	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
>> +	u32 sig_id;
>> +	/** @error_count: Number of times this error has been observed */
>> +	u32 error_count;
>> +	/** @valid_bits: Bitmask indicating which header fields are populated */
>> +	union {
>> +		struct {
>> +			/** @valid_bits.location: @error_class field is valid */
>> +			u16 location		: 1;
> [Severity: Medium]
> Will this compiler-dependent bitfield cause ABI corruption?
>
> Since bitfield layout is compiler- and architecture-dependent, it breaks the
> exact bit-level binary layout required for the CPER standard.
>
> Should this be handled with standard bitwise operations instead?
This will be taken care in next rev
>
> [ ... ]
>> diff --git a/drivers/gpu/drm/xe/xe_trace_cper.h b/drivers/gpu/drm/xe/xe_trace_cper.h
>> new file mode 100644
>> index 0000000000000..6d2dbf5048884
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_trace_cper.h
> [ ... ]
>> +	TP_printk("dev=%s severity=%d platform_id=%pU fru_id=%pU "
> [Severity: Medium]
> Does this tracepoint format guid_t fields incorrectly?
>
> The printk format specifier %pU defaults to %pUb, which formats UUIDs in
> big-endian byte order (RFC 4122). However, guid_t represents little-endian
> UUIDs.
>
> Using %pU instead of %pUl causes the first three components of the GUID to be
> incorrectly byte-swapped in the trace output, presenting a corrupted GUID to
> userspace consumers.

This is expected, followed the non_standard_event from 
include/ras/ras_event.h

Thanks,
Badal

>
>> +		"intel_err_hdr_raw=%s cper_len=%u cper_raw=%s",
>> +		__get_str(dev), __entry->sev,
>> +		__entry->platform_id, __entry->fru_id,
>> +		__print_hex(__entry->ihdr_raw,
>> +		    sizeof(struct xe_cper_sec_intel_err_hdr)),
>> +		__entry->cper_len,
>> +		__print_hex(__get_dynamic_array(cper),
>> +		    __entry->cper_len))
>> +);
