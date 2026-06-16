Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9210A3009E1
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616628; cv=fail; b=G4r2WaG4cm000bAFkhMJGIb1HVnxszFVvkMd/nm5pOIj5RllS6FiX+bc+niRaAaBIp6/ilV/8IfiueMYHKCafOgS+spupaHQs7Xpd3bnkX6lrQWEbXvXvdviXOTtUwSsmXehHRxIYVNvKoBQMv0sAZBLGDGERbQNIAa3AOgiGUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616628; c=relaxed/simple;
	bh=vVPUW1goa6xhmysUsZ/JTvvfsgJ457HMVhfEICjYCgg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aJdk01bcVJtZBePSwfZack+Z49Wl5aBo/DFB+NPqrnjp1c6Y2dbCIlfshGpt5QEHIpjTkkrzsbkO1lviO4x7x1P4bDNFpdXmL3pvDVuXZJoJzMYkdiJRsbx2W9lYKWPWQ9fe8oWU9IpxV1QKfopWyR2bndWYTkNrf+XbzBZJz3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8dKTgHT; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8dKTgHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781616627; x=1813152627;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vVPUW1goa6xhmysUsZ/JTvvfsgJ457HMVhfEICjYCgg=;
  b=B8dKTgHTNknAtkUdn08ec+oEc3SRno0Pdk9dvWDa1Y5KmUJZr4Hv3Dlb
   FBPtaxJwqdERwjHY6psc94OkgXzXHC0HuNoiuNtmUIXl85eOq/BxYS7p3
   Iom7WXQODYb0GmRQSI93xSqbez3S8T7TZRwt/r6RG4dSUw202GsOq0pdE
   7JYfuQveY6k8nCufim2h/hTZkRjT/AGkEIQIVyebizy/Ut3MF+fBALoDR
   Hyk6oZwCoBeEQ2bJG1RSQSxUVfRg09Pt9tnT042Z1f1o4UxoPR2Ilk4Z2
   zoNoF3Rh8aA0zDvFuCgmieZhSJzI5i7mTEZN+i9kBcmt4LrZDDj16IEIJ
   w==;
X-CSE-ConnectionGUID: NSe5hoN1Ql6gk0f0OsNMNw==
X-CSE-MsgGUID: nx9g48nMQnmYGtQ0NhDZQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="84945623"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="84945623"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 06:30:26 -0700
X-CSE-ConnectionGUID: iehwhfFPTXaUfG12voQSiA==
X-CSE-MsgGUID: 66dek9ktRCOOGcY581VkYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="285875171"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 06:30:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 06:30:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 06:30:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 06:30:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yl6LP6FrPAT3bPk/9Hd2HNQr6YDIJ9/nDO0IJYZruhw0SEykX5ZquKjquGR1+UvxNrnd0dF6vOVcEyQErs2LEJ5kpV8+m2hskYDaNLGWDq6HhxJcNMyOJUUyUqt6apu6RY79x9P6Nd6BYM+8mLrg1s+rIqHLA2YZSlszKuMVxZBzhC6isLFb6Da/XFn0dB2ixiXYK3ZTBaPC1h7ML0wzWOBwxLdFyG9Qh6B16yRS9GiNiYU2zfFpNVPHtC9N8DJzUK308eoGYEBApV0yNTYrDBHHswADpg9Fo/BlISCZxJPsFf3im/sPpezVdKm6lwqUuD0JTgqDmgDThksnOxpKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjLHXg0Eycr18vqjvpVALo8sN8pqW2lBagQvz4BfT24=;
 b=wg7nRYj9Yz6EzlRsjmgBsoON2jRbaiB6d/Hi3LTmPQtkGQHs6QTivZPWdKYLgmqMpEZC4f7vJsykozxNXcCpg563E1+JZKutZ6mo9H4Qt0GQWn1JpF/FrA7QkGpf0OOZ2kuQpHNNnW8cijnG5y3HRf4Jn//cFrTQt8lI8TDNAl5yfRN0E2kGc+0Il49JAJRyKdh+21sGURLgEN5lW1nOVjCEUDGiwm63HijdpNGYCV/55rpG3hy3+oXbUn0O6BHldEHl5S4mRhdcTjaF1VnOk/s8zQPR6IKXiNRw9CxT+X0w6saDI2yvsSsCInjsjH5TeiFVWr+eEVbIIx8yGAwQtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CH3PR11MB8659.namprd11.prod.outlook.com (2603:10b6:610:1cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 13:30:19 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 13:30:19 +0000
