Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A460851476C
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983947; cv=fail; b=Rgnrk/CcXsR8sh36c003YNQApLVf7kc2iDksxB1wNKDA+/QPSugWvWfTQeS3HH1nHNK5hm2L8a+qHcdlAdGiEhCzjbGasvrIXxkWPUSWea3jkgfelKDD/99yVLci18XxAthU8S0EqKOz4JlNjN07IqtOHswVuS1lat4wmvT4fCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983947; c=relaxed/simple;
	bh=xfPTSAUGQrLlW4pD0WLuFf8R4tWQk3cj4RtY984Drms=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MbCpAAtAO00jKHYdnQAPzcefMAChJQps40oSmH9xJ+eCy6CxS+UpGPyEfRLdWw0qduxK7P76WjACjOuj3bKYB4/GGWiNM3Zs72vK4GGMk+gpK8leMhPUARVW/WknYeDP7CTmv4p1YXbZ5D6tDK4yMbvgjc71n1EURvusoaPD3Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9kWUIh2; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9kWUIh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791983945; x=1823519945;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xfPTSAUGQrLlW4pD0WLuFf8R4tWQk3cj4RtY984Drms=;
  b=e9kWUIh25GIUi3vP5DCpLq9okwUcrPkPxWtDyU9iKvNWa+X5mf45voF1
   rkaz1rh0/854K+W66u7SSV3C32kHXNBeMPqOw+vJLufKMkCns33SuTx12
   xsMxriWWpsIwcm2oinMneSTGPUXErnkWsxjjnFxmr6wWIiHqTzPRj4n7E
   CXSYYVXmsYPxKBPojh4dzLYULP4A3azayH1Jx3Lrbr8wGhNGNHXQh40iq
   djDdIKGgYZXAwZNF60LbPz/LpT13cRVv84gqcMp1pDf5z7T/SN6JbbBHF
   l9QLjWh7ynZPqp0j4NyHAzmhj4AXNzNl8RFQO1oZlgBp+FSzgkti7en+A
   A==;
