Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51993361944
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 01:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485756; cv=fail; b=qqmkhj8YiK9kfrQPCuV/BqTQ63FrkVZPktP7l88xa9IlQAUJ0TqZp8m+RmXA1rT0d0wXv8acOOsPyy+Xp7/lqgPiYx7O/NqkXQia0Tlk1YIPgt0IQAoGF0/J1JcUnsWAW2LRSe1Z6DSzV4ovaKaUdzdKwnJtrBlEi94Wx9iIZ0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485756; c=relaxed/simple;
	bh=jn3LqFBcCtfe0BZHPvoWxsfaUzZB4oIcFmo6u8v7bDY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qd2GEhnf7QoDoK4ibHRBqap5Tnr4MuwWumY6ODRdNBYy+ERo59K7gbQ3RR1BNbjfJSxoFTgcB+qaHWDnjHdsiQZLp5rFU0JiZrIL73WI+UoVP4V7wqaTm+eeYzEBbg6ejKW98yex1oqTkgA/hgzy6RaPPT0oldnJpQgeEK8+cf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmILtJS7; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmILtJS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788485755; x=1820021755;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jn3LqFBcCtfe0BZHPvoWxsfaUzZB4oIcFmo6u8v7bDY=;
  b=kmILtJS7nM6NvZGiC6SgC92Pt4LC80OR7PKvDP3/ym+81ZEJS5+4jqJ3
   LPli6zFedRZiDReEAXGv4YT0X7hgvQj+u0dBCFxNuR7IKzromOmfywxM7
   eeSHVb1yQXfhVqP8i4duHH21hYs/j+VwsjO5hX3vM/4B5eNDrP5/M9PMO
   LGtLiIXavTagvJSEqXBMm/VLZO5hp82oPQZ/PVC2iaL1NAGoDNJMxF+5g
   SbuCS0YCbxLUvqhTu/MEbH5wV6HXhDD+sND7Tg03SJTserPqOdTgiRsJt
   MEm1wKPxtkOAtQ1j5pvBgxze+ymF6UiXF+5sIIKa8z0qr55AsGOXM0FNX
   g==;
X-CSE-ConnectionGUID: oTkd/HpSTUGb/QhD9IA1dQ==
X-CSE-MsgGUID: UjX3+8aRS0CdzM+gQJCsfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99579978"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99579978"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 18:35:54 -0700
X-CSE-ConnectionGUID: G7047E5lSE+Bc1AXr7+6cg==
X-CSE-MsgGUID: P37t+1UaRbuUp1AgwEKR+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="266650013"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 18:35:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 18:35:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 18:35:54 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 18:35:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCAKAUCaxzUJXh7O3zDyt0gSwTkbX3OFKpaCp5GI5Q2nhIOJaul+2kJawPyqqHa2qLPshL9fjqbL+LUBgscDawqwXplBalaDXZET67Qs0YhbJK3wg7N0N0h5g/OJ9nRcBScZ1UyhjnwZfddf8GfnXR21/F/Tn3UOQMqc+EkkG3mCQ8AbbRmgjSaCLfOj24QJi4FUh64Od5GPN3IibmcUjq4+7Artw7nA5N1X+4nCPH9wRFTOoRuwzvo1e2PzyFf3lzCk/l2U71JlSPLS5/gi03/V3i+/WtQXIsrtNj272BbLk35fywYuKaMajye30WqaP3mKhccKvv7X918GdhOdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wahli05s8D9DF8nfUTK2NgXlrwE2YJaju2m2GIGxeOE=;
 b=nWi9hfi3KXq4+JcIEBCJV95cju8pS8kMAnHZByIo3S3KU4F56k8fcQpTu5vZ6tC7XPYw7B73VyZwxKDBYu5OO9VJ0i0CHD44qnZ3P9kP182NIP1gTlc+gceAH4z4t2FcbTJU3i4oLdwzpyF7A/+3wIR9xlJFPTblUV3pasPBuJGu9egCS0734cFxm/ZQp4HOAiItPDYOfRs0JWlyfmNsvoxIBEmFPFh2/64eEA8r1PkQG4FixQlfzUJixcr7Ar2vpYKPVfauNnzv0/jiMeelRbuw4OzNtHHbUYryI2SvBTfvGgQ08HB+JrXFt5jggnMmXaDk/CwJXlCS60WBCXt0Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8942.namprd11.prod.outlook.com (2603:10b6:208:56b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 01:35:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 01:35:40 +0000
Date: Thu, 3 Sep 2026 18:35:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 20/25] drm/xe: Add ULLS migration job support to
 migration layer
