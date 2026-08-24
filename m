Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B16E1E8332
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 14:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581839; cv=fail; b=MPecaQ9TefDxelEG/BFZG52fFby2gBlL0uI2mTDULnSzTBrC9XeOw3+SKFibrOdplD/T9ZW60yrU+Ewp2/8py+bitlLBKzd9sCzdrKP0a/RXp77yzNF8Y2e204t00lBIaeUK0b0Pf4ODvw3J/2VqgSptc2NDeDC1MYVU2c13oXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581839; c=relaxed/simple;
	bh=13vUg0ZMmAFURjjemyVGSqdidqi/QSs9WB3fiqngLHE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AwVB3z+R2SGVFaq/0cwqZ+AD1m4Wg2g2aOSuYCcdl6MJ96Pg531ZWCYXu8jhVnlhi/GSwvz0M3AJQDB5CfG1Mp989k+CyScQYDJyknQkZMIGw6cnpdqDOis4eLYPeZ18m8QCLQXMKiGlR2iU8tkVa83sVkUm3XfwOeyGhIji3II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkBCAtcG; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkBCAtcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787581838; x=1819117838;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=13vUg0ZMmAFURjjemyVGSqdidqi/QSs9WB3fiqngLHE=;
  b=jkBCAtcGykLsyV0c/eOtoZaEvjiFQmwgnq1HRGvOehxFk7DaSUBz672W
   MjPKM7aDf5LXoTdF6aMmUfegRaOXC71BoD98VmA4QdgqJjqB3MmUYCUGu
   cV+XRgpynctQ2HTKkMbBKRoIhiFCgEmm6HjjN+Zq8z5GGs/IgaNV2Pp83
   bbe8oUUkFg+A/Nuu9OzJ+8LX6hICypnG2Af3jdmacEn5N2jyFbSnrLwra
   yVO1BNzcUjeE6BvfYsffg8gz4IuAayXl+QWaeK5HCbCtcQWoVGhMc6iY0
   9abg/2AV6LM7WtTkeTBQjDkjsEye6x8g6sBktqu4CJXvfUUTLJmA1ctgN
   Q==;
X-CSE-ConnectionGUID: yAkdFetpRciS1USY4GBPwQ==
X-CSE-MsgGUID: eOR6ecpaQdKFw/BLv5jZEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91903639"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91903639"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 07:30:38 -0700
X-CSE-ConnectionGUID: xSSnT3fvTRSX9OkecqeD6w==
X-CSE-MsgGUID: AAb4rrNGQry0tpgbnUC8Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="296918773"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 07:30:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 07:30:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 07:30:37 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.36)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 07:30:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJQa+Cgk+P7XpD6KH70vRE0W5WZ1l1EQpObJWJAe5+vYLLVxMuASo1q6d0LFO20qwKOII1vFkNZK6lk8V6m7PLdNoJfh0Lb6EgcTYq4yCrTzfT0iNmtGP9VwRJLVOpT9h4er+v54BR7BOboAsWqTAgeMk3QNa/J1o3gtSqFMVFFIaxvhD3aJST1A3nrYaVobiSi1dmDxJfNxtjm+Si7YJJLj7meTY02KjGUrsALlpFRqP2wLjauK77NdqJMc+bVImIGStOC0xLVO6gJ3gz34sr3PMhpNSHC3Vc5dDyRUgBgSwg3g6jSpPwtgqWUsuGuJI/bxdqlOmNBmHlY0y3stxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdESGy1JnyqsAf7w7h1j1rVCoaJ/fYEVG47+A6wGAFQ=;
 b=WyXozdBvPSBPr59wv4eay+GJCBDlK8XmtP0EIdP6QHeigsTzQF2Hrv1ZSv/lYNPMdxm7K7aT3UqRFPIxCvi2kCZJ/OfQztbWLCqusnyl7ob4O5e6zHMTjPuUxCJncO96X9ia0B0frDK906ta4zNzohQGpMN5Ea4y3YVxgkRXg0BYBtYdolTbQEUFIRnx0MyzqIE+QgLL8qnoizaIzk5DKqRwZSf1DUgoDp9mqUlgZpzeARy3ay5saqK9djHx2FDmIxdZ3GfT4WU8pgQzpKFQdtrwIrpOJ982dnLjBWPLwaiowEwQwJU4VBHs8YLhtjusCSQ+ma4vaxnZb0SrXxnWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by DM3PPF6A4412A55.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 14:30:29 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 14:30:29 +0000
Message-ID: <45efbcf8-b598-463e-b415-dfee2a3afe66@intel.com>
Date: Mon, 24 Aug 2026 16:30:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/10] drm/xe: Introduce temporary device wedging
To: <sashiko-reviews@lists.linux.dev>, Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-9-raag.jadav@intel.com>
 <20260821113758.006681F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260821113758.006681F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0003.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::8) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|DM3PPF6A4412A55:EE_
