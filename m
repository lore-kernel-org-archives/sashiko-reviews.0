Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C3B30C14A
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 13:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617628; cv=fail; b=sVRUX54EC+LPN+YqCMUXvFIV9n4NLAKpF9KgZRJd9/CsudrfkYX+LoNZu7nnOqHUSIycMJgm5y70SUmO+rlqV1qUGNh5qIrN2AYu9qTqdjdUuee+p06dJmXCAAHF0kc2zSc9AhisQ2Cd+RshjqtwQA9rdKfuyl2xiH4lka6RAVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617628; c=relaxed/simple;
	bh=n6j951VmIsbYQ+wOv5v71KQp1cvtRYDqRUloA8AMF+M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Tqi3QBl8Y8SFirGjXQJkvcK9+aLypTXCS0f4ToFcDvDQ5TbFXKgaHgsHpjsroY+sQOOQxba7TK7niNlU371qQnLhvCtX67bNOgRxCICSK6xW0IWz2xiN5dD3E+Cd4NzBGAelJ8uH/l3e7J7GqDKy5TW+QGDEJBvTot7Ex1006eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbFadRjm; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbFadRjm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781617627; x=1813153627;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=n6j951VmIsbYQ+wOv5v71KQp1cvtRYDqRUloA8AMF+M=;
  b=NbFadRjmk69lDiAoCBvZB9b8NOhapECpUR04hVZ/deElzhhj5uVDLaxE
   pKGEV3qQu+qU6NBvwyPNiRnjlEjm5zF4JQims/1dKW53HoYu3oHv75BtD
   Ss93Fn5AjCdGqr2u1eTJ6hSdNpVtk0QzJco6HxfPQGrmttAX+hptj2RrY
   D2/Q9MBEfMmEw1SWhp8QpEqC6BJoF1zI04KLy+Nu6neOxa3Jh/zuTQUHv
   FUM9gDhDxwRO9kN86cTZHoVcAqEwTpO/GJNLpOq+Afyb6qlP9Ft3+z5Sd
   N0u3vYBp744q63rsGMYeF3qccm97lXk6HT5XNOan3z9rzsIQH8SFZpNJ2
   w==;
X-CSE-ConnectionGUID: /mZkI02DRBugc6nzjDyN6w==
X-CSE-MsgGUID: ibd3iv9hS2qApa13t+LRrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="107813373"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="107813373"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 06:47:06 -0700
X-CSE-ConnectionGUID: 8e7T889TSYqXHk2NMNNaqQ==
X-CSE-MsgGUID: 9mdbJweyS5OuN5g5qlFt4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="241405803"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 06:47:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 06:47:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 06:47:06 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 06:47:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWC3ViocD5jXGGLXk3KAU1ygszKwVkl24PeafTo+hL/nPtmj7hsVDq8NMVbgAOa/XzlacPN+J3UO+cwSzzmkg/Ju9ehX1wWC3X5wNKBWgacoZW126FQWGCp2h6CgAnE1+QEny/KIXrKi94RvcIKbbZw8apnIKkW12y/pwNGskuyFY1F6uiFiF+3iijyxhD0izLUJ4i1rFfLGp344LAbptnWxsy0obot05xYbWkUxP2tRae4tUJYdYbWsudz/9ueZrnIzWKv3/psb66hopoSq+DTvHvYpKN2ELxPBxVaY0I5yGQ46/aGmHIUU1P5+r2bwmP/XpTYqFs8JMKxQDGHVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaEpxQ1K1/n21sW97GIoy7LVkDYvYJ5CgKbpBDzMoYI=;
 b=kfX2PCCO3DUMj9XjvNKGlra32rXxxn4nFUcgKM1FocjDkJMiqeIPx50aPmXnipo+HkNr1Bw74JvWKjEs+r0WKLEziKQMwXs8jwmc67szsmS3fajPPJJorfzZX6Zf6m6IvFy+3tGcWioLOHs1QAiWP9Dt76JD8bGJ82CKExouW43tYtBuHfZ1+aeYKEpWrlRt21XxspNn5GSjxoXiaLDpVvmJBphzpd+8A1vdHRdEwVaLTxu251SE6cyZ/Z5R0vObZ+nkr5ZyPG+rzxEQpm+I0JCh1FvNVps0VsAq1sL2haUiKradtbLnPHgqQbyofcsHKlA0WCuUrtWF9UdZvP1Mvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ5PPF1170C8165.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::810) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 13:47:03 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 13:47:02 +0000
