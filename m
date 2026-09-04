Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067643A9629
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 04:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788495101; cv=fail; b=CV0wyZxNyLGLrOeGkVjZCeyLXyEvuyQE4bCkvQsGH27DJP1jMVB3xk2AEbnKRUG5fw30iQ03nw0+WPidTPrSjQkfH3c12LpFJ1hQWTQl0ZkQCdPZVXQqhqB12pnfihUTlse+6vLuaCOQv8vUQIJohembjHdkTxNAVzvpXuunQLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788495101; c=relaxed/simple;
	bh=J1PMY+HhoJ89oGSSgKlzubwNsJB6ATEg8AjsuywuKIQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Aj2RZErhM6g0E4AyUXqAnRsGoB6y5/O72ibURDROIFNMcK3CQ9OiIvvVT/67Drq2Ywhw/VGUW+wGhNB1RnH+oGisnmEWwWWsaeV14JYGh9EnPhfcBW2qI7D6I31w60EPkiv8AcRC5af0jkr4NKch99SZWhe/17FjzW6lRS+whQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLP2CFpR; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLP2CFpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788495099; x=1820031099;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=J1PMY+HhoJ89oGSSgKlzubwNsJB6ATEg8AjsuywuKIQ=;
  b=HLP2CFpRfAzjM510MdXym31zrsmGHwZl+04takg6FJujV0wrd9rmc8HR
   SVkdzHo5pAclFe+oKyiO7bopo4J1UG8/rvj/oz+OMiegMySTtrw5YyBa5
   WNPiZvI40UIHSUFV9q9A88+o84PblvtoXnVIxDDbb16U2ongvAhMdtMDY
   u3LkO6R/l+TIMaP58qSJ2wPYuu3jLu6UWLHIXE8F4eniMRqiZp0MCQLqb
   G4TQC+Z7F/gw19TeBsDpoU+T5KaQzNZkDGmQVxxELZShyNIBDCTPQIOJ8
   XR5J40oH3MkVPskgvF9vWs1NsEYtFM7rCgWRK+Tr2zUqL7Nmb5vavdZhS
   g==;
X-CSE-ConnectionGUID: X+sxbihqT+GipYc5vhUQ5A==
X-CSE-MsgGUID: oRmJhJnpSFSUDTlpCISA1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91504703"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="91504703"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 21:11:38 -0700
X-CSE-ConnectionGUID: YyZfRasWSPOZgfHhtAHTHQ==
X-CSE-MsgGUID: S7cMTi6SQACShqF8irLzaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="274066256"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 21:11:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 21:11:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 21:11:37 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 21:11:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onkDODU1ROl068GNaQTl51ku1aeouSRRxMaZEQ1In76/60WizqdNbdMkwt9j7J63Azg0vSqXAwrIOZmvtREWOQc4QFACFpcL/rXeWt4Dsb4OzCRh7R27NDUDVecLHHMhpc+IKG9CpDv2RtlI/qoaw68/J6c5E2LYwVo583wZnhy/3WHW+Bj626cxSSh5YjpOwrQU3Z7fKPQ1SnRS2GjmzsDe2Xit+bddCX7ww+y6//eMFfiFfgKrJcqbnArpKIyhWZjkhTEA4CBmK2NdjD8Y9wwWyO4008ujU0LV6vN7bvjWXv9ZnTh+s/2YSldhK4k7Ibpp5c57C5wVDZPOxmUklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/P1uDo2x6OFdSSSMRG62KWNX9Jxg5FM9OAkEXVpDo/I=;
 b=PqPiej8hqbFcyKE7w2iWtuuWIxO+wUY2jskZTpNPCn8UGBNOYyp38JIJ2HO7n97O0xP+ZvKPe+Sgp+cMrDeIr/6CqF2doA859DqK6FIQ8/aRR0C0jmll/b+Wao5DwpzwapSh8b9gzX1IZGFStH4y7aqTO5FaQcTz9/I/nbGrHRzzYwJDjZed02DDGQHuwEj2ASexFUDu6eE+H3EWONqq7aGE8tKuK9lA4NmM/QqEXnf+bXvPHVQw+Q+Yk/hqH+hlmuaOev2Qm6O+Gra+6OOBNy0MN2TgIPa/7Nnn5oRxa3Rp/ERsDFXCneMwwO+ozYsaYKV8XNYqzeggzng982DAig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 04:11:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 04:11:34 +0000
Date: Thu, 3 Sep 2026 21:11:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 20/25] drm/xe: Add ULLS migration job support to
 migration layer
