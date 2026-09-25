Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395C83B4EA9
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320891; cv=fail; b=ukfzb99f8lVj5tFUBC4ffpBHb0pDfAmOJiE6am7c2fL6UfykdbkT2bZTHUI7V+GUA8pZcXUMvMf7mKttaz5Gj/6CtZOcXgkYWHlY+EGO2GBummYVWCkegME5VIRpnUrfivMlhd9GuHT8T2w/MvCp8gmtFXvJhrYFqTwGThrfkmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320891; c=relaxed/simple;
	bh=sohamIqBHK3KE4b/8DCWHND0C019BW59Ka8EdxU9YZw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mS4fddC62FEKMmmDvmEPbbvjNoiLYYRtfY2sEnC6EdCJh2C4Zv/cbybpzgKWPhv9Pu3MCobKLCii1Fx0ETV1M3NG9NnQhGmkxCjm9SYnjknkWmdh1qsuVAGVD1SaMKw5WruvAzNjI/7JQ1pCkfkNuUNMGaPNfPW1gIjPUNAa8ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYbn4+NZ; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYbn4+NZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790320891; x=1821856891;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sohamIqBHK3KE4b/8DCWHND0C019BW59Ka8EdxU9YZw=;
  b=cYbn4+NZFOFIv3OKQMsiI2Q5sD0mXC4VDOvhE5NIiOKz31PuQf1djeSn
   kJcudq5PNWgzqxZbNszdcma3Vi24oEChusm26BWo6SA7ThQ8KrVOqSPWu
   7IwLOHPMN7SbnNV+LtTPJe51MWlqO14PwXtbwjTV2gRiodcGxB7Xv3DEh
   B4UYtO+goWcrNRHzwNTG7YPpOlV0tqcx0wowjFo+5o0AGNYAh1Uav7wbU
   AmeVfb57Yk56I88YfWYDrt7ev+6Yzo1JrhuUcIFEdLEsI4kgMATz4mA30
   dduO4H+BJUCpO+z+AnCUopc2jjxJhQIKvRsOkmnfgkd2/0rr60IeA7RZL
   A==;
X-CSE-ConnectionGUID: oI2qEvrtRX6WxEKnuPvxRA==
X-CSE-MsgGUID: yCODmuseQa6rFCfWyhqfuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89871463"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="89871463"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 00:21:27 -0700
X-CSE-ConnectionGUID: Lc7rb3gLQ9G60//0vowy3g==
X-CSE-MsgGUID: wAfUiDx8QieyDfpU9VF++g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="312190292"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 00:21:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:21:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 00:21:25 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:21:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BA8dCFuuqQn/lrVGgqLLAfatjv68Mme8HHs2wJyRUYrztZjR7EupDLrmn+j+lZTm31V+hLgG/xqXTJmbk/bC3O0mxKAjnZYeY50O9ZA8/KNTyPhWPZOWeJxF3rDE3D4VpLAyv2YqOyuBtJNAmauc9wPGV0UZQ+0Q6/L8aKxRaf3x8+vIARH27fR8GhpQ/PoIMCg7+oYsQef6MjEENQ9vXYUoH7guN3cxcPe3yzPbXYYOZEGGK+BSaS8eEMXYKajX4j/An/VMk2mIC/ST4UtpY3Pu6lHCUC7siX4D4yTf2opTXumA57pvYvu4unJeW4z/Up0wmn88sPHwgXYx4/OfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvcNo/30Kw+U2439YSbgHtKzdVCroqA7qnHu2/Ws6rs=;
 b=L1W+owE3/VmrpDjFxeLsc6uSj6VZwQ/lFm6tnGEGBARHz3msu2YrCRyZdybIIX45tyXPxi+yXYdo4larpZco6JsWRp4/UV+uhQer87bVqv7Iy+pE5XTLY/Wh3775Gb3nxFjhRt5MFo6jrO4SXwqf2NqiiOaKuqUoQOcLbzvyQVk5c6XHN95SUDPd8fToW0OB1OivTMoEA+TK0aCN2l1GLKege603t+7K5DgUdCmLTat1HWw05M4bKwMjbY2hh1UT2oCxuCBPOgcl1/RsHIc0NYZc9l+WxagMATu+wHpyTIE1qhtpMlWPwE0IWvQS0pq3VYAFbiw8TzhkfmQCQnX0SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by MW4PR11MB6888.namprd11.prod.outlook.com (2603:10b6:303:22d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Fri, 25 Sep
 2026 07:21:23 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 07:21:23 +0000
Date: Fri, 25 Sep 2026 00:21:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 17/24] drm/xe: Add device flag to enable PT mirroring
 across tiles
