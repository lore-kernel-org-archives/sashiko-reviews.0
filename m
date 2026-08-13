Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66777383C96
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 20:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654150; cv=fail; b=RwkqOXJH5d8FZ0bcdGY5J2rv7T2GeuWorVecCeIJuJEYhZmrs8v/4t9/wKCi6tRFXxvTo/vPmxWUydfYrC+60GOLfbSPs51H6yTh9UBBi8wbzwnkCfOFHqWBfvpiXKTe8TdOaLJJXGKleA9C6bn0Jo/eFFwm5E8A+mxQt6hFfUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654150; c=relaxed/simple;
	bh=/32zEuashxNjRlL2/rBU/OuanTuA1Vadw0NUJXOs3P4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UOnrgPt7HGk633Kvk/+HV2QwQP4YvtIhpmf7XNXivQUerTuZlhFg6D5LP6Ci4I00cWjkWqKOY+d4B0BthosTLtQISm0+FWpYvcYIx+jMJOH4fyhRo6aLaAebBiwDVT5P/1IaZEM4Yv//kSNbBMOd/BX6NY73akufrBQCv4ZvJ8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5J5uda3; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5J5uda3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786654150; x=1818190150;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/32zEuashxNjRlL2/rBU/OuanTuA1Vadw0NUJXOs3P4=;
  b=n5J5uda3Of2yoAVD8I19N6x4jmb+ctuSEXKxmR1btzNv4V1P9Pyow8Eo
   +imo9j9nnn9OA7R2YntlXu4Yqlw4nfymbqwmJoYQqX75HjbCu3RKgOKhM
   JwDy5/CBqU9fyP4m3IRVr3UVHZPMa2fapuH3LED3HGaiTLQfaA+DCvxLs
   S3hijPvU3gjyju4avrAvNSfMN2eSOBi7YJYqA8JTijSgZFsKtUEX1MWWQ
   gXvY1z+VmmuB4ZOUVak1pcZMK2Bk3gR1lboANCv2UKY1gjeQtcO67oVBE
   jjPKY7d3PLiGQNQPZdpjqgdOAOcS2IbBndfKzg7ym0+FDmtv5lyrqxp+x
   Q==;
X-CSE-ConnectionGUID: RM+F8jZuSluk0YP9geFsSA==
X-CSE-MsgGUID: QxCYvltPTDCUXMoS9fZo/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98752601"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="98752601"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 13:48:39 -0700
X-CSE-ConnectionGUID: v+fwB7NnRLWkVYz06/Jm6A==
X-CSE-MsgGUID: ojCWma7ySX+JjlQpYj8Mng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="264630682"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 13:48:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 13:48:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 13:48:36 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 13:48:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nellhGOytf5rYIaBR2UcY0dhbogYbrB+9rw4Qjws8JFmU94CC4MdRzd4BNTgY+zh8wOrOkNQmnoMrQ8iD2+HfBUwbPzey2GXQ4BpK7g4LFtsNIcwqCToN4yLKb6fhhDMhiajtN4JvvBjgeVBkC+u2XE10sYOM+3akT5inQOxIhDtB9RtmsmZjUv9TsoooX8bO7TB87DFpaVmOXN5giu+uevO0wHLIZfYUg9YUTu0nHXqcT2IPBCGFWUKriu/Qk3Pj235tR4E3n8lX+T4TOyYMQ6ZGAEJB+V5Vk1CJhePxxhKSdlDUFCdA+oV4C7tth6wwkOIo6q2vLEyDh21aRV8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vScnJVNxwZ+yL9xbenWsesNR0s6/EJcA556JqNzTQ9A=;
 b=ZxNqIQ2kGz6hWi1P3VDHGsymw5bYF4NmpiK0MlNDQZWJbNSsi93xOBn/kvj+E/+1hkN5TkiNNrBn4gOiEQJFpixHqqbzL9jzIe8gh91BX/qQVY4NbeXWEmH8kZnLNPdP8IAEaivXVUAojyO8shoyJqGWd4eVp2UJJG7x4JV8d2HtDgaoWTKz32IrRAWvc1psp/gEQ9sTUh1jXVgBt8IdhaiHXVLUJWbv/bLd1yGP4Ulw77bV6ZRIBuLPcw9+5p90hbhoIC9MhVEHn29IwTvLp/Hdb8C35QvcGTkbuWgFThf8WOOSKSIJmUZYekCq8KhlNxUqKKkSLcCouDyRiAaNNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by SJ0PR11MB5939.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 20:48:33 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::fdda:94d1:2f7:b79f%8]) with mapi id 15.21.0270.017; Thu, 13 Aug 2026
 20:48:33 +0000