X-MS-Office365-Filtering-Correlation-Id: e6814399-8905-4168-78ae-08df01ec3f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 9kKosDFNrwLjZp7VEtYH5IFG4CvYkMY0CpPdBBxSIBWL+OzzDoU6eULRV97TBTHekrce2rA0P6aRHGM8TTF6iZn75OKhP7ZdD/JRyD+I3zuAHWmGPB0/hB+Ffe76PnxUyhcIpm3v7J4kMKlhHbeo88W0Wi0huM23p4QM61DsPRhAl82OxnxtmPeCweP0XSYqaNXEhDs5MfEYSDHPSPubv/+xtQjl8afUNTRPzVA/c2ooJtW1RrlpYC3JQ//gAOp2bTELk1WDoOMfpjnHKJgguxy4tx8IsU6CYDntkYekfQyao3NxwE3e1ioB1rLtPvelc2gaFn7Lu8GOcQURzVUVXtO8mQQG4Ht0hUqC6DOuAVF6i3IzkR2hth4uk6yziLHL7MrkjJVIlamFAusT6wuRy3ksdFXj27MaEr8kxSamP+p6ZyW6+TjtCKhqrrDsrnfc9o+tOxqhstBVCUHk7hBdQ4J+PUTTJk66Vn9zKd7j19n8M7DSED733GKARvUuTPciuOGlj9VlUWLUHDoiQdmLWrgZckwSio+HXgmK0KjxOmzyD6ozz6CPgIjtUg/NabfZGnuSS5/lIhaM4yZZHPBoqAxNOO27enax+FpfsQ03vOY64hBcf9GvGan28IRuqpFT9g4FiVuJYe70Xchh4xTrrsQrna1xywbdGm2A0r0zP2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6195.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzR1SWZ4RW1vdHprNkNtbThSSEYrVjl4R2RMR1BjTGdUMUZsTVhmNi84NmRF?=
 =?utf-8?B?QzdGd3pjV3QwSDR3NldSN0lYM1ZFVDkra3pYZkY1T1UzVEt2cTJ5TzFlOHp1?=
 =?utf-8?B?Q1hjVUdXUmJ6WTlJQ3czRm5zcUlzWFpGTEY2RkJNMnZKN01rWm9DajF6MnY4?=
 =?utf-8?B?RlVUQkNRbkJmd1J1Y29DMncrWE5odEJ4QVJXc3RweXc1emtHbGovMk1SZmZp?=
 =?utf-8?B?b0lTNmUxTzcvSnJ4bjZJZGkxMXo2aFFXWkhEL3pKcS9TYjEvY1FmQWZZdUk3?=
 =?utf-8?B?VEJWdjdrc1hpbGJKY1ZkL1poV2wwMXptb1NQQ2N3SXVXQk5LbVhqbkFxZDE1?=
 =?utf-8?B?cEk0ZWlXNU0za3J6dzBnekErejJPZDNJU1dOeHduaTZTcGlpTGRRMWVLUXdo?=
 =?utf-8?B?S0RwZlQ1ck5JWk1yK3UrcW9QTUcxbDRRcDVKcXlISTFwUVVHdXdYYW9tVW13?=
 =?utf-8?B?YU1sdzVkYW9rQU9NbGtZT2RncTlLL2twTnNNYnRjT2dnN3E2c1AvcFVFNW8v?=
 =?utf-8?B?T2c3RW12WFhqcENxek1nUXNhTjVIbHRzTERzdVRVZXJPL051ZXhpa0pjYURL?=
 =?utf-8?B?Tmk4U3NLM3hZMjBMd1pJdUVxeGhaRGJxRUc4OUcyempuNUdXcTdUdG0xcUdR?=
 =?utf-8?B?SjlsdzVUMzY3RTlvQWhBaVVuamNOM1VSa1dYajVkbXgrNXFGZytDOFRYbXo1?=
 =?utf-8?B?YWl2Wk9TQWR6VVVTTlRMVTRrQ01acnlmV0U1ai9BYmRwMkE4aURudEhSYnh3?=
 =?utf-8?B?ZFdDR0svaXpCbW0vcTBqQlZCdUFuUkU3aCtrVXJPdWpYL0JENzIvOTB3NEEx?=
 =?utf-8?B?cExNN0laY1ZSdnE0ekpXZ0s3bHptVzA3SGh0aFNTcjMwMmQrVmlOdDhDVUhK?=
 =?utf-8?B?TnZZK2NRbTJySUpFVW51M0NiMzd0SEwza00yL0puems4WTBWbXhyK0I1R1lW?=
 =?utf-8?B?a2czSzZ2b09ydjZZeVc5K1A4enNNUlF3T1Z0cjZSTVlHRnFQcTNpd2YwRDg0?=
 =?utf-8?B?dUxUVzhCb1BUakRyQ09EVXFJam1LSjFSbnI3SWZNTE1Mc0lXalFiSEttZXY4?=
 =?utf-8?B?cmQ4bnNTT3NqZVJQMmpKa0ZwaUJYd3I1bU5FMjVYQWFmSmZwNFZPamtLcFp5?=
 =?utf-8?B?czM1M1RPSUFYQUF4RVZiV1Z6NlczOWdsTEs2a1dCTXJRWjBYY3lKOXJiQW42?=
 =?utf-8?B?UG9yM3o1dWVDVDg5dzRjOC9ZbE0yZFRoVVRwUDRNdVpVYzZ4ODgrTGE3S3J6?=
 =?utf-8?B?bVhWOFhaVFVLMmFZOXcyTHVrQ3ZaOS9JclVzUktQeVVSYXRRWi91WEpXaHVC?=
 =?utf-8?B?SFBLZUVCMFc1TWF3STJsSGcwQm1FZ2dVWDR6UjNvUmxBd0pGeWFQV3QzMlNO?=
 =?utf-8?B?TDZQWFJEdDF5K0ZNZWJFRW95eWp4MnNkVE1ZRWlFU29ZekQyeGZuSnFaSXFO?=
 =?utf-8?B?UksxbFBQVVFabnRsTHl0dXREVUk1RFJZWURFbitUaG5lM3N4MjFma3FBVUpK?=
 =?utf-8?B?N1YrYjhDQzVvaXVKZmNXQVlDa0hoL2sxTnFXZGROd0lYa1dDanMzTjBiRW9W?=
 =?utf-8?B?ZkpZMFduU0NlQTlaM0UydWtDZU9BL3V6RmpCWkUrbnQyZDFHVm1ReWZET0RI?=
 =?utf-8?B?MHVRNkRQNzhHa0x3NjNaZmtHRWVSSHdBQktSeEVNZkwzNlVpN1U4bVVjZWpG?=
 =?utf-8?B?UWJ1RUZkbFl3aFJ4ejBXbHF6eWw5T0lEMTVIR0wra1E5bDc3MDhiaTJOMzhJ?=
 =?utf-8?B?czVQREk5QjFVR1FiVFp3MnZHZTBwMTBLODNUWlBwaUFlMmJXS016Qnl0bjJz?=
 =?utf-8?B?aVdGcDVtTkZFQkYxNVRrQXg3a0hVWHZrN3FHcy9HcUpQZEE0dVlhOUVnSXJD?=
 =?utf-8?B?d0hPdktjSzEwelJNMnVDVTVWenp5b1dyUk5RRFVSdXZ1WG5nbyt0eFVJTWdR?=
 =?utf-8?B?VGlORUV1UkUvb01qT1FJcmp2WWwxOUtrYjFEcWlrWk5iWVlXUVZtWS9YN2Nu?=
 =?utf-8?B?UHU0SlhCTEV2enZ5RlFHWE5Vc0lhZEpYOUpiNi8rMStOUGVTUU54eW5YTC9J?=
 =?utf-8?B?SHQxOXJLZ3JuNTU0WGk4ZmFHTDcxRExVZ3pXdDBFWlpyb1plTnhFakJQeGdF?=
 =?utf-8?B?RWpINWRzQ2ZBU1VmTDlIdVhXMlF2OGFhNGNFdUhZcTJuaGFnZk9BdnArTVov?=
 =?utf-8?B?RjU3N1VFN1B2dUdJNldTbHdoK1BBUWh0N1A5V09FbmlNc0RFNHByRHVia2Nv?=
 =?utf-8?B?MC8rRTFJcEtLZ0VuQkJZSEdDeDNRQ1NIR3kvQldoaWZUM2JjQ3B5NHlHRlNV?=
 =?utf-8?B?bVBMOVB5RDBWVmx6aXVyUWVDOGR4bml3NUNnODFGU2syZFRsQUFLZz09?=
