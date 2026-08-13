Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD6F37E5C4
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 21:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786656516; cv=fail; b=BMYMPDhY015kQPBlHWcAaMuRX8wYV2F9YosrKWP+FqW0y1HwdxwUeFsAg6a1CCsCqWtShpL+cs4Yb6GVHrdqGLwNtMIYsC3180fcBwEWACtMkXJBf6wCVwNDeGoiJi3tpNPXGKyZinjaBOxqUCw/u8KFBMokWLhLU/SWllYnRmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786656516; c=relaxed/simple;
	bh=WiJG7dK5qIvSvIWh97YJn51ZB2e74lLCzBIsFEuyfyE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rir6OGssUoR2+R2xnm7Ybm6esOi5ozOc3i6zByiOG+isTwPlGPqodfMy8ybUkbcmw3MLa0gkZzIFC9qtRA3Bf+C2MiqR7cdc85iDz2gEO6nvZ3i8BpPnfyuDSF7Eq1KYzmlqjeUS6nwtBbc8gxfD3px9W5Zwxrv1TSFw88deYNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkyydxiG; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkyydxiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786656515; x=1818192515;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WiJG7dK5qIvSvIWh97YJn51ZB2e74lLCzBIsFEuyfyE=;
  b=lkyydxiGeKfF8B4VDgo5jpoJjdiADZbPmOZLZsEyAizwqHdNEv+pvbfM
   wmjwDUd8MaSTz7cQGKMuMnxYuyAmJ7MOG0d1JKmLiWFIAIyT8vir81JnG
   76849AmUliNMJtXlDbXw1W6hIXDVthikom5WOT/WTdBftEN/NdotMAD8I
   a0A9Rt3ZTuhIaKE51fp4gfY/SmDHZmrVOUCGwdORdEbFr86FZhCP+xGn9
   aZmv9SYyZRW9oI3XFTMCOPUmOmsnt0JhY/hFe1KR6sJr3lnk9zqCZx5SI
   IL1RXvCSjBVK5nRDYEjwKaOaRqx35C/FFodMMQ+gmGhjbw3gEV1XO/2r9
   w==;
X-CSE-ConnectionGUID: FQdqHg3JSDiW4KFqWttBwg==
X-CSE-MsgGUID: vw3OGP2FTKC1DdDyrsLMVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97906941"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="97906941"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 14:28:32 -0700
X-CSE-ConnectionGUID: hasGADtSTH+2ey3cOxFSpA==
X-CSE-MsgGUID: 5MoL3TYvSruE6o0xqwR7Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="266045475"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 14:28:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 14:28:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 14:28:30 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 14:28:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWm2HYRnqQUCY9Bo/F5+5HQFyTyebz2nwZQrrkyljD3yO2HUY3NB+26K9EQqyd65v4yaPyvYUS6hOKDSUgLCIElfZKYCM6H92pygjhWXYO9SdDDCDafrGYtInYq9W9TQlAAIL3Hfrdh9F3Z7qbt+pvefTdp7ybHzAnQVE6IYXIOzRiZ1jM4KW+E99wtQZRp/uhVjXmN8hMyI3jsaUHYUyAPQbXJH0sm1Oj7Cxok+IUmR4QYblHSBXKkx/9XMugJ2V8/jcQ0XldWW13kYP4XfOT+nhqwXhrNVnU5W0jFC0Ofa5S8IpO4bmE8OqGnN/2LWl/7NBkooRf8kOeKFqny6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJsKW0fW64izSOi4KjvrlunQFg5Fuf3Z+mtHSIc7rnk=;
 b=qz9vpZxJpOn9Sgl2/GMBBQl8F0LcPHQ03cYjPyrEEDpBOJMhIkBAsUtUt8BY+QbpeWNiSO9HUvoR61gVzMXICzAUzhlyLRgVKtFlfCN4VA8xdHUW91JlpYZrUWgVUb3IKRB4WS1YkoiIRX6uQydcifgdu6NgefXa3SV2U05tkGNRrVlBWYfduu3nkQVnXgOt88QRjENlvMca+D/6cjMz2BgHpgDL27hWZ7PvguO+4zzFt0IGKRIyMYJXWpAAgZgOCXmznUMODytTxmjGzHFkwY4lN2TBJt+NLLGC2hRxQ6+EOHxAqb6kUKPyRxtpOxltRfu/NJ8jQeHp3TislvYVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by LV1PR11MB8789.namprd11.prod.outlook.com
 (2603:10b6:408:2b4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 21:28:28 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f%8]) with mapi id 15.21.0270.017; Thu, 13 Aug 2026
 21:28:28 +0000
