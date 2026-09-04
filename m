Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A9437105A
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 01:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485557; cv=fail; b=n7krJ1DfhB7PFLmQQeTUUjj9Gql6vpcNwtVMBPUJoG/saQvxQ9AMY5WwHcJHnLj+CGdlDZPKyrFavf6J2KaRtl/rHm29spFV/dnvekwZWX3q1shi2BY8XHC6/8OqOkymnK2r8/+EJcue3AuMWk/bE1Lu4Ec9XURMw9hquG9M7Oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485557; c=relaxed/simple;
	bh=KEMnnpBlAwt6GExBwIkMZuxwCRP0mMZXtLAwzx8Hvk0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NEE+KzbFw3EHbWOQXszooMH4oV0gwxJ+Nltq9wlis8m8w36A+Go3VEAXyOpsylfIdxeC59zxLrlcNsXUFbeioZ4QbBhKRjJlH0gMsBjGL5kTUFTDQ13aAl4tlSSRPVav0Pa/kfOCX3dQkUKGSIv4+h/XnrgtVvResjvJP3mYYEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIpSktRM; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIpSktRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788485556; x=1820021556;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KEMnnpBlAwt6GExBwIkMZuxwCRP0mMZXtLAwzx8Hvk0=;
  b=RIpSktRMi0Gz/eXHSjVMmTQCLXVcJYTS4onfW3XEkRY48wx2QzgNWXtR
   Fhmjs73RQRETaRj6X+hojDzXh0wzrqGcBQG2xWFF4Kzea2TzeE2lQsdl1
   51eF3nzNjGkeanABUzLBJVuqL7gOo90u+awvpDwrQprkdw5dZiTNNbK76
   yfAeiq3Y62iXNarH1eJrbaHSDq7r9H+CebpkbvWyx0Utb4mmGG2sbI6Oz
   8uHjim3OgHFVdddz4/SRS4FOeJTUIZ2/zwsrNi80EeRp0xBXgtKRg6+Ic
   K09KiUihnBekQ5lv7w9h7gQzQmtUYJKZ5ewf/xsaAtGQeNZfDnGXAwxHB
   w==;
X-CSE-ConnectionGUID: lXHfmx47RY6LUk7VmzmY8A==
X-CSE-MsgGUID: qVz5albyS7yhl4oWXtINPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99579760"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99579760"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 18:32:34 -0700
X-CSE-ConnectionGUID: C2o343ZDSdWOiXJnhy+zhQ==
X-CSE-MsgGUID: 5PhowQViTpex3FY95cocxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="266649406"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 18:32:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 18:32:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 18:32:33 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 18:32:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gw1C/CTxl+CGDS0DtOWxrJ+dCrBicTmmHPxcCbPJvBBkPbjbmeCxkeFl/NtBh2+iR31+TWbzWZZWyzuw/HK+82x6EHuVpJTyyJGrXqS0l1HWDalzOQLCHRRhzJVeyGm9iVRhBCw6yEqX4jMotXyhPxFy0i0Qf6OSE9wctVBawPiD8PIm6PqbIVRnfFQ7g10JqfCQ04wuEObC7dKw0e4Xzfafggc8AALIZ0+pHIPAzYBHGcbcY2YqSKK9T1zKi7iOFqqOI/snXmvvMcmKBx543IAPjZvR98Y5STduxC0XdV5pdbJNbAaccWqTGrODjmtTMczau/sE0mQq+Meu4YAotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUjE327Rr65ttNfB7AgaTkTY+5kWyxf9qo2A4Nd+nWs=;
 b=QAnejPTBLvclwHoJ6RtpF44wAeBc4Qm+YJz1nk7GXoTsAHlFFWfMEr57vjJDAEkx3+yV2AWzvtsbhIQKh0lCpXc5iNpKbTQwKsYJTc6NTlrI7OT50MMYuzr/nywIC7vadM5tCk3Zu5+cdvMKQQaAxGWhSceh33DIe27hzgMe2ksEgz7OmtjkGHrT5n3PQnklmD9Ki6hzhcZv2nlMy6jPrcFIqrTPCbN4Hx4KPhSM37DYvOmelDF5HQ3avDa7QfKB2nGAhYP+hf4/2vkBQyAKmqtY0SGeQnLG0smnzFAHH24TQIuwzaXC4gWmza30cbYFVJDN+c8SOAnI7NikzbnEHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9351.namprd11.prod.outlook.com (2603:10b6:208:57c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 01:32:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 01:32:31 +0000
Date: Thu, 3 Sep 2026 18:32:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 23/25] drm/xe: Enter ULLS for migration jobs upon page
 fault or SVM prefetch
