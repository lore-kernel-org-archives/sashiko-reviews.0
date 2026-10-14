Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F43D2D47F1
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 04:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791953917; cv=fail; b=JIIZD2Hd6omzpyg6C+WuyD/S1c1efvfX/CjI2tMViBz7Xsvy6RoSFCaO6LJACClawK67+ug4CVS+ZvOXzmf8aEdb+eHdsOYW+9HGTvwBioI58uYW0UCQTm7/9m51NulRahodwmwsL4JZJjcp0bFzzZ3c8JhG1mAErIZmDZggivA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791953917; c=relaxed/simple;
	bh=ylOS5YZ97qOP9pw1+PiB2kROJITZJfltXN2bfufE5a4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d6c0N+zFkM0KjfM3sM95AhEaPOgMhTN8GRh3OsRvs23XuFBy9SnvBKRxfD4k5XZaafxIcM5d24kizT64ARkEQVuvGkH8tLQuL8ODrpf1pMjQ9g3CTNhyrchFNTQse/CCZpfMOfPKzr4cU21Rx2MvEOfhXxNV07GiM1+1qx4JWRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfn17MzK; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfn17MzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791953916; x=1823489916;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ylOS5YZ97qOP9pw1+PiB2kROJITZJfltXN2bfufE5a4=;
  b=gfn17MzKbHXzXEQM5YOk+0nxJ/mNog/n2q8BOOpdIMgZXKoEBDjp7rzE
   Wm2FvX1POpwMv6pIitUKcMMRdcl2NHz6pSQDuL/BxgpqwDLmI2Ytqi07h
   NaC5SK4qO/up6eDT3wvDLq6J5hPtX9kP17IPz78DcfYq7oJFUgxDc6hG9
   IjO+E+J3kqprQt4rfTXpwXwUQzkviNutuXxj5SP6xzxyZeQMlLtjAu52f
   WNl8P8JnWscWFj6cOmldHdQiD4F90+a0YoHNoShxzUfCOrGmegLgmms/b
   7rx5onLau5ZxLzVt7lb7i71Exx2hCgl9capUDEZXPUcJktNRAOmPjmCVe
   A==;