X-Exchange-RoutingPolicyChecked: De0ozRFLjstXMmxJdmczWKPwxvFcU71NxQRWrbJ2wSKmjXYxM5m/PfEhd7mOjwXNq7TKRH2MJYvdhx6d7YFJp+yL7KEZX+BFPdNsew7/xqU/R1kGknXU/3t6hgGGvy9J1N5RcnZpt5ExrsovaueoQDRd+6OIj/9K4+1DDmKaK5qU+nxtQH/8jmKhi0IUCfyVr3RNly/ItyOxfVw/525FO56JNMvDZy546ZfLcqsbxX7CeBx2VmJKccbxb8OyRF+gPgQrn4AGh2/ETs+E6lbHzORsdcN+Q1akN3lSA6aZuFUhRoVyrjF2KqY/V+zCtrBfXtzZo0/UwBHV5pBCc7AqAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e6814399-8905-4168-78ae-08df01ec3f1a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 14:30:29.4197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bR4lwPWT8w7gWeWtwg0uYDbuZtwEWuwzhxWI9DXUnrZcGpPh1A8tZ5kP+1qhZcRNjKJy++fxlGMUj8vWVqbg+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6A4412A55
X-OriginatorOrg: intel.com


On 8/21/2026 13:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] Sleeping in atomic context due to `mutex_lock()` in `xe_device_declare_wedged()`.

