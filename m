Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64233E7BC7
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 18:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790186825; cv=fail; b=CzhvQD7tnztTIvbHXm/TmrbU7zxo40S+UoXlxycyBq3eEdQOqkMTYEot8gxN4aggRxfLf51+tc2riD3lP0tOM2mE5Vfk+29Kr9CTIPJC7wB+aI+Mth+HdYA0JDqhPncBCYrf0nVcFfzsD4eMRsbiepy4eAp2La6nskzlNmnxWvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790186825; c=relaxed/simple;
	bh=3kDeTX84pl0/a4oBhm7wVY+ehYFngKUGhC1mKhDFx2s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SClz/S44MLFwpLoSpBYftWVg1GcheaVWzQzbV3t63mmYiWxB7lHb7R2SP5B/1KVt/AYpX/xotFhk5GmVKoaYUWchFHqnkmzyKRlR67ZnIhl9bu8/4yVO1gVz+HXbgVB5kFEGhBX5O+z1+nTKigMo/Ksi7g1gQN5Z/EUFMFdVoD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpREeFsi; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpREeFsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790186823; x=1821722823;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3kDeTX84pl0/a4oBhm7wVY+ehYFngKUGhC1mKhDFx2s=;
  b=fpREeFsiUmgCd+sAXezaRggOQAaT658Mc/oR7qaeUUMDjm/nAchWPyXQ
   xXZPqGvNB7ZtNY7duRrew+CDUpmZLS08hIf1ICqMXjK1UwmZ7U73rJVQp
   pdN8vN4O8Xo6eNgNJJnGqhN57E+JwBhi1kopBh65ORxOP851XI8/i04nZ
   RN+i5JTsgjR3QQ9fJIRwi3IPyay35RyX3yafWQPz78bjbkyyuvIUsFWGn
   swuN7/sTuXAR9KReqmlyI1MYPgpgHY+8diYqeY3CVMlCEw7GZ8fvgr80s
   GjfgtYui/trN/UKq0EyD0OBpKllcFxVCUWDnsUYQrh9Mjw/uV9ZZDyotp
   A==;
X-CSE-ConnectionGUID: OIuPTrYSQ0miOtriD4y2pw==
X-CSE-MsgGUID: w5pUz2s1R2aoZVN+k2QcUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90780976"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="90780976"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:07:01 -0700
X-CSE-ConnectionGUID: PKMpEmhmRXe3VgOwNepyHg==
X-CSE-MsgGUID: L7IaOqTERRqsqj0XAiSdyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="272904989"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:07:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 11:07:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 11:07:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 11:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JabUfLfr3y4orGhueX5VW9jGqqnTifFNWia2pYkZqN9l7koYN7LV7wHj568B5C/Jqo0Qm6scwntHh6Kh9RpyR62xM+i7JrmICkroB3eXRyLnmvwmCtuHWW5Dy/rRJ0XkwCBS6MkySHkpJoWbGsAQYkZRb8RVzjQtg7JAplTsVH0YDORIiUkNnTbzi5LdvObNfS/KcJkLaMfhTthjTKmM8MU0oGnYO/NIb9fhOmoaGc6ahwZX7cdXUNkj5efGFGc5LhwzYv7kvjdRxTJY4mmGGaWKaFx90PPy01/nsHghw5gUWgHKNdKFK9i/6p5qHHzK42xnzQnoSJXzVEZW44pr+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yp0iqn/HIstOiCvVgGYVSMm5uZToVwN+kep2zrM8wXs=;
 b=zGvFHFp5lqdWVKkm9XJVKudColUrq6POTOUwc//WMqxbuNW+xmZhhVqziEpjeyIirls37p/ZzJSDx+fCiEOxldZOKgwg+virBI1vfQ+olQ5Js7C/n0ye9TjbXcrxkr1dy9O34L38+hinxq8mqFPh+XWXfJEEL7CHMpSWNVO4yiEUdWBWNfazYRGL+m1OFt/4W2jstm1f77+qmhii5Bb1Qo6M7VQWLpq8vYvauuemKYBuiVtazhKdeDGZ48ZtuzQGfrUqsIeKH+DP+Ia1Mx5UOJT8/k4qnyWG4VTuHoyrEErt92+ylLOuDnNUvg1ZRuMBuTP6klcSaj+XvsCLcYKNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by DSVPR11MB9694.namprd11.prod.outlook.com (2603:10b6:8:34d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 18:06:58 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:06:57 +0000
