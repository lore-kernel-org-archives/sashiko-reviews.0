Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE85516175
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909713; cv=fail; b=Px2+hcUmeaAUHRY5ALotFtYLDBk0nBR7yQ4E+3Nar+zTN1Diu+OHHfcafw6Rf1rofanXhOfcHd77QEVWDsBsRabATj3+UbwWX/6VibCGWRbzeUcfuVGDGsfENLs6c+XNiPLY6odH+w7JYlmRIqgokAClgebyPOS0n9pCOj0fRHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909713; c=relaxed/simple;
	bh=qb/hBytI2L6NUT81QsXW/fsl8bcmLX3FonHG0YkmyNg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PxQ3qyJ1s79IgP2UpaRTMKbA3SP5j0wWp11cfB4asp/0DVyLKS6vPr19f2Q6ho/q/XXI1CCK5Ld8nwYOo1UmNaaSJ4qxgYZr/adHzIuLbB8Y5e7TestP4fIRjcce/ZwvH+T32FJMKP2dMa7OimlZHmxc3HBFSvKKz+8+Uzzl004=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQgg1Mtq; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQgg1Mtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791909711; x=1823445711;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qb/hBytI2L6NUT81QsXW/fsl8bcmLX3FonHG0YkmyNg=;
  b=cQgg1MtqBLAN4e1+cEpNgTLMhVDPoiQ1Js520KyQdv1hdzAFJzpvzz2g
   Pb08I1n1GkPbM4+pQw+fcMCZixqrvy3yJOJ4qZDUiWKCliGnBnajngaZj
   BbZuKEpGQvfL2H2y9zZxukDH8h2JkRPeYA3ooYU5saauDvgr+hCkOSrJs
   /Yu1rJdTm+Rn1PZdphc8SHtFbkeuaabVP7LpRa6dqCdzLR082CWZF8B9b
   uaLfj4blgsVW0PzoMVoacZshgv5Ac22xGWx0HT6syvlu3XmL7DvTE5kue
   gTDBxZjBt6CGNt0C04JH1zclFOwz7T5dsDCUysai2oVp5OLR7uKFNVmWy
   g==;
