Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D9536EA99
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451981; cv=fail; b=myRsjIedGyaC/3lJsZwZkn2jbLzTuHsO0PWjH8G69OefWttCOHf4xc7bJbvi6Q44FxauqswZqXH4RQGAJ+QorfiYbAIiRuSeyjwomJZkoNGFAJG1GrYyKj7pv+uYp+6aNZisLuZPHryDplQy3NrRa6wJyoC6Epp3oHCvGAEJ1O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451981; c=relaxed/simple;
	bh=jGITEpJozk3HyDBBX/XkO4KJ0co3Xn3mWpDQM449lo4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fP3Vr9bGauTwdzHe7TdfKhdh9OjGd3jo/Ilun1SU+6bq0e9v0rR+EXT2THnjtO/eWdx0M+S77DFKzVFUu4HP5IPwkmshOQbu+Dj3BydFKUB2/ewxEh7cn3mpc9Ev4GkiNJY3LlxX6EixylzxawLaDnxg5oHsYspevkms9p+0VDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSRc0Rel; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSRc0Rel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788451980; x=1819987980;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jGITEpJozk3HyDBBX/XkO4KJ0co3Xn3mWpDQM449lo4=;
  b=PSRc0RelNoV5npmiKV+ZSIkTgI9n3opBJ/GoglcuvUPBn/J+iOFqt9Vd
   dENso8DMBdcn2OMcIuO7ioi22PBvDt67wsvXkRweWBHqx1yDV+fJm2KvN
   rDOsN0rUAgAD4y2Jsa32LVuTrZbxAbRS+SEHGzu2JfgTBr7A/OychzwII
   i+SQU6odwrG9AJ3MtNRZl5VlzaK+urZM2GDtbsL/D6UIjojRVtgp/uhoL
   lOQNysWSV6dXjj47erJve8kRSckMx/Q8vwsSrNoqDSPfFGPGdrXKIVi1y
   GZMUVV7JxR0/Q0CMy5XI14fmF0h/S+IzMrd7Cnfk5Ba0EbT/Pl89oFN+D
   A==;