Message-ID: <72c98be1-1bd6-476b-9549-8e81f503a43d@intel.com>
Date: Thu, 13 Aug 2026 14:28:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state
 machine
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-3-zongyao.bai@intel.com>
 <20260813002313.3FED01F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <20260813002313.3FED01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::9) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|LV1PR11MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: 178732a2-0ae1-42e2-2002-08def981d0dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Qvs9qFo5nTpErVWMx+h9pVqsbJAFZlG7E/0lj2heFccFJIAWOp0OKpPGW7WSUVxY1yN5lVqo9J3blPJow1I7q8UwZegLdMOqKL4bcQ+KDzrePAfpoB8VajKnbNr3tVg1GA292un7moXyHHxtboY9apYvs3YJ3NGS734PlNTXkzXdyHQ7Ktgx7dqJCDebIiO1jZxsceY2625fe/kkRRy+JMDVjcZN3t4o+HYVIypWbX4WP7uccLQPT64RdtB27urzwNh8+cJUZ7j9rNLWHct8UB6Noi4GTzsHwviHD4s8MxDih05SwAZCylP3ftTB/E+cYxTURDolkmX0D/G8Geij6CDGkEgMcu+vPjCMT6e/HBIiNIWEk0wOtA9TzyLxmMMn+u37UEeBK1IDSKpO+LgC8umCVqs6CgIIRpL9ibkZeS+FteymII0VCuPXHRsWy6Ii6fY+TJ0H6ysNXOdNX/5CoaUVRtrWzcBpJu2jBG1/ICjCWmYusbwqz5sVjvC5c5yF/6Ly71Rg5fhhZiybAZPgzreJx+dBBeflx+3BEE7w0hCyoHrNKuod9wDeWZeJ3hV3FTlDYjEMk7bP3+hUkHJneRB9hZe5CeAr6r7ZtqYDXPlLMTyRdJMNR07ixwJ55DSsj0FurXT2GR8oc8tYZ9cagnHIXWhFV5ct67LYbYIluKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF46B98A11D.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXNGTTdveTA1VGhKSHhhZXdSSnNZa05sdmRDNitFSmYyNFNSVk9UNFYzeVAz?=
 =?utf-8?B?VFRmT29zNDFuRk90TXRXeThjbEk0TXBjb3hsYS92N3ZYcTJ3Q1pMc3phL1Vh?=
 =?utf-8?B?QkNOYkN6NVZwWWo3ZWJpcERKcWdXa3o3RUVObnFGUUtmekxrTWViNVE0Tzhz?=
 =?utf-8?B?dzY3Smt6cDhGKzRWSWtPSyt0TmxvVWtLb0d2MEJaUk12MDVIcklEbGVqT1o3?=
 =?utf-8?B?dVVnRGx2SGZkWGtGU1RQSThjMnNTU1c0R2QxaWM5YjF0YkdSSklmSmtWZll4?=
 =?utf-8?B?cmtFbThJWVAxV3N3bGVnMzRGV3lVWHNxdnRiZEVVcWovTEZkbzZ0elNaL29P?=
 =?utf-8?B?eTd3QUhzbGtodk9pa2FUUkVKYzNNVFFLd21yazV3RTlNWFZoeVhIMFREZkl2?=
 =?utf-8?B?b3I3TDlZbjBiRXhTaU5iS1VvNmRmVlkyYjB3M2NYWGx6MmJPNDNIU1k4Y0tT?=
 =?utf-8?B?d1VTajFBaXdLQmxIaDExZGY0Q0N3KzhuMHZ5S093M1VTUWxTR2ROcWw1QTNt?=
 =?utf-8?B?dWJvU09zRmdRcjJLZ3NQQ1BqdndCeVp6NktpQ0M5SjNZMU9lNGFsVWdpZzVY?=
 =?utf-8?B?c09teGpTcnBuV2U0NGtkN2NBUm1kWE43OWpUWldNMHdXVUJFY1RKTHZUNldx?=
 =?utf-8?B?VE10cXVrMUk0bjdjancxeTdHTktRZzhLeHZwbXIwdTR3TFBWa2pGVzBSNkZv?=
 =?utf-8?B?YTFDa1ArM0JQbjZsTkdnNU9JSzhvQzJrOXhzbGtZZmIwSWtMcjBhSU9ZaVhP?=
 =?utf-8?B?TjBXN3cyYjl5cEp3bmlWS2E1UC95emNhL2xEMmlyRVV5QUMzL2YrM1VlemQ2?=
 =?utf-8?B?YUlQQnlQbDVjV2xrRDg5aU1nN3IzQ0h4M2dndGMyVlhyY1RIdVVpb0NHRmJo?=
 =?utf-8?B?enA4c1NZeWpyekhEWGpUNGdaQS9JWDBTcXBPcWpjSFdDb2J5eWw0aVRyVWRz?=
 =?utf-8?B?c3RHeFlua2hEa0ZoN3B6WURwZTkzQU9adDBxQlhlSHBjc2ZvNUVMZEk1RjFy?=
 =?utf-8?B?bDRzKzVLcnUwQU0zaUhQWVhuNVBIZGRGZHV3YXRDNkFFNmowREs2R1dpU2dm?=
 =?utf-8?B?TzY1NW5CenBTM0xRWmk3T25la3NOWmp3K1FyeUQ5em4wWXBLZXdCYkRzTi9E?=
 =?utf-8?B?NERKNHRBTDNjRnpMVVJoUEZQeGJkMzhwdFFheCtjT21na3AyRDZPVERqWVF0?=
 =?utf-8?B?UENKckMweVZmTW15RzE3LzlXd1NWWXdVRjdVK1BlQ1RBbDBJUnUxN2FhOXNo?=
 =?utf-8?B?UWd2NWlkWjVNd1dmMXE4WnFoeHBvK2ZudFJvaU5HOXNLVTNUMTBVTDVoWktM?=
 =?utf-8?B?MU5uNjZuQk9BSWJDTFRTWmZCZnY1ZDJJbUZCRkh2czZyYzZVZmtWSDZxMFBv?=
 =?utf-8?B?WjlyV1dpTlIzVitLNy9DTVJ3Y25Ncitra1ljWmx3aHdBUmxIN0ZPcXRzbi9M?=
 =?utf-8?B?OWVhWWlGWEhZem9vRHdZaTNncS9xRDV1RVJaQVBMRjRWQnl3V3pxWU5UOXMy?=
 =?utf-8?B?MEVRVG4wSlJRMEp2N01jNkFMc2FxRWU2cDMwdGdJQkpDN3pYd1ArUkRpbEM4?=
 =?utf-8?B?UHFmaytWVC9rNzFSRDBSZ1lZTklTODl0N1JzZmVqWFV0L3VYV2t3UGVidW9R?=
 =?utf-8?B?aU5IRWdCaUtlbmxVZy9YWjZoWVMwNDVzd1c5ZG53aXhzVFpQZWZwcXByclor?=
 =?utf-8?B?dXhXcUZ4dWN4N2NobXlCbjQvR0x0dXdiTjlLak54Vnc1c1FySVp6MFJTaDZx?=
 =?utf-8?B?Y2NEOUtsQUE0UU02OTdWT0hUWDVCOFVNSHZHbm9ieG9nOXZuV3lQdSs5NGdY?=
 =?utf-8?B?ZXY2U3RSWXl2R05qVEZvM01lMDF0WDN1SXhlVkJWMklCUWtGS3hvSkZTNW1J?=
 =?utf-8?B?YzJvUThtSGkyRE0yY1QwZndJUFFraksrVjAyeG4wV3ZBeGduZWFoZHJPekdE?=
 =?utf-8?B?eDg5dmlNZU1UTm5NN3BwYmhYQ3dqY3JpYUI3cWcyaHJnYklheGd2YmgydlJk?=
 =?utf-8?B?RVRMY2NTV0tuMWhrbWlPQzFBTU1Kbk5wcHRlWG9rWmVyeHJWZWtEbUphZHhP?=
 =?utf-8?B?dHdwL3VRQUs5Q0R3RFMvQ1dpdEVxUGRSN2tnY1RnWVRFL0RtK0FVQlZ5dWJa?=
 =?utf-8?B?dnRTMVpvczc4SHlpbnp4Yy9mWVI1V0V6N0R6NUlvT3F4Q3ZaeXNqaE4rSS84?=
 =?utf-8?B?ekVlNkpDK01FN1EvbFVVcGVXTGtIeU04ekx0ZWxiaWV1Z2NiVWptR1pvSEFR?=
 =?utf-8?B?RUd4Nzdlc1QvZHBMRVl6d3dLVFN6LzdYVTV3RFU4QUNPdlBtSE9hNy9jc1Nk?=
 =?utf-8?B?Mi90dmpxZW5OZXJCZUUwQlhhUEJRYmpBV0ZDVDZGQUJ2ZzJxbVcvQT09?=
