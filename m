Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590A3356777
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 07:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320175; cv=fail; b=YwDA8gO/JcX+7UOaeVKPnVAAujKJ6Zf8TPNXce8HwoemKyx4A/UYSFNSth0VQOaSdhETSqoJCrkBzt+UisqL8GOW6o6qnrdkLDSxL6ZI+Hx2BqFdGCUBnvyRHaI46VPr0hy4f9Mtd04bIOl1pPSVDegdg2TN9wV3XSbrwAlxHFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320175; c=relaxed/simple;
	bh=vzf1RzrfUYCM23ogh5pTU+bsSbtLQd+Z0BEPmu9lNk8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fQc3AEL/OmQ8bkeGWjQv8plbnQhU30y9bJZ4qXqzdxyBeogqc+U3fawLwr+FZeDj3LoYY4G5aD6b4C9m9YBi7PeswlnP1r2FTMApGXM3rjAMPk89rPv4jQBp9XlZhrvETe/Rr6mV7WImuY8cAAb7p+v3iX1KqBRIYbDvfPHhmaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKvIOZNz; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKvIOZNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790320173; x=1821856173;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vzf1RzrfUYCM23ogh5pTU+bsSbtLQd+Z0BEPmu9lNk8=;
  b=iKvIOZNzA8jsTLH5OuTygc5+2ihVO9qdA0TsnCi4WL2PhBinSE9m7yA4
   JFrlJuvH5ZlKRblpLYopvDQvqqo15WbtoCcwX4qpFa8zJRCU8LhbWh4UN
   fURAXAE8A3WrmppptMfv9jGlVjeFf6jtW/QpI5DVd1SBEQZP5KaEEpBx9
   t3FEWiBsuapJizJQC5nlbg3ufe46SrRVV+F7LR9DWnAFtmYDAiaoJY3Dh
   JS7966U4OS56UfhPIdFhq1P7n0oqHXf+Kj7XWNuCUwf6F5OVXAxII9+nq
   hnxPYovHLecTpYuG34vNnxGyYBSj/MDdz9stF+o2pJ2kktjq4Y/6xYlG5
   g==;
X-CSE-ConnectionGUID: Na8/BG7eRH2YrnG7Nj913A==
X-CSE-MsgGUID: 0fa4RmZeRKOsazQkfLMHyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="78661057"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="78661057"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 00:09:32 -0700
X-CSE-ConnectionGUID: FeeijMECTmG66Zbv51/Kcg==
X-CSE-MsgGUID: JdYiU2RaQ/KFBpBzEeVuLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="282343281"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 00:09:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:09:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 00:09:31 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:09:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZYg1dksvkm83yPcHxyCCvUJu2dbzcdC8Kc/LbfgFRzsvCRXv48Wo5fJxzm1eskq7HT07o4LEBKkbzK22Hc4Z3TxDCj5cSVt4Na9e4G6mLQhB/rcZ1mJ/bml7rb75XZCPy8dzBeEHzICYbDAcxssIvWrsyLchfpJSkW3rpupoNe4eNqzJTNDdbXvM3PmsjHGjBFxKr+H1syJp7KurF4pOTyTF+zDEuqUrWgSf78upk4HLghnA45Ftuv9tzbEb+5tjUEgcb+g811cjKEmMr5nRk71fo1Pf08AKWgtnntTnSdRUHx+4Y9PSPpya5Mi1mQrOOMnOVTt4zGy4TizIp3c/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHbjr8xiRR1T8i8HRSsOGY0vvOb90lpxbrBqUO0XFtQ=;
 b=JsiXSi7iXvL4MOSEB7KIQwGlxw89xbnxyECljJQh/ZNdj9b+e4loJVe8+lNY+76587Ln/v+FM1nvYRB5ESHYGHL+IhaQttcx8zGpBMQwEPHsLlPNeiTWsIiDs+q0o+5SWKjJzbk9ejERmNGP2nHSP38a+Vawfxp3y/jaDZ4O1X3loVx+yXoGO/ELrnrfEXUUSU+5cYfnV8PWO+w89V8GBRSdUgFgIBY89WUjdRynxY47t/H017F/s0xqFTUJEHXlMRrPfqPzeIoGsKu8b7+JvGb23a4PMK9L16jbCYfhef0XNQz/2aoNlFIC7WnQ2N7O0rC6oNJzX1xE8628JzdoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 07:08:50 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 07:08:50 +0000
Date: Fri, 25 Sep 2026 00:08:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 23/24] drm/xe: add migrate ULLS period configfs
 attribute
