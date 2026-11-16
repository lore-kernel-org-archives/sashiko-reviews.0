Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794866547;
	b=Bfs1cSKv08t3Qp4V5OT4aG7+4K4ABWHzoyfYNcnVsNzBafukwcjDNlNuCMPwo9Puzkoa
	 Qt3rQoMcik2wtRcU0q1+Z/P20uOVlirGjzcci4WnFqvzbxfbIrbdtsF8guvX+oK+KaNm+
	 sNlwJfg4ZTmNKzThnpjXsJRCaQ4UIUE/L2x7rWK4wK5P5fwDaUUMoALv6Ja+rgkn2RjzW
	 KNTcHspWWzEBe4+ckLzcypV+p241+GTui18rzni4eU/aT/edpoOaEw/sYGa2bMGGDu+re
	 zGpSHYEWUyWfO4jfva+1/4qBwOmB9UucbYnHTCQw2OqdlDNZg2EUr5B8GjMpzVYwgNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866547;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:References:Content-Language:CC:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=lMqlAv/S5kMdT21UnvNtZi/KUVcmuTERxvVE+P8iQVI=;
	b=QLAl3NYHE9Ny7+DghLe+hpMggiyJyENEMhEC9fCzXkNLEi557wmYRbls4crvs4rq54la
	 YqvcQYogp/7RWGiTf4GkWxiDOcf2UU2qePv2TxD+80U4FBDCZdO4C04MpIt6S+kUsHbIA
	 SjDEQLuyXWJjhjcTU7hepfXQmMbvG9ASDO3YmB5d4sGjuZLH72jDxStAxUD7PJiDdmNbv
	 mj99ln2m8POQDjsp4Tf5lZURKy+FY++bTBoOCGBkb9fyY+dMy+KWOMBnlYdPHxHWJnzjS
	 B/5O6QIORhXZvy6vqUIl91f2pkrYlk2EVFOerZbXS2y3IeAU1YNvyVwVQlD9CPkHafQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TtKgrlXA;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=SKlIqr0o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70388606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 22:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70388606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TtKgrlXA;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=SKlIqr0o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794866547; x=1826402547;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UhSr00CqDRPuL7LKNwjCtkAQgCH7Z6ITNM6TEFflxaY=;
  b=TtKgrlXA6YIkfFBvf6TzD1KrHTjuVXdAZvdRjAN9QSmkji8P2bCSCZKr
   FdRfnvWM8GBNSwaZ4hlgpu9k45OCWagAup+6z6RcO6ugfPryYP2JcCd9+
   pmOjGphVkoXcgPL3B1sn7p1viH8EWAmadSLHlb3683qnaryrj2b4664T6
   kBrA7CZ4wy8Zh5uxVEaMH6HPOwHoGvQ0ia+AJr/p7If/9xDUYvb1mFqHS
   aYMT3Mtci75yFT/kA2vVVdr9aNAXFdg+nDVdBV5599Bx7/77HZ0CymI+k
   SX8/A2veQQtw/J+RwGM2VUQumHOF+5VdFm4CnIgbBb1pTdxJA1VokxGH5
   w==;
