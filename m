Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21434443A84
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 23:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390526; cv=fail; b=ZNaI2TAyQTx0xXNJ3R20St1bN3F6wo3AcMVbdb3+T7U3oinMJaNBdaFw6Qv1+mckDXWFwYNwecQfgtqg1S+gFC/RxEXge9m+MUmUPDNxZVtU9ITu/57FKyHQKk/YBK5EGrBnZIjQb/PvYC6dUyp1o44Lk5/rrDznZCjA/QXtt6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390526; c=relaxed/simple;
	bh=npgIJ6oyrN6CVksfSUqSywJ37IXWHupQNmZZWRjsL20=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fhTv9xItBU6QkvMSLX5FEMcAUuPZvKpuLKt72zF+bgZaM3G9rvIFRFPXYjnvEpRFh9fCwnldOeijFUBFlrCHJytsga+0OrMpu+haT4a9+yfRUxMBgFsulWlm4K5Kr05ZZiFY2Ww1Ei8abtnLFIB12cN78NZ9MGpdGjXVpWaPtLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OqwjJisF; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OqwjJisF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788390523; x=1819926523;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=npgIJ6oyrN6CVksfSUqSywJ37IXWHupQNmZZWRjsL20=;
  b=OqwjJisF+X3DknsOmYPNCn0zIo6m58Lh+6Ukb3aWRC6A9aaY/KltLEx+
   NqMgenhu202y5m5kb1cTAVFj63HkH385Tk1iqbtnFU2iHV6CDkDA7ATLm
   e+c6yZMxwgCBBrmW40ZJadtwZz2bA1HGLayrV71BKSOHmHocaVcwLKXRz
   n9sALcTtDlYsRs5nd52dpBWSBIzpB2Evzv+pZ7GzfjFomWmO4pT06nfgX
   yRUSco1y2epHhZhs1r3pea7OFvQDGEZfoqC+ZGG07lNJAfgMu589B9F69
   bc+T+RoqMsDpcIBxvPVTG6PQn3aSO7cr3KCHyJFej0FJFnzMvnrYGSssG
   Q==;
