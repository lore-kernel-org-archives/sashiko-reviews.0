Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978592DC792
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787598134; cv=fail; b=a3JYQJl41XFgkqhDdNjE0y7h1zZOifQg7hbaJXdpBh6RalbCCONHWAIw1sVdfrCYK5c5HYWOwzKbGOnD2lvl/ihrZirK5wj9fb4Eopv6lgLzlS3oFlMQ/VseGIwEj/seOeVnEbzl0dig98E7BNvdX4qVqGx+avUnYCBd3OxnDc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787598134; c=relaxed/simple;
	bh=jFY8GBX9RB1bhr0IngJunC3x3rdWVOHp/eBuv5sDzvQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y2qedku0nNuHlYdQXG75/EFr3Aiwga6nedb5DVl6Xlj07T+C0L4aaSS4p7xjZIc82qHa9uh0aIgiHizZEgbxteRISHnyjGBpJRfLgaA/7KukXTxPqyRNfha3F6Obqp9dqcBEG41z0EPM61EAK2TYcHkLxEbUK0INYIhFNG/88oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJkknkUX; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJkknkUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787598132; x=1819134132;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jFY8GBX9RB1bhr0IngJunC3x3rdWVOHp/eBuv5sDzvQ=;
  b=iJkknkUXuNHkJaB5La6DqTy2KIo80FaafKsTDoSgt3PXhcoDdlZASGNB
   I7A28qSlanPkAXlQa3iUuxlYcdfsbcs8iuEFuj2ukTMYtNegygj6c3LQb
   CoWaaFCqsb5n36ruphqWCuW8F9S/oYyXYgc7KQZ/5r2dBkjMy273Ga8HZ
   6+SO08K0Gw6Ju+LkzevpuDMa8pee8wKUtWDhBY8P901blvVE2vemMzAqg
   TIvr+QKdXmkCPClEDAzBw/xBvDDwkc39VeaOV/vwTVp8mNLOfbVlXtOwn
   kWdhzCAK8hbBALWSZ2vaWz3nBF5KdeN6fzUMSfo0Adkzwu/we4NvXd78n
   A==;
X-CSE-ConnectionGUID: ne17P3F0TMqvbDuNdCF/FA==
X-CSE-MsgGUID: IdyujeKcTaqPOOZ3sWCJMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87008471"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="87008471"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:02:11 -0700
X-CSE-ConnectionGUID: BUiwfchFRjqLKMAnsTk6GQ==
X-CSE-MsgGUID: Jnp8A7RpTKC1apYP1FamPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="270864862"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:02:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:02:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 12:02:10 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:02:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0AQ1n2hIuNmCGo/odX41mfOoduz8ppoajfLhQdfso3+cEn3oC9refnJ1WsrpxWbGf/NmNME0HBe4afgKkmuPRK8wLZPbo/H247VNOO4roHFU5umXayytCCxqm7sid7y3oNe2DDI3AmJc7HOuP1FUm60I7aC0368PiAy8jgWGEwOaLJW0drAYfuENPFM/rM3ftT1JW2KYnlmJuakqehwGWq9TW+F3lK6Z20I/e1oihk6U2MpE/iKMYJ8k8T0t52B58bDDxdEA5uX2TXFogZHKL5Or/nW9znkDYa+Nlhl5wd1S3KbpCW0/FnuzZ63/ygloqq0eqm7uChbW1W8W/t66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22K63KsBcWPmiI20JfeYlM3BbMx+zHmVCVBlnN/oshY=;
 b=ssv/DkHJz5lX/+1RlHIeKaDHd4Hnzdjuu466RMeWsuIyucEPRvato/sAgjb71v/GxbBwlf7tk01SSPBy5V+OkgBmx/7Tte0tSiIBjnbpIGgx1tXS3448JJeTWPwcpwrY3726gCLUMyxsK/TqmlDzeSAhAoOfn5AR1FLB+5/aCGftAVsjtl4FzF3NU2FgA0Tl48Mrgg0tufu3wexxw3twCxWahvDczincsal+eeI6pb29g5QBsBcHGiIYErFxVWTu6aDnN89I1x+TzTc+BeUyGCW1v8CDe8uELK+1q7wJwpb/R+sWsjn9TNRDVfEFFVdLjbyxVHhHdkKxMBLhwrEbUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by DS4PPFCE18D981F.namprd11.prod.outlook.com (2603:10b6:f:fc02::50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 19:02:01 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 19:02:00 +0000
Date: Mon, 24 Aug 2026 15:01:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 03/10] drm/xe/vsec: Protect against missing config
Message-ID: <aoyVJBGaYkMEImpr@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-15-michael.j.ruhl@intel.com>
 <20260824163635.C03301F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824163635.C03301F00A3A@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR05CA0153.namprd05.prod.outlook.com
 (2603:10b6:a03:339::8) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|DS4PPFCE18D981F:EE_
