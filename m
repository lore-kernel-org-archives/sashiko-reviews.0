Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA03446C01
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 21:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595426; cv=fail; b=RPKNmSy/xpLHtpg3JkUim5hC6zzEiC3ikCmzxHDK4LLLca7lhs0Nx3tMP/c4sqov1m9espYcys4cnO4EzxBNrfOE3AmyoKai0G4fSt6He9hQDtIz1EAI7f2mwXH9K84H9KtOJsJvXt60aLQnfdZgRPYSK/t2+pdU9/PKZq3uLIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595426; c=relaxed/simple;
	bh=wmKVxJtMKnlnScD+ZZDmaJ5rwmHgSKttm5kYSgHLtJc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EgScMHthH35cr45Q3cuW3M/Scxve6bHDP9uvduuSq14k8GfvwbkmdY26BXasi2Sa2PhylpZ7ObJ3PwcMXkgCnrOvFoCUpw9KXeJP422eMe1qJGEwxt0LqKQhS/oVk4wKHr70lWCqHKDLJ6mxciPdCtxS1+Tx9+nTso2b748ToYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8AGwSP3; arc=fail smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8AGwSP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789595420; x=1821131420;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wmKVxJtMKnlnScD+ZZDmaJ5rwmHgSKttm5kYSgHLtJc=;
  b=A8AGwSP3VbVhvNcqeoX7C0+RCCIzuUq86cz+2fmure1QZxnGD0+UfUWo
   /bvBImC37BJRZlJ4RPHb1xLN0BKfLbEXSlQ9e2yYfMY5lr4pazSjiWsVP
   YvlgLFm+jSSvgyuLOrD270C+Yv0GSPUbVnuPP5YUu2AfeFss8jlZRxyQ+
   QNBzVIaL/kXiUny3IG/YkOj/aVMPn0R3HY3lgmNj8gqp+OhGcfQWAvC6i
   ndmwyp/ke6G9jB9tctxAUMfNVNf7urMTSq8kkQzAuOzk/VSrw+LFMcbcw
   B7EqV/DGl0hoS66SIryFr3gKnt26FDjvBfNANyNweq4OmGRZ9s7OxY2AJ
   A==;
X-CSE-ConnectionGUID: 6ix/6aULRpuhwE+d0z5KYg==
X-CSE-MsgGUID: QJBKclfrRfe4AmhKtx5q7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="488979"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="488979"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 14:50:18 -0700
X-CSE-ConnectionGUID: GnE3Tx5BQZeAGF7xnjuVIg==
X-CSE-MsgGUID: V8JZhT7CTLO3bKtVWQGrEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="298543476"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 14:50:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 14:50:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 14:50:17 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 14:50:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqjxnRsYYShnB6mhKZcPjML+rHenTrSaB/1UmgQQluhHNdjNODYecVzAH/55S5Np2ExOBsJ60Z5f05WNyYnn1Yfd+xk1ZucdsIWnXXekV6czaLE055cMYsCNAJ8DyO5PivMMId+815Gs5HvQ76fIQWBqB29rMAjUmu/JoUFtEkzJnnPvVntXZHhuvlB/Pq36zNpteRPjEKcRr01h9Li8YDmYU92iZe6rfuPI4Zv8CXd89wqFC1GqBy/6R4/uEYFbj+APaoaYMysSQbs4ntUD6wpxcrsb0o5U1prItAbqSo3533Sj7qnNWAmpkRvqvcTQACCdbStw3CDSRqp+aByxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nX69kHrAFZr1bKpopaGxKnan9IXMFGauyBlG7lBmI+A=;
 b=ME3SA6Uwy+6/+sdJ7UOjVQnGR85Mm5YRlas2bbSwcjYtoXnp3dIWGxfAK1vMnv+bm8H2xu7MSZzuevjX65ogA0+62jgCvJ8RyyTbO2TRJZc7AvtLc60C+18Am6ws3Ki/Aq77ZvIlBVYOi24EaB8RE3vHqOjp4UVEuWIixQMxesqVMVtq0jiUCrINOjRtb8fCcFSofQ7RPLX035e7LPwKAZPzFR8mZmBMcjSy6kk5tivzOvxpHwChEy/lKS7H+AG8mzUmXsMiq8q6Oirsa0O3UP4Knm/j5hISoxXq+ShO9DuyokgVxl8rEb/xWX+0XIgZ2gwPvdzWMRhpuINLYYeM3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 21:50:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 21:50:15 +0000
