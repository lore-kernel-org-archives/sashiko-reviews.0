Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3629F4F96C9
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917242; cv=fail; b=gceQgTxPVw/pfkiuj1gnWDp2X9kBhcJmcxff446KQHITtBUyrc3svPDLdqsQTcfFgapRd/IOGtXz6cVimM2GfDvKk8wuDORbrNREa4TTzF4IsgTIDsVp8cLU0rxRuk5q/rlgzsYkOyjcUiv5GXelxbv7JOd53ANQ/ylS3OEQOEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917242; c=relaxed/simple;
	bh=Ajno2ISh4JW67S98BKEYFzybEsXBQ0gYl/Dfqi6wpJA=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vy4apwqgYXm0wNZs76lcbpbcs41UTwSprkYN3Wz60t9CEAiur6cJU7h17rZfw3wWjxLRDDU/5EVlKlDhjMI7wyFQjyw22tcFslpSL6MCw6BzVVGCAG8rAIzw4qLhKAHn0aAqtnEaxeKEimKV5UKMo8Nw8RZby5QmWOU04hu/6pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilJrbhff; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilJrbhff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791917241; x=1823453241;
  h=message-id:date:subject:from:to:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Ajno2ISh4JW67S98BKEYFzybEsXBQ0gYl/Dfqi6wpJA=;
  b=ilJrbhffdKZKmhcBs0g7+SCuat0N60nRORdEm3D6soCpuAjxwQIYZ1e8
   gz5K3E2i30DOlzfVCsE1GUCV53+LkXxsXaojkjanZ6C9YCaGxqqaEB/dt
   OxdZhN0PJg7eJM2hDh7ni85f8V0k5ZZVyEf5SbA46+6EdsKNtIz19OJWX
   9RWMgJAF01HwUrc6iIUkjTe9MTih3FLswWM+PFOL0pl6c8mtMyND81mG3
   nVF79La3AJ+B8BMOFc180w0X024bu21yoYrTngJuUbrbcuhrOuNpgWSrZ
   ttlhAbIerst6i4XWeDdPN7nlDMcULkwF9vCSjm+5hTQqD+xKAnXus8YJI
   A==;
X-CSE-ConnectionGUID: JWsUxYbJT8GMATN6eZIFzA==
X-CSE-MsgGUID: 8IsYe1i1Q4qj+8nkS/wvEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="545527"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="545527"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 11:47:21 -0700
X-CSE-ConnectionGUID: IRX/6okjR3Ogmi6nhPGVYw==
X-CSE-MsgGUID: MHbLPS84TC2GyV/hj7uIZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1595381"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 11:47:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:47:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:47:20 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAMBDeR/rWCiOxr5srq2eUSoon0QwpgIYzgwRWG/eRvhErAthGtopvdp8S3dqTiqJ3uXQkif8QM+LpH+Ux3NZV4Fqz1Z5mRjZLMnHZKXx90MjyO8aupxv/b63DhmURrerrvkHhpSoS+l8SM743pmoVsEYdfDoO8/C0B7qXLfNn2TFKTj5qg4Z8lcC6w8zQ+Zf3R2/QGc5r34UIDLkvuhO1EnAYFBh9mgDAJoUYxG3qIcqoMsaKyZv+SAV3cYdHWHuJsYqVcnXtfyPOIytR/ISFT/VcYIkj9UAIMGrJUhWIAntSni15806XS3Dl+6LnZp6LLKffAHD1TQYI5qwuO+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebi4UsxhqDxRP6CNFIqMCIYZfieGA4Kj49bcY7CFICY=;
 b=gmPoACEUNwhehchLp9GqGD1BH1wovxN27foPQkC4EguQdw6v4OZU+D01Ct7ZbaY30Jc2c2jqB6yo3qbJ48FGUUZiJRRsXvYyXR5/4B24HTJq6B8Vl0jp6CT4CSMVhVl6BGnvOWp9fYH7j/V3frTHq1gOdpQojdVZf3DU1V7avFhx8isDwtFINX8ArtDZMad0sTyh0WVavHhFEQD+M05Nec4mTel65Z5P4FSPC0whEJ+VoyOjG1fJJBxMjjVXQXL+6XqQ070/iH6W1TkrKkBLEia2rgwNO1SlSpxVKI+3EJyCC4s7vaWw6+b4Qo6ZowRuA1U1ZM7SjQ7x5s47k3YH4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by LV4PR11MB9466.namprd11.prod.outlook.com
 (2603:10b6:408:2e3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 18:47:18 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 18:47:17 +0000
Message-ID: <82601f43-29be-4624-bef9-531642e141c8@intel.com>
Date: Wed, 14 Oct 2026 00:17:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/16] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261013020636.447620-1-karthik.poosa@intel.com>
 <20261013020636.447620-5-karthik.poosa@intel.com>
 <sashiko-outbox-168870@kernel.org>
 <2afa1046-2520-4aee-9015-48aca9e27e83@intel.com>
