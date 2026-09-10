Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6735D41DDF8
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036977; cv=fail; b=JUQOcUoirBUPgWeU3UQD2I6YO3Ds98xWVB36fevJB8RsK8oZJzg5jE00FazJj72uXOr6OmnKgCFDAVcEZav9YbGyZc+7MnMcBjZNEiTurSRR9n9JgXU5PRGEtK6KrJcEVFRVTsC2gONlUOS7OrzSWdfB+wkhKwznPwTIXIHaQd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036977; c=relaxed/simple;
	bh=U0Gm592K8i/Y2gSktt4S64T1MW8wB25mfW/8eZW6pyQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S8qvzRAr6rbCXwMWocKWNblcjKx7lLAnV3A+a4nXEugJziwIzoes8PjkXXK/a62Y13PQ1XR36FFZBqT9JZqlOnP1dJh0Y/Z3DIsFXhVZ7syfw3XIXxe7Gy3GxU4UMnHtUUnGmWmGDlT7aCx1/fc5nDmiZwJJYOHIIGtG7uKhzf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/yvnf0x; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/yvnf0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789036975; x=1820572975;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U0Gm592K8i/Y2gSktt4S64T1MW8wB25mfW/8eZW6pyQ=;
  b=T/yvnf0xnWO+mnkrDQCbBPcopU29rQB1ULvO/LMvqh/Dhj0NTSWS57dn
   vAuDeC4Wfv9lAg9lXJpA9lKzo4L8ZiHls1A9PoJtou/Wpu0mQcVonXKKs
   5dOuAf/1PorcuJg2NhJPix3vrFm+neavH4TwAionsBzSZLc0AAVTgk8I5
   CCOo1P241ai0F99N5VYzQYJ+EGmQ9Emff+SuiDPLLXxBm39XwHVtgX0MM
   TnHaIRRILdoh/nJqbh45+seDNOn5RET31vAq+AVHFmK/jcTbndgMC7O1W
   jlz0Mt5pe4dp+LNjPHiCfdHKPHcJyN9Zn59cCTvqUjfKymdlRJgtW7cdF
   g==;
