Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07C4340281
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 21:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789421006; cv=fail; b=o/UaphD4q0bDs87AP3JbyUdkZwAHd6rX/jj0Tkl6mMAZPkMqkhdwfbXvnMVq5d74rQUCmGOelCvkA+UTi2sOZnWrmGoh8jyuB8lZwvvM2m23xlHXauL5bQAAnNWyhpWWJMu9AxxrN6zbb1/xehqP1A7zp8rOOzyodFERQp8tFrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789421006; c=relaxed/simple;
	bh=jKEgamW2cvZ1QnTPRg0nmvFGQZHhlJuCxQ+n6VHXmPQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K+jxfDla8rhUJh0IlsJI0cxPFHi8SahcQccrkJMv49FKsdD0ajBuAS1R3pkvK39D6wMVWMN+tlOWgTgG1sjbawvN14QHn95Z0zljBXHhr4xuY2XnB915chLhM1pzqGD1kiROEJbjz4DOtoQ5n0R+3YZcEOZfkl7wk23xpQpnums=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+0rJ/dY; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+0rJ/dY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789421004; x=1820957004;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jKEgamW2cvZ1QnTPRg0nmvFGQZHhlJuCxQ+n6VHXmPQ=;
  b=A+0rJ/dYTHJ9ePDggZRhVJYV0Isfy9VL7IvqHrJzs4q6blGz9NxAAMmg
   8O5XBn8AbKZVfqzjyEUS03H5KPFGqrS6QBjh1QmfQPPsJyfpcRa/Hy5R/
   MCNI48JcvKk9jf8nBV3Zti+mOX7lTvFAOST8mFXU9iebCeR9K9+poTtyr
   NMYg9OPtuwNlnLZe/SotfibW2v58XQJUvVvtqeqnBsDN30VA97lo69csO
   Cj8iHSwsqDgQBzHQdxzNx6Tr3PW0xbJaql1PdN4CNG6sAdFwqOlsAlBiG
   krmquUNdfIkAcZ2ffJ7vNrlayqgr20Z7kc0aIBz5ZghAX9hcOgO9kUGxs
   Q==;
X-CSE-ConnectionGUID: pEK7bzCdTqGMVPztPr95vg==
X-CSE-MsgGUID: Bg4Ne3jBTiyaC/RJrIsmMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88719203"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88719203"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:23:23 -0700
X-CSE-ConnectionGUID: 12xQkqY9Rj2gIUUilmKb/g==
X-CSE-MsgGUID: BidMMJHCRwCJqOHIpic0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="969914"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:23:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:23:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 14:23:22 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 14:23:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYNafRG5GWFDaXmfqgrBMMIRCxpdG0rvbjEDFun+9jUzsJncQHIh44UdS/KTkRhQFlVa4H/FDeuRaV711eHMksQCBmd7/IEo6RtL72pqK0I+1QzDGjBJQeyM/n2Axp9OGzOgMDu5MsZG/wrnBIgwXUforHSHbbUKuIh9V9v7NzxHq0Y2PMg69pi+6nyMz2d4noO0HGBCRb+qXHPr+AEuDIW8nz8HIs3DzLlHSG4nAuPvyIzCeM86TTZsfvKLwvkr8BJb3ATjUzLxMv+KhZHLIGI3Iuu7TPvqF8X9XB/PNRdzVR1lbfXzKaCrsuPF1E6F66cra+5FXBA2PprY3KE3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miSghEWREbxgT51n9JNi6bxa4EEZkBnXj4nGIl/Wt7k=;
 b=AlDV20TDLOY+hVAskiLq0xjvGk63nNK6Y8oEBjIy6HfB1MeAnlwAjjda2bX8IHYxLbg+yOE22/cZLJ3dJDhzJy6KpbxpIqQwTqdodGv2egkIRbyR9WC4F8EQtInRjnFHhZzY11kTwMgPffKTQhvT+UnU3FK0Mz5GZQnyYAo2ifYmXM2oRPIday4BH2aj/Np6//7vkaq7bhslMfYybQ06F2ClsJvUlPiaFVwvpXPU+GVr07ZWjcPgN5ddgMGoy4mNX/BOHhjwDkvyr8d47EGEw2NjxNaFJElsB8+iw3wlHYToTTAo8S/diCgtMABo+ppQw7qr864Yh5eXaDxrjrhFpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Mon, 14 Sep
 2026 21:23:18 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:23:17 +0000
Date: Mon, 14 Sep 2026 17:23:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
CC: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 05/20] platform/x86/intel/pmt: Do not remap when using
 callbacks
