Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795101862;
	b=3VeW67Emjqoy3gIGcC3HZjjURwX83Q6lp1TEbLuWwWr0rJoHWiOYK5LINtHRgUne6n2W
	 FZVBQLu9WzKpeRfME9Khpsb76CVCmwEh1avZQA58c9cnrDNgd45r0xK9omHbaxeu8bklV
	 VkJFmegB+2iQfzHMh5Sh8MCAeev1ewF2wbj9O+Yyt8ZNLBmZskMVOe/mtQ2UkabwP8wfW
	 wC9xQXI70mQHiQtYaGkn7OnA9rsn/bsUBHlhfffiULLkxNCqZQMkwKvGHLM77J1Baycqy
	 Kx0KW9/PeoSW8jnax04pYGsAl45Ykn6LVhwHlbgZKXnkhxb1o74qLsTzYJBZaL8qs/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101862;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=C99yTdzILm+ML9lS8hkGxAQdTD0Te+2UZMeQ22/mpNo=;
	b=uwchCZlw25ACCSaxGszil6O9JiEYiJPSn/gBrL8w7ZXiSxFifuwcHIPqEzuKn1UB4vxM
	 FT4FFM7kxBtk2DsNwjyzqMT6HW9DYPbW1sgz6BaTnwjzX3HdZgvYBVCIjsr8xeWpJ3w/s
	 GpSFCeqDMbgr8KVkG0qPJm/fQGqetgIgj8XsnaxGCMOG4rhGBb1B4lmshfwqJWOBu7atK
	 b7HfphgdJrpfvkOuvcklb7UW6UUXCHg6qovLAP7AC9iZEyvOahd5TErK661B4GsmFAqdJ
	 nSnkw/Roctu+V7W1gsx86NOd3jXg4Qn8q1pXoaSGhHMlLu6lm2Rf3dI3u0tKK0zAzCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a0aNt8ac;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lqT88ZZ0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA00606A324
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 15:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA00606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a0aNt8ac;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lqT88ZZ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795101862; x=1826637862;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Mm9owO9k7wEMAWgx/jITqRrNmwGSNi02IQyfiwSdQIk=;
  b=a0aNt8acUif1RA1p/zqxkzG/ryKLjN+D2U/jCEnEn12Qz4krK1NZH3N6
   xe9W0ud7ZmmdcdVpgmYRU24Llp8ePVH01U4PIMzIMOXA264pOEhWhw9VR
   ChGBjQiqYT+wZCqFKBwJUTtWyOZ8XjSxL1d0KJhbsXRSA8um01cVDwXNS
   nwEx6mK2RPCo0kKwSIcb0mIQ0ip/bxmDi+3Nqvy1rkAIvmTEJqke1Cpc6
   TYhPYgOykjzOrBeTpVTObMxveaPuYKn5YycP/IK8zdd6HrHMbPzA5KQur
   AgilPUMr+mvf8iyYjMpfNp5slPH6Hgn15RHHsB0jMJn2c/Uid4CU2RaFL
   w==;
