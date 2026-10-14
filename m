Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E314E73A8
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 10:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972985; cv=fail; b=mEEVorUGHOJZlZphjBzUbLvrfW0SfJUcVTfOAZ//bW0aVI9pI+KB+VbxhkSl5CcYUnmmZQrk8y3yg+uEycd+vV+R3WlYJKTY8FWrLW42yy6baZ44GTN+ZNfT2rSNsoLmWcZbgwHMVa/30IEkCZJNdF8Dt4IRK9PPQlkYPLOXKoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972985; c=relaxed/simple;
	bh=NqMLYvkXizxN5+7eCmRsxDWBWV4HTQp7NeCTzvAekRQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DBYnr9wISiNWjRrbRtTz4nfdFczx1HtkEbNiIXxxVisYUKvfHhZYLwJ1MPVXcZejb9ripb2OmsuWja5usReYTOYlIqGiWa418tn+E/cRLBoUluziavzSTDUXRrrV/upsjDlhuN0WA3jyLJ98Jx5bE8qZor8Z02MiQZh6q4vxQbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRNhy/Ct; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRNhy/Ct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791972978; x=1823508978;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=NqMLYvkXizxN5+7eCmRsxDWBWV4HTQp7NeCTzvAekRQ=;
  b=CRNhy/CtJP4PnVfMBiBKGV/o8uh2XcusFlJwRJmrRZHYfMIF7lDl4OJd
   LmrSvq1fHGA/wf9oo5fsTd55IUTWNFKxwYt+SMoW8CEJr0MctppHWrcqn
   SBOR8BiGjn22YUSV2kcKnptU6OKQFGUjEzsmXgKUJ6I2k5/Xxr9J7Zqrc
   3lpg7AMdnTaFd1yFb7afcL2oU+t7zqKaZBW0KdRy3pE1oRiUUdWdpMhTw
   iFiLjNVwJMEqxY4SSv4agBPBGYY73pwCqVHtrBUzVvaddjLPdRDyRxvqA
   pGEvmVINJr3oZU0F0SjWm28PtOhSzs0bs622SRrsyk3XqXuaP3HyNobJ1
   w==;
X-CSE-ConnectionGUID: RgElz1lrQKK4Tf3Dfd3NCw==
X-CSE-MsgGUID: WnsnuoYtS6a58760gWjuGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="620470"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="620470"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 03:16:17 -0700
X-CSE-ConnectionGUID: V1qpjXlIRJiqvHYGeRedQA==
X-CSE-MsgGUID: ndiOjdhtQuC2mGlHOXE15g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1760682"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 03:16:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:16:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 03:16:15 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:16:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAhTak2NGC7j1ta/IHKgNgf8MueC7zePGvawORnhbo/eElZiTjYSmyfsxWCjNyCE2h8hclbYOr7K8+cvfTWwRil4Cnlza3xvWJjl2m8W93B1xA1qdv8cNb4JQIjG0g2QSnU4B86tuTmI6K5KQsSpyV/NW4M8RrBp0OG+egpA0EJbI0it6r2fp3vIwrdT1bPF7LnZAaIsCJ/wbQfDiEFdakzsOaKELpQ3wx8mzHeytBYKpQm3ZNLiqoOjCl9k4LVKurt2UZii27UxUszSz85HFKrmDADtaGZmFyOfAOC+FCQaE9ZUZjadWM1oCy/yeDZVdWEWHD4WfK1xvjd/3LMs4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8OjuuQGZ9AnE8l1a4DWGW4de7L2qxO1j1xeg7NaKlw=;
 b=fscLXnpCwWXfo/il7xLdM1wvRDwD8o85/gYXr7VAx/JAq+cbiXMPaX5JnHvQZny7iMwq4pqS6T9llieS9FQLfM4/enUYiDg4fgMHir4Gyz+m++DT05xyW6BchJOqQ0z8p7m6lf8PkUciP1EARmtKj2YT9D983OeT/7u9Dt7atPRD14/Glj+3Ya93Hx7FwNif05vAQ5or7xCQEdDmES+ib0//xicMSgYTGKHTdX4A17oHjYfYaUe//2wks+yjWXEAiMjbgbe14Oy3fAPdC5mNBa+ints/+1yeI7TGIVKko4cHa7yjJfycJhxdhjwT+jrHJR+MxyvWZu1/C56htG30nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by SJ0PR11MB4800.namprd11.prod.outlook.com
 (2603:10b6:a03:2af::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 10:16:08 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 10:16:08 +0000
Message-ID: <71ebf73a-df37-43a6-ab8c-c90278a59a4b@intel.com>
Date: Wed, 14 Oct 2026 15:46:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 13/16] drm/xe/hwmon: add PCIe temperature support for
 CRI
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
 <20261013184939.694945-14-karthik.poosa@intel.com>
 <sashiko-outbox-170362@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-170362@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0194.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::6) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|SJ0PR11MB4800:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a6f131-b179-4141-eb9b-08df29dc2a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|4143699003|261009223027099003|11063799006|260925022911599003|260925021911599003|22082099003|10067099003|18002099003|260925021311599003;