Message-ID: <arYeAPJnVqPFsYex@gsse-cloud1.jf.intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-24-matthew.brost@intel.com>
 <20260925065156.1EA091F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925065156.1EA091F000FF@smtp.kernel.org>
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SN7PR11MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a899674-63e6-4d5f-2e52-08df1ad3d9e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: P0of5FERMDHgKn+gVYu22mMClYOKGn8snkLhEGg+w4O8FGG/T384dDotBe2r95GQsPqzrkuhQrggxUv58aBSzT4hGKeV0jP6S1W+/GIh4ku8nhmdtNLtUr4pkEELFf1A0YlDs+DrFryhuY5rYqMx++4z7/VSYOWoCQMo1CxOBq9XyzjK1c7xqrmgstNxXHFeMWezIOmA6+A36bt5feqHlvdSebf04J7JIaNZbtwJGGBOV2k/X+eUcEtXlXPzzFXPBS8keS7UWPS/TWzpLXOSjTzyreVtANjnWqpy/6184l30v6Mv4Kxlj7O66JJF0cyoMy5PF2wEwtcvfUFBg95YIjncJpi7Ba+JqTBil++luDyiByNmyjly7O5QVQonSGQNP+79WkfIE83BDhcx/Kxl6s0spuUr6pn6xGRtN83IaLwCMHyzgmDVXYK0JJIKDz+bSqdWuu5k1lBgLNNMaf9wmN9jSSIPO1/sHh1AIzJ/Jpi8CaFS6srYrl7X5gT2s7wiB0D9pjXs2CzHt+npWlUnHeVM8lekHY52O7yPuV+G1rdgyoUChkF46Oz6d+R9UJjeB9XANUE3GDCJ/WG3qGdaGphLL9J8dNtaDAK1LQA4yAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Tij9SDNvVljFySy9gPQzJ8iTvGqmeVt8qyjPt2bnciBf9jEg2zsnp/ZveP?=
 =?iso-8859-1?Q?+6XQqA8pX9b2/1ZJYvnLaJShis1XIoVHyeODeN+RpmesPdFqb/s+oQRrDG?=
 =?iso-8859-1?Q?+zFwY/T9hu6t8wTUqt2Rt33PM/nk/m9AYCRSp7TKnEbMU4Pmz82PDqQLMM?=
 =?iso-8859-1?Q?FMZfvF2GLYh2PU0bG0j8MjDPK81Nb51O9sp1dqjrpLxACZ57VNBKid0Ncc?=
 =?iso-8859-1?Q?sjigCfugBOYVZ/Zs4MJ0ikjpfKtwCDtHJl1mKWiqwhaC6WN68ZZ+rlZ3rH?=
 =?iso-8859-1?Q?tWVIpmuYxM6jOMCCyaYt9a3/vlPQNk+e/6JM95DyaG4TbsuDrwVSybqbCj?=
 =?iso-8859-1?Q?nu5I8PLngtt4A7QiPqsZzN/TMct4Jh7z4aXXXM5XO0Un5HvIJiQTU35k4O?=
 =?iso-8859-1?Q?OQ+19IhKPR5bM2gbZqd/BPc4d7qrpkWK8vIy8Qg1D0vwcFPEZo4K+G3Vec?=
 =?iso-8859-1?Q?AksFPyFP1YuHCYoZNklx8uqKnt/20wfBBSbbnGRURVHdwWf35uHhjVv9B1?=
 =?iso-8859-1?Q?bCn893d52hlquQZ6hw39d/prpUA7TWwP/zQoHbRxkJ3d01baL8yZan5r6m?=
 =?iso-8859-1?Q?aSBqYsap6Mf3eZJNWvP+8N1hYlErSS2eJKIpksV1aIm/lqvePDzIAEpVit?=
 =?iso-8859-1?Q?OzeldNBOEYUGz24z46cu24rA5YfxamnUDu6UjrdnAhPj2LpEDdkD+bqni/?=
 =?iso-8859-1?Q?NfmmyK7CBW3KQmdC31V+8EscivniCeUL3oI23yIpdDsOJpKycNXNkz3S6C?=
 =?iso-8859-1?Q?x3KdtLCW2cS9ftNCIBGvqbZIurWk0eBgjI1RXq4K0yrepSzBrxcKUL1Mq4?=
 =?iso-8859-1?Q?vUKtGurCI4PwxERqu9H9xVreVaORujD8EnWH3kwjUZge4zmRJGn4xQt4Ys?=
 =?iso-8859-1?Q?f16Try4YWLE94y6RlIlr3y4uaDGQX5226ji0cGyA+i8JzPOd6tetmgjyuQ?=
 =?iso-8859-1?Q?2whImqE3EHB2TCdEQEiYBiZNfT3kox7N/l5D0hx+NoHLDlm3gC3z5lh5Fp?=
 =?iso-8859-1?Q?Jw8s6JXLlJpC6mR6q3m/QB6CrDiXhUvwn94fObQtLxiFqS8m6RiQ0+ceNM?=
 =?iso-8859-1?Q?MdNYZ+7PXh1YOPwWBCTWGIV6S8xXgQURvAudM4t5BXHGwWC1FLzKIhvIll?=
 =?iso-8859-1?Q?hT2H1ZBB9aWdeHaxhq1G8EdVDv1QONODakiy4ZsypFtz1sfeTjAT0YPuRx?=
 =?iso-8859-1?Q?xIrk+f5UNxDxnxEaajw36I8ja8QPiaOfCU/uIV52nuLKtMtPjxMa3ejGkO?=
 =?iso-8859-1?Q?flHDAYVDTE9pNaPjABP48iYaipz8+3MVg4xcwCwPchCUhaSBvwzpzLl1Ea?=
 =?iso-8859-1?Q?d1pL2btlOdGlMqc9KCSnJPqwAlCgBBo6VRUhK7VkUZ+BzED1FHyTcu2NPT?=
 =?iso-8859-1?Q?l7XthigcoEBCXMPjwzAwwYVMGLGHujtWgQ1aJ3e/SPqVekrPtzq9vzUKGk?=
 =?iso-8859-1?Q?0B6bPQE7n61D3vMVtREFCJNj6dZtJUQ8YDhoOJgPBljiRayYtFdSHUNLsu?=
 =?iso-8859-1?Q?z6p8SoZM9ULqEPjCs4w5fviqwo8/J0sXzTlznpueAoR1e6V+TcDrS8a8sP?=
 =?iso-8859-1?Q?n18gyMtMtFJW4TgZoV1SOl9+tAY5JafCdla5km6OjE1o00brgw35M2L8dW?=
 =?iso-8859-1?Q?c5it1LN43hAbsmWvjU6o9UMP4NPfXp+QoAoHzcDaXMR/gb7tyft3VvKf5M?=
 =?iso-8859-1?Q?UG6+TK/SrX0Ozhdvaz7+ReMRJoSowc1dkXYcXBaE0xewtk8yZE3mOw5mw3?=
 =?iso-8859-1?Q?zfpx5XPn9JZPVnPQSt7EDdQj3Uwl7qpVnyzuHF3dmIMqoXG4kq21EJrVMY?=
 =?iso-8859-1?Q?at6vtTwh8+hHS/CeeLStCZcU2B6Szc8=3D?=