X-CSE-ConnectionGUID: 99/ynwAIR92cACAAKxiMMA==
X-CSE-MsgGUID: 7/uuHQ9iTgy14DWyf+Olhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3842125"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3842125"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:24:18 -0800
X-CSE-ConnectionGUID: +aeW6FdMQoWE+KCX/aiBuA==
X-CSE-MsgGUID: hcPL3tTYSUaFaMN6E/ycMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10545028"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:24:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 07:24:16 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 07:24:16 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 07:24:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyvfc1EfQmvNbtBVaywMB2z1yw3NEGkq/UzIpXmTbODz1+YmejgfKsopTVCbReTw4L2/rWvW3HDbFX0Ehc+Hkq0GuWEH/qHkI//X6oThkxU8HDw2vA/3HdSVT0lVCP6o4nAAofOq/0nrJnymGF7rXjPktca5QDPaAsTx9LpPjTpurBb5TJ8fCVH5kCVNOVRolP15i8Q7on2isDb8a0cxuoH3H/OOx5OpdFND35d2uEzc9wTugWqet1lF6WtYhJnTrUR0SwNH/lFk3/On6zbG3qqCzZ0xJIB0LUsfO8b8Saqo0ikhjJ2hctnKeWNY7m/c9Wa+xDfjwUkHkS309+s2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C99yTdzILm+ML9lS8hkGxAQdTD0Te+2UZMeQ22/mpNo=;
 b=Y3fbt+tRi3zYIPCK6Ja9h4y5Y618JXpnNIygGn/OUI6u7Pcf6NwfQILsM9/QiX/1JqzXmIUX3AvnX9e6u3+L9FaWF5lsnkDIbVNNGvIoDxtXuv0ACD6BcJFGmh2sCByrstTlBriOk4u6vLEvXRREm7vHO6vfoF1hb0mkWD5Z2KIjyM1nsOIqiIIpNfTTsv5b2mFvLC2TFapZnkDb9NevNq0IM52loAAogKqtJ99aNLNRAGMjdPJ4J6FwDmDeH8qRAL/SAeGszM+ZUP7rJKusc5SOhgs8bd9bH9ffLPwSChvobrpznNQEuIe6GwUoQfpAdQ0iEunITvcDBEgORkTt6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C99yTdzILm+ML9lS8hkGxAQdTD0Te+2UZMeQ22/mpNo=;
 b=lqT88ZZ0fzE79n/htc6xtIwphbE1MDZsxBxwwMu2cZK+E9a3R+XNuQuHWTx3FuD3tgWvn1iawrcjX7amgZjniWp5a0q/W1sIRQjeXy1ETwLjP5mMVx1MpgGr4+ud4jfvbX7wVFE9p2OfmLy5zC6ZKjtA8Q4DgCvjqrhw7xZG7k4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by MN0PR11MB6182.namprd11.prod.outlook.com
 (2603:10b6:208:3c6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 15:24:09 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 15:24:09 +0000
Message-ID: <e4abd809-5246-459e-9818-fcf1c990d813@intel.com>
Date: Thu, 19 Nov 2026 20:54:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Expose powerX_cap_max
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261119104029.3066660-1-karthik.poosa@intel.com>
 <sashiko-outbox-222985@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-222985@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0305.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::14) To FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: dc16e643-a262-4505-41c3-08df46512801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|261022075727099003|10067099003|56012099006|4143699003|11063799006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Dl5mlxDBiwPMUgvM8I5IxFC01gwHLVF7EtOCgxF0BLQF3iMIW8qsOEXuhCxFQMe98DecW7tDZwYeid0MiCFeOT//XujPdNAsSMl8dASkV62APEWf1EaH0R5/ZqSuCDokd+jc5bB3J6JtRF7cMaigVQ2femOdIHN9ZgnbQBlHvvsJNXijQx+X01zotQHOKNwDAyJwz+mgw9+/eiQkTlTQ9NDbnvxdgBMX/D+UJJoMuaGxqwVvowcAcySJzfPWX8JOnB3f2bjVLcx2xfs0LVKxlkF8PjwQbwM8D3Z4wFc9vyJSWmfJUhR5tuY/rpaH+7nHQ5CQVHQ22HGGKDCQtIEvwPOs8NeSITg7rBwlDWXA/cNKxIbJ+zda2/I4u6CMeIzpp7peNy6T7nXi/7s8JbHlwGGtmuHCSebAukEjrrK9HEtlsJiVpyKxbqKe0Xz0Fjs03ikdYZRmrL8QhUNXbuFn1WmAw0UMAJjXWQmM3k1eb6f1xDCRY3C2EmZjCrrZnC6D8esb4oQYNezqhH2I9l9nQfYVKHAg6WJFFH/jFwdoUsCI/h5DzusendeDRZ+flEhBgyiEVn1UrpivYEsyfL5OutHIvB0vxcdFPap/vEQ4Y18=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FT1PR11MB960200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261022075727099003)(10067099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3ZiUkNXc3l3bDRBdFErcno3SHEydmJLOTNWaHJFWFFCaGVsTE1DM0dXV1A5?=
 =?utf-8?B?amg4WUxYbU5BdFhwWVVPYmh1c21KTmd2M0xuek0vd2EzV3E3UzNDNmRkVmFV?=
 =?utf-8?B?V3RETXd5VFpKNnJWYVh3dVYzeDU1MXdXSGZXTWtOdlF3Ky9zRmJyM1lwbzJK?=
 =?utf-8?B?NUY3akU0RzhVSjBPdU90OHVsQ3ZjTGF0emJMRUVNWGZDSTRsNUtoc1pYWEp6?=
 =?utf-8?B?OUc2L3VGcytCS3NxZ1lFZEFNOHBmbzFmREVHeXdMMkUzY1NyRkZnc2JrbGpB?=
 =?utf-8?B?enlSODhTL09JRkNlanVNMTF4RDdycFZkSWlURnZVemlFenBpVTJFdjJkdkd6?=
 =?utf-8?B?TmlRRXdnaUR4TnVyTWZSS2RPN2V6SG55WVZFTTN3WW9xYVhlK1NlMFZnK3hF?=
 =?utf-8?B?WmpJTWE0eFpyZ21OZ25kZDUvZXRFZzA0Rkkza2pCMnZ1VDdGalljK283Q3hn?=
 =?utf-8?B?RkdmeGd5UkJYN0VMZ2xsUmJBZjdmSEx4ZkxVQmdUUWJGOGFCS3hycXdmenIr?=
 =?utf-8?B?bzNZNGFvMXpycDhEejBpOTlGWHpNRUNIdGtxb0R4N0ZYNjlUSklRT251SEU5?=
 =?utf-8?B?NDZoMS9WRkx0TDQrcWp5NjlWaWhGNWNzMS9FdXU3ZXpaMis0S2x5YWFiL1JB?=
 =?utf-8?B?NFRqZGI2MU1GazVreE9ldVkrTW1PQ0R0S1JFdy9aQ0VxVlB0YWtYMmtTUyts?=
 =?utf-8?B?em1kL25Hem15RkpYWEQyM0JrVlk2ckdpWFUxWEdVMUpaU0lPYkVoVTBOK0p3?=
 =?utf-8?B?a20wc09Va3M5bU1ucml4WjF4eVZWdDVZV2dBU1ZHcFhTODB3ZFJMUUVBNWlS?=
 =?utf-8?B?dGpubjBqM0Y5NTNQVFNxVUdXRjRUNTFLTE5jaGh2anNaRmRTRWlTSnRYKzBG?=
 =?utf-8?B?bVZFZ1pyanNRUGJ2K2Vnbzlnd2xUZ0x4WE1JdzZWRTlacE5oVlllSSt3ZXJS?=
 =?utf-8?B?dXpMWEw2OW43bkF0bmJsdmxQbVpxdy94S0lwclZhQW1sS3crcktNVWFiVWlY?=
 =?utf-8?B?YUM1MWtMaWorTGNDY0hLamY4U3pncDhHRDlUYWlxL2pta2dRQzNmUmRSTkZY?=
 =?utf-8?B?OXFlTVV1RFV5OE1nYkNZNGtsbUdMS1I4bzRkeDVWN3BRRHV6SWtKbHB0Zjcz?=
 =?utf-8?B?NzFWK09jcGtzU05GZFRCVTc5MlRBV3RXU205MWJsaU1DaEI3akQxdERwMXI0?=
 =?utf-8?B?bXhBYkxqNnJRanNTcjNzNDg4WlhaTERMZVlrM0xwYkZUbnRjTDh3K3pHRS8w?=
 =?utf-8?B?L0hTSURaVFdoMG55bWoyTkJMRmJ0MWdLdXVMK3UvMDNkWGt1WUZ4WVloWlZx?=
 =?utf-8?B?V213eHhMRllRb014eUVSYXQ2SnhsNXhLQzhTdFdoTDc2VzFjOGQrQ0YrTWRY?=
 =?utf-8?B?WkdkTk1zUjVQNXV1WXBLQkFxQnZ3QUtHVjVMVWFKcFNFL1JzOUc1Mnd3V0xE?=
 =?utf-8?B?THBhZS9JRENGZjh1dngxYjFJbmttWmxxNUtVUmNYKzIvL1dwRzBoSjFWbFRV?=
 =?utf-8?B?eWVDREEwT0gwQTJGcE5od3YwejBYZjNRUFV0blJackl0SkVqSDlFdSszNUMv?=
 =?utf-8?B?N0g5US9RTHVPbVY4Q1JPL0VjZkZYcGtlSGcyNndlRUVoN2l0S2tITk1MeFdr?=
 =?utf-8?B?MXpBT0xybGk4YkJjaVN4UkFMWVZvSVFmdTU0eFN2c1I2c2VjczFCOWE0NkFG?=
 =?utf-8?B?d1VmNnFKamxGZU1yV3V3Y01CZFVtOHlQRjFKWm1TMUV6dEhSQ0E0T04wQ25W?=
 =?utf-8?B?c0YzYTlhczQyMlBtV1ZkVFpTQ2U2WlRkWG4xL2hwOElNWUpWa2phekhxdWh2?=
 =?utf-8?B?WUljZHUxdm9jYUtCSThTdk51T2ZoOHBzUW5GSldZbWZBaVpVYXVyblpCNzZl?=
 =?utf-8?B?ZjdzOGhLd0hwMllCWmxaU3lIcEMxMmhUNFZTQWJ4TzNrOXBFam9sR0kyeTZW?=
 =?utf-8?B?ZVh5K1ViVFNnOTZjTHZBZVhFZEs3R2xvQUxDU3NMM0F1SmtOK0l0MHlKamJH?=
 =?utf-8?B?a25nK1R5OEx3enBERWovOGdlNUZVY1FHVlN5dlpoN0VjTzU4eHNiTC9HdU9s?=
 =?utf-8?B?L2lleENPWERPKzNsTms2bjFJOHB3c3pscVNlaVI5b2VPbG15QlBqY3c4ODlG?=
 =?utf-8?B?ZzRBYUpiU3h2YldZZmxrRWNNSndlNHNvTTVBUnFSNmdYT3ozQzl5bEN3SmVL?=
 =?utf-8?B?VW9KR1BaSWNGMWlPZTVQcmh1dyszSTBxMkdRcVJ0b2QyNEhuT3J1RjVRYXlt?=
 =?utf-8?B?MTZsYjRmdWloTnpVNUEyeGhmRThBMVZaeGpjeStFdGRCZmcrYVpjQS82UTl0?=
 =?utf-8?B?QU4rc3hYS04zYmp0QWNhSDFOcTV3WWE4RGd4T1dsYytWcE1JQWVYQT09?=