X-CSE-ConnectionGUID: ACMNNEhdQU2WkGu4wt7Avg==
X-CSE-MsgGUID: Jw2JyAlZTLi4xMfNFtYnJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3498190"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3498190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:02:26 -0800
X-CSE-ConnectionGUID: ODJSZtKNR++bXrp71BX6rw==
X-CSE-MsgGUID: +wPwmYQTSjWXFznaglaRZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9981147"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:02:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 14:02:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 14:02:25 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 14:02:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEMjb/GMIFtGoh/s8KpJI+K2AkG7aEmXs43Be8G1W3FXgslm222bMWmBPwigW0620zgxTYyX2/ijNpxn7yj1Af4vKVNuDUVYmzAfC9RqJWLjha4l122s0vtzcmE7O+oy86zZqle8oRX0PZJLh2kvMlSjQaLBVSgxbJNoykZT42grge6SLadoWYWKGrFYif05aV563gs0Fjb5WrDp7T0xH7z2YMuFaR/epwT0Oz8/bspgzfM6lQZeLHk5HS1MTLyx4397bOHMVB041NW4T3+bAKkC0HHCuUxLsUupPaA7DV9NAuI/hiqiyWrDwwrzmHGsZiE1PX3NISZG8I1e5YD3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMqlAv/S5kMdT21UnvNtZi/KUVcmuTERxvVE+P8iQVI=;
 b=a8PFDATXlL1QMJyhJB+6UMnFDajTnrlXijYicoBFyYR1n0cL3tK1zgwgEb59S4ExbXtKSCb873m0ILhttgWIFL/yYq8yqtAR2NuYvylM2p/KeXgbl57v7haYtJK1IdWqivQciyHoUfgWbYNyINitwrjcQL7jK1Meqs4yHerz2pPMmQONf4JCojf7GkOf9L+dGEIC/bSoPQ/1vCtXfUFYRsWoVW8zJS7Pu3uMtEOQVFGSqcCnT0jBJYw1tVGC4Spg6tAePBWkPmODT05sVkfCbRjZ1o/8kv1npKznCW36q7U4IkNfgxW1bAafuCERZGX6vsPQa/AlMvlD4uk+xpjAtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMqlAv/S5kMdT21UnvNtZi/KUVcmuTERxvVE+P8iQVI=;
 b=SKlIqr0oI/1VFd8g54zJqXyLmes/Ty1SgGyTDjiU8csrMY/8e5/Ap24uKMEm9+xPm5MU77UM7JBVJ8mdpm9UgS6rBKEARzWZxUGfHMlRo6EqZ+GKBNKwOoLKOzi/+HVdkwzyZo4CWEhQ6AykwTZ3dCB8KTVys6ub1uP5sQAJvlE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by DS0PR11MB7735.namprd11.prod.outlook.com (2603:10b6:8:dd::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Mon, 16 Nov 2026 22:02:22 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 22:02:22 +0000
Message-ID: <9ce14c83-5cbd-468f-9066-abeafa4ddde9@intel.com>
Date: Mon, 16 Nov 2026 14:02:21 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 1/2] drm/xe/wopcm: Use the size from HW when excluding the
 wopcm range from GGTT
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261113191739.1447747-3-daniele.ceraolospurio@intel.com>
 <sashiko-outbox-213560@kernel.org>
