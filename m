Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FED31A56D
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810643; cv=fail; b=LFiHUmsOBl/rJ8Jhuk+pw11qB1+OBaI4Fuv7lRlnB2QplVTYzTtEI2a9qeyl5449gOnZ/nrZm5P0NH6Jzcqf9b0Sy2ZcOGTkipG77kDiJV5Kgse5PBICH23wWheb5j27i/k3AT8iMx1Iagm88G7jGSfJdItRaRSidy6mCBIaAI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810643; c=relaxed/simple;
	bh=gwyj4p5MvlQoUM9UU9mwYhINww6FTK2Zzpx4c8PZwXo=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bitYNTv+lSHPvOMEmXbM7H3SmTvQhUbmLGyy+XWlAYhr6cCyIpDKNYGkKQhDPuqT4idNTXjEsKHAzU7rk5KPNkeA0rmLkfWInoqxU/wQnU9/ZqiNpCm6c1ll90YSuzlYx9bxbNLh2yjKK160oD8GNYTpQ1YnUh5ykOAYiT6bCiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZq/LUd/; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZq/LUd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791810643; x=1823346643;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gwyj4p5MvlQoUM9UU9mwYhINww6FTK2Zzpx4c8PZwXo=;
  b=aZq/LUd/W958yZJEkfzKUdYQ1tSfBmupn6tD9XPHGBm35bqz2Z0TRPpg
   155AiqVHGsoZgIGgOKUDTgYPBm59r+Hiskq5BVDKMAMhgfTRpD7nXResO
   Q2zbkJz4UYnm2c0tAocINE93TZ02sIXM1ZtlExh32YNeNMG0aazeFsTlq
   W3XdUPSQkBT1VCXqa9/CYVox40exvh5uWAJh4zAt1Yt0iv6yK2q+AqRJG
   Fb7U4xC+wlUgBkFkwNwdQ8MOEL4iR0aB4N8mQdwRH6ZaFBxdj3IsCYf9Y
   gY0u1Au9hycUfj5q2BxGW5DMmdYwqEgXY/qH5lKjlYGGBygfgrlAPwU5O
   A==;
X-CSE-ConnectionGUID: 2r6RukAKRcqJzwtHm5j6+g==
X-CSE-MsgGUID: nP9LXXMLQ9yof7CRnDaAzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="510270"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="510270"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 06:10:42 -0700
X-CSE-ConnectionGUID: uO988NvZSbugdsFQ5iSi7Q==
X-CSE-MsgGUID: XotV9aYPQU6k/YpSm/oGXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1203690"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 06:10:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 06:10:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 06:10:41 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 06:10:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYnyU/MI26Z2Cj8Qc93+MovorBFqOOuhRcIfkUsLGI8hqCGOxe+W/ueoU4Urpq+XHALkm0KktTqY+RUqaehicu6hqnaB+u/qCRIcbkxz7iH9Tdj6t5HMErjafO7cuQsCFDHbHeH4jWDT1m+/PP6sGUI7EXGIjSib8NZvoohtPjg4TmbVO0br/YZg/kV9sl0fCyw1laIciIzL/uwZD5rLgHsmJRGbqqQ4XcLyZbb3d51C43f5Lm1CWdRzP6imqVKWEz1QR34Oncde1dQDrUxzU+w+niGyUxxaHOD13WD1aUIiMmFMd4YUbXoy1XeMt0NocBanS8gZ7xQxSUuN8ZRkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrVOS0TTF2JnG5fFu7xKCR6bLy3rbmJoGJ+NF4MoGmw=;
 b=wyZ0PDX4cSRCFHrHoKrWqq719tk1msGLpiyFdlp5uC62eLViZi7gHPF7EiON1pytB1hX+KD4cbRs6/Ua12GKlZaSlpBcrvpx0iErVr6zfjvzjRCMn5ydiYrWdCVwyLIZYcDo8uFmJdPqorcNQ5Xjt2PsRgA48ls8IP71FOgmmCJ1zYyY82DSU+eh7WmfujOVndalxBBnWDeWsmbIxjGP8YVM7ooOEszCNgJznoieGsMdklE7RD3Rlu8WqpSxjKpR2DfLKFAbMOg+rfbROx7+WtIiFUdmsezH/whfiKE2FVH6eik6Ll46+l/lCWe5lAm6y22gcOEsCmOIC9+ml1+Z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by PH8PR11MB9771.namprd11.prod.outlook.com
 (2603:10b6:510:3a4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Mon, 12 Oct
 2026 13:10:38 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:10:37 +0000
Message-ID: <07be2fa2-b305-4f60-b25b-f484178118f4@intel.com>
Date: Mon, 12 Oct 2026 18:40:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/14] drm/xe/hwmon: Consolidate temperature sensor
 availability checks
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261009120335.52973-1-karthik.poosa@intel.com>
 <20261009120335.52973-8-karthik.poosa@intel.com>
 <sashiko-outbox-165508@kernel.org>
 <612a321d-9bf9-41cf-a4a9-aa17af0e6163@intel.com>