Message-ID: <4155528b-9349-405a-8f98-0e9bcef4697b@intel.com>
Date: Tue, 16 Jun 2026 16:46:57 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] i3c: master: Add missing runtime PM get in
 dev_nack_retry_count_store()
To: <sashiko-reviews@lists.linux.dev>, Adrian Ng Ho Yin
	<adrian.ho.yin.ng@altera.com>
CC: <Frank.Li@kernel.org>, <linux-i3c@lists.infradead.org>,
	<tze.yee.ng@altera.com>
References: <20260616113752.196140-3-adrian.hunter@intel.com>
 <20260616115145.0D16B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260616115145.0D16B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0288.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::21) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ5PPF1170C8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce4c834-66dd-4263-be6b-08decbadbed8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NwG2gbNCHYYeXgmEWIH/NlTxJm6cBWn7WNvGJgKHeMy2Iys6gUJ3fKdiGYSi1yg8Y4kskQnPr5ar6jkPCq49vUS5XmWveohPhkXMNObApdyjR8hQQ5QWIQ+Rf7mEsimzuoLo05kjR88+nV6cT5iCLqMKv0mK/ozu/zML/cnNtv1ZkWpmO5bh18DTFZQBeRw7baiAG9ASsn9F3thNPMGZeV8YxyKuOpB5f5SOwe1+AlgyGT398dvJm4f9TdSim7CN+o5g9Qvay3+DFAqdXP/wpOEu8xfVT7Oz1yo9No/uSLIPEpnTqCUF6UFS+++n6rYqyp5sEjMlD9o6+aDv8qxmQ1172HGKhbKEfDHHXmn2TVWSrhGVLsYwgwc9zQVAbWKDdU7ACVUOtP0k+Yosv1eXAaenoa2BATqCg5t5ghFTzwsAiXiwKRT8ZG/0ARHlA4XtVioN59oQGOkJDqukeOTbMBOxlsR+ajpxRek8Q/QsDLSFriIfpRZyiElRh9LChSHqhd878Y+ey4dS7KO16WPswehZHDj97XZAQG6XbII9psSH0Uty6c1NqfEkkKlSwglqzYAlYwod9Te3G+10cKtW6OobcIODp2SJ5aAL4TJwfl0gEWCTZdW9d4PQwkpTwmiEgov0OHNpBm5UaJXyhe7gT7PUXheAUXfvCeET0gmHWnaK1Hro63uoQqJLnT8yW85S
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk5Qay9TWisyeUdHaEN0YVUxRkxYTWZTRTloVHV0M0piRjEzTmREdjFKblFj?=
 =?utf-8?B?VTNCSE9XdDFCMzcvYmF1WEp4R3YvTXlvdTJqNUsvREc5eVNHMnI2cmpPNEFw?=
 =?utf-8?B?U24zSDFQL1NEcjNibGpTWGJ2amp0WnIyRjJjRTNXa0tsVVJGZm5mTGtWbmln?=
 =?utf-8?B?eS80dVl0SEFqV1ZFOEc0S1l5azVnZW5TZFRTRmF1aXh2OXNsZmdCaytnZ0JS?=
 =?utf-8?B?TElNd1MycmlFOWxBME05cm9pbU94SjdQVVMreVJuRlFvRDF3cU1CVGFaRVFk?=
 =?utf-8?B?eXhQYUFZVEJSL2pqc2c1STVmUjJlczVuK3pFQnZGVmlxS0JNZHJxWTdrejZw?=
 =?utf-8?B?Wmxrbks4dWpwbGowQzZxZzl0RCtIVVFlYVNiVUh4MCtJdEgxTUtWaFJhbnVD?=
 =?utf-8?B?RG9nVys5R0dJYzArZldNVmZlaHJPRld4R0RiZ0paUjQ5MDRDdXhYQVl3Nlk5?=
 =?utf-8?B?RUUrRGVrcTVPR3BUcTFPaysyNFpTdjFleitOdXhUMXdqQmkvbXVLUnN3SVBW?=
 =?utf-8?B?bCswd1lIVWpnWDZTckR5aDMyaGZVTXlzdHZ5QXdZbjBOemNvYzkxZVJkRWJj?=
 =?utf-8?B?dzh0dHZZRDcwQnM1TkcrTzFJQnhDMlIxZzZ2Q2dydnFrZG9ka3ByUElqNGdx?=
 =?utf-8?B?ajU1YmNYOU91TmRVS3hwWlVrcUw4RDl0cy93UzVWbmdFUk12eG40M2pQanZL?=
 =?utf-8?B?eUVYdU1hL29keGdWaDkyalZIM1ArS0s0c01VdHAyb2R4UUlpYU9GUWNjeDkr?=
 =?utf-8?B?cE9jMWlrdUk1R213RzlaUDhVWGNneDI4a2wwS0g5elpKeWdXMWxnM2hxWUp0?=
 =?utf-8?B?Nk1RWnQrZGljZUFaVVd0N0ZSMlZOb1FYM21BcWM1RVlJc0EvbmJJdDZlWGpK?=
 =?utf-8?B?MXZ3bzBwUERnbGlzYThSbUx4Vy9EWUlNSEJzQm5OMnEzKzVqWnc4czM5T1U0?=
 =?utf-8?B?TUczdUFmUVlmVmtKNWp1TGY3M0ZMMDV6d1JJUzAvSDl5V0wzTVlwWFUyRnVm?=
 =?utf-8?B?T0hNZzdXZjlBWGNFQWFBVThpbnBtVERpbXJQcndXVHVUNEpMbldTckJIcEt2?=
 =?utf-8?B?cGU3OXlzNWVrNU9WNGdjL0o5UlJURUVBR1ZhWVk5R2w5aEx1ampTODNzd3Ux?=
 =?utf-8?B?MDBmSzFtWWI2K3BQOU5zNTFuQXFXeGFNb1JRNXh2eVczbzR0cFMyRGJSTm5M?=
 =?utf-8?B?MTNLeHM0Vm9wckhLTms5Z04yZHlFdS83V0hpK0ZsUFlXZG5BRG45a2dGNm0r?=
 =?utf-8?B?ekZ2Wk44SE1GSXhJdWdFM3dwTGhYYVRqRTZFWWdSM2oxcG1mM0VqWTR1WVBo?=
 =?utf-8?B?MkFuMUdWVEppWXQ0ME1JdnJwNDhnZHkrL3MrVFRXL0poMmhzbE9RV3VHUm5S?=
 =?utf-8?B?RmJJRUdTUG9lZ205M3Byc1RWUGpMbm8zb0hNL2hpem11TVZQcTlVUzAyUUMy?=
 =?utf-8?B?b0R6SXVxc2hFTTRyd09uUjQ2RG5yeGhqWmcwa3Y5b3JRdmtqczJlTVdqdGdO?=
 =?utf-8?B?L3lIQ2JDdHdUaldOQUJqNHd1VlE3RkFpRCt5bS94ak85eXNIOCtoZXBydEor?=
 =?utf-8?B?eFFMNDE2UzN6MGRYeCtHZjBPcTd1UjBwY2tXTXFXOWw1OWJlalNzc0lObjJh?=
 =?utf-8?B?d2tyR2tDckZKejQ4VG5DSFBhZHpmTUNTOVpBZGk0NmxBWW5USmZBT1dlMmhL?=
 =?utf-8?B?a3k2THRHRE1VTnBxaEFaTjFvOWVpVzAyd1MzYXo3UXVvVm1LZ1BVak5iUDZa?=
 =?utf-8?B?UWd2aEpJWmoyMUptZ20yNDFkbWZBRnE3ZU9zNnN1dG1DdGlGOUR5V05ZNGxj?=
 =?utf-8?B?R0lyUGJpY3dwVXRENjR5eTNNK3NYL2xXU3RPaFllOUNqcHVwSTZrMVgwMlln?=
 =?utf-8?B?ay9GdUprOGkycWxjVm5YdWZHQis2TjBLR0QyOG4wemJaQ2MzZVE5RTRqQ0tR?=
 =?utf-8?B?TjVnYk1zWitQUVdrZVU2eGRMMXFBejgxeWlpc1ZBZXBuSUFEbDFQL20vWGNx?=
 =?utf-8?B?TktGRkpodnpFSG5EVzlIVU1aQ0R3MlFqVlFXcGd0cXRlaWFyY3A3MG9BdGpO?=
 =?utf-8?B?cnNJclNKS01lclBDZWZDS1pGeEljTEtxN2xKUnRyYlZsWmtJNnVWUG9kWkRU?=
 =?utf-8?B?ZGVWR2FMa3Z6SHpuTUpBbUY1V2EwSTBJNUNyRG9DekxtWVYxL3JiZVJiUjFF?=
 =?utf-8?B?RmEybUNHbmVTenNvZ1ZYMDBTUWpPbTVVTCsyd1FHNHRNMEtGVFhhUHcrSzFs?=
 =?utf-8?B?ZngwUm9UTnpBQmNwSXlDT0ludkFJNHdiQVI1K3VQNDVOQSt0OVhJKzJJeno0?=
 =?utf-8?B?Z3VlWjJFN3RucVdvMDkwQm9JUjQyZTA1b3puVUpoUHIzc01lZU1TL05KMVlI?=
 =?utf-8?Q?Xdb1Vr/ZhF32LJJQ=3D?=