Already discussed, can be addressed in a follow-up series.

> - [High] Unprotected state modification and double-increment of `wedged.ref` in `prepare_device_for_reset()`.

Valid. It should be enough to just take the lock and check 
xe->wedged.perm before taking the reference.

> - [High] Temporary wedged state from PCI error recovery leaks PM reference and triggers teardown assert if recovery aborts.

It seems to be a false report. Reference is taken just before 
RESULT_RECOVERED.

Lukasz

> --
>
> --- Patch [8]: [PATCH v10 08/10] drm/xe: Introduce temporary device wedging ---
> commit 102094142d418b8de53397ac8e1fbe1c7ca46ae9
> Author: Raag Jadav <raag.jadav@intel.com>
>
> drm/xe: Introduce temporary device wedging
>
> This commit converts the boolean wedged flag to a reference count to allow
> temporary wedged states. It also introduces a perm flag for permanent
> wedging and a mutex to protect the wedged state transitions.
>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
> [ ... ]
>> @@ -1476,36 +1526,40 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>   		return;
>>   	}
>>   
>> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>> -		xe->needs_flr_on_fini = true;
>> -		xe_pm_runtime_get_noresume(xe);
>> +	mutex_lock(&xe->wedged.lock);
> [Severity: Critical]
> Can this cause a sleeping in atomic context panic?
>
> xe_device_declare_wedged() can be called from hard IRQ contexts, for
> example:
>
> xe_mert_irq_handler()
>    mert_handle_cat_error()
>      xe_device_declare_wedged()
>
> Since mutex_lock() can sleep, taking it here from an interrupt handler
> would lead to a scheduling while atomic regression.
>
> [ ... ]
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -25,8 +25,10 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
>>   	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, so acquire a runtime
>>   	 * pm reference to avoid underflow.
>>   	 */
>> -	if (!atomic_xchg(&xe->wedged.flag, 1))
>> -		xe_pm_runtime_get_noresume(xe);
>> +	xe_device_wedged_get(xe);
>> +
>> +	/* TODO: We shouldn't be doing such ugly hacks, reuse FLR helpers and drop this. */
>> +	xe->wedged.perm = true;
> [Severity: High]
> Could this leak a reference and cause an assertion failure during device
> teardown if the device is already wedged?
>
> Unlike the old atomic_xchg code which checked if the device was already
> wedged, xe_device_wedged_get() increments the reference count unconditionally.
> If the device is already wedged from a previous event, the reference count
> will be incremented twice.
>
> During teardown, xe_device_wedged_fini() only drops a single reference
> when wedged.perm is true:
>
> drivers/gpu/drm/xe/xe_device.c:xe_device_wedged_fini() {
>      if (xe->wedged.perm)
>          xe_device_wedged_put(xe);
>
>      xe_assert(xe, !xe_device_wedged(xe));
> }
>
> Will the second reference be left behind and trip the xe_assert() check?
> Also, should the state modification here be protected by xe->wedged.lock?
>
> [ ... ]
>> @@ -126,7 +128,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>>   	xe = pdev_to_xe_device(pdev);
>>   
>>   	/* Wedge the device to prevent I/O operations till the resume callback */
>> -	atomic_set(&xe->wedged.flag, 1);
>> +	xe_device_wedged_get(xe);
> [Severity: High]
> If the PCI error recovery aborts or fails here, and the device is subsequently
> unbound, will this leak the runtime PM reference?
>
> This code acquires a temporary wedged reference but does not set
> xe->wedged.perm to true. If the expected xe_pci_error_resume() is never
> called due to a recovery failure, xe_device_wedged_fini() will see
> xe->wedged.perm as false and skip dropping the reference, which would
> ultimately trigger the xe_assert(xe, !xe_device_wedged(xe)) on teardown.
>