Content-Language: en-US
In-Reply-To: <612a321d-9bf9-41cf-a4a9-aa17af0e6163@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0242.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::9) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|PH8PR11MB9771:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e6ac86a-507b-40bf-d342-08df28623540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|5023799004|56012099006|11063799006|4143699003|18002099003|6133799003|10067099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 8eeficm17GLh4KDmUKQM9uKWUXW6JwB8MTJ5GsvBdj3IfOfTt52PQM3oRzlAfCXv7HsBHbwc12gE1uE7Lk8R0IOkZanpj0DS98LSU623wWHnXdE3kFq/Vy75JPpQoFhc3qXcnhdZFjCttGR+YRo+0Xe6Ig6Vy5uXVxQRhqPOeMnHCvqzpCW8EmMuALbx7owF7mU+4+HA24OpL5tH2r9LCEhzIceAjAcpXRqy4tAZMkrR0tHJeW7xSka0VbPbur6zOkJYzU1HOzsQjwJJwOsaIxwJ1w2Qa8hDCK8xcdvDOOgNKOGzo+ucDpgvR7aGhkdG6/1ANxRw5yORIMUufOh0/kJBWYVe6tKjGm6PBof0cXeqn+7gWE3ngdXErOcdQxoPI4JA/bNPn9EBNXGbD+0M3BDpivl/n7hhTfkQCMHG1yI2FfD4JflLNL46/ZAvc0LfolyNGTdYNteXy4O52P/b+KOmDvPM/ci4foUARkRNeOj5NJz/e3hEYcgsUdxzd/pNKPLc2n1oezUyr1f4dRrcoqwjHmT69/YtlkNFmRLRrJIifhB7pdK+2pwvFdKiY5WJcEBtvHyLgwoJDl6d0mZb8ISILabKYoKglQNTE+nntP8gApi9uOw6PMvne7JnqR+o
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(5023799004)(56012099006)(11063799006)(4143699003)(18002099003)(6133799003)(10067099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UURtc25YTzJZa1hNTEo0dU1NSm8rOWdJRVo2MEt6a1JaYkV2bVo4RXp0Rkkw?=
 =?utf-8?B?UzBRa0toUFNOS0FGY0RlKytLZVpuc2tGSjh1d2FkL2tDejMzVWwyOTh1allU?=
 =?utf-8?B?VVVray93dFNKcFFZNVBtMFhmSk5uWm1PaTh0TGtUK2cza0RUaDdBckxkQWla?=
 =?utf-8?B?Y2ZMUHRsYkZMNG1GTDcwTmhENXJJRkM4dzhaVFJWQ1dFcS9UcGZlY1ZOVUk4?=
 =?utf-8?B?M3JNNW9Fdis2amxrSWZqZEcwTGRFeGNRQ0ppcGtZVjV6cmt0OGlZL2cvdzJB?=
 =?utf-8?B?Tno3UUR6SWxMeHJPVm16NW1nSmhiUjlxTHNXcGxEVUYwNzlaSFIyNWdlTktP?=
 =?utf-8?B?Z0FBQ3pPa0pMMWRmeFRObVplWlNqSjh4QTBHRG12ajBhbTV5WG9IV1ZWTlhm?=
 =?utf-8?B?SXJjcitHQ2l5UTY1bGlteXh6UHREWFY2T3hjZk0rc2huQWJCOTljSmoxYlJw?=
 =?utf-8?B?WVpGdUN4MjFnRm9hQ2ZQWFRaZFJkV0pxbjhTN04xK005eXJ3eW9rVDg1SDBk?=
 =?utf-8?B?c3Q5Vmk2MTJmNjIwZUIrOXgrUHdQRVBFWDJxUUtmcXBhb3RyUkY5WnJiU2J3?=
 =?utf-8?B?K1ZwSHJERjNzZENnejRRQlB1L1h5QTRGM1VSUnhXR00yc25jczJJd2pTdW55?=
 =?utf-8?B?VzFOa09vWndENnpOcmh2MGJBTzJxbWZPd2pzN0NGTWJ3RHpPQmFJZGpYZit6?=
 =?utf-8?B?b1JGazVSVjVmT0lmbWZUbTc3VUQ2QU5JZWZjYUpXV0lkeE9tbEQ3OGl1R2c5?=
 =?utf-8?B?ekRaRW5mZi9ldTBCOXpEVFl1MytSeUU1UHRTMmZMUHcxeUN0Rm05NFNwQXhM?=
 =?utf-8?B?RndvVzFrMkVXeGNjeGRKR082Nmd0ODBsNXlWd3o3SjhXaERkZk1kM0ZHUmdp?=
 =?utf-8?B?SEpiK1Yvekk1R2MyUzZRbVM0c21CRkFEWm9JcEJMcDRQdHZxU3RzTStpSGti?=
 =?utf-8?B?cFpNZnNhRHVnZENFdWFmWnFmMXVoK2YrNzFrYmRNVDV1aDFZaHM3czBwZmlj?=
 =?utf-8?B?cTlQcFBycHpPSk1sZm94UUxRMytHcVhaRTlnamp6eUwvL2piTTU5TnRyNmVm?=
 =?utf-8?B?OURzYTVaVGdpN2FvRHpmR2ZEWEZXMnVzSnZVYnp0R21KekNISDlxWGhsZFow?=
 =?utf-8?B?dUkvZjd1UC9jZ21jWXNVdFQ5Z1lwVGVRb1lBTzVCVXgvVlRaOVVOY3BwY29X?=
 =?utf-8?B?cGlXV3dPa2hvSWIvbTlPS3BPWVc5V1BZb0tJZWhlT0UxaTVkY1QxOStCY01h?=
 =?utf-8?B?TkphaWhtWFN6RFNRemxlcTVEVDdUMGRqVHhLM3IrSXhJQ2xBNzJCZ3JydGZZ?=
 =?utf-8?B?K1ZHK2MrZTc2WVFWOHhTZWR3MXZHcjdwOUJKcW5wYjQycC8yQVUxNGlMditH?=
 =?utf-8?B?YXEzOU1DZDFNYkN2ejV5eEI2MzgrK01uWnlyVUlLY0JXK0VyNUhKeDE2and3?=
 =?utf-8?B?TGpUeGZiWkhSakZJVnVrMXY1eERLamNaSXhySXA5dGpYdkNLYUxqOFNxVElG?=
 =?utf-8?B?YjRTYml5bk9lN2RRYWlMZGFxZWVNcXd0N0NRZEw2M0R6cmF1UExpb09mRWdZ?=
 =?utf-8?B?cUFjZk5yeXpXOVVLRGNrcE1TaEorbzVmTndaeU9yT2IvVkxoNjl4aWRWQ0Ez?=
 =?utf-8?B?L0dQWkgxYTBxbGNxNDFPenBwek1uR2I3eEE3cGNkVHZiUXpwTE4rK0dvK1cv?=
 =?utf-8?B?NURxVldSSUFBTTg4aGNQaCtkcUtNT0FpSEtkTE1mL1lBTG5tMDErN0plYThF?=
 =?utf-8?B?L2gvbnd2cU1LRkc3QVlKaGExRWRGTWxaSmxGVHNodHhTNElSV2M3azlNa1Nr?=
 =?utf-8?B?VGVBWDNLNVJ1ZXRXVnVISmxiVVREU2RLU053MWtqUzE5aHUzR2x5S051dmti?=
 =?utf-8?B?RWJTU25ReFY3VHR6NXNUeFRPS3ArWE5FMk94OGZoNG9zbUVWK3lOazFWM0l0?=
 =?utf-8?B?WjlEUXQ1UE9XZllUV2t6YnJXSk1Gd2x2OHdpMXlpS0lLZjZuSkJYajFPdi82?=
 =?utf-8?B?ZmVsUlVNZWRLb3JsOWU4M21QNm5BV0lvL095SzZnc0xMaWRsL3U0dWlFaGRl?=
 =?utf-8?B?RmttdkRHbXVYVThwNW5tT0dlK3o0T3U5ZGxZVm1WYW1wb2dIc3hibmpKdnh0?=
 =?utf-8?B?aWdRdGJqdnM2djhyRkZCekNDT3liM0dkZWtGTktFZTVENFd5SU9ZTkljZVNz?=
 =?utf-8?B?c1VOY0pBSHRvUEM3aFRLeTlGWVNQWEkrVlB4ZitIOEhhWUdTU0NrcTJOc2RY?=
 =?utf-8?B?YjE5MFc3YmN6WXZLbFc2bXVZUWNBSDQveFo4SHdVMkN4SWZGcXZCRGlieVRD?=
 =?utf-8?B?NEt6RElLZVMwK1hqSU9Kb1A3ZzFkdG1Ua0QxeERJYW5WbU9CTzc5dz09?=
X-Exchange-RoutingPolicyChecked: hSjSggysSk2PDcgJCt/z8wb+P+LGk0WhJ9B07FJOk9JxYj9dqe+S7+FCBH5pi+QpuWtl3SE0Uf6ByrwhdyX3IgL86Omj6imkdgS8JFoiLzsu3Xa15uSoeZjsufAVGX83ZzsDnStEHRSGaQklqNnvbvdWskemXtrODNF7bBWpgH7eN4gzVq3nWMBnocQjiJQyfnu9UHeEh6XV0Ee2StlCh77uj5kcTd8R9f4dg0MqLFAaIsi30XsmPqX++AFZq0BMwBLR5hGYIYvwWp9G/roJN/5eb64o3K8LL3S8v6TePknysjjOBe59C3y0Blk+aCNDgzzGf+TGxcudIKsg2SR16w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6ac86a-507b-40bf-d342-08df28623540
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:10:37.8406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5LZzjiKv09nW0Yxjktq2ulz4csedDSnmsRTXFHGt+ARAmdpwbO5EYx16/cuMvOQ3FWba5OoCzOvHsz0DyR3Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9771
X-OriginatorOrg: intel.com


On 10-10-2026 10:49, Poosa, Karthik wrote:
>
> On 09-10-2026 17:46, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential 
>> issue(s) to consider:
>> - [Medium] drm/xe/hwmon: live hardware read during probe permanently 
>> hides sysfs attributes on transient failure
>> - [Medium] drm/xe/hwmon: endianness bug when extracting thermal 
>> limits via union
>> -- 
>>
>> commit bbb594b78c17c03bdb11a59f0ce797f39d14c3e9
>> Author: Karthik Poosa <karthik.poosa@intel.com>
>> Subject: drm/xe/hwmon: Consolidate temperature sensor availability 
>> checks
>>
>> This commit replaces is_vram_ch_available() with a generalized
>> is_temp_available() function that validates multiple sensor types 
>> using new
>> helpers. It uses this new function during hwmon registration to ensure
>> attributes for absent sensors are not exposed.
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index accccadbe3e67..62e341ef37e9b 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> [ ... ]
>>
>>> @@ -1008,19 +1008,39 @@ static void xe_hwmon_get_voltage(struct 
>>> xe_hwmon *hwmon, int channel, long *valu
>>>       *value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, 
>>> reg_val) * 2500, SF_VOLTAGE);
>>>   }
>>>   -static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, 
>>> int channel)
>>> +static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>>>   {
>>>       struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>> -    int vram_id = channel - CHANNEL_VRAM_N;
>>> -    struct xe_reg vram_reg;
>>> +    struct xe_reg reg;
>>> +    u32 reg_val;
>>>   -    vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>>> -    if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
>>> -        return false;
>>> +    switch (channel) {
>>> +    case CHANNEL_PKG:
>>> +    case CHANNEL_VRAM:
>>> +    case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>> +        reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>>> +        if (!xe_reg_is_valid(reg))
>>> +            return false;
>>> +
>>> +        reg_val = xe_mmio_read32(mmio, reg);
>>> +        if (!mmio_temp_valid(hwmon, reg_val)) {
>> [Severity: Medium]
>> Since this function is called during hwmon registration to determine 
>> attribute
>> visibility, does this live hardware read risk permanently hiding sysfs
>> attributes if the hardware is transiently busy or uninitialized?
>>
>> If the sensor returns 0 (which mmio_temp_valid treats as invalid) during
>> driver probe, the attribute will be hidden for the entire boot cycle.
> device is expected to be ready by this time, so this is not an issue.
>>
>>> + drm_dbg(&hwmon->xe->drm,
>>> +                "channel %d temperature unavailable, val 0x%x\n", 
>>> channel, reg_val);
>>> +            return false;
>>> +        }
>>> +
>>> +        if (channel >= CHANNEL_VRAM_N)
>>> +            sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
>>> +                "vram_ch_%d", channel - CHANNEL_VRAM_N);
>>>   -    /* Create label only for available vram channel */
>>> -    sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>>> -    return true;
>>> +        return true;
>>> +    case CHANNEL_MCTRL:
>>> +        return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
>> [Severity: Medium]
>> Similar to the MMIO read above, could this PCODE mailbox read cause
>> attributes to be permanently hidden?
>>
>> If the PCODE mailbox transiently times out during driver probe,
>> get_mc_temp() will return an error, causing the MCTRL attribute to be
>> permanently hidden for the duration of the boot cycle.
>
> pcode mailbox reads use a default timeout of 10 ms, and the mailbox is 
> expected to complete within that time.
>
> If it doesn't, that's an issue to debug, not a transient condition to 
> retry. So we treat it as a failure and keep the attribute hidden.
>
>>
>>> +    case CHANNEL_PCIE:
>>> +        return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
>>> +    default:
>>> +        return false;
>>> +    }
>>>   }
>>>     static umode_t
>>> @@ -1030,14 +1050,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon 
>>> *hwmon, u32 attr, int channel)
>>>       case hwmon_temp_emergency:
>>>           switch (channel) {
>>>           case CHANNEL_PKG:
>>> -            return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 
>>> 0444 : 0;
>>> -        case CHANNEL_VRAM:
>>> -            return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 
>>> 0444 : 0;
>>>           case CHANNEL_MCTRL:
>>>           case CHANNEL_PCIE:
>>> -            return hwmon->temp.count ? 0444 : 0;
>>> +            return (is_temp_available(hwmon, channel) &&
>>> + hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN]) ? 0444 : 0;
>> [Severity: Medium]
>> Does extracting thermal limits this way introduce an endianness bug?
>>
>> While looking at how the limits are accessed here, the 
>> xe_hwmon_thermal_info
>> struct aliases u8 arrays with u32 arrays:
>>
>>          union {
>>                  u8 limit[TEMP_LIMIT_MAX];
>>                  u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
>>          };
>>
>> If the driver reads 32-bit values from PCODE into the u32 arrays, 
>> extracting
>> individual 8-bit limits by indexing into the u8 arrays assumes a 
>> little-endian
>> memory layout. On big-endian architectures, index 0 will map to bits 
>> 24:31
>> instead of bits 0:7, potentially causing the driver to extract incorrect
>> thermal limits.
>>
>>> +        case CHANNEL_VRAM:
>>>           case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>> -            return (is_vram_ch_available(hwmon, channel) &&
>>> +            return (is_temp_available(hwmon, channel) &&
>>> hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
This is fixed in next revision 
https://lore.kernel.org/intel-xe/20261012130401.443473-4-karthik.poosa@intel.com/T/#u 
. The thermal limit words are now stored in a __le32 array with 
cpu_to_le32(), so limit[] reads the correct bytes on big-endian hosts as 
well."
