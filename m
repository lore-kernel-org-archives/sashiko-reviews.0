Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA3033065D
	for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 02:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790389092; cv=fail; b=XrlMw9QcNSFEiaQSbqSC7f3URrUAmmPJGnc3wIMeQVEqEEDACm0Qi0NVs6G7C5b9eA+BJgbHXkQFofkDtc3EIF3tM9RQucHrbedTgmvPn3tHWskzkIPCKKl5odEHuqfS6hd89tXHuDlU+bSUe4pZIktRUhUP7cVo6MvxK75T+jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790389092; c=relaxed/simple;
	bh=dRGWId1wJKUSEuQAHNcS95zaS02ViRpUZpoMX0WcgsY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j2kYBp0S5/9TPwy4HjqsAT20hSKxQ5ptkSRyFwlKU29+vJbEr8QtqXFkmtWTlQpUME2fZATTu76SiI4CLAdC/4Nj1/gmvNKgIqufBUKmoDKIDpd3eoPaR17bL8SAg9PfmGkyJZfRXb5LwBUNJDG+N/IHxLQEf895P2OHuWvWXKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rx4NM58v; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rx4NM58v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790389090; x=1821925090;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dRGWId1wJKUSEuQAHNcS95zaS02ViRpUZpoMX0WcgsY=;
  b=Rx4NM58vXDdU+8vl2iOlckdTrZMoV7/SIe/58FxheANiiKzdSWeARmid
   oS9bvkzjX1JhxaculrfomV1wUgpNODDTv/aUYymzT0vxqqPJiPy//OaEf
   75Zset8ZMzuSacTfw0Uxkl9KA2KSazEkRwGJLR3VIbLe647mVKcvHb2lJ
   syDlLVghPDZckvjBGkCkKJq2B7qO1Tuw06of4coPWUA7nqRocJlFlyUj/
   r4ixlUS0eh0ckIXjIWDaDauzdzcTK4DwcgL3hmqrxIY3N0IJaOcLjvYlu
   WLz3wZVp0Myt1ajAH1PAam/DcLm0qyRyC0N4jfqKJ4EOGvvk3kBaUpp98
   A==;