Content-Language: en-US
In-Reply-To: <2afa1046-2520-4aee-9015-48aca9e27e83@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0196.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::10) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|LV4PR11MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: 96803526-b0d0-4b4d-11d0-08df295a67df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|22082099003|18002099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: e5ZNjJXfLKgLyqP3F6J580xi27feTdWPv0PgV5+4S0w9Rw7ZK6aedOqAET++EVrfWk6hjJxd420x+pronGrJVSuotVHvQPkIipIleag5YeLGR9hVyw1EKBCGrNkg4jVvKG66VAiuyIWMsVWC0mn1e11IpUpbRpTTAc0enc9hixA+ZH6FAjXbl9QOWFrzuBjBV+wsa9FSj4ZnbBNSAPsTJiT2MsE/B/XWKWFzYt5OiF3JK10MB0vQXTIazr+tOrqzBqn3IavOl3buAFXU+KU7KSu/L18I5OtEOUvhU+8jgjA4ZkhE5IM3J4K5foHfMj1xe0k1LM0t00u0DSShvATfsFQmxp9CoQuJGJsuRxoUtJzqgxokPNmw61PyaiFW/TJL8LmbX+HbQSH8ji6dpMUtODh3VMJUnlmTICUpLkntYYu2nDftmE5xjCui3BvTI/v39IU3KedQB/qfbMuTRPwfbWLI3arTvbiqcX7DyYbrJbb7bc66exDphjdMagF81jUi6YzuSeDdsHP+2q7TW369311JariPRl9spBT8rakLR5hmchhjTHQVhbogngMPZ+Rl8mTxn/fsnAM933F0Jq4CogquID1PtQsC3pzLtDofwy0fpirgQlkV8e86Ch7UT2nM+zbDaBL2TNVCCJYPadbIAcelY8Wrj36DoTtzdQi7OI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmFwNE05RmlZNXJzS3JJRWZFMXFIN1YxdmFrRUlHQWhTdk9MaW95TFd2blRm?=
 =?utf-8?B?RnU4Wm1pdVpCeXNNT1NYclZQN2Z1bTNaYUFHL3l6d0lXdnFNdlVtV3BqaHlB?=
 =?utf-8?B?ZVJrWWJUYTlzZ1NzaCtNWnY0QXJhby9sSjluWmcvbFRpUEpZaEJMK3ZFdStD?=
 =?utf-8?B?dW5GSDM4MjVKY1VvM2RucDJvVWJkSWhTNDdiRFNmNkwyVlVSM2RreEtzek41?=
 =?utf-8?B?MmpGR3IxVVk3MXBvSG1HblVTWnlDS0JvMllORFIwL0J0UnVHaE1JQlJwR3dh?=
 =?utf-8?B?NlRYQThUdG9HNC9uRHFKeUV1enNFSEtRZGZYb25DMk1UVTdmNkJ4NkZreHNG?=
 =?utf-8?B?VFpiKy9zdXRITSsvRkFISHpuMVg1R0s1WGdTR1dvTnNGdWFTdG8zYnl1Qmdq?=
 =?utf-8?B?R0dEaDZVd0U3eUw3YWcrM0dackdpdnFRb0tZOCtvM0pvMGtOaWpUN2FtUjQ4?=
 =?utf-8?B?dXQ5SVIwa2lUYVprdnNoK1EvbTQxOGZhRW1odGxJRlo2QnVpQmEzZS9jd1Fn?=
 =?utf-8?B?Q0dZRnZoOVo5aElYcndLWjF3VGlTcm9jLzgvYUhYL2RMSTRvMUpZT0x1RDBk?=
 =?utf-8?B?VWFYa0U0Q05hWEVaekpQRWhpYTF0d09BdVpGeVJhdnh1dGc3R2NsTTdUMjRZ?=
 =?utf-8?B?aXpuWTFXUTFWNmEyNjFLd1A3RHVvV3h3QnI3bTdjTHZONXRaMGhZNi9LVG1k?=
 =?utf-8?B?djlzTFJSaGMrdzJRb3lWUFZxOGlOZ0hhQnRaUkMwb013L0ZFRExHaHQ5a0hO?=
 =?utf-8?B?Ky96c0d0VzdtN2ltV1VPTUd1b0xONCtRWlJraTNJd295cmQ4ZTVKdHJYQlZZ?=
 =?utf-8?B?OFYzKzNrMXhya1l0aWtzRHZkZFB3c1MvN3VjOTh1VU9iN3drMzZwMnM0UStn?=
 =?utf-8?B?TW94TU5QenBVdVcyYjE5ZkhUSWNrSnl2VnJnZ2VEZFNMU1ZzOUVqdnowRmYy?=
 =?utf-8?B?OWNJSjhXb3NZbWM4U1A0QlpmTGFRZzQ1aFdjODhrenEwUlFOK2NpTGZhWkJT?=
 =?utf-8?B?ODBQVE5pdzJpSFY1T3R0d0hiVFI3bUg0b01mNGxKYzBNWlAxRDZVT0xrUTdv?=
 =?utf-8?B?UUxWTW9MamdaUVgyWERUQTNEUWlhRkZpT3podW94WC83enlibGcvNkMwQmpW?=
 =?utf-8?B?aGlEeFVGWVlEVENJUW40OGhpYWNIQzVtTlorK1FLUUNaWDBORE9UUmxyR0NR?=
 =?utf-8?B?L3lpWkhOem50U0J2bmxkUWZSWGJPRlpaN3c5b09FWktLWk8yRGtPZldGMGtq?=
 =?utf-8?B?UTRqcnZHSU5idCtvN0hFdTRXc3VvNkdSakZZSUtBWlJoL1l2TWNLWkNiWkFZ?=
 =?utf-8?B?WmxFOFR5dGZrZFBBdFppTWVxM0kvaWtUaDlKM0FSZFVkeVJFSDd6Q3cwbmht?=
 =?utf-8?B?RkNNRW1xVXBvdGQ5bmtpSHFKVTRGS0VLRXFzbEFoSDlXL0hLOXhGd0pmU3Jx?=
 =?utf-8?B?dXZYd1N5dU8xVWRCbmVJSnB0Skh0bWY4bDRPK0J6OVlpdWtUTnB0cVpZVG9N?=
 =?utf-8?B?S3Q2c1Z3N0EzOTZLb3RUV3VtaWFjUFpRZ2ZoV0tBN3IyUHJIa0d4R3NrbU43?=
 =?utf-8?B?VkplSFhDYkFURWQ1Y2ZsNXlpU1FxaG9CYXcxM1V4REpNNEQzUU5hT0R4MHQ4?=
 =?utf-8?B?WkNsRS9Oak9TQmkvRTF4YVBNeGhFck1lRlF2SXZna0V6VWR6NzVnb0Fucncr?=
 =?utf-8?B?NE9VS2ZSR1hhVWhxdFFrSFBOaUNVZlJYSHA3RmZMbkVDckdrMTNPY3RmRzBR?=
 =?utf-8?B?aC9xemcwZUd2SW0yQXVQY1RlaFZEbk1KYUZ6K0R3eDNvQ3A1bW9OY2ZGeEJ6?=
 =?utf-8?B?QmZ6M0ZsT3owYy9GbW9FalZVcmhQNVNoQ1pvanJ2UERHSWloQWlHeHJVRVlF?=
 =?utf-8?B?aFRyaXZ1dkJEYmF3MDE2RnRrUHZYMFo0N1VHV0dlSVFxMmtGSml6TStpMFR1?=
 =?utf-8?B?OUQrSHlLcFk1NHNCODR3ei91VEhYbWhwUjVkNjlKR1hEcVZtZmhBUHd0cUNE?=
 =?utf-8?B?TFBWc2NhdEk4N3NzNXpHN0ZINXY0dXFIWUxhOGZDNEZrTjE0aEd4WW1vZnE2?=
 =?utf-8?B?bVA0eUVSRnNXcUE1dFlUMDJzZVZ3MVRrS0dZa1JldVJVWTVBTDJuNWJFWUxH?=
 =?utf-8?B?YURPR0Z6NzNwVmtrVURQSzdtaEJmZTBWdElBSlhIbkViaFBrMUlqc0VoL1lI?=
 =?utf-8?B?YkNwYUFtS0VseTNlTkZLU0NLSU9MSFVCNTI4YjE2MFVwdjhUZThGVlQzRkV2?=
 =?utf-8?B?STA5WXlyMXdlNmg0cWhYeXZ6VzFVTlJGZGhvc0p1alNzemRUTVRSdEl6bUNM?=
 =?utf-8?B?M29MMi81MGxLcUwvK1hZUHBLQXRpUU4yS0JYMXFYNUNvTEVOWjBuUT09?=