Message-ID: <951aa78a-778c-408c-a543-19cb09dad813@intel.com>
Date: Thu, 13 Aug 2026 13:48:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe/forcewake: synchronize engine-cycle access
 with unplug
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-2-zongyao.bai@intel.com>
 <20260813002147.04EC51F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <20260813002147.04EC51F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|SJ0PR11MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 11db9b54-62ed-4736-a43e-08def97c3d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|4143699003|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: P/6OZunqsg3ixenhOUMsaHhibQniPN/r1TE4cHpv8gNciFoHgmjkXc0iWxXg2V8M9/dtzIKRkyx5D1HmKbcOu3g++UtcVuE1F2dryMaHjl0OOTxAM2GO41TWoJOLKM2k+AGOkaTpD9AjHpQ5IqKaYzNjTDg3S0W2KWCLDA7v3E+rrB7aY8IpcNbCKABcrKoTJJeRWpPBX0uNFUhenKhyJUIsw5Cll9xia/0lDdCrX+Rzk/zvH7ZHtZ5cjMn8h7JwcMepCjEzmy5UHVDbindCOEqKtf9ujwM8aWQa12j6JoWPhX9JLngXmz5IhB+Lco2Gs4r3Dwjye/deA2K4f162rO/WkJwPiPu0gkR+8mhMU5W3QJgEA5iGdPbE5Q2aTUzCLhlSSx5R/AfGnqtON0JjfvHjTzAdocx37jOJ/gPbnOyaKsi6apBmpFExMrfvTGBY6r6RUZr9+NIevZJKiPBu/Fng+Kv9VaxdpX9z2O1UDZjH3KjsnJly6Cxau+sNl/L/KVwXjhdn1Jl/7OrpIZWDN9eUEKvoh2UyVeiQmf0UoUi9kLCmkE8GGKyXZscF5nfIuvsyOBrZBELS6ElnXrBF2OCOJj9aUzwbj/XPljxRgCjnlDiaob1UJ7EMm+Sd1ik+4kXvPHrKWN9elRm5RvWaa4oeMgnKAp3Ql/Tzl8I9a88=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF46B98A11D.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmJrYXNCaVNRTmVudldZV29tak54VFVxS3RwRjhUU0d0LzlBdXA3YTU2S2JS?=
 =?utf-8?B?VDVtS0lsUTFTRWh5R1lMbStEdElJTXFPS2lNeHV3aERTUjRrTXZzOUJGYjRH?=
 =?utf-8?B?WUVPcmp3SXk1RHBDbnBOWDloQ056cnFpbFZ1SWpFdGM1d2RkS0dKOFFqWWxF?=
 =?utf-8?B?eUtmVXdFd00xUUVFZ0RBS2tOU0F0dDJPVXk1U2ZLYmNRUk9SaXQ2VWRDZ2F3?=
 =?utf-8?B?RlZvNlJXeWhPeitxUk01b1haVUd6dG9LTm5kS2JqMGs1RDhDTmFBU04rOHpw?=
 =?utf-8?B?TU1wYXJNV1JhNzlHdXlRSnNhN2xUZXl3OEJnS2MwaDl5MXRqZGpwWmJDRFBo?=
 =?utf-8?B?eGU3S0J5Wkh2SzE4K243VGpqYllUUEFKT3J5QW5XWWN2TDRpc05hKzVFS214?=
 =?utf-8?B?ZVUvZ216QWJmT0ZzZG54M0pjR0YyUEE0bjM3OWZsczMydHJvM1JwNjVNR0NV?=
 =?utf-8?B?SC9RVEZ4OGMzbjB3WTVCWWxvUWdjVGhrOUx2VnJUcXhrWUdWOTV1MFBOMDlD?=
 =?utf-8?B?elAweWlFa1VLbHlsODhDNk1vRW9SaHJwb1lYblJYY0NaQmhXdFE4VzRmci9C?=
 =?utf-8?B?aGtxbVNQTG5HMFp0dUhrUFRvZ3FWcnF1Z2ZONlpLUWdRTXNqZU9ydjAyTnF0?=
 =?utf-8?B?dTBzR3hyZFdGL3RzMnJDUzdyTVdhbmtMY1lUdVBZRnhDdXVjMHcyWEsxYTJo?=
 =?utf-8?B?YitmT1lQU0wwZnBMQStiQkJ5NVZwTkxROXRpbmh2V08wRWZweFlLNTlrdlFN?=
 =?utf-8?B?RlVuZHZORkVmV3RxUDQ0VWxIVU1DeVpnVUgwYzVuMURZdUMzMWRsbnFYWFdM?=
 =?utf-8?B?TmJ2aGZKcmMzckMybURacTFVbCtGallOZ0VpMk4zRFhqRVRwam5oeDdlb3Vr?=
 =?utf-8?B?a0ZLYm5KWEowNGlDTUhMUUFSSmJjTjlYSmU1ZUNhM25zTVFCazJsNnNZVXJC?=
 =?utf-8?B?MHkrWUNDOFB4ZXk2R0lOSjNxZVY3U0xJWTJUcnVXOUo0YmlUa09pNzIycVp3?=
 =?utf-8?B?ZC9lb0VIeEsxVWhpaDRhQXJGNG91bEo4cS9UbGZxdlRxS1RiRUMyWHlrVmdN?=
 =?utf-8?B?aEtiVDFGcGlBemtXZ3BGcmV2VWtvaFFiT3NIQ3ZMbUFQVDNxOVFzVkFTaTNw?=
 =?utf-8?B?YjM3ZUE3NHBqL1BnZjZSOWp6K2lTcDhXZVN6b09ZVXE0QW1ndlJQVEFxbnZP?=
 =?utf-8?B?dTMvUTZmNS9XTnhBVU45bEpOaEp3WFhyWS9kMEVXVU9zVVplQUFGN05NVHhS?=
 =?utf-8?B?OVJKWTh2M0Q1aXhMUTFkem5yVC9Sa1ZzcDFDMXhraW13bFQrOUFXb1orLzNV?=
 =?utf-8?B?bzRjc0lya1JqbXVJOW5HRm1DZkw1TSs1czdrSXdncnRlYk9WeFY2U200TFRS?=
 =?utf-8?B?VEVzaE5hTUZxVDZMQTZiNGUyazkwcktSbi9wbFBSajlxNTBvUnExYVpJMTNI?=
 =?utf-8?B?d2diNGRGSkQ1Nm5OTHhrQWdGOEN2Y2NyRjFTQzNOcEJvcHpyaXIwZDdXWE9Y?=
 =?utf-8?B?WVg0Ty85d3ZZWHc3ckQxcXJQQ3paUktXWUNCNFVoNlJKdHRDK3FJQlgyeVNm?=
 =?utf-8?B?Zy9HS2p6TlYwRG1saE8zK1Q4VTRaS0hjSUdkb0JPNGVHNEttMWVwYThrdkJL?=
 =?utf-8?B?OFQrUzIwcHQ5cHVlZFZjMkZHdnVyQ0hMaGpsRXJrTHZ3OXdtTlpzUzJpWmFz?=
 =?utf-8?B?OHhxY1JSak8rVVJBQWFjbDRHSkVnYmNxeWx6Q01WM1ZCVmFOazRIenZPRGtk?=
 =?utf-8?B?Umpxb0hPMXYzbXpod21xclZDYzRZM295L0huams1a1hVNVpjOEx1Y3NnYVRL?=
 =?utf-8?B?NFpmS3ZrYzhEU3BwcktrQ2tTb2R4R1h1ZEJ4TENVeDBVMU9ZcTgzajRRaEZs?=
 =?utf-8?B?aTcvb2RoOTJqbjdwZWd0SEdkWnhiaHIxa0R4V0VpR2xQL2J2WndxNlhTNzF5?=
 =?utf-8?B?Y3hxT29GRHJ3eWdYY2tWQ3NwYktoSmlEdGhDVHB0NlpVVEFMZTFTY0k0WnFV?=
 =?utf-8?B?OGtzZmllRzQ4UUJ3YnB2QUdkQVFlYU1BTUxCaDFzMVg1NnU0aElHWVhjeGJP?=
 =?utf-8?B?OCtwSFVHU3dVeEpRa0RDWnZNNzJTVHlJaHZYRGNNZDRhaUNDOGNQNzBTTnBM?=
 =?utf-8?B?OTAvcWp1QlBITlMwSndKd2FGamN3ZVB6V1NCME1RNjlJTXdWeUR1by8yQVRl?=
 =?utf-8?B?ek1pSU1hTUZ5UDFVWHRsa3Z0VHNGVHlxdjI5SHJYMWZ2WTZDOFNwVVgxVDN6?=
 =?utf-8?B?NDNSMy9WMHkxS3dMWEtVWlZwcWtLbjJtZWlhTWlIdU9uYnM5ZitURHU5dUpY?=
 =?utf-8?B?TGVqcFlTVHhsaDE1RkVNcE5ueHExbm9uajd1YjV4OUhsSHI4VGJPdz09?=
