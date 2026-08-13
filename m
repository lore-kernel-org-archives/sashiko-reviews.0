Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07EA3BB102
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 22:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658815; cv=fail; b=blIHqRshpWPjCOgE5+yVy8Ug/WOb/m+oCpEDVyAhFwXhjkElvYpsCYcYGiyVuCUMeo4TZqfR94M70ihkhil8DAXH/cSoCzzvf0ToBfrUejXajX+PinR+uJXOiOR5rlw/lXZVywZTqotjKzZR+Bkq7GOyMdSrH6S+QMJamznjbi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658815; c=relaxed/simple;
	bh=4Pcvhfm8EQ+6pX3OoKZsFykAJt3eayVJSpGraxYYxb0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pd18tade7qPWdJax8nlXMyeOLZIRDFilH81MoFKZsCRHnRXoZ+ksKKHza/UOV8K9R+eUvsGY6bwME7LyTrituy+sKFrUeUl2XcY17uagzwtmrFQUCupY2afaSR/lJk9xFEvZ6WNC73cdIyzM5Sx8qqct58AUVo1yHo3mrl41zUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAwQhKxI; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAwQhKxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786658813; x=1818194813;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4Pcvhfm8EQ+6pX3OoKZsFykAJt3eayVJSpGraxYYxb0=;
  b=IAwQhKxIL7pgX/BIAbej57xT8QaC3NLKRmnrgWjms389hQZISTJJyVLf
   Sp5/Z5+aa6CeHXdVCsqZpsU8okoYNPacM5lSD1VBCnIZS5N6kNnlbudM4
   ANUEZ8F7xnINOiT053j12qNshVupUnaAam1hjW91ukYE+qDj/s1U/r6+b
   YhA/SrhCBMTdcec0OechO+IxpENJYW14cmidAIH91sSG6ujP+3EROYEo6
   tRFUaYhjFrSnLHmhMpQU8f0oJk1LbdpLUZa9k117ZL9XwQEtQIEFSpjpO
   7i/TqdAbdFDkkL+0+tCXCbIhlLp9dTc9xG3NZBnqdjaAl7wGhiyd+qRhv
   A==;
X-CSE-ConnectionGUID: TgLPi37hT/und4lokikMTQ==
X-CSE-MsgGUID: uK8J3eXmSbmRNzRHdKfeOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98399032"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="98399032"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 15:06:53 -0700
X-CSE-ConnectionGUID: RXbRGVtvTu+A9ygipzd0jg==
X-CSE-MsgGUID: bdEGkzYiQZSC0w3/2xsmRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="257833918"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 15:06:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 15:06:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 15:06:51 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 15:06:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMZN2JM9SUAXE8m5AWbrD4R/+FKSL5dtAEnF39/o97A1dlB2sgVX4Y6VmG0BXRT4iZVHUqwutpeA9kop+cS24d3histT9Mbqihpg9KvdfyjS7vUeg6ZUslv9TQQTR0ddMa/FZmfSfenrTsWQSqGUow3r+ArjWXtjv725diiwfuRATf1S3xX78/pZdOyn1SDHJD+ofugTjCYBWNFcUu1Rod090ZNDcyqrvIH6jsFzhXPnQeu5EM61xv0nNwglKTCZdFrHtIr7yL94f3h9ylQtzNAQgJI2sVZQXKJ5HBn5eE4Phzcqyvvyi2WP1WN5sC05o6OZaf4rsklLx++7m62LKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BBQeMfWOfXOzb9TE9bRGn3cJL2PrJMA0C4PuTL4Ep8=;
 b=wx93yOtm+YvLFQp1wYDWaTJ6bqlD62I2aN6a/YorZzs6okO3o21GJ2aJzd4mJ+ao3NCqo+zP+v5+IbmduoCKTHbxd3ElTh+vU9TVNvA/zxc7JyoFeHU5rEazXKjpb0DM6pfnUpE0Kn2j9h5nByen1y/AVlHV1O9fIAeESgpK/2ap/tsXdzBHgD7A7WtPIUb7/+KXido1Q83qI4+TX0NUbSfmVmAmrrfdGfVl359tXiyhKl7EWKnxY2DtRQbPpknmNt0/Bln30AToiOArj7qgIkpKqrns+WFFExmJKP1LxFPaUjsN8vJpLdyAjZn1QU4muae2FNq6ElE4aB5/dBmLRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by SN7PR11MB7115.namprd11.prod.outlook.com
 (2603:10b6:806:29a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 22:06:48 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f%8]) with mapi id 15.21.0270.017; Thu, 13 Aug 2026
 22:06:48 +0000
