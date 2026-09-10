Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EE1534448
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059927; cv=fail; b=IdxYaW3YUVm+hGatEif3kux/Cph4s+Mdy/ydHlDdGoi8QVUqRGR1I8fWtmM8Z3MoCovW6hIkihdxvLDKj39gfXETidrl+jfaprzvZL1fwSETongSBMvXyNZxjUv50bU4acPHMF0VnNiyCE91JnUZqrlg5yhU+03VtfgRyiHGDaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059927; c=relaxed/simple;
	bh=sfIUtF8Y2uRdAshAYdIm1U9Cj5q0RxBr1xEEg4DnsRA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ntGufYnKUF/a7/YVfi5Lyjiy4ufvMU/3tu62m0Kxe94limThJXS6HRmvvcVX102+IdJHchipoGjsKtJqZOPAT+/n6fJvDRgIbTcR3Y5Zk932PYEboqGez7SNrYeSlSsx44UDXiTOcFOVvOEtgZugcxZ4anBrdnt99Yd7e35fW+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1fo0Rik; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1fo0Rik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789059920; x=1820595920;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sfIUtF8Y2uRdAshAYdIm1U9Cj5q0RxBr1xEEg4DnsRA=;
  b=W1fo0RikzoXL5Za2cngjdtLzKnrXTPfjuwMDZ9Psa02s63J951fa+XzF
   PJKw3aLso8Dw4dNPZk1xe/Qoo8cHSme22iXm2vONdQ9vzpNk7KXr90I1V
   fkSol5r9HmO3qyH8BLZrM22GkDBFI2o/19dvetYmN3tAcvkiU5RC0Z1BO
   iEIl5PU62Ni/HvpK176htIdO+XNsoPqN82msm39hx+vKHUd/Hf1gmVZtB
   JgEqMlGfeublLbta2psG1JBYP/OsVG9Tw85Il/DovOGYzE1pe/NAU5eRR
   C31vxIDGeew1iUa1q3RU9GMhQnwPnOuDh4crvPPUPENPYFJbDo4wFs0oQ
   Q==;
