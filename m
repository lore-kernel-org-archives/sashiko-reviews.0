Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED9C4718D1
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390487; cv=fail; b=PjKdrrByiMeJtqlf16V+9p3V9jt0MFpOmUVWeGDHNO8/uYKZcaseCVz3Rhpk4AWU8wJ4jYjChMBlyEpJUVA8N06xOFcM04hVlYO3bVq7uZ3aj38atYLK9QmAfuWHefrciYcY3ypEdqS1lSHJK2mdmwEBH9alMIi+sKYJx4jkx+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390487; c=relaxed/simple;
	bh=JqbOtt+OKa4U+Nr2Gg/hfQHZRW3q6HgNgIv2QcK+HSI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TDv29S8BrsWAz2Q5Cufs9SA5zJmRehzXTPgcRPSYlsOApApAY3st8OViuWbYpdqDk+AU8/OZOEoC0Q0YPmBFhKFC6JTNfKCXr0kV91b8bXFwEhNEfd/eCWtABuLVQTq5gIUUbTsqqeBi0yevye69Za4p3P5+/tHrf6eAUHygWYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gi/eHrTQ; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gi/eHrTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789390485; x=1820926485;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JqbOtt+OKa4U+Nr2Gg/hfQHZRW3q6HgNgIv2QcK+HSI=;
  b=Gi/eHrTQvJDJzNmbILu6p/2DC1kClYDQC9baCLZQlI6DDhOl8F/heBfW
   97HwdSVLKIzw6QmC4UwuflMFK6L05jwA+UeW/XIu8MNBcnV1G2G3xNkPg
   NATrU+REJhXfdcXFI/HukkppO+hDqT1LM6pzjhw0gJN1DH75eQvtpOgaI
   miGosw/4a38bP4wFgW1/WwldS97C/dLHf6scUQ/xSrzRZiHIs0DJixuSI
   CW6bwnx8UxChTFcVHgDSOA1l+HGoOjfQm3vThA06Bh8Q7RcmvObFE+JNE
   cVuO8OQdwj2w0y6wY3VcIbTIwJwgDugMZWTFC7djHjFwZQWlTvtzDpmwU
   A==;