Message-ID: <apofrXDKfPgfa7Un@gsse-cloud1.jf.intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-24-matthew.brost@intel.com>
 <20260904002852.BBB201F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904002852.BBB201F000E9@smtp.kernel.org>
X-ClientProxiedBy: MW4PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:303:b4::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b0d9b3-cf98-4ace-77c8-08df0a246378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: I/91yQgwK2cymJm1W7t36gILmqT49WXfs6Eh34L0AhyGRgGPbwNsaLCveM4h5MmuHyB0lawQOvAaIw3Ym4vmIFhEZZYXWPAkPsArCDFZ0GnXGYOXVDInOh3MZP9R7PrzNGV+67PJmHp6EZ5CavG8lV9BYV0d6MI3D3efNpbZF+G50yKEWR0QSMVYDD9jlCV0APrjROTo/yjId29Ns/bBba4K5CKjL0wtxuaenqzTG5EAnp4mJUGeeRPqt8SNNfd/ujnUSEBCTyouF8U3ouQkiAuK7Eq/v+YJafX3VMK96XJdOMxsF8SkwMNuR5o9mlBE7E4HxaN7LQuWROFx2fgvjX9neXgMAVsxNdOJTAWG/bCLMQill44Ae9mT8NNJrKpBE21y65mZlSfXRFR/j2601eoxDYsIzAGBF35CvJIDFBO+UuixeBgRjHgW9hARFOCMOSwEiZ/Hmyj5MkZ3HsLpyJSyutJKXPeOPVt1sqaAlDN6fS1ysfX2saDERlHT1MQrvaK5y8YQta7+wWCCFIKALQBNRHzrMhnETq+vFrKEqx+YY7WOoJODpyMNi76Eh0Q1hq0CzVfUXN3t1FMb39/BLbObjVgmZym060cFgpqm3M8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TteIulE8kSJffyTFtFfwpFSQGwPLBjCxBfCFYbrr5urpVCEohWJZCkEhRq?=
 =?iso-8859-1?Q?KJaVXYowlXDpTkOVMgYk71MNR9Zp2Y88uCbZUvR881QXXumlb8uGinxVeD?=
 =?iso-8859-1?Q?ibocX7U6idTs4UDynuzYcNg+BkQBGdfxhS1Dna8BFU9XixmeaDuL9ODfdD?=
 =?iso-8859-1?Q?Cpwp3peZpEPEkNMaItkYSGcY7uRuP/lrxShpXUOf7cNev1MEOJk57zh7j1?=
 =?iso-8859-1?Q?bXbtDke/4kLT7JilLM9ZB8Rfd8uRUUlYatRyNF5ffeQ6koQsOIPrhV3Czm?=
 =?iso-8859-1?Q?zovJxwkbeGXcfd92sS3nquWADdONpFMWca8JMb7j7HZtDzJmy+ex+EZxOI?=
 =?iso-8859-1?Q?i3qDlcYOGr4k4K1pOWIyEuciQbMW5nuHRO2CjItxNi11Mjv1zm9cGjNyfn?=
 =?iso-8859-1?Q?7LqlNQ4S2FwERLfRxLOxh49bU5v6Wy/7/E2MYQm64miQaaaUWVNzYO6YiE?=
 =?iso-8859-1?Q?NFOtwxcXl61hoM+ZGA/wBmlYHhi+YslYSNoTDGZPJW4WFn9k2/SIaCaHVQ?=
 =?iso-8859-1?Q?M6HeMHxC6BE0+M3AzO3rMNcQ5F0Pm+VtJGR5UAb6GZOzvFTEgrNOkqHKlT?=
 =?iso-8859-1?Q?XVHDlT0LCVFCMNCpTAFORdWt2AK//NR6sdDqIVSZNvt2fZQDRBedB2dYxn?=
 =?iso-8859-1?Q?baS4292z79OM8qQGydIMMyLaNXS2mGf86Dt+MwrrK8q85l9mouExTCwP6S?=
 =?iso-8859-1?Q?DekLDjmfBLdiTV7yY+/C5cJIO/cbKIAF+NqHyg7ISnqhP0TYyut8e/sHT+?=
 =?iso-8859-1?Q?G8Lm1Id93ctxBWZU2WGPXHpfBiAdn9B+Q1jJI+2/C9iGt0BLrGsZPiOL6N?=
 =?iso-8859-1?Q?+WcJLDtcG5NU9t5RdgQ24o4gtm9Y9S40A+lZuMo0YGkepxiXVjZMjI+FMC?=
 =?iso-8859-1?Q?BUTnPe5CNsoc2Y+LhCExbXQqQzxEw3NtV4tlvv5wFmjcnbkHgCpFlB6c/q?=
 =?iso-8859-1?Q?yBtxP/lrUXf8/vsnVtwKYBgVDA1RnIDofuiEKBf5fsCQLRtfpLgcpc+TeR?=
 =?iso-8859-1?Q?rXgLhxRqX92aPElFjdMKUr7YgzU+/cXnZYa3etZSw469lRS3lwMRiCgpGN?=
 =?iso-8859-1?Q?NoqmGa/vXYFNXcArlTTAe97jRqyI2j9CmsqEEGIFaigUo3siMWbxazWebt?=
 =?iso-8859-1?Q?mmV0STBzfh8biItUKumOPyAVPDWBKRb2JFFUl4tIPVMs11qZlXd7apVNAE?=
 =?iso-8859-1?Q?6T8e50+fJMoCDLX4xXfWj7ujI11cwpMtQz1sc4nFshw4w/OfpotM+xRDDL?=
 =?iso-8859-1?Q?j6E60BSYKEUFg0u6XwfoNXB+cod5Mqc16WQ2HcPQetnECLlISGcBqVcj50?=
 =?iso-8859-1?Q?v2yOJvm/QbSDheGD9eNNbdsC97AEXpBx144N1ZM7VzAX0oNbBVcrtdyBS8?=
 =?iso-8859-1?Q?LLw8NWDAUgvXvOK1+WMjPKJXJof9N82apJ/0PO+zXpJXDq4Lm8aCo77xlr?=
 =?iso-8859-1?Q?bcofFVEzT3ipQPQxIhXnGe0kNozDZ4imaE3Rss5o/HQYgE6ozvudx1Rr8r?=
 =?iso-8859-1?Q?oBocy2MwPY9Zsrv5NckjDxaOvs2EOPmeEuau8CYJt9UlxpnHWH1hOcvDNr?=
 =?iso-8859-1?Q?ToXzNmMJFforp77fuCPaKU66wLxEg+oLHB7ndDlobhdl6IFbbVGcQmYjKR?=
 =?iso-8859-1?Q?rBkiH9AlrsAUIADZzO+9owjX0xm8l2mwBS0wUlUDOlP1h0dKHJSNBRlJkM?=
 =?iso-8859-1?Q?FdYVDp3MaiPljCEvLnr5BERS0YZdvdS7knPrbEy+z8qBPcjHHTb0pJFZcv?=
 =?iso-8859-1?Q?1Y5DcWJYStmMKRaZwNNwfkO9t40U21xCGBDE5qOkj4bg7+YmSy1cG5J/SI?=
 =?iso-8859-1?Q?KzmgALmN++yeynoZWXG9Csksa2BHeYo=3D?=