Message-ID: <bfc91b1a-c2ba-42e7-9625-dd0a795eb30e@intel.com>
Date: Tue, 16 Jun 2026 16:30:14 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] i3c: master: Update dev_nack_retry_count under
 maintenance lock
To: <sashiko-reviews@lists.linux.dev>
CC: <linux-i3c@lists.infradead.org>, <Frank.Li@kernel.org>
References: <20260616113752.196140-2-adrian.hunter@intel.com>
 <20260616115145.EE9731F000E9@smtp.kernel.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260616115145.EE9731F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::22) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CH3PR11MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 601124c5-e94f-4afe-1696-08decbab68a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ykZBnXxHOC6/Wse/GE8HrsnP8yFZEwxIEXw8+Y5m0+at30ix7PweWBCtg7bEPSZI0xCu0b5gqUeecFcL5eDASxb5STwfsIIXzN+rBtpgqyKbrM2/0tng/iL/0osXvTnX7hk/UC1C5YYaNgTWb2oeP9fhOMVzst9TW6G80nVCKn+SI2B2ZcTzgrqikMytDDKbb7bgz91o4Tw/j9Z+d/g5xzBK0mQY5GeXrBT/8+7VvNvDvMHQ9Dw1VSKeOJLbG590kk+DVP4fa360yn0zam5Ae/JQpKCt44DnaEOUTL/joF5RobW5UmA8f84gCigcJMB6YTdAp8Yn+BhG50wAJ5qIfHykUCK6Gxjxu0kioaU8XYRb/bqps4sS9sfztv4tUoH/LMkosVgmIJO64isL8QQ8IYq2SWK8v3ADgFgdLm4cWUqTvrYzrmV77giJkvvoBv0S100YoHwtoWT2qgonEmXQ1jUY+84jcF6wHsJviMWe/laJVnAUquNgx1W0hR+HgZLQL0SVhcfYyi8oJwV7E89j4K65MRnPRPxGBpofq1kEGku4t6gU65K5WBm6HHDSw6FbviX2Thfaavf2JMCyBjHWkWYLuRX52WZsu6zbss8JNM/Fqu+f6F72kLj7Q19wVwqd/6fARSygIiGmDeZIoA6xH1QPXfyxrBoUXlv/CiQj9Ya/0tcGo1VzIcA99zaW2mpZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVc0KzBwV2g0ZzFScC9sRnlnUGIrSHYyQUxibkJLMWtrbEtENWZ5ZlhZN1VW?=
 =?utf-8?B?RGJRMEhpSDJ3bERvekMwY1BNblBVdjVpbWZjemxQZjhoWkEvUm9pb1dQMHla?=
 =?utf-8?B?TDlTa1dHR3ZTT2lOU0xrZ0tJYVlBQzhPYmxlRXNXMmRGSThKc0hrMkNHaWox?=
 =?utf-8?B?TGVQcXB4MzlhMWZlLzF4aTJFN0NHdDRkRmo4UUVEK1JyNWU0KzFsOFNZRlJI?=
 =?utf-8?B?QWJJcXdWVUNVb3RuNGgxUWtWTEs3WUdhZXA5aTNnL04xcXRMS0ExdmhQQ01u?=
 =?utf-8?B?M0RYVGdKdDFJRFhSTHFhcjFQR0xMSW1COGlqNDVVZG5GUHNVeGgxa3VJSStq?=
 =?utf-8?B?d2J2ZXhEMTRWR1EwczBkZTQwT2RvZDg4bWNjZzlVRXBQMjRLQVpaVnQwUU0x?=
 =?utf-8?B?djZRbllRVlNPaUVTc05aWTk0UHByZk5iN0VkcHpiZUFtK1c5eHJ0dGFsNFNN?=
 =?utf-8?B?MkU3NVdiVGNNb25QaGluTkdFR3FzVUJKYmRhTVk5eVUrN1RsK3oyM0d0NXkr?=
 =?utf-8?B?bFgrYWxmem9PQUZyVnZVTm5qN2RWdGFBQ3drcTJNaXFHNXZTUzBSRFg1NXk2?=
 =?utf-8?B?SVgxY003MFp3aWRLelVlN2NndlFhQVl4amg3ZHdVdXcwbTRjT1BJd2pkZTM3?=
 =?utf-8?B?S0NCOGtzQmRTUmwyajkvMFRXZ3kxdlBNcXZUc0NoVVZHRmR1Q00wQXhiZXJh?=
 =?utf-8?B?bnZ0L1JrOTN3bWZYazY2MVR2N2wxcnlEa2pHY1ZXL2RlelljM3N0V2txU2dp?=
 =?utf-8?B?c0xmaGI3NFYrUUlIWm9FMitlOWZ0cUVsSy9jekFNVXAyekJkMzE2K2Fuc1NU?=
 =?utf-8?B?UFVweWh5ZFFUdjhEWlRUNXJpM09ON0tDRlJoajJjd1JxS1ZQcDU1QTV4ZGl6?=
 =?utf-8?B?S3BNNXlQbWhjVndONzQxdXQxejhmN1VrVmQwSFF5ekVGTW5CMjFUNU9GRUVi?=
 =?utf-8?B?MTVoaVFTUzN5Nk0yZHBabkQvMUlqM1g2Sk9MMkpIdnMrb052Y2ZUYlZBcjFx?=
 =?utf-8?B?ZmlPaHdzbnRBdjNzNWs3a1ppVDRmak9wR2RIU0krT3RRREgySHUwMG14MVpL?=
 =?utf-8?B?bExwU3JzUGI0LzdDNE5LUmVsdmdjNUV4YmEvOXVKV3duSXV4Z1RiRWxJU05w?=
 =?utf-8?B?clZMb2tJYXRXL2ZCNzEyc1lpd3JFTlhCNzd0R1ZjaHZiY3V3NmowY3BvY1Zx?=
 =?utf-8?B?dStSTFhXRk54aUlnQ1ZrM1pISmdra0dTTTFaK0R4K0FFWW0xT1VlOEdNMDVI?=
 =?utf-8?B?UmR1UzlVdm5ndWFFK1phNTlXOEhrekJ2U1puZmozeDFZaUt4bE5nSzBQNnNB?=
 =?utf-8?B?YWw5VVoyNDRxNkdBcWZkZXJ0ajVYWTRKVCs3WkdOYis1aytjajFaYitqNDBT?=
 =?utf-8?B?dkh1N3RaaW4zdk9LKzl5MXhYWmhHaFNRVFFzRDJsQUJCa0JKdXYzQjM2Qnp6?=
 =?utf-8?B?OHRMNUY5N3RhQkF2WFJjMlc0Y0kzcWlZMUlNUndxRzQzM25IOENISldXNEdM?=
 =?utf-8?B?cm1PUTZKQXFQNXh5Ujh3ZXN6cmJrOTQvcFB0MUwwSGFHV3cxeDRkbXJ0Z2lZ?=
 =?utf-8?B?QTcyeWxDTDJyb2x0WHE5VmlySHZhMFUxMDBRZG5HNDJicGhkQm9LcWkrdWww?=
 =?utf-8?B?Yi9Ma1hBM0hkRzNqdk1NSWsxajJrZG94ckVta2NLQ0hyY25NOHVsRHQwWXhN?=
 =?utf-8?B?ZXJvcG9TMWsxNjAra1FJYmpnd3hxS3JYVENJZHV4dmxLaXpRb05XaGpYL09M?=
 =?utf-8?B?aVN5bkdQdXIyL3kwTldsWk5zMEdnU0Zoc0l4SW4weHZIWXMrYnhnVlo3UTBv?=
 =?utf-8?B?RWd1UU8raS91dnRXY0J2NWN3K082WVk4TWNSeWhOMlNobzJZK3YvNk1FVmI1?=
 =?utf-8?B?cndUdzZYMXpjd1NxNjZ1K3NZQVFsM3l0YnV1eERCZHAvVFd1WFJIUUNrRTBp?=
 =?utf-8?B?Z2NLOEJITHJkSjJPSlFuWVR3bTZvc3hzT0tQQ1hkUG1HcFc4ZHFhYU0vQ05O?=
 =?utf-8?B?Tm5HVHdMWVNseWhhc1hyQnBiRFAzZDFWWllGc3hGS0w2VHhKQmV5VDJEc2Zs?=
 =?utf-8?B?MVkwRVJxUVd0VkdjKzJkQ2hNZUE3TU5VS1hOcUwwamtHa252UEM3c2hjSE8w?=
 =?utf-8?B?bHptbVZwTnU2dFZhQXdENm8zRkpCb2F2MGg3cWhEeWFlVTdiazVwV2dmZE9Z?=
 =?utf-8?B?dlF6aWZ3eUlVZ3dxcG8waHVoNy9KQ1FPMXlERTE2czRmLytsamp6NE9GMnQr?=
 =?utf-8?B?ZW9taXM5QURVelVxQXp0RWZZRDRyWmhiYnZQejZyZ0dzRDFtYTlQdk84VUtY?=
 =?utf-8?B?NjM0b1QvZlpKQ1ZQTGVXbXd3UnBaZFVKTHN5ZGZxTnRXM1EvZWZHT2ZMS0ts?=
 =?utf-8?Q?d7YrdIuQ+jJi2MMo=3D?=