X-CSE-ConnectionGUID: I1yg0sMyTayxDPaBrBGzDw==
X-CSE-MsgGUID: HyRS7gO6TFCryEpGzrbvsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89752229"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89752229"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 05:54:38 -0700
X-CSE-ConnectionGUID: K7dp1JGtQX+QMuuL8o9+Iw==
X-CSE-MsgGUID: 5YtK1tFISsqOak+c6BmebQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="310909738"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 05:54:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 05:54:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 05:54:37 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 05:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioeCAOwB99bIMYrzKZJn39a24bzytukFPgxnLkvR9dTbV1+CNuVYreI+puF84EtmqwH8ps36as75XlJT/1pdnSW6WSBcfPvZtQQdTyDkEyrlRt/aeFNuQ5YNQEgw9dPMZrftSou/VMqSNiMJKe9XLGU3NA0D2ul8dEcbs7amECw7Ua9jJ+Vy9pzdg01VXoKZ6SPJzB9As6lJK2DFU1eRbb1MpWySB8SXVQSmy10bvpxEZBTCdhxb6oINOuYtZ8y9Mrt1wsRrqXESBsOBmahexz2k/xgSfNHE86sfiVxPXrjufXRcAGQED3SAHr4DtJB0fusqCK68mRXwP0fYaw/5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g13P8WID/ipDD6pfQnPG4JJZtXe25R5ml3mAWqE14gs=;
 b=XxHLYpGc6PxyjVr6XBY6JMNwQr+6RM1qKGpBWgg2tBcWQ7vTjUpFgbWomLDwn1h3UR4xpE9HbNMyctYKYPBWHQ0AOAPyujJ3a4/WAyMmSMeMBgZoemyRG7ru9s8v9miOM8KXp/d5MgeM1N+L4DhIbtztOmI/wT0YF9pVBZEYNA1/GBAcEyKnEUNoZiVFMSrN/Q8CzPUBkw53eOpVwQFLzPnhxmYvpoYxwkqvQbflTprSbluEODEiyNBZpzWchUvG4FhGZZ3TGn60RcKe+b0tyqXHLpSw4sZ6ohY7ZZ4HF/qgunQiZsf9w2WafaOA834m/kHQuRpKDV7VE2a+DDgCeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SN4PR11MB9968.namprd11.prod.outlook.com (2603:10b6:806:4fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 12:54:35 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 12:54:35 +0000
Message-ID: <53ea27d2-1043-4b7f-b2a8-baabf6dfbfb8@intel.com>
Date: Mon, 14 Sep 2026 15:54:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] i3c: mipi-i3c-hci: Add HDR-DDR support
To: <sashiko-reviews@lists.linux.dev>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>,
	<linux-i3c@lists.infradead.org>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-18-adrian.hunter@intel.com>
 <20260914115449.8A8971F000FF@smtp.kernel.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260914115449.8A8971F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0269.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::34) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SN4PR11MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: 129072c3-b1b1-4c8f-ef93-08df125f542c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|5023799004|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: XAij06yc4vG52IzkUU9ci5jvMgxGhydi2Gm+yMSi2v7aB01JcmChPQn+qR0VDU4mbJCutlaHqQVf3WneN+Rs/0Wdj1adfPFY244Yci5msjRPz/1EPbgWoC07c6lf+G+kf6JEaT8HqlfMTfYqS56dxevuWPBel+IcqjIRHlpbzwqTeN9KCzhorrhATBcenecsNUj/O0yZrXT9hlh6r3MT5+P80vxZhKo3Sr++/M4hi2Hr+NaLeLJO8rc6yLuyc/4lvdbeMInVoyc5iOBawj9l7P7Ey31jfUqn7vVdnaGF7fnChaYURPd4hdP0kE+06UEtfUnhLg31ockTYwt9HFENXJc3FFWoyZ3vT91JubBduU2fgoaDZpem4kK/CTwcDrbT71OccSX4JQ9hOBN8v68tuBjfLIJKqjTuPxbd+H1QtPUH9s5tTKE14EYrU9QTdy+cswq3XBvobnCmp3U+EHTEwnkR+S1i1de8B961gKCjklAYL/KJXzu8JHzXaV/6JcrqgFr4HYDE0hgut554+ZSarcltOZRDt+Mb730bryzeN0geX8GCWsh3fCScQDNlm2CKD8NvbAyPDiCkEHiovmN3vqMKnK5w2SVIAZpGczkrG+UXNZbO5gdCwKhY0neAMO28Ehp3Wagy629HL5Pwlk4z2UHiDxFW9VKXwMPm2jEvhI0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(5023799004)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE1KQUE5eWkyRm83WkNsai9nYm43TFJ2TXMxaUVtdDg0dHQ2YUR6WDhRbTNk?=
 =?utf-8?B?ZTBTZHJwYlZJcGIwdGxFakRRdFFQMWpKbmFDWHNaWVlMQjg4bHFWZVdNNUxx?=
 =?utf-8?B?VTg3WnRPS082dVJHa1d5ck9rVFpJeGd4VGJObkM5Tmh2MC9TU2JhSzlNYzMv?=
 =?utf-8?B?VXlsT3ZSekFvOFRQb2c3Z080VVVXT1c1M0hvVmIyWXNoeXc2anVRYysxdktV?=
 =?utf-8?B?UEZIeHY0QUp3ZS9TNktUSlNGRHRtQWhzOU1pMXBvWjRRWVRoN2F2MWhKRlBV?=
 =?utf-8?B?dklFbXlsaVRYQkcyMXA5S05ZdjlXajlXdFJpWkNUeWtZV1Y5bE1wcWVGY2h6?=
 =?utf-8?B?aHlLUHdJRmVWWUNnd2J6TlAxSmxvNkdQR2pkM3hDMkUxTmpCRjJFdEovSUNM?=
 =?utf-8?B?Ym5rZjdRakdJd29paXhCOUlva1J6M0FVL2Z6S0hNbHZJKzdZRTNLek14YUZR?=
 =?utf-8?B?K0s2aDJvRitwM0piaTdIOVNSL21CM05YbDVxaFFSeWhGQmNyc2YvT3FJL1pn?=
 =?utf-8?B?aHRoeXhwQnlMTThVVlBuZWQxaDdram9aWG44a0dibGJpNHV0TU1HMWo4K05C?=
 =?utf-8?B?cnM4VSt1aW5mQ2dZeXZyUkxlcm1KNWxqSU13YmJ4M2cxK0tpLytWdU4xZ1F2?=
 =?utf-8?B?R05peVBsdFl0U2hxMGhjdFE1dWF1amI4dncycEJiejV4RWI3TklWU2FlUEFa?=
 =?utf-8?B?NE5tUTlicjZKQXcvQkFLU3g1TjZQWEJjYnZmUkl5elJGQVIvK3VlUDBPTzY5?=
 =?utf-8?B?dVM1R082NHd3QS9pbFRldmRHTUZ1QlhjeXJJTmoyM2oydmZTS3VoTytDNzZO?=
 =?utf-8?B?L0pJcWNiWmVCRmtFekRLOWVSa3hlOStIdCtNbktBb1RCYUZoK0h4bmRuWjlo?=
 =?utf-8?B?Smt4T3F1dm8rY2RleVkxYXRKRmE0WjZPdEtQSTRFME1OcmpxMGc1WlQzSWt1?=
 =?utf-8?B?S1B4cVZyZEE5RllheFdYazFsRlMwcFlDc1lJNUpsSVVhWFhSRXRTRmRJVXBG?=
 =?utf-8?B?WTN5bkF4ckI3b24vNWxvaVcvVllZdlJmTy9XcjR5MDVzQ2pYVURpbjZtcU9P?=
 =?utf-8?B?dGtTb245L21CTW5yeHZQOGVaRWZtc2ZQSlN4bzh0RGZIbll5UEFmcWdleVlU?=
 =?utf-8?B?ak52WmFYTy9naU1Yc3h5YkVBU3p4aHFLSERyM0phK3I5cUMwa3hhUzhIZFdi?=
 =?utf-8?B?cHNvUHI5bm51eDEwaFVCWFpseEpmSVBWZjhGL3hWVVI4UXV3YmpLU2F5VEJs?=
 =?utf-8?B?MkFXTTNWZTVlL2IvK09McnlXaDMzVTdRTGl2NTJCbURkRTh5elRzUDFnSS9v?=
 =?utf-8?B?U002YXJYdXRURXd0M09Mb2t6TnJYV2Uvcmw4WlNNakhqMVd3b1UxR0RWbm9O?=
 =?utf-8?B?RHc0eUFuYWsyZmpaNjBSU01IRURYdWs4RFRpZkhhUWI5SHRvdHpxbnFTa2FI?=
 =?utf-8?B?ejZTWFNoRmFzckVwVzFOYnk1S2x4VVVyd2YxMGVWb2lpRUkvTGVtSDY5RE5z?=
 =?utf-8?B?cFlkbURDWnNUeWFYQkJ2R0ptQVJMT3R1RVRSczNrSWhOMWdyUWhEY2U5Q3Nl?=
 =?utf-8?B?V2NvSkdvYlV1ZGJLRWJwYXZEamEwb1cyeXRiUjZMV29YWExPaVVkdEpPU2Zn?=
 =?utf-8?B?eHp6dG01ak4wRnJLVmdQQ1lYaFFUNldzcXB0NUExSmpOc2xDYU9WbDRxYTlD?=
 =?utf-8?B?U3BLaGVhclNacndLbm9wUjQrajVBQWFhNnlTMzcxZDJKK2lMekxzMkx5eFV3?=
 =?utf-8?B?V0lkNlE2QXY3ajJhSHAwSHRqTkc4dEpHZkZnQUdIb1hWZkRlTTdpcUpka0Zn?=
 =?utf-8?B?REc2c3FrZ3gyVEE3cVU1bzRQaGpYNjd6cnBJNExOMnh6UmYvRUlaeU85bFIy?=
 =?utf-8?B?S2ZQbmlyTXNPWjB4ZTdzSm13WSsyOGlUS3VTQTRqUVNZSDZrMGNBdkt5eWxn?=
 =?utf-8?B?SkJkdHFFZ3IxMlBKYWtmR01WUjdDUkJ6RmVRMW81VERndDEzcjdLdkVwNWwy?=
 =?utf-8?B?dTg3azBxd0RHMjRKYjJjQjY5cStHVjVHWHhZNjFRWUR1bk81aGt6c0xaV203?=
 =?utf-8?B?T1lUUlB3eXJDRjhrV2dqMEdlUWpTV28vSDBRMURlSmZvdzI5cUhXWFpkbS9W?=
 =?utf-8?B?RUNPR2RaWGxpUVpoM295OXVueGNnaHVPeElwRXJrUG9nSzQwUk9UUFBTeUFO?=
 =?utf-8?B?VFlHZDc4aEtXNjZGQWNKTjU5K3RpL25ib0kzbWovUng0MTJwci9LclRRZHln?=
 =?utf-8?B?NHJZZjVhbnBHS0dJZmo5MnQ0aTEvRHV4UG04NWRlMXl4RUJPZFQ3Sk9MbzFi?=
 =?utf-8?B?ZzlsY1pxcmdYYVRNLzFIb1BQNzBJZ0FEV09GMlhtT0JkZzFoTVg5MXlJKzY0?=
 =?utf-8?Q?rl0pBMKEoz442O3E=3D?=
