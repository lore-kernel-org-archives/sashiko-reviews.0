Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D42378833
	for <sashiko-reviews@lists.linux.dev>; Sat,  5 Sep 2026 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616335; cv=fail; b=BuBRypojKaULut5jMuWe67XLOJpzwxHtwOVaGmI89kChbYpHxBXReu8wHEvM33jrn7d+SG/csSymHKQpew37ekh2PsThImL4au8hWUaeWC+fhLrkfl6PBiLsVqG78f99+cWL7+aAsEettlxfUv88I8hdTRxw5bKFALIRVMBF/oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616335; c=relaxed/simple;
	bh=UaCoVIPnte508ipr/Lx7CplifDOO7r2RshWHQ+c5lxY=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=eKbNLv2Wxr0ArOJCyMdL6BVVJDkSIX9vglJuGpCqHIZSQeGtzcswJqlGCLfr5iWeCyBHy1feW0TO86UrDgXLQ7+oaVUJBVMBPWIP06jYNKwF30ykwmjaClyf71pnCevhi328XEmq38V9MkSqTCO+XoMOmjrFBBXpKx2bD6qYkjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7d8BfwA; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7d8BfwA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788616333; x=1820152333;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:content-transfer-encoding:mime-version;
  bh=UaCoVIPnte508ipr/Lx7CplifDOO7r2RshWHQ+c5lxY=;
  b=f7d8BfwAlk4d2AmTuUkK19g8tV7ekkMEbinDbOlnTQBy7jnNNmzcAImW
   KPK8XeT98hYWx3AKDFnVEB5IYtbnBFvh2MiynbDn/h+K3HnAktjXVZOuN
   skliPF8j/WLnv9recKSqmQ0/C3fMO/QWjh1t2qiagwn8boLsXFBbgPegR
   dN7tQ6i62VbHqnuqL6AyUu6bDhOgtcA1mKGHuVjzOW5tnskU4Qi9NHd2N
   0Vo++dsozy9GyMiwBpCmUV5j+kGufQSTnKEeSzvLnhfss7xsriwXSlEfr
   rGn7iaVag2iJ4AmjXdRCd3bgdBm0L5E/gheCIa442kUSZ6oKFP+YfZn8t
   g==;
X-CSE-ConnectionGUID: jd+N4aATQoyB5Qys8KrB4w==
X-CSE-MsgGUID: uLzTLYCDRr6H+JNsPtyutg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="76651423"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="76651423"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 06:52:12 -0700
X-CSE-ConnectionGUID: DoGWMROzR0aIx1OpQ+mHDw==
X-CSE-MsgGUID: 4bUu34sGQZmVk5GuvhuNRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="267725091"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 06:52:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 06:52:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 5 Sep 2026 06:52:11 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 06:52:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sczzpRvnlO7qYnSE16G6yazonirk89aQ2h3BabOJ5Gqws0BWwMuKXSJhojEoitcNBrx3qUvZxHpMqsp4Z2nTIlAuC5n9MHPnaT5xx5i4mLS8shFu1Tmvpn0zaDp074DlZZ3x5hzrAqTKxquswJx2YTXKjiRM32qsenglcat06jg1AKyayoudtlq6/tyjUZte1UMqwABwkooJqjH2SxzdYT0iRzf+jioEkNe+7nqa8rE4yzB6oKZZn5clx7UvqLwtBednpDPk402sfbf5mLD0thRIi5vJWJHh2Nz9o0NdmOQ+YM1NM9Qv/liCfdHpRxKBoZoEv/FbcuDLQkRpk2ysUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sVSb5MdEi3RbywoFxp3zgr3322vh3y8Z0OTGItzg0U=;
 b=Og9ab+YzCee4duUvddW8AKce/8/ux7lwGI2+pW19N4beNSe8yl62S+wtVao0nNjH9r+8xZ/UbydZTpNCKhZSRNQM2l+tm84NHkuqgsxfpJfnoXfLRmYMus8cS52atyaJa46JDUhpjknZN7zMl/QrVBzYTgy2L1KPVg2Vx3/IkBkdaAlm+iJ0HsU0jqFWqmy/IxSVtvXlDvWRdzTog2p6TYvn3/YQa1rZt0pgSeu6abgFDqlbbvoSgXHwBxvXGbYcSXOKJOmWKJVAo3f1dC67zffDQb6a1iAwno36auDUjQJdFkxn2GULItnUbYEk4NecYCydyo/pseqYM0k7Z6YMIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 13:52:08 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 13:52:07 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <sashiko-reviews@lists.linux.dev>, Michal Wajdeczko
	<michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/xe: Keep reference to device descriptor