X-Exchange-RoutingPolicyChecked: gySwpJdsM0JAAOQRRR95iMu4YT1S5GH9DoxEY5kWFwNyhYqe+ungup0MTGSEWzqguqCuxFaSRrY2nFokF60j7BqMrguEJJDQRNI9FauV2+RAuf+Qil9ue7CvW87+gWp9emEajMc/iF3oczhmdrM9tTNF36XpqSfE0cE88ZGVgF55/d2dxXmOFv00pIisf+dtFgFFnzOuyQ3hA5oXKVBEY61XnZ/NbB+gWjuWUgLG9T5S1XAUh/gh71v7X25Foxk3m2cjaWulUQtxIM80iDnN014mrfiwvBrmiKBT+INJnZhVwtRvnolPiHDDL+ueRrUhpvZ7O2vpTBXM0QOP/4OPmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 178732a2-0ae1-42e2-2002-08def981d0dc
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 21:28:28.5214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKokha30c8NcxJ8IzMbuqgokgHoRpfU5ebPsWgCwpSdr7rLez1L0b6+on7qnHyDGJkmq3bSyjE6rvkiwU4a2CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8789
X-OriginatorOrg: intel.com


On 8/12/2026 5:23 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Use-After-Free in delayed-release forcewake due to devm/drmm teardown asymmetry and timer re-arming
> --
>
> --- Patch [2]: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state machine ---
> commit 7a90eb7b65ee38383fb6f1973ddea842f2c9c391
> Author: Zongyao Bai <zongyao.bai@intel.com>
>
> drm/xe/forcewake: add delayed-release state machine
>
> Add an opt-in forcewake release path that keeps an idle domain awake
> for a short hold interval. A subsequent get can reuse the domain
> without issuing another wake request or waiting for its ACK.
>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 197e2197bd0a3..3f5013c7424c8 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> [ ... ]
>
>> +static void xe_force_wake_fini(void *arg)
>> +{
>> +	struct xe_force_wake *fw = arg;
>> +	struct xe_force_wake_domain *domain;
>> +	unsigned int tmp;
>> +
>> +	for_each_fw_domain(domain, fw, tmp)
>> +		hrtimer_cancel(&domain->sleep_timer);
>> +}
>> +
>> -void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>> +int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>>   {
> [ ... ]
>
>>   	}
>> +
>> +	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_fini, fw);
>>   }
> [Severity: High]
> Does registering this teardown via devm create a use-after-free window?
>
> Since devm teardown (PCI unbind) happens before drmm teardown, background
> tasks like gt->ordered_wq (which are destroyed during drmm teardown) can
> still be running after xe_force_wake_fini() has executed.
>
> Also, if a timer was pending here, canceling it without putting the domain
> to sleep could leave the hardware permanently awake. Is there a need to
> clear the state or issue domain_sleep() during teardown?

