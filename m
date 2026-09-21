Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919894AEBE4
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010313; cv=fail; b=VS6MZVUNn+HH1Zr03Peu0RZWQF8lRYakxPhtcbHUh4LJQmW1RxExod+2wMiJnGuMw/7eCM7hmJ8H12gXfLyUtQM4pso2xz+723pFkp0lWi/EEGEG8ZmH6GmjVaxU2eK+nbEi/LgUFwdDq1jJ6zrEZ8P17zLqP1RJS/rWeQY1l8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010313; c=relaxed/simple;
	bh=tIxQ2KJO9D9LQ7yH2cS5RnZ2cSSYOcCzsyYSiZ7qFeQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b5B9gQ6ZaeazjID74Pp6JxKXC+nXTdofYFwgOfnn/J4LVa3Py0mNtrqvAhoJnHdMYuN8SQflxqNlOJj/AKxs5wVDyrX9ZbybWrypYFzIgCujB0BxJbJE0wlDoDT/WidNHolRsplveYo+J0tgtDR4EZRKhhi9VgK2yWnaePnikfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxTqHRGG; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxTqHRGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790010311; x=1821546311;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tIxQ2KJO9D9LQ7yH2cS5RnZ2cSSYOcCzsyYSiZ7qFeQ=;
  b=HxTqHRGGXnRnUxilgGQYMBx0cajG477KUS/YNh3vzJvQtSkMNwutp5QP
   SOQpEoDM0PjgvsKJzyrAB4ArZrqpgH/0XkgE3c2a6pByixqOKwKUmta1x
   ouTnKW7bX9tccq3j+DHKLu4pMY8/ErKNQXxwQ0akp9oTVr4+t2maUIdi9
   KwDHMyNpCKsjq+zD9dXNVPrTxvJsD30Ofxk1Za5ABB4KOzaT76PC4bUiw
   +nIeJHVqOLxJ7rqdemuT9AMx8gXs0/cF/9j1BTsL5z7qf9CHaAfIOqoxZ
   pMWBQ2SRBrq2jxTAG4w61SD+XX3WA4r4aOjI9yhgE5GPeGvdVfAsQK5Hf
   Q==;
X-CSE-ConnectionGUID: r/yQ9ezUShOciMVC7BPurw==
X-CSE-MsgGUID: HEIBU7efR2KqfxKWbW5wGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90666623"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="90666623"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 10:04:11 -0700
X-CSE-ConnectionGUID: lbUACAbDTfGcZZrRx10zBA==
X-CSE-MsgGUID: qswO738qQmmpD9pPsJvG/Q==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 10:03:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 10:03:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 10:03:53 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 10:03:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CapptmyB27fagnL0SgBl3DjGLwZK4kH/moUzr6ZwizxKH801IN40THUnE1wtuc8rcadq6rc2SwkXCBf2yYMHaKZLsN1fwTZMpirAeHQgnr29/Id+BVkM98VQpw6r2M2kIxBRnjNJT2gPSyItNRuVf6KGfct/xPSyaPnWCuwCwjDnEV+BrlTqeHGoxOmHTcfi6PNyRWh5Cf/tp4EliuXJXOfMgzo+k0d1INTT5xlAuDwO2fpAXoy3ifkCl9JYahdvrPVV65e9K5tGVst86w+zhydYWrP6VAJgYc5W84CMh3xEBSRyqfndRpdF+LCNiN6HEw5BgX6XooA/fDnJnCcoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DW3BYPC/jSiD/QfKCohQIn6D1Z1XSgtUXSygWM4Xhc0=;
 b=iDXWVl0SwwtbnpQtvTXo1m2bw4bhst/XIANEGeLy0FLrEshZnDtZzEpd6COk/jIcsUsyV2ZbU8yVgEnCfUZMW8gD6iCoXsgEe8ENZJqgFOCxwsCkIFF6av0FYde436sTEHJvne4IMJMIJZjZXSggh36LKitE1a0qXX98IVe9kf3HHeq+bRw1ZpFIKm/oa6vdGLx+YG9Xg1CHxUWS6fgX6ybtWBV5Q4A7867wdntY0SNnWQkmAK/3p1mK0NV+hH2DmV1I8179Caf2M53RPHkEqKzat5JTjWcrrkKpyByN7AiDa8gN5kS3uW9AM5ElIqf63T2gkxQFEL79GjWksKXJTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CO1PR11MB4803.namprd11.prod.outlook.com
 (2603:10b6:303:95::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 17:03:50 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 17:03:49 +0000
Message-ID: <0cf55a0a-4bfb-46c5-8718-410ecc860e96@intel.com>
Date: Mon, 21 Sep 2026 22:33:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/24] drm/xe: Add device flag to enable PT mirroring
 across tiles
