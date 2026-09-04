Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D72B2DF134
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 22:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562463; cv=fail; b=GXiPInvb4fbqBl3FzDuTxKwqKX5ZZytB0f8xSvmgy9HyJilOcoVzw30bEYX8AcnDiYNpqy5OHYZGLUWcLHQp2qeM1sUQFLwHAr8UEavvWEmlEPA1WuwAk2ShZQHMQR8MJGivPKpm6ewIPN90xSMNL4drWGw6/Ha3YaVkIPph3Zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562463; c=relaxed/simple;
	bh=Wh1MsV7fWXkloMkCt5DY4G8ELNyu/uHimRbd3cgHxdo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LL1S6l5ezwIquwiHyziN/DUQybcLi7pH7OX5RHvizx25iSUeFo+r1CfxM3j6RA2UJYKZz5vxcVr2L48WDvvPScAK+0n/KjgUdmIeh9VEVrNMIY/E23WBFkR8QINqeVsvBNtwE+Q9HdFfnMb9nNdO8remP3ksgeqCLYddGHxK8Bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWXaJanQ; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWXaJanQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788562462; x=1820098462;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Wh1MsV7fWXkloMkCt5DY4G8ELNyu/uHimRbd3cgHxdo=;
  b=bWXaJanQUfkZI3gSRz8tKHDuQZvfFvMQYW+7krxxXgM4HgS7HXwc6JSc
   lCZkTDRCxWVupMtquieNaew1Wlsw48xxbrt4/ddonuPKp2HChC5Q1JROs
   1TJRp6QbOeJS8eHxjlqYHFUA1QWsauHAh5AdSU8sNy1UIEDMU7st54log
   DOFwPbD1Iwivq0a3DTOovDbIkVkiuhx/xGxA7lqiQYxXuFIg3pwFQ1ivQ
   EhM6z6uTdn8i6RId0SvCDOj+9DUx51NB/hc6HXJYCI+Puz2ybiIDYpvnE
   JRNj382kZVLcPSDU4FoSUtPrthVrBXSLf/pKrC/c/UQVX6J7WR0KHZ1s3
   g==;
X-CSE-ConnectionGUID: fMEGgGW1ThSzGT3xWQN7lQ==
X-CSE-MsgGUID: TFk4JxLURKS8kNB6j5cRXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="111843206"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="111843206"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 15:54:21 -0700
X-CSE-ConnectionGUID: DfCwOdt+SvWC0gsupvdvBA==
X-CSE-MsgGUID: egNJvW2uTUaUEZUy9FSf5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="308377799"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 15:54:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 15:54:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 15:54:20 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 15:54:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7gwFVw2MyzSeuWBleSkpfXur6NJJ4CkV+kig/hkTYhuKoTAGE8CYUlI+/PbuKxafrvWveFHjndujNhOHoUByA64MiWfLzjb4tr1O7hLzcHhWOi75WS+AJ7m2sHcl0gf+Y2xbcD4vlWCS41mst7Tgkw2D0yY5XYG7BO9VcsXNSIujWNeELcHXvvHMM2ws0hx3ou+3RHXN6drwuRwqFj55fFFNiOI5nTAC9v/T++Nsx1RolzLHmvVsi7bO4plbvwJZnYSTI7LOS0zBPyeFXntUw7ZUPbAymBZQJmAdSkIuE/F6o8bLk0SKnvwqFjocgXmkpQSYRkncPAGhlzKTo6v1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrPCyzM3VZEx1kytQ2oviZlXEptFJTc90i5CqQlPs2o=;
 b=tDqIzbQA9PnXnnWsPY90Bsqt7nV3m+seO9Th5AF7u++9o9vSC4tFKDiTnNSEigrJE0RyoW6udMROoumaeZ49kqwzmuUZOXGo2fmhnfgINme7DIYlvqx0hJKylrF5TU8Xr0b9jjqpMXgYcWUDVBpJFUBeXHO6uoRtgHydOPzG3r7f2AoJF2AVlkIjTuYHU9CvCK+td+wEelF98hwjEDx5i9rqDlhCkZ8q+OQzFCl6VJIE+FyQJ2foiE1gCAj//JBVCGQ82iBEI1MenGg1XUgMvfeGQgzYV1kmBVkL1twxZtD8BUKQRVVj4PHZgeFTsytqU/6wJfnelumBpsW5OTtM7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Fri, 4 Sep 2026
 22:54:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 22:54:11 +0000