X-CSE-ConnectionGUID: MJNTdhXTTRCQYpyrBC225Q==
X-CSE-MsgGUID: kOp5BicESFWEleKRM8E38Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88963630"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88963630"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 09:12:59 -0700
X-CSE-ConnectionGUID: +PBaIDAGTwmaEsSwFnCPQA==
X-CSE-MsgGUID: jb5ISwYJQpyhLFYVhmQmNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="307984283"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 09:12:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 09:12:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 09:12:57 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 09:12:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8FVqqP3LlXcWsuOYinYWdbhw4FokbpMGP1BmA+gJneSko51ToiF+YOdBGDdO3Z6RyuH+wMR7zIAJF6sHZf2AfFg50dw/DepJwh9BNNGNYTDE4l2p941Jp6cGucy1HUE8LlD/RbmNgU+5Imcm9sl3Ui97cw2p/kcKatHc/k5jWf4ewfD2UYLsmbzuLhU7e/uyLgIWdf2fllp7pqUSRWCPpd2QBEtOApRDb6tUFeflRUAUKLe3CjWZEiNu6jYzZm+xuW9BovDpfx1B94mEu2JjIIYfG6i0a+ZBqTmFSjiSPHjmt44+nPRv6lq0fbHWIo+40h0i5baTcYp4/6GTqtc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvPX9s+HCkTnkUuM5uY9IL6zzIBGHPUowCmpeJlw70Q=;
 b=piy9d3lnfv4diOliR5083dAUV/ZX2HNn0LgUaCDuQlzkUJ0tLNpQoHJWjGxj7ixJGqy0eDfy9MYyJ2W15z0CqEaVSiuW1n0PkgUK+aCoReUFXReG7eZIYUei8fbZNDYkREdcJWxca44AGQURGPpRN5TNuI/cf7JHmBNBN2nBLeSI7joDGUPR0KdUsn05wD+F2AKuOYixxuuOteIvf1hf3yKaRBVJAO8v1U2iNULmHu0Fd6JjG+/56y7ylaE3bWlfl/9xeAdwC9UamXvf0D1/UUI5aiETeSl5a9G32a2N/2L50R+2m3buMgEpelcG4JTO5DhJQ8ohbC4y+bm621TiiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MN0PR11MB6158.namprd11.prod.outlook.com (2603:10b6:208:3ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 16:12:55 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 16:12:55 +0000
Date: Thu, 3 Sep 2026 12:12:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>
CC: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state
 machine
Message-ID: <apmcgtsW8SB2W_JO@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-3-zongyao.bai@intel.com>
 <20260813002313.3FED01F000E9@smtp.kernel.org>
 <72c98be1-1bd6-476b-9549-8e81f503a43d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <72c98be1-1bd6-476b-9549-8e81f503a43d@intel.com>
X-ClientProxiedBy: SJ2P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::14) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MN0PR11MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: b5bf6223-70c8-4b93-3efe-08df09d63686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|4143699003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EmXzqQwTbwb3SbFfXrKegK6Xl2ACcipT0PXoWEDYggdRfLEQGYs0dHXE3mPEnhqeaAcUU4xe2qOxpOA70QXObNozxRJmTPK4RUw4uIBlV4DUgCcWk5fYYsXnjO2Ai9gTqS3ZLFg22Ppyb9NPg99ZkImKkhC8wbY+G0mGBNLSaMDYxoupMbhsLLkDiqt7Bqxq+z2Wf+oA4ZqjTmZ8k/J/le/XsVfCpgichrmjMux44rMSE+3xVSK0DfdLHSdR0NTk/BGOr1ePSNOX8x/VIVMw1s388mzm/7jIk3WjxPdnCeO7+fCPeVTay/Wt+pqoxM9LdCNqHoy5ZOuzuIb9uCR2KhCojuf9w33Q9TH9gPS//QshwTeGMM/EaOZsgsEhquVwrY56w9oYOG45Vcp7MdZmYusE1uwqwY/QVi/acnX9xo22dtFFc3SYUsyEIj/h5yDjYI/RfPtDjYFmBgb1I8y1MX5ToSKEQMVKlConzGxXn80jHBB4+5KjQAQUNzWWT7p/MfOX4neGNmaJpD/2UXQxOeNxhT5taJfGNF2MHeVZlXIbWhTfo+3m+EfqpsztcIhGGNczwzIJAPKYWq1i+CgE89TZIvmPLZUNweZsc1/SJcnKFSR7+I8NUKNnq/sjY6oRJltunA5NqmYQ07Qb55paCXCIqQ8ZaORQTXUUQNSqMMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YQ8GFnUtQ+YNVOuBnHXMozvskK7OvjnIPBfKVrJBpGJqNo5d5Lp0qCOe6YDU?=
 =?us-ascii?Q?7rQ56g3cdpiBpQnQklusXHm5VnJExYnuIPRB0eN/lRjg7UoRPBJIRc48q1Vr?=
 =?us-ascii?Q?fyYBnThM+6EKSv7u04fjEAuTMm2jqDdPxJl0MIFHcjAkyaCjURrhyYRQvnbJ?=
 =?us-ascii?Q?MD/IAc+q1aUtj46C/vEv6GqjIgPmgWhhwSr6WgEVE9wK1DpvktZ5lrbFmU65?=
 =?us-ascii?Q?TYcTct61dUjuQeR2+szy3K3Cozbtnto74EFWGeRd64sx3wE//+g7YCKzbusI?=
 =?us-ascii?Q?V9zEUfbItJ08Y7qcX/pFCqo6K/XG0KgYHZdXfCK9/ii6D6LxU8CyCclziWjb?=
 =?us-ascii?Q?Ax3qqeQo0wVPzAbD0wR9sPF1uKwmNu2R4hdDayAiVI3zdwgKlz6EsydM8A3W?=
 =?us-ascii?Q?CkCGMnFVE5jekiqzngEwUhbR16jVWZDyVZqtLDPyb06dFlTWTWrvpyZHhdIj?=
 =?us-ascii?Q?WPSslcRGPQ8gn0p/izWtUINkplxS6zTZE/j+aHB0eDIyV6bEiQbWN1LOCTLL?=
 =?us-ascii?Q?4fMm/7QNMxo6zEXFtXMugyNnUmEBPuKO3WR6Vw+Q6LgWehjPaa7N7NI1dOzj?=
 =?us-ascii?Q?1yXiwGoS5Hv0gZEWWEi2phDEoQv3cpXDTAXM9shozo2Ng/ko8WGYaE/4hXLF?=
 =?us-ascii?Q?Dv6fqQ5HauNBvLHB7uXvB5v4urIU4VCZwMizFif3fEqY6ERW1QByYYasbCdv?=
 =?us-ascii?Q?fpAlbPGOSMaNQLv5vehbCdNFndlHtgzFxrUixpJQbwk/wnopbzR6tUZ+kHcf?=
 =?us-ascii?Q?wjooMkQuV4VX7woFZfwjDYpn8ncd+kutJtM3qeUQUzChOIq0HA9MmPFXbVq4?=
 =?us-ascii?Q?iSaMhnVzIFAYP87sT/7b6TwA5fRUk2nRTqsicxNX4d3e8gQygYMUPxyqdvIv?=
 =?us-ascii?Q?FVPzfGlKSMgE56FvJpeVPrOHd1mLEtp0w8hdyH75VOFIeTzQu8JngiX1nMfI?=
 =?us-ascii?Q?0JN2mJ8RYkKa75Ur7cl2+WR9Vn/5AFxAo+RL1SbQeXT04FmUmwhjAC9MZNAm?=
 =?us-ascii?Q?GN5C9t3eqtUpmDox9yCiN9YvEIBqH//DQG+qx11LT9/jkDGRxpDP82pD3RoX?=
 =?us-ascii?Q?LSrkNMdFRRWRptwY3YYCg1S0KV7fYhwNJ6mHJShwJlrx7dUd00hsfoSewu6D?=
 =?us-ascii?Q?tx3RJyNDDNNsemt87WoLbxYc23mxvPdlwr+EHMvyfQSefm2mHNAHOvD0g9ck?=
 =?us-ascii?Q?ThJul6dSouyuwA/uP9QHcAFpxIroL7Mv9BpR/qT6hAyfToEyLAm65Le1+DFX?=
 =?us-ascii?Q?FJiqzq3vP93eo2ZBpVLqzbBvQ5az8qmXBSqRf1S74U2HPxqph8RDQU29iVPi?=
 =?us-ascii?Q?v8x9Vj2zBgG8bftsX56UyESQicJXb9EXuNEuFPM4RiifDcGAnoQvMflob2Bs?=
 =?us-ascii?Q?13wZlkVl1wCoHy+k8DyUJiKBgXDPlhsvdBIrqQtDFpGbKfmsA7sKt7IA/L++?=
 =?us-ascii?Q?pXGw83UyqB1omPF8GACTWi/GqnQyqRG74unU5HO65uBu7AUuRIrbwHQqGKrI?=
 =?us-ascii?Q?BQmZtxNQvslXknV0TJPcCDr4/L2gYJ+ShmyhF46v5omSKGaAcZ4rE24eZyWu?=
 =?us-ascii?Q?rMRSZIqv5qHDMnL6b1dQJyImHCqAA3koX5KxmxlU8TQN2i0+lodahd7V/bNG?=
 =?us-ascii?Q?J1arbidB0YLHTBcllphfEa0PxzN2666CxnDy9UIGPjqmK7i7SYJ9bAiEITt+?=
 =?us-ascii?Q?KEo61NQuYKgDI+38DK/0Me+ZWApD+YjdZvPn5/42SbljIltZ76w3gqXAUHtD?=
 =?us-ascii?Q?j8/Kp6wEeg=3D=3D?=