To: <sashiko-reviews@lists.linux.dev>, Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-18-matthew.brost@intel.com>
 <20260904214039.938631F00A3D@smtp.kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260904214039.938631F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CO1PR11MB4803:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b738a9-7d8a-4fa4-cc3a-08df18024e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RMS+s/MRIX3eo9W5CVdjvFmgyFoVBAXELEQtiaXDjGlwwT0MWuChJfDf69FiZOuzFXK4u1oVayfhwVpFkgN2qANNsF/ScTr10lVgPY/3ZL1aGSfjK8xcKMQBAP4vz1PrkNEZYqT96WOq+A3DF8odxPEAYnJleGkVb3dm136Zf3tCWV19u2YvLp6bYbbAUQ/jKFTt7rIrwoy+cxZQqr89aH8GAFyuVPAcQYc+OrDvW3mT9geCZwejRSZqe9x7cZ7ZK2lNmS2IbpU0hl2XiraEU1nJ+qRKTamXS4UnYu/7kFV2oM09wQ5TpzuBVmarwDp5CUjJLQFIX4xQL305Pt9t6KUrK3a9GN4+we1KSJ7UypV6kzOjs6UHdmoQgl59nOgSPCPHEHz8dyUXlO/yH1ZBgHbpXpzUfhB1eYJQhLwPNOsP/xXhRZqwEH9PBvPegv28+tiSVc8FKIuM+0758uCSsIEyJum8Fn7/n1M27SYC8CNvYJyIKLq4z4NHAEMsxASruYf23HboTXndtNOTThz5/ffRl+Z0gI1B5d9bnG3YGfXBCFr8hawSQQ2UMpo7gMoxLj8vawh3CC1I25Xp0SXGwNSD6pvI0Jbn6lH0YHjIMt8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF691668CDD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUh2Q1I2ZSs4dVVQcVdLVVorVVVEK3pkRW5uWWxKSTR0Q0hoSzVFVTJOZEVq?=
 =?utf-8?B?MFdVUWVLRjNId0RZS0t5ZWpqQjNqeW5wUmVvTjZoN1dQd0Vza3lvYlNCRWJq?=
 =?utf-8?B?TzlnVUNaNjBZeEgrMmZORkw5cnIxT3VYYVEvYWF1NEYvVmhramZGY1FJaFJ0?=
 =?utf-8?B?ZWFvUGRPSC9Jcm45alhiK090a3JaNlRVMTVtNkxqZE1hSlF3N3FaOW1IRk1I?=
 =?utf-8?B?WEM3bmliWGJpaGY0cHVidkt6Y0ttbFJTSGkyenl6c2ErK3FCeFdnVEJDOHZ2?=
 =?utf-8?B?Vm0rK2dqMkdRZE9sRHRVN0l2YkVMUWl2Z0VKWDFCZ2VVZ1cyUkdUYVMyNmp3?=
 =?utf-8?B?S1BMdkNhcVJYSDZNMGZMUFZRTk9YcjAyeE9LaVMzQ0lzK2VYTzRYOXQ4azNZ?=
 =?utf-8?B?SjBxN2dvM3BxU0dHczlZcFZ4UTVFL1psaGtjdlRlU1RoMUx2WmRpRlAzMmU2?=
 =?utf-8?B?ZkZQNjhHOEhLMXBMK1VkQnZ4bHdVRkhqZTcyaW5UYlZiN09hT3h1WFhYNGlE?=
 =?utf-8?B?ZkJhcGtjY090bmpsSFdVMEMzeEpkbmwxUmlSZmhOMHRodkhMOVU1OGY5RHo2?=
 =?utf-8?B?UGQxczFXK3BaZFNVSUIxZ2JhN0tUTXA1THVJSGozVWMvY0MwZnVBNjZWV1BU?=
 =?utf-8?B?WGtBUmVlYU12SkJwY3RTT1dHU0d2ZnJXKzFTNzdUWTlvZE1sWkV3QlVwZ0lB?=
 =?utf-8?B?NUhXQnlIeVRaQzBsYU51QkFGdFRwc1FxU3kxdk9Qd3ZlWVZLTVdOaUg1SnNL?=
 =?utf-8?B?TlNGeGpLZ3Q2TG93R3NKaU5ocXFOaFhTQi9xS2JIV3M1dEZpaVdRTE1UdGNn?=
 =?utf-8?B?OHVoc2t5ckllbWFFaDBiUGExVXFpc3NaTjU5cUtBRUY1WjdHRjBNL0JKeThN?=
 =?utf-8?B?WUN6WkpUaDNYVmFLTUprY2o1bXp3aGxyOHVTVVVvZE1NZkVFVmVTekxVd2J2?=
 =?utf-8?B?cmVRWGkxQVd3RCsvbDdmRmkyZmhwamxEYjcyZWs2bXRhazF2M2xZV1h4QTFL?=
 =?utf-8?B?SDVCYkF0aHU1ejNLMXNSOGtVZURlWEpUbEdYVXp0VG5kUTZHbWY3VmRHSHdT?=
 =?utf-8?B?ZjRvMEZoRGRYbkZWKzUzQVBMR0VKeGVFeFpGY1U1Z2hPdnJvRTgwTEpkdk1P?=
 =?utf-8?B?cTVaZlJzTzRPNnhpdDgrbVFmZ0FBVjZIaE5WWTBsRHh5T3lHNjdqWjBYWE5o?=
 =?utf-8?B?aWRzTlNvTFNmTXJnYlZNcEZxQlU0NlI4aGlLYndDRjBMc2Zhazh3TjhTK1hG?=
 =?utf-8?B?TU1IRis1NXFxVGVIbTRGdDA5Vi9pdW5HNGpka3JtUDB6dUxOdHpTQzJUUjZw?=
 =?utf-8?B?RGRxWFg4cEtIUmgvQjBEaGkrZ1d4OHZzQ3Q1WGZnZ3B4TEY0MUhMMHFsakta?=
 =?utf-8?B?Y0xSSm9kOFJuSzh0bVdBelV4Z2paRnh6VjM4Y1hud1N6MFdXVURSNWlJbnZh?=
 =?utf-8?B?WHdEcGdDcFZPVTJvQ2V3M05aVzFXTjBYejJVME1FL2VHbG9kREZCUEFtK3lO?=
 =?utf-8?B?RUU4bGViYVB3dW9xWXYvUCswUmNFdzhTS1poMUs1THlHYUc5bmZBQkt4VkpM?=
 =?utf-8?B?aVE4ZFlMaWtWU2l0Z3QrUTQ1VkQyZUVSV3dXTC8rWGNuSjVsVytFVGJlUmoy?=
 =?utf-8?B?WW1zUkdkUzJJQjR1T2hGMWxKVENZUnpiYkMyK2tIODhRWmhmUGRTSmZ3Q2JF?=
 =?utf-8?B?MGZQaUUvNENQUWNoUTFITE5yRldxejdUNTRRaVZYeHVPYm9mT3ZudHhaSWxW?=
 =?utf-8?B?NUFKWFJqMzlBQVlmTTZldDFiTURWRkwxd3crZ092VmZURithYlB1bDd4WUxp?=
 =?utf-8?B?bUlBUDFRdng2ZDNzeG5NNEdDMUh2S1Fzd3pjL0lZZDVndjJheGVsMXBaUFJh?=
 =?utf-8?B?MTIreFRTN3pxMjNOOW5yTGV5TVArSzI4K2J4NWcrSHUwMm1zcUJQZUhzcjh5?=
 =?utf-8?B?KzROMHZteW04VTdtY0xWTDNKTlRRbjBYa0ZHaXJtR25DcEJXU0xZWk1MSmIy?=
 =?utf-8?B?Y2Vpa1d3NHdlQWxRcnpWRytrRTdlQW1xTGVBNGFJaDFXYUFUWUhzMW9WaWxX?=
 =?utf-8?B?allza0NhcGxIbVI3cUxFTTJFMWhGeTRoUzlUVXJOTUExa2dlQ1hHWnRvMTRa?=
 =?utf-8?B?djEvekl1cmtRZGw2NzI2WHl0K1ZKbjBuSTNFdDFjZDExbm1KOE82RGJsRTgw?=
 =?utf-8?B?MXZtQmkzRHI1N2I2dmNCNTN2dmo1NVpyQUtUQ2ZLU3JlSmM1ZzZIN3ZRek9o?=
 =?utf-8?B?UEJ3U1E2WnFSVjNScjI0Y05ab0NyejQvWEJ4WE85VGdVRkk4WVZXOUdnbW1I?=
 =?utf-8?B?QVBORXc0WVNCS2pOMks4NlhmQkFuWmtBYlNrYTRGRDVjWjVBc3pFZ2JoUTN1?=
 =?utf-8?Q?NWyYIU7rlPxL0AIc=3D?=
