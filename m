Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33BA376BE0
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 05:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791609591; cv=fail; b=m3p3mSmDvbRFWTtbhcjfit8ApUgQf8b5SMeSNOqoLewLtEHh0ylqf1hBeS+aP12jZ0aUtu+j0Qu1t5ta1j812c4MHSiYQRDiw8XYCRhD1yQjUXnHCivFeOKOnIYGGmN/Y6E3gKjPubH0mGKXQyv29hQ/nG414RikzUXDm5rcjJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791609591; c=relaxed/simple;
	bh=NJfJFbQ3DeXHpAU+WOw0n8tgCPpIvLjqqRsvliLZ17I=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WmJgHlrSpoHB2Zeb0bCpiY1fcxTblpfhXw+Rm0kDoEVIjW2lSFAcSPZoVbWAlZnckBuud1gcFwZPmk8md7fF4FgnUVPUIjlaCycNF7h2170E+5g1WCnuVkEEcNLUwhntIKfwh+TcKN59PoeJyv81jDwo4jF2g8KuAlNO38PZyr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5Pue4TG; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5Pue4TG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791609590; x=1823145590;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NJfJFbQ3DeXHpAU+WOw0n8tgCPpIvLjqqRsvliLZ17I=;
  b=e5Pue4TGpAXG2lS0AWBf7q12gJaHnzL2ChuBhCP2b+pAPuT/VfWULyUt
   PkECraui7O1ROzkb9wicapEr6nNoX49izA9IOZo+0GOiCdD1kMWc1FX8c
   PHgQwtGqxxJ6b495gCDUwk1nWEl7LWjWg6fniKqLKT2jvY/cuLHc1ouXt
   //8+cJBpLjZVyD6iQgW0SJZ3P5oMK0GJxF7E7mt8DOuy+FsVa8SOIF8xw
   uM8yc3ofGbrp4LHT15P815BFXomFdlx79y4BQZRxVT/TEq5/SyrS4adNF
   s6Eeu/H/PuyymOQ26JWVDnUSokZYVtH/alwKF9K36QLmhuMfTh+Rvm2pN
   Q==;