X-Exchange-RoutingPolicyChecked: ggpR+DMJngnLhVqCCClYUED1f1h6+g65zAdjxPYs2dmfYT/ouP+HLOZi3upvd7xhESd63Gn5J0+acJpevVIfoE4kp1oKHnT4pcV0SFMr8u3oREnvEehsb37Zz8b5jsjJvFg6oQ6s/p4+r3FRWp0+9LRLbV70fq9ErM5vqSs6odn5ryOc3zLakpApXEgDoUHTVNvPliatQKqTnaCSnqd1Ys7rov6DrC6uJEEDJIzX2RvkRhki1uvBtq0+uSOv596uSq8rJ8BIKsHN2uHTJIopIw9zqxlE4RPCqUGqFmn7RGKGdjz+T4JCGfN/zv3abrbkTh+aABX6yn8aQg/I9sDuQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bf6223-70c8-4b93-3efe-08df09d63686
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 16:12:55.5471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRyITBxxN+OY7FX2Xryxadtc7eFESOBEJI8DcknLI99JWh82GBmDkbVuQ3udVwvSa362oqi2PmcbVWOLk7ywoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6158
X-OriginatorOrg: intel.com

On Thu, Aug 13, 2026 at 02:28:27PM -0700, Bai, Zongyao wrote:
> 
> On 8/12/2026 5:23 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] Use-After-Free in delayed-release forcewake due to devm/drmm teardown asymmetry and timer re-arming
> > --
> > 
> > --- Patch [2]: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state machine ---
> > commit 7a90eb7b65ee38383fb6f1973ddea842f2c9c391
> > Author: Zongyao Bai <zongyao.bai@intel.com>
> > 
> > drm/xe/forcewake: add delayed-release state machine
> > 
> > Add an opt-in forcewake release path that keeps an idle domain awake
> > for a short hold interval. A subsequent get can reuse the domain
> > without issuing another wake request or waiting for its ACK.
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> > > index 197e2197bd0a3..3f5013c7424c8 100644
> > > --- a/drivers/gpu/drm/xe/xe_force_wake.c
> > > +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> > [ ... ]
> > 
> > > +static void xe_force_wake_fini(void *arg)
> > > +{
> > > +	struct xe_force_wake *fw = arg;
> > > +	struct xe_force_wake_domain *domain;
> > > +	unsigned int tmp;
> > > +
> > > +	for_each_fw_domain(domain, fw, tmp)
> > > +		hrtimer_cancel(&domain->sleep_timer);
> > > +}
> > > +
> > > -void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> > > +int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> > >   {
> > [ ... ]
> > 
> > >   	}
> > > +
> > > +	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_fini, fw);
> > >   }
> > [Severity: High]
> > Does registering this teardown via devm create a use-after-free window?
> > 
> > Since devm teardown (PCI unbind) happens before drmm teardown, background
> > tasks like gt->ordered_wq (which are destroyed during drmm teardown) can
> > still be running after xe_force_wake_fini() has executed.
> > 
> > Also, if a timer was pending here, canceling it without putting the domain
> > to sleep could leave the hardware permanently awake. Is there a need to
> > clear the state or issue domain_sleep() during teardown?
> 
> The devm/drmm lifetime asymmetry is real, but this fini is not exposed to it
> in practice.
> The only delayed-release caller is query_engine_cycles(),
> an ioctl that holds a runtime-PM reference and runs inside a drm_dev_enter()
> section.
> On remove/unbind the driver calls drm_dev_unplug() and then flushes
> forcewake on
> all GTs before devres_release_all() runs xe_force_wake_fini(),
> so no timer is pending by the time this runs. gt->ordered_wq only runs the
> GT reset worker,
> which never uses delayed release.
> 
> The bare hrtimer_cancel() without domain_sleep() is intentional:
> the power-boundary/unplug flush has already settled the domains,
> and teardown is followed by device power-off/FLR, so leaving a domain awake
> is harmless here.

