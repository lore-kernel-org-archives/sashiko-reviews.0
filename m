Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625DF350A18
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 16:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401991; cv=fail; b=NkSL23NN/JYUd0PSi18VExehZ+m6xC7hOw6QuD8AfWe4SPjf+HVH84SR2D3qof6WLF5ZPX5Q3WNSTnmYCtrALuGGn5twfMxCswcoKImsvPuK5WaLG3NBDPcLkaTx/r0J1l47xmEHmiNrtiNjje5kc1IGFp3bknYedF6akZzv8gQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401991; c=relaxed/simple;
	bh=LrD2zsBWMWDGXMDeVpDxRPnz4hBX2i0wtkAE0A1i6Og=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fUSn0EqICuemtwsftAK3D3u6KM9Bte9bjXAZ5fQTgVnF3zan/S0XQwr0hPRMb7jyXOXPke7VuxDVduUwQGuusg22bgY88DRg3qfGUwEjXzuROEOQ3lvK2NHzTMi362H1j6ZzxC1nwat1Eaxb/lSqiGmUZ/z5QlEq8+/CPQhKLg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fI24q/ir; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fI24q/ir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789401989; x=1820937989;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LrD2zsBWMWDGXMDeVpDxRPnz4hBX2i0wtkAE0A1i6Og=;
  b=fI24q/irvChhM8dBSKJEqM6+vfA/+aHJaOXLudJ6bSi97OsNyedFdHIF
   Ut2x+tpqsxOr/FqjRFICR0uL9VwXtKPmG+xHQtMmNCuuu2MQEKi3wrrg5
   pJAT+fiMPY7VjY/FqSn2oZsRXMp1KWACTDDg5xZtItUfCckRm1E959x4V
   f/aw9Ln9xrufYQ++ERlQ1E3d4XKgN4OErTmq7uKlvD2GQs2nScqgw18BJ
   VWtcex6Oe5qTawPD2IVrw9E2tSbCvfbgHBEv/EvzS5HXyWNasNSjxPbZO
   3ye+sj/l+yLVi7cReUatOZyB4u2Norf2bV5JYERuuD7UTiTu5vHbKkVyh
   g==;
X-CSE-ConnectionGUID: L78t+ZbMRsiNsYrfHY4ODQ==
X-CSE-MsgGUID: QVIjjhK+T/ep03fEp6R9gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77317977"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77317977"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:06:28 -0700
X-CSE-ConnectionGUID: hNTBJl0LTBiSXJ3y8mHrQQ==
X-CSE-MsgGUID: IUxuk8OoSbqVXu4zk67A+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="892432"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:06:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:06:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:06:27 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChWj9BhMyEoUfTjI3QpP7TLAHAe9RA2/5+74+CzM9YjHl/TVD+RhHclyINHy/Ebi1uYRWYgAAo67fReu+fhnDnbpEQdjCw1VZjg1YbFt/3AaRJ5ho11ReR6fqpzwwsZqLbqJfKReOIZH8A/3d/vUYhKOlr23MNZoZz06RlqQAhklZLA0SfXMDFzeapNnoa9wiA2XOo32blF3UQQljk70v6QPk2If6HuVAhFX57S1IU2S6mYB280CHBRJhztDd3tbxy0eGOY6NB4ikgn7RUqcYxrPkWuvYyuB3tFRrfy0Z341A2sypQcs4neYLiI+59D8qRujg7fNJYqgHO+pBV3b9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4/LSbM/vTf78z9XWP7Hs2zxH8gfqEDC22UXE/3jtes=;
 b=CfVkLXj4CC1ZThN9jxoFbcEKJr1T2QhiONErn4xg0WVBVj2jdt+IBAqpE10//dEALz7yy2pSIj2zySTsKSDvRRdatM74DjhOyCTM0drzzRJ/LQ8hJfHgODc/bckDexiWpu96EhDOmAEKITlLeE4KJgEPfTsfwFGo3XZ7E0Dx23wYMT2SlX8ixAdQfXyhkOzGFQpHZTZc0iVjMMHKlKnv8eB3S2AaIHz7iZqlR72hID6+r/7EIEw7x8DuVFw+LRPAc13C/t0R4+SZKbXdTibtsO5nfO7F3gvP5JxSTcDnG0xJpVv80Qq2YIl+AhXgUNq3HcvWKKSRVLdesXtFGwHDTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS0PR11MB7631.namprd11.prod.outlook.com (2603:10b6:8:14e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:06:17 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:06:17 +0000