X-Microsoft-Antispam-Message-Info: IBUERUnh5hxeKHIRkRIkKtTG2ryXPl5LwHBY3xPOF0KfgklAIdP+p2zk1hjKHlxWEyJTNzOXjAQbejhGTJQkWHbm/R7egL9Xl9j0bJlAZjJmFZUOcD2LNneRwCnY1qB7dDRiufHfJy0ExWdq4gz7r9YIgTJkMPG0mK1acUmdCBF+lRR88rIVAZgkHiNJQW2/LU7Fjua7i91nuWgn2mZEQA400A/n64943rSY033qistWe7k0tpZwpfxMgTfQnB7vRi0AgUeU1s1yKVAiou+ENdalYvLDH9gAgXwclHBwBtT2jjD86nMLrZr3GqRHD0MThRhKV9+F4bzAWBUP/pQaxbB4cEWtRufor6/gwfsW+tavXp/TjQq7oYZgufF8TOG5mqEo/834IXaGi8HpfRIl2wB9Blx9Jl06/x2SJov/bQOfJIYJCobXALM4NUy5XJRN8Uix7clalA5TCGN4tM2BMERgRPIsX645SqNHHPGbgvTdZ/T1Rf8DuSbvzRrFrVraDfa1VLvZ/2I+gLkdFxcfp6L5FDUrSLyW0sjNCao8DetoUu8FUO7BdxNO888Z3tCkMcJrlRl6/FQOu66iADgwg+ryrquyVDn7Ic9IAd+As3vwUGyDJL03YhUWVTMUO1R+fsLRltl6vHbDlHgSxckofPup0tjO+9LLSvTcm3ErsBw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(261009223027099003)(11063799006)(260925022911599003)(260925021911599003)(22082099003)(10067099003)(18002099003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVFKdzB3NWRDZjF2MmtVTHFjQTdpR1R6WFllbWRFWDNKcms1SkZ0SGt1eVI3?=
 =?utf-8?B?SFpYTUNXQi93aUJsanVlbi8rY2RmaFVsUGRzUG1BbmZ2eVhoaHhUK3FiNWdW?=
 =?utf-8?B?SlhrbzdJK0JOWHBORjVxWDVzbUFoaERxbCs4TndQV3kyNGhvMEp4a1NBQmZk?=
 =?utf-8?B?QkxlNkVXbXhRVDdXR29NMEJCOURhVEVUWUx6UHk1b2kxR0kzeHJ2OHFLcVFq?=
 =?utf-8?B?VnVLeEJLak12cGVzdlhCZDVXejAxMXJramdXcitxQkpDaHhnc2k0dUpPTWdJ?=
 =?utf-8?B?YVJJYkZkR0t1YStWMFJkU2d0Y3JMdm1OTGVHZmoyREY2MGptMTI0YTJpM0I5?=
 =?utf-8?B?QVhHYjVkL2NuSHFxUUhWRGpnTG84b09veXF6MndzSjQ4WTh6Mng1UERXK1N0?=
 =?utf-8?B?Z3NDZ3pPbFplQTlzTUwwZHBjaW0ycVowZDZmVUNQVWdJMTJWWVVuQkRVSHBV?=
 =?utf-8?B?NkxWazVGN01Ccm1QMXlkZzJ5WUV2SlBBeVNOT1BHRlJYMVdsNkFOTzc0OHFm?=
 =?utf-8?B?YVA3R2hBQ0lnN1gxcXh0Wm9ndWxPZ1hJeDBvaHc4UWFiTlRTdVFnOUFxd2lQ?=
 =?utf-8?B?RERIR1NJN2ZEeXpkdi82aUdNTXJhR0RYU0lncDFVTjd0MHZkWDR5dTRma1pS?=
 =?utf-8?B?dFFHMmVIN1ZCWGUwbEdQRm8wK1NXWHQyVW04enlsaGwrUCtVWHM4NTJpNkZW?=
 =?utf-8?B?VDFjdlZFa2R2Um5qVDNrTXpacEIzVHMvQWljcFRmTjJFS25PYTI4YjhTZjFQ?=
 =?utf-8?B?UUZFOHB2YTB3UmtwTTdkU0pXV29YVlZLcU55MklvNHZlOHRCYmFCcWx2Y2Fw?=
 =?utf-8?B?QkZuL2pUcGx2SXhzQmZ0TC84NzdsRFFnVGR2V1pzL3c1Q1hTRkVWM0hYRDVn?=
 =?utf-8?B?YkFnWXE0UjFkREY2a3hxL3lrbis0VVp6YnhIN0RGQ3lRVjdSVHFQVkpvQStS?=
 =?utf-8?B?TXFEUFB4UjhoaHVzRU14bU1WUmZaTkNTWGVOS25tN2FNWUNJRlFzWnpDSlRi?=
 =?utf-8?B?QzA2STdEMmFUcnFZU1djeEpxZVcwTGRTMFR3aWozZ1FBdzgwSWdrbm9xczZ4?=
 =?utf-8?B?eFVJYTEvcmdHTzFVejdKMVJtS1pUOG1WYzl0OURzYzVxcG1RYm80ajlQVkFJ?=
 =?utf-8?B?ajhmVDJCMUpTeUU1TlV1eDN0VStkekxJc0ZrQXEzNGxBWGZnSlY3clhvSWI2?=
 =?utf-8?B?Vm54VFVhWnpNcG9lTXhyQmN2eDdDYWxUSEtQT0htK0VPb2U4QzFvWllPZ2ZM?=
 =?utf-8?B?RFVMS3U3eTltc1laNER3Z1J6YlcwcExiM1I5UzBPUEZ3citnL1hNVTZiZG5w?=
 =?utf-8?B?c0g5SnFYcHQxTnJWcjJuWDZVZGw1N1VTeGhoekd4S0VmYjkzU0dKWVVWV2VY?=
 =?utf-8?B?Z1VDWHB1aG9hZjZYTVdPSy9vVW5aNEgweWZOTnhsQ3RsdmxUcmdFR2tWK0FV?=
 =?utf-8?B?TkFkZ3RrRmxwdGRPdXkzVFZ0MGl6R2VNNXEzbHIrb01FTXplR3Z5dkcvdHE4?=
 =?utf-8?B?bGJGQ2FaV0NrTndReE9YZXRVeHEzK0t0TWNYVHMraGxnUTJncSs2S1d3RUxx?=
 =?utf-8?B?RVpJV1h4Z3IvNGJxUU9nMHFzOHZkLzgwSGgwT0J6cTdoc2t4U1dxdFVDYmFB?=
 =?utf-8?B?N2ptdDRSbWlmNGs4c3RNR2VabWxTTjJtRU45K2cvQUdXdnVRL0tqZSt2TjNL?=
 =?utf-8?B?dEdwL3FKOUE4Tmo2Q0QyeUZEVUJiN2hvU0N6dGJ2Sm4xeUthQnlYc01lSU91?=
 =?utf-8?B?anJvY1YwS1VzdWlrMlRPTm5TQ1dKZG1VUFNabUVqc0lDOEd5cjFHUGREWEF6?=
 =?utf-8?B?Qk1FcmJPOGg0Tm1pdlZYUjNFSHdoUW81MVk2Vm5PZ2NjbUZreEVWbkVZRWY3?=
 =?utf-8?B?SjA3Mk95bXZKblVtT2NpZW9yMzA1MklISTJNVmFTOUtiZFBTdGM5WWpnekt5?=
 =?utf-8?B?K29OT25DbVA5UWl4a2xpdEIvbjBoVTZYUEh3VGZtYjUzdEcrN1Q0aTREU1A3?=
 =?utf-8?B?WW1jUXBPTXpWTVRMakRScitOY0h0VVM4VGFad2Q3QWdVbFp0TGhNOXprRlpw?=
 =?utf-8?B?bUlVU1ltVXJNVk5nUkg4TFZVWW94bnZPUTlYRmFUcFlnWS96YnpDTzcxTmRP?=
 =?utf-8?B?WGp6RU82Q2hHdmNiSytVZHhtRHAvY0g4c1BJN0ZVcDZVNnlMMEZBNXJ4dkFk?=
 =?utf-8?B?L3VQWkJ6NTk3VlpCdFdrMmJzdnpCd2N6cXUycU9XTTdpRG5zenRNbDQvNFNh?=
 =?utf-8?B?ZWdDNldSSkt4THAzUHA3Rllyd2ZZek4rZ3VocWNGUlMxN3F5L2VPWWhiaHlx?=
 =?utf-8?B?UEUzbklScW8wYUQ1L1ZLSndDUXRtZ3drWUF3eGpyU2pBa1lJZmd1dz09?=
X-Exchange-RoutingPolicyChecked: 01IKdtAw4OUpmeAwbEpvPqwYorrANmWmnE2ZOG7kAM+Cv99AKkohVc6sBlvHCrWWVNCAPE3wrbYOKao85kFwJkER8cS2oGMsf5tXc2JvzjtI4oc1JDPB9iOhk2A7KXXYEKaXbmU+5szeoIJYRTEoD7pomHGSoRcuMJYVhbnC//YGVIXQhWEMKELaWGPBbFdjMw1H2eV2N6p4dnxbmDoNPE0MoTOy1hoFCqKUjpqYfGS3xggv/FSqT0c+QQE6CBVQshi1c7A/cn/3iOruf8YTJvMdWPYQtRDu7ODHHwFcruu03k8877Aj58x95FVn78MsVSoVmqi7v8PZKKLMhaPw7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a6f131-b179-4141-eb9b-08df29dc2a04
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:16:08.5123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOq/FvbElpbrq5j/Nmxe4qiaEG2aPOnbdtpteUVkJT/v284QEN7rOf9fWYqS3b5OUtYsRxJ5D98fhCiR3XFblg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
X-OriginatorOrg: intel.com


On 14-10-2026 00:29, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] hwmon: pcie_temp_index() uses strict equality for CRI unlike get_mc_temp()
> --
>
> commit 4122768dbcd48bfed72f1531064229c2807857fd
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: add PCIe temperature support for CRI
>
> This commit adds the PCIe temperature sensor offset in READ_THERMAL_DATA for
> the Crescent Island (CRI) platform. It refactors PCIe temperature handling to
> use platform-specific sensor indices rather than special-case decoding logic.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index bccae2ea91fdb..3c1f6b70c82dc 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> @@ -1016,21 +1019,30 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   	return 0;
>>   }
>>   
>> -static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>> +static u8 xe_hwmon_pcie_temp_index(const struct xe_hwmon *hwmon)
>> +{
>> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
>> +		return CRI_TEMP_INDEX_PCIE;
> [Severity: Medium]
> Will this strict equality check cause incorrect PCIe temperature readings on
> future platforms that inherit this mailbox layout?
>
> In get_mc_temp(), the driver uses a greater-than-or-equal comparison for the
> same platform:
>
> 	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> 		start = CRI_TEMP_INDEX_MCTRL;
>
> Does xe_hwmon_pcie_temp_index() need to use >= XE_CRESCENTISLAND to match
> the behavior of get_mc_temp() and correctly support future platforms?

This strict equality check is correct here,

sensor mappings of READ_THERMAL_DATA may change based on the platform. 
It may not be same.

get_mc_temp() shall also be changed to ==

if (hwmon->xe->info.platform == XE_CRESCENTISLAND) {
		start = CRI_TEMP_INDEX_MCTRL;

>
>> +
>> +	if (hwmon->xe->info.subplatform == XE_SUBPLATFORM_BATTLEMAGE_G21)
>> +		return BMG_G21_TEMP_INDEX_PCIE;
>> +
>> +	return TEMP_INDEX_PCIE;
>> +}