X-Exchange-RoutingPolicyChecked: wiaTqjbm7nJS/kJDBia6rD9yS+8b8MLd1r1PFmEoKas9i9Hjk2YfAN59ZtOYlnFI+phyNry/9X5hwog9KSKiuYOUdvuh3yROKw58c85Sdt6eyCDE3ScRH2MHre2ps0/YP6uGXQFpO+eRIYt4bzMB+VwgA0g1T4bpnVjmWw7dEa+u+FVzxooEfOmfARrAk+l/2TlGyADi2pb+nlC/yilE6YLPRU7dgQZzB40Uh/rpKn+GPgQQKCocTTxXUakjYIs2qNuAE6RG9G7N/AdQkX0yeAeQhhHzdJhll05Wi+Os92aX44k1KRXAasNNRafTNtTOE69MPdDChFbYuJeLLzKgAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a899674-63e6-4d5f-2e52-08df1ad3d9e2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 07:08:50.6602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LG6IP0VVBW+OVX/XoxrcvRkdXbxtK8FvyEpRwnylcZayySKPmtSvyLvm+FboYVmP0D9Q9DnSdOgRBqpH8Jvfdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
X-OriginatorOrg: intel.com

On Fri, Sep 25, 2026 at 06:51:54AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] xe: format string mismatch for u32 configfs attribute
> --
> 
> commit 11e688bb0c4319099fe2944add90b93a411505ab
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: add migrate ULLS period configfs attribute
> 
> This commit adds a configfs attribute to control the migrate ULLS period.
> The period specifies how long in milliseconds migrate ULLS remains active
> before exiting, primarily intended for performance tuning.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> > index f1555a9d31170..3f09dd17f80e0 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> [ ... ]
> > @@ -631,6 +648,33 @@ static ssize_t enable_multi_queue_store(struct config_item *item, const char *pa
> >  	return len;
> >  }
> >  
> > +static ssize_t migrate_ulls_period_ms_show(struct config_item *item, char *page)
> > +{
> > +	struct xe_config_device *dev = to_xe_config_device(item);
> > +
> > +	return sprintf(page, "%d\n", dev->migrate_ulls_period_ms);
> 
> [Severity: Low]
> Since dev->migrate_ulls_period_ms is an unsigned 32-bit integer (u32),
> could writing a value greater than INT_MAX via configfs cause it to be read
> back as a negative number due to the "%d" format string?
> 
> Would "%u" be more appropriate here to preserve the read/write round-trip
> property for userspace?

Yes, %u is correct. Will fix.

Matt

> 
> > +}
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925045320.1325860-1-matthew.brost@intel.com?part=23