Message-ID: <3bf39551-63bd-48c9-93b9-2aa44c1ed485@intel.com>
Date: Thu, 13 Aug 2026 15:06:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe/forcewake: flush delayed release at power
 boundaries
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-4-zongyao.bai@intel.com>
 <20260813002333.EA04F1F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <20260813002333.EA04F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|SN7PR11MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 5698e336-c67e-45e4-63b5-08def9872b50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: Xyr1Kw2B/UdP3FwbURqxd3OHedBO8RX/wSLOEZboEB1obmPYsWw+p4E+Jp8MnXYxva9XzCxAGuSUynIMZaIRGzKi1RbvmgNjlkwnsakv+yFuOm2NkkPauBwGum/w9y0aiLFUF49W9ImXqxlGlZe5bYYigKNsMDpXW1u9f813TVgOJrmqOOAIH1usziB6+zhwDKCC8/2z2fAfyZN5FdVyxkBG0Vyc7SZ1oU/VqB4T1t5yvHohZKeyN0oqk5eG9KWb5fndHyY5GxbUaNb1M499or1+k25xi5B/CUstfJl3GJ2+E7wC9Zxt8X13FpmslfIR3spy0fimhr1S4tzX2OFYn/WALGNWB2dUOQfeisqhQsaGd6TDnto++zt/M673M3BqyvX1Qw0Mu287DZ+VLLimawrA2Igx2R+QK3ttIxB1lEME8jysZa9kMXyOyNsogun8Vk18+TYbfeoBGAYGrOrwK5zK1kUO0b7s+8hvWLCgDEExKlBMZEgj0KdNqH//iv2cGzvx1wtkMqED6pomc+iNnhsN4IjmcuPGLdnQSCBWQrAAJgiHMmgRT9V9KPpxVGqmZ5R9w/NrCJ0fEAlnL2OqxuCJRFbXpKg37heHCZfkBcBrueQfzxcIBSS8LR0GgrxSsoBVbCiZsB3l5lC9mV0kuPJe9IiyfXTalrQZiu9b/78=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF46B98A11D.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHhpSlJkUTEwWXJlRGFMb0lJNU9uTGMvWm0wTnBWaU94U1hvVUd5b2F4L3VU?=
 =?utf-8?B?S1B5TXhuOGRqckZ3aFhoK0FNR2lvbCtpd1NOZGdqdHVZRWlHQU1sQVZscUpR?=
 =?utf-8?B?QmkrWWtaMUduZmhybEhJVnhVbjMyc2VsMFVBZFhFQlBzRStxdVNhc252dWJ2?=
 =?utf-8?B?bUd0LzFYeGdWdCtKT09BWTBQZ2ovV3hnc3JOeHhabFQvQ0lOeGYrZjJ2Tnps?=
 =?utf-8?B?ZVV0QVEvQnNOc1BrWjFpQlQ5OVpjZXpnaUlVcDduMjNFWitLc3JIeGJGVFh0?=
 =?utf-8?B?cU5VUkZyaU45WTNjZGRqOWlSb1R3UTZUeUJ5aFUvSTZBRy9hZ3B4NjRBU2VP?=
 =?utf-8?B?R3B0aFkxQ21PVUpGZ2FjSmlFa1pML2VnTlJjd2hMeTBnVk9NSkZva1pldkIw?=
 =?utf-8?B?aHNXL0I0OStRVXlSS25xdmtTNTY1TGtNaEdOL2dJSGkvckdCenFteksxQm5z?=
 =?utf-8?B?NEdya3NGUy9kTFVqRnQ2STFmYkNvWUhGdlJjQkRLVDBSTi9GQkNzS21KZjlM?=
 =?utf-8?B?diswSjlBM3Y5YkgvVXBzUWFmMEpLeUhSUXhreFZtcUJndVBmMzkwbzZNSzdr?=
 =?utf-8?B?eWtoYncyY2cwOEg2d2I3ekE2SnNLRDM3dkF2MVM0R2pIckx6OFNCTElUUEto?=
 =?utf-8?B?UVdJbXAzMFE3UmY0elFDRkhTZFVXUHJSaHRhNGJidVVCSExKT29MVzFxYjB4?=
 =?utf-8?B?RGdVTUF2cG1YQjhDbi9wekxIR0loNG5PSFdVQ2FLRjZUeDRqRFl5Rml3S1dD?=
 =?utf-8?B?b29admswV21iZHRDVkFic2h5Nzl3WVVGbkoyRWNIbmVkUTZFcUlhSFptL08v?=
 =?utf-8?B?TXl4dXNUcFp6M013VmpQalVXZU5PRkFNdEZ1b24yeThHUGtVbnNnb3Jxdmht?=
 =?utf-8?B?WG5JMktvOS8yYWkrR0hsQjlqV0NwcjE3alQzVkd0elRFVUx5Q1o4N0hya09Q?=
 =?utf-8?B?clF4TjgwYXVYbkpWTWlVclVUajZ3TXZIRG9vQks0WXcrdFl1VnMwamwzMXZY?=
 =?utf-8?B?bE9lUXdUb2tyWmdDWkNMVEMxQVJzeHdja0hUdHJFZ0dEUldRR01STkFyYkQy?=
 =?utf-8?B?enpvbytEODNBZTBpM3hIT29yejNqZFVMNzdHR3dlQkNMYi8yZ05EL0FnS3pT?=
 =?utf-8?B?cWNyTHBYM0lPK0h0bnA1OHV3Nm04UnY4R051QTRPTUZqUHhVNGpnUkNIbFdF?=
 =?utf-8?B?WkdreEpVRmV2ajdPNmZORWdBMDVCakJZZm9yNFZhdEEySm5TWVpnZjRpeTB5?=
 =?utf-8?B?REJScFNzRTdCWEh5OFU3d2gxd0EyOUFuWVJvajlNaTBrbnNuTFhXYk1QcjZN?=
 =?utf-8?B?dlE0aHlRdUM3eTFXYmZwUTlLNzdHNnduMmZibWh0bmFlOTEyVVFVbVN3Sjl6?=
 =?utf-8?B?Qk1CWndaQjlsbklZOEVPM1BwSGVsa0JnMUl5S1orUndNNDE4MFpCcGt5RmNU?=
 =?utf-8?B?SjgycThhalRldkFqSGwrUzlsc0xzL21SZFpnYS9nUUVxZ0lYUVF6VVJwbXpY?=
 =?utf-8?B?aGU0bU9zc0VqQnhQU3ZoVFAwNWV3Ty90WkljVHZSTy9IWElvTlp0RnNya0RZ?=
 =?utf-8?B?bTlxMDM2KzRBUm1RUTFMb052QWR6eWRxZHFzeGp1Q3dOVWwxRUJvMnRFWlNm?=
 =?utf-8?B?YzRMYmswdHBrVmhzMU5OcjcvTG91REF4S1pmSnhhM2tNNi9RM3lpYmovclBG?=
 =?utf-8?B?dW9SQUNSeXVVeWtPQ2RNZnowUmZJRGFaUTNFZjE4TitRa2pwL1Z1WEtZTVFX?=
 =?utf-8?B?UVZkWm8rZHAvb2tLWFJtLzV1R2NHcVFWSDFzcjN2UlBWaUQ1QkRmTGh0Wk1J?=
 =?utf-8?B?RXl3Vk9tRVRuZjhJRjBGNGpORkpYZ0ZQbExidmxUTzduWTROc0lKN2dueXVj?=
 =?utf-8?B?V2RmelJKNllOcEV0dEUwZVI0MHdKcUxRbjE3clJZN1lDelgxemdJZFFTTVMv?=
 =?utf-8?B?alkxL082TkNoTWxPa0xWTUI4VXc1ekZoSXg2VVdLZzVQSEhkVkx4ZTlLMDk0?=
 =?utf-8?B?K3ZWNTBTbEZmbHhUc1hRWW45eThZa0Q1RTRiZElXeHFEcURiRzJaWnlxOVNl?=
 =?utf-8?B?QXpGdWQvQzJ1bUsraTFpRGZSNUVqaUVUNXdzaHFweXF6MXlDd0x4aGw1bVhr?=
 =?utf-8?B?S1lvbEV4bEdSZ0dadUFjd3prdFBUMVdFMFF4YjJxRFZFT2xCbFV2a0w1cjZ4?=
 =?utf-8?B?RzROU0FXR1Q2c1dYdFJ6czdFOCtKYVNxSktjNnBHNDdXZEFURzRrNlovVXEw?=
 =?utf-8?B?WXI2dnVvWDFTVVgyQjZVZ2tHYmM0NUNoYnl4SnpZM1EwSmdja0RlcVFKYkR1?=
 =?utf-8?B?Vkswa2tVRFpQRExmaUR0dCtKNUlUUVlnRVNMZlJseGFRcjVYSzdCdz09?=