X-Exchange-RoutingPolicyChecked: SHmvXmQvUGvvvICHsu6kt/Nr+u8FXSR9nhHOIzicZeFOoD9tna09Ibin4jP/misBPCufwnsTqPwAic808POeb0gqrK4mYY3jSxtO89AtQujyDo3oEkHXUB801XFlXulg7vaPxJaB1QNvakoURn5gtnZv/Z7c+q11DO+t9YSUXbLqNwDYWodtnWEp6ww3yC1fGb7W2aHkO3Kbw3ccElry6Ea1Hq21qmgPU7L2KbETNVF8RtE2sZ3a8H3vg7As+kv8b7Yi7AdL0SN84R8wweKnKKbqYfdAiLjHjWXYWwW6m4DKF3qf1DFBKm5pwmG6Bw7rYdJjqLAx39Gk+3J1rKzCOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b0d9b3-cf98-4ace-77c8-08df0a246378
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 01:32:31.5066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oUQkfW57+VVKohxz3jlwKlo4bsX/O10lBJMkKmdp5YjnyqwMGHMN84cb0+GTn6Y4vlAdf4/uI8eJHh8IGz3HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9351
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 12:28:52AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Incorrect ordering of xe_pm_runtime_put() and xe_force_wake_put() leading to hardware MMIO access on a potentially suspended device.
> --
> 
> commit 43d7d496e886ff3c7ea66fac7a62b351eae1e2b2
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Enter ULLS for migration jobs upon page fault or SVM prefetch
> 
> This commit calls xe_migrate_ulls_enter upon page fault or SVM prefetch in an
> effort to speed up these critical paths. It also adjusts the teardown and exit
> sequences for ULLS migration jobs.
> 
> Link: https://patch.msgid.link/20260228013501.106680-25-matthew.brost@intel.com
> 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 1fa236eb1a260..80efa67fc2e15 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -114,8 +114,8 @@ static void xe_migrate_fini(void *arg)
> >  	disable_delayed_work_sync(&m->ulls.exit_work);
> >  	mutex_lock(&m->job_mutex);
> >  	if (m->ulls.enabled) {
> > -		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
> >  		xe_pm_runtime_put(xe);
> > +		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
> 
> [Severity: High]
> Does swapping the order here risk accessing hardware MMIO while the device
> is suspended?
> 
> Because xe_pm_runtime_put() drops the runtime PM usage counter, it could
> trigger a synchronous or asynchronous runtime suspend. If the device suspends
> before xe_force_wake_put() completes its MMIO writes to release the forcewake
> domain, it could result in PCI Unsupported Request (UR) errors or device hangs.
> 
> >  		m->ulls.enabled = false;
> >  	}
> >  	mutex_unlock(&m->job_mutex);
> > @@ -589,8 +589,8 @@ static void xe_migrate_ulls_exit(struct work_struct *work)
> >  		xe_sched_job_put(job);
> >  	if (!m->ulls.enabled) {
> >  		/* Pairs with PM gets on enter */
> > -		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
> >  		xe_pm_runtime_put(xe);
> > +		xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe->domain);
> 
> [Severity: High]
> Is this order change safe from a runtime PM perspective? 
> 
> Similar to the sequence in xe_migrate_fini(), dropping the PM reference in
> xe_migrate_ulls_exit() before releasing the forcewake domain might allow the
> device to suspend while xe_force_wake_put() is still accessing hardware MMIO
> registers.
> 

These are correct, will fix.

Matt

> >  
> >  		cancel_delayed_work(&m->ulls.exit_work);
> >  		xe_dbg(xe, "Migrate ULLS mode exit");
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903235842.3401722-1-matthew.brost@intel.com?part=23