X-CSE-ConnectionGUID: gBFbCfobQAyu+FH5QeR/IA==
X-CSE-MsgGUID: BSiBuH0QQ9aSunnTTGYctA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88913373"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88913373"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 16:08:43 -0700
X-CSE-ConnectionGUID: vqymdqAcTsOvB76bVjSQoA==
X-CSE-MsgGUID: aSoaWE08TNCbEK0GuJ60VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="299419647"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 16:08:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 16:08:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 16:08:42 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 16:08:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSCjAvx5UHimWuoOgujzwpT0D/1gWhXeDohv2x266l065r9JPEGxsaW3PXJPPRQRVCHMF3GIL8kLDcb1ext0QOcMSLijayFM/GRJs8tibKC9XE572FJZ+/8qMUua9+XP2B2PHjDgcyeemPOnf5fIbqBSraH9ms+tyusRdRm9X4cwzl7jQJWUb+YQqy09j40RVVxzxqSaQGHDMbyJq+cPiA96H7oqyQyknPigFkdiECLKpTJrJJ3Bb36DtjBEPwzXCLqfuEVyR+oADagydbvMEcPRVwePGBWK+ab6EvxXIfgwXiH3piaG+TVnnTRBqkfJ21gAeB+ogmATl1yIlewRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nd7wueKIk/7aLG5Sr4kbJkOXRQp68OQTzzz320TzgOg=;
 b=SWUrgZqd0toWcrsh6aQSavOMQ++IxUNiGJSmOiJP+r2WciFnMxQWmZCRLu/mbQJXHIzcyi7QQK3C6ZfCKl22kEWviK788qEDq2S0WWrAbGnzhMLEO8fuEDWPV1bgG49m0hHWlqNlM4VZFPqz6dWT1JqjTI8+Cm7a+u2pwip22Nyp295Hc7IY/epPaA2uZ5Y9Gm4UgsOdKprUO6sNRziTy3JTj0WG0qVMGIJx5Q555Z30zeZ2ib90+iWm+y+JRi/oegPACNSmxYC5OQT6E2Sug2CAxb3wHt5SjtzG9Ni7g41To63M9TY+E824M4SuG1bGBf/S13uu2Kw6/LKPuETwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6406.namprd11.prod.outlook.com (2603:10b6:8:8b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 23:08:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 23:08:31 +0000
Date: Wed, 2 Sep 2026 16:08:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V20 13/15] drm/xe: Expose bad VRAM pages via debugfs
Message-ID: <apisbIWTIypXZJAM@gsse-cloud1.jf.intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-30-tejas.upadhyay@intel.com>
 <20260902165659.F104D1F000E9@smtp.kernel.org>
 <DS0PR11MB8718649F24B45B53641BB69D81B72@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB8718649F24B45B53641BB69D81B72@DS0PR11MB8718.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:303:2b::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 614c4387-e236-431e-0606-08df09471ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|3023799007|6133799003|22082099003|11063799006|56012099006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: HILV7mVqma03fkKqONb+pMcOAK9XFiVSrUbPhEFjrF9DBEWTYgtIp2kDtDcy0WX/lDht/UuJRigp+WazzJ4Thr5PRNW3ueFYmB1Soc4nDD0r08wKbm59/sU5gNc7UW205sz/EQUNejrUoSVa3SldI9q93n5isHjbW7CyF1k1mmQcjS8At2d7y60sVd/ttNhUitRTW7y9O/QiQfs7F8Js0ziBIwvxxmhGS/gNJTxStcE3ZA42LSXj0AgtAr7OAmi2lhN5mWxtzQn4iWS8jGbxG9mu1VYqB34F+pDwZQmqUwiWfxmBHXa6ydYrMhJkzIarfzpE9ItTTRFEokLH/R4hpj+Qktgo/4H2FInMW6ChN/VAlLot0E35/13JnMH1tiHhtuqfYjr/hNoilXyP9UD+fvUEb4F7EHBc2UASafZB9Pi6uWLf5mc4mdiXAWRqDv7OkpUVlmOMuNPxDvLQvrhYTfcfhQvBUwz8tFJIQgKNBQ/ITELUsmHKE37zAA0Lsjn3EiYGqXx+L5naInrSxrJxtsF1sA3kDdxfXQORJhamK1sFhcvEp/p7USF5khmF9F6iAtk0RwtuEA5BZptET3esI40GwQ+TW+DBDNYpkE3KTVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(3023799007)(6133799003)(22082099003)(11063799006)(56012099006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CBohGtVh5ZNXOJZ98KxsjPu5nGIJw/jhUCEW/Ng+Uc0yx96aACWvUnCAet?=
 =?iso-8859-1?Q?LkLiCEPIa4ezQALDa06XenIov9Q4nU6mL5WlUmDpuJhoN48iMv7pao4zoB?=
 =?iso-8859-1?Q?zhZbV2/y+VRLW81SSxXCsuVFErxI73qnbvgt31Bzg2eY27ubLZtkJDvxgE?=
 =?iso-8859-1?Q?1UFZBbypa8oDkN2HqfvSbHfO1rR/VV6+u1ZCYIO4OMhXVvfpXf9ZO2W3TV?=
 =?iso-8859-1?Q?ya2Hta/luZt2Jtoxw+aAGA8P/T9/p2jCzQA8SGV1JII+Q6rMPd2ShgKgJl?=
 =?iso-8859-1?Q?oxvDtKpGi22PKrF9sv1WdbT3WUQ509v/OprG1CkhbgR4kOLk7zhnoH8zIK?=
 =?iso-8859-1?Q?9KCIUuwu7+WkL8dDTw78wDs8bHvFX/DPRH6XNMKlMLQziNlVBxL5pwNxtf?=
 =?iso-8859-1?Q?XLHvy/rSl1abcu1wXhL3vsCvi8m5AEgQdTYgOO+H7t5Dfrkfw70f6f/25S?=
 =?iso-8859-1?Q?J+6I6hbDiRS/hFIVVcKVvkk/KxEo042nn81JCAo0jVhj9WqSpTtvLQ3jl1?=
 =?iso-8859-1?Q?VyFtH7Jrldrv3wESmvr87uNihBKz4puyHoqT/ewMiJPhtilgRPSB7bKyyF?=
 =?iso-8859-1?Q?fsGqFHsw2amaiDfeYgJoPcbWUNKnDxNZQ7UV1af7SCZtYFS7o1fw4AkgS1?=
 =?iso-8859-1?Q?dPKks3k6ymnMbMqmr31e3daXdR0SatdjFiMdaS48kanjQWRUehuvuV7RqG?=
 =?iso-8859-1?Q?aEZCiW3nRTNgy9o1+Ogk/jfPOhtFZZn85vlcgl13TgRNrJSVDsdRhCyHa9?=
 =?iso-8859-1?Q?PqtYbkntOs+2xjTPc4UXCo+dggkDfONeVMNjYnq/qjn9N+knP76vc4hdC0?=
 =?iso-8859-1?Q?dYn+gcLc5/y3RrUA+957wanj4wOOzRcRUkd9b/7ND/7HYVcVhH/RIcZy5l?=
 =?iso-8859-1?Q?pRQRVTJpJYA/b2ME9c2gZ/rXpvmzrnPEUiLukXMNeKYfdbYbETM7BiWag5?=
 =?iso-8859-1?Q?6hZ2HooVhQAMlr7Bhic2f/QJ2wI805x080lutWoV7IqwBL4fsUlYihx3WG?=
 =?iso-8859-1?Q?tQSJb8iKq3KEV5MpieATUmV5PukQ2GlX+oJHHUDwMGgaRN1Lj58Nq2oodF?=
 =?iso-8859-1?Q?4QUSrIFbK2IX6iM10+eDpWCvZMyo64g9+Dl8QD9VO95dJI513sSNt2RQIk?=
 =?iso-8859-1?Q?OuGG5V8GN4cbQPrV8bCGsSdXbYB4BvRUFPD7o1tGxZ6H0fCSJD5CL5iDi3?=
 =?iso-8859-1?Q?GGUJpdsNwjmHZ4+XMFUqMh1FZVwC/pbf30kiQPNCZnzHxcFP1TNSXUuVPw?=
 =?iso-8859-1?Q?ERJV3EJAh3mJCZqdbVyMsOzPd7mHgm9NwQ/fqAtszAL3j6vldeiM2lvP3E?=
 =?iso-8859-1?Q?7h2d3uECPw7+Oh1MezxA5Ee2+VcuRLPkjlPTQFCa5BQk2FrDsGCu5T60T/?=
 =?iso-8859-1?Q?K7AqsZ4CHM2q3HZNC0AWqtDQgdncy/ueE7WOG+T84QLCCCtTXpcZYV0UrH?=
 =?iso-8859-1?Q?hhcw9RmfaecjAdhwvNj8ie0XbNiJ5DCetwV3B841tHdsNgFeQEmMje4eat?=
 =?iso-8859-1?Q?kwwCUg+Rdbq6zs9sEONp+TRYcLZVMeNTMTSk6Ae9GXMQ3glhEwWuMBda7+?=
 =?iso-8859-1?Q?+89S/3MkiiUMCZprbRoLsCBrKSkJ9NPm+vwM/7FjtKzNBJEKxHp5pWQp5z?=
 =?iso-8859-1?Q?CaJEIIm7Cz+ujgqtlqLmcfKr0TN15h75cI0fSeiJ4FbpiUZCzVWb53Pbhy?=
 =?iso-8859-1?Q?IDF7RYN6P/kQ4DbuuB2GiNpNCozZEkHBmTA9dhOlYQc9dt2sb0oN40xdq8?=
 =?iso-8859-1?Q?C0qRKI/T8LX55pnPUDBxfNDzq5Z/0Iv5vatP8/OhGRDqIU+yG91U7HozzG?=
 =?iso-8859-1?Q?TW2Sb9Twiho3nc1rcRoZ7daYMWLns7c=3D?=
X-Exchange-RoutingPolicyChecked: dWBNHmwHb/xBq2zPJPExVgbUMvggLO+OyKQrlmqTrEGi1ZbTIiG1XYk9lFy2Ohsesrw9rX9EM7UiHNw3CsJUzP+M0uCtvZU857Qtmw1Jl3D/lZ9gjM8qXEML436245Jv9prUe13awwvBJ6VmOz+1+LFPOuO3U014OsIymvg1DL4KJeQTvpnU7+B85AeEdC5YtXhyQxShztjDRyf2mKccndUa5DMXS6q+7PgjMqxebQW1BT5EpCz8QpDy3Z4yKiUjgLeFrpDG/eV+atev4hAHZJ8UwodWm98D7QnpE34osDq7KOltCzoAHCo7rprh8UhFR/EqgP8HEPJqj61xzxFCcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 614c4387-e236-431e-0606-08df09471ae8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 23:08:31.1202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +O3sdc8dRpC6TSZgub6rLGme7BJAd7mNlvAk+mq0yjXKD3R4yjJ0B4vQjpTeOReLPRuxbiSIVjbZYl6/lJ21Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6406
X-OriginatorOrg: intel.com

On Wed, Sep 02, 2026 at 06:00:03PM +0000, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> > Sent: 02 September 2026 22:27
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH V20 13/15] drm/xe: Expose bad VRAM pages via debugfs
> > 
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s)
> > to consider:
> > - [Low] Debugfs output computes GPU VRAM page frame numbers and sizes
> > using host CPU macros (PAGE_SHIFT and PAGE_SIZE), causing silent truncation
> > and incorrect reporting on architectures with non-4K CPU pages.
> > - [Low] The VRAM max_pages limit is printed globally using only tile 0's
> > manager, ignoring limits of other tiles on multi-tile devices.
> > --
> > 
> > commit c12841d073a619e5edeb8c8306adf6fd03042edd
> > Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > 
> > drm/xe: Expose bad VRAM pages via debugfs
> > 
> > This commit adds a debugfs file to show offlined and queued VRAM pages
> > across all tiles, displaying the page frame number, GPU page size, and status
> > flag.
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > index 00569c5279a83..d9da2454d968e 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > 
> > [ ... ]
> > 
> > > @@ -917,3 +918,61 @@ int xe_ttm_vram_handle_addr_fault(struct
> > xe_device *xe, u64 addr)
> > >  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base,
> > > vram_mgr, mm);  }  EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> > > +
> > > +static int vram_bad_pages_show(struct seq_file *m, void *unused) {
> > > +	struct xe_device *xe = m->private;
> > > +	struct xe_ttm_vram_offline_resource *pos;
> > > +	struct ttm_resource_manager *man;
> > > +	struct xe_ttm_vram_mgr *mgr;
> > > +	struct xe_tile *tile;
> > > +	u8 id;
> > > +
> > > +	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
> > > +	if (man)
> > > +		/* TODO Hook with RAS to show max_pages fetched from FW
> > */
> > > +		seq_printf(m, "max_pages: %d\n",
> > > +			   to_xe_ttm_vram_mgr(man)->max_pages);
> > 
> > [Severity: Low]
> > Does this correctly represent the limit for multi-tile devices?
> > 
> > By querying only the manager for XE_PL_VRAM0, it seems the max_pages
> > value is printed as a global limit, which might ignore independent offline queue
> > limits configured on subsequent tiles.
> 
> This will come from RAS post integration with RAS and it will be same for all tile.
> 
> > 
> > > +
> > > +	for_each_tile(tile, xe, id) {
> > > +		struct xe_vram_region *vr = tile->mem.vram;
> > > +
> > > +		man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0 + id);
> > > +		if (!man || !vr)
> > > +			continue;
> > > +		mgr = to_xe_ttm_vram_mgr(man);
> > > +
> > > +		rcu_read_lock();
> > > +
> > > +		list_for_each_entry_rcu(pos, &mgr->offlined_pages,
> > offlined_link) {
> > > +			u64 pfn;
> > > +
> > > +			pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> > > +			seq_printf(m, "0x%016llx : 0x%016lx : R\n", pfn,
> > PAGE_SIZE);
> > 
> > [Severity: Low]
> > Can this cause incorrect PFN calculation and page size reporting on
> > architectures with a non-4K CPU page size?
> > 
> > Using the host CPU macros PAGE_SHIFT and PAGE_SIZE to compute GPU
> > VRAM addresses couples the hardware memory topology to host CPU page
> > boundaries.
> > On a system with 64K CPU pages, shifting the 4K-aligned GPU address by 16
> > truncates the lower 4 bits of the GPU PFN, and reports 64K as the VRAM page
> > size instead of 4K.
> 
> We have 4K aligned pages everywhere so for CRI it covers alright.
> 

I think you use SZ_4K in a bunch of places in this series where you
actually want PAGE_SIZE.

xe_ttm_vram_mgr_init uses PAGE_SIZE no SZ_4K, in practice these are
value but using PAGE_SIZE is correct for future proofing or possibly
allowing non-x86 CPUs to plug into a dGPU.

Matt

> Tejas
> > 
> > > +		}
> > > +
> > > +		list_for_each_entry_rcu(pos, &mgr->queued_pages,
> > queued_link) {
> > > +			u64 pfn;
> > > +
> > > +			pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> > > +			seq_printf(m, "0x%016llx : 0x%016lx : %c\n",
> > > +				   pfn, PAGE_SIZE, pos->status ? 'F' : 'P');
> > 
> > [Severity: Low]
> > This has the same PAGE_SHIFT and PAGE_SIZE host CPU macro coupling as
> > above, which may truncate the PFN and report the wrong size on non-4K CPU
> > architectures.
> > 
> > > +		}
> > > +
> > > +		rcu_read_unlock();
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > 
> > [ ... ]
> > 
> > --
> > Sashiko AI review ·
> > https://sashiko.dev/#/patchset/20260902145343.465686-17-
> > tejas.upadhyay@intel.com?part=13