In-Reply-To: <20260904171419.E21DF1F00A3D@smtp.kernel.org>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-3-michal.wajdeczko@intel.com>
 <20260904171419.E21DF1F00A3D@smtp.kernel.org>
Date: Sat, 5 Sep 2026 10:52:02 -0300
Message-ID: <874ig3956l.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 19163060-bf2f-4340-8073-08df0b54e044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|3023799007|11063799006|56012099006|6133799003|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: am3VR+wGMW/pPjF39ChNX+vVBG6BfmE0j0E0wVAeV7AVRBN/nIQS2XCxhHETmk/HjJzeG8hWH+MQ0/kKnBhms2KDyHZqctd6czd0tPTiTW92rv2AXd1XxBPwhe006/M0L19ewhCLUNDL0ZB1uJloJ/F64YSefvn/OMSxW1GiuYBcsxbXEm0lpcEMxVs/0PxVtS+64uldzw9l37+qgnt+arvrbYVt0idJMLT3Ji9BE0iyqpYKtJOIhX934D/oGIREAPPuDX/BZ4XbYOqnH6rxG2G9sVnMgBFQ0eLiHz63wma1VC/oKO5Q3bKE0OOprKyVhX6q6nZCxnM85FlIPROf+oigy1SK/fBwtGC9f7CRw05tKBSE4nlW/g3AGEdA2RsaO1tUtJs8VGHnGk6xQyc9Rgxs/2prpCG6AF2B9in87tZhNiPP9ajE+qb3I8yfEJP/ruI+OuBYVx07c1eFS2T9+Nc17KQ0fhXBpnDdV1b6vYagfWFlSUvzyvBGTbaYt18Ei04+3Ccivv0d9EiJJ4BxR+dNJdkGHUEwk0Wm9qgPW2npp2QNY9ODaCizm8ak724dTx7g+EpF5WJL3iub7JtZZhyM29a4FrAIqW2e2c8YVLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8287.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(11063799006)(56012099006)(6133799003)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFVsNzdLbzdQYk4yKzRZenk1aFMzMm02bWliaXpuNytnU3lMM1hKODdXSmNV?=
 =?utf-8?B?cG12U200bXQ5NlJudGthNlFVRmsxMS9XWDJmcVpHczdTS3RmYXN0emVMejd1?=
 =?utf-8?B?TVJLUHRkZitJL2lwTy9rZDJXNzlaK0daL1o2SDRzQWJmQVJjMUs2Ky91MlVt?=
 =?utf-8?B?cklQNjZheVRhNVl6a0ZtVnNnRUxDeWlJRit6NkswU3JtR3hwVVdKb3g3dTVL?=
 =?utf-8?B?Vlg1Sm9ienRQQ3o0dUhoUE40NXBxUjU5UjhsaVBwN2NNT3hSQW5IZDc4RWh4?=
 =?utf-8?B?R0grNzBIMnExcWN0QmQ5RTBmWVVETGJ1bndYOUFNRURjY1pNam5JZnppTGNy?=
 =?utf-8?B?WFUyakZoK1RNK2dGR1BnR0xiVzRGS0tjczcyTzF1cnZoZmwyMDlGNjFQVWdG?=
 =?utf-8?B?QXJ5WmxFM1NwUkhTQ01aTktQYzJmZ3NBZThOaERRenV6QmN1S3Ztd0NKakN1?=
 =?utf-8?B?cXFkWmNoWUtMMHFPeCtXbTN2dmlUNlR4NGxROERCck9mTmJ4Y3J1d3VxNVdn?=
 =?utf-8?B?eUpLK05lNmU2YzZ5bjF1YkJWSEhza0V1V2ZKM2hyUURKVHFNQ2h0Ym5TT1RT?=
 =?utf-8?B?MXZNcEhBcXRKczNhSEVEWlg0LzUrZ0JlRHU3K1NxbWFIK3ZsczNHc3JLbUJQ?=
 =?utf-8?B?QVRGR0JZR0k2a0ZVS1dFWFpUS1hPaGNjTjF0aitaSEFWSTNjbEhkQnMyOEc1?=
 =?utf-8?B?VDIvNlhBNlR4SEpFRUxYL0ZFQzlyNVlQMDZtaGxBK2Y5Y2RKQ2xvVUo1dURr?=
 =?utf-8?B?YTg5eEd5UVpocjlHSllDOTg0RURlMUc5NjhvL2Y2MTlyVDlHUi9ES2NYWUNZ?=
 =?utf-8?B?V3F6SDhyOW96cFRSYXNueFRVaHJjd0w0Y21MUXpGd3czUkdKZ0M4YmpiWGtS?=
 =?utf-8?B?OEYxd1lON0tjZUcwaW9tNkxtdzMwczZ3KzFjWlYxSjUvRHI0MExkOGxyblZj?=
 =?utf-8?B?bHR1U2I5WTlSUTlTQy9DaFZLWHZ5dE91RFNobmdrU05YcXNlcFIxVEFmQmlo?=
 =?utf-8?B?WkpvcmMyUVgrMUZyallmVmw2TXRRVG5CYmZXQThXazd5a3VWUVlqaVdXZWVL?=
 =?utf-8?B?Sy8vWHFpbEtxTGdTU252YmhyeXVWQ3kzOW1hM3Nnd0lzbzlyUXFXcDk1d3VK?=
 =?utf-8?B?elhxUmFGSnpaeW5hMG1NK1VteFdCVE9zNSsrMHhtUkI3OS9SbjlpeU41aWJ4?=
 =?utf-8?B?RWw1cGE0aGJpa1Y2K3dqVFRYNEJXbDltbUhRcTZqMEdueGZnenN5aXFKM3pq?=
 =?utf-8?B?R2tkWVJjbGFHbEtYUjUwNjB3MEsxaXZlbThxOW01MTBSMWNRWkg0Vm02dkpQ?=
 =?utf-8?B?aHR4a2dGWTFhNmI1eUsvMDFVVTFWUFdBL1YzaC95WVorSHZuK2JYaEtlNHNv?=
 =?utf-8?B?dk5scHdTK2hnc1hldGw2Z0M5Tk5HQXZYV0FNUWRQMnAyUlBGdWJoN092emZ3?=
 =?utf-8?B?VDhrM1IvZkRXcU02UnRiLzRnR0FTMDlQazU3NDNnQU5Md1h4bmg3VjhDcHla?=
 =?utf-8?B?anRSd2NqTFAvdmhwWWNEejZZN3BGc1VNVmVkSWhBRWR6SlJSOEMva0RwdTdJ?=
 =?utf-8?B?Uy94MmlzSVNCTjY4bTU4akZMKzNHb0IrRGxENmlQQmFhNHRUQm1FSjBsZExv?=
 =?utf-8?B?ZkFnOUx3YVR2UGpXUWtKUm9najVJa1E5TWJGa2ZWUkJaRkMvbWlkNkJicGVu?=
 =?utf-8?B?YjhPZHozczgvYThUWi8wM1cyMXEvelVkVVFHVjNGSmVpd2lKQ0NuQ0ZjMzBV?=
 =?utf-8?B?b3R4d3FOOVlJSDhuQTBVUFUwaWZienh0K0ZkS3dRT0s1WEdGejBPY2tvTVg4?=
 =?utf-8?B?L01zWkdBemxiTkl6bWd4Y0NmbmJNeUJOeUVJS3pPeVBXRm9QZUxIdWFpMHpL?=
 =?utf-8?B?N0ZqcTU0djdMOFp4c1JWTUVNVDhMR0FOYnFNN2NXVDJxTXVUQ3kwblZtbDdP?=
 =?utf-8?B?Y1JjQUgwT0xQWDdCa1N5a25DUzRQdlpVR2l5NjI4RjZEeUFzRk1iSkoyeG03?=
 =?utf-8?B?d0k5NCtFSXdjNm1rOEtsL1hBbTk3cmFHYysvMW8vcGZGV2wxRGxDVC9DTDBT?=
 =?utf-8?B?dUxSeGkvVXlNU0Nuem1zWjJqUjZQc2d2dzJyYklLVkVEQ0VHQVQ5QWVSMEtx?=
 =?utf-8?B?ODlWK1J0TFBqay9uTTZtU2ZZUkZ4dzFISUxFQVFQVmVVZitGNHRXbDBPeU5q?=
 =?utf-8?B?cXphT0N1Y3MrOUNLWlV2c0hITzl2cTErcHhMK1dIcGloei8wQWMwQ2g5Z1l1?=
 =?utf-8?B?WWdmWlpWUlU5QlRiNEtDMWg0M3QxNzM2VjAwTGhuQU9tSEx1SG92NksrM1Uz?=
 =?utf-8?B?Z0phenJrRkJDZU5WTlJlRExtUzltN2N0bWZTQ0hMaFRhY2U0YXVLQT09?=