X-CSE-ConnectionGUID: MHgOZimIQi2BKcEDcWH8Dw==
X-CSE-MsgGUID: 6/QXdaEUQ4CbG7MSQLoH0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102542727"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="102542727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 19:18:10 -0700
X-CSE-ConnectionGUID: kS1mvXitTju+9e86Ic4KOA==
X-CSE-MsgGUID: 07Lo75U5SdGhFWfnYO03MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="272640435"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 19:18:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 19:18:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 19:18:09 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 19:18:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVZkAUad7N0DeXoG1pnhYI5+xlJen/mJ31zY6qsxckytbvaH3xQUcCPzT2gVwPz/Dav9yotLNJ301QaoIScOdfEZtL7paALBNUK+bZZk3BkTLOZ4dA51+7CcyQKFlScwahW+ew89dgoG3e0YOGumStojMaYJyKIJ2e/DRBTcVFUXZl4XHQHQK3/vfLJoKg3pZpWJ6FjT61o3pbxA6O9UfYenbEaP3BRFHFfBb/NSvShksveRjfaqW7zrH+JrXw9BKW34sHaLMESMltlGRagIwgRieZcSG2hSxOcNM5RiyNDqlLyr6Dljp+tJt78iSLftjLuN2WUA/ot14XaKySWZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIEcd+G/Ar8qJRZyhX+dIXD8C8V5QQXv4e+ugZc4GYw=;
 b=dYCnaX5S/YzJ+HDWohlnvtm120nhpKyPpeUE2AGaAZl+BNkHeBBDuKyKQUMKN+yHZrbMnYeGOxc1TaivDAsaOZSDfG/IBm4s17BMqdFRE95ySJnzI8vjyFKAHOUUCkSYWXpvvLNIDIYBxhkBxXiPlabOF7vN29UXKCCbqsyQVZ9J0RX6XjLlEaec+oWYRnES1a1CWuj1iFcdILeY2BcNyGEZ5Csbi4mA7gFmMJjQ+JgrnoRMSUOlZ+GR8lBvXEous34TfmIMfhPAkjSEydaj7ZY3UVjORKn9aSUxBT3Nle/XGeJT/SahcEvMWSsMfzz9qZaO89Bl/tZvQBPEC+j3kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by BN9PR11MB5259.namprd11.prod.outlook.com (2603:10b6:408:134::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sat, 26 Sep
 2026 02:18:07 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 02:18:06 +0000
Date: Fri, 25 Sep 2026 19:18:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Brian Nguyen <brian3.nguyen@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Implement print vfunc for page fault info logging
Message-ID: <arcrXAJy/bzijpdp@gsse-cloud1.jf.intel.com>
References: <20260925232757.3456172-2-brian3.nguyen@intel.com>
 <20260925233853.399E01F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925233853.399E01F000FF@smtp.kernel.org>
X-ClientProxiedBy: MW4PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:303:b9::23) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|BN9PR11MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: 179debaa-81b6-442e-eca8-08df1b7466e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|10067099003|56012099006|3023799007|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 7j5tKVJX0iTCiT5m7r67UWkhwh/qv3v218vRVweAe7Ix8kiIgWDtkxoLoMTOccmZmrM6B7sOhPArrQAYZ/pB8CbirY1tc2HUWKqdZ6ZynmhtIA0l9/nQrWV9NadtBVhQdad7AhIj9c1JJ9i6R0awd9WVXJfMeYX8JnZrt29PELmiEp+XDo24cvIOfTWbN40FF1gX4EdoagVj0mmGIeGfeX1ZI89x+8vCLRfJXaIIHx/Tdot+7gMGtYeh1I1i6u7+cNqPz2hYytSIg5o0eQmWgwtYe437R28nQCjFi0COkLIP9qc0kMHH3pdGAe5m5nvYHuQ5RJx3xB5StEkUv6Y7cC7pqseqYXHS5rJ1HZ/IJ/KcmJQaCCZCa9wX6GizQa3Db3SoXONkXn6ez3Ok3pKazkcdlIkR9DNhSpamQQpsMXN+SWVMQ5LLAajzb6dYJHo54DAw5GkcUIo6i6qRsH5L2mPWVU7D9U7OEVHbKtfIaOD7NzKATEsP8zFrJ4i2i7ArRZGQ4SxCezdvhtYGrI+KWav3uyn5xEUNKJMwrd7k7P1VAu0R6HnaPBIXNtCQq9qAYG/yvFDB4h2PVZFK3ACIxW30GN7ua+084nPOD5576eA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(10067099003)(56012099006)(3023799007)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9H/7EpbgXqZNIcMwRqgMYWIhvaqM1L9q2zayTpdxBEHh1mpk+so5DRpOJI?=
 =?iso-8859-1?Q?f8oZCy82lI8EJn19ndkdS/+gbadlreXDgbafgIKgR+tNu7UGCmxbP9V8U6?=
 =?iso-8859-1?Q?bQJWckIQLYMU1VChOBBA6HiimB+77pXIUSCKuoNuZVbI+4hi6G91raNo0J?=
 =?iso-8859-1?Q?8hZzLeezHxnb9h3l8Kr6WOAaCf1xV0AYGee0lO3lZLAnr+YT2LFtZnWlsc?=
 =?iso-8859-1?Q?cBsHIQ2Dg0xiVFFn5z67hmEVcvz7zlniFc8Aq3AUv1l4HQ7qyh0+iYyD97?=
 =?iso-8859-1?Q?cGuVbFmkHCv0Wktt23Lr69p7cJdtWkhNhKycqRdXsGRs4z4FhiGv1iXTHH?=
 =?iso-8859-1?Q?Vz5E1XJSHwdQMxQvlPhm+l2VTgWDadUds+5Z83FXID+op8ywMPf6cXIjL8?=
 =?iso-8859-1?Q?PQeXiXch4gtdcF09rb2VGu94PeiGFREp+Lh+sXHdfyZoWUo8i8LhqueE2T?=
 =?iso-8859-1?Q?9ff/bv9/3ZVuxdFCvIg3OFH+Wznfamk0ABRwzAerjpw+mfSB6PWvTuNw3G?=
 =?iso-8859-1?Q?KAAkUu3T5RXs80qziICRw+hNfjqWC4bCpWS20UhHAzdSZQE164rIsfMVLu?=
 =?iso-8859-1?Q?IQRnetTgM69flH0m8H6SBXidD3/ZkvIPMBh4MxkNAZJt45bBLTK/TewZDS?=
 =?iso-8859-1?Q?ajLy0iXTnSr/nocvrlkqH6cpANRD+XPQK7p0/y7zYEq7Lw7Yb6zQgOkL0V?=
 =?iso-8859-1?Q?CNDkkF8+iJ593/wIsCoT+10Dar4BshNRmTh6Qm4B/C2DsPeFiwMnFj+im+?=
 =?iso-8859-1?Q?zYzrcBT0qmPlLSIUH/rN83k989lTqfVmJWcP92NfVNGHSntVU8PfdjOw3n?=
 =?iso-8859-1?Q?XcdkOpbQ2e2v+lnjX8xZYsv9xqHlqn5abg71min9dy00D5bHaMFh7Jf/7q?=
 =?iso-8859-1?Q?w2D8vMjmmP+c1GT2hTynw9Wd09YTKfCDuX7cSc3+tIFINjAoeT2Wax0HK6?=
 =?iso-8859-1?Q?9mnHnKVOsRy61m26at5aCoG5Iem/4LINo7yCw4i+iCzyIYVtxBxa3akCN5?=
 =?iso-8859-1?Q?pw7TsdA92VEU7OJRiyKrl3PFaOtHTe8gIQXrWnWYyn+gqUnrfqmPeRC5cx?=
 =?iso-8859-1?Q?wjOJxBxeYPfVpHL5JawdZM4umdTXRkd6jBV+3Z/R2vTO+P2wFOcrEvVSaO?=
 =?iso-8859-1?Q?TWA33ZpU6BzChMuV+SvKlGgbSPpLwUUNkL9uBHinxBBtc+PmtZPcEg4tiI?=
 =?iso-8859-1?Q?LLyoSX+Tn0BiuSozVliewBkoiw+NuTFH6xRefbKwpWtUKkz6mWOY8yeCF2?=
 =?iso-8859-1?Q?iQKRprozo0JOqn7e//iHV4qICpcdP2YrSZH3Ypp4tz3NOqy9lphSVQDiT6?=
 =?iso-8859-1?Q?4qrbKo1WI3KyaHNWQeBbjdIH3irQOE1HBg1ppPTHoq4pJl4eEVPC3j4nKz?=
 =?iso-8859-1?Q?sZkWDvUROT4GI38OSP+R6NomF7F9h1zRXR0jKhSCgdhW6NxuP35TtoMa9P?=
 =?iso-8859-1?Q?pkggt/kQRE9vImi5GsblHG4FyE8HtM9yDBMuCmh3mlR0wlEosa+vPzusms?=
 =?iso-8859-1?Q?LsvtZwuhPR9HuL/HY7v268PzPzAqe65l7TOJTQqi0YgAdhCn7Y77fPPz93?=
 =?iso-8859-1?Q?Nz8674sRW/auWvnEByz4LzysmpGEcVYQJdasMIPnN5A7KNbeO9C2w/5oeZ?=
 =?iso-8859-1?Q?5RdJ1cbATek/U9OWu2ItWJq/O81regzNy4epZicl/5MaPnrhM5zZjhHYII?=
 =?iso-8859-1?Q?p3OwAHXFzYwYSVgYCrECT8Wyzbd8oUv4nm2ApZHXVdRERfiodq5RtF8Rj3?=
 =?iso-8859-1?Q?ZYaaiC1YZwTRM0sV1QCAJgSkpfbTIMMuTz6x15tjIR30uRJSR5FZzr1gOP?=
 =?iso-8859-1?Q?aHRNqIKIBil5QWnwnIq/k9UuDH7tdDw=3D?=