X-Exchange-RoutingPolicyChecked: a0ltEvOcdU1emIIEYhMNOXJW/YjpwiGzdAG89pKJXJF0KT5PefN+ijlEImOCJXCl2xaJxgqPocthuyv/XY18l4Wqper783MUMrnXI5oBsLA6VhAzKYRkOeTgY/1yjcCBt9O03gg5GOSZ0tgtQf4tVp9gdOr4dDcpEtaTs0Nf9PJoTAIl5TKUqi9PbuMr+hOQLnMybUjK+rRGRiB28sjW7zR7O75i+oGrwxbkFPRk2UbT645S15sXWNofQ/szIzFbIbIsT+PJxxmIcaXBNwNP1ALeoewIkL8ZSdYP8krS/RJOjOBncCJLe2MpyNZlP4akXxbm3Qisx15lf7ahJmdXZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce4c834-66dd-4263-be6b-08decbadbed8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 13:47:02.7655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nEJrZ+o3fHXA581KHtVoDOLK2v4ryv0VHlOLyWnahvZXJD92blRTotWPSBDBB7m18xj+hFtYx0lT5PKgZ5NgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1170C8165
X-OriginatorOrg: intel.com

On 16/06/2026 14:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Hardware configuration, including the NACK retry count, is lost across runtime suspend/resume cycles.
> --
> 
> commit c41eb9cead24507098d7a57db0101da0e5c68c34
> Author: Adrian Hunter <adrian.hunter@intel.com>
> 
> i3c: master: Add missing runtime PM get in dev_nack_retry_count_store()
> 
> Ensure the device is runtime resumed while updating the retry
> configuration to avoid accessing the controller while suspended.
> 
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index 05ea9e3c4d46f..a24944047e30c 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
> 
> [ ... ]
> 
>> @@ -767,12 +767,18 @@ static ssize_t dev_nack_retry_count_store(struct device *dev,
>>  	i3c_bus_maintenance_lock(i3cbus);
>>  	ret = master->ops->set_dev_nack_retry(master, val);
>>  	if (!ret)
>>  		master->dev_nack_retry_count = val;
>>  	i3c_bus_maintenance_unlock(i3cbus);
>>  
>> +	i3c_master_rpm_put(master);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does putting the device to
> sleep here immediately cause the newly written retry count to be lost?
> 
> When the dw-i3c-master device enters runtime suspend, the hardware is reset
> via reset_control_assert() in dw_i3c_master_runtime_suspend().
> 
> Upon resuming, dw_i3c_master_restore_addrs() reads the newly reset hardware
> register (which returns 0), updates only the address bits, and writes it
> back. This permanently discards other configuration fields, including the
> DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT configured here, as well as other fields
> like SIR_REJECT and IBI_MDB.
> 
> Because dev_nack_retry_count_store() now correctly drops the runtime PM
> reference, the controller can suspend immediately after the configuration is
> written. Will this silently revert the retry count back to its reset state?

+ Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Looks like dw_i3c_master_restore_addrs() needs to do more to restore
dev_nack_retry_count values.

