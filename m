Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2E2511191
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 22:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788473494; cv=fail; b=B7Clxycyivrh+GUfQRaFEP9qVvY1ddqRAPnfRDtA44skTBMSpOYG1KsFTM+2DovCKR6Qi8ZwYgnwGmoXG9SrmeuEjULr8YatDZ5M90pLgFR5VYi6yj8T+QOTlSHwfvKDbMamlL6xYeXBqciE3WzjX7nzzoqmW/oQagKw7LwF4J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788473494; c=relaxed/simple;
	bh=T0tchj65dAbEot5guhkS8VNzcdUJOjc8cdIsj9ufZ2E=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e06ORtArVORhMmp91HMdV2tKvbGcDYFGZRCzXXob4ckY39ptSS9kBPq7YGq4dL+S3jYQEZSL039cbfnmfHs0Q9GULubZh60LdUoEagD8d+3CJWUXC+Lc/YeM/pDe9YYSAYj/ewrPSPwW9rMkgxRhMFWqUe+R9lMZHEO7QyR9Ck8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpYqgPmO; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpYqgPmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788473493; x=1820009493;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=T0tchj65dAbEot5guhkS8VNzcdUJOjc8cdIsj9ufZ2E=;
  b=MpYqgPmOpSYYGmCkE/Zd5Gb3V+y6jRwAXyB6hHlq72CWs3eFgoNhYDPg
   mkdHPhGIYdnoCe5yxprqZaAmEzqTfQgvNlqi7iS+qB4BF1AwKisY1r+q3
   +522wB1sWrQ6d0U4zKG3MPU69UQdDUgaLNRnts5iUb+cn3RQ4yI+bmT5D
   KNfuDhzBiUy6AbUwZ/4AqeDZayiBVTxpknca2CfV4LKdmiwDsBvTo8uQT
   IguKfHgXqNiUD6FrSuH6B4/lJprmtIuRJgfzMyaCBt7exj2ffaGgAUw7U
   u5QO3PSMNKe7XX2xkAGyMopWlAOONcRGSEUNHk6mkon41przUyno/87BZ
   w==;
X-CSE-ConnectionGUID: jBfjhliaS5OlWrSP7gL0lg==
X-CSE-MsgGUID: 1e4TF/PUSWOXkAt4vLq6iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88897198"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88897198"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 15:11:33 -0700
X-CSE-ConnectionGUID: MfwezuHtQd++Cx44qsaBew==
X-CSE-MsgGUID: UT5cGPwrSy+K3dvpcZd+iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273383013"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 15:11:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 15:11:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 15:11:31 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 15:11:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kn3tLDgzgE3voqxG+9mLhnVEbCNfssAvjkJJI/5pFWmZvYH1QOVbQeWkveWx5vOqACSnWTgS5aY7+3SueVsF42pIMzb3/4bo+XGTzg4sbR4AlkPSmkKGUbYe07tuZR7aGKcz7eFcmwsCgSYNqUYHP/goYS3Nje1cVgdfkQVFbfED0lW6q4GDp9y0O3NKMlwF2purOjDunV1k4fa9M2pDG/i55fuNYqSdPJ+zulmQzPtqU9HPqsAUYp2p5Ap8j5ZMJxQOchz/9993Oi/dbgQ6MtW628hgu7iVjoOaaBmfxa2Uem9YeVNPLFjZtLlTLemaYyU9e7zydhETV5B5k/R4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWLmCgoJZsDoMxQzWYqB2QUBDPuQ5ftnWJWeTUBUIcM=;
 b=ZvHElcgeDWwu1C9H7t8EGObCEnB1ltyZWivnpWy+3OIGwWJ7wOLr8nQbwm1K3IJahvuJqATF4GAfv9fGCxhyx8AKZ55xAAAdsUrAfE5ecFaSh2eLKYMCzN37AikHb1XFkfGjgFVHO7mjeoaTnNWS6G6mK5LomJq1y4iL5ohH37S7oPXyNpQTeAFb/e+UW6PPTPInuNzbSqA58gksusDsrTSa51hvIQrU+wIbQeCoxheyFmAe40CA/CDmdc+tZgg+/VoSw8Y4QHvlkfV64lTZCPhwy0tZxk0SKtbfBcn3qrhJTuh0zeTSDOTbJRJZBRJsFQ5P2Fv42a/aedbxvxZZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) by
 DM3PPF67FA1A8F8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 22:11:27 +0000
Received: from DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd]) by DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 22:11:27 +0000
Date: Fri, 4 Sep 2026 00:11:22 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v11 4/8] drm/i915/bios: de/allocate VS/PE-O buffers for
 each port