The devm/drmm lifetime asymmetry is real, but this fini is not exposed 
to it in practice.
The only delayed-release caller is query_engine_cycles(),
an ioctl that holds a runtime-PM reference and runs inside a 
drm_dev_enter() section.
On remove/unbind the driver calls drm_dev_unplug() and then flushes 
forcewake on
all GTs before devres_release_all() runs xe_force_wake_fini(),
so no timer is pending by the time this runs. gt->ordered_wq only runs 
the GT reset worker,
which never uses delayed release.

The bare hrtimer_cancel() without domain_sleep() is intentional:
the power-boundary/unplug flush has already settled the domains,
and teardown is followed by device power-off/FLR, so leaving a domain 
awake is harmless here.

Zongyao

> [ ... ]
>
>> @@ -242,12 +330,24 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>>   
>>   	spin_lock_irqsave(&fw->lock, flags);
>>   	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
>> +		assert_domain_state(fw, domain);
>>   		xe_gt_assert(gt, domain->ref);
>>   
>>   		if (!--domain->ref) {
>> -			sleep |= BIT(domain->id);
>> -			domain_sleep(gt, domain);
>> +			if (delayed_release || domain->delayed_release_requested) {
>> +				domain->delayed_release_requested = false;
>> +				fw->delayed_release_domains |= BIT(domain->id);
>> +				hrtimer_start(&domain->sleep_timer,
>> +					      us_to_ktime(xe->forcewake_hold_delay_us),
>> +					      HRTIMER_MODE_REL);
> [Severity: High]
> If a background task drops the last reference here after xe_force_wake_fini()
> has already run, could this unconditionally re-arm the timer?
>
> If the timer is re-armed during this devm/drmm teardown window, the timer
> callback might fire after the struct xe_gt memory has been completely freed
> by drmm, resulting in a use-after-free.
>
> Would it be safer to use drmm_add_action_or_reset() for teardown, or add a
> mechanism to ensure we don't start timers when the device is being destroyed?
This cannot re-arm the timer during teardown.
The delayed branch is only taken when either the caller used 
xe_force_wake_put_delay()
or a delayed release was previously recorded, and the sole producer of 
both is query_engine_cycles().
That ioctl is drained by drm_dev_unplug() before the all-GT forcewake 
flush, which runs before devres_release_all()/xe_force_wake_fini().
No background task (including gt->ordered_wq) drops a forcewake 
reference through the delayed path.

So there is no path where a delayed timer is re-armed after fini and 
fires against freed gt memory in this series.
I agree that switching the fini to drmm_add_action_or_reset() would 
additionally harden this against any future caller that releases 
forcewake outside the unplug/flush fence;
I'll keep that as a follow-up rather than fold it into this patch

Zongyao

>> +			} else {
>> +				sleep |= BIT(domain->id);
>> +				domain_sleep(gt, domain);
>> +			}
>> +		} else if (delayed_release) {
>> +			domain->delayed_release_requested = true;
>>   		}
>> +		assert_domain_state(fw, domain);
>>   	}