Date: Fri, 4 Sep 2026 15:54:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Skip clearing purged page-table BOs
Message-ID: <aptMEJeOFC9nVw7e@gsse-cloud1.jf.intel.com>
References: <20260904122121.806122-2-tejas.upadhyay@intel.com>
 <20260904124022.A6EB81F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904124022.A6EB81F00A3D@smtp.kernel.org>
X-ClientProxiedBy: MW4PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:303:dc::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d168e6a-0630-4dec-d381-08df0ad76f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|11063799006|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9tC3KzPYEYSaJVP5cRMuiH7nPcSgs3iJk4q0JwQ3xufriTvBxtD4GrFwk8Ym7+s93iUCNECIV33HMCNJHMguX4iIIzl9D8kxmKfvJ++HC7/hPhO5luFizSlJa0c0hfBJFlHZA1wN4FQPBkhENdhEmKS5K1YmoIgZjIew3dSD13xeC44rVZaKbC9jQXHzklDMmSXjaEDV8yq6i3vJkOTKtZI7yTFpvjUuTClWIYvW3YxxIIR2uS0yISFIgh8OXTefV3XJxOj6dWl+ECqf0oke8GtSGWBkXhx6QlGDZZtL+0dPkpwkJmUqV8I8MBJ1b21UOfBv7er56asJyH2oi5uoQqZ7HWPN//QPPGtuLvmPk3OiCMmuOK6xkQ7Ks37T5HHd/0Rxc/m3vhFnZMIvK7KOkAD5m7nZbSwNmtyWCTVQavwHqCsUu96L3+l0skzG2Bx4a8u1ktT9j/jrt3/GZOda4RI1agPy5224woVxkO4CCU1LdrfEeOU0Wtm1inxs7ZWG8aerfnEuS3NXK5t/GuqGC1mXOILPGXI8fHGjNmJpuH4i3ugpaIumhrDFGH8IlEP6etPaZk/nCpkp2Uk48JeSkeNGiTUiTNcJHh48u84+kGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mfdSLRK8Xl1dpR24qaWYM54nDJflBYyg78zrm2+UlQNksQMSQCSGZA47z0?=
 =?iso-8859-1?Q?J4I7AfYI4Z9b1LITcn1YPuTRBhg8jGhKnHCz0pmf1EFSjajkKjztrmvP6s?=
 =?iso-8859-1?Q?QaNZW7azPEWwGRbSmJhvduYop8gT+thE6fz2Pk3SkCyYF/xO/iV60DV7h7?=
 =?iso-8859-1?Q?pp7QWuHhF/iLSm9QXZP+9X5Am0+A7HfJIBVcgMLpER3cr2wkTkpSEXroRA?=
 =?iso-8859-1?Q?BtraF/QT9oNj+AxGxgs4NbaBS9negNLlQAkDpDI45WWLDSAXTc14mXitJH?=
 =?iso-8859-1?Q?dNIP2h+e0UCNnKGWvp+jDGcJ4gczl1C992EXdaWrFHrjHP5fhnRUTqL0ia?=
 =?iso-8859-1?Q?hwzrz9BwT2k3hATRGwGEFdaRx6JjaFt14o3Y3jKXfUlWRJK2iB1nv4z+NN?=
 =?iso-8859-1?Q?UMiodzFbspv0Q+vqkJbWIvf0cVdJmCyqO9HeP/kxSBweTOQwdMHH5+rfrz?=
 =?iso-8859-1?Q?E7B36qN76T2vQlsxTobFHmJp2SR/8uSOJMUmDXxudbm5/EnrgQjRjXNB/y?=
 =?iso-8859-1?Q?QUzvutxM3TuSlpDEyaenhHWZRQ+QClTY0MCo87tWiHiHo3gSv1i3ir2CDQ?=
 =?iso-8859-1?Q?ViwOyRk6FYZL/DyIQXdRvAIFIlPZxi2JKA5PLz2VD+JJ2wqXkHDThvuaSP?=
 =?iso-8859-1?Q?sAkglHFOxELqKeMQDv4VuUqo2aAUT8qmR5UtDtn4OctdnVILwnL9Aj9jNY?=
 =?iso-8859-1?Q?uBKgVyA93jIIN+/LKonoExzWpiMnxs3P4n7T2PtA9U39eTVgvMoYOeSnum?=
 =?iso-8859-1?Q?SjH5x5VOTaMgTgJb6eXegN+OFnt5XrJ42Wknk92odT6d7AnY0fIZ4ZQYni?=
 =?iso-8859-1?Q?UMAeY9npBcM3+2q/8WSINVjP6Bo7JxYVMl8Wbp64PCCu4UiFEnWYlLmWdZ?=
 =?iso-8859-1?Q?pqhctEBMW3L+rQJiEuhA7vgeF19Gpcr/+WM2jkHPEVWvD9ijInKb3wSdw9?=
 =?iso-8859-1?Q?ghmohxMFCKiWay4GSptHhxDD882r642C2V7lBa5swtsJLU+wxRFfJfj98I?=
 =?iso-8859-1?Q?LXeoR7QNjknWa8kdFcw68N99APxKWnxm0y3TJ6g2cjCojjaGcJr1jAYJf7?=
 =?iso-8859-1?Q?BoZJUbcAwPzys6kcfoLyAGtDP553+wW8YLR9qqR0S21eapwEcfghEKAQ+W?=
 =?iso-8859-1?Q?BMkAu49aw/lR0Pc6zkvVFosvY4AmCqrgCqVRSoz8dhgf7Y1CZvcFkdPWwU?=
 =?iso-8859-1?Q?2jceUhcUvX0acjTWcVBFwbN65cBY5uqT5l3J6Tqg8534WCgqzFgAY4lxje?=
 =?iso-8859-1?Q?blC7g1/eXQhBAuzlfRJ51Aav/zNdNLojXE50wq6a5teyO0hMTMzd62A4S7?=
 =?iso-8859-1?Q?Oae0qFGDZ69UCoaalTo/H9KLS0JW6rpDkGsrKSlUOu3JDyXNnkA0c2952C?=
 =?iso-8859-1?Q?5OUxTIWTlkRUNzuCBTX/vpC9JqSDw66EqpVjEJ2eZBSTvdv0IztA9PHTdo?=
 =?iso-8859-1?Q?H8X4BbqUJ8gkvpPTvOkF2jyAu9NND46zqMD4dnfbgWf7/3ZHXuUrtb7s+t?=
 =?iso-8859-1?Q?yrqbAmenYnBFz2KgOh03d4MlPeel3UKNI4EJgwJqPZVcNP9fls8XgXh0XU?=
 =?iso-8859-1?Q?gWTEhYOnh+ywynoKeBJiH8z5y0iG92OKoPmzbwPrs/QxoR9DedEweYq4aj?=
 =?iso-8859-1?Q?faUuuREKFXSofAzpjbrMdGmvEhfxXxXZD0XhtnPvatVFw9FpdFmn1YzdMG?=
 =?iso-8859-1?Q?St8ymXKi31ynGkUXb/eI4HI9+wu0bvR2J1BLK8R9vjW3vQ1NCMyEbxqSxx?=
 =?iso-8859-1?Q?6BuKpkWmySe9tX9XBZMY84tKLO8xla7Ioy7Bhi3I2mZRxw52FRXX3JuUXA?=
 =?iso-8859-1?Q?dtVAVqitz4TIzqkmqVBTJB8cbhwGZSU=3D?=
