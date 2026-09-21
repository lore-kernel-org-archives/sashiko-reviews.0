Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6077F44A3E2
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979699; cv=fail; b=GXw3a7yUUSeFqmyVO/XAJT5+dtx1oGLtquOwlXDPhe5wYd8pp9AndVNkokzgojeQvnDHo3EU1QbBBWWcJv6zQyAcYOTRdGsPSVkx7QL6foossZOJAQRGVd9fB/4T637xXLg8R4n04U1eJAHE3zYtscb11jPDw3m+GYfTmotOZQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979699; c=relaxed/simple;
	bh=LlMiW7XdHhpmt/HMHkeIo+YRcOHljIqx7CrVGPU038c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qNAOXLY3q0PPMcgxCODb6cQyc0sBhcfOAG8F3k7qADwH0GAKaeb3bNp2K47t7TMslGYLxZa07fs1XyPlOZM3Ub7uFIqIib3eQ8K6zmqzDh1g+D1SGSIwHUamQixlLUrKBJYrhIi6besNP5R/H2UbpJzMg+6+Yfhd1S339jLFG/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQRvGWIM; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQRvGWIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789979696; x=1821515696;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LlMiW7XdHhpmt/HMHkeIo+YRcOHljIqx7CrVGPU038c=;
  b=JQRvGWIMCjCwaZd2aitY7MH/864qmqIlEWviVoUJfMbGC2q1B/CK+tkq
   8w+74iewvt5zjU+NZ7nlqconGPwwPqYSvRwqfKoR2njLHduXQvC+/OwT2
   sx1xBmXfhCrkZLIwhNoJyuQS7df9ZXcgQfnIP6nyKoLTSIrg1ZsZxy4TW
   gHYtosLBNA6juOFQJY2PSvOCPqRgY5nv5qlMMM8ozG4F8JoyWbkUA3nOK
   l5cwM/Nk3b1Fce//g73lNWTMbsJI96Xv9U5X9BsLLlTHbNE7Y/gnDq1XM
   tpJcJQBebaU48VBaG/up0uIq4o8foEDOU4ZDJ/tyGNOaNDDRy5KWZ2rn9
   Q==;
X-CSE-ConnectionGUID: tcfK08fAT3u2awKvY0H7qA==
X-CSE-MsgGUID: YqRogr/ZQaiBflbqgYRuJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="94304297"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="94304297"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 01:34:55 -0700
X-CSE-ConnectionGUID: rAp1JuwySlemWD3KYqUW3w==
X-CSE-MsgGUID: NBeNvJEnSqiTbSUoT6hc4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="298818627"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 01:34:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 01:34:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 01:34:55 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 01:34:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uu1JeJzAq5lwx65NGAkgWFAb8VyIzA7dgs4fA7bXlOsSLFR1b8sqDI+wkZtMEp1EkEr6R9UtCPasYL+LsUwa9KXbMgAr7o473YTTeNYxlEfT7JFuweVemPfhV/hnlgQGbJv9PNcvyeeaIlVRCn9IZuyfMOfu4iNIEeRFSl9JBR8bDzEamEEbHe9rQ9c8OIkbkaPfp3irWcUFXVuYWnH+Y0oQLuRYR0qT+UG0bDejlXoEnk8ANaif7e+QbuFmosDLaMiiKIqv/9wqJileB8QjrXCTqz15EyT4wdnuePorepVfA44yb5LgI8QFMTTnlnnTTtKuA39//TYgKdziGGTssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRxjtijtDYPbjbVzzNRnP/QoZP3eZdgrF1Tpwfdjw70=;
 b=h8xLZHaWPs1YsVA3FECuuSjItZNzYH1zT77QJ8PdWBu7av3wZllQIyYAYcc6ich5BpRzQv1NhqPZI7jhUCFZgZOZi+AZ1vyfYSSyqYw/tjN4mw8d2f2dVEYz85W026Dr13v1iMk86Y6pSjLALiV3z5KVSk+0ABC6xWC0h58CpBPWsT5LFmleu/Cn9uU+g1eSdcD8HKGLy1ns/BMI73kW60moAMdex1p2Is4DcuyaG6r0l0WBBd+JyyxAeIQ6ZE9N4XvIqfbZZrvbGUxA15SoDGXRSBw5GRQNXlVuIF1YQ6baj68aLHzEPdKtVt9bXk9gtYahTWNSJT40WIYpzDnvyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 08:34:32 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 08:34:31 +0000
