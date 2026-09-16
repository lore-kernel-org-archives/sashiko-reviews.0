Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE7321A453
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 04:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532365; cv=fail; b=na5tGyueDGAdMQwxNuL0PG3D9Iv2zKHGjh+4zfSizIXgxDyVwo//6a9kP9JJ++IZ99SaOGb7FvwGBpAdaC+pNEZj8gBQRtbZ4NZqMYZt3G94bom+H1Ff+adQqPvunmHkRD+3MV8xEOxOxnWNJLEpFQNo8qrE9ZzwNlvOU4fSlrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532365; c=relaxed/simple;
	bh=X0wSsmKLN0BpcuzxfCEf+R/7EK8MVNnMwdadWnJJla4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ba5ObRG8viuxWf06bfmEhvnbmeyAiVQJxn828PBQed5WKInjN5yAHiUScDfR4O69FvU/LQCTClWSGKmgXVHom+oK33NUPuoYArIPukA3x3Jd7yPUlg6F7dopo9jNo4GmHVfTrBIMzYgyuFvCGhlFHJVpPDlPhzMB8ybWIv9MfIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmDdQnDf; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmDdQnDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789532363; x=1821068363;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X0wSsmKLN0BpcuzxfCEf+R/7EK8MVNnMwdadWnJJla4=;
  b=JmDdQnDfNI1we+foZ21WcRPKxQWLTn+g/PHdFH03fNeWXGdedLGWxKV/
   VwBNbQVfgoherGHmP0TAP1SyaULqy3h/fSV4h64nh99LS1MGS+G+rk4Ki
   qsfPSe4auARqVrCbvshmztYacYHs0YuJwCxLOyB+doVei/Rg6b0Okefj2
   nduRUmX3YtMmmr904KXGLrkwLxfT+WkZFzFpELGHGPm2viFG0zaJhzajZ
   8odj2SBtTmBvCEAnmc/ray6eqNmCVZhUqK/fi99HGPo2dn6jqOoZQSu9w
   M82rKB41VxBVSJNjX2dlwmXpX2FP4rktcAII9TGtShaVu5c0jbxPLMrHV
   g==;
