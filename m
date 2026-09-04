Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EDB175A8A
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 01:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788483878; cv=fail; b=EkGAMhx0jj59VdDi9EmXUoocWmmO/teBMfmN5trKn+TmL300AYNX/cPJgQYvauhrj862ta/uaLe4uD/GFuEt73J7/zGdCPpT6iL6WePnTWReHLcgh0lEJs7HDYZF8XhBs6aUtyOswrB8bqR/Y0F7YdPAAdW9zQxuvq7z6sUwnto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788483878; c=relaxed/simple;
	bh=rhmwJw++EzI35Rp+u6Zz2cdX0fziu/J3HzjNHxR/O00=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tSsCIioJ79fL+v4bNzkJLBBwa8esqJhoLC1TwfRZHvb26ISetxdi5pKw7TUgSHIj6HW/rhAplY1E8Ryzg9s8mTxTzPi20FCDMXN5FzqxJQ5zjxkyzmY5g9MwogHtwGxQd/O4lRQZSYxSc3CbzyUM3pl1NxzkSnoRKql+BIIh5Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErHnLsaq; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErHnLsaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788483876; x=1820019876;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rhmwJw++EzI35Rp+u6Zz2cdX0fziu/J3HzjNHxR/O00=;
  b=ErHnLsaqNpGosSvDbSSJ6G2qZ89lRt3awqt3fOCRw9JH9Ag5cagN0qq4
   WW+6h+/FXTzfK5NVSSjX/64aJSgf53cQJa6elb+1+U4zsFROcgvM9JzmH
   cf7Y7eANx3rIRrUk8yWWXPI/PEJ01WJt7sYgcWlTllWrsBmA64XRvb32V
   8rO9JryHLeyzO3J6OYUYXxTd/3wk5pAhh1CRXG9qZ3oWh7hXuCTt3bsNy
   nQI68PGumfoXBSdxoxq2RFpE0MRyM2KF0RyRjNM9jAHZ2kQUiIABX5LbO
   xOK4F5MF15YqzKL0jQQaW7ayFBcsC2E1HYNYBPeLaN8lX/TmC5exRGZMm
   w==;
X-CSE-ConnectionGUID: QbTEhFOYQYGg2cg3khG8Sg==
X-CSE-MsgGUID: ZxXprlIZSnCIjlsUBtZljg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91493874"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="91493874"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 18:04:36 -0700
X-CSE-ConnectionGUID: 4lSakcEwTX6aoUxedt0pkw==
X-CSE-MsgGUID: 3kXPgIPDS4i97IrvLal7cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267316245"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 18:04:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 18:04:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 18:04:35 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 18:04:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuVO4ZmQ4Qt7e6xRPzXLWkShP9q/gKLn6YFZXQxBM7J2+cT6tyCCjo56MaZSVsGvIbmNnljkTW4hqct2w1vFNWSzlhSOOPEsG3Dw72lqG/USIuu6qMAT9t93z2GqE8xPqvgGr0lAZycXtfne/WS5JHpfUZr14qZzaF/atoEWxPfZWOyrw1Ap6xQsYiBa26sdS+Bldt/B5u0CSWVBAbTSMOVSRQUSiSFKZLQedtgGo5phb8GHDdSNZbytkCDUPlTch0jVXac0svJXr25s4GxOSLEEOiIX0nJrpT4XtRvOS8AyrOPSYWTInTCjOs5J2SYZONaFba7aEitqW3ejm/AB+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f/8oEcUlg+fqeWlDbztodCOZb4Znc20OlbUvmuBzTM=;
 b=SV344D8d+j7n+tkiQLoe28QTEpcwW6TcL8WYQETiw6YQKtjB8vqTc+NuOnpqHVe4+fPkFGHGJ7jHa+fCr27tbMVjeeZKJCowhRBIwkF/CoR/l6bT4NzNtuEo21aqzAl1cjSnfhGDXSrOyXfGz84sip0rhnskejxdW5rNowyr9Jb4J9d2Hl03ABQPQfARInmCLnbNdQpevL3l2o9C5nMjSPLlkynVVUnHR5dWDXvS4GvK+MzhfD5YEWXlFWSwLBBToxW9fn0J1Lp8N648WQbhOJMk4iUFd/EHr5FQDBs9FusCQTLg/PyWCDRUpRffl6xPPBEeyvc0XEtkKyUD75vk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9225.namprd11.prod.outlook.com (2603:10b6:208:570::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 01:04:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 01:04:32 +0000
Date: Thu, 3 Sep 2026 18:04:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 13/25] drm/xe: Enable CPU binds for jobs
Message-ID: <apoZHTtbABf7dr8D@gsse-cloud1.jf.intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-14-matthew.brost@intel.com>
 <20260904003144.6DA551F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904003144.6DA551F000E9@smtp.kernel.org>
