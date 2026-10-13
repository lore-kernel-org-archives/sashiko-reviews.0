Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F3249B5B7
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 18:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916845; cv=fail; b=YMQpGW3Qd+VriUpEhxsgCbP+1YjbMn87O0/IzCsbciDHJItUU0GXPFGJoQM9YwpUFR4awBhPz7Cfkwa0OvbsB19P3cH4tEoDFZF7mmZ95Nl3YftVwsG2tGwaBQ/RaF/5Z65urBw/jB3Kz+6cLamq58WntSDMHNFMWZhs8CH3V1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916845; c=relaxed/simple;
	bh=IjyJN0iY6MqoPsKNyMeOiMnMDw/fkYdkeCbJlh7Arp4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KASGkxeerpRJ4JNBCKpdu7vzIyYQ1gCm+TVkuM4lqReOdCp+IF8jEhPXuPcNN41K+HpJCJ3W4vXVS+O6mk24gkzRbJYx3x4/zMVQJN3YYnb8QNqcy5FuErjA7uZ3EI4EZ4Iw6ukEe1rSZJ5dCCwvFFyQ7evdHRDxgR7LgUp/Fnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7i44yEC; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7i44yEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791916844; x=1823452844;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=IjyJN0iY6MqoPsKNyMeOiMnMDw/fkYdkeCbJlh7Arp4=;
  b=L7i44yEC49I0FOFt5x+yks+SPOH/pokotWnDGyNposhku53euWynwK3y
   S0UDVEbnU68fotaZg5DF2sgwrRzQQWdQEg6c8K1HC2FwS9ZMRUKRbVrPU
   m+GReiKIjRAjBvLjmNPAdmpjs4e2u2Mt+hYlNNX6FRL+2ErAB144nRhCO
   Dx1v0Tf6JnF5sX8JvTmDLYXZcJsVUkBy/OSlsOis7q+3OgjQXCWq35fGw
   /bM+GjNArsIr76PN0tR/HMpsjF0BeXvU8bppg+KtCuHGNh0t3+mZsY6U1
   wVFZwpxDQBgz8VamI/YmTqWUNpPgxy4026lhNsOsla1t8eiafjJFzj6QJ
   g==;