X-MS-Office365-Filtering-Correlation-Id: 30897488-c680-420d-a413-08df02122d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|4143699003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: H1G9sDjIuXnEehP4o9KM6UBxVYJfKGSt4QDYl9xAkjOS+Z/6vfvM949Dz8O590iFiJsNgiqnpWwuySHRDTJHWaJ5vG9gLUtuxKHQDJp409Gct+xfESoIYa3DscjCfwnL+0A7bKbBqlA+aHVHqrajAlioz8m6EydGKyPddNZ0DNcaTCpKWzwdUraWaYvA4wTFxFrJvrIemkjaEZCEjmgtOKGN+7oCRDoZdVM1xZT8qdz5DEettFOKb8FKVSCY17LHZayozj++xiA3EqBVMKGntygG7TgoQmN+iFUcY8LehBtdnCqd+F9TN6OXa368+zdTlAblSygLImC1CapAnesluNF+JvzAddKjJ6nHhcNTBJGQoFVWpF0dKt3Gt5oPfIrYJj+HQdnTrAgGsJj6A66LheFaeTWOss1BJoYg428goFuX/t2rro+0Kt4AC0aE18eBWAg7i4sQrIvnUETQaulySbYV6hj21NDTV41xmNPPxcAOmihmMOzY1DAukfXlxWtBI9n2EJwUr+N+YiQC7H3dMZ76wkCRUfsVHnrfidgXJyKk1i3aIk693ptkWCl3KFrhpzP/wlwsGyFbuJihPF0byK8U2atwNAuXtCiRJ6OqfMs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7752.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FP0YzTM3bhDI6rUhE/zQ9Usq+8X5pJhCGa8v8jc7zp/uuFrgxjc73SmySY?=
 =?iso-8859-1?Q?WECRTL0KokKaJ5ueKr6xbQ3UM1A4RvLhNsyKk4PjleCtdAlfNUucFTFgrh?=
 =?iso-8859-1?Q?6ZGaRIwmZAleb9cigwOWKcpjXo0FvfuHqny/as/69JPMcApw8EvTlpcUeb?=
 =?iso-8859-1?Q?HdER0THaNRza6LbWhTYqMKMEWflfuJV2dzqSX9OBJ/v92GJQL071RUz33X?=
 =?iso-8859-1?Q?HCXZwkZwa5n4u34J6xPlD8X7rwMm3N1+5pPHY9lSY3k8HUDZSgbKHTt4yt?=
 =?iso-8859-1?Q?bCzHRtbut7A8nROE/6xlKH5efw7WoBa7hbmuwZoOV/a0Ou5lVdWqjYMCKX?=
 =?iso-8859-1?Q?KZB20CsC3BD8KHKby/nOpB+EfIE/JD6INQHClmCE6zT6hF/CdNAhPc9xOo?=
 =?iso-8859-1?Q?WErqtkfBOVI9DOy1nuqMOxXOCLPLhXUXSH23NvHIoUbFnazfekQLPAXJQe?=
 =?iso-8859-1?Q?RBoHKzdGutfe5SeiT3pibWWT0J66GV2UCkSoXCooVsEi4F+ECbgBCvTG48?=
 =?iso-8859-1?Q?xgZgkp92E7aHPuOUJkBB7dPbPKuZWEX4HCWifrInlM6Ih92rJGG2HdtIRA?=
 =?iso-8859-1?Q?Y1Grm4Og8plPEFF3dvhnSq6Q8JYVUfvTIxzsIBgRJ1c+IUOVbpBm1x7QdN?=
 =?iso-8859-1?Q?1kvDCMy2DrmSz3vdF8XKkXQVgENx8YaQhCP+zk0BvgnQtlG3VCCLyF/xYj?=
 =?iso-8859-1?Q?AAuD4V5TQU0Xqg38pIwOLtc8Z3/Xd4iUlRHA2boPyifBjRRm+76J4J5y77?=
 =?iso-8859-1?Q?OP5MUJqXZg/t535eqbrVFHnnBKz8vuanEAnLesGMwSi6dtoUgu67fyzYfb?=
 =?iso-8859-1?Q?qN6hcX/v5/vq6osyqYmsLx3Sx5vp4bB13cfwbbOHuogVYUrA1Jw8MpV9j0?=
 =?iso-8859-1?Q?PYo0UoO3AjBIznpsUwK+r/6dY5saTEKT5SDXl/xUkO7x+70d4rEGPDI6qd?=
 =?iso-8859-1?Q?Od4v8IheOP3syWYC4FbIjwoqYdESmBQ9JJQAKOzinCK6IJnjAKI8ZcwJ5D?=
 =?iso-8859-1?Q?vzjdKbKqB5xanMMVP9NJrlHDCRTGL9hfzdpwncNA3KPYlkw/Sdi2OoShVV?=
 =?iso-8859-1?Q?tfXBBdtONzfo4zyOwEtfS2NEaFv50yqC1p28y2wpLyntS0kE97sSqbPrM3?=
 =?iso-8859-1?Q?ZXJ0ZCBkBS2DL2lNWWlcG0dz7KuL9kYob79Y5cm4E6CGCEnTCcUo4ZFY3e?=
 =?iso-8859-1?Q?8xnyD1HREEVlTORkRYs7gY+yL4WgQOY3shFAnAuVnf5iQKbG9YFLcrAR/R?=
 =?iso-8859-1?Q?xPLqSOe+eF9mZ6oULuQWI9vKJqPDCCi0oWhmo1Zf9ZJt1vlHM2K+NYntEa?=
 =?iso-8859-1?Q?oEMN2mk1mLC/EQf3dSEC0wetdYaBrSxOh/JcM5SWN47K06SHXBBQ5vdZy7?=
 =?iso-8859-1?Q?XQZhilhs9LaL/EcCUmc4cLsaXov8e+t5aoV3Hffip9HoC0ZVgHeb3AB1K7?=
 =?iso-8859-1?Q?z0WziSXuQTtc5k+oRnxbLATOIUtj9y9cYi4K84bw7z6zcbmtP0qHluUle2?=
 =?iso-8859-1?Q?YtImxQa6dGpYjuqg5l6b/lYDvY9lOaWWW+DBtgn5j0zwAnVBbwIX0XlRcj?=
 =?iso-8859-1?Q?nb11Gn1J0N+kQ8RLczLmdeprs5y64XYSc0Cb3cGGFYVfjos59Py1kOlhkF?=
 =?iso-8859-1?Q?A/cqcrSEMB4ovrc8bwmJvpSjtE1rIZqjUARIDvsebmIrJAjBSuBxyibdH5?=
 =?iso-8859-1?Q?FJLDFn1kV4VT/tVJKW1TktYO75N3fhreEE157gjuuzMhE4HUfetDZHN9PN?=
 =?iso-8859-1?Q?QA3nCDAJxJbiS2HAz5g7bdX3fyg1TIED22oh/M5IxMv2L3Jja2SNIYcgW7?=
 =?iso-8859-1?Q?Gv2bk5m6mg=3D=3D?=