Content-Language: en-US
CC: Matt Roper <matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <sashiko-outbox-213560@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0044.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::19) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
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
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|DS0PR11MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: 449b58aa-4935-40fa-ab78-08df442d4a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|261009223027099003|4143699003|56012099006|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: IEYQw2G5/oNbZBEJaVIPRAME41gnRvmuYu8Am/RSYReshTlD2J+Jfe8BDGxo/NPH+sU+ADe2Z5FC/ct8bAZIsuGdkgOgk2+UP0IRwCt+VsypNhErHpL5D/EwRKMMcA1yew8jjakwim5lSBzhVCgMeQYgPQFxPUOCFb9uaeySZtlff8sbuTcVyBws6grJ72UkphsMqlgishUmlIkT68l4FdSharPrHBGIVK+NhgYZdzGDcOzpZXVhKL+4N0SWXj4R9bHlUufu4DcQTlqrNJHEQ7PRjsAdxLhz93y2jQK6VuyRXK7zvUbIQ+iNllDg02i+127271qnknq0is84lMw1bxJKz2cwlFxwHy7W1Vir+hgzxLE03mZ71F2ngyueUC+F20Fxbdk7a3rzNqo97U+4fQRbQc7B4g3rkhLKtGDN+xbDqCT7YQwQ5icF1uwefV5NGa5KqJ1IAPfEMaPHqC9xVCC8VwCVKyF5H0moiwzWXWKIdIFbeREphb8kU2T1C4SVjwZnBCsqUzWne2ZgeVghBcBsMXy6yGt6klsTC0r7u9xF5l8JZaHKofqmVFlcaB/X7JQhrU3VxuaLBUQ7WDXboHQ5UIb4EikYwmVfhx6jgpY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4979.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1dJMkQzWjM3UEhSSGkrV1ZXNVFGM1hMWllnY1AzUlJlU2llZmorWnRlU05r?=
 =?utf-8?B?M3d4QUZLNUF1bUxlNHJWSTFsRG9kNUxVQmtmTkFNZ1pGSlA5OVp0a2xzWGxq?=
 =?utf-8?B?dlFUTEkrK3Evc0dXRmltek8vaTQyMG9lYk91MGFyYnQvYVNIM21tSFdOVlRX?=
 =?utf-8?B?MU51eWZvdWVjaU9tb0JhbXh2UWdnSmwrVUpHd3UwZnZ5b2xvVFJlckxvMjFh?=
 =?utf-8?B?ZkZ0ZDdSOXA4aUJ5MUdDNnFnTW9UUkJnQzlxajdhaGh5TThsODJsdGRqbWQx?=
 =?utf-8?B?UGtObzBTVGV4SVNpVXNtRHZQU2dJdVhQWDhINS82eC9FRDNvV1JReFhDemZK?=
 =?utf-8?B?SXFTM2J1T2dsMW1qTnorV1Rnc2w0WXlQRENSbHJCWDlScmNkU1RVVlhnVEpu?=
 =?utf-8?B?VmdCREZ6MnNBTWpHdU0veG5zUS9jTHVtWTVRd2ZYUTNYZzVRZzljbDhIVi9Y?=
 =?utf-8?B?cDRFb09hcHliSzFTZVVpcXh6Q1Y4SlRqUHp0bDFpa1BPYVNUOSs0ZGpGMERH?=
 =?utf-8?B?S0dzdzJrWGs4Q0VvekhqcWM3bDExeHNZb1dXeUNnV1VRMFZ2MTd1cC9PQUJs?=
 =?utf-8?B?ekxEV1VJMTBUOCs5YURkQ1dOSDFuN0t3cWpZcHJ3bjduRmlUTlVtRmo0YjRE?=
 =?utf-8?B?WFJiemxqRnQvS2lwNjY1anVTSXliODFuQytMY3lqS2RzdHpRam1yVVhCTW1v?=
 =?utf-8?B?anhpSTZQejh6TGJYWUxncEVaRHdCSk4wM3ErNnlxYVZvMVhOQ3E2b1ZrNlpI?=
 =?utf-8?B?MkRNL0gyeFdiNUJLTTB4T3FiWkVqQTdsRi9KazQwdXp6QlpsWENzMWpRSWRn?=
 =?utf-8?B?TklBQ25yZ3IzbHVyRlVkRlZ6cmNOM2xwN25nMzhtVERUbjJ5UlVib2xlanY3?=
 =?utf-8?B?b0UzbDhUVmxpVXRKa3ZPa3VDUzdKK0U4N1JtczNMeS9jUUU4OG5pcWpNSDlx?=
 =?utf-8?B?NDlkenVVRkRZY2tDV1A4TzVxMWtXMTJGR1hnbklUbmxpOVA3Skh1MmxyaUhz?=
 =?utf-8?B?RUF6S0dsOWsxMUVqcjlpTEZGdHlNZjlCUGExUnl0dE05NEFRNktpejBKMHFW?=
 =?utf-8?B?eEY4dG9BTllDdDJGTWwra0QxK0xISmFXL3NIbFBjUDdZQ0E4SS8rTWhRZXhi?=
 =?utf-8?B?WU5GTWU5SVNaZmZPS0V3b3hMN3pWL1F4dEJLckw5WjJsS05TbGVDWTBRWmNj?=
 =?utf-8?B?YTJsUEhQNE1rcWx3Mk9zQ3VIQm9CUjNWTHp3UG5WV2tmM3hiaDkrMWpVUUZh?=
 =?utf-8?B?VnMwUUdoZnVKWkdWMUtFSnhyOVdVbWpzU0lSNUFURGxGeUo1VFRWSlRBOUJI?=
 =?utf-8?B?TUVYYmRScFplRlhtV0ozRUNBRTFWY1VPbC9rR0R1V1BWeFp5THJsTDE5WnpB?=
 =?utf-8?B?QWo0RVZrdDBzWVdKdGVuOE0wcGtPRlVmVmxaUlRIdG00cjBBd3NMMk5IMENF?=
 =?utf-8?B?WkZpcVlHUUg1MEZjNnpGN2UreXNlRmxXODlBaUlsdThxNXVRQnZ6ditQOG9L?=
 =?utf-8?B?M05zVGxWWGVkT0RrRTNmRm5rLzBvZ0JCcFYzeSsvTjNpRmlnZVNLWk1zK3VR?=
 =?utf-8?B?cFZQcGdpSm9oRGVnaGpkV2FOdDkrOWl3YnhPa24yL2RTZzdyWUJhYnE4ZjU3?=
 =?utf-8?B?YjdkeWtPZTNCZjF6VkN3WjdoNWRlNUpOUHJ2bDFlTE5IYk05MzUzNzB6cUFB?=
 =?utf-8?B?VndlOHpjaWtsblBEK2NwakNjcmNJS3NqSlVNQVZvU0FTekhjVDF5N2lNY3pi?=
 =?utf-8?B?QUVWd2hRdnpIVTdYUS94cVpKcDJYV2dJOVBLUDU2SXFhVXU1dnJhbmpoc2o1?=
 =?utf-8?B?NWFPdlkydDFWbjdWSGwxRjMyQVF2Nm5DNTBoMVlGMWI0aWhzV0pzWW9yR2JF?=
 =?utf-8?B?NmlQVjVFUTd1NTZhTTkrd25lUnRCU2tRUUc1eXJVcjBzTXl4Sk0rSWdodG44?=
 =?utf-8?B?OU4wS3llT0cvWXQrT29DMmZ1ZzhBQ0V3QjRqQWZZRHR4ZzA1eldiOUJWcFlI?=
 =?utf-8?B?eW9qcnBQVnZGL1k5Q2JFb2hFK2FtU1hKNUgwZjRMM0s3VGw0WVB6NktVcjJt?=
 =?utf-8?B?OC9ZZXo3V3p2Q0FsN29zOHJSMHdiR2N3Q2JhcU1FeGFkMlNWREdwRmpVeFph?=
 =?utf-8?B?Y2s4ZEkyS1p4cWQ3UEN4WnE2cGltTlFNYXBZVnVtSlRoa1BLZVZqczdXaUtm?=
 =?utf-8?B?WUpvNTdDaXloMDRma282RkxUenFQZUxUM0xmRTBEQnhRVStqaUtCS2Jzb1Uw?=
 =?utf-8?B?YWVRZ1lmNk80Y0tpOUFYQThLejNqV0NNVDJBVGNhd0ZEZ2RmNVltSmRWZDZp?=
 =?utf-8?B?b1RETHVvZVpiZm1tem1XVXhXeVhpbXhEay9JZjdEY3VGcFhGWkpYVlR1VENG?=
 =?utf-8?Q?Fsc+krQ+iK1YgQRo=3D?=