Message-ID: <6e40b68c-bbfa-47b6-81e9-5076738d0abd@intel.com>
Date: Wed, 23 Sep 2026 11:06:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] drm/i915/dg2: Add per-context control for
 Wa_22013059131
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	"sashiko-bot@kernel.org" <sashiko-bot@kernel.org>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
References: <20260630223946.2107382-1-jia.yao@intel.com>
 <20260630225349.984AB1F000E9@smtp.kernel.org>
 <178290749714.224587.15234445443946207851@jlahtine-mobl>
 <178292444166.273574.16738251742448073960@jlahtine-mobl>
 <PH8PR11MB8040EFAAE8210F2C6B53AC1BF4842@PH8PR11MB8040.namprd11.prod.outlook.com>
 <179005959984.27165.4749331452130832177@jlahtine-mobl>
 <PH8PR11MB8040A8F215B997982530CE44F4832@PH8PR11MB8040.namprd11.prod.outlook.com>
 <179014632773.19856.4107893493544612438@jlahtine-mobl>
 <PH8PR11MB804034417C9C4625B7F20F2BF4822@PH8PR11MB8040.namprd11.prod.outlook.com>
 <179018246485.152778.2589066724213973485@jlahtine-mobl>
Content-Language: en-US
From: "Yao, Jia" <jia.yao@intel.com>
In-Reply-To: <179018246485.152778.2589066724213973485@jlahtine-mobl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::32) To PH8PR11MB8040.namprd11.prod.outlook.com
 (2603:10b6:510:238::11)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8040:EE_|DSVPR11MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3a10f7-e293-442a-9770-08df199d750e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|42112799006|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: rBRgk2ntENaDX1YDZGfi94FFVFyaHerasfUH4ej6r02bvqPKKU236XCVR3jWuNW98AMD/lJw+OuRQiDHQUNGgiPepaNPQlXvQWHWUeqpb6Y5OA5IQ+c/HgOglpLW2q/tcAHSv1/48m2s8hY5Yk0WQPiNADtHbc0Wv3zRsWLWbIHNeCnIv3Ac5fiFd4hpy6XB97IsMz+f/P0OdxwFSLnrAFA9jxgF9x6Gkd44p3q7E5ZqBmLMoA0LI33mUA4NTPb73N0295hTZqFUd4rXXtI6JpWbRgUPbYmtCZCG8mhG76Bqdx6b9t/bJwhxwZIiG1KjPovSl7qSrQGwNK2MCvVlUiWXDb8TPFKIHod7p2OWOT/aSHDssLl8tvzJABY96sO03U1KJRB+KqvQmR4OMeqNDbXqVZMQJMEbHpjIvsI0QmkpoY2pFoH8z38xMh61fHNW8OalPJPQfTWVeW4tYtwNowLMIs2ret0EE1sEnJG5uF7hvV7JaDmazJLk7b+35OpEYxaM+M+jEQZXiyRJfrO/owzH4WONXXYgy50cBvFc3kcWwQ5dMJTwQOAA4wY02W8/EZIFSwkGvvw++9n120Mi41AkUH8qjDCwH3NlSBJe10A21AHLMcrTrNj2WvVmX9XIxtfNk4LqDYHnNJVT15RXm8oZ4mQCZYbFEcMzt/R1WZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8040.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(42112799006)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q25SNDBuNFhZbWhWL0svSGFYeFhxZG92bEwrM1I3a2lqTEU1UC96YkJSZU1q?=
 =?utf-8?B?RHNrdUZDeGdmcndlK2pSTktqRGJGZGxzRWl6dS9JSkxKRVFEN3RERXpIWnpH?=
 =?utf-8?B?YVhLblZWWjNMc1k1SC9hRllTUzFXSjVWbjdFWFcrN1RkbUh3ZXFYRERSTFBQ?=
 =?utf-8?B?ZE5lczNJTXl6UEQyeUdjWC9DMlgwNXhsZy9mQ0pLY0lXWEN2WGh0V0NlS3du?=
 =?utf-8?B?d1dJUU9Kc3R2cEpkV0NsQmlLNWRtL29hUjdwV1l5MElwbTF6akx5ZVFUckxj?=
 =?utf-8?B?KzFSalhEcW1zZWJSanNNSVlJbTlzSWVYZjRIanQwVnlpMVdRZlE2RE1PUnlF?=
 =?utf-8?B?NXFpbmNtemRkUnRXTG4zR21VK1FORUU1dTdLOHd0Z1QwcHc0Y1dieGl1U2ZR?=
 =?utf-8?B?SzlsVEtlaWlsVWlzQ0J3WW5UM2QxQ0xFRlRsa2JWTm5zTmhBc09uVWJEYWJE?=
 =?utf-8?B?RGptcW9Zc1BBUWswZHRpVFV3RVpFVXlFM2lkb3IyUFNydXZqNzhkU1NxNmNY?=
 =?utf-8?B?MkI4RlZMRHU3Y0x3bnZDMFYzVWpjRldqajVNYjZTUUlIbThJQWJVYktOMGp1?=
 =?utf-8?B?NVZHY0NrNktQZlFhTWF4dUtZU0E5djRraG15N0plQS9XbHNUR0NVMjd0MzEv?=
 =?utf-8?B?emFnblFoSFd3VnlIR1RGOXNicHcxU2F3YVNsdFJqRzNmY3NKVVh3ZEtLUHZK?=
 =?utf-8?B?OVZGOEluQlBxeVM4YVRhK1NHeFBXUWczaVA2VmhMZ01LNWRTSXVPWjNHZi9X?=
 =?utf-8?B?eTF6dUN1eEI0L01rUUpwQ2w2V2QzK0VXejJTMTJmbWpzRks5YUxCRjR0c29B?=
 =?utf-8?B?cDYwck5FeUVjY2Zka3VNVXZ6L3dhM2djQnFXczV3c2t6UVZYRy9BaE9QSGx1?=
 =?utf-8?B?Wmc1TGJ3bmdETUYwbTU3Zm9IZXQ3UXZtM2dBUE40eW5ocExVdVB4dlMrTzQ3?=
 =?utf-8?B?RkNkYlRBSEc1T0U2WHNxcHBMZ3hYYnA1L2U4K1dXcmpUMU9uU2poZENNdXp2?=
 =?utf-8?B?ZDNkL2U3ekF4L0s3TW5sWllRRHlDb3EyZUNSRklRVmx4eEpPOThuSjVmcnQz?=
 =?utf-8?B?YlFnS1pVVkVselFIOUtDd2huM0hSeTdYay90T3o0ZnJsYnp1dEhjUzBVVVQ2?=
 =?utf-8?B?ZlBlVEJ5aUlTR2J5ZTB6aWVwS2g3dXZ1TjhwcklDamsxUEJqZk9QVXVCS0lK?=
 =?utf-8?B?TXBjOWJxdG8zV3VhR2pLZS9sNWt1QkpUeEZ4ZTkzS1BXZ3dwT3ZTUGdNSFFB?=
 =?utf-8?B?NFBtclRuejUvQ1hyUWZEcldTakY0bDhsV1lyZis3VEMyTWJJUUZSL0FvUi9t?=
 =?utf-8?B?Ni9pc0llbTJuVW1oa3dVcGlQMEVvL2xjSHlFeDJrTDZxTU9zY25ZS2xoVXRP?=
 =?utf-8?B?MHEwZTJqV0JUZUJqbGFvcThnTG91VDJOeEkraEYxdEYzNWsyc2I0cE02VWtr?=
 =?utf-8?B?KzFvZG9wVnRhL2c4USszanBqcHE3NlN3Q3RidCtWTlB2VGdLaFc3V1RDRXVj?=
 =?utf-8?B?UHpHdWUzOXFFOFFNWFlkMS85QUJzRFI5NERNamVwVElweC9GcUtvVHFwdjd0?=
 =?utf-8?B?amdhSytYOGhMQ0tEeCtVUnJzdGhDYlFOc0hVSHpKVE4xSk9QQ0YxSVNiQ3lF?=
 =?utf-8?B?ZkJGWVB2YTllbUhaLzJpSk1nbUtUaHZ1SmtTTjZVQ2pOMDJPZVpxM3hWdkU5?=
 =?utf-8?B?OS9pb3ZnRWp6M2Jib3JRRnhtbWxadk50K3J1YWRtV2ZpaURGTDdtZGoySzZQ?=
 =?utf-8?B?MXZzUVJPWGFGN3FPblhCM2x6YkNYWXhWNWVDVDh4R3ZFUUkwSmI4WHIwSllO?=
 =?utf-8?B?Wkc5LzkvN1k1RzdBY3A4alBLaEptc2xpL2NNcW9WU1BHSDMzYXBvQjVsQXBn?=
 =?utf-8?B?aXpYODVFdmp4N1FqaHNOclU3RzlwYXVhZzNoeHRpWWE1bmx0azhla08yRUd6?=
 =?utf-8?B?Z3orR1lGd0FOdExWY0Mrd1BTcy9Zd0JRTlRqczNLTjhwdVlLNHdiYmNsc2sx?=
 =?utf-8?B?aGhoNjZqVXlEUElKWDhBK3J0VWpBVnl4aTZGNzRRUHhwNytKYU9ZS0prdTlJ?=
 =?utf-8?B?c29tTzZRZFU2UytTckhKcGJLbUk1VDR3YTBWUThYcy9oMjFzSkdtM1ZobEpE?=
 =?utf-8?B?MWtoT3p1OGtVcmJna1JKWmkxdEk3aEQ1UHJoZGpSMFcrYzV2U3BuK080U0lz?=
 =?utf-8?B?KzBBbW5jWHRJOHJWVWRHd2hubjJGazlNQjRmMHorVEJ6Ym1FTEYyazRDaXNH?=
 =?utf-8?B?NGlCZnFUbm8vdmg1VThHQ2had2ZmT3orVHV1MjBxZEFLNlRoWnlRWmlaeFh4?=
 =?utf-8?B?SGh4Tkh5bmIrT0xzVXFyR3A2T05pR2RYYkFCLzN0YVFZbDJTeS9zdz09?=