X-Exchange-RoutingPolicyChecked: EAayFXNjaU6vFbllPVeMHrhye8FaxjMoSAQWVq8JEq3Aj3FA7g5y4AHOK1hfHA3XT7+hClqFM6AiHUkb9EyU9FB2mgyB0gb1FXICj348iz0Frw9J5j/k0DNuT4g9/T93zOiOOj1Lkcl7vPcKCYAWcMTshasrbwJnE0IDeDaYC8MR/4+/PC+xjjGQuaeUBiOnppMEykP4W2EAI0E1c0XWACeiQ6ozBmqBzIklHDoENyhyteAIYqsuhd0JzFfv/GvYLfS4qI3FKDA7oGqIrsQHHuH5HPLj0Jt/2mU6lXZi7z4negoQ2zc6v4yYzVUdTkkS4h4NjbNVuheEpGRjUZ3iLw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11db9b54-62ed-4736-a43e-08def97c3d57
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 20:48:33.5507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VezwNZonZjYIehZ4mI5CJpWm5sZRyVYiQ9jbSfPhJO54HXH//6xxHfbethsLgyIGwVUI8OY7eOdjE7GS3FsomQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
X-OriginatorOrg: intel.com


On 8/12/2026 5:21 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Incomplete device unplug synchronization in query ioctls leading to potential MMIO access after unplug.
> - [Medium] Missing array_index_nospec() on user-provided indices creates Spectre v1 gadgets.
> --
>
> --- Patch [1]: [PATCH v5 1/4] drm/xe/forcewake: synchronize engine-cycle access with unplug ---
> commit cd6f1d67df5ef0b65b3a0c38b2fc6c7bd6e42c60
> Author: Zongyao Bai <zongyao.bai@intel.com>
>
> drm/xe/forcewake: synchronize engine-cycle access with unplug
>
> This patch adds drm_dev_enter() and drm_dev_exit() to query_engine_cycles()
> to protect forcewake and MMIO accesses against device unplug operations. It
> also updates the probe failure path to use drm_dev_unplug() to ensure proper
> synchronization.
>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 71111ad324658..81b31325e5817 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
> [ ... ]
>
>> @@ -1166,7 +1166,7 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   err_unregister_display:
>>   	xe_display_unregister(xe);
>> -	drm_dev_unregister(&xe->drm);
>> +	drm_dev_unplug(&xe->drm);
>>   
>>   	return err;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index dc975f5953683..3c356bc48e2ab 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
> [ ... ]
>
>> @@ -143,28 +145,44 @@ query_engine_cycles(struct xe_device *xe,
>>   		return -EINVAL;
>>   
>>   	eci = &resp.eci;
>> +	if (!drm_dev_enter(&xe->drm, &dev_idx))
>> +		return -ENODEV;
>> +
> [Severity: High]
> This is a pre-existing issue, but since this patch introduces device unplug
> synchronization for query_engine_cycles(), should similar protection be added
> to other queries like query_pxp_status() and query_oa_units()?
>
> In xe_query.c, query_pxp_status() accesses hardware status without SRCU
> protection:
>
> query_pxp_status()
>      xe_pxp_get_readiness_status(xe->pxp);
>
> Similarly, query_oa_units() reads MMIO indirectly:
>
> query_oa_units()
>      xe_oa_timestamp_frequency()
>          xe_mmio_read32()
>
> Without drm_dev_enter() protection, can these queries cause page faults if a
> userspace process calls DRM_IOCTL_XE_DEVICE_QUERY concurrently with a device
> unplug event?

it is a pre-existing issue.
Yes, I agree with these similar protections should be added. But I want 
to focus this delay-release forcewake function for query_engine_cycles() 
first.
For others,  they are not introduced in this patch. I prefer follow up 
in other patches, but not in this patch.

>
>>   	gt = xe_device_get_gt(xe, eci->gt_id);
>> -	if (!gt)
>> -		return -EINVAL;
>> +	if (!gt) {
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>>   
>> -	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
>> -		return -EINVAL;
>> +	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class)) {
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>>   
>>   	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
>>   			      eci->engine_instance, true);
> [Severity: Medium]
> This is a pre-existing issue, but does the engine_class array access need
> mitigation against speculative execution?
>
> The eci->engine_class index comes directly from userspace and is used
> to access the user_to_xe_engine_class array after a bounds check.
> Could this be used to bypass bounds checks speculatively and leak
> information via cache side channels?
>
> Additionally, earlier in this function xe_device_get_gt() is called with
> eci->gt_id, which also originates from userspace:
>
> xe_device_get_gt()
>      if (gt_id >= xe->info.tile_count * xe->info.max_gt_per_tile)
>          return NULL;
>      tile = &xe->tiles[gt_id / xe->info.max_gt_per_tile];
>
> Should array_index_nospec() be used for these userspace-provided indices?

Also pre-existing. This patch only converts the existing return -EINVAL;
sites to err = -EINVAL; goto out; for the drm_dev_exit() cleanup; it 
does not change
the bounds checks or the array indexing, so it neither introduces nor 
changes these gadgets.