X-Exchange-RoutingPolicyChecked: yX3U72Wq4+EthVxqWv7GbKwNiTa6Z8ZO8IkFN7PcP/7kF6CI5HVIe+RIf40pbvIpQzAij601QJ4zodW9KdeokgpHsRthkBYZsSJWRRn+SBXqjMPcHelAzRT1fVqydFpOFwGzt4HXc6b7JziSe8dNUxieoa/yoNktaR9ZS0UKpECvzbrGWYu5loSZkbGAOCkdNUXHcx5VS5jymmQMrCa8qesTgHunfEkZiuuulOXNGmLsVR0Ciieg4DVccYnX6tvCFh7c0wBGTMtfzYT1KHrBbKXmncLR2zngcgqp9BhXGt1HtDslIX1rSzAY5iV3DsEU1WqtfB4GQwW8x4ivxJ8Vrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc16e643-a262-4505-41c3-08df46512801
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:24:09.0717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dI1Hg190OitD/Ev1hvm3QGCxMphrQCh33UvyZ3Vcc9dkq3u/yiy9hJWAH+HNP9BxHy05t6XGP40Bmm0Ao+qZxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
X-OriginatorOrg: intel.com


On 19-11-2026 16:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] drm/xe/hwmon: power limit clamped to 0 in
>    xe_hwmon_power_max_write() [1]
> --
>
> commit 26f9457c44502cd969a84eaf5b2ee961f51b7a3e
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Expose powerX_cap_max
>
> This commit adds a read-only power<i>_cap_max sysfs attribute on platforms
> with mailbox power limits to report the default PL2 (burst) power limit
> set by firmware at boot.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index defe8aaca7c11..8e0d295aabc88 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> @@ -1423,6 +1424,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   
>>   	switch (attr) {
>> +	case hwmon_power_cap_max:
>> +		return hwmon->pl2_on_boot[channel] ? 0444 : 0;
> [Severity: High]
> This problem wasn't introduced by this patch, but can a pcode read failure
> during probe cause xe_hwmon_power_max_write() to clamp user power limits
> to 0 [1]?
>
> If reading the initial power limits in xe_hwmon_get_preregistration_info()
> fails, pl1_on_boot[] and pl2_on_boot[] remain zero while hwmon registration
> still proceeds:
>
> drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_get_preregistration_info() {
> 	if (hwmon->xe->info.has_mbx_power_limits) {
> 		if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
> 						    &hwmon->pl1_on_boot[CHANNEL_CARD]) |
> 		    ...
> 		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_PKG,
> 						    &hwmon->pl2_on_boot[CHANNEL_PKG])) {
> 			drm_warn(&hwmon->xe->drm,
> 				 "Failed to read power limits, check GPU firmware !\n");
> 		} else {
> }
>
> If the subsequent pcode read in xe_hwmon_power_is_visible() succeeds, the
> writable powerX_max and powerX_cap attributes are exposed, and any value
> userspace writes is clamped to the zeroed pl1_on_boot[] or pl2_on_boot[]
> entry in xe_hwmon_power_max_write(), programming a 0W power limit into
> firmware and severely throttling the GPU.
Power-limit reads during probe are expected to be available and pass at 
probe time.
If they are unavailable, we should not create the corresponding entries.
I think we should update |xe_hwmon_power_is_visible()| to use 
|pl1_on_boot[]| or |pl2_on_boot[]| accordingly.

>
> [1] https://sashiko.dev/#/bug/linux-9f11cfb5-f9c5-490e-879e-791ecaae33e5
>