X-Exchange-RoutingPolicyChecked: axakc5wdFpjIRaBG93/TXC+EHdAVkcG2LhGBhVzGKXJ1cEiHqHbVQMjak6CS7+pfG1boekkf7Di7IRXo1sxxHRYoHawVqDrA7FiELFRUoH7RTkUIkyj0Vej1K51ozjCK2jcry68HVBVNz0yVe8xlPVsiKfWUO6a256BtFP4e18As7a79SiuKJx2fXJECcP0aURqAOz7aLu+iQoxzxGt4E1YzA7A+N9k6HP8Lrd+Tv1s2GN2Pn81QXieXvBIqe77biQCI9IzHutg5m43wp2DT5YTwvIL0As7tWibMpeqGbETzTXFmdG0Yi87oDhruZAICMnrTmTuFty7UFGxu/0YLow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 129072c3-b1b1-4c8f-ef93-08df125f542c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 12:54:35.5890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ad0CdRVov15kboF6InMHEK17KhuaFnsQ4A8Q5JaaQX9e/clRb3jkBiTG/Olqi76y6jUSCk0w9COPoO4VGihRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9968
X-OriginatorOrg: intel.com

On 14/09/2026 14:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The HDR Command Code's RNW bit (bit 7) is incorrectly masked out when constructing the transfer descriptor, causing HDR read commands to be sent as write commands on the bus.
> --
> 
> commit f1f61dea5df0e3000b1b519aa78a3886fbb61942
> Author: Adrian Hunter <adrian.hunter@intel.com>
> Subject: i3c: mipi-i3c-hci: Add HDR-DDR support
> 
> This patch adds support for HDR-DDR private transfers in the MIPI I3C HCI
> driver. It encodes HDR-DDR Command Descriptors, advertises HDR-DDR capability
> when supported by the controller, and enforces HDR-DDR transfer constraints.
> 
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
>> index 9910df53c013d..78ad2ec2bd936 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
>> @@ -215,14 +215,30 @@ static int hci_cmd_v1_prep_ccc(struct i3c_hci *hci,
>>  
>>  static void hci_cmd_v1_prep_i3c_xfer(struct i3c_hci *hci,
>>  				     struct i3c_dev_desc *dev,
>> -				     struct hci_xfer *xfer)
>> +				     struct hci_xfer *xfer,
>> +				     enum i3c_xfer_mode xfer_mode)
>>  {
>>  	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
>>  	unsigned int dat_idx = dev_data->dat_idx;
>> -	enum hci_cmd_mode mode = get_i3c_mode(hci);
>> +	enum hci_cmd_mode mode;
>>  	u8 *data = xfer->data;
>>  	unsigned int data_len = xfer->data_len;
>>  	bool rnw = xfer->rnw;
>> +	u32 cp_cmd = 0;
>> +
>> +	if (xfer_mode == I3C_SDR) {
>> +		mode = get_i3c_mode(hci);
>> +	} else {
>> +		/*
>> +		 * HDR-DDR is the only advertised HDR Mode, so a non-SDR
>> +		 * transfer uses the HDR-DDR Command Code encoding: CP marks CMD
>> +		 * as valid, CMD carries bits[6:0], and RNW carries bit[7]. CP
>> +		 * and CMD occupy the same descriptor bits in both command
>> +		 * formats.
>> +		 */
>> +		mode = MODE_I3C_HDR_DDR;
>> +		cp_cmd = CMD_R0_CP | CMD_R0_CMD(xfer->hdr_cmd & I3C_HDR_CMD_CODE);
>                 ^^^^^^^^
> 
> [Severity: High]
> Does masking xfer->hdr_cmd with I3C_HDR_CMD_CODE unintentionally strip the RNW
> bit (bit 7) from the 8-bit HDR Command Code before it is placed into the
> descriptor?

No - it is intentional.

> 
> Since CMD_R0_CMD occupies an 8-bit field (bits 14:7) in the descriptor and
> xfer->hdr_cmd is masked with 0x7F, bit 14 of the descriptor will always be
> forced to 0.
> 
> If the hardware sends the 8-bit CMD field exactly as provided onto the bus
> rather than automatically merging in CMD_R0_RNW (bit 29), will this cause HDR
> read transfers to be transmitted as write commands? This could lead to bus
> protocol errors or timeouts, as the target device will expect to receive data
> instead of providing it.
> 
>>  	}
>>  
>>  	xfer->cmd_tid = hci_get_tid();
> 