X-Exchange-RoutingPolicyChecked: XiZ7sVx4TGU4aVgOQ3HtrMVl6a1eri3wBStuNq1dvOb4zIdDrnPhrPOA9+BCgmCA4tHHuL566k6ESKuMdgGL6PqyVCAdxShQvRKP0KPA0WOamR6NWM9q6SpLGj0ZXM1AhwfSjTcdCPBzGfUHATtnSrJ+rZ/P2U4/e3/B3ULDVnSIhnaU1pbKFNMLwlrRY7MehtjAHKunuM1BAkiYSsBv+oMdF/zUiccAnoKcQgHNvZS00u6J8HLorz76lSWQf2Na34PRFpVu2PSah6+an5syOPiElP8tqzVJ2jBwiMvykLvr9VxU0KVDQOM1kwSA7r8O46tSRHM8cChVTYDJWyrY3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19163060-bf2f-4340-8073-08df0b54e044
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 13:52:07.8689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oj4xKGzZRAFWVBweV5luV/yVbxXqMt3Dj7obJm2Jmn+qfd/qfWY9/VJevzSQG2jrt8BccW5SglwhK4VH7iGtZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
X-OriginatorOrg: intel.com

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] In test initialization, `xe->subplatform_desc` is incorrectly =
assigned a pointer to a sentinel element instead of `NULL` when no subplatf=
orm is matched.
> --
>
> commit 2fbc7ea3deaa915eef829a4c64ec08fac1f4a8a9
> Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> drm/xe: Keep reference to device descriptor
>
> This patch stores a reference to the whole device descriptor and the
> matched subplatform descriptor within the xe_device structure. This
> change enables access to additional non-mutable device parameters.
>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/test=
s/xe_pci.c
>> index 4965a01f6ba52..48d5ee478fe69 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> @@ -374,6 +374,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>>  		return -ENODEV;
>> =20
>>  done:
>> +	xe->desc =3D desc;
>> +	xe->subplatform_desc =3D subplatform_desc;
>
> [Severity: Medium]
> Will this assign a pointer to a sentinel element instead of NULL when no
> subplatform is matched?
>
> In xe_pci_fake_device_init(), the search loop terminates when it reaches =
the
> sentinel element:
>
> 	for (subplatform_desc =3D desc->subplatforms;
> 	     subplatform_desc && subplatform_desc->subplatform;
> 	     subplatform_desc++)
> 		if (subplatform_desc->subplatform =3D=3D data->subplatform)
> 			break;
>
> If data->subplatform is XE_SUBPLATFORM_NONE, the loop exits with
> subplatform_desc pointing to the sentinel element of desc->subplatforms, =
not
> NULL. The subsequent check (!subplatform_desc) evaluates to false.
>
> By directly assigning this value to xe->subplatform_desc, the test mock
> environment now gets a non-NULL pointer (the sentinel) for devices withou=
t a
> subplatform. Could this create a state inconsistency with production code=
,
> causing tests checking if (xe->subplatform_desc) to falsely evaluate to
> true?

Sashiko seems to be right here. I think we could initialize
subplatform_desc to NULL and assign the one from the loop if we find a
match.

--
Gustavo Sousa

>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904170531.51=
6-1-michal.wajdeczko@intel.com?part=3D2