X-Exchange-RoutingPolicyChecked: o2LfygVpDNV0Y6HicoC2BseQUKX4VP+SsLcnihdtGlUeC3LuQ6t8w2NCGbEmSzkm2GiDyfhCQZoOakLSNixUOt061u8WEFjVeI4Quxoc6wahaPu4158rMfDq//sf9H6oXvxUjnb2RPuDAG3cRbLQVzhl1leGgSdAig7HOHGyBucpIHn/ckoxDDBTPpL9Jcr3cipnmXtmDujYKAHIbD50Pq4QH7Nz6lN9Zs7BQD4E+Txt05o2LM+srGi7qzXJyW1Bb7LPF8GeHvgyh8Mexl14gCRjov4NZVfb9cG3KwkrGo2vnFWZoXjOBCyoE5MXl5NK9Jc1NzY+j9jrLiQGYt22DA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5698e336-c67e-45e4-63b5-08def9872b50
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 22:06:47.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1O25npaMF0K+OWAwzs4DEG3oxAqjzvTLKkfUrjZuepqcy/KHFkDR5Oxu3qZRG4W+Mx96zxX40chlYFBE5HudNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7115
X-OriginatorOrg: intel.com


On 8/12/2026 5:23 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] PMU events hold long-lived forcewake references that outlive device teardown and suspend boundaries, defeating the patch's attempt to quiesce forcewake accesses before power-off.
> --
>
> --- Patch [3]: [PATCH v5 3/4] drm/xe/forcewake: flush delayed release at power boundaries ---
> commit 137d6a969747b4828385eae977e1c1ba6eb0b98d
> Author: Zongyao Bai <zongyao.bai@intel.com>
>
> drm/xe/forcewake: flush delayed release at power boundaries
>      
> Add a synchronous forcewake flush that cancels per-domain timers and
> settles pending sleep acknowledgments. Provide a scoped cleanup class
> so the final put is always followed by the flush before the caller
> continues toward power-off.
>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 3f5013c7424c8..ef43899e1f7d3 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -391,6 +391,55 @@ void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref)
>>   	__xe_force_wake_put(fw, fw_ref, true);
>>   }
>>   
>> +/**
>> + * xe_force_wake_flush - Flush delayed forcewake releases
>> + * @fw: Pointer to the force wake structure
>> + *
>> + * Synchronously cancels delayed-release timers and completes pending sleep
>> + * requests and ACK waits. This must be called after the final forcewake put
>> + * and before power-off because the timer callback accesses MMIO.
>> + *
>> + * The caller must ensure no forcewake reference outlives this call and
>> + * serialize against new delayed releases or final puts that consume a
>> + * recorded delayed-release request. Timers are canceled before taking
>> + * fw->lock because their callbacks acquire the same lock.
>> + */
>> +void xe_force_wake_flush(struct xe_force_wake *fw)
>> +{
>> +	struct xe_gt *gt = fw->gt;
>> +	struct xe_force_wake_domain *domain;
>> +	unsigned int tmp, sleep, ack_fail = 0;
>> +	unsigned long flags;
>> +
>> +	for_each_fw_domain(domain, fw, tmp)
>> +		hrtimer_cancel(&domain->sleep_timer);
>> +
>> +	spin_lock_irqsave(&fw->lock, flags);
>> +	sleep = fw->sleep_ack_pending_domains;
>> +	for_each_fw_domain(domain, fw, tmp) {
>> +		assert_domain_state(fw, domain);
>> +		domain->delayed_release_requested = false;
>> +		if ((fw->delayed_release_domains & BIT(domain->id)) &&
>> +		    !domain->ref) {
> [Severity: High]
> This is a pre-existing issue, but does this flush mechanism fail to quiesce
> active PMU references before power-off?
>
> If a user opens a PMU event (e.g., engine-active-ticks) and acquires a
> forcewake reference, it can outlive device teardown or suspend. When
> xe_force_wake_flush() runs, it skips the domain because domain->ref > 0.
>
> If the device is unplugged or suspended while the PMU event is open, the domain
> is not put to sleep due to the active reference, and the hardware loses power.
> On resume, software may incorrectly believe the domain is awake, failing to send
> wake requests and causing hardware timeouts or hangs on subsequent accesses.
>
> Furthermore, on unplug, mmio_fini sets regs = NULL. When the user finally
> closes the PMU event fd, xe_pmu_event_destroy() releases forcewake:
>
> drivers/gpu/drm/xe/xe_pmu.c:xe_pmu_event_destroy() {
>      ...
>      xe_force_wake_put(gt_to_fw(gt), *fw_ref);
>      ...
> }
>
> Will this cause a use-after-unmap logic hitting a WARN_ON_ONCE in
> mmio_available when accessing the unmapped MMIO?


Agreed that this is pre-existing, and it's independent of this series.
PMU acquires its forcewake reference with the plain 
xe_force_wake_get()/xe_force_wake_put() path,
not the delayed release added here, and this series does not touch 
xe_pmu.c.
xe_force_wake_flush() skips a domain with ref > 0 for the same reason 
the ordinary put() does
so the behavior is identical with or without delayed release.

And this issue scenario should be addressed in the PMU/unplug teardown path.
It out of the scope of this patch. I prefer follow up with another patch.

Zongyao


>
>> +			fw->delayed_release_domains &= ~BIT(domain->id);
>> +			sleep |= BIT(domain->id);
>> +			domain_sleep(gt, domain);
>> +		}
>> +		assert_domain_state(fw, domain);
>> +	}
>> +	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
>> +		fw->sleep_ack_pending_domains &= ~BIT(domain->id);
>> +		if (domain_sleep_wait(gt, domain) == 0)
>> +			fw->awake_domains &= ~BIT(domain->id);
>> +		else
>> +			ack_fail |= BIT(domain->id);
>> +	}
>> +	spin_unlock_irqrestore(&fw->lock, flags);
>> +
>> +	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
>> +		   str_plural(hweight_long(ack_fail)), ack_fail);
>> +}
