Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719EF3B5847
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 21:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077245; cv=fail; b=ubsbbYuZAZMFTjXwQ3gKQFWLzesWFEWKO1ae1uVs6grsXXeoHCJbg5ak48yNq+NYrLmhuIT9ntNPElmDeWUV3n4C6+9om4s2qLb4zta5Shfrscp3PUZvH1Qx3QboWYhasTy6rOeVT8bq9IYRWcpbhN4j70P3B6vR2h3f65tYAY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077245; c=relaxed/simple;
	bh=gVysCofzwkk8qvJQWUSac3Zf6m7wrT2oCW3JOTLY/OU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YrRk6H7bvnBtBJXAguOW7LR2x6aQBKsiPA68/VbLdNFvat4bl6F9/m4Kif2k4kTG0gng47m679yJGueYMAqRrH3zMc/OseerbYamceQjB9HByLHDqZP0fnU/M0gVbvgSmA1zVnJR79+Aklqb/meUyKu4bDhsOOO0KGeHKdh7t6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jt2eOxds; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jt2eOxds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789077242; x=1820613242;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gVysCofzwkk8qvJQWUSac3Zf6m7wrT2oCW3JOTLY/OU=;
  b=jt2eOxdsqjwxXzczzInLxB1V/8l9LyY+Q4jb0TiInxudiD+PJLsQb9Fb
   /zCgXVBT4I6ySw0amJLOd6+OgZeC+jmn62PJWakknhHdF58wENRhaVuMg
   k2C5/dWh5DXSEX3xLGBryaQD/XPaiKV+NsUUSkm42NghH3Ddlp026EspK
   Kv2387i1aG7UhcN6OTHXVcvVVPv4wTuPAVJg3SZV9rCFrAMrBHIHRHT+h
   2TnwbyzaMkRegminz2GeN2DfBQ17QGydcEMQwiSj4mHzSX68STOa84bvv
   JPSyK799Ra+/b50UXYLSqj8Wtq+tFx2BXZCpRXPeuVbcD4bn3uDyPgfgI
   g==;
X-CSE-ConnectionGUID: tAAtj9PBSbe6VuCbhWUrzA==
X-CSE-MsgGUID: hyWlmEr7T0WzJHMiGQ8qPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100135233"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="100135233"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 14:54:01 -0700
X-CSE-ConnectionGUID: qoXJXjYGTrese9HI0yq3wA==
X-CSE-MsgGUID: +4ynYRLSSb2LiWGNQcjdPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="275529262"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 14:54:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 14:54:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 14:54:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 14:54:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kS8mdTC5XxpyOHo9t+utTiQ8JRnymp83Y3Myb5OvZl3oYjXQFEiAZNijqJzmLmjMtnN/frGNlSuFFEMdEp6vkYrunOiOHDAixosSxAy0J5aklD1JAAN9yo3w9Mqnocd8hu+91ElFAcCsXEoZ0NpZxHdDs34EGxZgv9zTru1QFyM+aJJVYd8cMrt34H2A9QEjmtLjQ9C4k6qLqxoLHik1VnPhKlxU3rTabEXwRiwTUjHh2pEiYLuzelsGJRWogdw5hELJiDlWPVgnDmnVt/zineMi91FMSpwrybcloK98Oc/BBGPBiJvc9MF5o0yhEEJqrY2zRN0RFaLT25iDqOezGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJRvpN3NcdgyKvpWxjnMyQS9w5g8JD1Vhmpt5wuYqBk=;
 b=PzwH043aNTZlmGpvyl5QILwudariMgOrk2ACQo+I5YUWA7nsy0+ml1OD7DIavOTgEUg/0bG939BGRfn7OTsUzbiUZTTITc5XeA8l0rTiOSWE1OymyYp/rPx4vznq9BBPpbQtkZJwD31OurMtGNQ+0iNakkzCavBW5FS75/jdGBhGqw5civoZiYAZyQLeo2V5SqB0ArEckUzaduH+O+f+CHmYD2Pi3Js7h/b5m141srCJMPs/HsdsFMgse9Y9KY9EeJ4bF629VJqlzWwDPSXGNR+EtlaDcCQa+LAGh5KVxXq8k1owttKSOxkXo3eerVlom1l+Dcvb6PtQc1k7efMO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 21:53:52 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 21:53:52 +0000