X-CSE-ConnectionGUID: hECRIfvXSOCJuZrVTz3ctg==
X-CSE-MsgGUID: AZDNBQaNSp2gALEcJQBweQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="553732"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="553732"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 11:40:44 -0700
X-CSE-ConnectionGUID: DqYB429GTgOUXpWOGVBJ9Q==
X-CSE-MsgGUID: TGw+7LHQSeGBEISKd+j97w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1570836"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 11:40:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:40:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:40:43 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.21)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:40:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHWlK0W8bv4rOak4t4FXRuQfGT5mKQXvUXy88Ped2Mxhz1ZB2OziRgFYCwpjFaL8vQs8bCJRK7mNUP60Xtl5adW5759eNF5W+JskNwHVvMMwSBv3f4vTxcSZcCblasX8AKoEFC3FJbtsCNgNpmC1fMa0z47epi1uT1FVSYbJV6HidwEqRARR+croJ9fLYWSlZQMfWLuq22n6SVdh/WMthZ9O3GvdiwDdrKQ48RRJ1XTaMOdW7q8iQB45swGybEdBVhMBYTRYhnhkUMhd9icH7nYarMhzsnXn8p4yvW/JxDnXekgpQIFDxDlCzH4mD9LvwALOi4NibgpbWegZGQZZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IYa9yjXjZUCP6c+SxHpFAiWz/qkj1xWdWnDFw1jS3U=;
 b=zK0kh1ydNGETECfMiadJpKmIwqcTFtN0/BG1UkTH58kSaRzbv2eRPZJ/SCpDjLgxhf9rcHSQXIcnl5tF9fcGy7BJz4ZvYEHSsyRPafhDdTDWFcAHgRDLyhSWGUMMk1RcO1fjdHXzrhQUMyG4lFk5A0IyoisMcM6N+du99lYYDtJnCNJyGrlRtVadWkvXvQW7FjolkW0Tg08EADP8n/fyo6Tq2cv68QIWQBi3xrln4XAD6RJhl1tzpcyRP82maUNIq0t1pHuUIvZ2ldPbw95JcUqN6aWZf19ivnlPj7/VjJYiu6sUnDkt2PuLjXXmUYVTTs7jMppDKKmhkO4X7eDs5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by PH7PR11MB7596.namprd11.prod.outlook.com
 (2603:10b6:510:27e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Tue, 13 Oct
 2026 18:40:38 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 18:40:38 +0000
Message-ID: <baaaef94-1b29-4726-a03c-f437016c5113@intel.com>
Date: Wed, 14 Oct 2026 00:10:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 15/16] drm/xe: Validate thermal sensor count before
 reads
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261013020636.447620-1-karthik.poosa@intel.com>
 <20261013020636.447620-16-karthik.poosa@intel.com>
 <sashiko-outbox-168872@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-168872@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0345.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::14) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|PH7PR11MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6905d1-34ec-4152-a53a-08df295979ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|4143699003|56012099006|261009223027099003|10067099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: b1yk0SMnUYzkWoik0/LHnwj/7kequj3Azzv9Ve4YHr/mikWw0R2mjR5M076MF05cxDaI7olDy4v+9dX7spLhUAdD7S3YtYgbrN08S9dbwcu1myAbSYvQkYqwqacbw4dizy2CfUmcQfVVmsDA9SIuaLhhZ21N7//xkKNDVMlogOiCe6A2ZTJj4u1cVFLvzqBR/WH3TP9ibv+ZPS7cNylU0JhqOQYlwE8gYRvb7gPT0B0Wk6Eqsj57/zrYXqXc4Pf9Z6JbSy1d9Tfkn2AuijSLgOwGW+tyZ5/j/vGObLQU0wLM4i7tRRK/JrCoxRGpkz6wOnujCMCyCwxVR3kLqZEo5aqfttCuBJceQNspFF+ciWldNo0/Pyg51DlsqeudOA4zdvn7ovIwWnpIaMqgfQ33wtkQh1PChVN2lt5YC2+MG2G2PcE9LQZRRPbXtuo5dm07PCX0v2wLuOstOpAhhOkHPh07fHUZg9EcafRuKcJ0SvDeCYq6vRCyg8PgQDdfN2T2I6M0meHvwe+x4s3JvGoos6cDTpn0nlgT/Xc6TBOuOICtcV6aLL/CuOUm+jwmu8QAoyaP6VBy5zEx08YJ8Smq0D1YnH8gTvromu2WylkrqfDelOTm3Bf4Kqh4wDKsDwlPDIiwIqxQRLtz2FGaJprB1YuHBtTLwq+vaN7B5UZpYyU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(4143699003)(56012099006)(261009223027099003)(10067099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nld4RCtlV2VCZEEwMFZnbU1DV0tOSzQzd1NXRGFzWWVvZ2ZoSEo1N2JuWkU5?=
 =?utf-8?B?Qmt4YWNPeU1UanM4SUdFQUJYUXp0blVIVnZhWFMvclhnVjhnZTVYZ3psTXZH?=
 =?utf-8?B?ZWFrY0pqNG4rVjZCUVJlYzF2aHRJL1JhZWNQY2JKcEJXYTBOTDdRY1pQTnAv?=
 =?utf-8?B?Tjd1bmtldU5uS1lTd014Z0ZIRllNVXFpMTQ5RUZEVjJJWTA0NWhldTIvUVdB?=
 =?utf-8?B?WkNnSmJqRFI3SGhSU0lMU0xUd1ZNeHNtWUlQUDRFK3pZK3hDMkh2TlVaam00?=
 =?utf-8?B?UG1ZU0lQdGV5NFVQRGNmKzUyNWl1YS9jVWRTeVFJZHdGUWplM2htNVBLZTlG?=
 =?utf-8?B?TExxd2N2Zlowd20yT3J0V0loWlVhSlFJUElZMVo3Wi9VbDNNN3l5L1FWWUJT?=
 =?utf-8?B?a3BmbmIvNHNJNmxOcHFIOXNDcktzQm53cmVOaEFBWEp3OGlrb2x4NlRhSEpO?=
 =?utf-8?B?ejJLcFdTUE55TUV4ck5aWk9LUFJXeWY5bS9zRjY1a2RKUTRWK0NtZVB5a2tB?=
 =?utf-8?B?bXNGOU0raWk0d1NTdkhKMzRtVVRiQWtoemR2eWptdzJ5dTlwaG0ycVZRLzh0?=
 =?utf-8?B?dktmK25mQkJPTzdLclA2MVpaVHZwbU91aFVQV3ZGSGRqS3VwS0dQWDdLb1NM?=
 =?utf-8?B?MDhiREhiTm1MdDJxcVlZQ3lpV282UHdHZDhaaVBER2JsZ0xQSGNEakVKdU1Y?=
 =?utf-8?B?UzUxNXZSblpQT0E5cU1nSmJ0Vms4eGxtRDgxUnkvV3NCYlA1cnlyb1Zqd25R?=
 =?utf-8?B?T3R6SDY3T2R1SlNqdjFZYjZGT09Fa09JZ1NoVm11ekFlVDROTXBua3kvdjlu?=
 =?utf-8?B?bkUrU3FBTjBHZUphalZnaWljVEl4RHJMQ21Hd1IweXdHdGY5d1M0NnVrcUhL?=
 =?utf-8?B?WWlhVVBkZk4xbzlYMWZsa200VVdWSmlLWVluV01uWDk5L2ZPcUxOSGlQTnAz?=
 =?utf-8?B?cDMxVG1aYjNVR2dFUWJhektEUXdxQWF1NHBrbndYS3JJR0ljeVREWWtWOHky?=
 =?utf-8?B?YmUrTHZqREZsMm1BLzZkNERsQmpSZVpQclp5Y0ZRQUJwV05BbzQ4MUJsUnJj?=
 =?utf-8?B?SjUyZmQ4WGlpWXRrOUxUa1lkODM5SnNlNytSTEo4c2cvKyt1WUNCQkdJajdz?=
 =?utf-8?B?Z2tqZ0hEMnNBcmVWam1HRC9QRmFTam9RWXd2UXFCOUV6MUdNZks0cWRLM1hP?=
 =?utf-8?B?dkE5VGgyZmI5QUQxOG9kY2ZOWTNUcUc2N1lEc1pMVzZCMms4ZXFVMWFNZjlC?=
 =?utf-8?B?QXowWHVlSUoveUxuRWRHdHhaSFF5MTRpendMNDdtZ2MvUXN1VWNIclRDSjVz?=
 =?utf-8?B?QU80RHc5V0xydUkrL0c5NHZIbWp6L3RRNVFLQUliMmU2T1pHaDVEYTdBaEZF?=
 =?utf-8?B?UElCZmJXcU1kaWRTMXMyeTNJbk1ValNSZ05vS3o1WWpZcDd2YjQ3dEJ2eFU3?=
 =?utf-8?B?b3lxano1MWFFRjd1QVFKWm1IYzVqdTZ5aDVId0hsR0dpMklpbmNlRjE0U1dX?=
 =?utf-8?B?OG5YQ2xiZDBDVVY3eVJkNHpjeTVEbjF1L0tUMllGUVVmOEVObkFUbmRlSVc0?=
 =?utf-8?B?dXBZL01XengvTmNwTTFhVG5XcEw1alB4OFVyQWh2SVFJRHV4NEFJcTh5L0p5?=
 =?utf-8?B?NnBsdnd1L3hQMDZPbU8rai80ZVJXcG01MndRTHE2NnBnRnc1RDg2WTNNZDdX?=
 =?utf-8?B?MllxNy9UMlFpU0hWcFRzMU1oa05tK3RlTEhxMjFLSjZ5WkpPaENEa1g2WDZS?=
 =?utf-8?B?d25Pd1lGa2tXcTRnVzhxK2U0SE4zM1RnRmFhRUNPekMzRGk4cDBleUtCNjFC?=
 =?utf-8?B?TzRnZkhJbTErbEZlOFZnM00zNW1mTXMyZjJXY2Jad0lxTVl5RytSbnhsUm5H?=
 =?utf-8?B?ZWtETk1QTjUxcWh2VlVNSG1heTRjTDQ3cVlFNklyZXZidURxazNJbzVSQTBl?=
 =?utf-8?B?NkVRYU1QYTEzMDFYUXFWK0NTWjlaOUJ5TUlJb3lNdlFKVC82WUVBUTh2amkw?=
 =?utf-8?B?K1dzUUcvQm9mbjlOdEw4VlVjVXNvZ1cxbVFqclhlRnRJeHNqWWwxMHJFaStu?=
 =?utf-8?B?QW9SL0NiZUd4L3BldU1jZUhqanhLUmVLSzhuSzBUMlFZK2JUOGRVajJBaWNv?=
 =?utf-8?B?b1Q1VHNvM3EycjgrL0k3VkNxaVdyY1FHUTJFbWViMjJzNEtURElSL3ppb3dW?=
 =?utf-8?B?V1R1SmVHVzkvbzkzNGJLd1FlTWhUVjJITDFnMGc1UDU3S3dGU095aFhSZXBv?=
 =?utf-8?B?RzJQVitNQ0xLRDlyT2J0d2FhclBPb2lYdEVIbjNuQjJIZWtLWTJXT2RDZEZp?=
 =?utf-8?B?LzhlQitNRUxMWU1DTFpXcmFMVG5JbTE3SnNpbU9CNzc5bUF1TnBMZz09?=
