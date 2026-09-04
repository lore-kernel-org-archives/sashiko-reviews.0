Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149383612E2
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 01:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485649; cv=fail; b=nCZS9trCrCLbdEBNJdoiyh1j08QEXR+AYzB4+CJjRlOhpw745FoNvkRjSSPMvMxZpf66sLBrFgUPLeuGW38GkYHAbJ9HiMArhK4YbyJ+RdL56Dl5gUDskohrfVcE1xgnSva2K/CR7d2d8yjRtbDntkBEqUBMHSwHVn83U1dtOa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485649; c=relaxed/simple;
	bh=kzL70TDFNblAZtDFc6B86f0eEgSFwI8ilrDdkAKuCOs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a8S5DGAa33zZXwxQWBIXc+JdWNex7VaaV9ONL851T9Sx/Sw+SsxEzwfJfyOtpVb3dJjf2q/Df6+ld1ZSWNrEy0WmQEccU8abqaEU5pO1bi3RMVGBIEIX++DPljjUe+QmaMQl98XITLujU8Er/dtKEVwBwnkl//XBMOX9TFbQZ/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfhoJsKm; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfhoJsKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788485647; x=1820021647;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kzL70TDFNblAZtDFc6B86f0eEgSFwI8ilrDdkAKuCOs=;
  b=hfhoJsKm+miruKgfv73lZVnFl4pn7TghXLiZWGU8noN2bs1QfFw/5mkX
   BXsuNergAOPFT9czm/c4PFjdCxdUdoSNfBIA5vt73poKJsdXPXaFwo7IJ
   4GOzQS5dnucPy0NbnqLNjtj/aBVfwUYtlbNyet3+NCqlmCIcjvauzB+GJ
   tfR6xCvDnEOk3dMBsw4g6mhwtTLWko4css6wxga84zgNwQjQewVjHdmub
   KH5f6DIEYEWFJYHVqT73Q9/sPLbMiwU5utX3I+q128jIkrWQzh8tLuqPz
   4/n6zKzRQeWcR2E6AoRjjF3M5VUh+yjCOjz0Dz2jJmRix6jFWjhMtlhwF
   g==;
X-CSE-ConnectionGUID: gu9EBgEgQAizduu1aRCfDw==
X-CSE-MsgGUID: YoeDDcuyTGGjkEgMWazfEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89107323"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="89107323"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 18:34:06 -0700
X-CSE-ConnectionGUID: 4Lq5G5S+SOq3ckrTrFrexw==
X-CSE-MsgGUID: HImSFnmARRG5mLY07mkMsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="268155754"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 18:34:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 18:34:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 18:34:05 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 18:34:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pb24CMo4YezZh0/KaWS92fXypKUJkkfcGpN9xARgTPIZW3PjDUKwEWGD2/2bJUKecOUa2c2qPyjVfK4eSa2u3TL9CZH64OttA5dKF+g1TSYa/KNONIA691mJyk51yD8J4dh95m3aQCJ2q4pt00ko0nBc/Gzeq7p6yaLM/hTfpUj/MCavyrBq2+fjdIpi1qod3+qzDNtYdfTp+a1AiD0U5p8GeBmSJX/GbVyQ44sViql/rvNN9Y7pcrNq4ecSnCe/P6YVr2oJXMvFO4nbV0ZmENpozY3jiU1xe7BLb2HvizMUNsBv62rM0B+hA7XCJY1XWrH5UX4MlH6aA2nGEeLL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXxDsA/BSFfNet8rRIt2s7SWhqwloPOG8IMAl9N7PR4=;
 b=Byn43tWxM+Ku/vTKUvTRlthiLRy21wKypWBadISZmd95bQWUV6CFDyhKXtdMLXitEt/y8QTZ+1Rw/VX/YonynS0tbSFErV03oOVNV34fz2ZUodnLnNHqX2XHFk5Sf5ZtEsXFD27o/9BjGAmzRFH8GQ6ihaiRXHyUZXVrKlwf+w9u9w67kbIH7QAz8W2C2pRRru5MhrvITTfs3bSHvA9QFV3qnf2RR/ZgFAvhKgfqlETvOv7m8CjczvR0b7IXdDO6+XWgqOC9rrGUxkahCR7H5whHhqHMyRDKYDCrbJoAmu0a+8N3ZC0z7yEMDjWyXV4wVVruJnPMNd3uG8bKoelvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9351.namprd11.prod.outlook.com (2603:10b6:208:57c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 01:33:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 01:33:58 +0000
Date: Thu, 3 Sep 2026 18:33:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 17/25] drm/xe: Add device flag to enable PT mirroring
 across tiles
