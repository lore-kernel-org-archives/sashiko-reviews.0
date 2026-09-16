Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1A44E2F31
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 21:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592645; cv=fail; b=dLCPKNS3bmaSAEQepizmjeEljv0bndDUjQ8YvbsQNvhjYAmHT8yadVnMx7G1v8hBERG8uQI+5mR+lBQl75vbvsPl3J6NLONXYi3sHJJWrwtguhtteZKATccml597Cn543jWi2wLIlPPK2vmMyqKstrv6SyPPtWKr4jhhg7yBUhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592645; c=relaxed/simple;
	bh=lVVGSJlTMzOJBuEF47+mQU0nOo4cZEWubwOxk5Qq8P0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TzFaZ0KZ865+nZSed396wE9WWd6mxWGOrqrqR13X4o1m2bnk9QD7KmQxaI9UvSaA/s9IWJc58Wcjg2X0oGoiSYZuymdKKMuLQs8uldK8xP9ecpreEDHBxEAZcgOv3J89tVcrbpGH6CMbjQGHcnXAW7YACqG7Ejg99qG7VihivS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AekLf4Ep; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AekLf4Ep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789592629; x=1821128629;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lVVGSJlTMzOJBuEF47+mQU0nOo4cZEWubwOxk5Qq8P0=;
  b=AekLf4Ep5zMYfUssq6hr7HNycE+6ZZILWaLaBskuH445vhmT97Q2ZLi6
   iQ0oBr2NAiAF8YM6OnaKIGmGa58Cq4jgyQNtVk8ipdjXuicx6fdVj0R+c
   Qb+xOq73fnjYuw5r8nctF+QaHBl9mYFE62YKOZX9Cnr1GZmpBLTAh6miz
   pMbtVJoHBe9HpSwDH8u2LJFsrin/gJWjHwTCgNKO2VxVbQjoekUQcMfwO
   LRWTudJ2H+Rlx9kAk2Z/lc00xO678JcxFlZjzN9Tdt5Hqwzurewcodi3W
   Cj7RbHWuh/DwsyjZGMNZPb8aDrq/etxQQGCvqF159CT00w23uOo31lx4E
   Q==;