X-CSE-ConnectionGUID: Bri/u66lSduc9H8L5jpt/w==
X-CSE-MsgGUID: U3g9EaCvRYe2V99UPXOYdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="407917"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="407917"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 22:19:50 -0700
X-CSE-ConnectionGUID: 6n8SptxsRRuv4FKhKHZOpQ==
X-CSE-MsgGUID: vgvfKVpfQHK9V5J4W4f6LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="453492"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 22:19:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 22:19:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 22:19:48 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 22:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NU4OIdI1qZqknA1QVy80gVWdFForptuSLN7XftyPAL/fdkkgbLYCoTW0eMAi3nB2wqiVHyfqQe+FV1fDQbLA0XSB1s0AHw973UGrzV18EByQnCBdfbH03XRniD/BzCO1alcmGo8M9oAOiLC+FlujzhQ015sP+yyjWBiwvV1Yzg0FCIiwNDnimM8hv2u9G7vyJeYTelYs3GNnSvL1ZtQIZkbhTpr/FyWNd9/SU3RKllMORnA9833RGzEKa9W3xTHPPubeZ3K0tsF1Nwwh6u1kX5rlQb5LHUt6QMOu/t4SVPhxngDFYBSe3MCxfi1Eru9+cYhflphaskQJun3KPQ5AoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrOBVkWWkf9XgVnWGUzNOvxBp1MQ2XFxa3YiIC4xJrk=;
 b=i0j5gPNWgZ9619zqgSD6i+zEhwTnb4NAeu6Kns+E7MUuqJSFg2zyd1vo+XaJW9z75xdTXZ5sOW/9hgIauPVFmYb4P2aFEj6e97W5WUHCfZAz1BaPAjb261xx5eJOt2FnAlWxNKeApdYHkIVET2tfmgbezESuA8bau2F03pi/ttwD1t05SjAFhOpeYMwPl9FzSWpb+HhGNFdIkK+ii1StjGVuprCjxRkPNpLRdJceD5IGox9yhYqwGipfJkT04ezVYbr4XHL7zts/7ZNl1WH9XuDgUt/CNibC53+H9MTuzgw2knQPxkP7Tdm8HgBRs4+3/sAbDI4BBKCalt+oS8w7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by DS6PR11MB139798.namprd11.prod.outlook.com
 (2603:10b6:8:4a5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 05:19:40 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 05:19:40 +0000
Message-ID: <612a321d-9bf9-41cf-a4a9-aa17af0e6163@intel.com>
Date: Sat, 10 Oct 2026 10:49:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/14] drm/xe/hwmon: Consolidate temperature sensor
 availability checks
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261009120335.52973-1-karthik.poosa@intel.com>
 <20261009120335.52973-8-karthik.poosa@intel.com>
 <sashiko-outbox-165508@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-165508@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0303.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::14) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|DS6PR11MB139798:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b76952e-abfd-4624-9a96-08df268e15c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|261009223027099003|10067099003|18002099003|22082099003|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: B/EPk6M5ECgTIFwKE4DjeHdjsLFhXwlXsaDZd00MGk/RIOh3gKF8g8FFfCFUkEPbggWifC+FqLfZTGNuIVLAsFo9N+GarD6OM+aizgoK5oyD0fktseQ8dfKSepzEFYkmMW+q+N5aBQYg2jVf0NMcnSJ81MFWNd7O5WWUW82RZ44+D6WOCWkwrwIcGeENon2p5pj6xmamlGlMtCKv3krKBCQXiNH3p3wFuAK+QqOmP38+zz0Of4ELR9tWprzqiUlJIA3JdJGjE05SmQcYepIbVz/LMXJ6laD7TeyHOHC5vE27m6uoyqHqc25rZwPAW06F4/tHrIQz0ou7cN8rWVo12BIM+DCzGAfMWSbiyiRsH/WdZFS5xYfc/VstTZHoBSt7NFCAHdBfrQnC55RogXwsG/rYI5UTGXFu3iyO3dfkclpkmHPt/Jox354Lp1uu4vzMkPFKR14s46ZCIceulhwluWm9jbUyfENmPAtXSwmVqJFm0T9vddGDfTcLGH9lBMcDHIJawOwfYMeJBGKkS5RLLFy9EtuaGyPsP4zlSfbW+mLX/o6d/k4j0izHPbF9lFZzXhnzSXsjrKZU1OLF3SKAxe6QzMA7YgFurQ6C8yl25TQUPqL7og2CM8N89LnbdV0NF4Vyf7mTEIMHKWWVRUlCPO6XfkgTbHl7VJow/HBGRJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(261009223027099003)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0lFa3dSakNvdlVmZVNHTTNJdEw1eHgxZ092S0xxVVhZb2xnZnJyRm5KN3lH?=
 =?utf-8?B?elRnY0pndHdyK2p2ZTIwQXdIMUNZbUpSZWRPaFI1WnhJU1dnMzJKV3RIK3Zy?=
 =?utf-8?B?NUVDdVhQUlhQOUxlV21vUUxER2lrdDNyZ1dkNXNycGsyOEkwbStPRzZTajdr?=
 =?utf-8?B?eWpPdUFwREVjUlhVTTdudUJGNXZvejZxdVRDZHFIdGpNbm4vV013V0lEVG0y?=
 =?utf-8?B?aGtVTE8xQml2cTRmSU5BOXNpc2NRSEZWTkRGWUNuMDBmUjBYMnkzTnczczRM?=
 =?utf-8?B?K2dycmc5Q2ZWaHgyTGEvVmhIcStKajdndnlvWnVZTE9XQlo3UkZwamFZYnRY?=
 =?utf-8?B?dWZPYStZVnduRmdsQ2g2TnNXdXRlenJtRnZNVHk1VE5GUGExb2grcG9XT0lP?=
 =?utf-8?B?V1JsZHBaSmdaOFo3ZVBuOG0yU0JlR1Y3QksrN3FFaFpwOVhnbTRuMWNqOGZ4?=
 =?utf-8?B?amdXSjcwcEl5bGxHYUdDR2FFSUFvcTY4OUxEQlduTUUyclBNaW5uMVozTEZX?=
 =?utf-8?B?SXFOQm96cVJ4UGx1dkE0VzR3MmhScmh5Sy9sSnlqVE9LR2NVY2o1Z05SV05a?=
 =?utf-8?B?MmF6Nzh2VE1Zc0h3UWxuWkd0RHppbmhqcll3a0d6MWNaT3J6cmtaaWZ0NWp2?=
 =?utf-8?B?Y0NwK0lkMDlMdU4xSFEwbmwyWmNvbFBacEhDNWpqVWhjdG9VdGNiVXVvcytO?=
 =?utf-8?B?SnpDNUJ4bS9YUXI4T3dFVmdlaU1VZVdlY0hxRW1NeVF2cTRKZ2VCdUdtZ0tM?=
 =?utf-8?B?OVptc0hOQWZPR2hDRFVTaUd4cXVsQXBhQXo5N3VXa3ZtRGhYell6T0JtZFhz?=
 =?utf-8?B?Q21ITTVIYnZvYlE3UUZ6YkV5RC80S3pReGtOZmVPMjV0RFFFVll5bDBVWWRE?=
 =?utf-8?B?ZzI2YUtrNHlnM05SQ0dPT0dHaVE3YWU4WVVla0g4VURsSnlQYmlMNmQ2WnBY?=
 =?utf-8?B?U0s4d3BTRlhSM0UvNFYwekFBc2lpZHNRQWNrdHlvOFdFVHViUi9MV1hCcnZV?=
 =?utf-8?B?WURrWVBUUVg5d3ZLbmNsb24vVWF4YkZIdVN5WTRpazN6eG82Tlk1K0R1TmlJ?=
 =?utf-8?B?a2cxYW1KNCtvelJBbnIyVk85bTlLUnYyNExscmhrT2pUMG9mYUpoeGJYTTNz?=
 =?utf-8?B?c0JPY1JEQytYeEJqQ3FqOTgxK3d2cjFjekd2RkhBUDJCNUc5dzRVU0ErSi93?=
 =?utf-8?B?dFdJR3lRUVNZdE9NaVJYVHpJdmY5azkyVUJEeU9iTFlKajJKZ3FaN3plSy9W?=
 =?utf-8?B?V0huMC9nUnJ0NEdFSUxpR1Q0OUpnK29xaGoxeHMrbUNQUVZhWlVsaE9LSG5S?=
 =?utf-8?B?blNjSjZFb2NnMDIxR0ovZ2lOdHlURnl2MnFyVXZ2eDExaFFlTStld1ViaFl6?=
 =?utf-8?B?WlJQOVBrclJMelJObEJ4QkxraU95T3kzOGZ6U2VHNzAvUHdCQ1o1SUpxanN3?=
 =?utf-8?B?eFFYbHg4eWZjekQxWHBmRjNvWkRhRnlhVUt4ck1vSTB1WDdxdlpQV2dtSHc5?=
 =?utf-8?B?ZVJLR05jNlV3SGN4SDZzY0t6YnQyRStsbW9JRG12UFZLeVpkMzFobm5tNkk3?=
 =?utf-8?B?MzlIZHEzeS9YQmxuUG85M3NqUUc4bDRUTzdob3Qrc0RSZXNZdXFnV0wrMVBn?=
 =?utf-8?B?UlU1S2tITXIvUUgvVEhFbkhIQWpBWi94dEN4dWkxbnZiL2kwWnFEVjdtdDg2?=
 =?utf-8?B?WG1jUE0xUDJ5bUlLQllxUTdNa3NxZ01lM0JmUTRkNXBWV21ZZmhWMkpYYkgw?=
 =?utf-8?B?VThFOVAwWk0vcVlWM3QwNENDUU5seURpMFQ4aVFGc0lsVitVTkV3T0k1RHZ5?=
 =?utf-8?B?cVFYbGNHYlcweSt3RWg3dmVXU3JkUzB4MjR1R3hCTktEc2E0VTlTT29mTjAx?=
 =?utf-8?B?VExSSm1PMndSam5LTFZsdHp2L2JPYkRSelAzeVBCZ0dzclJTMythb0tONDVq?=
 =?utf-8?B?TnZrM2U5dlIvNWU4aHFicmdlNXc3RktjSVZLQzBuOHBXOVJXRHNTWk42WG9T?=
 =?utf-8?B?Z1NRU3lwMTVRNy9ESzQ0enBBWVdDMFcrTEI3MFcySVBDbTZsSC9nSEtCbDBU?=
 =?utf-8?B?clRkcko4ZkcvNFc4RWlodXZKWWdKNTJPMmI2a0N5VUFRVnJtYjZVaUFWL3dW?=
 =?utf-8?B?V3FTWjl1bmRoT1RhazRyUVEzQ2RqaHpXS2JsYVJnKzVvZElLY0tGZStQTzJH?=
 =?utf-8?B?dzNqTjBnaHpNTTZNdncxQnVyL3VwdEZqVENDVjllSnN1eFZjK1dHMFRTSmxD?=
 =?utf-8?B?QVpVdzI2YnkzZU1PS3F1aFp2SDJSSUZFSE9TNkZoVWdZSXJtbzFFQmg3OWd0?=
 =?utf-8?B?c0Z3SlhXVlViU2hsMkdxUEl5R2tyenhnT2ZFTFdqUThGaUpZVUkrQT09?=