Message-ID: <apogBNby1891GbhR@gsse-cloud1.jf.intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-18-matthew.brost@intel.com>
 <20260904002953.B10C41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904002953.B10C41F000E9@smtp.kernel.org>
X-ClientProxiedBy: MW3PR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:303:2a::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: 41aeecf4-24e1-4e54-c356-08df0a249760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cpcwwpaR2A4Uf6NSZ69OBHnIKFfYaiB4T8qyREdM3roVLMkqIzDUziscPuuxZ1Xsj2W/xaCFYyW0rwiIwTQy+WDkZuLQiUQDTxs3i6FJhB7GcpqmcTIJvltT2+2TJ4RJPpXWFoDFi67PBdqP4wlVW4F3FO/u/T6FbTAIgEPEIQxv5SwsDJaNbbKT90/KYqjX1BVCBtBioXXA7kX65w+Ii9mJ47bdJHtmMz5HVfUOdw3TYlBawKY/LzqSXTh3+YqGvUpFWePq0Ou+GxXX3dMhdWOVGpmp637XORj7NX5uxRMmsOT6tFYbRKFbvmWCPxlegmK4oyJaGzR1adFYhXoJzqutRl/0qbgpcudOVq0Wd+4dec4XSok93s0NQTV5PG9yIsul4X01ZSMvA+THppDbDoW6Jdf/kie6sbn9Z4KqwHls/yQi2dCa/SXg6UnaW2YqZFH72zBgzFBae/YQSZhM5+qAX/6P9OBO737Iy4r4Ebfxp2evWt8f7QnVn9svl1UH2JG+lapz8lMl3JL2nDvD2v+6iiSxqGLT+zSuzVyQUaoWhqcS6MHghpCx94cMJKqSVX/FDmzGyVm1FDqLEGIToCX5WnhYGZ7WOjYn4AroxfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+BuF11PTjEg0Xxm/73IDOmNsqQnD91PPD7i9tgQGgFqNHVHWa4bXvuKM6p?=
 =?iso-8859-1?Q?8T6kLIgyBYyf4khcKuPgM8Audo+Yf0u8/dqQqofmS8rFBbbCud6cCd2+aC?=
 =?iso-8859-1?Q?jN+v0ctEUqklpFq6nLKNhkOfBdZAgET6Iu55Rp0uGicOkNXCYE8XYbp/CF?=
 =?iso-8859-1?Q?bhUP6zTM4aejZiaUo8XxaNH7Y1JDwcxKRN0kYe8PmYF+MG9hi5krpl9Vzb?=
 =?iso-8859-1?Q?qjGU3OPcWWr9aGU7+XNUwDcPY6t+SUyL8cT8o2C9i6y/CltAFQlRXeq7Z6?=
 =?iso-8859-1?Q?J6oXNFzRlBJNWa+W9Uf6Yu94RIod+dqeN9rzyF25/vuiat6zpO4/qjGch4?=
 =?iso-8859-1?Q?3ES4t0XqtIVKz7VHpSVQixBLTaUEUVEE3H2zCr8MtWEeDrYug8G0hcfgs6?=
 =?iso-8859-1?Q?8Ma52ihYTGUnpn7EdHzPjEHBb3xf2RH6Zg3GF0nWUbbLbzhKjULQFsMJ0y?=
 =?iso-8859-1?Q?+nAGDB7CRKRvs9FZAptNUQl1oM3lUPY3w1y6k3Bruh9KmlaHR+z0LxN2ls?=
 =?iso-8859-1?Q?VIwUYEOkp27yFScFCswfYtmF+BqzX+9KHZhtG1FKoUgy3qiqPah35T1w63?=
 =?iso-8859-1?Q?P6C7NMLaWQr3rj6W9IPFXtT7ndoePnRE9eUkM1/g493H2mv7k/fJ+V3Wks?=
 =?iso-8859-1?Q?48SH48q8bt4rsXlFcLaib6LOjuex+M+A4e2KLuxJ2mtgJGiADHqD9qbWTb?=
 =?iso-8859-1?Q?MST5j4nh12bTJ/82Res/JiOcibSCuZIqQ4ceP1EnXiVeUKc7+hkqDwT9FC?=
 =?iso-8859-1?Q?9TE22hZBYp5OkSOlfrOvfE8BBRNDNl9nakWQQSKL+wWfeS4P9XvWDW7dsm?=
 =?iso-8859-1?Q?9BjnWIcsrpLWuMga4/wLv0D7S9ms8eIk8LEK9cQSDKQ3Qq9zc8DtUBx+Rz?=
 =?iso-8859-1?Q?FKG48EBzYg6hDB6Ms60A5HvCaqI87s0CsH9YiYZwBaMjtJ3tHvqntY6Do/?=
 =?iso-8859-1?Q?jjNRCoGtk400s/PHniF2cv0Q8NCsbaoAFkj6q9jch+ZPLD3u3a5yiWNIcM?=
 =?iso-8859-1?Q?IaH801Dsvq278AmmBB7odANE7GeI8cDvOYDDt+JEqYnIDLribFVLCFAomg?=
 =?iso-8859-1?Q?h3oaZ6SuOKPHa729U5Y60wWkV7O7v49cBqopkVxwCYxuY96dLrTUdwqdTW?=
 =?iso-8859-1?Q?dKAGGeRGZPTwuEfa2GGn8RoZJwy+E+yZTCeb4L7jWm1GYV8aVZd55p3oni?=
 =?iso-8859-1?Q?NFML/n1a3YRYIyMfNCeyXL0IxmQIhPqCQADSD/J1HPzcayds8t+RDdIlOM?=
 =?iso-8859-1?Q?61s/sU3y9fqgY6qo3dHp4Wog1ubeFSU62wQIo6Xo0OvLxIUWDei3QZFgrs?=
 =?iso-8859-1?Q?dJn39R8vaZurLqvlKpA60ta2h2p88IFQ7jN6+serFXG2TFl1jzRB0YOYSw?=
 =?iso-8859-1?Q?2F1TwKofuM/xuFHZNdP12aP2ttuUiJdc/y/wRJ/7cVDPd3WMlez6CSzzjL?=
 =?iso-8859-1?Q?t6J7GYTPYoisxa+5S7/3uM243z4jzX2VU8lUdLXAS4afNQ30+kspAPJbZl?=
 =?iso-8859-1?Q?GdkwMVLu9AZ1Hgx4fttf3uZvDmMhHr0CSGZXNa2jtU2gJFUUQVaAsi5GtD?=
 =?iso-8859-1?Q?0fTvZVRhcIp4MsXyJnpDrOVZPVBJDPtXBfhf7AiBWCq5NCDawVG/MabnzQ?=
 =?iso-8859-1?Q?agsVf6OmurkF/btrY//3RQHrJ3coEq7RJ8mMaJiN3LgLqiM2XIbCobNk3/?=
 =?iso-8859-1?Q?FhJ/cJhQotXM/1pQbVrgyu7CNbNuELj5Wmy4vaq1iqu8CNS7KgQDlE9m10?=
 =?iso-8859-1?Q?pGICfrl69Tb0mw42b/1K2tfANyNBMdphkQrd38JbDlJKk7RCopgQzCD6v5?=
 =?iso-8859-1?Q?f0sSkxwua8CSwTm5S9+rZv413JNnc3I=3D?=