X-CSE-ConnectionGUID: ZcKRO2jiS0yQoEGqBiuAdA==
X-CSE-MsgGUID: JpDQw63/TzCuuGTo72LTIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93853924"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93853924"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 14:03:40 -0700
X-CSE-ConnectionGUID: mRL+mZAwRfKs2wZ475ODKA==
X-CSE-MsgGUID: mO8o2PWEQka1GMV3qvbMHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270167548"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 14:03:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 14:03:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 14:03:39 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 14:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C94gZRS++guaHcUsc9xu6pjISmOmhMoCHwagtC2hhl6nUDicua+MxXb+ygL+ChSJvbHL5m//W29j1gfqq/c+nXBgCM0HzIlyazRZTZnPGauB5mL4B3lYnHHVSzndwfplBFB8HFLgDdoifXG+hl4n1Dzup/v5Hx0VSsqbpctnqEaJtWX/FkXkKFw+na3976I9S+mEF0nItaATsZZmMuWSSJ2TsoBP82uKtKKbBYnHdnPYYiArELRAzwcu79MaImW4411PPsCgVWW1SeM7U9ug63gdKoJaqdsQBmcCqM34FvDh1P+6PWYEjikukwKhUn/OS+F2CtJ3kNnz2bKUufJ2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtabTcTDrf9jhVWmGK6e9Dvd6DlFgCoRh+CJkAIvbz4=;
 b=i30IRELvUhffh/KNbMtzJmNx8HX6b3rkKN4oHm6Zmi6L5jJQWYUdoZP8CjrSYps/4dzrKaLTcwdaR16bb50S33VVoPNEcWjTO0EJk5H6yu8HKfpdKz+WqTx/rG7xitw8xwAX0xkzCDCBmvuX3ppgvm2bir67iESfI4JAZMOGxuUYBewiHIEBvprHlsWU4pv1APAHb6+OJt+EwXDXcQP2PEz5lCPcAYHBtK2fqhVFLhWhetJjPv+q5vuhOHWmVESFJeU8CZ+iSdwUxgWrMfJFNRKNgHZ8nveyHRDErAb+MqWX3Yiz9N3INAJagGQgAlGD4EXQjC1QeTv4Ixi2nH0nSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA1PR11MB8544.namprd11.prod.outlook.com (2603:10b6:806:3a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 21:03:33 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 21:03:33 +0000
Message-ID: <ae41d737-d4d5-4bef-8312-0fce12d9d124@intel.com>
Date: Wed, 16 Sep 2026 14:03:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe: Poll GT for C6 before D3
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260916190614.3047807-1-vinay.belgaumkar@intel.com>
 <20260916192403.50EEE1F000FF@smtp.kernel.org>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260916192403.50EEE1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA1PR11MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2d8c76-a017-4730-5d94-08df1435f7eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|18002099003|22082099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: VT0rswW9Tq3DUU95uJ7srrD8dWYfL97Js/bVkK+JeJs/XKqAZzlbLSGcpor3cRw2iy4FKPJR0zhxTneeLarZxptyg3TmI6Li/n0zmvcFFyFABOxzBj9S+WFX+v3Ob+G9m8l2qoXJOwJMMM6cATmDMm0WaKykJv9L0OOeNTj5rCjqZiCo+MVcnA4A4+1M+MLITkPbiIg7Wc52Dqb3dLj6AWIbihmr6NxcxFwE3c/3/5+8kIZAmp+hDZlxz42j6xIAI5+YsJp5WeCbxIuDl4y5DNDwalGAock2bvowcX/HErhbI40QkZ3vUwkjUand2v6tMFJ2hiUL+84RTC6ZfmQgES+6Xq6ZLfsIR+Klk6W32B02G+priyrQor5F6/TcvLOLK6ppJbepMB5p/f0GkTh89XDZMrkmqZUFX1quEg0qrIeBoYx5gAGCxZVOxtzxQwA8Y2KnevOHfnxpg4CIxqM8JjMmSMkK4H/sVs1cY5MDBP++0zjchI1j/0lyQ5iqbrXS3kU4bM8dalHt6pFV/LjVfcF/dteyXaZ92MK974jnAG1m5SYZtMnH+fD6CbbaVOu5wGiyGe+1KDW/xugZt0CnDNGwgsrvEQlc8g+zHeEGP9pJrhPjQ0TD+EKMWuxFWHbh8YWhp6TU4F0Kh+sDZ0IwAEvGU2jH19IjULcqDwYWUrk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7757.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VytKMk9WTEszU21Ma0x4MTJvUkNjTFBFcEZieFgyMnh0Z2s2UUs2cXhyRXF2?=
 =?utf-8?B?MDlRUkRxV0RXZ3pBVU5rUHNJbWlZbTRwNzR3UVJFSGo2aGlCMndYQlArc0ds?=
 =?utf-8?B?amxIc01Dc2lkME1xUlcrc3ZsMFkxQVlPdFBWbTR3cXBUS1dMWkQrc3p6WFln?=
 =?utf-8?B?dGtHNUN3alE4ZEpESzJieTZJalVCNUtHa0RzRWZwZkpuZXZxU0RtUis5VzJr?=
 =?utf-8?B?Z2hoaUk1T0pUM29xVml5eXYyOWxGVWlSbWVjTXpVQ0IxMEdzbXNnMW1UWVRr?=
 =?utf-8?B?NmJKSldHT1N3cDV4UGxDYzcxd01CcTl6c2xaU0FGcWdNSDhGNjE1UTVJOFRy?=
 =?utf-8?B?SjRWbjFONXlPWjV4TjA3L2UzTUwvZHFDOEdoUmh4QWJRNEJKeXp1UUtDOXlW?=
 =?utf-8?B?MzhzU0w5L2RJVzJwak9OMDlEc2VmTXgrQ3ZNMzJsRUhXeFI4UDdMZnVEeDBI?=
 =?utf-8?B?WWhMcnd1WGhma2hCd0pnQWx2akZFeVRhdzVSK3FOdHgzNnJPRTh4SXZURmhY?=
 =?utf-8?B?c0RKaXRPc29pc1dOemk1QXNFQnUyUldCN3d3WTFjOTBJbUt6cHB5Y2lmOHU0?=
 =?utf-8?B?aEk3TW1EUHd5WGt4dlhEUVR4TXNvYnZtN2p4S3RHWkpteFN4cm1ycUkzMU01?=
 =?utf-8?B?eElSbmpWT3FvMmhXWHB3Rm9MT2FiZGNkOVpKWlc1MUNGS0hkR1BUdmtMMlB3?=
 =?utf-8?B?S0hoZGpNb21NdmR6TnVQaUJkTnJJWHJTcnpzaE5RUXNuVXdIdEpWWUp4TUlC?=
 =?utf-8?B?bWRISm5LcmJ4djNLU2ROdlBPdGFFZ1lUSDVneEpBYlRJVkRwTG1UaGFBeHZs?=
 =?utf-8?B?bXA0OHliYldnb2N1cXM4L1lhZDhVS1I3WEtPMjN5Z3lGelhHbXQ0WklibnB0?=
 =?utf-8?B?MXQ4UnNtaTZITGkxNU9HR3RIVExJV0psNXRIYmEyN1FnY2FlZlU1elJtVnI0?=
 =?utf-8?B?Sm5Wd2hyZjd4T00rb0VOeW1KT0pkK2k0K29vSllJOW5ObjdyNnpEK3ZiYTRw?=
 =?utf-8?B?dnVTZ3hiUnFueFAxT1ExSE9wek9LU1hRWFNyS0ozMkUwVERGY3ZsTGRUeFln?=
 =?utf-8?B?MGhQcDM2V2ZodGs5SkVnUm1GOURXZTNsZ1ZyMTMzQTduT01PcGF1cTVCVi9s?=
 =?utf-8?B?d0NFYkNheVAwMWdCc29GdnBNYjdKazI4NjI2WGdIK0RlNUpnK3VydjJ6Y0ZR?=
 =?utf-8?B?YUZlV21iNWJEVlRSUXplU2xtejlsdUFhRlJtTm9MQksrNklqUzBXMjRLVlB0?=
 =?utf-8?B?RksycTdpQ0hUaHlVV28wbGtYemtYbEN6eXYvdVhYZG9YMjBVMktyQXFJb1Z3?=
 =?utf-8?B?Q1JCNWNVWUJoY1ZsdTVaUHZzRU5xL2FlYlJRdjFiY3hJZTFWUVRSOFZUYnBy?=
 =?utf-8?B?VFBmMHNFbzFkazhhOUwyeGl2UzE0d1VtTGpaNUovUzhWemlvZGtWOTdENzN4?=
 =?utf-8?B?aHJxdHVNbmpjNjV1SEk5aFRJeEs1blVhajI1c0xucEJCVGNZdE5yZ3c1Z0Fm?=
 =?utf-8?B?UVcrOERYS05tTmwzWnFvNHJabWh6QVV0bWZCV0Z3NWMxMlliSUVLajkwWFlB?=
 =?utf-8?B?SEt4V3lETlgxNXg5VjZ5WVo3RGI1UDR4RThNR29naEtjcERRK2FtcnNjaG0z?=
 =?utf-8?B?TDFnWHZxb1d4cU1ZdFhKZWRJVS9PK0dQazVTLzNPQ3VEUGpXN3UxeWNiQ0I3?=
 =?utf-8?B?VUxCS0dFaG5ITzgxbHR1QU5PRElOejdhMXBpODdEZzhicWEyVmErSXBsYWlV?=
 =?utf-8?B?a2cxR3FoVldURy9IQklYU0dPbi91YXdkR29QWWIxM2svdE5hL21Rdlc0ZVA0?=
 =?utf-8?B?a3B5MG9OTmROQzVUa0d3RStxSUx0cHZoSTIzcG8xUXNROGFzWWVKV0hxSjB4?=
 =?utf-8?B?eXBhTkZqc0lvNDg2SzRsa3g3SHNzRWVMVUlGK09XaXVMWEMyS2FHU2FpUXl6?=
 =?utf-8?B?SkpLRGM1aU9lNi9UY0NJQUxxVk56NGJac3hXYnpSd3lPbUVIUElONjRpSlEz?=
 =?utf-8?B?anhUSkZUd2VLMW1rRXZrMk9NQlVabUE1M0ZHa3YweHhMZFBrSUxYcUtHblJu?=
 =?utf-8?B?WXBDQVFjZGVLMGNpVWIxdXRsMmpuYzZjT1RUTjY2TnJ3SWRoMDhmRUZOdmZE?=
 =?utf-8?B?QWtlcy9aQUFtd2FxUGN4empTM2o0QS9XZVpJbzhaYWV2UjdqWFFWbmI1cVI5?=
 =?utf-8?B?NGQ3a2tXZkRQK2drbGJsS1FGL1kxREx4QU5uOWJLZ1NPRDV1WFpOT2VsREhM?=
 =?utf-8?B?L3RtcmlqaWNTaSsyWVdFRExEcUdKRXJDdHpjbHVRZ2ZZSjdJeVN5dFdWSmg2?=
 =?utf-8?B?MVFzbkNRS3dTck1xTHVLa0dhUS93ck93ZmJiQ1N2NlpLVHFZNFZCYXRrOG1K?=
 =?utf-8?Q?nJ3Gf6KPblsWA3W4=3D?=
X-Exchange-RoutingPolicyChecked: U0GZSkQfHovh7UhJKwoHJlzqmDiTF/K3slF0Ct5RDcRRuQ/rl7z88LDadIExy2F0uybVB1x59gSndLu9xzkT/+sBKgyv1nU/kWtUJD1F98CEAwVV4Y5NKanY8s8muSnsDiGv2GvCdWLpJJ2KxE8Kr3vXSscOe77yb1IMwKcEVEB03/TaqbymdkTV92IL4COtPj005udPIKmzmtwvFDvCOebybf+WlW3yOFDNIg7p5LTjEtIvoIRAGysP/MGlND/87Z1PAP+O1awZdrSvk9QPTLIuedKnDZDfLeaEHvbyGmdivafahAw22dxrr+BasbeszR93F1ZOIGaaaApUpgnq1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2d8c76-a017-4730-5d94-08df1435f7eb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 21:03:33.6959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x40hoBCgSKTsiXwD4sRbySroY+ZIdiOBZ3SxjZwBJXCTeWt7yh2vPGd+x0PMPVf0ur0NX0VaHAaIwPvAt3D9HfPMjyhQpULACPnpgfC1XkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
X-OriginatorOrg: intel.com


On 9/16/2026 12:24 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] drm/xe: C6 poll after xe_pm_runtime_suspend() always fails breaking D3
> - [Medium] pm: device stuck in RPM_ACTIVE when C6 check fails
> --
>
> commit d48ea91e20a44679b212e2b189bddfe7fa5220c9
> Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> drm/xe: Poll GT for C6 before D3
>
> This commit ensures the GT is in C6 before transitioning to D3 during
> runtime suspend, avoiding scenarios where GT is accessed after D3 is
> programmed. It aborts the suspend by returning an error if the GT
> fails to enter C6.
>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 00b2b5dfb8f6c..d66d5a0339ae3 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
> [ ... ]
>
>> @@ -1394,6 +1394,17 @@ static int xe_pci_runtime_suspend(struct device *dev)
>>   	if (err)
>>   		return err;
>>   
>> +	err = xe_pm_wait_all_c6(xe);
> [Severity: High]
> Since this check happens after xe_pm_runtime_suspend(), which already
> called xe_gt_suspend() and explicitly disabled power gating (RC6), isn't
> this guaranteed to fail and cause 200ms timeouts on every suspend attempt?
>
> When the system attempts to enter D3cold runtime suspend, GuC is already
> reset and power gating is disabled by the time we reach this check, so
> the GT cannot enter C6 autonomously.
Disabling power gating has no impact on C6. GT can enter C6 in spite of it.
>
>> +	if (err) {
>> +		drm_dbg(&xe->drm, "Resuming - GT C6 check failed!");
>> +		ret = xe_pm_runtime_resume(xe);
>> +		if (ret) {
>> +			drm_err(&xe->drm, "Resume failed after suspend was canceled");
>> +			return ret;
>> +		}
>> +		return err;
> [Severity: Medium]
> When we return -EAGAIN to the PM core here to abort the suspend, shouldn't
> we first update the last_busy timestamp by calling
> pm_runtime_mark_last_busy(dev)?
>
> Without it, the PM core's rpm_suspend() handles -EAGAIN by aborting suspend
> but only re-arms the autosuspend timer if last_busy was updated. This causes
> the autosuspend expiration time to evaluate to the past, preventing the timer
> from being re-armed and leaving the device awake indefinitely in RPM_ACTIVE
> until another explicit PM cycle occurs.
This has been discussed previously. The next pm ref get/put should 
re-arm and trigger the auto suspend timer.
>