X-Exchange-RoutingPolicyChecked: cHdPfq+RO26bG5ryckAUJyubAT3AbBbtqdX2Tn0o1OGVIvdqrwIlCuP4VsRgeA8xD7k36J3B4zsXQrdCmgnKqHvuV2VfNiB9NlqHPA+QQBeKjvaKp6BUYCYyzt5X3pZ9OZX7YI8ZPUP+fTMNY0JmdmAxH/mSAtS5kmv2O5A+T0xF3lfmHXxE9uTbZjcLCAT5B2q7EFU7hDUnqCQVbDUTKkMJBoEfgvRBmdKWAix7SofTs1uOh3l1EA2+CbJTzs0HWvXfE/9RfWotZXyIHz+0g94A7xtY0lwDYjozmyiEgkAGEWZHVEMJd7YD8R3Irgo/kp2hMdd2QKSFdG9MKQEIKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 601124c5-e94f-4afe-1696-08decbab68a5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 13:30:19.2017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQMRKhG4fU6sD7DeeQ6+a4TBmhxiwwZs5frswxtMSWNMXrxWSskvTbCgXYlKQrMFug/Kgm8IExyjAZNSTIIh+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8659
X-OriginatorOrg: intel.com

On 16/06/2026 14:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Preexisting Use-After-Free (UAF) due to devres freeing the I3C master controller while its embedded `struct device` is still referenced.
> --
> 
> commit d8d2b455dc4bd3d672311fc14258b4a9d0b83e8b
> Author: Adrian Hunter <adrian.hunter@intel.com>
> Subject: i3c: master: Update dev_nack_retry_count under maintenance lock
> 
> This commit protects master->dev_nack_retry_count against concurrent sysfs
> updates by updating it while holding the bus maintenance lock. It also
> combines adjacent return statements and updates the read path to hold the bus
> normaluse lock.
> 
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index 372d911ecbadc..05ea9e3c4d46f 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -744,7 +744,14 @@ static DEVICE_ATTR_RW(hotjoin);
>>  static ssize_t dev_nack_retry_count_show(struct device *dev,
>>  					 struct device_attribute *attr, char *buf)
>>  {
>> -	return sysfs_emit(buf, "%u\n", dev_to_i3cmaster(dev)->dev_nack_retry_count);
>> +	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
>> +	ssize_t ret;
>> +
>> +	i3c_bus_normaluse_lock(i3cbus);
>> +	ret = sysfs_emit(buf, "%u\n", dev_to_i3cmaster(dev)->dev_nack_retry_count);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since we are modifying sysfs
> attributes here, is there a pre-existing use-after-free risk related to how
> the i3c_master_controller is allocated and freed?
> 
> Many I3C master drivers (e.g., dw-i3c-master.c) allocate their driver context
> (which embeds struct i3c_master_controller) using devm_kzalloc(). During
> unbind/removal, device_unregister(&master->dev) is called, which drops the
> initial reference. If a user-space process holds a sysfs file open (like this
> dev_nack_retry_count attribute), or if an attacker blocks in a sysfs read or
> write using userfaultfd, the kobject reference count remains elevated.
> 
> The driver's remove function then returns, and the devres framework
> automatically frees the driver context memory. Later, when the final reference
> is dropped, the driver core calls i3c_masterdev_release():
> 
> drivers/i3c/master.c:i3c_masterdev_release() {
>         struct i3c_master_controller *master = dev_to_i3cmaster(dev);
>         struct i3c_bus *bus = dev_to_i3cbus(dev);
> 
>         if (master->wq)
>                 destroy_workqueue(master->wq);
>         ...
> }
> 
> Will this result in a use-after-free since the release function accesses the
> master struct after its memory has already been freed by devres?

No.  Open sysfs files do not block device release.  On the other hand,
driver remove is blocked if a driver sysfs callback is in progress.