X-Exchange-RoutingPolicyChecked: bs9BRoBvQZZ0dlRH658l86so6oYyKlbQsPnajek2imjWteqPlR/wASnadHRLmSeg7jBk1my7envz95fwTB1RTKr4Q6CcXI+bFIwSHNaZP3EYar9ZcWksJIsdP/YmDd431TveMmeVW1kcGsgP1OFN/Ps+g228RFUhQGa2xUWE0ishyvT0a4pvdPTK/e89n6PdSjXCqd8IPE7JUPpAgMV8vL/o96LDzAtbxXiW05X5EZNcSX4KJq3FKfNuVIQa9lAgzm4NWWRwS8rDuRznFhfvihtuX54N1ufWF/4iXtz8TsFoxENubBWwGsAkxp0osQzWKRWb7AYFdZo26b3iXoHApA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 179debaa-81b6-442e-eca8-08df1b7466e3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 02:18:06.7588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: re4/eAYRJkXLV8FLn4G3eL5fl3jQjaiHGwo/HI0FxKFOAyq0j+VRL58nlvoMb6XBDm6hP4E66/j0wVJer+tyZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5259
X-OriginatorOrg: intel.com

On Fri, Sep 25, 2026 at 11:38:52PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] xe: log interleaving and redundant prefixes due to split print calls
> --
> 
> commit 114cd7fd731f9ee67d8c36081ae1b0f44d9be562
> Author: Brian Nguyen <brian3.nguyen@intel.com>
> 
> drm/xe: Implement print vfunc for page fault info logging
> 
> This commit adds a print vfunc to xe_pagefault_ops to let producer
> backends log specific relevant debug info. This keeps the consumer
> layer free of backend-specific formatting logic, with consumer-specific
> prints handled separately.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -607,35 +606,9 @@ static const char *xe_pagefault_error_to_str(enum xe_pagefault_error error)
> >  
> >  static void xe_pagefault_print(struct xe_pagefault *pf)
> >  {
> 
> [ ... ]
> 
> > -		   FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
> > -			     pf->consumer.engine_class_instance),
> > -		   FIELD_GET(XE_PAGEFAULT_SRCID_MASK,
> > -			     pf->consumer.id),
> > +	xe_gt_assert(pf->gt, pf->producer.ops->print);
> > +	pf->producer.ops->print(pf);
> > +	xe_gt_info(pf->gt, "\tError: %s\n",
> >  		   xe_pagefault_error_to_str(xe_pagefault_get_error(pf)));
> >  }
> 
> [Severity: Low]
> Does this split print call cause log interleaving and redundant prefixes?
> 
> Because the error string is now logged with a separate call to xe_gt_info()
> in xe_pagefault_print(), it will be printed as an isolated log entry with
> its own prefix, rather than forming a continuous atomic block with the fault
> details from the producer print vfunc.
> 
> This disrupts the formatting of the page fault debug info, introducing
> redundant logging prefixes in the middle of what used to be a single
> continuous multiline log block. It also creates a risk of concurrent kernel
> messages interleaving with the output.
> 

This is valid too. So either make print accept the output of
xe_pagefault_error_to_str as an argument and print the entire thing in
one shot.

Matt

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925232757.3456172-2-brian3.nguyen@intel.com?part=1