X-CSE-ConnectionGUID: IL7wbItVQFyvmXOpSd86nw==
X-CSE-MsgGUID: rmPk8ebgTXy06pCsGegT8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89921729"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89921729"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:19:23 -0700
X-CSE-ConnectionGUID: rP7stxk9SdC6ZLaRnWnTXQ==
X-CSE-MsgGUID: /lVUd3GYQ8iZ422wIhwSjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273761326"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:19:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 21:19:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 21:19:22 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 21:19:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xmx5cIfjZTQ3XaMpohDOu8ijnJvwnqGAhqa6afTIovXXFFfGOJKXqM1uIu+/PvnfXYxwdoZ1811zK/e7p/R+i/99bJUE1xSBtoeLaqAqCA/ebr7loMp+6o0OvysTGvm9Ghte4XvzvoPo7VGKeXp0BHa7ltwekwrCL5JcM8m038NRwnR2MUhEnmUW//nxxqzzVpZV/eJ8DSCcya96zC9cG3T+C2xpuihm+SKpK4kLv9TqIR1lqjRluVQbYHE8bJEVC/0rGbLNYBVsyCYXzeqSE6n1ZQRmmiT4lvzu5wz1MPNSaznOmbUC2CMaDFAqEXVC6y5tQSs09C7XXEFsJMyD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywZ0w5L1vQNKt3IuLoaI9l+REJJ/lfbLA7ok9UtaRZE=;
 b=Z8bIxidYNI4p+iNf73i+NcHBZEuDKaKQatBraOjzuHbbvq/MifkbgELvu/5X7X7BaC9GuJjxxW9mjW3Paty8bX3LOP5nOe6yjbrmvyAZuPEgNtrDAAZ6PxdBArvtNW/aKiGqo8xV/m99/G8w+D7PMV8FbVhGqphKDPnHwJtZFRGwICei/F9CrFicRuzoVnsWTLlhT0J8MxRPvxujBNPLVsgGAUcaZh5QE0QVXgBeClDXjAdtql33TREtjksTucVJec8BExBU6eZcwrcNYxqJAiEf1n0TYOwHlMCj7Wstouwu2E7xbq6EBt5zjFfcayR+CPIM/3ERPP0LB/LrkCYxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by DS6PR11MB797010.namprd11.prod.outlook.com
 (2603:10b6:8:528::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 04:19:20 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 04:19:20 +0000
Message-ID: <15d76c67-6379-4e63-a2fc-22e3b7e0b527@intel.com>
Date: Wed, 16 Sep 2026 09:49:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/14] drm/i915/dip: Enable Common SDP Transmission
 line
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
 <20260915164657.3429075-12-ankit.k.nautiyal@intel.com>
 <20260915172857.E03151F000FF@smtp.kernel.org>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260915172857.E03151F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0077.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::11) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|DS6PR11MB797010:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7af139-bbab-4b7d-3cc5-08df13a9ae02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|10067099003|4143699003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6u56sIqPNqPdMOtk2ov0e+yINrfVnF0QlkPZR67y/RF7xwSwbobiZdEnBpuuzbBeBvRmT4t8g95a8uyxLV8rkcA5wEnIg/xAu5U3taYXeBMsL6YajaTLEHCXb5Shms/GScqSuDsW+TCV326YvoQwq+PnvCc3Lh0LiQ7Y3UMqoKH/dQAahfNgIbnzGntvZKs+qyCbcqylMrkEI1+a9fWY3EAwQ2//Xi5Z9Vw9YvLWt68HYecpkJyzAghcgD2UVn5YCPF3fqDpdZ5nA1pGW88PF7ZLXRWu1PE7In9l73bhx9A24mxnM65wt3NIluXm3S55f1TeDHdsv0kqeChBSdz6OkDhG0Hq4VO3AcJeMbLSTMAgmu5Cyievj3yVwxZ+PRAs+102N6JRvkDWFm11pRcji/bkxhUOuy6ob/ZqaBZaWDQ19rUl23cHepC8a1GRnm4z3SSTe0ngK2iNx7hu8gCxaY7qm+Z4l0H479AF0OjdRazOsrC6YA8w3OGOa9cghjRiKvId6UOHrMwzoH9MRziSCyRSDDIm9QrOc+kym1CtTWbfgy8h3uEUKwwWTZp/meV3ieVvxVbPlnlNOxcpGIJ9HzOJ53319w+sRmUllScamroFgqYNwFUvQ45hLMpxlOhiTXUcrG1K+HM7NA2fK/Dd9onhkcQPtNn0EjnJ3PK0yOM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB148960.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnByVkxnRVNXZW9neVVuanJLMGtoU2VrekwwaVZDZklRVWJ4bG5Eb0p2NlhM?=
 =?utf-8?B?V0ZGdkFQTnFSRzRrb0tEd2UxaWlaTEZETGE5MUtWcWZHOEZadWExeWl4WkN4?=
 =?utf-8?B?U2FOVXQrRlBmL29kQVN5bTY3cVhuV2NCYlBvMzUzUEl2dTVON0phdng2ZmEv?=
 =?utf-8?B?dTN3b25xb1lHV0VRTTVxcjRsc21pNVBRVXJzVS9CQk1tTkdGV3hFd015MWgw?=
 =?utf-8?B?dkV5cXNLa1hOUlM2VGRLc2JzbG5lVTNTVm51eUF6Qm5CVHl2UDlDTXlCWjhJ?=
 =?utf-8?B?a3NsSkJzWGtaUnRzTVh6NXBGNE9ya3VEZkllemxqZDVLUldHVnFSYXRvN0hK?=
 =?utf-8?B?aDdscmVWUll3UVJVNnBacnZLRFZxY0pnd0lnM1pkdFFHOG5KNW5kOGdpYWpp?=
 =?utf-8?B?NHJQbmFDVXMzS0JPc1NoWkt1ZXVxVlgzcm1HMEdKUUZzVWpBN3E0M0s3Y0dh?=
 =?utf-8?B?OGRYeTZ1Y09ITTQvZ3BzdEJ1aDhUb05ZSzRaOUZ0RHB4YXkwRjVENG5yVHpO?=
 =?utf-8?B?NnVyRkFIZ3pqYnZacFVIYmZWVEFoRnpWTFZmazZmcjdRRnVlMDdHa1FCZE1O?=
 =?utf-8?B?Vnd0UHBPTzlQb0ZTWkxSSm9JSURvWEU0TG10TVJkR2JsN0xMQkJTZDNrdThE?=
 =?utf-8?B?NDhuUGJKVW03ZVNyRnU3TG1lVVdPcHZYejB4UjVWY2U3TFlpWWlBQ0p1bXpu?=
 =?utf-8?B?dTVSZEVMWUtram9VNzJRYnhjcXZrMXI4NFdnV2dYNW5ITDY2MVhHRjdHV2d5?=
 =?utf-8?B?ZHdLVE8yVy8xQUlIKytFN3l1M0VHbFAvdmczVlE5MmtmQ29DTVNFaXg3L282?=
 =?utf-8?B?TmY4MUMxTEE1YUxsVUJuYm1yRk9KcUZpWW0zbENPMXVHVzgzZkxmbFppTHdV?=
 =?utf-8?B?RUhDL1Z6WnNkYlI5VzBHSXBCeHR5eUx4OFFURzZMbDM1K1prbHV4QlRrMEdW?=
 =?utf-8?B?R2lQZ3ZCYnJwdDRQbVUzdW56NDBENVVlN1NKRHJveVFOTGxNTSswNW5PVnoz?=
 =?utf-8?B?UkkvZlVYTnliditCVk15bmxmVkRrRDlYS0VMa3czd3dIdkRncklFMFl4d3Mv?=
 =?utf-8?B?aTFaRWFkZkVDczZQVWJUTk1ySDNsT2FmcXlPSm1uN0Qxd2FhRlo1N3ZSa0lv?=
 =?utf-8?B?clFVUENYQkxXVzMxNWlpcVJhNW9wSUsvWVNZYjFyazVWRUNZU2pMODVaS2U5?=
 =?utf-8?B?dStwU09UQnM3TXNCMGN2NCtKNTgzUEZMaldzRVhNNGJqdjVybllzL0Z5Z0hQ?=
 =?utf-8?B?VVZIRE45NzN2eEhMTVVQRDVubkk5QjZnSS9QSFAvcnpRdDRSN0s3bG51RzJQ?=
 =?utf-8?B?b0c5T3JpbFp5aG9zVHNha1o3L1Erc0dqa3ZjK01VaTluRkVxQ1pyN3RKL2M5?=
 =?utf-8?B?c3ZUbjRsb1A4eWhmUjE1V0E2alZZR2ZJY0ErcS9XaGlrTVdxWkpBZ21DZFhB?=
 =?utf-8?B?dk4vZkRMQXQra0I3NDFHTWNqRVAvM1JSejRBKy8zeUZ5cldIbEdRbVY3aHR0?=
 =?utf-8?B?VDBhemFqR2VseHFSU3VDZUtHdHNzU3dneGsyV0gycXVrRG0rK3FLODA4RlRm?=
 =?utf-8?B?RU5tdHBGSU9BRlQ3UE16STVJVGo0b3ozTkIzV1Z4Rzh4a2oxYTc2N1Qzd1c4?=
 =?utf-8?B?Tmw3WkVBYlZ6bzA1cEhnalF4L1huN3BBYTl4VlBKY1JLZXo1Y29LZDBpQitT?=
 =?utf-8?B?KzVXNk90TncyZlpyY2pHdG5LVWdPcFVTMW1MRjF5Vjl1S0VWV0NMd2xSOHNO?=
 =?utf-8?B?SjYyYjcwUzMrNzV1OHVMZ0lLM0pCRWN0L2pqTXJpZk9vOWJaNlFmd0ErMzI0?=
 =?utf-8?B?UlRWZDJHSlpudXM2NXl2cTZmeUthMXl2czF5WTQvWHVZS2Jzb3lRbEZteVQ1?=
 =?utf-8?B?aGhISjRRZmJ5aTZiL2RBWGVYbU9rNUM4ZXVmUmZWZ3BkRExUdDVsTHJVTktF?=
 =?utf-8?B?bVBUeHdLb3Foc055RHVJeDRSTko1RGR3Mm9Rb1R1R0l4d3NidUlETC91SWZH?=
 =?utf-8?B?bGZDWEhwclZyWkx3YXhtS043c3ozeWphbHR1L01TMTlaWVcwd1BEaW5KUHEr?=
 =?utf-8?B?N0JsWldhQStEMmJhVi85Y204em9meVV1UnNUMFVMUHFzTVVraTgxUzBPVW4z?=
 =?utf-8?B?MEo2cklnTzBkaE8yWHFBN3d5N2kwK3dTSm9kczYyVU5DL0IzeHJQR0IxMnJo?=
 =?utf-8?B?bzVSNXI5SzcrSG1NYTVBcko0SzFtL05SNS9qQ2RzS0c1MG5TY1ArczQ4Q0RI?=
 =?utf-8?B?SldQYnA3Zzd0NDRVTDIxVXFrWENOend5T1hhTUlzM2FiN0cyazFpZlAwbTl2?=
 =?utf-8?B?NjI3VUc5WE8zTjdiMHZJTkordXpoTVBsbFEyNlNqOEp6WXNBa2lUN3FnWVRL?=
 =?utf-8?Q?88AHIyAC5MFXERyg=3D?=