X-ClientProxiedBy: MW4PR04CA0219.namprd04.prod.outlook.com
 (2603:10b6:303:87::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 4198762a-e3cb-416c-5ad6-08df0a207ad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|4143699003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: a6cX5EMkeGl2cHh8FtRmDmzt5u1x1hsxg4SvX87BTVjFzrH+XLMtJ7dZP09H7N6l3byp3r4ivwVnnxama8jBNnJo3effBdOwr2WOo+4p7fnvML20M0oNuOqgEweUj3hOVeU8apazNAvnBcU4nvntwQOfat/wbc3FaFLkCk+usQ4QEjOip9so/cj1jFoLzMmhDDKXGUdzrFCXNdZYpaZf65HsdizjCu0lB74mi0Rn8UHOlllzbl/B2TV/+1x5hyQx64CGYA2murDL3Ym2BEM6qNopXydKJiEHG/Ugj+gbrw8qRzG40ufCjG4q5ryFNdj7+4cTZjYOwsm4aK+1WazUcsZxCfJjVSK3LQENhzUJcnRuJH4xGmYQOX2/LfVVf+Ax7pF2iAOjkIt+uA/TvPXY48+h0R2zfUZSy0AOOyTuzkd4x7YH/ccikqnA00/wV+Magnu9mwXuAkNSlCrkmBw3nuPPA9fzFk7BAvBon/dzym5NpYITWxjN/mt6SDBv/GRlloeUlqnoOekZHzUsBiXdVEJp+4p4AnECvNHX6VaUtDjE+cKIefUrTTxhLXFLDNLbrs4PIwAhVVYSHbUc/H5fXDGGT26RkC93TwcVlWkfbUE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9eQJ/NEMbW1X3XPkrLlwl6Dg+eax4EjL1taLQK903oOrhuDIl3bAxbcEVi?=
 =?iso-8859-1?Q?4r11n3JK+calmOqRrwZvZ89jt8xnBV84fSVTmL3SAxYW39K9gyWdd0q28A?=
 =?iso-8859-1?Q?D+pgUYtUjJGEbX4qXCOYnJiaGcNw29cnPJpzBYPY4mU/BUeI3F3iTfWS4m?=
 =?iso-8859-1?Q?lJtxGIzvAJzpgkgThknhZJJMTAJHfYIneUKJGM4Xhh5dNPXk1QODVWFGbX?=
 =?iso-8859-1?Q?xqTu6fdj8JR0X3FAT5K2fV4tNsKEF6bOScExdIEwuHSB4N3tf5Z0xbGF+5?=
 =?iso-8859-1?Q?8nqfzWRH+6FYEXXNOFSxvYn0QmFdGbCg6tEFL6ih8yk8lwAxd9GnFJRW0A?=
 =?iso-8859-1?Q?yYr53xYzKn8Or3l+sxMrprrd0JzA01HW3eWZT07l4BwZ7n3GQXur+7a3Gs?=
 =?iso-8859-1?Q?tljSdW+5q3sJNsYclu93xEUKV7BCLSla0DWskvgyyiOrnGekeNxAsyHLO5?=
 =?iso-8859-1?Q?4Yh6Ierfs3ayUvK4Y6VoLz6xax3wgmWRJgvlcvBkJPTpVb4sitstgBWaWA?=
 =?iso-8859-1?Q?ERR+LGwSQBeJyAFX8fcZHM48DV/LE2G3CCZiE9BkyG33Yfu2hMTfZAjYR3?=
 =?iso-8859-1?Q?ZK2ERVnzv1KuIBs8AUEc+RejahhkcD+FJRBjfNRMq31KXEdj47nQasucfy?=
 =?iso-8859-1?Q?1WKe8wefb3HkpKYVbFpUZpoPkfS31qFiJmD5iCywy/VHJc3aEKzPlqR9sQ?=
 =?iso-8859-1?Q?bc2Ai+QXP9+2CgdVZXpPJwlphLsflXqpLpTQEzrxhPsBnGG3d06jL/4d5W?=
 =?iso-8859-1?Q?5aNBCrP92YUQGhzKde9q2qRhk3mc+Qf4LuECE7An85rThagfWRLk9e4/hQ?=
 =?iso-8859-1?Q?eJrkJbA8UEV6edKp3wxJH0oacCITAyCdQqSdRauAYm8MiiNZGqVD9bv7Sc?=
 =?iso-8859-1?Q?8RkwJQqp/e0rodjVUnlfLrJGoQ5GtZagiZCV6kuZJzKR33ZD7LHRrXNKSj?=
 =?iso-8859-1?Q?BFTj8HmiaU0OO6SXcLxIbeIFlh2++7OahXxw/dTpkZI/Yru2nNZCdgKXkJ?=
 =?iso-8859-1?Q?RRL/xf9I1X0x1vYIeSGecv7KZ/58jDv37r0qBCdJQ2e/7D//ghipCW8qSg?=
 =?iso-8859-1?Q?g5VDUxh0nO9u2P+638Z3X76oXus16sMdcGKCK/T49HYbAIb84JE+Ysg2sz?=
 =?iso-8859-1?Q?c2WgobrfUCEhye973O8hp7WUCTC5+dVYAkcqn5sccJn+0z7a5R559WU3hO?=
 =?iso-8859-1?Q?/XJJ5/ZPOifS65sys5gISw+g3DpkzUzp4gYzcW5vbZrl/COrdlPjTqqYri?=
 =?iso-8859-1?Q?ne5MQTVQ/xahrn17Y4Al3sYYEAjohQ4WiUWn4RHkN5FI3gipExwmHsBecM?=
 =?iso-8859-1?Q?RYWY/rtR83jt8liZww0qHfHy+hDRH6Q2BeDnsO+GHu50IkueFDW2SakflA?=
 =?iso-8859-1?Q?S5f1xK3LeeXOJGBO8Oy3I3LU5YtRnmiBSyfHcUx4ejaUHTOQy/259OpQY0?=
 =?iso-8859-1?Q?RXhcq1Chxv/78AL+JioSDWG4PKMfeEsUGTZ8DpRVRVt4LGjWEtM/sxYcpS?=
 =?iso-8859-1?Q?dq9+XoCJjgnCT+s5b6U6iTf8bXYcLJjB34prK02NYckxTqbnUy4XV3/TWY?=
 =?iso-8859-1?Q?NcWUexNR6mQNtGTAC2IAxrSJ4CN1F/aas5yM1EaDP5qvfc9+oO19vqHWVA?=
 =?iso-8859-1?Q?+j0t2jUn3bHxwi1NCWmgtIEhwpxMYC/Hqvg9QVvnPKCGbpkI+EqlGgpBBQ?=
 =?iso-8859-1?Q?OxaL8K/PQlYm5/pJ/gyQlZjykbf+vsrpCUFLFkXf/wKLRItRUicXsWtQOf?=
 =?iso-8859-1?Q?si/ZteoHF948juUunShRwiqnYlIH1MJRecodPbVume/gWZGxE28L1nJ0Yb?=
 =?iso-8859-1?Q?gA9lHBul+aR9p/wwCurn79ZxX9Gp9PE=3D?=
X-Exchange-RoutingPolicyChecked: XcmSTigZBk51SS5k+8duBKEbeQPPvU+d/YiCXiTxd8bj7A0VA/cE5jurvVvoGBWU0vZr4RXNHiLK9rsVQWqGEm8fIsqAOaQF39P/7A6IT9dqNFshl936lzwCZ/MVDlxyotdOcNFyy4OnkLyvO3SENUlkzpDfnrKcmSnSXCam8YcHCF/MwP89hWhFJA5BNdIFrI0uPYSbhfiXSy/k2vJRRqzq0F8a5J52XgLSICWlQIntkBX1JT2VuBME7OSgZD6Rze8cVsZdh9QYu8K+3pHSuqsanItWbm04YDNpQGsKFy6FjWaPK4uINb/UgmPGEk4Q6G79jWLBXDTIQAzOhmMOWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4198762a-e3cb-416c-5ad6-08df0a207ad5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 01:04:32.7210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaM6etTzS7NemcIrr/60yP9Izv9uR7cIG/jZczdjJlN4AubQbHRpnLRM3Ywzr1jMzPZPNlbUxfI/SbFlXP3YXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9225
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 12:31:44AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Critical] A Use-After-Free of `xe_vm` occurs because CPU-based PT updates execute asynchronously on the device-global bind queue without holding a reference to the VM.
> - [High] execlist backend ignores is_pt_job and submits PT jobs to hardware, skipping CPU updates.
> - [High] The `xe_pt_job_ops` reference is leaked when a PT job is aborted or destroyed without running.
> - [Medium] xe_sched_job_snapshot_capture reads from the wrong union member for PT jobs.
> --
> 
> commit 1bc0a17fc99eb78f42df916d66ac3038c0338a83
> Author: Matthew Brost <matthew.brost@intel.com>
> Subject: drm/xe: Enable CPU binds for jobs
> 
> This commit updates the migration layer to formulate a PT job which will issue
> CPU binds in the submission backend. All code related to GPU-based binding has
> been removed.
> 
> Link: https://patch.msgid.link/20260228013501.106680-14-matthew.brost@intel.com
> 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 100e84b7b81df..62ae0e2e85be5 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1938,162 +1867,18 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
> >  {
> 
> [ ... ]
> 
> >  	int err;
> >  
> > -	job = xe_bb_create_migration_job(pt_update_ops->q, bb,
> > -					 xe_migrate_batch_base(m, usm),
> > -					 update_idx);
> > +	job = xe_sched_job_create(pt_update_ops->q, NULL);
> >  	if (IS_ERR(job)) {
> >  		err = PTR_ERR(job);
> > -		goto err_sa;
> > +		goto err_out;
> >  	}
> >  
> > -	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> > +	xe_tile_assert(tile, job->is_pt_job);
> 
> [Severity: High]
> If the platform uses the execlist backend (e.g., GuC disabled), does
> execlist_run_job() properly handle CPU-only PT jobs?
> 
> Looking at the execlist backend, execlist_run_job() appears to unconditionally
> call q->ring_ops->emit_job(job) without checking job->is_pt_job. Because
> job->ptrs and job->pt_update share a union, the ring ops might read a garbage
> value (like the ops kernel pointer) as batch_addr and emit a hardware migration
> job instead.
> 
> Could this regression cause an immediate GPU fault or hang from executing an
> invalid address, while completely skipping the actual page table update on the
> CPU?
> 

Execlist backend is completely broken and not even able to be enabled
via a modparam (i.e., it is deadcode).

> >  
> >  	if (ops->pre_commit) {
> >  		pt_update->job = job;
> > @@ -2104,6 +1889,12 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
> >  	if (is_migrate)
> >  		mutex_lock(&m->job_mutex);
> >  
> > +	job->pt_update[0].vm = pt_update->vops->vm;
> 
> [Severity: Critical]
> Is it possible for the xe_vm pointer assigned here to be used after it is freed?
> 
> PT jobs are assigned a raw VM pointer without taking an xe_vm_get() reference.
> CPU binds are queued and executed on a device-global queue (xe->cpu_bind->q).
> If the user closes the VM, xe_vm_close_and_put() kills the VM's specific
> queues and frees the struct xe_vm, but it does not appear to wait for jobs
> pending on the global cpu_bind->q.
> 
> When the DRM scheduler later executes the pending PT job on the cpu_bind->q,
> could it access the now-freed vm pointer during CPU execution, resulting in a
> use-after-free regression?
> 

The PT BOs hold a reference to the VM and PT BOs are only finally
destroyed after the jobs runs.

> [Severity: Medium]
> When xe_sched_job_snapshot_capture() iterates over q->width, will it safely
> handle PT jobs?
> 
> It appears that xe_sched_job_snapshot_capture() accesses job->ptrs[i].batch_addr
> unconditionally. For PT jobs, job->ptrs aliases with job->pt_update via a union.
> 
> This causes batch_addr to overlap with the ops kernel pointer (or similar
> members) from xe_pt_update_args. Could this mangled pointer then be
> uncanonicalized and included in GPU devcoredumps, leading to corrupted state
> data and a potential kernel pointer information leak?
> 

Flagged eariler, will fix.

> > +	job->pt_update[0].tile = tile;
> > +	job->pt_update[0].ops = ops;
> > +	job->pt_update[0].pt_job_ops =
> > +		xe_pt_job_ops_get(pt_update_ops->pt_job_ops);
> 
> [Severity: High]
> What happens to the pt_job_ops reference if the PT job is aborted or destroyed
> without running?
> 
> The job destruction path in xe_sched_job_destroy() does not seem to check for
> is_pt_job, and thus skips calling xe_pt_job_ops_put(). If the job is canceled,
> aborted, or its execution queue is destroyed before it runs, the DRM scheduler
> bypasses the normal execution path and directly calls the free_job callback.
> 
> Would this permanently leak the pt_job_ops structure on those failure paths?
> 

Non-issue. Once xe_sched_job_push is called run_job must be called. We
do not a failure path between xe_pt_job_ops_get and run_job eventually
executing which drops the ref pt_job_ops.

Matt

> > +
> >  	xe_sched_job_arm(job);
> >  	fence = dma_fence_get(&job->drm.s_fence->finished);
> >  	xe_sched_job_push(job);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903235842.3401722-1-matthew.brost@intel.com?part=13