Message-ID: <pweg5ctxqpqqiofncomhxdh5myiwvqgw5owdxala5csgnga6wf@f5yhe5xporyj>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
References: <20260813160918.918857-1-michal.grzelak@intel.com>
 <20260813160918.918857-5-michal.grzelak@intel.com>
 <20260813161746.A10EE1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813161746.A10EE1F000E9@smtp.kernel.org>
X-ClientProxiedBy: VIXP296CA0030.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::9) To DM4PR11MB7256.namprd11.prod.outlook.com
 (2603:10b6:8:10c::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7256:EE_|DM3PPF67FA1A8F8:EE_
X-MS-Office365-Filtering-Correlation-Id: 31aaf657-542c-4782-e3f8-08df0a084c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|3023799007|6133799003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: tURuw1J1gBoTPPAWy2LGIAX+VI8KFWF5xtV68JG7XHr2nmkqtpexfwQz9be0Mc5jY50ZQmlNfMX+TSSWvyqgnpNNMcznqsNS6jtV6v98ypOZpRpfQWEGD5pWlGDuBHxYOH79joGizarKxCgR8aT3rWeO45wVf4S7Y9TAs3fy+74EROKn+gwERSH9sP/88bvyBZYc5fQipQYShNk+7c3mPWDprN9tImAWOMbWB5r+le8ncGKoxjfLpTzPA3KuD/qLk4xsREpwp7vO1vGPi1zaP1Zid3XiKAExOe6E1NUtT+gJLKbmdMEEbTbWg1Li9hjbYFmAQXNh05/uNWi7T5L9Z+R1UeFI55admvGSDM+Cf0QMnTZbmOmKbhxtaLe085WA4Bbff67j4RrH5hxRIM8/773yoj3ddiZ4oraACyFeZ/7UEXk5lMfpcBN820t7Bmj6wNsNAOzb7nV7M3pjiu1CkR+1xFsbCB4GWKK0Xz1Dbcuj7l800qMN7c97spc7IrLuoW3XeNvb+CnUij+aqnOaWi1mSH7ILPg0jEOoe2D6S0ga9QAR42nSLl3jnihWiPjUgVHvPo4b4ca6n5+FXoaff4KW3Z6CM1NrNTz2dU/lBqs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djQwYTl2YXlhNkhxZEo1QU4ycFZEdWZxRWg2OW9PbWRGOWFGQUd2TnJsU29H?=
 =?utf-8?B?OUJUNXBaaytJODN3QmlXSG0wVnFEb1kybGsxVmpsTHh1d2N6V05Ob3FZYnJX?=
 =?utf-8?B?Sk1Vd05CRzEvcHhUNWYwSVZ6ZDhjSTM0NFZkS2dLQnUzYW1lRnlJQ1U0bUNU?=
 =?utf-8?B?N1RkdmVpZGRxQ21jQWR2QlZQa1NoYm5vQVRYK3l0alU1YTQ5YmdPSHVkbnVw?=
 =?utf-8?B?RHROdXN2bVVacTI2RytZZmxHZ041ZW55emp3UjZCaFk0RUE5VVRvWVBnbnNi?=
 =?utf-8?B?SVU4OGEzYmp1MENUR0tmREhBWVcrODl6bTdrT0pzL2FjT21sdk1wNXEwelRP?=
 =?utf-8?B?TDRsT0l0MUVHVzl2bkNSVWtSUU9QRElxYVpXRnpNNDI4YzQ3Q1ltKzFDcUtG?=
 =?utf-8?B?UUpiSERBczhlS09oa1ZOS1FjUUp6T01yODVSU1R5WWNIRlNRV1oyNkt2cHAw?=
 =?utf-8?B?TGtUMWYrdDBtVEJzeU1Fc2lML3NPNzg5ODhrYzJQK3hPWDE1Q2FJclczT3ZZ?=
 =?utf-8?B?V2lNc0o0YVkwdDJ2R0wzQzRZZytDcjZRN2ZVWTBEcVBMd2F5elNPYkt2MEJ5?=
 =?utf-8?B?OE5CWnFnUkpkVDdaRWRHOEtPM3I3eU1VWmRqRXl0SW81TUNmODdDc1h5dzV6?=
 =?utf-8?B?b1VDT3p2cWR6bVcrdm8wWEtLT0NNMk90Wk9kby92ekF0SG1FUEhQUVFBUHBL?=
 =?utf-8?B?UlpycDdTdDlhS3Y5TUxXZW43K1ZpYXJwRFpvQ0Q2M3lKVG45WVdOSEpyN0pX?=
 =?utf-8?B?b3I0cjNJRWtxa056ZytsMUZod0hJWllwS0s0eS83Y1p1QlJYdWE0ekFHanJz?=
 =?utf-8?B?L3gwTkdVMFM1cTNYZVJYbEVWeXg1RWJteHNPNWJFU2VGK2dWZTVmK0x0UGFt?=
 =?utf-8?B?K0QyMi9ZMEVGRktrQXA3TWlLamQwL0VMaGQyM2NBK1RhcVBpWWp3c3FDeE9J?=
 =?utf-8?B?ODZoem4rVmI1YmxGanlidE44QVVXdGd1YUpSMEJxcnpBMVNFelltbkJqSnow?=
 =?utf-8?B?YmVXdEkyQ2JHNlFJc0RaYXZ5MnlHNVVuQVhPTDZnU2ZMSllzQnBTK1dRT0h1?=
 =?utf-8?B?cDVWWXpCWEVSSnhHYzF3Wm01Z0RJc3BCMkRVRXV4Y2drQ3dhbzc2TmZWWjZS?=
 =?utf-8?B?YU5yQmpFdXkwRUtEWkNjdUEzbm5nbm5HNmNNWXJCOXFTUHUrVDBjRjhxWTlN?=
 =?utf-8?B?V0NNeGU2YXhTTmJzN29PUStWcXczMCt1NVBRdDNLNkxCbUFvNU5GRWNRVmJq?=
 =?utf-8?B?YTN3SWRKNFRzTE5Rcy96WGVPVFcrWGJkOTdwQ2hYS2QzaTRiRlBucWd4WUR6?=
 =?utf-8?B?SmVTdWMxUnBOWndoR0lucmw3dTdWQzZmTDRiYWpzL1JvS1pZdjkwV1kyR21M?=
 =?utf-8?B?OURaZDB3UFcvSkgxVk5nbGkrS1ArZlhTSWZSUzloZTNNdmhac2lManBwY3Er?=
 =?utf-8?B?Y01hMm1kdXZkb2QzMlcxYktUa0ZGV0dUWFVINzZiL0ZVTThtMGUvODRjUi9F?=
 =?utf-8?B?cEhqU2EweDE5ejdxWm9xMWY3QUhOaGVpR044U3l4VHVaWXNGUUpGa3pGU3Rv?=
 =?utf-8?B?Tm9MOWo4WEdkanZoUXhpY0NkUTI5V3BzWTMvQ25zNVowWCswWEJYUHl2bjQ1?=
 =?utf-8?B?UytZeFFvY205eHRLYzR0S0NOcGhnQjhKNnBBLzRSai9kS1ZGVWdiM3dVd1N4?=
 =?utf-8?B?ODZTN05FeFh3U0Nrc0ZsZ2VOckh2akl5U2QvUkMyelJncTNJU1JUa0lLZEox?=
 =?utf-8?B?bzFXUUIrb2RlV1lwWk9OTWloUmhOOExMTHo4b2NuUngzV2dOWjlDa3ZMZ1ZZ?=
 =?utf-8?B?MkgrZk9jZHZxcU9XU0M2S2wrc1RxMGtaUDArak5QVGt5aEwyL0lkSWprdUVk?=
 =?utf-8?B?NVZBOFJkQmJuaGpmTlIzNjNCYVFVK1FjWnBMc1plNVFuQTNtY05Gc2J6SDIw?=
 =?utf-8?B?S0Yrd3k3U0hyMkxMeUUyaWRzMVV6ak42M2E0dkxtMTZCbzVVVXZnMG9LZHY2?=
 =?utf-8?B?L0h4WldiWEVLSnZ5bEFTZ25sVGVmSUFNV09lMll3Yko2QnNsN2wvMmxHMXI0?=
 =?utf-8?B?VnVhYWhZV290eFdweHYvbE9uNjZvVWJYd25MS2JVcUlVeGpsREYyZGNMUjVX?=
 =?utf-8?B?cGlaNDBWdm9SVndtMWRtZTRuMStYZGR5aU1Td3h6QzZ5Zko3OXc0RzlNOUJW?=
 =?utf-8?B?YXVxZUZXaDUyQ2JqVXlOWnN6WXFPVHZVVkF6Vm9kSmJRVHJNK1R1SURtTzVP?=
 =?utf-8?B?RkpkL1JIQnRpT1RXZCtia1p3YWc2UGxZSWtod3RpZjhOYXRkeUFORzJ6VWQ2?=
 =?utf-8?B?c0o3eFdXNnJWR3F6dUdXTzh5b2JJU1VQVjFMRUNRRHdyRlZCY29mK2E0U0xF?=
 =?utf-8?Q?QdpWRV2Fq8a4gVy0=3D?=
X-Exchange-RoutingPolicyChecked: uVI0zA5x6SuDZyDLpuNZzVLiKVuH/sYnEG9uhNaZSjVolutJRcrJlKFV263QbZzlNHswk0mSD2WrbfPaqdv4eSJqSZPvQPe3zyIRx6ZSyuAUyI0W7qj6I/+TyeA9fk4qQZ9uB6ervIYljydyQbrzQfQsQN88tvSCACkqgvLXZMNuNjYiN7D+gJBlGR9mgK8ow4Vctnra9KkKyEDY7dSau9F6N5XKwpHk6+0f9974oYXlk/VugjzIxBgwqMspjIh669m3H1yJsfAxENrybiKVAk6NnQxjX2xrm2XWYxMyxaZfFdPgS2WhgSMV6Z4rJ5yU2KvO/yDzDxnRgs1Y9x2TDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 31aaf657-542c-4782-e3f8-08df0a084c60
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 22:11:27.0708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1e9XJwEJNnnTJNXJP9xVtl5J8QchhBBo9ZsAx97yg4m45m2SHmEsnJJ9+ethO94M6SMM+XuEmKSEgdEUy+4Ee/eEyMXb3nnIKAlYGTmaWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF67FA1A8F8
X-OriginatorOrg: intel.com

On Thu, Aug 13, 2026 at 04:17:45PM GMT, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Memory leak of devdata->entries during driver removal.
> - [Low] Missing initialization of `num_entries` in `devdata->vspeo`.
> --
> 
> --- Patch [4]: [PATCH v11 4/8] drm/i915/bios: de/allocate VS/PE-O buffers for each port ---
> commit f4e52d6386e66ed2695365f0776e18c426ae4237
> Author: Michał Grzelak <michal.grzelak@intel.com>
> 
> drm/i915/bios: de/allocate VS/PE-O buffers for each port
>     
> This patch allocates dedicated VS/PE-O buffers for each port if an
> override is requested and supported. It adds intel_ddi_buf_trans and
> entries fields to intel_bios_encoder_data and handles their allocation
> and deallocation.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> > index 9610b794bc147..a491b85006117 100644
> > --- a/drivers/gpu/drm/i915/display/intel_bios.c
> > +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> [ ... ]
> > @@ -2648,6 +2651,29 @@ static void sanitize_device_type(struct intel_bios_encoder_data *devdata,
> > +static void allocate_vswing_preemph_override(struct intel_bios_encoder_data *devdata)
> > +{
> > +	int num_rows = devdata->display->vbt.vspeo.num_rows;
> > +	union intel_ddi_buf_trans_entry *entries;
> > +	struct intel_ddi_buf_trans *vspeo;
> > +
> > +	if (!intel_bios_encoder_requests_vspeo(devdata))
> > +		return;
> > +
> > +	vspeo = kzalloc_obj(*vspeo);
> > +	if (!vspeo)
> > +		return;
> > +
> > +	entries = kzalloc_objs(*entries, num_rows);
> > +	if (!entries) {
> > +		kfree(vspeo);
> > +		return;
> > +	}
> > +
> > +	devdata->vspeo = vspeo;
> > +	devdata->entries = entries;
> 
> [Severity: Low]
> Is this code missing the initialization of devdata->vspeo->num_entries?
> 
> The commit message notes for v4->v5 say "- set devdata->vspeo->num_entries in
> intel_bios.c", but this doesn't seem to be happening here. Leaving this at 0
> would make the table appear empty.

Changelog is missing this but devdata->vspeo->num_entries was again
moved into per-PHY functions. Now I think it is a better idea to
move it back here again.

> 
> > +}
> [ ... ]
> > @@ -3403,6 +3430,11 @@ void intel_bios_driver_remove(struct intel_display *display)
> >  	list_for_each_entry_safe(devdata, nd, &display->vbt.display_devices,
> >  				 node) {
> >  		list_del(&devdata->node);
> > +
> > +		if (devdata->vspeo)
> > +			kfree(devdata->vspeo->entries);
> 
> [Severity: Medium]
> Will this leak the entries buffer allocated in
> allocate_vswing_preemph_override()?
> 
> Because devdata->vspeo->entries is never initialized in this patch, it remains
> NULL, and kfree(NULL) is a no-op. Should this be kfree(devdata->entries)
> instead?

Yes.

BR,
Michał

> 
> > +
> > +		kfree(devdata->vspeo);
> >  		kfree(devdata->dsc);
> >  		kfree(devdata);
> >  	}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260813160918.918857-1-michal.grzelak@intel.com?part=4