Date: Mon, 14 Sep 2026 12:06:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 05/20] platform/x86/intel/pmt: Do not remap when using
 callbacks
Message-ID: <aqgbdgS-YL3tW91L@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-27-michael.j.ruhl@intel.com>
 <20260911202614.E8FCE1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911202614.E8FCE1F000FF@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS0PR11MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: d43d5c4d-83f5-480a-339e-08df127a1bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: P6ZX+qyaDh7B9hascXGumr9Yvz17039bx5y74vjSPo4tAcBey2zKF58nVfEN8z3d2JTwR3HyQyoLVx/119bN6ZLvX9Z3Zu9uLCjfr2Gp8ioXyZ/Kd4OIsX8aG3mNQHUg1PRgOd/H+ph9z1b3J0nXYVmbVUVkPuq+4KGeO2xGPqrW42SiqWsjD7j1cv9fZOSZJiTtYGy784Wj6c2tmJX/dsnPIRgdMnTpjSM1WKYwafBGGJkOgOOKI1UEdzUr5SUiQsVBcai9yZG22Zf3khex2eqQnNmuoMRuLURaJngRQnQK/NQmlQ2SpSQmGrwKRNj38JP2t6f/hTQrOiPl8z6rTLM3f45EB65GDddfJuvdPljd3vnMNEDmkkbfxTz9niXl74ph14rEwb58AB9h4EA+V3cMJeOg4VWLFxEFdZPrWEdXLHRc7X39CYAPDNx4r1jqAB3grdiga4PqDwYf+wc6hkCoAoPFRAHa+xK2Ai1ALohMy66O5POelCZzZZKy19WqTKK/MNvmdw+0CT4O9HxcPv2+GPJrIwYFlrq3YRu8gPJyYyO2MIXj1v8S2lIOwZbis3bdCpr+eXe63KNxXmURBmC8bHROWJ4AfKZZbQSOoZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?p51Qa+FtxQ8g1JJx9nvRDbG8hqCsOAmO97lyHorQY/nvEpyqBA9x9X6u9W?=
 =?iso-8859-1?Q?UJFuAggZHWu/Re5oPlAiPyP9PoOwW8P7PHuYjsU3sizHNiHowOgSyRHIzm?=
 =?iso-8859-1?Q?4eDOuJo1b156U9TD2V1PYZx3KoTc/6//SjBvSPk8KingJQnuiV+di5YsWp?=
 =?iso-8859-1?Q?MCncAYntvCWNcQgW4kK3aRHunW6CJoDChhUyLfC14haP9NAaYAoEcy6OHY?=
 =?iso-8859-1?Q?QU+6pQ1LW7z3vbeyuGK7XKx8u3RaToKpL8mo2XRxVzM9xLbpYpsvvo03/T?=
 =?iso-8859-1?Q?nNwYdhd2sTf9a7rdS/OmwZ5kI2zyNrl+ebxWjCPWLumiIsUIQkDSGwREcn?=
 =?iso-8859-1?Q?AnAc4O92fBsjBZmPgV6lHNO/snMeP38iOtj0mAPA7NMEm7UIhxxBob+CBh?=
 =?iso-8859-1?Q?hx8pMuZbWKL50xctJBdeqCrWS2kEcNZolbzkZwseHQtQ9OcvLsIB4uG0n+?=
 =?iso-8859-1?Q?OoltQxmfKhvabY0GY+boxYEgtNOdaamngrIKsjvBSCHuM9xzxlvqnhAH+a?=
 =?iso-8859-1?Q?bf3QiNI/lW4KMCjm8zLgpwTvVrQws+OwcgNaZ2fM4+RX5ZdwctZDOqqiLI?=
 =?iso-8859-1?Q?QK4OdRXiAitT9+vFAPpxD8BWvynDk1G7E8pRuCkIQ2/Qp/80XokArRlvrB?=
 =?iso-8859-1?Q?91blqgqRa62eWPwP3VJi3L8xy/qc/HU0mj7nt2m4gPapzSJwC/dPb09nUD?=
 =?iso-8859-1?Q?l/5EkycZmf9kPDgEety9Vos44p7bSoeVvhMkiEUXBRYlRZMu2pa6AukjJ4?=
 =?iso-8859-1?Q?Osb3chi+uh+dIOj4HNO1dfmXaARvv/YyeFBoByVv3vzG45LoSayevwykcw?=
 =?iso-8859-1?Q?TwlD1n7+m/eNa+TJNnmosap//yzO9xmc7q/ZVWoJcb6s58ctouy4ecUhA7?=
 =?iso-8859-1?Q?u7lMqPomq0hv7gJde2DvoWJ3YSC3WFhzlgIIra856wYnm60+S4ifDJEyc6?=
 =?iso-8859-1?Q?Q5KXWXqTsKDW0vVAJYdoZ71lT71wlHLGFYaT6IvX3H7j1xjNB6j+OL/vXP?=
 =?iso-8859-1?Q?r1DykzrRQ8wGwmRp5hgKriG8K3dqUNU7OFlScPbsrGpAQ04YSPpgGeG+s1?=
 =?iso-8859-1?Q?PYZ/0UAhd5b3J34LNPLSKGKmKBZFUV8GaDAVF/qX37m7IHqFw8BsZ2obKD?=
 =?iso-8859-1?Q?yJd288+pQhy0eQ0kQDsU7qElYfJot25cit57PkQARLaUTrixjIqUZGR5hx?=
 =?iso-8859-1?Q?Ck3Eq2/4o2jVU8WIsx5HfRENH/I+HWtIGotJTTqV1uiWhdsL2VzHFrd4Mz?=
 =?iso-8859-1?Q?Pxwxg4G2RL6IefMuz5rv185T7h4HUz6GsH2Z2ZMngg8EmSgaShshXF7kq/?=
 =?iso-8859-1?Q?chBfhrU4NFQae/rHu2UjhJymfpfNDhFdKBXgdf75XCYFBSN3BuMzj9QkuB?=
 =?iso-8859-1?Q?/mTIWaI1pzEhp6nlUzzpF/uWpf8o4M3bLzOCwp7ch6BMuBLWmihVGcxsKx?=
 =?iso-8859-1?Q?uiP5AkPbbHJCpOgmtwTMJUY7IZhUWzJxT8S4PVQQaco5y1X7kK75kSrsEF?=
 =?iso-8859-1?Q?U3Rmsm0C7lneq2TfnYgTAfvCz0WBVyUhqf1sSfcVWKGph/HHa+aJJPK9YP?=
 =?iso-8859-1?Q?tOETRU4tBdVRs3s093sp9Ty3V31YhBy/r54KMQLyltp4ih+8IhBeKwp2TC?=
 =?iso-8859-1?Q?07yLLK9oXkQeF5w+Y2jdxh5XJYjd3e8gJ97eb35gLWX5cPhoG+cR9fxpJf?=
 =?iso-8859-1?Q?MWlKwMMUhjdNjvn72JqpCGCyd5rgm91+/N/IbFlcSaGdIQN1BEw1ucbo79?=
 =?iso-8859-1?Q?92s6bV488nQ8SVvRXVg3/tOzwjil9CbgSpK3oTiOG4wvgpvgmk7C8gdgCO?=
 =?iso-8859-1?Q?5JoKjUKo9Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: MFKdSEQsU32QP/ALhNiDmqlioLM6nd6nRMxLSdkFwk6FVj7l5t4d1DAEV7XtzWzzHQOo3blJXrPSEmzSGMHfwrWOg1/3Z3zqzdB8oFo9StPP3tmXogQB+Rsl2PZ3FqenDus0jRajpBfEnzeTqkMOCdOL5Nj1EHhUfbkU9Fk2zFY86pwKq4ufeJNYAoamgVptIS/oubsJXIkKu0PAnVquFX6HTrScQOtNfmly/NfqZpBNqDyEzQwbE6GD6nsF/f9vnM6eSmpmS+OIE2cRpNLzduSq6KV6H57EfLnN9197nS2upWLnl2zsgX+giFvTqlbE3M+LqiwFd1Og3ZYO2hDxQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d43d5c4d-83f5-480a-339e-08df127a1bf5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:06:17.6927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTlK61h1buielRPEAHywL0NqBBM4uHil5FqsZl6J7+6/x6PfY1M9Tiv1LeSZ6QK61mH9FW+v2M0QO5fdtPtVGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7631
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 08:26:14PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] `pmt_telem_read32()` does not check for the `read_telem` callback and unconditionally dereferences `ep->base`, which the target patch now leaves as NULL for callback-driven devices.