X-CSE-ConnectionGUID: mdvOG6XpTXG92EqeZWBLEg==
X-CSE-MsgGUID: HL/0QZ6fQVCaNdGiuGVP/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="516279"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="516279"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:41:51 -0700
X-CSE-ConnectionGUID: 4/lSlzylQbiAVwgJBykxAg==
X-CSE-MsgGUID: M2l/7VfoTma8YTizOvgv4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1529847"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:41:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 09:41:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 09:41:50 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 09:41:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKnP2KLo+57Ij9K5Aw2b3OTZRbmUTgkMwaT3QH+1cu4dOhkkOiV2ZDevRNAl1wu8P5QYw/oZl7EGNyXNJUnbk7xiEbOXlU9ilflEBm/dTEQyEHQdzSI5Dha4OWr63ALrmW4xqBhjKvROvYDLxcyJyZECVw962dhxljMjaUyviE3acekds2XjV98jmwiPiWKSGPwREt5CoajChhoy2A2Pncfwe3DCsC3EH1S8JjY3zvT+hh8BgQ0ivIMQoCZp24PJn5Ldt3CvvJYPr0IEiFtPxEpGga0EGLnevhnGIkWFc4Icn6H3xqh/VmoPwjJ+kumwQd5gXH4iJ8DxGwVO8IuYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZE6ifFgIG+7vNhHjqa7S68/fe3VKY34MPsZfdy1mos=;
 b=IZuXnWdZCEXokWKGd1UI2+iZTq3zAVtA0awSGFjs2RB/D5DsLr6mdMVlxFg4lel97fi0iHRRDbL07WXEunNI47Pc4WtThSNo/AbXdp0WPvDS9MG/GFArP6aBcXRoATGc2AFv/w8i1dt0pRA0mo2y+28h6l+pU4AwhM47vntqTp4XdlAYTpRBqQ5jszWU0FO+Un3RqnSwot5SZ0ZepSQnc54XG2gSVaga+4oEu/t6KThu8NJqddmhk2EAFYhmrMUF6Cu778LVKUIg7CKoG1BXUhjPSykWf9K89XoymW90d474UKXoPoC16H96Cv0UDsXzABEMpahg8f+r7hNEJsK20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB186312.namprd11.prod.outlook.com
 (2603:10b6:806:595::5) by DS7PR11MB7905.namprd11.prod.outlook.com
 (2603:10b6:8:ed::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 13 Oct
 2026 16:41:46 +0000
Received: from SA3PR11MB186312.namprd11.prod.outlook.com
 ([fe80::fbe8:9ba6:fcd0:f0b]) by SA3PR11MB186312.namprd11.prod.outlook.com
 ([fe80::fbe8:9ba6:fcd0:f0b%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 16:41:46 +0000
Message-ID: <c9375bbb-1528-4221-8052-f6fa8aa9bf18@intel.com>
Date: Tue, 13 Oct 2026 09:41:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net 2/2] idpf: release PTP before freeing vports on
 the init task error path
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-wired-lan@lists.osuosl.org>
References: <20261009212537.3996-1-emil.s.tantilov@intel.com>
 <20261009212537.3996-3-emil.s.tantilov@intel.com>
 <sashiko-outbox-166100@kernel.org>
Content-Language: en-US
From: "Tantilov, Emil S" <emil.s.tantilov@intel.com>
In-Reply-To: <sashiko-outbox-166100@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0343.namprd04.prod.outlook.com
 (2603:10b6:303:8a::18) To SA3PR11MB186312.namprd11.prod.outlook.com
 (2603:10b6:806:595::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB186312:EE_|DS7PR11MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 946841b9-6ecb-4722-4e1d-08df2948dec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|6133799003|4143699003|56012099006|5023799004|10063799003|10067099003|11063799006|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info: UIBHyWoEY4M+Bb7uQ/LhjDeXj8VcLFC4tQu+5TPFP6ofCmvHcIxgKSQNhhZU2mFUqHEp0UkD5cWzcMAx1+wjE/1Sy+TvzVcLd5XvILgtFJBjq9rfDUyHrqyfBxC5JbIgkq8xxBdBUWX2Zo9m5gmwS9fkk/yhAoaolusnicADeU/AvjrBSOIlI6PmWsPMZMEBNZpbRPseNjbGorP5aOiTjlDJOYuX9kYPNUQXWRuipIvcEu+qP8Rjqie8N4mMgcgLe+PKwDMS5Un+yIiT66jr+5661NrHEHt8/idnekm4am3ZrMK2rNlzwocHSShGxYys+8W56aQzkSfq7rBRXZte+kRcCVyGGPWkaKAXDHgnSkTAfngqNA7cvOMlXLmDuLgl4hk+YuEuk5nXGmoPEVRBQQRgww9mH1G7jzuDkMquTGQApUpqtQ3biIRKH1+NM0Mu+MqmeL/EM7uGWpbWaYnvY6UnY6YDHNjWXMzGnsdKOvCV1MZQEpPRetfFUUx+hYyFYf9dSXbQRvgc0tA8GLbSSSv1w6haKe5QqVA6KM0etUtPItRLSMjIk/reIScwcm6Bpc4oGw+MHzW6gk1yZVP4KjZcyUTJFPriOZRt1HsWFubIaLIY05by2927y7CPJMph3Luy16c4T47ziemdOhQ5GWxvCBQSpRtAfeXs9UdYVQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB186312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(5023799004)(10063799003)(10067099003)(11063799006)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THdsZ2lBVTdkSXNWaE9rN2ZzaGJPcGtBSkZ4MHlETFhIN3hTcjlOU1Q4YWJO?=
 =?utf-8?B?czVTN2tCWW5yellrKzhiMkp0MElEM1c5ZW9FcXhBMUdLM01YT0ovVjR3Szhy?=
 =?utf-8?B?NCtyVVVLVkp2OWQ5M3pBalN4bzI2OUY5UFBjN2pZcndYM0hkSjlaSzN6U0ZX?=
 =?utf-8?B?ekJiVFdUMEZNS2lEMkFrWTUyWG55YjBldW4zRDdRRHFRTi9xbzk5U0grQzdn?=
 =?utf-8?B?d2ViSTJ1cFZJNmU5SkRpODRiU2M0bGhnTC9GeFRubnBkQmVPbnhtRHJFQnpV?=
 =?utf-8?B?Mm5lMUo0SW0xTDVMS0NCZ3h2NFp0dzBoQjg2Z0xsVmFyVk95RW0ySFgwT1NR?=
 =?utf-8?B?eEJ3Mkphd2trd24rWldZcWd6U2c1TlQ4azhPWGRMamJ4TjN6QnUweXhualVo?=
 =?utf-8?B?VzBHN0ZpR25aUDRvb1luelZKTHNLZmw3dVgxenBGME80MjNPTi9vTEgyYmU5?=
 =?utf-8?B?T3dzYkpPUTRyWlRnMmlnK1EvZmszZWlvYWFRc3VaTVdlMmdMZnJoOUlKVU1Z?=
 =?utf-8?B?VVU1RmpLcXNZOEd3YmM1bGYzd1ZZN1VzbXZpSm13dlNPSVk0RHNTS2ZiQkJD?=
 =?utf-8?B?N2d4REFzSmVBYUk4aXlxcjRpclZTY05MbGZhYVVnSHpaZm5QSG5uN2ZRM1Ns?=
 =?utf-8?B?bkZSSTE2U05tSk42K3dPVDk5SEsxN2pjcjloTktabFVPdkFvYTJleExDNTFD?=
 =?utf-8?B?V2h1K21PUXBnOC93cE45eEVhY0dnTlV4YllScjVZR1p5NlBGZmlzbCtrRE5h?=
 =?utf-8?B?bTBleXhZYmRMMGI3M2ltbS8vOU5BZHZmTkJsVFZIL0FNUml3SGJqVmtZZk54?=
 =?utf-8?B?RWFmbnhLOEZmVW1mL2ZVN2kzWldoUnZJL0lwek5uTVcwVHcvb3dpYXU0Yk5s?=
 =?utf-8?B?YmY0M3ZLcEQ3Y05oRFNSOXdIbDUxbE9OOVlESjgzSDFaV296TGE3dGw4MTRY?=
 =?utf-8?B?RkFvci94bFRUTDJEYmc2UmRabFF6RHV0c3VhWitLNnpBNXJ0Y2tvUmJJZldT?=
 =?utf-8?B?aHEyOE1rNlhtQTFYaEhyMWJyN2FVTUpRMzBSci9MZ0huaTh3TkZCcldVMHox?=
 =?utf-8?B?aFFsaCtoMlFGZFczWTBtY0pqNGM2bGFqT2MvWHQ3TDNCbU1GZHMzS3pidTJz?=
 =?utf-8?B?ZmhZcy91Y1N1STFGVkdyZWVuRWpqR3dOeWsxMHI4VHBQQVFGVVFWU1hCMmt2?=
 =?utf-8?B?NXRvQmtLcEdLWWg1eTZ5SUU4Zm5hZkpGU1VLQmhxS3FqOHFEQWtucWo1REhh?=
 =?utf-8?B?dkJ1RmVBQ2VJK25GNjF0Tmtqa0o2bFgvR1Zzei9udG1Kd1o1aTYzeTZSWE9Z?=
 =?utf-8?B?dEg5NGxRRlZNSTd2R2VjcVFxVE1Qc09EVFU3Y1lIT3E5Z3I3N253cVNQMlVh?=
 =?utf-8?B?TGNjVXg4dUU2T3pTcGE4aDhzVmFHM1NlTFRRUkQ0UHIrQjFvakp4ak9BNzhv?=
 =?utf-8?B?YkdwV3c4LzNtaGFrTURmb2djOW52Zm5VSFhhS2svZ1QvaWFUaS9CSWk5UXNZ?=
 =?utf-8?B?U1VLbjBpVzF5Z2VWMlZJd1A3dDl1d241THhNS2E0a2lsRW9aZ2ptOEpLcllo?=
 =?utf-8?B?L0d5SENPMXRrWGlkSStJUzRsM1hRdjI0TzF2Y3k2dkxHRE9LZWFZdFFMdXRl?=
 =?utf-8?B?M2VYQ1NFcDFyanUvc3hUYUx1MS9mc20xa0V2QWFlWGVuNlgvUGFrUUZvVzRo?=
 =?utf-8?B?a1IyeWVMOHAzMDJkeDlsdEQ0TVBtcklvY1VxZ0ZET05hM3E1WHVTQ0NZMFY4?=
 =?utf-8?B?V1ZtY1RSd0I5UFZ0MXR1bjFNV3AyaStJVTVHbmtYVHIyTjA0ZlI4cFFQQTdR?=
 =?utf-8?B?WEJOK0JSRVQ1R243UytLQkwwY3pjb0dUYUxYOHY0VWFZRWdvbllQc3Yyb2Fy?=
 =?utf-8?B?Yk03YnFqUEJzRFZPMDNWT3Z1Ti9PL3FGcnRIeGg2bXNIdHBsbkJHaXhFU2FR?=
 =?utf-8?B?NmpiclNnNFFPeHlHV05HMEU4L3NHM3hUOU5YSjFTbGNvNzFRM0tMa2trK2cx?=
 =?utf-8?B?c21vQzhyRis3OFBFMDVEQ1NEVVVjd2lmRW1WYzl3dVZnRDRBV2NYc3c3ZHE3?=
 =?utf-8?B?MUErNnlUSHhocVhpZXVzT1VRMzU1aUZhajRxZmd4b2VraFNxNUo4eTA4aE1z?=
 =?utf-8?B?R0xka2pybUJIM1VWUWpNOW05dEw2UzUzT1ZhelVUMllyMFRXR1F4QVhVL2lY?=
 =?utf-8?B?VXZUWHM3UXppekE3VW1BR1ZURTlYL1RNQ2w3VXo3ZXZHMGlXTVlvenM5Qjk3?=
 =?utf-8?B?TnlpMXhLYmsraTlIWUwvN2kvdk9tQWNJNnY4bW9RUnVxVWt0WnhqU3J2VWEz?=
 =?utf-8?B?VGxJSmkvUU9qRU9PLzlVYzJxUTZYOTAvN0JEMUxORUVZbmFuc0xTckNod2ZY?=
 =?utf-8?Q?6BXp/zrbClLyJWlk=3D?=
X-Exchange-RoutingPolicyChecked: l8m7CqxuqDQUKSkgdOk9pDbsJIlcx2dLecJtCq+WJFmCkYgm1ikLgLqrs0nGtmgjsjNtrsVAqgVZ3A3rcMWRkYrJVIgRgJi0ZaYhFRxMmwVOweEAw48t+vPhELPQO7BDDuoYdavGoXiW6DqdArzZBRcck9fM2stWpawYluQtCjxw72gm9IhANR7rRoXk6s030wNNPuLRJLP/YXNyUlNOIdJg2W4cy3x70l/AuLKz15xErIS0TscT6xy4sGp9OSQuwBwSnK5L+VUFX+8zTJysYCyVJ0em2yBqfOn8+gSq5i3z+qQIuh84ngrLHw5xePF5JClga9YgpI3ZlWRILjLXYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 946841b9-6ecb-4722-4e1d-08df2948dec4
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB186312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 16:41:46.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFQSJ6G5rkUPsl33vgsSvXFwIwF5zI0rSHcJGOMr48nQpJ9RK8xj/ieKObFv3fytb4tTT8fVlU4OIy69Se2mTgJHt6Rzu9bqxtOdO9NHjTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
X-OriginatorOrg: intel.com



On 10/9/2026 2:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] idpf: double free of adapter->ptp due to concurrent idpf_ptp_release()
> --
> 
> commit 140d271eb2e765967ee1a351714e7ad1ecc7d8f6
> Author: Emil Tantilov <emil.s.tantilov@intel.com>
> 
> idpf: release PTP before freeing vports on the init task error path
> 
> Release PTP, which cancels the aux worker, before the unwind frees the
> vports, matching the idpf_vc_core_deinit() order. Previously it was
> possible for idpf_ptp_update_cached_phctime() which runs via the PTP
> auxiliary worker to read a non-NULL but already freed slot, pass its NULL
> check, and dereference the freed vport.
> 
>> diff --git a/drivers/net/ethernet/intel/idpf/idpf_lib.c b/drivers/net/ethernet/intel/idpf/idpf_lib.c
>> index a1c739cdd5406..9c541dd6ed4d4 100644
>> --- a/drivers/net/ethernet/intel/idpf/idpf_lib.c
>> +++ b/drivers/net/ethernet/intel/idpf/idpf_lib.c
>> @@ -1747,6 +1747,8 @@ void idpf_init_task(struct work_struct *work)
>>   	return;
>>   
>>   unwind_vports:
>> +	idpf_ptp_release(adapter);
>> +
> 
> [Severity: High]
> Does this create a race condition that can result in a double free of
> adapter->ptp?
> 
> If idpf_remove() or a hard reset is triggered, it invokes idpf_vc_core_deinit().
> 
> idpf_vc_core_deinit() calls idpf_ptp_release() before it calls
> idpf_deinit_task(), which is what cancels this init_task:
> 
> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:idpf_vc_core_deinit() {
>      ...
>      idpf_ptp_release(adapter);
>      idpf_deinit_task(adapter);
>      ...
> }
> 
> Concurrently, if this asynchronous idpf_init_task() fails during
> initialization, its error path (unwind_vports) also calls idpf_ptp_release()
> without locking or serialization against concurrent teardown.
> 
> idpf_ptp_release() performs an unlocked check-and-free:
> 
> drivers/net/ethernet/intel/idpf/idpf_ptp.c:idpf_ptp_release() {
>      struct idpf_ptp *ptp = adapter->ptp;
> 
>      if (!ptp)
>          return;
>      ...
>      kfree(ptp);
>      adapter->ptp = NULL;
> }
> 
> If both threads execute this concurrently, could both read the non-NULL pointer,
> leading to concurrent executions of ptp_clock_unregister() and a double free
> via kfree(ptp)?
> 
>>   	if (default_vport) {
>>   		for (index = 0; index < adapter->max_vports; index++) {
>>   			if (adapter->vports[index])
> [ ... ]
> 

I will address it in v2.

Thanks,
Emil