Message-ID: <aqhlwv7BDBjqGbRg@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-27-michael.j.ruhl@intel.com>
 <20260911202614.E8FCE1F000FF@smtp.kernel.org>
 <aqgbdgS-YL3tW91L@intel.com>
 <CH3PR11MB04614995E902A465623F5148DEC1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH3PR11MB04614995E902A465623F5148DEC1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR21CA0010.namprd21.prod.outlook.com
 (2603:10b6:a03:114::20) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS0PR11MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf98f0c-d310-4e8c-2535-08df12a664e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|3023799007|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ba/pKrDfJA87krP7oH9h0EyLg9fw3R3y9FlCm9oNMN8/8i/ushxSujT8gkmusBCBiWNWk3Pn5NPE+n2vtXTTX3Qm8Tdo3So+zs/KDHmUkzMTiHxfq/fQSc9mQ+yVfZczief6X82PWEwr9ZjBHid7JCYtaE1N0quV7WAdIFY2X5SqdOVFCCxv60qGPKi+E93eio+bXN2xiQ73cPxaHHQiGHnHQya+UZ+QEtea9neUbfFBwV5U0iwkB/CIM7AgU9zw2EikWDkwXkIYpwlOROhAywBc9/+FiVfDBKdJ66i/0oKHiDt6BEAmjT8wEmHlEk3pE9iVB7Umz83YDjF/3roNvp0vAMfqVv/jlQmsb9mfajXEA52D1p1bIhiqFRun6G5YlfbU1ewkoI8c3Uj3ZIQJlN0QqNd+Pwzvjj4Hs7QVx0yz3R6AacABb0LsaJsJ6nKRlk6oBrTld7grMWB0VR3JIkHmOo3S99k7Hd4mmivM4cWriVp8JI64ZYHMyCLI+Qk5hHHbHoLx8XLKawtpvX4txoriEAtF1j67rFfrMTRzllhJ0ex3P/BaQbYcIm/cAlkjzJ8kYpfX4d4LBj5KyP/USDyXXxCxz6dE2jAk7AgQpHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(3023799007)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IVGv705iVxCPmjTAH68By5D5xzbAlL+xOvF4fmmn5PpCuZE+E7ZqxWo/pZ9Q?=
 =?us-ascii?Q?wyCBCF4AgCJdtCpWHX4CGtMx2LgiAJ2UTaZccDLSJz5TR2a6jn/PiOOSvS78?=
 =?us-ascii?Q?ZJw19k4LjQOoODsHVYRVTwhx8hbhUL9xDHca2gzFyQ+bnb7ElHgu4hmqMmkt?=
 =?us-ascii?Q?+ZDblpM0NJprlfutpxm8K29uSydE0RBmOsrjjIUnhaL6IJTwdBGcktYSxiz3?=
 =?us-ascii?Q?6FCrovcSuYwudLv13FgyMitskNHtS3AzKUwB1fb0y72DZWh1PajI2zZolQCF?=
 =?us-ascii?Q?AmMdeHS7NfqXb/xqSk1xuK+hbMobMVP8lUu1i4R+JYJn/csN0TXb8W8fhWnj?=
 =?us-ascii?Q?pXn4Pi8Lz/k4rKDgzsKu0s6x8ZWcqXNZSTa6RhO1kR2WqEhNfpkQQD9rraoC?=
 =?us-ascii?Q?6Ld7diat96t4tM5B2x5ELf3ajccud61r74E6hfkY/U8fctgrF6cZKgBxxtQq?=
 =?us-ascii?Q?UamHICJYwVWAftkTg2HNhMuSF1LZ4HmoLur8DwagRPmLfUfbcv4e8zt4xbS7?=
 =?us-ascii?Q?JSFuK8CPpBCIVwffDWbUodn3IgbtKTcH3qKCN8ZT8GDTXX1wm8cvAwMoAMlc?=
 =?us-ascii?Q?iYfHNS4D1/iGaHHMBXQV2lFw2SOXU7EJL4gDvmA0BMCIHz2uM19RWajbQbKR?=
 =?us-ascii?Q?0VL1VM5FUf0gmJBQVbZtGatWPILz5zo6Pw8IgclKJrtt3zMkqgo6lw1EY6ip?=
 =?us-ascii?Q?GYqqBmSbBP/pLZh0yyMyKBJRlx7gpYpzzim2axnw6cLHnbwAtWFQYolzE/vQ?=
 =?us-ascii?Q?PPOdcs/iUY6xU0ZTPxUQvZRScHprAXeJe//Xdn0Sq3GAsRbvSMfn73rvIqUj?=
 =?us-ascii?Q?LhlieprJd12EvQSnr9IVlpp1YlVpKerkxuQZs5UhT1zWHQ5NZluUF4zRRL9N?=
 =?us-ascii?Q?x8b8c85rHD+KO21veDUVMwIGiv2JGshfUtBr0mSOYKs7v5W6ZV4OHVioiBp2?=
 =?us-ascii?Q?5R3NNO3T6Zp04edHC980uB061rvYr4wkwNK0YE94b5uNo2G3m2GQpRwDjjdh?=
 =?us-ascii?Q?q5Zncr4KS/C2pMRhZbWM17qLcAhSiKHdMAVMxmGP3ztNkzniSnOnxvaNN0Yh?=
 =?us-ascii?Q?mOL8sNJeYnGJ6kFyZJVCAAaj7P65ji9rnbPlxecB7ddwEUPdMwrSZknmna7k?=
 =?us-ascii?Q?llfCUo2+YbanOfjhEesRiEQiCimTMwSeG/voQgcV3FzCEtP36y/Ta18/FPLm?=
 =?us-ascii?Q?rj22c1RqiQm3bJGp0NB9B9N4VZ6m8WR1+JNpIb0/iSK3niXRNyfVR775dEIg?=
 =?us-ascii?Q?TjQqOCJU1c+SKolkpPb4xrvP9LMYsM/MI7Xn0UbhKiMSgDANnjCO/cRMDJI7?=
 =?us-ascii?Q?EURsX2EhxOoe950plKePR4ZQjo7DzY1bwc8eEhOLV1TBD5NRmVBQNGv8wrWQ?=
 =?us-ascii?Q?vL9Qzrz5jIjNWOzNL3/rf9BJbG2mdnlBKrxiB1ZwT2HngtNmGT/hGxjVDX20?=
 =?us-ascii?Q?gwcrSbc44oZXk1B1rmeY+afjsM6zsYK4QfugtpYKXVYiQs1IW0v7U3jVVtFZ?=
 =?us-ascii?Q?xvHo3LmrUSGxlpO5SGjy9xldGum5sOV5AB57WICQqpDJaLQuagEQvTRZJcUS?=
 =?us-ascii?Q?VNoDGHg1DcpgwX8WNPhFERRjuGhfugkEiNHTuDGD5q9/FBCxukTo9nrffqU0?=
 =?us-ascii?Q?eQezBEdbs3lmAqGVCPQCo2dsLul4uLtoYf04zBx1A4XdrrGbbqjag+WVdSqv?=
 =?us-ascii?Q?OXCvFCXhRQZNVeWs9MZ0knbmWUGLochYQpYvdqCjHDc1uGFFmX+IDNW4nyCC?=
 =?us-ascii?Q?CO2FIoAPzQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: o39TMnUOjQitG2WcxwU6XopxoLhYw0isQRJ9Gg8w0fPrVwHy5dsF/zVl+66RnDD7aK4QtG65nM1Ctb0bbaVQbO+U3murmshLp82/EaHvzgj9hIdBC01ymqSrqZdDRGNB8djWOeffqIMM+xuBL0Jr+QL3u/ZoBqyRHK2rtjgHwezIpPY6ZN2cEnUuLmGkylJ1tKhh9NcQUU4HK5q7H9FEckXMbUs6y9z9rSbi3gAuj70JQKtOpl9ghILEHYLneNABo1sjq0kh2Eds84Jg1wAKO06EKSuwFWk8kGCmFb1EdcVQwVp2lFvX3sjzlPl9x6bJZoBOJNXOLj9++3T7jVPGOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf98f0c-d310-4e8c-2535-08df12a664e6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 21:23:17.8653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlQmzfxotwk/CowUcPgPtbSUAqvjNhr6cGakI6HOeUXIiKjUNPOG8OPxjA0ZJvbNV3E9rEZF8qfM8uCMQac3zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6495