X-Exchange-RoutingPolicyChecked: WlUu0qxaX9/PSCkZ24TVfBxq2nr3HzbOr/JS26vNei/ALWGP9wZC91F048VRePBvjgJHvDx4xrVfSUQtFrVQjxAgwa7JBoBZxSonPwy5CuDG5HyzgGHhcvHKvn7VUQEiVSjHkEJ3PS3SCaUu0Jz4BYlAfG5mJpgrDrdfhuxmiRpkoW4b/mfJOprY610i0eo2QWX0Z4NULovs+5vYZaZ7l4GqjpmG0hchvoQg6vBzLBIG/SM7D848S8Jjb76Uf791LkYSfjz+FbTm46MWpWxyft56uM8u7vOqNDHR4HYI9P3qoZSjqGEQmPDi9xFlYJqqgwvCE2U6nUond6bArInqJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b76952e-abfd-4624-9a96-08df268e15c0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 05:19:40.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGGfM/GG56hA3XzaybU6RMbDD8X8HXT3asgOi8VwA7JRs273P5nXDZcO6bg+Yks3HP57PlZCiFtZxmrE2fWI0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB139798
X-OriginatorOrg: intel.com


On 09-10-2026 17:46, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] drm/xe/hwmon: live hardware read during probe permanently hides sysfs attributes on transient failure
> - [Medium] drm/xe/hwmon: endianness bug when extracting thermal limits via union
> --
>
> commit bbb594b78c17c03bdb11a59f0ce797f39d14c3e9
> Author: Karthik Poosa <karthik.poosa@intel.com>
> Subject: drm/xe/hwmon: Consolidate temperature sensor availability checks
>
> This commit replaces is_vram_ch_available() with a generalized
> is_temp_available() function that validates multiple sensor types using new
> helpers. It uses this new function during hwmon registration to ensure
> attributes for absent sensors are not exposed.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index accccadbe3e67..62e341ef37e9b 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>
>> @@ -1008,19 +1008,39 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>>   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>>   }
>>   
>> -static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>> +static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>> -	int vram_id = channel - CHANNEL_VRAM_N;
>> -	struct xe_reg vram_reg;
>> +	struct xe_reg reg;
>> +	u32 reg_val;
>>   
>> -	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
>> -		return false;
>> +	switch (channel) {
>> +	case CHANNEL_PKG:
>> +	case CHANNEL_VRAM:
>> +	case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +		reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>> +		if (!xe_reg_is_valid(reg))
>> +			return false;
>> +
>> +		reg_val = xe_mmio_read32(mmio, reg);
>> +		if (!mmio_temp_valid(hwmon, reg_val)) {
> [Severity: Medium]
> Since this function is called during hwmon registration to determine attribute
> visibility, does this live hardware read risk permanently hiding sysfs
> attributes if the hardware is transiently busy or uninitialized?
>
> If the sensor returns 0 (which mmio_temp_valid treats as invalid) during
> driver probe, the attribute will be hidden for the entire boot cycle.
device is expected to be ready by this time, so this is not an issue.
>
>> +			drm_dbg(&hwmon->xe->drm,
>> +				"channel %d temperature unavailable, val 0x%x\n", channel, reg_val);
>> +			return false;
>> +		}
>> +
>> +		if (channel >= CHANNEL_VRAM_N)
>> +			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
>> +				"vram_ch_%d", channel - CHANNEL_VRAM_N);
>>   
>> -	/* Create label only for available vram channel */
>> -	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>> -	return true;
>> +		return true;
>> +	case CHANNEL_MCTRL:
>> +		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
> [Severity: Medium]
> Similar to the MMIO read above, could this PCODE mailbox read cause
> attributes to be permanently hidden?
>
> If the PCODE mailbox transiently times out during driver probe,
> get_mc_temp() will return an error, causing the MCTRL attribute to be
> permanently hidden for the duration of the boot cycle.