Message-ID: <d21ab7ad-894b-4852-9e3d-3f1a1ee1e832@intel.com>
Date: Thu, 10 Sep 2026 14:53:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Inspect all forcewake bits for runtime
 idleness
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
 <20260910214528.021B41F000FF@smtp.kernel.org>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260910214528.021B41F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CY8PR11MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a2628a-7f6c-4103-2b37-08df0f86008b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|4143699003|11063799006|10067099003|6133799003|10063799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: e2m2pPvrFIjR8w9wwEr75mWEE+uuVcQ6jdzRTUR9xS40afdUvcZCqbSVmOvr9cHPeCkMVZA/fxOnbJe3yNEQSS27swVHioaJc+YyaRieiRb3NaO5pJvAeLbM0L036SlXPNUtQ6E9nGwB5BsJJ7bMU6iO66z0R+F/ni4C5whpQRZa2ZOvOkP0tw5ihmHktEgIGLdJ8z+W2pjlqURB5jnfym0BDQFJXHQJ7QFWNZwKJW5G/EjKbzOG9TuOLTM+4YTW1lfdQZM7Wtk0+AYRlgiZo4fqJab5smFfrd+xKL/cj0soV/Guv7+lWlSsJTFiagBQFtcit8VZNQEAnyIE5rvfnLE6kHO8V+K5eACrd/0ZM9blXOa3khAKPQnbpAhXtltPYNZWohi9xH3J29YCIzaBrnsEI+UHcnA/cdr8Z5NS/uOWbxIJ7OcfcY7MuLwKmB2Wu9Aq3ZLQCrV/n2lPLTsi99beYLD2WbyVxhhOHHYKqgB1G+f8gSJ+WImsPkFClnCYDLg4BeD/m9qkiE4U5fVVleNJHbxAX2FqYTUMT4Z2qf26ejrxYxTkSvq1ZP4EQeALJiwJblIr/ONib4VRM08kPURfp9lXUfOVGqpqabYXlzqJ2yhFOWAut6oSYcN6luY/bDBlCicvHhoEPkAMxPzeqVo/udjKw/p55iXrV2mRozk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7757.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003)(10063799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bms0b05RYkRqREtrMEZYL3BPY05RYktCVmJMdDZNYXVxVS82OFVyZk9uSlpx?=
 =?utf-8?B?N2s4UHVuaUNkdGN6NzJTU1dqanpZS0hMV3ZQMTNpcEE5Y05WOFI1N1Vxa2xQ?=
 =?utf-8?B?VllWanAxU3Ezbk9kNTNzamJZOHVEejBqV0tFbWFVOFN4aWZGaXI4Nlg0WDRa?=
 =?utf-8?B?NmJYaW14M0F5dDZvb3hCNTZxdFlPZE5lYW9VTjZkZG80YkhWcHp4L2ZreVoy?=
 =?utf-8?B?bGlqd0dQRXdtNDk4OFpLMEdURGZUbnNXajVJSTR0NlpLcGdUZHRPYzc1bldZ?=
 =?utf-8?B?aVFnRWpjSkYyTWhCSEZ2ckJiL2R0Qkl6eXJwUUZyN3RtVEthaFZtRVQyMnFk?=
 =?utf-8?B?TWNwQ3RFdmZkRzlQd1F2SngzVVJoTWNVZ0JrNFJiWXZRTWRQOEhWaDhaWWdm?=
 =?utf-8?B?RElITWR5L1hoaTZyRFZDQ0NOYlRweDJZZmJ2OXBTYTUyOU93TzEvRkgydHRa?=
 =?utf-8?B?MXVqemlnNEEwSWpuRzVydEdJY0p6ZU96T3cyS3UybXlxRHQyUXV4eVhBRTJE?=
 =?utf-8?B?clYxYlZueXJOdDVzNE1FWjluSlNyUndFL1NzNUtuN0E0bWQzeEpySkxVcnRu?=
 =?utf-8?B?STUwT0NaUzhZemZDWmwxYzllU0haeVpsUmFGMWpSYWI3SitIRlVqaXpNZVhv?=
 =?utf-8?B?YlRybysvWkJnME1jV1JqVWIyQWZ1YThtQmIyRnpibFZUc0JqSnJ4WFREZHZi?=
 =?utf-8?B?ZFo0TVYwOWdQQTl3ZnBkMS9ld2VRMXUxUHJzQ1ZyYlQ0ZkgrMlFQV1dkNlRZ?=
 =?utf-8?B?Tm1zSWFucUVPdzJ3aUdYWUR4MUcwcndhRVprRm1wMEZ3eHJHNlRmNzFFTXo5?=
 =?utf-8?B?dlA0eGhvL1R4L01jR3lxWVROVUwyRlRTbjJOWTl5Y09DV3NhNmIwYkVxdEoz?=
 =?utf-8?B?ZTNiMFg4OWpRZGw4UG1adURHclVZZGRMYlZXYWwyWU0zMWtpQWQrbXZNVzFK?=
 =?utf-8?B?NW1ZQml0b3pldUpqZitTdzJneVFsSkk3WURwek56RitVWjl3aHEzVG11ajlm?=
 =?utf-8?B?NlZOWWI0ZUFxSXV0M0p1YndkcHJYRzNHS1RaYzdvOXVXSkFmRGdjR3hKamVC?=
 =?utf-8?B?UVppNzNFaXRzUlFiS29OS2E3WTFmY3owZUxqQkhiSXJGSDNLS3VSMlBSU3FY?=
 =?utf-8?B?WE9uOEdxYm9vV2NKS3hlcDE5bUxTZUNKZy8rWFM0WWFOU1kvVFU5RHVKYkZ0?=
 =?utf-8?B?VmlzbzRKNXlpbC9HZG1LaVFkTlJIUENOWHF5S2Z5UzRjdGxNZzhobE54VFRx?=
 =?utf-8?B?UHlKS1FZMTZpM253RFY0RTBmSVhBZ1hZbVZyWG9QdS9qV3Vwd0poYXBsMXBy?=
 =?utf-8?B?ckQ3a3IyZ3ZUcG5sZWVZdnQ0SGxOZmFOdGtQL0tISVR5ckt3enpSYmZ6TG1l?=
 =?utf-8?B?TnFEa3h5M00xb2ZUUmo1SkxGS29tTTEwZjFjclFDblY0Ky8yaDFsVXB4TlFk?=
 =?utf-8?B?V1lnWDc5SlREM3VaZXVrNi9JbUJNb1hCdjhBeitSZk94ZnFDSzY5bE1Gem5r?=
 =?utf-8?B?TVEzTUhDYzhmL0FmTzdYZkJ0TjZRZTFyTHMzZjYweDE0Y1h0UWIza1BGTU9S?=
 =?utf-8?B?aVBCczlBWGRqM0pDVWlDNXNrUHNaUXRSR3BKbVJncDFvdHFVRFhVdFMrMXVm?=
 =?utf-8?B?R0JuR2Z3V3I3YnpVcEJWcFFxR1dPc2pNRXpjbGVESGZ2YlAwOG51MzhvQ0tD?=
 =?utf-8?B?QXNIWEpHMGhpdE1vTmN3UFhQUVI1UXlicGNIMWxDMUlpcVJNSG5hdU9hRGtZ?=
 =?utf-8?B?Nk1Id1AvaGZYbjM0MmZSZW1LSUR4TmZ6R2RXZTNCWGpRZEZLTUNxb2hSdldX?=
 =?utf-8?B?clc1UEwrbytOZ2NmUGM1Zm53SGcydk9ocXhrVUNVVmdyb0E1T1ZGNW1KSjRR?=
 =?utf-8?B?Z1prbTQySElTaHZuc2w2RE5CY0w0TEVyR2RITVhPZlVhanBtc2gzMGR3UUNv?=
 =?utf-8?B?eFhsRk5WbjdlTnoxL1hSV2Z4NG0yZ0xoVFZOK0RxWWFDQkpzV1pQeXBRbEhI?=
 =?utf-8?B?TTkxblpZSHpzS1RXYXIwNDJRN0xMQ1NRc2xSTGx4U01NaFRNbmRIZGNIb21w?=
 =?utf-8?B?WEdqMnhaREgzUlZqeS83alh1TjlQdEJsTVV2bGxuV1JRVENUTFdwK3l0cW9F?=
 =?utf-8?B?bnNMU2VHYVBTSkMvODNNOG5XTHBHL0d5S0x1b0VqblB2b3k5d3FUdGZpTUJm?=
 =?utf-8?B?YktzTFlic2I2TWJwZFBHcC9YUlk0Qm4vclRhaXpUQjJWMkNycEZQZE5aamx4?=
 =?utf-8?B?b3UyZGZLWE10SU9SeUVyekJZVmx4cytzSUpSRHdnTVJyQjBPRExteTBXdVhN?=
 =?utf-8?B?NkxjU29zcjVKOG9hRjYvbWU0VlVZT0lXMHdSdnNYVXBGdmJRVVZGbXZSRGpp?=
 =?utf-8?Q?yiSbqGeCisepbrXo=3D?=
X-Exchange-RoutingPolicyChecked: wzt03l+6wJzO+uMGPx1QFglNLvCWIoOCCOY2zXYgppH3EVVTEHhm+9VYxYYmCIrwv1yDhU7Ekl46+zxrf+flqk4C6/lthIr5PryfCk/GWQsz/gOA2QSs0AjOsxXpUUPErXizKA3HOUa9GXq2nhWSrMQGCPAEh7rBzCF7ig3n4UpYXUSjz46xkKr9W4tHWvq6TNsSN3Xth5r4LDwwmR4fW/usUmgzvo0uArQTguZMAQ+fOEp6aJASEfitx4pWp8l5AtkvlGGAMmogLO7cVEd8JBDNag9pIW4L2k2DU9+gVG0+Ap2JdmwSEhzT1/Lp8FtBnkqe8YRPacaZhpVua1TJHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a2628a-7f6c-4103-2b37-08df0f86008b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 21:53:52.0718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMhN/LE3FTBRIMwiUxTUhO7iJrl7lppTlIPYPQIHuG7WAUsAVi60ytw+agmBFqqscA5H4EBZWk+xQz12aBu+gSQYHnR7FeWjQwzwLADeBUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
X-OriginatorOrg: intel.com


On 9/10/2026 2:45 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The runtime PM autosuspend retry mechanism is broken, causing unconditional suspension even when forcewake bits are set.
> --
>
> commit 87cc16a66c9eb41f1b093edd9b83a3cac1ad67b5
> Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> drm/xe: Inspect all forcewake bits for runtime idleness
>
> This commit adds checks for all GT force wake bits in the idle check
> for runtime suspend to avoid suspending while the GT is kept awake.
> It also adds a call to pm_runtime_autosuspend() inside the idle check
> to ensure a PM subsystem retry at a later time.
>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 1e04e8ef2611f..278cfd390364c 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
> [ ... ]
>
>> @@ -1437,10 +1437,14 @@ static int xe_pci_runtime_idle(struct device *dev)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	int ret;
>>   
>>   	xe_pm_d3cold_allowed_toggle(xe);
>>   
>> -	return 0;
>> +	ret = xe_pm_check_runtime_idle(xe);
>> +	pm_runtime_autosuspend(dev);
> [Severity: High]
> Does this cause an immediate suspension rather than a delayed retry?
>
> When xe_pm_check_runtime_idle() detects forcewake bits and returns -EBUSY,
> pm_runtime_autosuspend() is called to queue a retry. However, because
> pm_runtime_mark_last_busy() is not called to update the timestamp, the PM
> core calculates that the autosuspend timer is already expired.

pm_runtime_autosuspend() does call pm_runtime_mark_last_busy() internally. So, the timer should get updated accordingly.

Thanks,
Vinay.

>
> This causes rpm_suspend() to execute immediately. Since the
> xe_pci_runtime_suspend() callback does not re-check idleness, the device
> appears to unconditionally suspend while forcewake bits are still active.
>
>> +
>> +	return ret;
>>   }
>>   
>>   static const struct dev_pm_ops xe_pm_ops = {