X-OriginatorOrg: intel.com

On Mon, Sep 14, 2026 at 05:16:56PM -0400, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >Sent: Monday, September 14, 2026 12:06 PM
> >To: sashiko-reviews@lists.linux.dev
> >Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-xe@lists.freedesktop.org
> >Subject: Re: [PATCH v8 05/20] platform/x86/intel/pmt: Do not remap when
> >using callbacks
> >
> >On Fri, Sep 11, 2026 at 08:26:14PM +0000, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 2 potential issue(s)
> >to consider:
> >>
> >> New issues:
> >> - [High] `pmt_telem_read32()` does not check for the `read_telem` callback
> >and unconditionally dereferences `ep->base`, which the target patch now
> >leaves as NULL for callback-driven devices.
> >
> >I believe we need to address this...
> 
> Ok.  I did address the mmap issue in another patch set.  Can I do the same here, or do I need to
> fix this as part of this patch set?

yeap, I believe it would be good to have in this patch series before this patch.

> 
> M
> 
> >>
> >> Pre-existing issues:
> >> - [High] The sysfs `mmap` interface (`intel_pmt_mmap`) unconditionally maps
> >physical memory directly to userspace, completely bypassing the `read_telem`
> >callback required for safe hardware access and power management.
> >> --
> >>
> >> commit a61b8465842029c0f2ced5b0fa7ec2cd402fcbfa
> >> Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >>
> >> platform/x86/intel/pmt: Do not remap when using callbacks
> >>
> >> A callback indicates that the parent driver is responsible for accessing
> >> the data area.  Creating a PMT memory remap is redundant.
> >>
> >> If a read_telem callback has been provided, do not create a remap.
> >>
> >> > diff --git a/drivers/platform/x86/intel/pmt/class.c
> >b/drivers/platform/x86/intel/pmt/class.c
> >> > index 402d51df834a6..1c7a372b4fc42 100644
> >> > --- a/drivers/platform/x86/intel/pmt/class.c
> >> > +++ b/drivers/platform/x86/intel/pmt/class.c
> >> [ ... ]
> >> > @@ -403,14 +403,19 @@ static int intel_pmt_dev_register(struct
> >intel_pmt_entry *entry,
> >> >  	if (!entry->size)
> >> >  		return 0;
> >> >
> >> > -	res.start = entry->base_addr;
> >> > -	res.end = res.start + entry->size - 1;
> >> > -	res.flags = IORESOURCE_MEM;
> >> > +	/*
> >> > +	 * The read_telem callback is responsible for this mapping, and may
> >have
> >> > +	 * different requirements for use. If the callback is present do not
> >> > +	 * create the map.
> >> > +	 */
> >> > +	if (!(entry->cb && entry->cb->read_telem)) {
> >> > +		struct resource res = DEFINE_RES_MEM(entry->base_addr,
> >entry->size);
> >> >
> >> > -	entry->base = devm_ioremap_resource(dev, &res);
> >> > -	if (IS_ERR(entry->base)) {
> >> > -		ret = PTR_ERR(entry->base);
> >> > -		goto fail_ioremap;
> >> > +		entry->base = devm_ioremap_resource(dev, &res);
> >> > +		if (IS_ERR(entry->base)) {
> >> > +			ret = PTR_ERR(entry->base);
> >> > +			goto fail_ioremap;
> >> > +		}
> >> >  	}
> >>
> >> [Severity: High]
> >> Since this change leaves entry->base as NULL when a callback is present,
> >> will calling the exported pmt_telem_read32() API on a callback-driven
> >> endpoint result in a NULL pointer dereference?
> >>
> >> In drivers/platform/x86/intel/pmt/telemetry.c:pmt_telem_read32():
> >>     ...
> >>     memcpy_fromio(data, ep->base + offset, NUM_BYTES_DWORD(count));
> >>     ...
> >>
> >> The function unconditionally dereferences ep->base without checking if a
> >> read_telem callback should be used instead.
> >>
> >>
> >> >
> >> >  	sysfs_bin_attr_init(&entry->pmt_bin_attr);
> >>
> >> [Severity: High]
> >> This is a pre-existing issue, but does unconditionally exposing the mmap
> >> handler to userspace allow users to circumvent the hardware state
> >management
> >> that the read_telem callback is meant to provide?
> >>
> >> In drivers/platform/x86/intel/pmt/class.c:intel_pmt_dev_register():
> >>     ...
> >>     entry->pmt_bin_attr.mmap = intel_pmt_mmap;
> >>     ...
> >>
> >> Because intel_pmt_mmap() maps physical memory directly to userspace:
> >>
> >> In drivers/platform/x86/intel/pmt/class.c:intel_pmt_mmap():
> >>     ...
> >>     if (io_remap_pfn_range(vma, vma->vm_start, pfn,
> >>         vsize, vma->vm_page_prot))
> >>     ...
> >>
> >> A user can read from the mapped memory region directly. Could this bypass
> >> locking and power management (like pm_runtime_get_sync), leading to
> >hangs
> >> or Machine Check Exceptions if userspace accesses PCIe MMIO space while
> >the
> >> device is in D3?
> >>
> >> --
> >> Sashiko AI review *
> >https://sashiko.dev/#/patchset/20260911201148.1610547-22-
> >michael.j.ruhl@intel.com?part=5