Message-ID: <arYg8PPkIn7oI+3t@gsse-cloud1.jf.intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-18-matthew.brost@intel.com>
 <20260925062511.4B67A1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925062511.4B67A1F000FF@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR05CA0152.namprd05.prod.outlook.com
 (2603:10b6:a03:339::7) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|MW4PR11MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 70adfa38-11d2-460c-f77d-08df1ad59a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6e9rTRdhR29EclXKoblunyR63OAgOOL8yLj6JlnrmkDQbFOhj0GPJ0U5pTI3WVeLGgqVIOhL0a4VJxGmZFhjLXJoiRDu1P32N5YuLZcejlacpzyFQNqaAZqxAz5hZ350W0CFiE9oPc96VP6fU/8s5ijkpus7l0nINNhH+jgoUNRbIaMWNwdEMOaWwPtS35ek1MlWMFaBH8imsqwwsljg6Ahfx/1w+LNvcKZ4zyG5PIG+UJM7b4EzCrq/02N0x2FkmVbs2sEyYyFTo3PntXGuXMtyNiYujJ6ExaNwVx39OpA8HdKn9wvWC/nr28m9jvCjyXIjv/S6wYHDog8cnuLmvbMN4VQY11ZmN5ELXOuMFgIbNYGY6f52yj4I7A5rz9Whh+zUmlZhrwivNrJ/Nk9Hr9gp6CdmHit1Mv/HlSr1hIANtMqYrTNG0Va946ccmXIGgv0gsMH9CsfS+DnH8vQIeL+qlOrCs6nyiPCjeh7X/tt8AsOZ5Idj1791OZNyCAiF76UX9j3DWnad2tftqP7cz5W+QX9jJNlOSNff5mtLlupdnUKUaTna0WOP8wCk+JVXLT5/u+VaRPfK9jwi9cobYglHoU96YLosSMbX0HRQWfA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KMszENJV3UzXYHsSCLhoN4Q7orobtuxxSBl6qWcvstXVgJRab3S97bGlbB?=
 =?iso-8859-1?Q?RC9qKNJVWcYbP1TX074OiDS2yKAC7D4B8GQiB/O1ryHBndR9YsrLaxH1/n?=
 =?iso-8859-1?Q?imh9FvAgSlQN7lrLhXMUvdCHDDeoIY7IYYakr6XIJXsl7NM9ftOxYe+5ay?=
 =?iso-8859-1?Q?cZ4xNB+rqGLL044zRb/NENyzDQ/q1lPia8f6uJLmyTa4ly7wnFb1vIreIT?=
 =?iso-8859-1?Q?Dn5pXoVFsPyNNZeLMEzsECETm/UZd1RbBWaA7alTMzN4KHIGTx/BWcyyqQ?=
 =?iso-8859-1?Q?Q8LP3rL4DBSpy4kjKHM12BLMxUkQWnd/KuHtNGB+o5iHYS9wEq8erMAgZj?=
 =?iso-8859-1?Q?OqxQc31Q58uwuimMa8mP3L3Vt/SlU8ecR5ZeV1cEy8JeG4Nt/zoof+xxkp?=
 =?iso-8859-1?Q?LqcQ3DdS6gSJgTCFdnNsbrRmUShQDCWznR/p51G6m1E5dQntnRaSeLhQFG?=
 =?iso-8859-1?Q?KeH7z4JVfp1jz2+1o+4Tnp1IMSc6unOL4kZwRuwE5UJdR4HZ5lQNt94AwK?=
 =?iso-8859-1?Q?4yu6TdLRlZYDZeyhF4SB013zNtT8ayH1aTPVAhWEMcY693rtGQTaN+FrBk?=
 =?iso-8859-1?Q?BPg6QsgwsHjCOHL6bmg8NlkScuIDP0Mt8Lvvg1FOi3MKFxGU2XwQSRNE15?=
 =?iso-8859-1?Q?Fgz9sT344UZOWSEKGcghghsrzJH/8y5x0MzRF8LebWKtiADb54ziN37lAO?=
 =?iso-8859-1?Q?VsFuV9haU85p9HP145pvPkYuOIcNNP7aLb568QM0dGfu4hYRYpNmSV9Rkl?=
 =?iso-8859-1?Q?giqZLUqjQZANcWSOow7WCBICivLfN6OQId/sPcTGqzUB9bopfNsesp3ByU?=
 =?iso-8859-1?Q?4s9V/TUEYqpUKvtuKrsTC9gXPmncoQaJi1a6rbXZ+qL42HF+0/uFHR/kM2?=
 =?iso-8859-1?Q?EV2AK0Lp58fVHEbFx6IBb6/+rheOeDRU/arqsWZTvPsyb/90CHnz/s9PPE?=
 =?iso-8859-1?Q?a3OEvcTDeTcpaarlYKF8W/2huppO/Dbn9BsH2PzX3yU0/CHsDpW4XnY4nm?=
 =?iso-8859-1?Q?Jcil7a0myygIm/a3hGBd/Wj6OTe5o+2086NH1BHM63XYJhEqhis3GEfUNK?=
 =?iso-8859-1?Q?3/MuiGvc0p2SRjB9rbnGEr1uhRpKXtcR/Yr0DFH0ky1bHTD9PMI5KwL0ML?=
 =?iso-8859-1?Q?3mrstcym33ugZE6FrqeV4KKEutLdAWZxHMv9sc5U3+LNijjmA3u6FEvlLn?=
 =?iso-8859-1?Q?jOwPg8HRUzGT0ANEc0cl+GwMOnAkVqJRT/rkis5V1C8ndehtVDXdh5rAlP?=
 =?iso-8859-1?Q?44PuBNfmOI/AjWta8CT35FGaArJigTU7WMIvhYnVwT4Cj4kjkjsFe9mHcT?=
 =?iso-8859-1?Q?PoXZxDPJuMcBKr2ZkskBQ20lYl8pzDvg9kV0+gPvzrnH09mLWNoOXFtA1g?=
 =?iso-8859-1?Q?cjWjAMGsqrPUG7EENFtp7bd053P5iM46gz9x8GWFknPV+jCsYEjb/4RPEa?=
 =?iso-8859-1?Q?R1y3q+g3fJxDGZpaGVCjS9PKmDBVz53QhiZ3Uas/WsknY6ConNQO3Y3smk?=
 =?iso-8859-1?Q?7iiXRl+PEgZYvXHjtT3NFHfBJmWKh7zEz+JgcyfVxlAKBtBXS02VatEywg?=
 =?iso-8859-1?Q?eKu8YeHDVlceK/8KH9bPdRdH99F5ImlujIJ5QswcYZAyxOc9RceQW38JFh?=
 =?iso-8859-1?Q?cXWRCOU68jXuHkSNCn22JmmaA35szNJO+ORB7ALyqH8t9XevBxyBoggFBz?=
 =?iso-8859-1?Q?c6n1ONmP4C2RHsjgIRw+hxwm209QVNv8aWUITMZgJ3qFILQycdaVN8xmij?=
 =?iso-8859-1?Q?2a/iXfn9U/NPvjlLwXetPoDJt0/GryG6rCmcRMeX/DCkSWmncQyFJBPxFg?=
 =?iso-8859-1?Q?TmdmJdtyNxGKHAh7z6qAbzDfe6i2y6I=3D?=