Message-ID: <7f84ecf4-ace3-41ed-a12f-72e4137b782b@intel.com>
Date: Mon, 21 Sep 2026 14:04:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/4] drm/gpusvm: Add devmem callback to get_pages
To: Matthew Brost <matthew.brost@intel.com>, <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
 <20260916112828.2528881-8-himal.prasad.ghimiray@intel.com>
 <20260916113638.C7C791F000FF@smtp.kernel.org>
 <aq2r+zCMr6llqF1J@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aq2r+zCMr6llqF1J@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0360.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e625d46-739e-4dc3-e0ee-08df17bb2862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ScRJb5cVl5NhtErMlQZars1c6lqDIuPBka9DyijUKmZgMVOP3FZgqfg28QUCy4ObO+i8TT47O1Rh4YrQvUjoisj7H9hseATxyZRIsvbXGOmO347Cp+ouFJdcwll+iuVQeAFkXRKg7lJQM5z1GYxoDrtZl/QrkXItD/7Y1YJde4b+pkmAudS1iFQkzREA562J9MYEQdbmLgyMngFx51BlwAvYexK2VEjbaj8apbvoKKo99UxUHdfn6fBM+I+ktEBOA0maFn9KhN3cby+CG6oWWqwdGCiaDQCVKNalZHXrsKiewTeIIyj148Z1fyVdGDQXQJzmpeqLQIJljUkKIirIwFkvSB9WwN29Cx+y6IdI+GwX5WUqy7C84NB97/PSn4eSxMvF9qoqA4Zzf2LpmHeeM41X54OgPYMv60j6IacpiivEsJ0IbORlxqZfgzqDKvCqrXt6Ruk0OqjgaqkU8OoONbbA17BgmtPiVBBw8AOIs/7J9XmIFfkFwS/e5EUhon6/7gMWn9vFmzGfvu1V61U+82VSDJWh/S0PeI3BHqZRKOiPg6ePgsKLJX6uoQchGkoMNBGum/QLEPIxsiaJ2QrVobf4fNSJOP1oi8kQdqnEpJg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF691668CDD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1VNYjAzNHRxQVV5M2ZsbElRS3BqKzRVYTlncWY5ekRUMjA1TWcwUXN1UStF?=
 =?utf-8?B?Nk52cm1iMFBRbExlVmd5ZXl5ZEZQUjdSN29tcWpsd3JRcTUxZHJ4bnhqNU4y?=
 =?utf-8?B?a3BqZ21EQzFZZlJwc2grc3kwNG9YTlVsS29xWDF3cWo3RGxXYjVBVXlrVysr?=
 =?utf-8?B?dkZFa1ZaNlBYV01Pd3VFbmo1K2VsdEtpNFV1ZXRKVW1qTmt5RHBndkNQM1ky?=
 =?utf-8?B?SDhQVjdtNThyaXdnT1FuYXJMNElqdkNFcFJPSkRDaFNKMG9EYkhRcWw0Qysx?=
 =?utf-8?B?T3p6M0ZHWm5QR3YraUxYWHA2WVBvWWYrSHVHY3o0SThaU2F6V3YwT0NHdTZX?=
 =?utf-8?B?Q1Rrc0dqdWxXWTRNU0VBNUhRUEpBTTltNnJ5Mk05U1dtL1RJQzlKbVBuTnlK?=
 =?utf-8?B?a3k1VW1tUk5KK0dYWkh4QVJaWi83TlN6OWRTYzRZVFFnVFZGOVh2QzkybTF4?=
 =?utf-8?B?RzJxc3d0ZWw4eXFIZkFUYUxpaStXZUVvTUpNTE10WmRicXpibVFCMG9qVDls?=
 =?utf-8?B?WGlCZkczZGRXVTZ2ZmZKTzVLdk4wcWFwLzZ1dmZ5WEFhQ3hUck1KTy9qZFJ5?=
 =?utf-8?B?Rk5weS8yT1Q4Mll2R0h1dFZCKzNRR0F4amw0SXpwZXNGNFZLRlp1QUcvbmI1?=
 =?utf-8?B?Unlzc1NLTmtBcjZaUFpmQVE0ZGVhYWM2bCtKaTZHd0FQRzdUWk02YTNxeVRs?=
 =?utf-8?B?TFQxVnJaTlJxajRkUlBaYURqTzZLOWhtbEYzeWVGemhCa01DM3hwSWFmRVVC?=
 =?utf-8?B?Yi9paHZGR1NSSUVwSGoyTnIzZG8zN0h2KzhZK2FKeExyaVhlamV4WVI2S1Yr?=
 =?utf-8?B?VjdJYmJwRzVTc3dVdUdVTUtKN3lnU1JIUmQ2a3ZhcksvU1kxSXVOaCtCdDR6?=
 =?utf-8?B?QkRxb25MZG1ueE5OSExraEp0RHJ6eHN0M0taSHM1djVldGp4UnNFYXBpRnJr?=
 =?utf-8?B?SzhDNnBDaWNxR09SOU1NV3o4Y0t0Uk04Qm5SM2Roem8rSmh5aldIeldGd3Ba?=
 =?utf-8?B?L2VPcFBScEwzZzk1QUJjY09qVFNpSm9JbGg3OWgxMEYwKytVYmI3VUhNMTVL?=
 =?utf-8?B?OC9mRFNwNlhoNXA3M3IxM3JZUThqeW1HSHZJRVZlQk1FeDZJZGFnVHhubDdP?=
 =?utf-8?B?eXBRcEVscTJXVjJBQ3lyYnpJRHhvbGxVZzN0R1NObTdqUnF3RGo1cjdKK3Ar?=
 =?utf-8?B?UHpuZzlRd2xNL0xTV1g5NFVNbTBqYTRvam5nNWx2cm1BYWpVbUJJSEkzSFZZ?=
 =?utf-8?B?NUlDUGlkT0VyUzBVM3lGaEJFYld2aEhpNUdKRkp2MU1QQ2RicjBOVlhUaHA5?=
 =?utf-8?B?K1NYVFd0QTkyU0hLQ3JlcllmY0RSMTRyZkcxRFUrVWYwNTNlaVNkSld0d2pl?=
 =?utf-8?B?dGMycWhmbjZxdHZaRzBHdlZtQ1pkaXdLQWM3Rm00NnA5dmFyRi9takpHS2Jx?=
 =?utf-8?B?UGs1MGhKQ1dGZ3BQODluV1QvSFdJVFNJZjNES0dUa05iM0krR0tXM1RhaUx2?=
 =?utf-8?B?aFFCcmxYNFFLQXhsaHBtNXJrV29za3R3WEJ4OC80MzFxNlhBbFl3MWNsL3ZF?=
 =?utf-8?B?UEZSbU8vaTlxUEkzVDd3dzlENmk4M1R2OGFsbUNZcGtmWGVjc0FmSTllSWpK?=
 =?utf-8?B?UmViUzU4ZnlreWRuOHNyWitMRngwQ3pFMklBSjZxaUdFSUd0YzBwbDBzQnh2?=
 =?utf-8?B?bUZCVDRnenIvTnlhTnBtaDA3dzFWdEtQdXZrSzlMdmtZUzV4U3lubENWTWp1?=
 =?utf-8?B?ampyRjN0N3JWR2JxbnowNTQwb2VZdHEweE52N1F3cVBZb1VoclJ5UERCekVG?=
 =?utf-8?B?bVd0Rko2NXlnS1RRVmN0TFMwS0dVcDJRYm5xTTIycjkvVTFiaUNRTGp2UFEv?=
 =?utf-8?B?ZU1aTTdPS0FPWUo3bDVING4yVmhWRkhZRTJpdVJMMHpNSCt1U0tMeG94RE1T?=
 =?utf-8?B?aW82akFBZ0o5dCtTUk8vSXJMalNvakVyZ1pHTTRhejcvZ2RQbjMrTHhZUDV3?=
 =?utf-8?B?NWsxTWx3QU1sdEdyWVNkQ0NLc3ZtZjkrb09heXc1QTkxMk90VktDWk92dnlm?=
 =?utf-8?B?QlU1dnU2Um5kZzFPeTdqQUt2d0JRVXpTOUFoNGcrSklaQ3FJbk5TTVU0UUNz?=
 =?utf-8?B?U2ZKTEI3cDZCdjJOR3pvK04zaVZkRXorMCsrcm5aWk5FVmtOR2VMeTkyNzJX?=
 =?utf-8?B?NDRTSmQ1YWFBdVhqRGo0Mk1YSnRYcFRtU2VlZVFJdnh0bmhpNi90aXVWMEpL?=
 =?utf-8?B?ZE85aUVaYnZBbU93bUhrZlB4UDZrZmw2WkR1U2UvSXpFOHFLdHRoZ0RORHRs?=
 =?utf-8?B?dnN2SUtnVWJlL09TQUthbTQwc1NiNFhuT3NIZFF4OWhGQy9LVmprWHBidXNj?=
 =?utf-8?Q?7UuQFs4rNNQmPzLk=3D?=
