Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9569833A014
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 04:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015803; cv=fail; b=UN61veTHA6R+XQ9iC/ICz+kk6ywqen8RhhmoU/pgj5YO9Ja34w1e0NtMMxLPHmyKcw5nhugCQb+gfYYiLgRxfaNOlwpY4fDUuKtoi1iz97Z8IeDLdqrKNB3CI24owUpq4Zlk9hGMVtikceZMhI4gONhTlvW/nw5oaMsKTAmc2jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015803; c=relaxed/simple;
	bh=ozy5jm6ecXgpGCDLTRUY4oCQik+csLArKoSlVI7aAZU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p0zkG5+7MRbyLMU6ft1Vn6OqbeuYwiJVQCBNERqXkifbcFTLTlAsUPoB6CB630lOLKKnlyhI7zyV1YgtaY+ND3VY48QxvRkg03p/wBqel70ZEq/o6gQ70Ggzk41C7OMk0uTo2ij1XJQ+XVb+Q5fCIDKv64ErVWxJMBKYFSdu4iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nj7Y0MpB; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nj7Y0MpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789015801; x=1820551801;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ozy5jm6ecXgpGCDLTRUY4oCQik+csLArKoSlVI7aAZU=;
  b=Nj7Y0MpBJTA9VlkyYwua68Q+2WjCLlg5GnFU9J2VFKTpR/cQb7NHDWZc
   wiuNG86wZ+15YzSPqkxzGZ1ieps5gGPMYLcxldzQGuN+EtRKR+UGwvFEZ
   iO4H0DHKhyC5wxFN+HUIxZ2dqDpQH8yt7hroNCx6767cofbgAvKfHMzEh
   OMJj8bSOCTHQ6VV4CaO3N69/oyG6stNeyda23ffBNc8HJjlVa4qc0rgxm
   koJGNtiKwmgRTnwGIsTFOFMMl/OlWtDGeIUvYYiCZbLmVMBVEz2emWanb
   0pgADHCf72W9lTbQQp0mPWaPZ8NgTISuvmx2NzUpQJTIDvxS5Lz0ouT9n
   g==;