X-Exchange-RoutingPolicyChecked: 2vcDFT4R8ouxcSTKYayyqL3rhAJT2wZWCwiDSO4essdb3ERhaOl4FoAItyPZLAHZy/EYN0aTXyUyhJKvTpvjwJPBCUH/8DHAXKSd+whjsFjrxvB+YQenn+MYj+UAMTzOKrakrt6KD9i+kboOTaguq7oMYoEMhnWvtf1INHkce6wFUISvY1K5MKcB4hEEjedHJQQGcn+wyLIjeGB/PnOoG4NkjmBHxh89TMS2GUuSGixphS44YLF4YtTUDGfDhJCNICzqUJmtHcSwoRvh2XgaCTFs9yMNR43Se4GSKxN56uXwtqo9l+FJbrWt2IzzyrR6+Lh7ooeuRJSikdoh6YxqvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70adfa38-11d2-460c-f77d-08df1ad59a53
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 07:21:23.0202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zW0EpJGj93ZX8tGJBqlKqBHUfnjiHO6h9LdUVL/WUCH8fLAQ5Gjy4zkimShxfOiVTSeGk78UcN8Ry+mSm0z5qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6888
X-OriginatorOrg: intel.com

On Fri, Sep 25, 2026 at 06:25:10AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] xe: wasted VRAM and forced cross-tile PT access for migration VMs when PT mirroring is disabled
> --
> 
> commit ec37bcd236de3cdab70b39d0f31888be55640311
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Add device flag to enable PT mirroring across tiles
> 
> This commit introduces a device flag to enable or disable page-table
> mirroring across tiles. It defaults to enabled for PVC, aiming to allow
> flexibility based on memory bandwidth needs.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 0f542f47b9a84..f450e1c6f7500 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> [ ... ]
> > @@ -1739,7 +1749,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
> >  
> >  		for_each_tile(tile, xe, id) {
> >  			if (flags & XE_VM_FLAG_MIGRATION &&
> > -			    tile->id != XE_VM_FLAG_TILE_ID(flags))
> > +			    tile->id != XE_VM_FLAG_TILE_ID(flags) &&
> > +			    (vm->xe->info.has_pt_mirror || id))
> >  				continue;
> >  
> >  			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
> 
> [Severity: Medium]
> When has_pt_mirror is false, does this logic in xe_vm_create() allocate
> page tables that will never be used?
> 
> For normal VMs (where flags & XE_VM_FLAG_MIGRATION is false), the condition
> fails and we allocate pt_root[id] for all tiles. However, xe_vm_pt_root()
> will unconditionally return pt_root[0] when has_pt_mirror is false, leaving
> pt_root[1..N] unused and wasting VRAM.
> 
> Additionally, for a migration VM targeting a secondary tile (e.g., tile 1),
> the condition tile->id != 1 && (has_pt_mirror || 0) evaluates to false when
> id == 0, causing it to allocate both pt_root[0] and pt_root[1].
> 