X-Exchange-RoutingPolicyChecked: LBrWQcQjfwjANDfqmdzK8NHQaCzE9gwlNorOd0Ap1Xa3Mz3Be78WxqENvidn6p/d8sI25Z8RaJFndWcGQZ4CCSIqxaajoJYzmnDlhibbfKDvQyCz4I2He3ju0SJV56v9tPj97+USiNFu3TRUDdjLXcS10tY3THtA7W1d9mopdtjGtPNSLJy9MU3zsU9IMcu8C5jqMqySGZ1COBxyCFa/g/DDiTHzMTJTMY0fTCoASOdVeeatXGufArEjRMOLNA5fqEV2wE+Y6Tyw0lKOsWgHjTkfiXihjUb/lG2y01f2j6oIZ+nOv81f+/dy8NesbN661OqNVE18907/yelmqYMFhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3a10f7-e293-442a-9770-08df199d750e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:06:57.8391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OgqiP5bo+UWTUEJSkwpgHbI7lqKXtNAOiIZTAQVUsDTGBYeQdtCldt5y6rTG0jzDl8RXRQCa4UIR+yZjgt2gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9694
X-OriginatorOrg: intel.com


On 9/23/2026 9:54 AM, Joonas Lahtinen wrote:
> Quoting Yao, Jia (2026-09-23 19:01:32)
>> Hi @Joonas Lahtinen,
>>
>> When shifting from WA option #2 to option #1,    removing a global setting ->   adding a per-context setting.  We thought it was a per-context operation.  However, due to the "weakest link" effect, this remains a global operation.
>> Thus, making it per-client has no effect either.  Containers will interfere with each other.
> They would not. On the impacted SKU, the RCS and CCS at any given time
> can only run workloads with matching address space. Those workloads must
> originate from the same DRM client as there is no address space sharing
> across DRM clients implemented in i915.
>
> It's only when multi-CCS SKU would need the same W/A, we would need
> further scheduling decision to ensure 2 CCS workloads are not competing
> for the global setting.
>
> With per DRM client enforcement, both RCS and CCS should be able to
> write the global setting without a conflict. And when a context from new
> DRM client is scheduled it, it should be able to program the global
> value to its liking as the same address space limitation guarantees the
> other workloads are not in the HW anymore.
>
> Regards, Joonas