X-Exchange-RoutingPolicyChecked: 1es4po8h58N82KP5nCjy5qzz+GnAbvs06ckdjNnHeSM015aDe7xFaAgnWlomNo3xjh+z/jjcXJTixLKUKW4xSLnB9F24LFIX+o1mi5ynLsiGT3tzNF0sxiufvW8+nA68zhtl1HSLZXJnLqa7DyUAksWs1eruxOQyRb48EhJQsDjKsUOkZ99XvapVBAUQC7jEHVDjugYOjTCdAE8SMAyGu7jPQud7s91OMxY0M7ZgF3TLeyI/IaoHri0cpHLbf7N7ZkyMPBdyhXGL72EFaJ6r9UEK8OgydjzvVqOzupQP7qJSvZgKY97NvF64/FSIoiIuVq9fL4w24hewfmg4ZUhQKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b738a9-7d8a-4fa4-cc3a-08df18024e80
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:03:49.9007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pv1yljJXiG/AxqoaArghchXvI7Jpmimm/nI2+dQYxxhFNeCCJ2l+jimwaZR3UWeEsnjEcQht6r0q4Bld7VxLed9uV3eF6+UnKKy/d+7l6Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
X-OriginatorOrg: intel.com



On 05-09-2026 03:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unnecessary allocation of page table roots and scratch structures for secondary tiles when PT mirroring is disabled.