X-Exchange-RoutingPolicyChecked: yXhSenvWb0EAuDqOjz7xTCXxbe7S35btFAUuwwJ3dmKq4wDZKvLrv3dXmwZdKLfDb7QfZDVfFEJk7hCT4I7xVLUX4PEHAxvGrMCp+lQkAHvSO0i3Wk8cB1Te0pRFyuSMsPpg7VC0F6zv49Kea74TFQc3VAu6lLozqUGTPX+96KXH+UYNIh1KcVo2aDVHcyp55dTgSByCRcL5hl5t6zEnJF40NWxS/Bt4NLcm1CHQck1tmj4rCyss8W0c0Zkl6IEl4WOP39jVxIBbcBG7bvwcMT5s7Q2FtF1jGgGYQoFe+4tkl0OTXJB7Jldqgu3/iN6PSJ7To13dRkuqSE+HQnHLJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d168e6a-0630-4dec-d381-08df0ad76f34
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 22:54:11.8503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65MitvNq9sURBb5oNJqv1hceDSowJevwukhYR8MuGPsDyyk0NUboBP2B80VNB+DTyV3AALR7D/GtO5EhQgiQ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 12:40:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Incomplete fix: Page-table BOs accessed in `xe_pt_zap_ptes_entry` and `xe_pt_stage_unbind_entry` may be purged, leading to a NULL pointer dereference when accessing their `vmap`.
> --
> 
> commit d85d3cf8e80d3cf9458c1419a52b39bf03260f55
> Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> drm/xe: Skip clearing purged page-table BOs
> 
> This commit updates xe_pt_clear() to check if a page-table buffer object
> has been purged before writing to its mapping. It acquires the dma-resv
> lock to safely check the purged state and avoid NULL pointer dereferences.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index a07316a45d79b..74a6174aae4e3 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -236,9 +236,12 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
> >   */
> >  void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
> >  {
> > -	struct iosys_map *map = &pt->bo->vmap;
> > +	struct xe_bo *bo = pt->bo;
> >  
> > -	xe_map_memset(xe, map, 0, 0, SZ_4K);
> > +	xe_bo_lock(bo, false);
> > +	if (!xe_bo_is_purged(bo))
> > +		xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
> > +	xe_bo_unlock(bo);
> >  }
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but while this successfully
> prevents a NULL pointer dereference here, does the same vulnerability
> still exist in other page-table accessors in drivers/gpu/drm/xe/xe_pt.c?
> 
> For example, in xe_pt_zap_ptes_entry():
> 
> 	xe_map_memset(tile_to_xe(xe_walk->tile), &xe_child->bo->vmap,
> 		      offset * sizeof(u64), 0,
> 		      (end_offset - offset) * sizeof(u64));
>