Message-ID: <apogar9I32DNeIU8@gsse-cloud1.jf.intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-21-matthew.brost@intel.com>
 <20260904002720.958281F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904002720.958281F00A3D@smtp.kernel.org>
X-ClientProxiedBy: MW4PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:303:b7::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8942:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ffa78e-d543-4894-8efc-08df0a24d3fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|6133799003|18002099003|56012099006|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: 5WKxKqFsPq88T/lImnsx1kkDrrStY4zpFLwDEVXOTukL+i5WAv5u5ieG1BTSqYAMvCowrXbKG9204kOmcqQPSOpqswp7lmcjUIvwhcsMOMOLGOtWGEMkPcXJwoPcI48CQ+G7v16fiSXtdlwcaXhfWYpWOOy/3mBnf2HLO9wB2Ei+8MSr2rfUp5LLckjZVz7nPAsoiO1cGPukJdcu5s/gSIVQha1P2/gQ4maRNK4zUSF2vt0jk6TN6xxKOvk7QpH0Y6VFR8MMXcEdnj/PixJOoWMSqOOHHY6khTTnuN5Hx+y6jO59i1TkD+7+b+ucNIEt7UOtXPXyzP4StqpzXv+9+4XROGhygqeFbsG+jeQOQ5QXiHUeEiLEVNNK5Z4p03aPpFvW+xewv0HI+vIT5fuVcR4aOxnV2ZyUX8G+MGgPD7ogsp8f3ZyvpMJzYBwf0VfCSpgBHsGvUKxFTbXVk6DFvQM9udHLAz72wsKFWxMAOJvEk08koTh6jeBptRovN69imZbHcVAdiMr559eo7uNDR4NKApAkNnwJlhTxYDHRShYmtNHY7pkpUhYpTRW5G/zlEAy/lQ/+X/iEjJoe7UAY062v4tLIXHkqBd+lKOjvc+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(6133799003)(18002099003)(56012099006)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tAd4n2sT64+MCaXzHIz36WOdme/GT3Hb44OM8vierFaE65wKDTtgWsdZ0v?=
 =?iso-8859-1?Q?m5Kb/oPWi+hhC7Vb8H80JESNOzxrL/lW3evB0BBDaOgr2Ggw4I3UHu0zxk?=
 =?iso-8859-1?Q?y20jf8Q9uhfy5hlLOVOpRB/ll4kFVgF4w/88CfZ6fyEAFNZmkyYKxa/mzj?=
 =?iso-8859-1?Q?GtYQlAGTd1+SfEnrE8Lwxsr8ek56a7oEL812Ceubsv/8uVqVYmF8v4FVMk?=
 =?iso-8859-1?Q?blFgIb8nyWx9IXvd7Ebvf0ryl3k6nCK3TYlAqKBij4JJgJeeSvTx8PeuOE?=
 =?iso-8859-1?Q?0zYmIlRzqRZGbyzoZ0T8iK5xXgGR1BtDlKI0O8mQs8iXPsk7y1HVyD61Tv?=
 =?iso-8859-1?Q?W717D0E3ejj5Gracx9/meXuFgcK4Ud3e0q0FDeyyUq5Tjl/rhMxubv1j0R?=
 =?iso-8859-1?Q?AIwEjeVSXqOsZgdTsbMrbi+++csQstUP3R6Sv+OGquHSuXap6c0fap91Ki?=
 =?iso-8859-1?Q?0xGTAFceSFPIdIyEm/TwFiBYgFNXlTySDMlTTXWFdMDFmDsVO+Ou4soOZf?=
 =?iso-8859-1?Q?HQeF5lLAuiwvgJByrTEsun0i4w+3JFzsmAlrkruG2PAwuNUwOpmutJ6duz?=
 =?iso-8859-1?Q?uD/wCHJTa9pECZIJ0Wp1WaTtRYiX0PS+GO2qqoXCC1c6OPMTxGs745oTpz?=
 =?iso-8859-1?Q?RycqY3LZKvBfF8EgZ0AR66VLdEakWmOUc9YqlWul8KZNJEEtIkPsyBLeJI?=
 =?iso-8859-1?Q?sz7NN3GtUy5zkCSiCX6R+LcIIIlZkeqEjRl/1uXaQDW6Uv/5cfvvH5dwxJ?=
 =?iso-8859-1?Q?ZsDfJzswLfppDqgiJNO8ZbJvZFum1kXisoxx7GeUfX8LflHs/YDAiM0Pg8?=
 =?iso-8859-1?Q?vWahkpH2dvVBiiGuDS3cd/dS7w3hgcg3fpnR/T2guDWECNk6lNYRhq+Fed?=
 =?iso-8859-1?Q?6G41CMN/Mv9RsL3nb+8aF+23aZ+ntIuWDVwJ2M4X9O/Nv2VCTpQx6kGg7i?=
 =?iso-8859-1?Q?UYdlEfwAtBIb5hpKefhv2bC8hhokCUUQOXAqXVnMW9yBEHJUsceQ3ZZ94A?=
 =?iso-8859-1?Q?yKSjExeDTkA1MfEmZyY5hAS9XzDdSY8+AmBUNUxoZ1cHm/+UOOP9VwyU+T?=
 =?iso-8859-1?Q?Pzy/vNOWJz+MqSNE1uhyS5hkc7zsY/xD7ElQS1zBl5N8L63r4Mxu1vRakV?=
 =?iso-8859-1?Q?scN2juufFHTV8XCaCEjIdRrdbeRoOUHLqIUPIFtr4EjiQ0MPoTrKufoeKB?=
 =?iso-8859-1?Q?co8QM5w/EHC/H7e63WystudidKPO0HlL5wio3c39z/Fv38qVfho9IXuAdm?=
 =?iso-8859-1?Q?cAxpGVLO7zjCljTu4LmolG06ccCsftYDVfyvnolQvQ9QPelNpCLsFeJedy?=
 =?iso-8859-1?Q?wapBYisq2Z8TG4onB4Ao5X25BAK5Es+OZmLAzEh4r9lW+neXRDPnt2mg85?=
 =?iso-8859-1?Q?zOZOrgR6uW1JlZKJB0nIDlpZkYi+ORzuDJhF8+g+XwH09lKRb2zrMchlJw?=
 =?iso-8859-1?Q?L+k+3iSlp1pe2wnPRFlO7HVjUORjny1loygO47rUfU0AMUYtrRNdBcnEhW?=
 =?iso-8859-1?Q?J/8S9JeNvciTTIOsr4D+igywIfaRJNgRrYW/OoFzuwZVklhxSpKCTAIClA?=
 =?iso-8859-1?Q?148iNvyjW/H528fh46fh7x2taqAkDLkgH6qfw1Tocblb+gdJmTCyz+pmkb?=
 =?iso-8859-1?Q?OZYWh1sSJ7CE1cTlv7dPDBPfxxpHf4BHJ0OXq0glbU+ksWBhQCdHqoz5kP?=
 =?iso-8859-1?Q?WEyOcDQXNLUB2O96PM1wKJ7UuZ3igTFUy/eGxvLvLQNyPcLwd0eTT2/LPz?=
 =?iso-8859-1?Q?xAXOjZxtsLbL87csnWV8vlVK2sisSOKzv8Yf6dJ0DPNS/sF+ygZ+UXrpFR?=
 =?iso-8859-1?Q?2zfGAhKKpFxpQx6bqGJ9icqf13LBoXU=3D?=