I believe we need to address this...

> 
> Pre-existing issues:
> - [High] The sysfs `mmap` interface (`intel_pmt_mmap`) unconditionally maps physical memory directly to userspace, completely bypassing the `read_telem` callback required for safe hardware access and power management.
> --
> 
> commit a61b8465842029c0f2ced5b0fa7ec2cd402fcbfa
> Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
> 
> platform/x86/intel/pmt: Do not remap when using callbacks
> 
> A callback indicates that the parent driver is responsible for accessing
> the data area.  Creating a PMT memory remap is redundant.
> 
> If a read_telem callback has been provided, do not create a remap.
> 
> > diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> > index 402d51df834a6..1c7a372b4fc42 100644
> > --- a/drivers/platform/x86/intel/pmt/class.c
> > +++ b/drivers/platform/x86/intel/pmt/class.c
> [ ... ]
> > @@ -403,14 +403,19 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
> >  	if (!entry->size)
> >  		return 0;
> >  
> > -	res.start = entry->base_addr;
> > -	res.end = res.start + entry->size - 1;
> > -	res.flags = IORESOURCE_MEM;
> > +	/*
> > +	 * The read_telem callback is responsible for this mapping, and may have
> > +	 * different requirements for use. If the callback is present do not
> > +	 * create the map.
> > +	 */
> > +	if (!(entry->cb && entry->cb->read_telem)) {
> > +		struct resource res = DEFINE_RES_MEM(entry->base_addr, entry->size);
> >  
> > -	entry->base = devm_ioremap_resource(dev, &res);
> > -	if (IS_ERR(entry->base)) {
> > -		ret = PTR_ERR(entry->base);
> > -		goto fail_ioremap;
> > +		entry->base = devm_ioremap_resource(dev, &res);
> > +		if (IS_ERR(entry->base)) {
> > +			ret = PTR_ERR(entry->base);
> > +			goto fail_ioremap;
> > +		}
> >  	}
> 
> [Severity: High]
> Since this change leaves entry->base as NULL when a callback is present,
> will calling the exported pmt_telem_read32() API on a callback-driven
> endpoint result in a NULL pointer dereference?
> 
> In drivers/platform/x86/intel/pmt/telemetry.c:pmt_telem_read32():
>     ...
>     memcpy_fromio(data, ep->base + offset, NUM_BYTES_DWORD(count));
>     ...
> 
> The function unconditionally dereferences ep->base without checking if a
> read_telem callback should be used instead.
> 
> 
> >  
> >  	sysfs_bin_attr_init(&entry->pmt_bin_attr);
> 
> [Severity: High]
> This is a pre-existing issue, but does unconditionally exposing the mmap
> handler to userspace allow users to circumvent the hardware state management
> that the read_telem callback is meant to provide?
> 
> In drivers/platform/x86/intel/pmt/class.c:intel_pmt_dev_register():
>     ...
>     entry->pmt_bin_attr.mmap = intel_pmt_mmap;
>     ...
> 
> Because intel_pmt_mmap() maps physical memory directly to userspace:
> 
> In drivers/platform/x86/intel/pmt/class.c:intel_pmt_mmap():
>     ...
>     if (io_remap_pfn_range(vma, vma->vm_start, pfn,
>         vsize, vma->vm_page_prot))
>     ...
> 
> A user can read from the mapped memory region directly. Could this bypass
> locking and power management (like pm_runtime_get_sync), leading to hangs
> or Machine Check Exceptions if userspace accesses PCIe MMIO space while the
> device is in D3?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260911201148.1610547-22-michael.j.ruhl@intel.com?part=5