This probably right but tricky to solve. We really need to do is lock
the entire VM + take the notifier lock to ensure no zaps race + set a flag
to prevent future zaps running on the VM. It will actually get worse too
and we have discussed pipeline zaps in TLB invalidation jobs too.

> If xe_child->bo has been purged by VRAM page offlining, its vmap is cleared
> and xe_map_memset() will dereference a NULL pointer. Since this executes
> without the dma_resv lock, could it be vulnerable to concurrent purges?
> 
> Similarly, in xe_pt_stage_unbind_entry():
> 
> 	pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
> 

This isn't possible as we kill the VM under lock before purging a PT BO.
New VM binds can't be issued on a killed VM, thus
xe_pt_stage_unbind_entry is unreachable. What will be problem is
pipelined binds/unbinds, once CPU binds land (WIP) is if we remove the
CPU mapping, plus a few more issue detailed below.

I think both of these are worth documenting in a Jira. Something like
'safe VM kill when purging PT BOs' - I didn't review this part quite
enough but we can fix in a follow up.

Below is roughly the flow I think we need to make PT purging safe:

- Kill every exec queue in VM, including bind queues (future proof for
  CPU binds)
- Kill all TLB invalidation queues on VM (future proof for when we add
  zaps)
- If not root PT, invalidate root PT(s) + zap PTEs (cuts hardware access
  to PTs)
- Lock entire VM + notifier
	- Set flag to prevent future zaps
	- Set the VM killed flag (cuts off uAPI access to VM)
- Purge BO
- All future zaps detect this VM PTs can not longer be tocuhed - flag is
  stable as we always have at 1 of the locks when entire VM + notifier
  is locked

The patch posted here should move forward with the locking fixes I have
suggested in previous reply, as this standalone fix that is also correct
and required.

Matt

> If the BO was previously purged, its vmap is NULL, and reading from it via
> xe_map_rd() will also result in a NULL pointer dereference.
> 
> Can these paths be triggered by unprivileged userspace via standard VM
> unbind ioctls or MMU notifier invalidations?
> 
> >  
> >  /**
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260904122121.806122-2-tejas.upadhyay@intel.com?part=1