X-Exchange-RoutingPolicyChecked: UYM02JzkO4VyysQvqNZx/qOPg3TAoAVTNqSFvfJ+umLweSuB+kc20DbcIz/9BSN/RcIqIvAodSizXkPe1OxhFJmGJn4J4f98qzwHqp0W/niJvTWc8CtYRS8nRzMHnKbkY609noTpelecc75fiIzThAzzrZpRHCr758yKl1aBx3wsZP+ptSxDZwZXAnOGkTIcCnrMA72w86CAbZLk1zfMripdnktKsBC2iyffdQqluxxSJuAZ0GJTkdk0knx1JzFptCvRTg87vVu5A/PzeBnVciBjbfuJDXMRDQU0UiCa3CYwJTrUZuprLJtiijQMxl12RkgTuNqhvOMYoIjM7v6FzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ffa78e-d543-4894-8efc-08df0a24d3fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 01:35:40.2822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFTxyyaeBKgcxGs0HctzOEsHmmYxpkgkB3PkT121HatrYZwvo1Polomfx9F5yavtVpp59BcrxKsaTlR18nKqTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8942
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 12:27:20AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Waiting on a dma_fence while holding a reclaim-tainted mutex causes deadlocks and lockdep splats.
> - [Medium] ULLS mode exit delay is implemented as 20ms instead of the intended 5us.
> --
> 
> commit 68ec8c46273b3023414fee593faab1cdb6c24eca
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Add ULLS migration job support to migration layer
> 
> This commit adds a function to enter ULLS mode for migration jobs and a
> delayed worker to exit it for power savings. The ULLS mode exit delay is
> intended to be 5us. It also updates migration job flags so the submission
> backend properly submits in ULLS mode.
> 
> Link: https://patch.msgid.link/20260228013501.106680-21-matthew.brost@intel.com
> 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -77,6 +80,14 @@ struct xe_migrate {
> >  	struct dma_fence *fence;
> >  	/** @min_chunk_size: For dgfx, Minimum chunk size */
> >  	u64 min_chunk_size;
> > +	/** @ulls: ULLS support */
> > +	struct {
> > +		/** @ulls.enabled: ULLS is enabled */
> > +		bool enabled;
> > +#define ULLS_EXIT_JIFFIES	(HZ / 50)
> 
> [Severity: Medium]
> The commit message states "ULLS mode exit delay is currently set to 5us", but
> does this macro actually result in 5us? 
> 
> Using (HZ / 50) yields 20 milliseconds on a 1000Hz kernel, and 20 milliseconds
> on a 100Hz kernel (since 100/50 is 2 jiffies). Both evaluate to 20,000us
> instead of 5us.
> 
> Additionally, delayed_work uses jiffy-resolution timers which cannot achieve
> microsecond precision. Will this cause the engine to remain awake and consume
> power for 4000x longer than intended?
> 

Code and commit message are wrong, intent is 5ms. Will fix both.

> > +		/** @ulls.exit_work: ULLS exit worker */
> > +		struct delayed_work exit_work;
> > +	} ulls;
> >  };
> 
> [ ... ]
> 
> > +static void xe_migrate_ulls_exit(struct work_struct *work)
> > +{
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
> Can calling dma_fence_wait() here while holding m->job_mutex cause a deadlock?
> 
> The job_mutex is initialized with fs_reclaim_acquire(), which marks it as
> participating in memory reclaim paths. Waiting on a dma_fence while holding
> a reclaim-tainted lock is generally unsafe because fence signaling paths
> cannot safely allocate memory without risking a forward-progress dependency
> inversion.
> 
> If a page fault blocks on job_mutex (e.g. via xe_migrate_ulls_enter) while
> a GPU reset that requires memory reclaim is pending, could this deadlock the
> system and trigger a lockdep splat?
> 

No correct. A fence always signals without allocating more memory so no
deadlock risk.

Matt

> > +	dma_fence_put(fence);
> > +
> > +	m->ulls.enabled = false;
> > +unlock_exit:
> > +	if (job)
> > +		xe_sched_job_put(job);
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903235842.3401722-1-matthew.brost@intel.com?part=20