pcode mailbox reads use a default timeout of 10 ms, and the mailbox is 
expected to complete within that time.

If it doesn't, that's an issue to debug, not a transient condition to 
retry. So we treat it as a failure and keep the attribute hidden.

>
>> +	case CHANNEL_PCIE:
>> +		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
>> +	default:
>> +		return false;
>> +	}
>>   }
>>   
>>   static umode_t
>> @@ -1030,14 +1050,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   	case hwmon_temp_emergency:
>>   		switch (channel) {
>>   		case CHANNEL_PKG:
>> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
>> -		case CHANNEL_VRAM:
>> -			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>>   		case CHANNEL_MCTRL:
>>   		case CHANNEL_PCIE:
>> -			return hwmon->temp.count ? 0444 : 0;
>> +			return (is_temp_available(hwmon, channel) &&
>> +				hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN]) ? 0444 : 0;
> [Severity: Medium]
> Does extracting thermal limits this way introduce an endianness bug?
>
> While looking at how the limits are accessed here, the xe_hwmon_thermal_info
> struct aliases u8 arrays with u32 arrays:
>
>          union {
>                  u8 limit[TEMP_LIMIT_MAX];
>                  u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
>          };
>
> If the driver reads 32-bit values from PCODE into the u32 arrays, extracting
> individual 8-bit limits by indexing into the u8 arrays assumes a little-endian
> memory layout. On big-endian architectures, index 0 will map to bits 24:31
> instead of bits 0:7, potentially causing the driver to extract incorrect
> thermal limits.
>
>> +		case CHANNEL_VRAM:
>>   		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> -			return (is_vram_ch_available(hwmon, channel) &&
>> +			return (is_temp_available(hwmon, channel) &&
>>   				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