X-CSE-ConnectionGUID: xgedu5ggR42rGVYFe1q0gw==
X-CSE-MsgGUID: tCgZb+poReWHe8BxIRyBCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93381892"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93381892"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 10:05:15 -0700
X-CSE-ConnectionGUID: paRq0HQ7Tcuxcj3hLO5j7g==
X-CSE-MsgGUID: lbPS7tOKS4+OGSzta9CT1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="268001631"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 10:05:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 10:05:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 10:05:14 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 10:05:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoCvlc/mUz2S+GeoEfmMRjBWwNawJG032bwbAQrYZk5KgaDNiB1Xv0XcdCkD87IOIuLlyoIfjnjqTFtq9nTfdN7dG+mLOlRzQO/E/iMintgMyayrxTKrHFy/gC6trF2l+Y/sFFB1Mi2Ni7yf3syWBYvuwlzAbsOi9A4Y803zq3yu0CaHuDga3JC+23jib+n5Wbg7UFQEbHZNd9Qi7gPnTdsFrdEOA5mQgHM+NyGISOIAs3y2sXeJC/B8KJ5r4jkkroUb2wA+sRe5T9o85ZnqMsRKgckqRx2YSUjPFe93tr6V4kfZq2rFDTyexycqJ9ympZ7X2fl0Ak3sCWfcK5EwDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iPvU4y4tcvtNfvi9ueLUVUU0AwuiDn/ebGFAFMbITM=;
 b=UHIeKnQVYsOo5vZn2Pyh7GITal3n18AeGx8Ms3/zpKIoBSXlNEtWKd62h5lRcz28Bgax9QfovNkrK13eKbcrJ8wbUbAK9zm4G9DRSjYoqRC+BhlOEBDIfX4oMZHpPD4sVDGMA/RD+fpJ8h6eX+CSYRf70rRLMb7xfhvc5yZI9TR2VYPoVB5/SdiVLFzgy1Tlsk+mBj/FK5GKoHXb/lBukmu85JlhQGqN1zIRopL3MPDwdZs49QFLQJN++GytTN5b976wf3yO+pxsgOdX+jZ10kchPIAXMOINsfbtjsiO9huAVxtcbYh3YcdUZ9zs4PxP7elZFC6m+Nv+piCJ0J+GrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DM6PR11MB4609.namprd11.prod.outlook.com (2603:10b6:5:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 17:05:10 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 17:05:10 +0000
Message-ID: <1330f5e5-5e0f-4bb7-a05f-c115299b4296@intel.com>
Date: Thu, 10 Sep 2026 22:35:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/xe/hwmon: Decode CRI temperature registers as
 IEEE-754
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
 <20260902175507.3910573-5-karthik.poosa@intel.com>
 <20260902180811.0BD161F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260902180811.0BD161F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0282.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::15) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DM6PR11MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 7005e8c2-8bc6-49c0-ad93-08df0f5dac1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info: xb4bIcWuMLkP9caRdjko/6cQZh8Rls8O0se4v1jS1Sy9ag/KjsLRteEwIbO5Vh++ewzjTkkSowP9Cd0mjT90xtOp//vVytp3NVIZawNbLn4VwgGx3lg4YOVYmK9FYY+Q1ZwACtK3hccri5kmaS3LKDWzz9dcOboYPh7sDpf23kJSaCQICaR21apEjU11ftLcqcEg6P4NPEjfpQn98hv6sKCCDWEtRI9K5vG2tv5cmwWToOohsGRYvXnqdU9pw8wznhKPsvf1J8QKrzi6EDOh8vi1Iis2L7AHvd3VBm70NksZR0X3kolFB+AC1u6xgz1FeZYtyQdg1v539E0ehgabvxcFRB5dfiyqqiMoqRLaKRyVlEAa68sU+xIslmqBOw0eIt+FxTbwhmBeasFum1MEoK6Nm7Z/DN9yCeWCuRXxL9FZv6WY0YLrjdiVNhE2MYMP0r9zRnSKBgdFBsmrUqkcWm0/wak+Qsq6+l7yfutVYMyo+7qS6RteZc1MxqFSZWo3VgKZdj8Aw6gntCNsa9MsYXgToVQOjx+NZ59B/rHQNgwGJ774P7uuQaqTutEq6wkHm0c02T0U7Ka4183GSSxdZE4vGcQPH8fXivMmkWxl7GQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(5023799004)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0x4SVV5b1BDZ3JhRi91aUhjd0ltMmhIK2J6dHRtSmVGL09EVFBsbzY1MlR1?=
 =?utf-8?B?RmMrWTQrVGhhU0NpYzUxNEJGUkdReDBIb3pQdm5hQTFHU0VzUm5uOVIvbzY2?=
 =?utf-8?B?YUt5c3pmU05Ea21XZlBUNDdObjdoTmE2N2NUZHdyK28yNk9GL0w1Sm1LUVIr?=
 =?utf-8?B?cnRUbkZkK1ZtY2tZRWRHcFlla00rbnlmOS9LZFVLdEdaTDdIU2NTT2JPd2VM?=
 =?utf-8?B?RWpoU2JuVjRZd0FQR05JOHBEOXNtR0FaR3VBak50Wko3MWdNSW1VN3hJNHRJ?=
 =?utf-8?B?aVNod25iRjFHVXFqaW9vdWZFR1FNLzZ4OERPTHR2UXZPU2t1VTlBdHZPOE5C?=
 =?utf-8?B?aHFxMlhUdDNsVG1XbW1uSTRLUEtLekRqU2d1OS9SbjZLZ0NqSEZBQWVYSkd1?=
 =?utf-8?B?MEN0QkQwc3BrNkdTYytKNHRzYVF5K0NoWWFSOFZPT0d4TzhzcHFMWG5qcGtS?=
 =?utf-8?B?YTR4RG5TTlhrWEZvd0pqenJpcDdMSWovdU54V0hFeGVGL1kvcHFtblhFT00y?=
 =?utf-8?B?Z1hkeWpFSTA3Q1hnS0cxaGFWRGREai94M1Fudy9iS0xHdStleEVYVHRVSnYv?=
 =?utf-8?B?ZnNPZlY2cVY1emJNdFg5clJ2N0RXbkI0TW5oYW9xQ25HYmlyTjlPRDMwbXB2?=
 =?utf-8?B?VHFlekw1Nkt5ZUQ5dDFOeXRQNWt2WXd1QjQ1TEFMU08xdm00WkZ5MWR6VVZF?=
 =?utf-8?B?akJlbjZaZ1E4bUZnU0Z5VERQTFRDVXRqeWhsTWMrK3ErV3NCRU01ZjUrdUl1?=
 =?utf-8?B?MFIwNHRhVk9VVXVBNzNENy92MnVPNEJDQ1Q0blZrTlNkRVZrWmNMVjRpMWNJ?=
 =?utf-8?B?UkFFbXl3Nm5sdDJ1clJ6YnNPeFhiSU1vUnF3U0pXUURsU0tvM2UwMDh6ZVVq?=
 =?utf-8?B?RDNJMjF2eS9sWkVmUFhMUHZOVEMvVWlJbE5ueHE4YUhUNTFkVk1TQXIyMHNX?=
 =?utf-8?B?RW1teFVPZHRTVTBBb0pyTmxhZHZmUWdaRnR1clFMWWY5TXhnM3hyUUFFWStt?=
 =?utf-8?B?YmZDYzNOV2J2OG9GdEZZTVd3OW5EWUh5Ynd6bldkTnZmMHZ5alNadi9BUUZo?=
 =?utf-8?B?VmxBWXk5WDB2STIvT21CT0ZENGpUbExZeVpIZm1jaHNBNGZ0QWtPY2M0QzVK?=
 =?utf-8?B?RnpPRHE5dXIzY3hRMDVjSllWRTNnOXlnbFM4MG05dEdCTWxtQTZRbUxsNGJ5?=
 =?utf-8?B?NzcvSEhhSVdxT3hUUGJuL1MrMUFRN01NbysyY3FjTVFEdmo3N0JqcUtTeitn?=
 =?utf-8?B?Z2NKVnFTNG15bmlOTWhQeE45b29QZ1VpSmh5VnMrV01MOExFMUUzUlpyQTRa?=
 =?utf-8?B?S0doeEdwY2VYWGo2d25CMzhwQ3lCRThqZU5kU1AwWFBiaUxzVVU3VmFFSUc4?=
 =?utf-8?B?bUsrbFBEL2k0YzV1N3ZxSGR4KytYWTlsOTlHVGp0UlgrSTdpTkhYcnI2OC9J?=
 =?utf-8?B?MEtkRHltZnhLbWtSdzR2RzhSWXg3eTRuTzVDcXRSTVJ4V0YxOGJWYkt5dGY3?=
 =?utf-8?B?dytOQkx2UjB4QXY3T3ZoMUpweUZSaDJDNUlrSTZ5OFRCeTQ4RW1CcUs3dEda?=
 =?utf-8?B?dklsbXBwYWJjTFVtNVRxZGdsNXRGYnpRRXduNEl3dHRzdHA4OWh3N1NkL0NK?=
 =?utf-8?B?WDk0bWFTV1V0YXpkb2swMW16a0Z1NCtZOFBsVk5tSnBZdC9MSXhIMWI2eWhm?=
 =?utf-8?B?Mmgyd2xsYzdoSHNuYnJKVW5lbExuaUZuWU5sZFBJV0NseGRrNTd2K01Sbnlt?=
 =?utf-8?B?Wmkra1ZGRXcrWjdZK0ovNldRTVZyeHVFSzVXUzlYZ1VpNlh5T2ZISnFCT0dp?=
 =?utf-8?B?SWc2SUt0NWRETnRST1EyWWUzcUx6U2dXWGxOR2JueVo0UTVXbTNmckNtcW8r?=
 =?utf-8?B?T2k0UTRoZVNVZThGWm5ZcWNhaXVkOHllUmJybjBqdkJuOWF5OWZwdUNRbjBS?=
 =?utf-8?B?UWNPL01sMUZ6N2NYakwzS1Y3dzFKUGtFTGlnb1FLRzd5ZmZrY2d1VHd4d3Uz?=
 =?utf-8?B?bm9Ud2NFL3A4NVFDTlIzR0taaXRpRnlLdFk0Z2t5WVRLdkZKdDR2ZmppTWVx?=
 =?utf-8?B?c21xUVBhSmtneGhoTnc3d0dIQisyQ083bG8zYWRxK0hDQytyV2FuSHY4dS9Q?=
 =?utf-8?B?ZFNsTnN2N3FvTlcrR0cwRDhTUUIvcUVBSGhHUENQYWVXN3h2Q0RvK1JBeVdi?=
 =?utf-8?B?aGxKUDNPSGp3SHBETU9iYkptcWJWcnhWbmFuTmQ2MmhvQ1NPNVp3OStOSEox?=
 =?utf-8?B?RnRoM2t2M21mbmUvWXFhVXorcWFQUVpZWGk3c05UTlVNVjV0SzdNNElNRDAy?=
 =?utf-8?B?TW9wSkgvOWtxb24rbEJlTnM0dEpNT0h4TVJFNDVhMmRXallMaU0rUT09?=