X-CSE-ConnectionGUID: CxVCpr/XR+WImzqflIqQ9g==
X-CSE-MsgGUID: EfHRK3QxQNuhL4cUVUJb6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="629306"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="629306"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 06:19:04 -0700
X-CSE-ConnectionGUID: xNeCQ9oSRRm9LFN2deFzmQ==
X-CSE-MsgGUID: zBPOCe71Rd2VIyb2197Xvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1339935"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 06:19:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 06:19:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 06:19:03 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 06:19:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A04CzTo48NLO7UyUbVxVJuYtyIsRbM4Cz7mbiC2NTjOCroOS1FWWOrxIyS2fKKh5X67XAZkzWTmwOBIjyyQYJrwpzXfXTk4Ei0eGO4v6eBRneET9pSDK6j1zxY7gqgphhHDJWr1Vrt/QjlAZlDtlWa7WZfgRf5lxxulX8vxegPlykkl2CMy0zqCZXDw58H/U0kVVetANvrXIdp6JH78r6fazwkOlC5zHatVYPu5nfpDmU+J1HfzzW8/WMj6EuNRIMqtqxNqDnI27i0b3z02hiZpOirzhonAfYXeT0snHtg2WTJUNg3/1aS6usxVbs0Qdn1NQ2btqRZw8RblYtR/omQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHOarHycZNE98V6ZFT38dpOF7qeMJwowAOlOAdhamTY=;
 b=lQmqF/j01XUMMGV0Nkmor9kC1XtlcuCYdz+hMeaaBqCGt3l4ArX4nCeUDG8EwralLT3wO34q46FUkPUeGAt8YChBAZh4qR60A/6Ob7sOsqRm13PLN294WZjidpXuOqW97/IZDSncf5tOqJWKU8K7IBQYz8Lyy/w4HIbYZVfCqiwHyNC538oC4qPqt83FFRWPLr4r/FJ89BPlTasd7+NyrWDSECyVRnsKMSZZAsL2w61jwni9dXlz84DINKFjS6hv4YdPJn/pGV4//XAf/vC+seMNsrd6p4YZ+V5y4/oGqaTCpPKfL5tfUyb4DKoqvLCWVrwLm3djOh6E0T29psk0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by CH8PR11MB280672.namprd11.prod.outlook.com
 (2603:10b6:610:32d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 13:17:10 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 13:17:10 +0000
Message-ID: <2348ff5c-6d98-4f9f-b4f5-1ca164920ddf@intel.com>
Date: Wed, 14 Oct 2026 18:47:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 04/16] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
 <20261014115806.831459-5-karthik.poosa@intel.com>
 <sashiko-outbox-171241@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-171241@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|CH8PR11MB280672:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc35469-9b98-4833-db35-08df29f573e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: izT2sWX6oo6G86/2EwSJSlyawCdHeFRmTOKwyOslX4IAv1yJVJHcVxoBgGKzR7OqH7waHFYz0fXYpVJq/WLAr+PyQuOsognyxmFx9/FvQucXrsWpRt53nYGa+/4OzXY/mXPPDU5/ILlKO+2cJRm2kv4NUG0XF63QkjLEb6TaxE0qKWYYa9u/D/eG88alSyMgu0j1qMaQSy36xHnFjwUwYws/27DQJttq2FZ8vRQOOCKpYRp1N9CQcOVIcQU/O53Nd/aJVNBEf14sNH0ThwwCyV7IgEmQuJdHKWQzZKTvyFs0J1Z3oU5wFZsL4ht3/oLjC/OecYHXgHS2h/jmuDfNRMIWtDlSbILjwgKImWYrxY9cT/AdLJ167k+GHWDKRofnPj56FsbGcJalqjfvj3PTygcegBkuGF11sh9Xn00rvkHslPiHzP6DMih86enaYAkNtHMgJxRu5ECUfKhKclMCVJkR1AQmBl9By9yB+VAnoAv6z3IYAc7RpfijHP5Q3+phn+SBnIYLT9xIK4DH68+wqyTYjpvBBVBhuVbo+VVa00xeeNG6c+1wIfIDYuWFDPwkucWHzL1lTDM0xiJwg3FgozGWRVaAVPJ+DazIqLaKFge3lq+yPzqfNR7uOYqWmScbp2kvlkOlZb+QEP1pmeWLJDokV1QVJjsojTzjdmOdmf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak96QTV0Uk82VDFWT1ZlU2lET3lLUVM5elF2WFdzSzNFbjV4WTRhcmc2Yy9k?=
 =?utf-8?B?cUtueFpXT3VmRnZRL0RKbVF5bW4rbG9icjN3Nm1rdGtib09LL3FZVVBrT3p0?=
 =?utf-8?B?M2ExZXpxY3dOQklUY1dwR1lDTFhycmZoOElTclRDZ1RQaW1mQUxIR2wrNVkw?=
 =?utf-8?B?LzY1Q1pTUThQZWloODNtOHFDOU8zY3VMcUpqRkVYUEdVbmlnT1ZlVnFZdGpW?=
 =?utf-8?B?VEs2Y256RGVTMkh0RkN4NG4vc0ZxRXFkUm1xZ2xTSnV6Z1lhb0pES2pYTmEw?=
 =?utf-8?B?L2pCdVZvOUk3S3pOQkQ1MGI1K0xnLzZvZTlOVkl5TEhhdGVyVVEwRHh4RkZ6?=
 =?utf-8?B?SzdIUURtc3hWNnJLOEJBb3ZoNmhTSTFNL1NielR6N0JxUWp0T0tNN0d1blVL?=
 =?utf-8?B?cGRqdWFGenpzTFNLNExtWDFUR1BnQmlzY2R6WHBCUmtUbWZyc3N1TFc2aFVy?=
 =?utf-8?B?cTNKSFBRKzQxREtzcWtSQ3luenN6NGxTOS84aFJyNi9mOGlWejVOazdQNnVH?=
 =?utf-8?B?N0ZVOWhiRWxQZFhYdjZ0b210NXU1QW4wVS8rTDdBZW56dXE1SHNmQTZpQXBv?=
 =?utf-8?B?MlBvcS8zbUllZU42a09MUEpxbHI5VnJGOEl5aW1MSEk3V0JIYjU4UnFMRXVU?=
 =?utf-8?B?Q3dVY21CWGxwWTU3M0xjSUcwU0MvRVMwM1dBM0l2SHlYK0QweFVmNjRvRk5L?=
 =?utf-8?B?UUJoVCs0V1UzbE56MEh6Vmpkam1jL1A0V2pMbk5INVB3OTBvU2FxMzk5amJ1?=
 =?utf-8?B?K0VLeks4OWE2OUw0M0ZRVTdCRGN1ZlY1N2VLSzRQelhOQ05ZZDVMdC9vM21u?=
 =?utf-8?B?Y0NhamVaYVg4VUZiajRkSTZoK1dXK01aRW5SR0RQQkpWRTZhbk5wN1U0cVl0?=
 =?utf-8?B?LzhzLzlmRTA0U3VQQUtHTXJKZUxleFArY2s2ZUx1TUsvMUFQeVh1RHErOWtt?=
 =?utf-8?B?YnFQdHA0aXdsRmNBQUpzUURxcngzamppdHhPT3ZNRktZZ2FtMUd3ZmdPZEZp?=
 =?utf-8?B?VEhEd3lsN0VKLzhYakFiTCtxM1RMTFVLUGJ6bXdMM1FSMkFOYUZMNWhsRjQr?=
 =?utf-8?B?dXMxTEpNVWM3SkljclViMk1XU2IzcG5CdC9Cc2F0dGFJT25VaC9kOGVPVDA5?=
 =?utf-8?B?RkhjblMzNXhvQWdnWHYzeEtYVkNGTzJBZmRSOTEyTVdWRWFWZzJiSXUzSEtU?=
 =?utf-8?B?UURPNVViVHpnaEpGcjRtMGtCaWd0RTNkbjNaaUlmQlFzSTIxNUpKb2lWV09y?=
 =?utf-8?B?N2d3MEp3bE45djBzdmJ1cTNLY3dINTJNUWZ4MkdHblZmZTlwNTJqQUp0MWsv?=
 =?utf-8?B?dDVSTGZtQVRNZVdWbU5NT1ozaG9EZC9zWWVZNW5tb0J2VTBVMEJkSUIrZ3RP?=
 =?utf-8?B?eE0xTHhwSUNqcGtRWUVvRlBMWm83M0lNOU56QnJxaDFpa1FINWFQUDFaR0sz?=
 =?utf-8?B?YUNEeCtkWXN1VmNEQ0lWb004d2ZhOHhYNlpwL01RczI0WSttWVQ1ZGcvbC9q?=
 =?utf-8?B?dzRvOWdxUjNMNWJhcDcySzhWVHoxd3FIU1hkenAyNGd0dTg1TDF5VTNKOUV5?=
 =?utf-8?B?Ykt5TDlNTEthRXpuN0NmRVE2c0NISVJOZFZDb2lDRzJnUmN6L3ZEMDJ1MkQ3?=
 =?utf-8?B?NEpRaXdOUG1kNm5QaEVGWFRjNkxublZNRyt6OHVvcGpjUDRiNmlRVnVPb0Fk?=
 =?utf-8?B?SkVJNUJjZWlicDhLZFNZdWpZWXdZS3V5TjlKY2pJam5NMS9YMng3OElkQUZ1?=
 =?utf-8?B?UElQQ0huLzlsUGFOUnY4Z1hNeTgzK1ZLQlFtUnJ1ekRMWXhrNjlnNnppRkJi?=
 =?utf-8?B?Q3lsU2k2U1A5dmdrWTE1emRkS2VOS0V5cko0aHZGdVo0QWNZRFVUem92OTA5?=
 =?utf-8?B?bU81dmVoSEtraWNHMGpFM0hMcnZ3R3lzNWFCQkExdi9QSWsybHZTN0o4YXNO?=
 =?utf-8?B?Tm9kKzRIMWJmL21BTzRTdS9QTllYbnd2cXRqcW15VXpLUHl6RE4reVBuS2xE?=
 =?utf-8?B?UExadGZXZkVjS08wRXRVRldySTBpRXpqREU5WHZLaExLYkY2dlh2Tmd2M1Nw?=
 =?utf-8?B?RVZYV0ZuK29hSUdyNlNTem5lUHhjSzhmL2xGa29mM0Z5Z2VOWll6L1VHalF4?=
 =?utf-8?B?dWFMbmdXZmJxQTNVN2FZVDFTUTRlb1lwMVpuRTVOT2JKQzB4TC9vM0pJeEpT?=
 =?utf-8?B?cWVUK3FRUGw5TThObkJEdFVlMnRkQXdvbFhiZmlsVnVTdEtpVUx6VEdUbDBN?=
 =?utf-8?B?RC90SjhGcGUyT1M5YUNpM1c5NEE2N0MvT3BqZGdxTnBLN1pZRS9rd2VBU0pS?=
 =?utf-8?B?Vk1UbXJocVFyYXBKMDdWV29qWHJsd0RQVTZBTXVicG9zbzBFZnAzQT09?=