X-Exchange-RoutingPolicyChecked: v/LlDYZG2XKQvqZpghSkFQo5XWP517vCKDHq5obxfaFolM2hJPK4Q3xInf3aeuALrXOjOgoA0h6YPkE9OTtUVQ6vtG32xs9LSOYgpXUq691DU5jhnu8bSiC4FbRfGEA6dCxxx3B5mLNnXcFOCSQgEJED9JyGxLhlxiLX0yVd4qVwRhjLMOYzXpYxG+9dYMLNa9RYA85/PXur8xrvrqEJa9Yw0Qf03OF5f8fC0yMrT/qpTPHOd4FYNFjSKTmCD5cJ34VlVcRsXRHvLofuC3qEhProY8NwXyt04TcyIBvLySCwDP27Wd8rEjSdIj/kB48BbE6vdH7n89UxB/y8D9NTVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30897488-c680-420d-a413-08df02122d12
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 19:02:00.0718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9Ii1ub+CCSHmdRB4PSwIxMSp+f9KdQDPvZIBk8j7Lz/jU4SZi0N1zQcsgshU31trpWqD9sXZdAHhP3jslT6wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCE18D981F
X-OriginatorOrg: intel.com

On Mon, Aug 24, 2026 at 04:36:35PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Subsystem guidelines violation: The patch uses the absence of `soc_remapper.set_telem_region` as a proxy check to prevent execution on Virtual Functions (VF) instead of an explicit `IS_SRIOV_VF()` guard.