X-Exchange-RoutingPolicyChecked: TEQyLvGH11x2ItHG/BU4LY6HTr4Rkgsh24rhthRMDhVGZHdGlbnRu7hhAjGu/Ib58m8Km7zQRO4MsLnkWSwRhJ9NqDym5f8s5fdK4RXZuGjkYG7Y6DKDMSAkbBCJVnq0ou/BBiipurqh8HC/nsdpCfqMtpdJTGvOj2RfZ6Xmc4W1UqWnSu9h89hFL7/Nfdet5o7skMg8KpEEbKIT2Dny+PYrYFp5oUNEuD+LZiGONU0njCF+GQSE2d0pswgawBI2eV1KU6pLP7x28L9miDWVvJQk9k+V5vjcxIyH03eqBtoCULMoLOd9lNngO+T59lnPanNuw+hjITCpSpVcJHZVJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7af139-bbab-4b7d-3cc5-08df13a9ae02
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 04:19:20.2331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FbhbvbPrxonbefs0cXl9YQaVuu1oZqGQbM24hhVmq8T/KOXy1Y3rE7KKpAYcwNjh/wgmjmKrKdKOLAXX1hb6osoCwgNvr0dT9g0Z4mg6eI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB797010
X-OriginatorOrg: intel.com


On 9/15/2026 10:58 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/i915/dip: Missing CMN_SDP_TL programming for DP MST slave transcoders
> --
>
> commit de3a67cbeba4a6e70cc767d1dce1950454f58dfa
> Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> drm/i915/dip: Enable Common SDP Transmission line
>
> This commit enables programming of the common SDP transmission line on
> supported platforms. It computes and programs the base transmission line
> and stagger values during modeset. It also disables the feature on pipe
> disable.
>
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index dacb4b7588a02..3cdb06e81130b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -2737,6 +2737,8 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>>   	/* 6.o Configure and enable FEC if needed */
>>   	intel_ddi_enable_fec(encoder, crtc_state);
>>   
>> +	intel_dip_cmn_sdp_transmission_line_enable(crtc_state);
>> +
> [Severity: Medium]
> Will placing this transcoder-specific initialization in mtl_ddi_pre_enable_dp()
> cause it to be skipped for subsequent MST streams?
>
> In DP MST configurations, mst_stream_pre_enable() invokes the primary encoder's
> pre_enable hook (mtl_ddi_pre_enable_dp()) solely for the first active MST
> stream.
>
> Because intel_dip_cmn_sdp_transmission_line_enable() is called here, it
> appears it will be skipped for all subsequent streams. This would leave the
> CMN_SDP_TL registers uninitialized for slave transcoders, potentially causing
> broken or mistimed SDP transmission on secondary MST monitors.
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
> Does placing this disable routine in intel_ddi_buf_disable() prevent it from
> executing for slave transcoders during MST teardown?
>
> Similar to the enable path, intel_ddi_buf_disable() is only called for the
> last active stream during teardown, which means the CMN_SDP_TL disable routine
> would be skipped for slave streams.


For both comments. MST + VRR is not yet supported.

Regards,

Ankit

>
>>   	intel_ddi_disable_fec(encoder, crtc_state);
>>   
>>   	if (DISPLAY_VER(display) < 14)