X-Exchange-RoutingPolicyChecked: vlloTDI4+f7x8ubg6x+BSoJZ9GyldKFRewv7Z/an5TFNeA6C5r1G6XsDqFOjgh8NNn+8y8y/lgPkhP7hqgM+0JK46fzXJ8DZ8NdNFg5BBEhrcTDUSc4/xrpUlLZvu7iX1JJvhvzEPFH1O+JfGj61PuzViJeQR19l4aiSdDljZbbVKJpYAMYZOq1PJLHtv5J2ee6Ji4ffzG2j0kuqH/8Zy6vQosOIz3XhqLbdrdz7nP9pPwWTfHVvCxnH16xySB0v9kibGfRcaAvAze22jeROA0wzH8YSsEaKBdkom9cW/BKWuoJEjvWP0Udpy/xobjk0Bu7swiUy+XOPIbyhilvfuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6905d1-34ec-4152-a53a-08df295979ae
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:40:38.3337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ec5ztdmNEHrBrfMuqsZs8YhXcePwi6qC4dwxrXOZDEe9PnN9AKxxRP6I1DXXMElM2FeiIogqrUX3xU5HqqW6uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
X-OriginatorOrg: intel.com


On 13-10-2026 07:55, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe/hwmon: memory controller temperature incorrectly averages PCIe sensor
> --
>
> commit 560df9ca7dd177faf766f62db4da531e993c1514
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe: Validate thermal sensor count before reads
>
> This commit adds boundary checks to verify that READ_THERMAL_CONFIG reports
> enough entries for the platform-specific memory controller and PCIe sensor
> indices before attempting to read thermal data.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 7311f969f574f..702c739c9bf0a 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -920,6 +920,13 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   		end = hwmon->temp.count - 1;
>>   	}
>>   
>> +	if (end <= start || end > hwmon->temp.count) {
>> +		drm_warn(&hwmon->xe->drm,
>> +			 "memory controller range [%d, %d) is invalid for temperature count %d\n",
>> +			 start, end, hwmon->temp.count);
>> +		return -ENODATA;
>> +	}
>> +
> [Severity: Medium]
> If the firmware reports a thermal config count such that hwmon->temp.count - 1
> exceeds the hardcoded PCIe sensor index, will get_mc_temp() mistakenly average
> the PCIe sensor into the memory controller temperature?
>
> While the validation added here allows hwmon->temp.count - 1 to be larger than
> the PCIe sensor index, get_mc_temp() statically bounds its loop using
> end = hwmon->temp.count - 1. This could force the memory controller loop to
> iterate past the intended MCTRL range and consume the PCIe sensor located at
> that index:
>
>      for (i = start; i < end; i++) {
>          if (!mbx_temp_valid(hwmon, hwmon->temp.value[i]))
>              continue;
>          average += mbx_temp_decode(hwmon->temp.value[i]);
>          count++;
>      }
>
> Should end be explicitly capped at xe_hwmon_pcie_temp_index(hwmon) when
> calculating the memory controller average to prevent polluting the statistics
> with out-of-range sensors?
>
> [ ... ]
this shall be addressed in next revision.