X-Exchange-RoutingPolicyChecked: 3h6Hp0Q5VTEdSMggZonj5cM15keBj2bbMwWXqSY/cwg/MEC2V0CMUzkgB56dSyyOpjR5SAz7JSdmPGk5fcsL1nDYbBrI1Pr3cmaT180c96ZuG4kOH5XvgZW2P68IAG0q826a+90Kn87ig+ypErnr3VLBBUmkNmf2XIntXdP0XzbunPvyQdhUl7vbACL268YzuOJU5M1LK18Ah7I7DBO2aYTV7UGdx1SJiVteXH20ixQnnIBWdt4qolSvfB+Re9fhnsV74Km/FOF8X1lxwU7Ch9RtGwcBwTJ01TZ9ixD+nTOSJIcbJxvmTDXGeBKtojsTnuAw89BhVcLnLu3FWW9IWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc35469-9b98-4833-db35-08df29f573e0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 13:17:09.8565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4i7r0gk324tDI2NRhSrsFOMm+Ka6i5UPQtiSTompB8X7V6aj6i0yrn65Ff0ydgb0o3k4Nb2FA+PEBWuYtPVgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB280672
X-OriginatorOrg: intel.com


On 14-10-2026 17:41, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] drm/xe/hwmon: mbx_temp_valid() fails to reject 0x80 (-0°C) as invalid
> --
>
> commit cc835292455ece8a38adb02fe6e4c345fc3aa89a
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Add helpers to validate thermal sensor readings
>
> This commit adds mmio_temp_valid() and mbx_temp_valid() to validate
> temperature sensor readings. It uses the has_temp_sentinel flag to gate
> these checks and rejects 0xFF for mailbox and 0xFFFFFFFF for MMIO.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 1b4efbf4ac999..883a0ae1d90e3 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> @@ -834,6 +837,30 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	return ret;
>>   }
> [ ... ]
>> +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
>> +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
>> +{
>> +	if (value == TEMP_MBX_INVALID)
>> +		return false;
>> +
>> +	return hwmon->xe->info.has_temp_sentinel || value != 0;
> [Severity: Low]
> Does this raw byte check fail to reject 0x80?
>
> Since 0x80 represents -0 degrees Celsius in the sign-magnitude format (sign
> bit 7 is set, magnitude bits 6:0 are zero), it evaluates to true here
> because 0x80 is not equal to 0.
hardware will not send 0x80, so this case is not expected in practice.
>
>> +}
>> +
>> +/* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius. */
>> +static int mbx_temp_decode(u8 value)
>> +{
>> +	int temp = value & TEMP_MBX_MAG;
>> +
>> +	return (value & TEMP_MBX_SIGN) ? -temp : temp;
> If 0x80 is passed here, it decodes to 0 degrees Celsius.
>
> This means the fallback safety logic in mbx_temp_valid() intended to reject
> uninitialized 0 degrees Celsius readings can be bypassed if the hardware
> returns 0x80 instead of 0x00. This could fold invalid readings into the
> temperature average.
>
>> +}
same as above