Message-ID: <appE9NDPO4ye1jO6@gsse-cloud1.jf.intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
 <20260904022207.3490018-21-matthew.brost@intel.com>
 <20260904024440.206631F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904024440.206631F000E9@smtp.kernel.org>
X-ClientProxiedBy: MW4PR03CA0320.namprd03.prod.outlook.com
 (2603:10b6:303:dd::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 095e1f5f-ab68-4b3c-f990-08df0a3a9b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DA+2Vvt9QvaI6XNGcMe3Prh8U0tm95rstXpjA/8GqiyuMXit9ULW0ePY4gGWX9AYdUcBqRIFp0zBi6lAmBEwFNyfNuGCvtpC7NPluo/jVWl+C6tKwIHk15qKpQ3Pq21U0+gim5g4Rx6HxG3os1g8RV7lqw7pYrXGRnfDu2JYOpPMOLEG4uCaroyCF4gRl59581gzXy+MdWhzPjYLlhJQmgTAQREq50XX8dGaUlKPGo5jW/hK+VQzVDbnXy96f+vSf9Pphz/R+JHxaVt8SwUe18WHKtSgGxBdhbEURfSX2rN1iY0cpChvKwkltua387g84CbF7rLVWS6Pcz7vZKv39JPsl73YTv2Yy5YcuofVMROT12D/hgaKNE9q49zWpiS04U75Upm1Yx0ORqTQV0mWs2iHALGUE9ZdhVf6HVTilxmbTnroN7NNea86WnCXqDWtltcqIQO6MVj3A2HTYP2cvZvnhiqXSrdbzIcoUlCoqI4CH5YOe2nSwzHc5AB+ynZIAeXZPlf7rgLtX5JWZK6Vbg1VwsmycEY7HPGiT2LPUl7xWswHakSAReARB9SmvE+cli+ioo3oYrq11sqak/Eq1iGz30eMDDvrOowlU0xMmJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2Ubg6P3tQ4rYm7btHPWKlL+XPB2aL+rsJX2hPygfIiutnvzXtxzEbkJPWD?=
 =?iso-8859-1?Q?A3eFwh8nMcJSy1vSWTpXnhFLI1ZTZEizFx2qiYwbV/tbtWJHlVElLt1xw2?=
 =?iso-8859-1?Q?kMLmbxe2+rDlgrUbnu9yEW5GK9g0y8+N8veL/5KluytASbUKlaD3AJ+5fI?=
 =?iso-8859-1?Q?r2qgvQr/CIdvwIEPBwQ0Ouc85xpVuAUcB5xVssUYgDv5KgAv/npFtmPxss?=
 =?iso-8859-1?Q?dHe3/ZckPryf7qHGFT2v28bdj+TYHcTWIG+XWN+XddmEzW1pmq/Vjz99Cf?=
 =?iso-8859-1?Q?ZZtMWViZtRu6kM65+etmHbQgg88VCgxQ/40CfwRmqPbTx5xxvy8fY2H7yQ?=
 =?iso-8859-1?Q?SiswI00W/WSjm4pUMFoMz5zAvS2uxfiDAUs36m8yw97aIq9412uAFQeYUK?=
 =?iso-8859-1?Q?+iOBXVoSt9vKHZcNAHbhAw1K7O/6WGj1VsLEaaCz04S3+BwZr613mbadX4?=
 =?iso-8859-1?Q?JSimfj+gdfxqs99CCkr5cHQw3JGgzrut5LzeBgoks35wSK74HwAwkvJRfU?=
 =?iso-8859-1?Q?jVBg5ffYpN/ic15L8QFWpfWMOjzUCikfBDKMfdzv7xtXMGTC5ztxwoOO95?=
 =?iso-8859-1?Q?0NzUyCfDwexPmmhse+ae59l1cXXhT/vto1onYRUw1DNKxYD+HlcXBXjDNp?=
 =?iso-8859-1?Q?NqlRrO3/WVfKfuIntmAzlhYOTJ6ESWtzPBDjKbPZmt5GH8QkEb1EbMGXIs?=
 =?iso-8859-1?Q?nwZPN4U6ipbXiL1zwHnRXKwCxijTK84GglrUORwqV298KGRtWOd8t8vXDC?=
 =?iso-8859-1?Q?K5rxvYkMSs8CohmBOeE3bTDBGQd0lZPbLKwSTbzenlAGTUQQSyIrL2Q75O?=
 =?iso-8859-1?Q?rP+mjEN1jFnLU4nX3EQRBPsjW6McCGGVyA+KUihdZ+09u7SIyLU/bcvgi2?=
 =?iso-8859-1?Q?h3J+uNqt+2iQcljlOrnYGn8gT1bhIU7UC9VVKfPVOu+ZQQLZD4efs7PuAp?=
 =?iso-8859-1?Q?Qq1ku1Ev83FWiKN18J4QYkxLDmdaV53zqgkyOBX2X/btMmPujd5LcGO1vJ?=
 =?iso-8859-1?Q?7n5CzbDa9OkF9vM8Xee/3CNVpKTZmXBEm6LZGCWziedOVJRZsn1qIIhu/C?=
 =?iso-8859-1?Q?tJjXlCYs36MNA3mxXDDQH2pUIP3VqKWaXcX31dAg9hcqQu9g/uQA2x0c24?=
 =?iso-8859-1?Q?4TbP5fC6W4Yna8dFWYgTZM9JqQ0zc7/ADrG1pQ9h9+IWH9le60EBxjBX3w?=
 =?iso-8859-1?Q?HPcHrlIkn2jHfduCJ+li8DFRJtXbgzuMDGIOg/Z1sZQsxPwwEEDjgnc1PN?=
 =?iso-8859-1?Q?ooMaggJ3OeqfF9xjkEMP7HnvB1UcABua1oNSr1v6ejR8aq+TCqV834dPGq?=
 =?iso-8859-1?Q?NBq9CbIhlvTZPANeYkxuwVV5xWCiolVUtEIL2PktCuhNUpZK8v0++Nixpo?=
 =?iso-8859-1?Q?0+lQ7sRv24EB4esjY3qa+OTgxuqr08mY6guHR+XCPwWt1WwFdoTYwphVWA?=
 =?iso-8859-1?Q?CNT7+qTJxjRl2vKm3B0J6tEd8oJDG4HaodWpyLA7FoCB5m9oLkvA3c15IQ?=
 =?iso-8859-1?Q?3VB6UYfuY8aaig8M5UzAUCWx5/9LonpBvKINzLYATICsY0qyjYeS8rd1y8?=
 =?iso-8859-1?Q?C3xh9UKc9bBZszPKss6xAIUKVe4QdysnJ+Z1HNn1B9XkUtnml98AJi/lfz?=
 =?iso-8859-1?Q?4w+ogJs/5hq9KgqqvLxPTGBDRiwGUFskbgDZy9kneZCA7d5ExvglIGBx6v?=
 =?iso-8859-1?Q?AGYkm+wrEjB965YytRUuAu49sxVCSFydRVwI7sMWcCsqVp2o2YoEQfF/dc?=
 =?iso-8859-1?Q?MswpNFb3WPTOrfQKpg9OCTBWtsrW9pk7kwTG7tbCwhoRfphatA/HoSvCSz?=
 =?iso-8859-1?Q?FLEs5UEfcb1oUJgjX4n+8Qd1OzeMiBc=3D?=
X-Exchange-RoutingPolicyChecked: Fkt4Vp2xLcoETmz1kEGouLnQPRPE/85qFRHMtoJYo4NyQwQQJ/OcG4qbPhoAv0W2hTqZVE9Ry4cAC9IMAvrS1igN8CD05XkrVp2ZA+FgiGZGz4VJr9xghh1FWXGy7A9cxAqIj9OikNptFKbgqYM8QFJZuoQYa9Qp/T5Gwyaof8UHEOe+QLXHLnvhFQDf6qT8EXasfjv24cgD4elGC4ZgoI5/XMffT9oSm79YCKuAD6mLW+bNXufi0fjoXxse6quxMrhZYkFcsKG+Xaw5erEfmBuTmOzGLMnyOaegyT6MCO2zXszdK0InpSJxUuMoP/QJsun6BIXgqjInzkFMTexD3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 095e1f5f-ab68-4b3c-f990-08df0a3a9b99
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:11:34.6114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHGYS1Bg5L6sotfgfOZm2bo3kncqc73lspssQ4tb8gcFL+w64qKzHYVSAp3+Ajp8O5vyc1J5pDHK4ROBsws6yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 02:44:39AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] ULLS_EXIT_JIFFIES evaluates to 0 on HZ=100 configurations, causing a tight spin loop.
> - [High] Deadlock caused by synchronous dma_fence_wait while holding reclaim-tainted job_mutex.
> - [Medium] Asynchronous runtime PM put used during device teardown path.
> --
> 
> commit 1b246ef0dc00023e2aba23868ed86c7ff7c9257a
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Add ULLS migration job support to migration layer
> 
> Add function to enter ULLS mode for migration job and delayed worker to
> exit (power saving). ULLS mode expected to entered upon page fault or
> SVM prefetch. ULLS mode exit delay is currently set to 5ms.
> 
> Link: https://patch.msgid.link/20260228013501.106680-21-matthew.brost@intel.com
> 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 471ae5741836e..588e1c9085f31 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> 
> [ ... ]
> 
> > @@ -77,6 +80,14 @@ struct xe_migrate {
> >  	struct dma_fence *fence;
> >  	/** @min_chunk_size: For dgfx, Minimum chunk size */
> >  	u64 min_chunk_size;
> > +	/** @ulls: ULLS support */
> > +	struct {
> > +		/** @ulls.enabled: ULLS is enabled */
> > +		bool enabled;
> > +#define ULLS_EXIT_JIFFIES	(HZ / 200)	/* 5ms */
> 
> [Severity: High]
> Does this calculation truncate to 0 when HZ=100?
> 
> If HZ < 200, ULLS_EXIT_JIFFIES evaluates to 0. When xe_migrate_ulls_exit
> executes while the queue is not idle, it reschedules itself with a delay
> of 0. This results in an immediate re-execution of the worker, creating a
> tight spin loop and causing a soft lockup with 100% CPU utilization until
> the queue becomes idle.
> 

Also right. Should be: ((5 * HZ) / MSEC_PER_SEC)

Matt

> > +		/** @ulls.exit_work: ULLS exit worker */
> > +		struct delayed_work exit_work;
> > +	} ulls;
> >  };
> >  
> >  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> > @@ -98,6 +109,16 @@ struct xe_migrate {
> >  static void xe_migrate_fini(void *arg)
> >  {
> >  	struct xe_migrate *m = arg;
> > +	struct xe_device *xe = tile_to_xe(m->tile);
> > +
> > +	disable_delayed_work_sync(&m->ulls.exit_work);
> > +	mutex_lock(&m->job_mutex);
> > +	if (m->ulls.enabled) {
> > +		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
> > +		xe_pm_runtime_put(xe);
> 
> [Severity: Medium]
> Will this asynchronous put call in the teardown path be canceled by the
> subsequent PM disable?
> 
> xe_migrate_fini acts as the devm cleanup action. It calls xe_pm_runtime_put
> which queues an asynchronous suspend. However, during driver teardown,
> pm_runtime_disable will cancel this pending async work before it executes,
> leaving the hardware incorrectly in an active power state.
> 
> Should this be a synchronous pm_runtime_put_sync instead?
> 
> > +		m->ulls.enabled = false;
> > +	}
> > +	mutex_unlock(&m->job_mutex);
> >  
> >  	xe_vm_lock(m->q->vm, false);
> >  	xe_bo_unpin(m->pt_bo);
> 
> [ ... ]
> 
> > +static void xe_migrate_ulls_exit(struct work_struct *work)
> > +{
> > +	struct xe_migrate *m = container_of(work, struct xe_migrate,
> > +					    ulls.exit_work.work);
> 
> [ ... ]
> 
> > +	mutex_lock(&m->job_mutex);
> > +
> > +	if (!xe_exec_queue_is_idle(m->q, 1))
> > +		goto unlock_exit;
> > +
> > +	xe_sched_job_get(job);
> > +	xe_sched_job_arm(job);
> > +	job->is_ulls = true;
> > +	job->is_ulls_last = true;
> > +	fence = dma_fence_get(&job->drm.s_fence->finished);
> > +	xe_sched_job_push(job);
> > +
> > +	/* Serialize force wake put */
> > +	dma_fence_wait(fence, false);
> 
> [Severity: High]
> Does waiting on this dma-fence while holding the reclaim-tainted job_mutex
> create a deadlock?
> 
> m->job_mutex is explicitly annotated as being part of the memory reclaim path
> via fs_reclaim_acquire/release in xe_migrate_init. By synchronously
> waiting on a dma-fence with dma_fence_wait while holding this mutex, a
> circular dependency is created with the memory allocator.
> 
> If the system is under memory pressure and triggers reclaim while signaling
> the fence, or if a GPU reset (which must allocate memory) is needed to signal
> the fence, the reclaim path will attempt to acquire job_mutex and block
> forever.
> 
> > +	dma_fence_put(fence);
> > +
> > +	m->ulls.enabled = false;
> > +unlock_exit:
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260904022207.3490018-1-matthew.brost@intel.com?part=20