X-Exchange-RoutingPolicyChecked: K6tvFgMNo39VrjytBny3FjsBDS82pcHFAOsARldgnd67HU0F2uMYj2bo/tO2mIdeJXmU7mtWoBSwFrl06vbsDMczqrhOhhZbSfYBEsmvs9KJ9Ee65UEyXBY/beKUXU+wHfRKDBe8RQo3ZAnrSJcpNMyGnyE6sWg1VmnS2BDh1kxsU8dE4FFJ96/nKjjujlT1gkA+eb5Ex19ra8Q5AI732SB8ops6OwKDkhXjddWzCspTgS+GSENDuUivgXy3B2U/aLVrRxLAnniu2bfiIbdsthlIgUfXWJKqZM3jvGJMbvxsg0+7f1p+acjwvJyH73YDEaDujDrjalwq6wqv21Qn7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e625d46-739e-4dc3-e0ee-08df17bb2862
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 08:34:31.8228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2EFdi8V6/kdHTXlMWBQccdfG1UJ05J2b1X/RWRsN96HFN3ILwH1eUB4VIbUuC8bkanTKy5P1LnFCCT7fTsW/hj3sMTfj8CSkzGtdu1WLYXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7408
X-OriginatorOrg: intel.com



On 19-09-2026 02:54, Matthew Brost wrote:
> On Wed, Sep 16, 2026 at 11:36:38AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] drm/gpusvm: Type confusion and memory corruption on foreign device coherent pages
>> - [Low] drm/gpusvm: Non-contiguous device memory runs merged when separated by system pages
>> --
>>
>> commit 26edb821373f785b22418001719e2435aed329fe
>> Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>> drm/gpusvm: Add devmem callback to get_pages
>>
>> This patch adds an optional drm_gpusvm_ctx.devmem_fn callback to get_pages.
>> The callback is invoked for each contiguous run of pages backed by the same
>> device-memory allocation when processing faulted pages under the notifier
>> lock.
>>
>>> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
>>> index b6c9d3a07dc81..6cec70d6f1859 100644
>>> --- a/drivers/gpu/drm/drm_gpusvm.c
>>> +++ b/drivers/gpu/drm/drm_gpusvm.c
>> [ ... ]
>>> +static void drm_gpusvm_walk_devmem(struct drm_gpusvm *gpusvm,
>>> +				   unsigned long *pfns,
>>> +				   unsigned long npages,
>>> +				   const struct drm_gpusvm_ctx *ctx)
>>> +{
>>> +	struct drm_pagemap_devmem *last = NULL;
>>> +	unsigned int order = 0;
>>> +	unsigned long i;
>>> +
>>> +	lockdep_assert_held(&gpusvm->notifier_lock);
>>> +
>>> +	for (i = 0; i < npages; i += 1 << order) {
>>> +		struct page *page = hmm_pfn_to_page(pfns[i]);
>>> +		struct drm_pagemap_devmem *devmem;
>>> +
>>> +		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>>> +
>>> +		if (!is_device_private_page(page) &&
>>> +		    !is_device_coherent_page(page))
>>> +			continue;
>>
>> [Severity: Low]
>> Does this continue statement incorrectly skip resetting the 'last' tracking
>> pointer for system pages?
>>
>> If a virtual memory range contains a device memory run, followed by system
>> memory, and then the same device memory run again, 'last' will retain its
>> previous value during the system memory iteration. When the second run of
>> device memory is reached, the subsequent 'devmem == last' check will
>> evaluate to true, incorrectly skipping the callback for the second run and
>> violating the API contract that non-contiguous allocations are reported more
>> than once.
>>
> 
> I'm not sure what semantics we want here but per kernel doc last should
> get reset to NULL on the continue. In practice likely doesn't matter
> though but I guess let's adhere to the kernel doc.

Sure.

> 
>>> +
>>> +		devmem = drm_pagemap_page_to_devmem(page);
>>
>> [Severity: High]
>> Can this cause type confusion and memory corruption if the page is a foreign
>> device coherent page?
>>
>> HMM's hmm_range_fault() does not filter device coherent pages by
>> dev_private_owner, so an unprivileged user mapping a device coherent page
>> from a foreign driver (e.g., AMDGPU) will pass the
>> is_device_coherent_page(page) check above.
>>
>> The call to drm_pagemap_page_to_devmem(page) will then blindly cast the
>> foreign driver's zone_device_data to a struct drm_pagemap_zdd * and
>> dereference it, leading to invalid memory access.
> 
> This is probably right for coherent but likely out of scope for this
> patch as all GPUSVM is broken here.
> 
> I tried to fix this here [1] but Thomas didn't like what I came up with.
> 
> Let's maybe throw this one on the backlog of known issues that should be
> cleaned up.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/717215/?series=164587&rev=1
> 
>>
>>> +		if (devmem == last)
>>> +			continue;
>>> +
>>> +		last = devmem;
>>> +		ctx->devmem_fn(devmem);
>>> +	}
>>> +}
>> [ ... ]
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260916112828.2528881-6-himal.prasad.ghimiray@intel.com?part=2