X-CSE-ConnectionGUID: L6zAlPsHQvOk5TrJGxhGBA==
X-CSE-MsgGUID: 0RC72kktQpysr2unaLOHTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88427116"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="88427116"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 03:42:54 -0700
X-CSE-ConnectionGUID: rf5LME7fS76Xni1tq39QUw==
X-CSE-MsgGUID: F+En3C08TsKT4Di+Aa+/kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="273550903"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 03:42:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 03:42:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 03:42:52 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 03:42:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzDpYTwFGhAVd0EMljMqY5RBO/JD3KXuSLV51yvAQyp+1P5hDPXdzIujj1ekkNtzClwFto/Bsk1P5WbQVGFrqWWmWHFSaaeOTX8fLIBPOFgym5hQNaZMQgbqBPN1xZwJ7vqh5KHpfkd/bcAlAk3/0/RsMUf2ukYqcDhC6CK379s+gtnh3bTAO59iSeNoOxR20IVP/pEe+rR6yU6hEGKnqXIJv2kpSU8eIRS0/wPL4P1GwBwJkpwLUSGkfGUCkc8kFrqLO8Be4X9u6N838d0OhxA2uDnlTS5YJl6Ma54tjvNbVeLIgfrA+sRVGyhyYWNrHsvVkS5RxCtR1CHqoTCLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtSOilxQe8DHNG1Yd2gaagnvxz7pJ6FezgR0JOvF36U=;
 b=P6h4rnB6y+hGXJsJ8ycouKFB9ZrfVmjbDWe9GkzArNHOUp8Ic4kQhDZ1QIPUHYtPS5sCOZKpbkuzhgeE/SfYqjkpurgTXEYPQVD0WZtse/BbbuRrAS584/w8V6PKb9aOC24NGqufg3wS9n+/We00KG1Hg3sxGPskXwoaV4PulCjlj+Cb3txHti/S2Jwnce3AFISQq1Zu0MZlVJ7mzK2OYWJPSjKPgXCTgMrTVmM4uhUT9zdtj5+pYbJsIwf24HvT9m097FhQsF/dfKTJgFJeQwqvJCrEiDSz0zM3xhggIFdcfelHzh1Q+jPXOjMYj9PvAbsbb9DF6MseFVaftmzaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CH3PR11MB7913.namprd11.prod.outlook.com (2603:10b6:610:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 10:42:50 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 10:42:50 +0000
Message-ID: <f47aebed-fb70-40f0-9d15-a3cd2a1afa28@intel.com>
Date: Thu, 10 Sep 2026 16:12:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/xe/hwmon: Use VRAM temperature sensor count
 from thermal config on CRI
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
 <20260902175507.3910573-3-karthik.poosa@intel.com>
 <20260902181022.28C201F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260902181022.28C201F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0311.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CH3PR11MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 2576c57a-52b9-45c7-c22f-08df0f2842c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|56012099006|11063799006|5023799004|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: y8pbaep6fwzuewfpXBkDLULpmypNPU4TC75puQ5JFANq9mDll4noUerijSiavY10244MQRvhMr5m38jUfgHT7Uz72ZXYt7CfPswytT9V9h0HrQ8Wpe1lT/7fSh5dVw4RLQlonAaZDKu75IP7q384fw3K+1Zaca03SVYVlwB2SVOn4/HAnBXQPB2m9dzFZjeKW0m+AOWXQSiLceQw/xR+5vvocM6ZmhkGizyPrjr+xrzxcGkPplENehar21A2XSDkNTr35G4ACpMu9Pl1JVLjBSLtIx8uixygSTCDPrmO0stTJNxrfQTYfAcd2Dj4Hb09uDpQEHRkzNp3tQEZzKkEV2e4S/TAtaBc47ZHj46Ctvaz3O0RM25OOg3NTsmsF0ghFDY/uUnfCerR2AuT78JbFBoFtbQcwYjZdV6liWaSV1I3ylMDII1bA/P5nw4dLEiiYRWcqAk835yLMuwDGwOYYIAaK+xk9VFXpRvdFRjspYI89aax528bT34iEg1mG4timGimsy5+l9Lq6duJq38mx9x/y5VZcEEKOusEqyDHK3BFtGH4d3C5LisY+4LhRC4E7+igzLakRvjVVLlmGPVFJz1m2kQaIomv2X3l14nPpFE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(56012099006)(11063799006)(5023799004)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVptdkVPMzZKbUFlenIxNitFeWM0YklpU05wRUdZVFk1b2QzdkdZalRuZWd5?=
 =?utf-8?B?OEJYN0M5L3YvUG5XcWhjRFluelpRRVBYTFpwbjVtaGE2M0dQck1iM0ZqRDZu?=
 =?utf-8?B?V2JqY1lSOUdwcHBLSEwvUGpUOVBsVGFkQXZjWll4MS9JNFpvRm1vVUk1NitE?=
 =?utf-8?B?MWlvelVyUE4ybXpuTURpb3hNZWZqKzd2aWlyOWJxbVlPcVhwWGxTam1nU1h6?=
 =?utf-8?B?SlBJT25DaUFnbW5reWtNWjZvOHRKUS81MG4xeUh5bXBhejVCZG9Vd2IwMnJL?=
 =?utf-8?B?UThWVzViYThGakFvbm0yaHpza0ZwYWJJckNTcGJzUXpZTXpxRlRXS25rN05I?=
 =?utf-8?B?WFJTSTNlQ3ZzZUpEcDQrL2QxLys2TG4vMGZ6TjI1UWEvVFVFZmtiWmluaWQ1?=
 =?utf-8?B?TGg1bHlPTlBTNm1aeUdEUWM4SHErQzVmQlMxeEZHM0xDRUswUktHcHpBMTlJ?=
 =?utf-8?B?Vis5WEw5ZVhKS2lxM09FUHVNMmVHTnJzcjM5eWNSTEJoSUpKUlp5eFVjc2VF?=
 =?utf-8?B?MmlOc2xnMHZRRzIyTnZGVjZDZG13cyt3bXlPOHZQVlBUOGtQM3Y5ckpZSWJY?=
 =?utf-8?B?VzZHbmQ4dmdrS3FFVThGZEtoRGR0bTBaM1ZmNHFiTkUxYkdLK1hLdmc1MmMr?=
 =?utf-8?B?dHhqam1aWmR3ZWxGTlA5Q2YyZ01SQUhGb3d1L1NuNWpraWVvQUQxNDJZTWcz?=
 =?utf-8?B?RHBhZ3FrODA0VUM3VWZHcnFJbnhuUEx2UXZWdzg2bG1TU21vRWJDc3hrVms3?=
 =?utf-8?B?c24xM2ZrRVpXQnluc3Nib0NybExhOGRXUTk1RnR2RzNnRUZuMFVOdkRBQ2RD?=
 =?utf-8?B?NktEQ3czU1F4SldTbGNqT2dyb3YrakE1WGQ3SzRBUE1jMTBvMVlrb1dnNXhm?=
 =?utf-8?B?clJ3WEpRRnF0MjF3MkpqeFlsRDRhdG5hN2ZvZDJ6S2RrZXdYaUducjRzRTVr?=
 =?utf-8?B?ZXg0ZnAxWkRWSkgyRExoRnJMeXNpUEo0b2g4TU1veCsxd1puVlM5U25JZE95?=
 =?utf-8?B?NWhIQ0dTdFFJbTFvZFozWlM0djBMNjN5enF3MDlEWW1JSVNScmV6bHBTb24z?=
 =?utf-8?B?c3ZFeHpKeG9WeFdJZ0Nwd0NqTzQ0eHQvcEc2N3U0eEozYlBLMDRLZkg0YnlF?=
 =?utf-8?B?eGRWRk9hYWxVWlp5UjhuZ2lGV2xqc0NEU2hDT2FySXlWRFpVUnhRazY3Vzh3?=
 =?utf-8?B?TjlyV256cEVhbXl5VWlYREZMb3Jja3Z4SjFONFlNZkNmd1AyM2Z0cXFoWE1i?=
 =?utf-8?B?UGtuSnNKcXlPM0tWZGtOcS96dUlUaGFDUkRKWjgrVHFHUzBTTFNVOWxZS3l2?=
 =?utf-8?B?WnFVK091M1dKL2d0ejlMLy9OeElEdi9BbG45RnR2Q2o0OWNQcWxWWXZPWE9O?=
 =?utf-8?B?YjE1d0hvajl0QjI2UmJ6QVlobEJKM2NNa2llVzJXZHRjR3BPY0JxTVRGemNS?=
 =?utf-8?B?amZlU0pscnNIUDF2WmsyUEFTTmhTc2QrRGN1cm5JbEJFdFJZUkgwQ0Z3WnRu?=
 =?utf-8?B?aUZoVXNwczNxWWYvUHdvYkYxMUlrWG93eXBFaHVIbWd2VWRZdTNTTlNyRXJn?=
 =?utf-8?B?UU1SdDVuNFF0aEFwNklCM0RGOTJJWFNWWGJtclZ2UEltSm5RRTlyQTBaSm9E?=
 =?utf-8?B?YWJWTWRrRStHRXgyZEQxMHhjQUdJb0VkRlZ5c0tDTmM0MUZBZUtDdDBJVDVw?=
 =?utf-8?B?dEdzRTVXV20yZWVoQ1hMZ05ZbzVaS2hGNHZLc211M09oRndtZnZXUGJOK1Bw?=
 =?utf-8?B?ZkpQSi9xOU5FdW1DOHVCa0M3RnB1TkJtbzQwTGxKajJmNXc0QThpWVNPaytU?=
 =?utf-8?B?a0xhRVNiZmRHZEhENjkvcytxanQybGR4R2FRZDk5ODY1cTR2OHdqSFl6dVFv?=
 =?utf-8?B?QkhhbjI5V1BCUzdzQzZvT295Y3EzaVNsVWZqMFkremNoYUloSWlGcmY0cTVU?=
 =?utf-8?B?V3RqRXhFczBmQ2xoK1haTFBqdmpUN1c3eVNvT1N6QW1wNW44MG5LK1FyZDND?=
 =?utf-8?B?ZUdRMHlJMjZzZUljTG4xVTF0dDh3Nnc4bDB3cC9XMmVRUFdzeHJzZDhLVDJi?=
 =?utf-8?B?TXA1WDB6Q2MwZ3lhL1B5SE45dXNnN1h0VDdxNVVya1paVFZaMEF5QlJYSG92?=
 =?utf-8?B?aWYvWW1XeGlwSmptL3JOY2dCUFNVaURLN0J0b2R5WDZjSWhLTnJLUjNQOEx4?=
 =?utf-8?B?dzc1b1R0Q0FvWG13VTV0eGRFWHhuVlNOVU00ZEhLVkpmd0VtbVBtaU51U2lV?=
 =?utf-8?B?cUNZL2gwMUtDdlJZLzNCS0d0VnlDeGF1SXE1VWdXcVc0NFA2TzgwYSs5bnhO?=
 =?utf-8?B?aHQ3WExkM2RZRnV5a0lWWEtrbFcyUWFQSzZvZnZiSnJsd09NTGU1UT09?=
X-Exchange-RoutingPolicyChecked: HKHVv9bC5hhyg5Q66aBPtImIKQKHG5qygNCJOR/PFIr7noGsVEzU2yeJs5IMnKZsCcy05gOxToMHlLFGEfVHfUa2tDQOb4XaGv3QVyPRTzPiyXYNXrtPZL62nYsrNkUo2Ej3QtgrT0WuKodYZ3gYuKhzMxEVauFFmHxHMbbgaEiHGOUyWFzds5CGAnb37ehPXCy/vVPLw/q+1cDXIQ37nWW4AVpkuVXjUsVgutYevs8PRmadnZwaK7ZHuaTlMYtHSvnBd2iIe2FHRq0/woePk1aKA7xXdrVQ3XCKbtyY+qliPxxC/yfrzB9GXtWgRdyDsjRFkRPIlBSeF9BRJmjXBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2576c57a-52b9-45c7-c22f-08df0f2842c1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:42:50.6725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqm+3FLWyEctBo9j0nyTV6oqG/UkVLYbPyqOw/8MKlI370u/RrdNpzfGbpKheVgulaeP3NdZFNRDOVVgr9zjcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7913
X-OriginatorOrg: intel.com


On 02-09-2026 23:40, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] VRAM temperature sensors will not be exposed on Crescent Island (CRI) platforms because `xe_hwmon_get_reg()` lacks `REG_TEMP` support for `XE_CRESCENTISLAND`.
> - [Medium] On Battlemage (BMG) platforms, all VRAM temperature sensors will be silently hidden if the thermal PCODE mailbox initialization fails.
> --
>
> commit 426a936975a4587d5003554dc21e461abf340940
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Use VRAM temperature sensor count from thermal config on CRI
>      
> Read the number of VRAM temperature sensor channels from the second byte
> of READ_THERMAL_CONFIG on CRI platforms. Use the reported count to avoid
> exposing hwmon attributes for unavailable VRAM temperature sensors, while
> retaining the maximum supported channel count on non-CRI platforms.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 768f6d68b2916..51a6664eec485 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> @@ -271,7 +275,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>   				return BMG_PACKAGE_TEMPERATURE;
>>   			else if (channel == CHANNEL_VRAM)
>>   				return BMG_VRAM_TEMPERATURE;
>> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>>   				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>>   		} else if (xe->info.platform == XE_DG2) {
>>   			if (channel == CHANNEL_PKG)
> [Severity: Medium]
> Will VRAM temperature sensors be exposed on XE_CRESCENTISLAND platforms?
>
> When checking sysfs attribute visibility, is_temp_available() queries
> xe_hwmon_get_reg() for REG_TEMP. Since xe_hwmon_get_reg() only has branches
> for XE_BATTLEMAGE and XE_DG2, it returns an invalid register (XE_REG(0)) for
> XE_CRESCENTISLAND platforms.
>
> This causes is_temp_available() to unconditionally return false. Does this
> code need a branch for XE_CRESCENTISLAND to return the correct VRAM
> temperature registers?

which repo are you checking Sashiko, I see XE_CRESCENTISLAND check is there.

I have also mentioned the same this in comment of previous patch also

See:

https://gitlab.freedesktop.org/drm/tip/-/blob/drm-tip/drivers/gpu/drm/xe/xe_hwmon.c?ref_type=heads#L269

static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum 
xe_hwmon_reg hwmon_reg,
                       int channel)
{
     struct xe_device *xe = hwmon->xe;

     switch (hwmon_reg) {
     case REG_TEMP:
         if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == 
XE_CRESCENTISLAND) {
             if (channel == CHANNEL_PKG)
                 return BMG_PACKAGE_TEMPERATURE;
             else if (channel == CHANNEL_VRAM)
                 return BMG_VRAM_TEMPERATURE;
             else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>
> [ ... ]
>> @@ -786,6 +854,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
>>   	hwmon->temp.count = REG_FIELD_GET(TEMP_MASK, config);
>>   
>> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
>> +		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
>> +		if (hwmon->temp.vram_count > XE_MAX_VRAM_CHANNELS) {
>> +			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clamping\n",
>> +				 hwmon->temp.vram_count, XE_MAX_VRAM_CHANNELS);
>> +			hwmon->temp.vram_count = XE_MAX_VRAM_CHANNELS;
>> +		}
>> +	} else {
>> +		hwmon->temp.vram_count = BMG_MAX_VRAM_CHANNELS;
>> +	}
>> +
>>   	return ret;
>>   }
> [Severity: Medium]
> Will this silently hide all VRAM temperature sensors on Battlemage (BMG)
> platforms if the thermal PCODE mailbox initialization fails?
>
> If xe_hwmon_pcode_read_thermal_info() encounters a failure (such as an error
> reading READ_THERMAL_LIMITS or READ_THERMAL_CONFIG earlier in the function),
> it returns early. This skips the fallback assignment of hwmon->temp.vram_count
> at the end of the function.
>
> Because hwmon->temp.vram_count is 0-initialized, the in_range() check will
> subsequently evaluate to false in xe_hwmon_get_reg(), returning an invalid
> register and hiding the sensors. Previously, this path fell back to a
> hardcoded MAX_VRAM_CHANNELS value, preserving visibility.
Yes we can assign the BMG default up front, before the PCODE reads, so 
an early return still preserves sensor visibility.