Yes, we over allocate 4k. I'm ok with this.

> [ ... ]
> > @@ -5074,3 +5085,21 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
> >  	}
> >  	up_write(&vm->exec_queues.lock);
> >  }
> > +
> > +/**
> > + * xe_vm_pt_root() - Retrieve VM page-table root
> > + * @vm: The VM.
> > + * @tile_id: Tile ID
> > + *
> > + * Retrieve VM page-table root for a tile ID, used to abstract if PT mirroring is
> > + * enabled across tiles.
> > + *
> > + * Return: VM page-table root for a tile ID
> > + */
> > +struct xe_pt *xe_vm_pt_root(struct xe_vm *vm, u8 tile_id)
> > +{
> > +	if (vm->xe->info.has_pt_mirror)
> > +		return vm->pt_root[tile_id];
> > +
> > +	return vm->pt_root[0];
> > +}
> 
> [Severity: Medium]
> Does returning vm->pt_root[0] here in xe_vm_pt_root() when has_pt_mirror
> is false force cross-tile VRAM access for migration VMs on secondary tiles?
> 
> As noted above, a migration VM targeting a secondary tile will have its page
> tables allocated in pt_root[1]. But since xe_vm_pt_root(vm, 1) will return
> pt_root[0], the migration engine on tile 1 will be forced to walk page
> tables physically located in tile 0's VRAM.
> 
> Can this cause a performance regression for migration operations on secondary
> tiles?
> 

!info.has_pt_mirror means VRAM access across tile is uniform perf or we'd mirror them.

Matt

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925045320.1325860-1-matthew.brost@intel.com?part=17