Date: Wed, 16 Sep 2026 14:50:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/i915/pmu: Use a delayed wakeref put in get_rc6()
Message-ID: <aqsPFAtno5o2TkBk@soc-5CG1426VCC.clients.intel.com>
References: <20260910184253.1231313-4-umesh.nerlige.ramappa@intel.com>
 <20260910184253.1231313-6-umesh.nerlige.ramappa@intel.com>
 <20260910185418.A98ED1F0089D@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910185418.A98ED1F0089D@smtp.kernel.org>
X-ClientProxiedBy: MW4PR04CA0349.namprd04.prod.outlook.com
 (2603:10b6:303:8a::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BN9PR11MB5276:EE_
X-MS-Office365-Filtering-Correlation-Id: 63879270-1134-4f81-6d51-08df143c7d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|4143699003|22082099003|18002099003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: sZheZ47MS98evs8UF9lw3A5UT2C73ghgy4hRWulOSobK0OKbDWGHSo3TT9/cgduo45n0N4Ul1vX7hQY15RGrzhfsxlv8NZ4BKFKmewSt1HEDAc3NhwG/LD9BiW9vdkvifR8gx3xmzZD88OFnUHU3oBLvuRTA3s/LbOtkYvvWG5d6ENffnumq4fmgCnAbogcqD5omr+DiG2OJCUcZKKB872j06put6Vp1SXeaEv95aW/ILf7GKIvtLw+14aSZjQRbRkF/Rx8TTqTC+a3PH/wlluM4MN8A+04HZNG7QMtA34WQ8HqBuY2bPBiqaq+qnlOUtK+OwWIQ7Cfsr4g+g0EC5pZ2SaC+aydbTOTPvwZ7q/KhveoEdsGgxxzecMmsGAlr14G5Yh1DHmXg94a3Th/4/+bk9+ZCMRZjIiSq5a57R9r+GDPPBJMsFLcynYu6hDG/tznxnDCdLv1AhmuoqzssoSokctSt0+ggCrefPB1eon7w/tQTh99twzQt3pg166+QLNy9vvcvIVx8T9qwX2XueSp1EIaQfIs6o43MJvXRks9FHtP/N4tRt6wPOAMK5gwn8Zv55n8kusjESMnlSrnHWndMn1kEARtU0o5NC4ICdTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7408.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(4143699003)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekM3R3NETUdCdkIzVlNQOWlSWjlyVFgxT0ZwSitmUG94U3UrVmlvRkc4cGVO?=
 =?utf-8?B?ekQrMzQvYTNPdE5iUDgrZkd1N0d2Q2VUT1lvOGd6MEowVjJDdDRjNXNKMmts?=
 =?utf-8?B?TW83NUUzNXk0OHN6UGFFZ1YrWlZZblgycFVWTS9hNFlhdEx2RTR2cWVJZU43?=
 =?utf-8?B?ZlZMRVprSjBjYmhGcFZkWjNXVXNETjdndTdGMVYyOTR1WjFoMmtDWjdrL3hB?=
 =?utf-8?B?UG1mOHBaR1dWTWNnMm9wRFJCNm5UMFNXc2NEeG5NYnJaSW9FaDVYRjRWS09D?=
 =?utf-8?B?cWpLVU52blFVZzVFK1N5SjljaVNiRkJSTHN5aWw1QlM3cEJaVWo3aGx4MjZa?=
 =?utf-8?B?eTNob3RqZXMwdlU0UGxjZnJjODZDazR4ZnV5LzQzbkdrOTV5L25VSk9FL0pj?=
 =?utf-8?B?U0x2eHFkSDFwZDNmS2dlaDJQNTc5S3grWUF3YThXR21uYm5wNzNSa1N4aUZs?=
 =?utf-8?B?d1RPdWZJaldqVTl0REs5d0h5aDU3SWVSMzJsSktLR2pjUi9ER0NKb1pjSFBH?=
 =?utf-8?B?Nlo4ckJTN3cwa0NxVEVPQllSOGNmVkN0K3F5aDV2b2xnQlBjZmRuU2ZOYXIr?=
 =?utf-8?B?eGl6TUFRVk5iTmR2R2dJOTNyRDNWVWhaV2NJZ0Z1WThEaUR1VnBHa2JtelBO?=
 =?utf-8?B?NWJwZE9lQlZUL3hKbDM1cStGMkJUTks3UkdaUWpGclpucHArRW41T0xYS2pj?=
 =?utf-8?B?M01IdWFaU3JJeGlkdHpEMHNick1WNDhPbjFodkwwTzBXMlFWOEladUpScWhV?=
 =?utf-8?B?c1dLY0RXK3VkcjlmcHhSbjBiYVZ4MDlsbkZBUDFGRC9Zb0lYMWF1SzBHSjEy?=
 =?utf-8?B?WHE4RDFRU09BSkg0MU1ISWluM2VlU3JHWTl4OXhlc0EwVDFqaUt6TmtpaUhV?=
 =?utf-8?B?UWxaZHdVWTV0d3d3b0lEZzJrZkJNMEMyUlB1ZDZ2clhQdmYxRkRHVXhDVVU5?=
 =?utf-8?B?MW0rMHdLallkZEIrTkpPMmtNeWhzcitOVVFUU25QejVWYTBIMFhPcGFlTjVS?=
 =?utf-8?B?WHk5V1hSd29COFhsaTVBdVI1RUZkRHpjeDltbkU4eFloR2p3Y0FLa0swazhx?=
 =?utf-8?B?MjZUMDVaTWU2QnZTMlozZFlzV2huNWs2NVlyU1hlY09BTG83cGduR1lLbkoy?=
 =?utf-8?B?MC9tcFhJVDdoNHBNK2F6L3pCa1FoR1c1NkRVZDA1Q3p1YXRESGFMQ1RWZFg3?=
 =?utf-8?B?TTZXdW1aNy83eUpWNCtwUzk0QjY0NG1jUVQ4cUl3SFl3czRRMDdJOGE5Yzgy?=
 =?utf-8?B?UWE4NUVVblkzbGhNaDZ2YlFFemthL0kra0Jacm5OVEoySkN0OG8xMWx6VlNt?=
 =?utf-8?B?WXhsbURianEyaVliOVIyOWhGMk55eHpIYmVNK052YXRldEY1bm9wd0FrMy9V?=
 =?utf-8?B?aGc5UTRzeSs1ZENHdWJLaEsvcUk0UnF0QWcrU01hcGY2cDRMdW5xVmIvUlZP?=
 =?utf-8?B?ZkJQd3JLVjBXTGxQQ3RZVnM1bTRXcVZDVm9Xb3p3NXFNU2NFOEM0SE1sMjFC?=
 =?utf-8?B?ZnI5UXQ2NjYwZ1l1ekVtOE5Kajc1Yzc5M3ByNjZGUmtyRyt6WXYrd0Y2RzlY?=
 =?utf-8?B?NVN4OVdIUFZkZ0RXbVd1b3BYK01uNXFKaHF4d1ZyT0ViYXNjVmM4Y21RcU9i?=
 =?utf-8?B?YjBVeEJwQWVscVpGRWlmeUxSU1dnMmg2Q29qQklLYnBGaXEzRXlBMWQ5czdF?=
 =?utf-8?B?a05LUUYxSjdTU0VoVGZxajZuMlRaY2xBazBSZ2hxa1ZFQ1h0bkQwaGpLSTRz?=
 =?utf-8?B?RXltL05QbVRzaFVSN1RGcWxDOHRYbmNneDZWRW11R2ZhbXVZUnZHWi9zcHY3?=
 =?utf-8?B?WVBMVlg3SlllMVN5aEVsa0hBVjNjbXZGS2RZMEFBc3VuRzhqdzJSMmpCS281?=
 =?utf-8?B?cTRTOUsxUTIwWkJoRmNxd1RRb3NTL202R24vMXpaN0orMHhybkl1Vlhwbkdj?=
 =?utf-8?B?ak9IdFJsc3JnMUpON1JrWCs2enJ1dlNpekNuTzVoQXdpaGJ1QVFneTNNZjVz?=
 =?utf-8?B?MVpMQTdZd0lRRlBpZGRZTE5OdWx0aEREZ3FlaHk5aC9ObHR5VllwV3lJTHli?=
 =?utf-8?B?dnhFaFlvOG9ac0VUVkVJbTRQekZMSWpDbjRYcmVudFI3c25HZmRTNjZOUktQ?=
 =?utf-8?B?MklBQ2lrcXgzM05wQWJ1U0c1L3dWWmNodmdCOHNRS0FwQ1VJUEFoT2o0N1ds?=
 =?utf-8?B?ejlzdXk2eVNpTXQ5QVVjQll1M3lhOEhUMDdYOE5SZ3ZVTXpPazE3RXlzR3By?=
 =?utf-8?B?c2pBY2lKZmsxbXdnN3B5MWlFUnA3S1V4ZlNqSUwyeGhxK3RwNGpONUVKTVN0?=
 =?utf-8?B?eThialN6b1hwc2JJK0RBY0JyZ1NDWEl0dDByU2xMUlp2elRlZ2JnNzFXaVhh?=
 =?utf-8?Q?iUk+lAHi2WLZE2ys=3D?=
X-Exchange-RoutingPolicyChecked: yXQ8Q4n2WaMh6Tza0rwQMv9l8r8UCHkgPooK0m6fig4cG/CnNfGRolZa8uaSWPV9qwTCEgKTb8q7WWZoITda4786yNnYPiW439WAERx+u5M+oX/tQ9Wa4KDgd5p7OFjigVOYG9VW71Fkrq/dc+gtLM1q4eE+hAepJqqFWxYJzOjtg2yk/yXSE1L/2eiQ9dLbvADaFZKjGIRRTF1DZlMQW1+w9qdzT7KMXdnhPp9Zs+0MQrSHRhEHnKukO6SHDHYFQ+pm14mPGf07BYz+GcVc2af83FLKCmzmnsgMH44RYGwfvIeCmfIOvDi0HbO44H4k6G6dW2Rcotwfj2V53TqM2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63879270-1134-4f81-6d51-08df143c7d75
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 21:50:14.9529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dv31cRdQzMsN89GXaINEN61Ips6Bu+07PJahrN8rHWDg6V/WM3mNfJwqfMbktcnf62yuPKXRh8kYz0SfhWOfZ1cwEXl52TBYNgn/Ih3X3SE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5276
X-OriginatorOrg: intel.com

On Thu, Sep 10, 2026 at 06:54:18PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
>Pre-existing issues:
>- [High] PMU callbacks acquire `spinlock_t` locks while the scheduler holds the runqueue lock (`raw_spinlock_t`), violating lock nesting rules on PREEMPT_RT.
>--
>
>commit aeee9e0e0071ac1defceaf4b6ea0f13bad5f5898
>Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>drm/i915/pmu: Use a delayed wakeref put in get_rc6()
>
>This commit replaces intel_gt_pm_put_async() with intel_gt_pm_put_delay()
>in get_rc6() to avoid waking a workqueue worker while the scheduler holds
>the runqueue lock.
>
>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>> index 1c3bafda9c708..4598d9b5678a2 100644
>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>> @@ -229,7 +229,12 @@ static u64 get_rc6(struct intel_gt *gt)
>>  	wakeref = intel_gt_pm_get_if_awake(gt);
>>  	if (wakeref) {
>>  		val = __get_rc6(gt);
>> -		intel_gt_pm_put_async(gt, wakeref);
>> +		/*
>> +		 * We are reached from the perf callbacks, which perf may invoke
>> +		 * from the scheduler with the runqueue lock held. Defer the put
>> +		 * on a timer so that it can never wake a task from here.
>> +		 */
>> +		intel_gt_pm_put_delay(gt, wakeref, 1);
>>  	}
>>
>>  	spin_lock_irqsave(&pmu->lock, flags);
>
>[Severity: High]
>This is a pre-existing issue, but does this still cause a lock nesting
>violation on PREEMPT_RT?
>
>Since get_rc6() is reached from PMU callbacks with the runqueue lock held
>(which is a raw_spinlock_t), acquiring a spinlock_t here (pmu->lock) will
>cause a scheduling while atomic panic on PREEMPT_RT kernels, because
>spinlock_t becomes a sleepable rt_mutex.
>
>Does __get_rc6() also trigger this panic? It looks like it acquires
>uncore->lock via intel_rc6_residency_ns(), which is also a spinlock_t.
>
>Similarly, guc_engine_busyness() appears to have the same underlying issue
>with guc->timestamp.lock in the PMU callback path.
>
>Are there plans to convert these locks to raw_spinlock_t or avoid acquiring
>them entirely when called from perf scheduler contexts?

Valid issue. I will create a bug for this and track it as a separate 
patch/series.

Umesh
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260910184253.1231313-4-umesh.nerlige.ramappa@intel.com?part=2