X-CSE-ConnectionGUID: VuUqNx8FSommWO6sUkvshw==
X-CSE-MsgGUID: jDlX1YoGSMW2uPPCeW4NSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="590814"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="590814"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 21:58:35 -0700
X-CSE-ConnectionGUID: wC3403bFS2+RCXwQ7z/nbA==
X-CSE-MsgGUID: FUX4bjx4SMqHo8LrZ6mQnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1271719"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 21:58:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 21:58:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 21:58:34 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 21:58:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tePRipoerAHFezuh1coUJ6aYs/ma+s5r2zFjPGNbVySTOrIIw5uO2d6WePYk0pig/O1RldTW1avoA9UKq/zPAPBmJkHfvhqG8qKtIXqnY+aZF+hS4oFpIPD9PqinilmjDNKt/7z7pbmimxtZxZQSYWBloqZTBE7SJogfUO8i3nF4h7MRrVVzrAGv9yGB5340q7jS78+/x43q5nYk85pfTTnRFoIgwbOaoMzBdZrRBQ14wRvyvt5N9l6cQ1nZvqm4EHNyRLaJ57R3LZGTp1W/6xtuu4+JnRqF4qn9lkED0x9r3vui5IQ792CB55Gcozx+NX/9b/FjJ3NDbNDL5VnjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yo4revRTLncFdBgSExrLNBKvW4UrQYglMVhCTbtHSJA=;
 b=qBcyNhUzWQl8psjjjxdpYLLKb6jP7ZVGiw3BfVt1oSEcK2BxtdKKtoGoa17XyR5pgK+gkZBt/bIPx+auWkC4xCHTXpMzqNam/dCh6U4URS8Ei1TZhNoKLuBms8xvkobCSxe5gvftbBJjpnR/0OieDq52b0dnek1o9KzkRlCufXSkpCtohkyx7RKsGbIFI1MeRO5NOZqK5t6iJk4ShZ/x/yjiwrkk5rmkS+nn5wKt5XR/UsmV+uz2q4O+Fm2rL2oQmJfLaRaZHhBULCujZsHkKPE/pSShcIqO5GmbpNbGvTW5gTdttaCGv9wA83ZaPgpgNLEo8Sgsu4DXvtjuU2eG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by IA1PR11MB7889.namprd11.prod.outlook.com
 (2603:10b6:208:3fe::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Wed, 14 Oct
 2026 04:58:26 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 04:58:26 +0000
Message-ID: <8c75a6c3-c95d-477f-a1b2-bc8f80aa768e@intel.com>
Date: Wed, 14 Oct 2026 10:28:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 01/16] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
 <20261013184939.694945-2-karthik.poosa@intel.com>
 <sashiko-outbox-170371@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-170371@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::15) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|IA1PR11MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 8453ad9b-eeca-47aa-dc52-08df29afc7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|6133799003|10067099003|3023799007|261009223027099003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: bGDVz2ppunEnw9+TaSE8gkzDLHmmt7lD3GfCL2LwA0FdKNsTZ0QuQb9Z/bPgmw6s2Z1/rITGw60QkUhWSwGdwPnd7dxzMocvGRic3jiOOXmy47gE80tH4VFAwTdyzgQhjjZ9U+/pBw+yQUAQZ93EY6aHSyxuu9ylXPrVcOgRZjODDE4c8+GV0cwqm15a1iYeO1Afm7JRr2ltXxJCwVuHN4sDgRaBeWdVB2tA+VXkU0kI+bJh29w0PWsMTlhUIhQmps28BcaoIEnEczEEU6USbRdCCznzIA9n+BR1iRBGFcJdycym3PSvJi1qzSKzoLwH9mzEdaYJRMQNF6MVM1rarp61dbBppTUTQlGugn9AlPekujIxsXFmDeUuk7cGqdCWQ05oGUlykr+4mR6F3/pEOigL+bsH2oDSh1aQPdbbCNptxZdkF5huJCGmOGKux7GYgBDIulir1OShmSzhH3NWhEmOcK+g4gU23obrCf0eQ0RBFtuCWH8aq4kKEKQUBpLhwpWrW6AI1KkIrmk1hE7GUR+EkwGxqnhUrXx9PJrMDbrc7z8F0syfoF9KNAJO8v6E8ZIl3ccWjumQIDlMv0ag6YM7ZXs+qAtmaJABtb2h7OmmczKpZzjj/gr7E7TSTFzVz+qPX8ZCJg07+2Pz1FJOW+08Sw+TkEd0ifgy9GbA/M8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(10067099003)(3023799007)(261009223027099003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnVyUTVRSlhOVFVPRlhzNjN6RnFXSWN1aFcxbGRzVnorUEhwclo1ZlRnbHI2?=
 =?utf-8?B?YWZlOTRMUWE3cDJHQkwrWGd3NkZDdjQ5LzVqMEZyb2F0S29CMytmbnVEUkpG?=
 =?utf-8?B?N1FnRGxzMHVOa2Zmak40UGRyYWVtUlFEWWdnQ0pSS0RHNXY3QzhDUVFHUHB3?=
 =?utf-8?B?NkZXdTljMWpsazR2ZnBESkxCSmU5NVJIRFhxMSt4N2tCM1VsYW11aHQzUVkx?=
 =?utf-8?B?UnpCUFdxRVBsTlFBRnU2akNjWTJ0YkVsRFlXRlFONkN1K2JXbFdMWDRHNVZn?=
 =?utf-8?B?TmZMdjBRa3FsZEI5SjFqSjBYaE5GdVp3cEpxN0pDZ0Q0YXJyTjFMdGVEbGxY?=
 =?utf-8?B?VEV1RURUYUJ1QXZvNUFjOTMyUE1TY1NidEpoakg0WmU2d1VzeWtBazZnMkRI?=
 =?utf-8?B?bUxMYldzemRPREJYdmw5QzM2WGVJSEp4V1EzazV0YzVHTmk0UFhWMjZwR1hN?=
 =?utf-8?B?N1ZPTXQwNk5Bd1E0SGE3Z0pzMGNxbWpoMXNVTDJVbFYrVlFrdy9rMVppaFMv?=
 =?utf-8?B?WDIxTjZoWkI5bE02cUtQZUFWVkx3NEdiZlpIcFJlcFRjZkV5VjBrL2YyVS9H?=
 =?utf-8?B?ODBKS3pGTEh1dFlFSjZpTGdKYVpRVnFsM1d3REQ4WVVnYWVPdFgrS1VGa2xm?=
 =?utf-8?B?aW9aNklEeDRGSm1obXFsbm5wbHF2clVYU3FPQ3V5SG12R3VPWEt3NCtxazc4?=
 =?utf-8?B?TTIxR3JxMmJHMkRnaE81cytQYkh6bWk2dmk1dkhjckFUa0tyYVh6VWt3ZFI4?=
 =?utf-8?B?RklHem5PRXJTV0RIQUZzR2tTN29DMzZTc212RTNRVnFXVmJzQVZCazRYamZV?=
 =?utf-8?B?V1dOQnNEV2ZWeHN0VW54VjVOZVZLOW5OZHhRNnhWMXBsaHYxQzc4aVFQSXI0?=
 =?utf-8?B?Tk1XNnhEbVlzdzVjWVU1SFZMeFhEampWWEFsbXJLMi9IV2ZnbW4xQ2xMdUhT?=
 =?utf-8?B?MHR5bmRLeGJ6c0ZTdVNKN1pXMXQ1aldod1lOOHFwMGVFdzU2NUN2T2poc0gv?=
 =?utf-8?B?bXNjMktTTXBob2R1SFZQS1RldEtXSDFCbTJ3SkdRMHFwMXF0eG1GNDdtNG9W?=
 =?utf-8?B?cGJkQ0pnNmN3MnQrMHFNcnNzTTh1KzVBc091UVAyRWRZR3p4UGZubVZwTnpm?=
 =?utf-8?B?cUorUHpzN0NES25IRVRBZkxUSmVaYnpSK3d4SEtudGZzYnN0bHpFZThYQ1pX?=
 =?utf-8?B?TVBjWEVRa2hQcThJU3UxbkJTZmxBMzI3d0ppVDZlbGw2NUJZbUlCanZ5MlUz?=
 =?utf-8?B?WnQzWllLbkRCRGpBUTRKSHVFYTNwRVhlajIwOUhsM2ovcHRpbFY5azJUNXpm?=
 =?utf-8?B?clkrdmk1cy9NOFJ2bVNSRkxXc0xTYnVGVzFtRHJWT3lvbDlPYnp3RUtsWlZU?=
 =?utf-8?B?MWNHV2hFYSt0cUN0S1dCVlJNN2RsdEhGa2hGUHlEWVJYenlTV2VFOHo2WHBS?=
 =?utf-8?B?UVlodlJFTG10aGhzS2IyME1aaXl2OG5malBUSWgyWnVHTU1UUlVjb09MYjZ6?=
 =?utf-8?B?Zmtrcm52RzExWjl0Ym9LN2NzOXo2V28wK0pna1BWUmR3TC9QZGxyRVZldm8r?=
 =?utf-8?B?b0d3bzg2MU1QeFJVWE5HcUNPNjJkRFpZbDk4YXV4cWJpbTBSQWZsaHI2eVNC?=
 =?utf-8?B?aENDbWhpaG9FdXhINXkzRjRFVk5IOENYR3Z1S2FFa2N1MDc5SlBIcTdobXN3?=
 =?utf-8?B?VTNJWi9teU0rUndwR1IzQmpFM25lTmc1dXBUbG42ZWhCdWJLVGNIb0lMb0pj?=
 =?utf-8?B?cC9iZ2hSWks5c25sUW5VcjZIdmpkUUkxMUk5WnByVjh3ZGsrTUdCQjZzTUtn?=
 =?utf-8?B?VFVjcGEvL1BIamY0N0p2YzJLaldmQTNtVWs4OGZTRWNlcC91THJFc1Q1SzEw?=
 =?utf-8?B?S0I0Y2Vya3h3dmVRampuZEdRMDA4SC83ZHh5cGpzaDVHd3cydk1iMzFveXN5?=
 =?utf-8?B?ZnRLbHp2SzUyV3h2VkJBd1V1QzNIQjlBUG9YYVlBUFJ1ejZNcUlSUlZaNG13?=
 =?utf-8?B?V0JtZExlWGlTeHNVOUdRS0lNN3NJWkpoWVI4MWNjc3EvckNtTU16WTdvVkVW?=
 =?utf-8?B?Tkw4OG81Y052Y2FlKzRaS0lJeWpDMXNZTDY3TXpNMUJEUHM2Y1M0UWpvMXFW?=
 =?utf-8?B?MWNyVXpxakxIRWZ5bHh2RnRFUFdLRTE1T25CVjZGZWx5cEd6ekd3YmhEMksy?=
 =?utf-8?B?RjJqTUwxZzROOGU2SjUzekRJZDQ4eWZJN3JXR2pGdTE4MERycUk0d092Z1lL?=
 =?utf-8?B?TDAzZWs2eDM5R2NjQ0w3TFJ1dnVLNmNKbVc2bEtqdXk5dktoVmVUSzJGYUFM?=
 =?utf-8?B?ZjVITlo4L0JHZWJXSFduSHBJTFo5SXVCT2FZVGJBQUo3NVFraUxYUT09?=
X-Exchange-RoutingPolicyChecked: XW3VwyoL/5DvRF1JOZ8RwrwhyLLdwTwraBAT1FNzUQnhFBn8ioBPfHY/HC7ejKfU7RLlU9c2m7YTJOguvfToudAanvjujL+iIkY0+X2KjNSpP6rt66raPwEktN6W1f6hP2XfseYUJQYJOu8tKPwjbsRHGu1N4imf52TokTOiqouayIY7GXYmYx8CD/zUcMdU+w/wucjbnJ5v1g8pId4FC6VeS5ctkvbTosqU4AOGUV70o0Sn/f+ufN/CbKaP3k0PoCT+/nSIowamuuaIPJ1Q4h4qBp6mDY0USKbOY8JqdxHFdk4URypVpxBwZl1oahPBpw1YthOgkjMX4bGxAGxOfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8453ad9b-eeca-47aa-dc52-08df29afc7e0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 04:58:26.2458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0iMaXnA0j/V5JfP3h6IQgznZHwRPpDf/w67FBdGWlALGRl9kSNMw6dYO54ICnU004SNpolhb5/TFcsJs9sWpeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7889
X-OriginatorOrg: intel.com


On 14-10-2026 00:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/xe/hwmon: PCODE active configuration corruption due to power limit init short-circuit
> --
>
> commit 96c45d5f8e540d8e962d44f94ea42a65f2c0cb61
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Handle pcode read failures of xe_hwmon_pcode_rmw_power_limit
>
> This commit adds error handling for pcode read failures in
> xe_hwmon_pcode_rmw_power_limit(). It propagates the error codes back to
> callers, including an updated initialization sequence in
> xe_hwmon_get_preregistration_info().
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 5edeac961ec33..0b46572bb3c88 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -232,9 +232,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>>   						  READ_PSYSGPU_POWER_LIMIT :
>>   						  READ_PACKAGE_POWER_LIMIT,
>>   						  prepare_power_limit_param2(hwmon)), &val0, &val1);
>> -	if (ret)
>> -		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>> +	if (ret) {
>> +		drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>>   			channel, val0, val1, ret);
>> +		return ret;
>> +	}
>>   
>>   	if (attr == PL1_HWMON_ATTR)
>>   		val0 = (val0 & ~clr) | set;
> [ ... ]
>> @@ -1510,23 +1518,29 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>   				 "Failed to read power limits, check GPU firmware !\n");
>>   		} else {
>>   			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
>> -			/* Write default limits to read from pcode from now on. */
>> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>> -						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>> -						       hwmon->pl1_on_boot[CHANNEL_CARD]);
>> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>> -						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>> -						       hwmon->pl1_on_boot[CHANNEL_PKG]);
>> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>> -						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>> -						       hwmon->pl2_on_boot[CHANNEL_CARD]);
>> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>> -						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>> -						       hwmon->pl2_on_boot[CHANNEL_PKG]);
>> +
>>   			hwmon->scl_shift_power = PWR_UNIT;
>>   			hwmon->scl_shift_energy = ENERGY_UNIT;
>>   			hwmon->scl_shift_time = TIME_UNIT;
>> -			hwmon->boot_power_limit_read = true;
>> +
>> +			/* Write default limits to read from pcode from now on. */
>> +			if (xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>> +							   CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>> +							   hwmon->pl1_on_boot[CHANNEL_CARD]) ||
>> +			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>> +							   CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>> +							   hwmon->pl1_on_boot[CHANNEL_PKG]) ||
>> +			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>> +							   CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>> +							   hwmon->pl2_on_boot[CHANNEL_CARD]) ||
>> +			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>> +							   CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>> +							   hwmon->pl2_on_boot[CHANNEL_PKG])) {
>> +				drm_warn(&hwmon->xe->drm,
>> +					 "Failed to set default power limits !\n");
>> +			} else {
>> +				hwmon->boot_power_limit_read = true;
>> +			}
> [Severity: High]
> Does this code inadvertently leave power limit sysfs files exposed with
> boot_power_limit_read set to false when an error occurs?
>
> If any of the initializations fail, the logical OR short-circuits. This skips
> the remaining initialization calls and leaves boot_power_limit_read as false,
> but the driver continues loading.
>
> When userspace later writes to a power limit via xe_hwmon_power_max_write(), it
> calls xe_hwmon_pcode_rmw_power_limit(). Because boot_power_limit_read is false,
> the read phase fetches firmware defaults (READ_PL_FROM_FW) instead of active
> PCODE limits.
>
> However, the write phase targets the active PCODE registers
> (WRITE_PACKAGE_POWER_LIMIT). This asymmetrical read-modify-write silently
> overwrites the active PCODE register (including sibling power limit enables and
> time windows) with the firmware defaults, corrupting the active hardware
> configuration.
We shall not expose power limits hwmon sysfs node, if this write fails.
>