X-Exchange-RoutingPolicyChecked: OwqKAAR0ycjUhlI9aux7aDcUqlKFjEWQdvDB4Y2ZCnHOsCI+n9uOt1oZR6fOr0jkf+Xxt7y1MWybVGeipSNHTUqjcdYlfQ/wjDIQ9Y6cw4hAmZlv0IComAO3q7zM2O0vanNJna+G/3nzB7dBKunFb3MSdhzFQbJsrlRzlHIImGdUJv+UYqxp/MlQsaVJ4Qv45q4zoj6MKJ65AKA/ysZyHyUAI3lSHIaiS4IKyPx4DvXTvEkMrhW4rFo/h78G441QKD1NoJaCKLb5ELJ16ww60vmgbJrAbsYYW5/XkcFwlkB2jwZXcWM72cs8zVppKNFG2lJtivnrFtHOmbS4jRyZVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 96803526-b0d0-4b4d-11d0-08df295a67df
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:47:17.9512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GryalMFL8JvJ7Nk0LNX1vJilcdzm5qsSjuRDULmHwOQAttatT+bk9SEP3UFVI1BAWqdJR5iS4v/N8S8qkKqYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9466
X-OriginatorOrg: intel.com


On 13-10-2026 20:24, Poosa, Karthik wrote:
>
> On 13-10-2026 07:54, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential 
>> issue(s) to consider:
>> - [Medium] hwmon: MMIO read errors (U32_MAX) are treated as valid 
>> temperatures on legacy platforms
>> -- 
>>
>> commit 30c789d23390d6abf7d18b4ec4f037b60404f1b9
>> Author: Karthik Poosa <karthik.poosa@intel.com>
>>
>> drm/xe/hwmon: Add helpers to validate thermal sensor readings
>>
>> This commit introduces mmio_temp_valid() and mbx_temp_valid() to check
>> whether a temperature sensor reading is valid. It gates these checks 
>> behind
>> the has_temp_sentinel flag.
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 2d1fa9159c58b..712a21a996362 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> [ ... ]
>>
>>> @@ -825,6 +828,23 @@ static int 
>>> xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>>       return ret;
>>>   }
>>>   +static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, 
>>> u32 value)
>>> +{
>>> +    /*
>>> +     * On platforms lacking temperature sentinel support, a value 
>>> of 0 is treated
>>> +     * as invalid. While 0°C is theoretically possible, it is 
>>> highly unlikely for
>>> +     * a discrete GPU in normal environments, making it a 
>>> reasonable fallback
>>> +     * indicator for invalid or uninitialized temperature readings.
>>> +     */
>>> +    return hwmon->xe->info.has_temp_sentinel ? value != U32_MAX : 
>>> value != 0;
>> [Severity: Medium]
>> Does this inadvertently treat PCIe MMIO read errors as valid 
>> temperatures on
>> legacy platforms?
>>
>> When a PCIe target abort or link failure occurs, xe_mmio_read32() 
>> returns
>> U32_MAX (0xFFFFFFFF). If the platform lacks has_temp_sentinel 
>> support, the
>> condition evaluates value != 0. Because 0xFFFFFFFF is not 0, this 
>> returns
>> true.
>>
>> Later, in xe_hwmon_temp_read(), this U32_MAX value will be blindly 
>> decoded:
>>
>> *val = (s32)REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
>>          (REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
>>          MILLIDEGREE_PER_DEGREE;
>>
>> This could result in absurd temperature readings like -8,388,607 or 255
>> instead of correctly propagating an error code when the hardware fails.
>>
>> Should U32_MAX be universally treated as invalid, regardless of the
>> has_temp_sentinel flag?
> An all-ones read means the PCIe link has failed, which is a device-level
> condition handled outside hwmon. Once the device is unavailable,
> xe_mmio_read32() returns 0, which is already treated as invalid.
>
> mmio_temp_valid() is only used at probe, not in xe_hwmon_temp_read(). 
> In the
> next version I'll can add the check to the MMIO read path and return 
> -ENXIO, to
> match the mailbox sensors.

This change will be added in next revision.

patch 11 drm/xe/hwmon: Decode CRI temperature registers as IEEE-754, as 
this seems fit here, where the missing check for xe_mmio_valid() is needed.

>>> +}
>>> +
>>> +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 
>>> magnitude). */
>>> +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 
>>> value)