X-Exchange-RoutingPolicyChecked: 1RKQC/lJ2/et7dZh9TdV1jTO0TKvGdUGF72RanE5wsmox181RhG0dHZD9Ab78xXf58+qDJK0DHRkmtO0T0Gx0fnqbexaoxkphFbUgDtGcAvzm7Upzc6yqMkQSgc9r3IBcN2SPWMfrHZX70sc2XDDK+aov+1hU25O/MmDYxLyCmo404XsD2EMrGE9rSVB6amTLfM5b4YgnF51Y9oMNYIlE0Bt6mV22fzbekiMC/dMOzHJDpckE1iHXm2N7N5mLr3Ob2gFDyCLApPUHBMLNzZSZJBE/2/lt/Ua9CVYk0khi1O1/rzlhQ18x9K27nPQp/zJBgTE2HS5cFzqgcrT4d3Fjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41aeecf4-24e1-4e54-c356-08df0a249760
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 01:33:58.5680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9E8j5D1E3MisIJwr7XQ7G3khpNeTuaLzy9Ahfq0tf4IOe8G9FARX7JFL2NW6OOKZgwTKES1P/V991PXy006ZNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9351
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 12:29:53AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Incorrect tile mask generation causes missing TLB invalidations on secondary tiles
> - [High] Shallow copy of Page Reclaim List (PRL) leads to Double Free during TLB invalidation
> - [Medium] Unnecessary allocation of unused page table roots and scratch tables
> --
> 
> commit 084f96016724c31d7bcd97e7c49979198c29fe71
> Author: Matthew Brost <matthew.brost@intel.com>
> Subject: drm/xe: Add device flag to enable PT mirroring across tiles
> 
> Some multi-tile devices may want to mirror page tables across tiles for
> memory-bandwidth reasons, while others may not. Add a device flag that
> allows enabling or disabling page-table mirroring across tiles.
> 
> Link: https://patch.msgid.link/20260228013501.106680-18-matthew.brost@intel.com
> 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 821edeaecaed9..deb33e85e6eb7 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> [ ... ]
> > @@ -2542,9 +2553,20 @@ int xe_pt_update_ops_prepare(struct xe_device *xe, struct xe_vma_ops *vops)
> >  	int id, err;
> >  
> >  	for_each_tile(tile, xe, id) {
> > +		struct xe_vm_pgtable_update_ops *pt_update_ops =
> > +			&vops->pt_update_ops[id];
> > +
> >  		if (!vops->pt_update_ops[id].num_ops)
> >  			continue;
> >  
> > +		if (pt_mirroring_disabled_for_tile(vops->vm, id)) {
> > +			struct xe_page_reclaim_list *prl = &pt_update_ops->prl;
> > +
> > +			/* Transfer root PT update ops PRL to current */
> > +			*prl = vops->pt_update_ops[0].prl;
> 
> [Severity: High]
> Does this shallow copy of the Page Reclaim List (PRL) cause a double free?
> 
> By copying the structure directly without incrementing a reference count,
> multiple tiles now hold a pointer to the same page. Later, when
> xe_tlb_inval_job_create() adds this to jobs in xe_pt_update_ops_run(), both
> jobs take ownership. When the jobs finish, they will both call
> xe_page_reclaim_entries_put(), freeing the same page twice.
> 

This is correct. Will fix.

> > +			continue;
> > +		}
> > +
> >  		err = __xe_pt_update_ops_prepare(tile, vops);
> >  		if (err)
> >  			return err;
> [ ... ]
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 33ef4ccc3550b..d9a9c0844c5e3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -844,6 +844,14 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> >  	return err;
> >  }
> >  
> > +static u8 adjust_rebind_tile_mask(struct xe_vm *vm, u8 tile_mask)
> > +{
> > +	if (vm->xe->info.has_pt_mirror)
> > +		return tile_mask;
> > +
> > +	return (0x1 << vm->xe->info.max_gt_per_tile) - 1;
> 
> [Severity: High]
> Is max_gt_per_tile being used here incorrectly instead of the total tile count?
> 
> If a device (like PVC) has 1 GT per tile, this evaluates to 1, causing the
> generated mask to omit secondary tiles. During xe_vma_rebind(), the num_ops
> will only be incremented for tile 0.
> 
> Consequently, xe_pt_update_ops_prepare() skips preparation for the secondary
> tiles, leaving their start and last variables uninitialized (zeroed). When
> TLB invalidation jobs are created later, they use a range of [0, 0] for
> these tiles, leaving stale TLB entries that could cause memory corruption.
> 

This is correct. Will fix.

> > +}
> > +
> >  struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_mask)
> >  {
> >  	struct dma_fence *fence = NULL;
> [ ... ]
> > @@ -1737,7 +1747,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
> >  
> >  		for_each_tile(tile, xe, id) {
> >  			if (flags & XE_VM_FLAG_MIGRATION &&
> > -			    tile->id != XE_VM_FLAG_TILE_ID(flags))
> > +			    tile->id != XE_VM_FLAG_TILE_ID(flags) &&
> > +			    (vm->xe->info.has_pt_mirror || id))
> >  				continue;
> >  
> >  			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
> >  						       &exec);
> 
> [Severity: Medium]
> For standard user VMs, does this unconditionally allocate page table roots
> and scratch tables for secondary tiles even when PT mirroring is disabled?
> 
> When has_pt_mirror is false, xe_vm_pt_root() is hardcoded to return
> vm->pt_root[0]. As a result, the allocations made here for id > 0 (and their
> associated scratch tables) are never used, wasting VRAM.
> 

Techincally, but I'm not going to worry about 4k vs functionality
required for the migrate layer.

Matt 

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903235842.3401722-1-matthew.brost@intel.com?part=17