X-Exchange-RoutingPolicyChecked: OnptlV35IXu+LnSth/mYD24CmRiIVj3er4H+qx3yV8zMIu4oyjORDj2NzdM8QP014CstqxWT8Vlu3QfC6YaSfTzYKaoQMt7Nvzv+rTbzwYefTPZcoddAObnLD7akz7CmaJ1hJTF4Iar/RJIXDc6OosQmYgX7ll82+hK5U4uDyvvaV36v3rXzzdUWD0q4UlkxbSD36v8PayawdaUNapR+qfWlOZB5bmSJnTyb+EZJc24T56iB6iE+8jKpU4HRVJHT/fTUEqIDb2hUZRHsIKjmMR1WvE8FbFagiUeO0knroO9o5TLzNZj31rL8T5k0YdtCijfULwwxsCZPe7TvyWxYug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 449b58aa-4935-40fa-ab78-08df442d4a38
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 22:02:22.1593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zviQ/fO28oaUxqVJZSkDMonkwM5Zp/0SdqBMeBi4XmwbBiEuRjFBTOwMwFxzjH0Gv7FQFXOor4BVZFlrGZYvNmXqnmZFUITnsqhXqASrhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7735
X-OriginatorOrg: intel.com



On 11/13/2026 11:40 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/xe: guc_bo_ggtt_addr() asserts against hardcoded
>    xe_wopcm_size()
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] drm/xe: out-of-bounds write in xe_ggtt_set_pte() [1]
> --
>
> commit 4a9c3b5b3550bed91fd0e4d956401869552dfe0a
> Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT
>
> This commit reads the per-tile WOPCM size from the STOLEN_RESERVED
> register during tile initialization and uses it to set the GGTT start
> offset and stolen memory size instead of relying on hardcoded values.
>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 9ef2ce743770f..cd8b9000046c9 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> [ ... ]
>
>> @@ -394,11 +394,13 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>>   {
>>   	struct xe_device *xe = tile_to_xe(ggtt->tile);
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	u64 ggtt_start, ggtt_size;
>>   	unsigned int gsm_size;
>> -	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
>>   	int err;
>>   
>>   	if (!IS_SRIOV_VF(xe)) {
>> +		u64 wopcm = xe_tile_wopcm_size(ggtt->tile);
>> +
>>   		if (GRAPHICS_VERx100(xe) >= 1250)
>>   			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
>>   		else
> [Severity: Medium]
> Does guc_bo_ggtt_addr() also need to be updated to check against
> xe_tile_wopcm_size()?

This is done in the next patch in the series

>
> drivers/gpu/drm/xe/xe_guc.c:guc_bo_ggtt_addr() {
>      ...
> 	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
>
> 	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
> 	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
>      ...
> }
>
> With ggtt_start now set to xe_tile_wopcm_size(ggtt->tile), early GuC BOs
> such as guc->log.bo can be placed below the hardcoded xe_wopcm_size(xe)
> whenever hardware reports a smaller WOPCM in STOLEN_RESERVED (for example,
> 2 MiB on DG1/DG2 where xe_wopcm_size() returns 4 MiB), triggering a false
> xe_assert() failure during GuC initialization.  Conversely, when the
> hardware WOPCM is larger than xe_wopcm_size(xe), the assertion checks
> against a stale lower bound.

The WOPCM can only be a different size than what we hardcoded if someone 
is using a custom IFWI. I'm not even sure the driver would boot fine 
with a smaller WOPCM size (there is a reason it is the size it is), so 
IMO that's not a scenario worth worrying about.

Daniele

>
> [ ... ]
>
>> @@ -647,13 +648,15 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
>>    * This function may be called multiple times during recovery, but if
>>    * @new_start is unchanged from the current base, it's a noop.
>>    *
>> - * @new_start should be a value between xe_wopcm_size() and #GUC_GGTT_TOP.
>> + * @new_start should be a value above the wopcm size and below #GUC_GGTT_TOP.
>> + * VFs can't access the register with the wopcm size info, so we trust that PF
>> + * has done the correct programming for that and we just assert on the upper
>> + * bound.
>>    */
>>   void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
>>   {
>>   	guard(mutex)(&ggtt->lock);
>>   
>> -	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
>>   	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
>>   
>>   	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can a large new_start
> from the PF cause an out-of-bounds write in xe_ggtt_set_pte() [1]?
>
> vf_get_ggtt_info() queries start from GUC_KLV_VF_CFG_GGTT_START_KEY and
> passes it directly to xe_ggtt_shift_nodes().  In non-debug builds where
> xe_tile_assert() compiles out, an out-of-range new_start is stored into
> ggtt->start unchecked, causing xe_ggtt_set_pte() to index past the end of
> ggtt->gsm[] when writing PTEs.
>
> [1] https://sashiko.dev/#/bug/linux-eb71dbae-ad75-4245-85dd-767544ad0c44
>