X-CSE-ConnectionGUID: w8UBnTJ1RFaIVPsjOFZ6CQ==
X-CSE-MsgGUID: XWEuLzoSQxy7zCVSCvyvAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91971186"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="91971186"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 21:49:58 -0700
X-CSE-ConnectionGUID: K+mWmBZPStOV0dcoGlqxfQ==
X-CSE-MsgGUID: 8v9szKU/QhiIplvh18/55A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="271033829"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 21:49:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 21:49:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 21:49:57 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 21:49:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXvAT2swzHm7ktdKYiE/hvMILizjGFJBbVpZ4dE2a8MKC8dG8W7NqT1Rwp0WcJG61bdSwBlz842e4eudmMzPMrkwFWGrZCTCBn8dr9E4oJ+PujYwjzrSnmNv8kWCCieEdXmttbinf7+KPSufgOrESNfPCqek0dPHUS8CxIFutTtvT9ola5MBXo56/mx8bvS1TTFoaP3Zwbs0N1buobwtUbI3NTZtUjU3V8YJYD6sQe79kKCkhdotYfmyMOXs/iYuB732QOzlljl87Z0tnuL5ab34Nz1QeTm+A6FRYCQkbqHRCz9UFsMkfKE04atHdehgCJj2SOnzMTTpZSuVhkX8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gND8+8oCymwmfZYXIY+DFKNI561o3moA2QEdSKjHShA=;
 b=WkNpiWe07Qi0PYLf1obRC9UOzyPvL1WiQ8CGn0GRa9XM3vW1eQX2fFoL73gAL9baN9qB/qI4KaB7m45A0o2izRmJ/0tabAYB6Yk2ubmZvARhAbtXYeUwks1V8CWbspyfjfGJX7YCGqcUOT5Vh9NOGCa+RJi793CB25DSHL9qAPSHuamCeexCUkdnGRKbLr8sMOxasEo8XNA007ilr1mdz6udTTXUxTmtYYhkV9BOLF2kF7cqy3WvZ/+Mtpn5L9EmDeXT0YmaHD2TXd7rKf+UgF6nrH3JugGEGa+FFtJiGisoHSDdjDFmOnWHX/6lQZz957+X5gMckbF9SW/J/W32JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7571.namprd11.prod.outlook.com (2603:10b6:510:27e::16)
 by CY8PR11MB6843.namprd11.prod.outlook.com (2603:10b6:930:60::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 04:49:55 +0000
Received: from PH7PR11MB7571.namprd11.prod.outlook.com
 ([fe80::5c37:7a32:46d5:a8f4]) by PH7PR11MB7571.namprd11.prod.outlook.com
 ([fe80::5c37:7a32:46d5:a8f4%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 04:49:55 +0000
Message-ID: <7ee1a166-bab9-497c-adf4-2872c2f6668f@intel.com>
Date: Thu, 10 Sep 2026 10:19:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/12] drm/i915/dip: Enable Common SDP Transmission
 line
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
 <20260908062224.2897987-12-ankit.k.nautiyal@intel.com>
 <20260908071133.82E681F00A3D@smtp.kernel.org>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260908071133.82E681F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To DS0PR11MB7558.namprd11.prod.outlook.com
 (2603:10b6:8:148::11)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7571:EE_|CY8PR11MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: fa99b510-88b3-4c3e-4c69-08df0ef6f47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: V/gdJD0CLdMGDFicH4gKCcoHG1A/C7DbQI1YkqbeFYD+nfE2jOU+KMQroAALCwXhZdXE9dOHT1Jy/hT6Tp0dteDG8b6oIh8ro1XrUMPPWixbPJqLUiVeyC1eBLYhLrmDuMHMCfNDTdSdeLStnQutqIePJR6mAQ+oBviLMI8GfMhaelKjn4Ne5hSrR9zDog1tWZ6Dibb+Oha9RxelODiZrCwHWqiUaEd8tXyH4cSart6AaiuUJbcCiwwsWE4xJG3YCGG1pAfZbHKawpDADKGISQ9ZMLQGnILhz24r2epFa/cBcNAchn0G06QvfT0YxCztk5MGNq/m1MUWFS+JUdpKVy7WkFSUieMjIHwP+d8gfeEOpn1eiScy1vFIxaOOYyzQSWtyOjGmMKO5Qq/fkFzkhNuRcY6vWpPqNzGMSVxU2qYBpwKbR431w9qm9lGR+UsOQYSLkPPhH56t3D8cZCJZeHZhYntzmshzLutUSaZ7wDYOPv1BQ+QJthAHeGN5jAq0mUlOkGxBTq374bSpSGuVfozJdgDJDlKmz41oW7Sf8tLq7W8S8MBzU5+82BFZM/rflmS62EJh4uUgRuc4FOa7uScF9daTW8l72br78XHMoi7FJCfQlB8AbbCC0/D0FwWKXUUq+8QRS2iLkuRZ9Et59nIQizJeWPbmxY+OcSx/voc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7571.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkgxNUdVbjJhZGpWZ3FKWUtGWnRzQWpSN2w4Y3laNzF6aDJ5YjBnb2V5aENl?=
 =?utf-8?B?WWtCdWlsRUlWc3gzaHhGYXVXWURCZGVSVWJaT3FyaUdKWDRaWGZhNFN6QjFp?=
 =?utf-8?B?ZUV4YjBUREpLUmo0WXY4c1hWenV1UUd4WktFRTNPeUY3b3VrdXFvbzdHOFdV?=
 =?utf-8?B?OGZ6MjJUYzR4RUZqaVZvRzllSEcwYUloT1FXLzlBUXNnZDhxeTBtL1FzSVNK?=
 =?utf-8?B?ZzgySkJ0UXBUSHBKRUVJNTl2QjNvQzBKSDd1dWhKQlMvb0xnM0k0Ukh0NXM2?=
 =?utf-8?B?S09sNTdJcGdmT2E0Z3grMlhVbmJ1WUpnRW1JUWxTdU9jVTA2OUZsZC9IMXhM?=
 =?utf-8?B?Q25XNW4zclRRUlZYYW01dmlNdHJKVFJWWDZrdnRWSituNHhURnEvWk5uaStJ?=
 =?utf-8?B?bWNVZnFTbnNRWGhmUXkxU09wK1plVjRVbXNQVW80MHhGWjZ6OW9VcU02L2wv?=
 =?utf-8?B?dXBuUThzZWRLSkdobTFpZG9HMFA1WUhJTnBVV2dtcWtKWkNEY1FxTG41UjNz?=
 =?utf-8?B?MXpHaGFDMXJUZVdueG1PM0dGTlQ1R0lmcXoraVVFUjYrd0pvZ2pHeTZnTXI1?=
 =?utf-8?B?SWNSRkxRamFXTVd6SmF2MzhGMlZxTitsY21jeXpoODlxT1FFNjNoMmZHWXFk?=
 =?utf-8?B?QkZ2cEdpVUUxcS9ROGQxVzlHL0x3MzR6WHA3aGZnSUNrd0k3Y0dYMUE3YlZS?=
 =?utf-8?B?dWFkMVVrVlRPcWJRcXlMK09Qc09jYW5Cb1Z1WVZaMVNIcUd2Q21vV0N5bE56?=
 =?utf-8?B?RnRmQ3NPejFvRW5tNXVxbHZrZ1pBVXo0NjU3MkwxdXFhWFNOcEJnUm1LMVZY?=
 =?utf-8?B?V3I1ZjJFTEgyeHVrSXZTUHRHVzFLZDk2dkUveDBzRkFta3ZMVEZxQW9lbUJT?=
 =?utf-8?B?QUlSS05HWG41c2tSZS96Qkl2S29CNDhpYm1pRUp3MVVrd3NrYWNHUmRRZkha?=
 =?utf-8?B?NUd6ckRRdmpTTVlmcWZ0UjgwK3JCZ3lRMGlIbFhQM29yVXRDNEJlVXVwQnRL?=
 =?utf-8?B?TU9CSEN0cFY4SFhjT24vZnZ3RE01dDFlSkRoTWdSTURQbjRhWFVDUERPQTVt?=
 =?utf-8?B?bUJNVVJaWkVuZVU3SDF6S3lzaDJNTUsyWnpYUmhtUStJM2Q2aTdjNUcxcmZT?=
 =?utf-8?B?eTZJL0R6eXFqT0x4eUI5RDREREdjMTAyNG55ZFNNZWhza0ZBRDJ1UGdjSTZa?=
 =?utf-8?B?eXRmZ01GL3UxYUQ0T0NZanlNbFhqd2FVb2JGdDFTMTFMdndMNTZnbk5aYjdx?=
 =?utf-8?B?UWE0VFIxV293cWkzVEdkNGd5QWRHeFRMYkdIenZYVVNXRE5tdVVNaXE1Vis3?=
 =?utf-8?B?Vnl4UEtWalMyNXVXOTI4T0MwMExRWjM4c3JuMnhTa3paL0VmTjdEZkJEWG9E?=
 =?utf-8?B?aExQaVliWVJrUEhHL2UrRWpIcGNXOWZUZ2ZwVE90bzhESnFhdGZnMmVNV1Zw?=
 =?utf-8?B?dXlhNlI1RGtDeExUc2Z5MUNEYVZmZW1XbC9KTGJWVkljanIrS2JLVjB5NnFv?=
 =?utf-8?B?VG1WVDhVbTU5S3RwUkptWSt4d1UvRFNFNENxUXExWUJQMUlDY3lmUTJWOHRY?=
 =?utf-8?B?TkV3Q2NHTVBMZzd3MmNhM1VBVndEckplM1d3L0FEaVhwRkpPQjR0MU9PYmlM?=
 =?utf-8?B?Y3hQdzVqdWIzYzlQSFZqYnM2dkY1cG9DRWF3V3lHWGRiQ0FBWkxYMWhZdUJ3?=
 =?utf-8?B?cGlmN2wvT2prcGJScHg1cjRkbjY1cUZIaGxLWUFOU0djSU4veENqam5hUnlE?=
 =?utf-8?B?RDEwc0NnUnJYMWZLQXBjYUtESUNscUVBZ3U2bkZ6WHRaUmZYYkNhcUVnNlhP?=
 =?utf-8?B?alFWLzRwS3VjeTlpd29aY05SaXZCZXZqSTNvc1E0VjE0QjliRWhkdjg5ZFor?=
 =?utf-8?B?anRpeFkyMTV6TnpiRE0zaGptZmh5dlNucWZ4bjFQMDhad242bHQ4YlJVeDNK?=
 =?utf-8?B?Q2FHQTdCM0pSNVdacUF3N1VVLzVPTTJsei9XNWZNTVBQSDIrc0RhUlRxWTRl?=
 =?utf-8?B?UFBpbTh3akxrZWk4a1VpejNQaHFYRTJaN3BJaml6Q2hnUUdhL2wvcGgvVm14?=
 =?utf-8?B?NVVWa1JWb3lZL2k4ejgvdWlMVWtjMUIxYnI4VWZHQ0lRQWRhSS9maUxOdzY5?=
 =?utf-8?B?TmswWTNFYjFZMGdNT2ZQTkExQWZPUUZwZlFwQWdCTklFZXZjWmEzTWhUUlU0?=
 =?utf-8?B?aDYrSzhmZ3YyM2xFQ3docHVCbUZQUm1Sc0d6QllCck1abk5PcXpWUFFVbE82?=
 =?utf-8?B?NnlwK09zbi9LL0NsdFU5dmdPMHFuNkExOHcxWTNLYVdBOFNURWt5ZVgrR2hJ?=
 =?utf-8?B?dWkwNnQwVGFMV2lmY0FjSC9PR3VzdDdxRUcrS2pDQUFWNjRPSDd5dmFKMkxG?=
 =?utf-8?Q?MvMLNPQgfYNq1zE8=3D?=
X-Exchange-RoutingPolicyChecked: TNh+bXF7YJNq0d65FfOp7ez2wNMf9eSI6Dm0U/qCe23zrsU2UBTyxx3H52UxOdt9+L9ipUav481JgO3wCnyAO2PxX8tBpfi2v06pnw6c+7HI4ovw1pXo1E8hW2KQESQvMzmAo7Dzm3cy6Vhmd7tW8twaZeIQ6YqgWDXCaPdJkX2fUY4hRtuO+J944W4SDfL4QevLjjyAcx5OHCH3rKgHCyIEjsdREAw16NjYSAHnbyjjPOCtM9/6Gjf9+IeRKn9H0FsgFiWxTUIbwXari3tatC+WuRwU6s17AGsFgJVPdtQ0t4AjFNdpG507klnFxNUkG1i6J37DyohsnVxG9kutIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa99b510-88b3-4c3e-4c69-08df0ef6f47a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7558.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 04:49:54.9147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtaTi91QYuXIc0tj/8H4i92e70Vg+da7tFD8X7LA0cbNBjZb6cEyH9DdQUhy3TD76ZDg7EUGF0rLxNx+gwFA8obyGuedzy0bl0vNQb9RqhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6843
X-OriginatorOrg: intel.com


On 9/8/2026 12:41 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Integer underflow when computing cmn_sdp_tl with guardband=0 causes a kernel warning, and a valid transmission line of 0 is incorrectly treated as 'disabled'.
> - [Medium] Per-transcoder SDP transmission line programming is incorrectly placed in port-level enable/disable paths, breaking DP MST secondary streams.
> --
>
> commit dcefae9ad5800e7d0f8f1d55a58dfb400880ed28
> Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> drm/i915/dip: Enable Common SDP Transmission line
>
> This commit enables programming of the common SDP transmission line on
> platforms that support it. It computes and programs the common base
> transmission line and per-SDP stagger values from the crtc state during
> modeset, and disables the feature on pipe disable.
>
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -2737,6 +2737,8 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>>   	/* 6.o Configure and enable FEC if needed */
>>   	intel_ddi_enable_fec(encoder, crtc_state);
>>   
>> +	intel_dip_cmn_sdp_transmission_line_enable(crtc_state);
>> +
> [Severity: Medium]
> Since mtl_ddi_pre_enable_dp() acts at the port level and only executes for
> the first stream in a DP MST topology, will secondary streams' transcoders
> miss having their SDP transmission line initialized?
>
> It seems MST secondary streams will bypass this hook entirely. Furthermore,
> mst_stream_compute_config_late() in intel_dp_mst.c doesn't appear to call
> intel_dip_cmn_sdp_tl_compute_config_late(), meaning the values aren't
> computed for MST streams.

VRR is not set for MST yet so we are covered.


>
>>   	/* 7.a 128b/132b SST. */
>>   	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
>>   		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
> [ ... ]
>> @@ -3124,6 +3126,7 @@ static void intel_ddi_buf_disable(struct intel_encoder *encoder,
>>   			     DP_TP_CTL_ENABLE, 0);
>>   	}
>>   
>> +	intel_dip_cmn_sdp_transmission_line_disable(crtc_state);
> [Severity: Medium]
> Similarly, since this port-level disable hook only executes when the last
> stream is disabled, does this leave the transmission line registers active
> for other transcoders in an MST setup when they are individually disabled?
>
>>   	intel_ddi_disable_fec(encoder, crtc_state);
>>   
>>   	if (DISPLAY_VER(display) < 14)
>> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
>> --- a/drivers/gpu/drm/i915/display/intel_dip.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
> [ ... ]
>> +static
>> +void intel_dip_cmn_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state)
>> +{
> [ ... ]
>> +	if (as_sdp)
>> +		crtc_state->dip.cmn_sdp_tl = crtc_state->dip.emp_as_sdp_tl;
>> +	else
>> +		crtc_state->dip.cmn_sdp_tl = crtc_state->vrr.guardband - 1;
> [Severity: High]
> If crtc_state->vrr.guardband is 0 (for example, when VRR is not used), will
> this subtraction underflow and set the u16 cmn_sdp_tl to 65535?
>
> If it underflows to 65535, pps_stagger evaluates to a negative value
> (0 - 65535) in intel_dip_cmn_sdp_transmission_line_enable(). Will this trigger
> the drm_WARN_ON(display->drm, pps_stagger < 0) and abort enabling the
> transmission line?
>
> Also, if guardband evaluates to 1, cmn_sdp_tl will be 0. Does the
> !crtc_state->dip.cmn_sdp_tl check in intel_dip_cmn_sdp_transmission_line_enable()
> and disable() incorrectly treat a valid transmission line value of 0 as a
> sentinel for 'feature disabled', silently skipping the hardware enablement?


guardband can't be 0 or 1 here. DP always computes it via the optimized 
guardband path (intel_vrr_compute_optimized_guardband()), which calls 
intel_dp_sdp_min_guardband(crtc_state, true) with assume_all_enabled = true.

That guarantees a floor of at least 8 (GMP's contribution), regardless 
of which SDPs are actually active, so no underflow is possible.

That said, this does need to change once CMN_SDP_TL is set: with 
CMN_SDP_TL enabled, the per-packet minimum SDP guardband requirement no 
longer applies.

I'll set a 5-line floor for the guardband in that case, 4 lines to cover 
the packet types plus 1 extra.

Thanks & Regards,

Ankit

>