I understand the benefit of address-space isolation.

However, The bit 15 appears to be a global register rather than an 
address-space-specific state.

If the register itself is not address-space isolated,

I'm struggling to see how address-space isolation alone resolves the 
concern.

Thanks,

Jia

>> Thanks,
>> Jia
>>> -----Original Message-----
>>> From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Sent: Tuesday, September 22, 2026 11:52 PM
>>> To: Yao, Jia <jia.yao@intel.com>; sashiko-bot@kernel.org; sashiko-
>>> reviews@lists.linux.dev
>>> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; Roper,
>>> Matthew D <matthew.d.roper@intel.com>; Tvrtko Ursulin
>>> <tursulin@ursulin.net>
>>> Subject: RE: [PATCH v9] drm/i915/dg2: Add per-context control for
>>> Wa_22013059131
>>>
>>> Quoting Yao, Jia (2026-09-22 17:34:08)
>>>> Hi @Joonas Lahtinen,
>>>>
>>>> For RCS -> UNSET
>>>> For CCS
>>>> 1. Old compute runtime -> UNSET
>>>> 2. New compute runtime -> USER
>>>>
>>>> If we take there's only one compute runtime version, and priority USER >
>>> UNSET?  Where's the conflict come from?
>>>
>>> See below.
>>>
>>>> But if we take there's more than one compute runtime version, and their
>>> priority is equal,  UNSET can cover USER,  USER can cover UNSET,  even with
>>> two clients they could cover each other.
>>>
>>> I didn't follow this part. How does the priority come into play?
>>>
>>> We have to keep switching the mode as the DRM clients come and go.
>>>
>>>> We should take it easy.
>>>> Once we reached USER, set by new compute, we should latch it, for the WA
>>> has been implemented by USER.
>>>
>>> That won't work. If you are running two different containers, you may have
>>> different compute runtime versions. Also, Mesa can be submitting to CCS too
>>> for async compute, AFAIK.
>>>
>>> To properly cover things, we should make it into per DRM-client setting and
>>> switch the mode accordingly when different DRM client is run.
>>>
>>> And for the given SKU with only one CCS, as explained earlier, it should be
>>> already guaranteed that two different DRM clients are not active on the
>>> hardware at the same time due to the address space mathing requirement
>>> between RCS and CCS.
>>>
>>> If this needs to be extended to multi CCS SKUs, then it'd be a bigger
>>> implementation effort.
>>>
>>> Regards, Joonas
>>>
>>>> Thanks,
>>>> Jia
>>>>
>>>>> -----Original Message-----
>>>>> From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>>> Sent: Monday, September 21, 2026 11:47 PM
>>>>> To: Yao, Jia <jia.yao@intel.com>; sashiko-bot@kernel.org; sashiko-
>>>>> reviews@lists.linux.dev
>>>>> Cc: dri-devel@lists.freedesktop.org;
>>>>> intel-gfx@lists.freedesktop.org; Roper, Matthew D
>>>>> <matthew.d.roper@intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>
>>>>> Subject: RE: [PATCH v9] drm/i915/dg2: Add per-context control for
>>>>> Wa_22013059131
>>>>>
>>>>> Quoting Yao, Jia (2026-09-21 20:33:03)
>>>>>> Hi @Lahtinen, Joonas,
>>>>>>
>>>>>> The key is LSC_CHICKEN_BIT_0 is a global register.
>>>>>>
>>>>>> Even we use per-client,  we should consider the following cases:
>>>>>>
>>>>>> 1. Should conflicting configurations within a client be rejected?
>>>>>> I recommend the first setting should be latched.
>>>>>  From uAPI perspective it would be simpler to set this at the DRM
>>>>> client level at once. However we don't seem to have such uAPI in
>>>>> active use currently (all
>>>>> drm_noop) so you'd have to compare the complexity between indirectly
>>>>> setting it at DRM client level by first created context or adding
>>>>> such an uAPI to set it explicitly per client.
>>>>>
>>>>>> 2. Should conflicting configurations across different clients be rejected?
>>>>>> I think the latter setting can cover previous one.
>>>>> DRM clients need to be indepenent from the driver perspective, we
>>>>> can't do that.
>>>>>
>>>>> The whole point of making it per DRM client is that given the
>>>>> impacted SKU only has 1 CCS engine. We have the address space
>>>>> matching requirement between CCS and RCS, so when both CCS and RCS
>>>>> are running, we know they belong to the same DRM client and thus
>>>>> they will not conflict with the WA mode. And if only one of them is
>>>>> running, there can be no conflict either as it's just one context.
>>>>>
>>>>>> Even like this, still can't cover all the race condition.
>>>>> Which race conditions do you think would remain? We definitely have
>>>>> to eliminate any race conditions to land this.
>>>>>
>>>>> Regards, Joonas