X-Exchange-RoutingPolicyChecked: SvYbPbrwoaBZXKCE5EmWeAgpO12qq53eOJXBrrfPZ4d5l7TWBdwPuP54hY5KLItUBHn39FnPQ1KRy01wN5SppTop/wq35RmHtsS3gnlt1isSjEhPPamaJ0pXlwXkarFPNPyY/0CG+frephXg9V/LwY1jjFt6CE3QFJgfqe1cOFP6aZTwUUKOFUM425xn3CCKzW7sZ8rJDdDQgk71/1knpau9ALdO01aiFOqSZz2S2WjIJHxo+jqhRcbxCPbI1OGCNuH02XMK2ZulWdBL/skH9TKPWpFKflCY8URjCvNjagYYlRCWBusEeA+fQSQjdVHNxXqT2p6GE5H9wZooxkE/ow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7005e8c2-8bc6-49c0-ad93-08df0f5dac1b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 17:05:10.7493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wn7NLYnV/w5/narr5tHJ7oLWyM23Ilx4qqRrlLYzb898RPAJOPUbLuAFnhL/ymLz/UD9HEScJsf80+o4KGUOZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4609
X-OriginatorOrg: intel.com


On 02-09-2026 23:38, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing bounds check for negative shift values leads to integer overflow on 32-bit systems.
> - [Medium] Missing REG_TEMP register definitions for XE_CRESCENTISLAND causes temperature attributes to be hidden and new decoding logic to be dead code.
> --
>
> commit 0e96a51c64ab3a240ac604df829dbc789366c5c7
> Author: Karthik Poosa <karthik.poosa@intel.com>
> Subject: drm/xe/hwmon: Decode CRI temperature registers as IEEE-754
>
> This commit adds support for decoding Crescent Island (CRI) hardware
> temperature registers, which encode package and VRAM temperatures as
> IEEE-754 floating-point values. It introduces an integer-based decoder
> to properly convert and expose these values through the hwmon subsystem.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 3a675d7b6758b..c2b8d4c79783a 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> +static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
>> +{
>> +	u32 exponent = (reg_val >> 23) & 0xff;
>> +	u32 mantissa = reg_val & 0x7fffff;
>> +	s64 value;
>> +	int shift;
> [ ... ]
>> +	value = (s64)(mantissa | BIT(23)) * MILLIDEGREE_PER_DEGREE;
>> +	shift = exponent - 150;
>> +	if (shift >= 0) {
>> +		if (shift >= BITS_PER_LONG || value > (LONG_MAX >> shift))
>> +			return -ERANGE;
>> +		value <<= shift;
>> +	} else if (shift > -64) {
>> +		value >>= -shift;
> [Severity: Medium]
> Does this negative shift path need bounds checking for 32-bit systems?
>
> Since long is 32 bits on those systems, the computed value before the
> shift might require up to 34 bits. If the exponent is 148 or 149
> (resulting in a shift of -2 or -1), the right-shifted value can still
> take 32 or 33 bits, exceeding LONG_MAX.
>
> This would cause the value to silently overflow when assigned to
> long *temperature, resulting in a wrapped negative temperature instead of
> returning an error.

Below check shall be added for this in next revision


+       /* Ensure the magnitude fits in long, which is 32-bit on some 
arches. */
+       if (value > LONG_MAX)
+               return -ERANGE;

>> +	} else {
>> +		value = 0;
>> +	}
>> +
>> +	if (reg_val & BIT(31))
>> +		value = -value;
>> +
>> +	*temperature = value;
>> +	return 0;
>> +}
> [ ... ]
>> @@ -1135,26 +1187,27 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   	switch (attr) {
>>   	case hwmon_temp_input:
>>   		switch (channel) {
> [ ... ]
>>   		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>   			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>> +			if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
>> +				return xe_hwmon_temperature_decode((u32)reg_val, val);
> [Severity: Medium]
> Will this new decoding logic for XE_CRESCENTISLAND ever be reached?
>
> When the hwmon subsystem initializes and calls xe_hwmon_temp_is_visible(),
> it checks is_temp_available(), which in turn calls
> xe_hwmon_get_reg(..., REG_TEMP, channel).
>
> Currently, xe_hwmon_get_reg() only defines REG_TEMP for BATTLEMAGE and DG2,
> meaning it falls through and returns an invalid XE_REG(0) for Crescent
> Island. Because the register is invalid, is_temp_available() will return
> false, making the sysfs temperature attributes invisible and leaving this
> decoding logic as dead code.
>
> Should xe_hwmon_get_reg() be updated to include Crescent Island?

This looks like false warning,
Similar comment see in patch 2 as well : https://patchwork.freedesktop.org/patch/750270/?series=172689&rev=2

Cresent Island check is already present, please check.

https://gitlab.freedesktop.org/drm/tip/-/blob/drm-tip/drivers/gpu/drm/xe/xe_hwmon.c?ref_type=heads#L269

xe_hwmon_reg hwmon_reg,
                        int channel)
{
      struct xe_device *xe = hwmon->xe;

      switch (hwmon_reg) {
      case REG_TEMP:
          if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_CRESCENTISLAND) {
              if (channel == CHANNEL_PKG)
                  return BMG_PACKAGE_TEMPERATURE;
              else if (channel == CHANNEL_VRAM)
                  return BMG_VRAM_TEMPERATURE;
              else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))

>
>> +			} else if (channel >= CHANNEL_VRAM_N) {
>> +				/*
>> +				 * This temperature format is 24 bit [31:8] signed integer and 8 bit
>> +				 * [7:0] fraction for platforms before CRI.
>> +				 */
> [ ... ]
>