Looks valid.

> --
> 
> commit 34b539e899a7643dc15dedad6a3cd229e0c0f4d5
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Add device flag to enable PT mirroring across tiles
> 
> This commit introduces a device flag to toggle page-table mirroring across
> tiles for memory bandwidth considerations. It updates the VM creation,
> rebind, and page table update paths to check this flag and fall back to the
> primary tile's root page table when mirroring is disabled.
> 
> Link: https://patch.msgid.link/20260228013501.106680-18-matthew.brost@intel.com
> 
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
> 
> [ ... ]
> 
>> @@ -1738,7 +1748,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>>   
>>   		for_each_tile(tile, xe, id) {
>>   			if (flags & XE_VM_FLAG_MIGRATION &&
>> -			    tile->id != XE_VM_FLAG_TILE_ID(flags))
>> +			    tile->id != XE_VM_FLAG_TILE_ID(flags) &&
>> +			    (vm->xe->info.has_pt_mirror || id))
>>   				continue;
>>   
>>   			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
> 
> [Severity: Medium]
> Does this code unnecessarily allocate page table roots and scratch structures
> for secondary tiles when PT mirroring is disabled?
> 
> For standard user VMs, XE_VM_FLAG_MIGRATION is unset, meaning this if
> condition evaluates to false and we proceed to allocate pt_root[id] for all
> tiles.
> 
> However, when vm->xe->info.has_pt_mirror is false, xe_vm_pt_root()
> unconditionally returns pt_root[0]. This means the allocated pt_root[id]
> (and associated scratch page tables up to vm_max_level) for id > 0 will never
> be used, permanently wasting VRAM for the lifetime of every VM.
> 
> Should there be an explicit check to skip secondary tile allocations when
> has_pt_mirror is false, regardless of whether it is a migration VM?
> 