Sashiko has a point here.

If the goal is to check for VF as commit message states, the IS_SRIOV_VF is the
right check.

If we need to really ensure the set_telem_region is there we need to add
a function in the xe_soc_remmaper component, rather than traversing the
component and checking it internals, what is a xe component violation.

Please create a helper with a better commit message or use the IS_SRIOV_VF
macro.

> 
> Pre-existing issues:
> - [High] The `xe_pmt_cb` struct is missing the `.read_reg` and `.write_reg` callbacks required for safe PMT Crashlog control register access on discrete GPUs.
> --
> 
> --- Patch [3]: [PATCH v3 03/10] drm/xe/vsec: Protect against missing config ---
> commit 6d90522f74020b6e17f1f98588ed1740977adfb4
> Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
> 
> drm/xe/vsec: Protect against missing config
> 
> This commit prevents PMT registration and telemetry read access when the
> soc-remapper callbacks are not configured, specifically targeting Virtual
> Function (VF) init paths.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> > --- a/drivers/gpu/drm/xe/xe_vsec.c
> > +++ b/drivers/gpu/drm/xe/xe_vsec.c
> [ ... ]
> > @@ -210,6 +210,8 @@ void xe_vsec_init(struct xe_device *xe)
> >  
> >  	switch (platform) {
> >  	case XE_VSEC_BMG:
> > +		if (!xe->soc_remapper.set_telem_region)
> > +			return;
> 
> [Severity: Medium]
> The commit message mentions that some init paths (VF) will not provide
> soc-remapper callbacks. Is it safe to use this feature presence as a proxy
> check to prevent execution on Virtual Functions?
> 
> According to the SR-IOV guidelines for the xe driver, VFs must be explicitly
> blocked from PF-only resource registration using an IS_SRIOV_VF() guard to
> prevent hardware failures and MMIO timeouts.
> 
> Should this code explicitly check for the VF context instead of relying on
> the absence of the set_telem_region callback?
> 
> >  		info->priv_data = &xe_pmt_cb;
> 
> [Severity: High]
> This is a pre-existing issue, but does assigning xe_pmt_cb here expose us to
> unprotected MMIO accesses during suspend?
> 
> Since BMG exposes VSEC_CAP_CRASHLOG in xe_vsec_info, the crashlog driver
> will probe and create sysfs entries. However, the xe_pmt_cb structure lacks
> the .read_reg and .write_reg callbacks.
> 
> When userspace accesses crashlog sysfs attributes, the driver will fall back
> to using direct readl()/writel() on entry->disc_table.
> 
> If the GPU is in D3cold, will these direct accesses bypass runtime PM checks
> and attempt to read or write powered-off MMIO, potentially triggering MCE or
> AER kernel panics?
> 
> >  		break;
> >  	default:
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260824162317.2450380-12-michael.j.ruhl@intel.com?part=3