I'm honestly not comfortable with this dismissal here.
It is not only a left-over domain awake, but some potential UAF.

Why did you chose the hrtimer instead of a delayed workqueue?
The workqueue you can flush and wait in the finish.

> 
> Zongyao
> 
> > [ ... ]
> > 
> > > @@ -242,12 +330,24 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
> > >   	spin_lock_irqsave(&fw->lock, flags);
> > >   	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
> > > +		assert_domain_state(fw, domain);
> > >   		xe_gt_assert(gt, domain->ref);
> > >   		if (!--domain->ref) {
> > > -			sleep |= BIT(domain->id);
> > > -			domain_sleep(gt, domain);
> > > +			if (delayed_release || domain->delayed_release_requested) {
> > > +				domain->delayed_release_requested = false;
> > > +				fw->delayed_release_domains |= BIT(domain->id);
> > > +				hrtimer_start(&domain->sleep_timer,
> > > +					      us_to_ktime(xe->forcewake_hold_delay_us),
> > > +					      HRTIMER_MODE_REL);
> > [Severity: High]
> > If a background task drops the last reference here after xe_force_wake_fini()
> > has already run, could this unconditionally re-arm the timer?
> > 
> > If the timer is re-armed during this devm/drmm teardown window, the timer
> > callback might fire after the struct xe_gt memory has been completely freed
> > by drmm, resulting in a use-after-free.
> > 
> > Would it be safer to use drmm_add_action_or_reset() for teardown, or add a
> > mechanism to ensure we don't start timers when the device is being destroyed?
> This cannot re-arm the timer during teardown.
> The delayed branch is only taken when either the caller used
> xe_force_wake_put_delay()
> or a delayed release was previously recorded, and the sole producer of both
> is query_engine_cycles().
> That ioctl is drained by drm_dev_unplug() before the all-GT forcewake flush,
> which runs before devres_release_all()/xe_force_wake_fini().
> No background task (including gt->ordered_wq) drops a forcewake reference
> through the delayed path.
> 
> So there is no path where a delayed timer is re-armed after fini and fires
> against freed gt memory in this series.
> I agree that switching the fini to drmm_add_action_or_reset() would
> additionally harden this against any future caller that releases forcewake
> outside the unplug/flush fence;
> I'll keep that as a follow-up rather than fold it into this patch
> 
> Zongyao
> 
> > > +			} else {
> > > +				sleep |= BIT(domain->id);
> > > +				domain_sleep(gt, domain);
> > > +			}
> > > +		} else if (delayed_release) {
> > > +			domain->delayed_release_requested = true;
> > >   		}
> > > +		assert_domain_state(fw, domain);
> > >   	}
