Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590CB33372A
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000163; cv=fail; b=iz/H1E5Pd6pJk1/4U33+NvynKKFySYYslOAVYbm9bQQ8Ne4eGLN8c+7kMS9WpgRBey9QGifijXAKmXAg+tLDa67179mS2oZ2cqoxFHWethEv2Lw43JDOeGF5FzulpcKAECSAYqgx1A0lffeuXhKdSyX4TKRlACnScOcgH+Nywdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000163; c=relaxed/simple;
	bh=3ltAaPSxhm17iffMUn97Cl+nc4StPUjjzVzYrw2C7iA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mUwT1vjkdOb/E5zEwrB4y30PbJUtEWa27JlZkjJlYHzBH0wF2ffiAdhTpOqgHNX+G6jAIbWXI7i9zUwAecwEdwZ+3ag+PsddiN4D+4TpnjihHg9A7BpC0mi1ATg5jnB2yawRxwqDcVglh0GZbZ7JNgsaW2t2FgDMVlRlysGZPaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jyt+XzLJ; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jyt+XzLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792000161; x=1823536161;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3ltAaPSxhm17iffMUn97Cl+nc4StPUjjzVzYrw2C7iA=;
  b=Jyt+XzLJRzu+GRL53oUICUjRBiTh+ZtCYJvLRiKEclw66wW4YpVD4w5m
   Yq0mjlJQ8l4ecjp4ywYLhbuprowDtJ0RTWlGAwZPwV+5sf9YT1PnDiiWB
   fs97oWGNySkhbmPoV3HasXxG9kZfuv3VL+x6smhJimF3Fl6Oq1q3AguH9
   J0/0LT1C4uyIEdPokAlnhT5lOEXcDPYwpuzyg+VLBJg3ithEOjJ2xupwC
   /HVTkRdoYyI3beShU3SvVZ4cVWbLwzlNQUF/PPdqDMqMThhFzHMlGzGIz
   UhNBVOqkx8d7cB4dv36q8tU3D/GNGCf1gft0LVd9BOd6gizmT2/WpJIYP
   Q==;
X-CSE-ConnectionGUID: Nc7lWv29SSWBKyVpKGfvrQ==
X-CSE-MsgGUID: SEWf12ufQ0q8qMVBhle3XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="763421"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="763421"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 10:49:20 -0700
X-CSE-ConnectionGUID: Ytwz4O6HQYiXCE4ZKgRJxA==
X-CSE-MsgGUID: 8aeFJh31RXumYFyTTwglVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1374740"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 10:49:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:49:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 10:49:20 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 10:49:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvEh4uI9PjHDkj+aV/Rm8bqEjcWu8J6Fmk6PmTic5dftMy+mPbAqDinfzBnMzP/IZ5D4Git7itmuYSTPDRpHvlFK2JMlJjpt0h3Kd3zvheO1nuTR197BtpkYJ+CnMvLSf7iYCcE4L5f+e+qTZHDImdCw2pfpJq3NGVCdxmedLYTwrkHRr1QatYeEHWTU2SfWQuiENx/hj2IaUsMnw/qYyWhncVTeQqUrUKaK3YwhsZHhVjm09aqRGpk6EPQVDLanFp9pX3zRA1+4U1i0+WQ82CjUTJZIEDaYunchBKpKBjDfeuoJZlRpH/E9FHrJNaSnrrtIjKyPrhycWa+keeS9IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gllYAmYKtKZqTD8dZrTbzF8hSxVOOQxuclaE7Ye5fF4=;
 b=Qpy2clCYwDPc6Qf3PHucwg5AzN6MVzEazY6wPC6twA/MquNY222PQR7NbQq9zimLsVof/PT1M7Vov8ckJf5EFrOFZk8iJ/b0GGTsrwuCcPaDTjccRLvLE6rFhxLgms3CxqHuZXKSnBnm/rc3BPxyq7S1bRO4FMXFqSr7cGAW95id3TdqoCZD17MavGD1tgRDxkkUlemnBKDlHeT1bXyrHylyS//Qe+N31xTBUrptMFmq7LbRuU66kudv+87zb4wLU9YNTiUmLoFRhlZi65E22DsCkr37MGOrEHEo64A2NFjXYPdxJhKuniMlBQbU6oLuL33xEhynfrCAhzxgn4gNpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by BY1PR11MB8053.namprd11.prod.outlook.com (2603:10b6:a03:525::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Wed, 14 Oct
 2026 17:49:06 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 17:49:06 +0000
Date: Wed, 14 Oct 2026 13:49:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v13 03/16] drm/xe/hwmon: Fix thermal sensor data handling
Message-ID: <as_AjwYamf1whGCy@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
 <20261014115806.831459-4-karthik.poosa@intel.com>
 <sashiko-outbox-171260@kernel.org>
 <bcaceb82-a306-482b-875d-237e43e24644@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bcaceb82-a306-482b-875d-237e43e24644@intel.com>
X-ClientProxiedBy: BY3PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:a03:255::19) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|BY1PR11MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea82586-f8f2-454d-7274-08df2a1b7156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|6133799003|4143699003|11063799006|22082099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: ftd4ww0Nd2U5da3Lb5+jz0fLnIDWjQB/Oj9WKnZf7Zc0WgzRWkuDgOIrjKBhWKxRt6KzIVc55xzTpAFhgjOUXMcO3b61IFpEb4UPIBUiIzq5gYCxovVb1/ub5b33aKiD2QQJlwD+zo33HmZ3Ie43GJxmjaEDbCh7B0YN4YDXINhPVxahrVh05qr2pmp83Nnm+qvdwl2jW7SC8dHp3demedYwJ0gSfhgO6zF5tstReGA7q9t+v3TvHdu9MctpJSJCTHhqGnFwBw1wau4Ga1RJnNRSxL8DYRAc0BpvvVqbcIT+J43SmJASAk3DhvML2o1V8hiBYwoHSM93VsTTfWrilEyHfv1qF9DD42Vsb58R0S6O1jzrZc4WkiaIxOTo3nnXbSObsBZM0qvI/ogU3HFcKLVbYbVeE10fDEdjQrHCKWpHqq1NGog9X5ymIDQBY7PUmkK5BbizFiehy/OzzPvGZGjNnJQu7stSagOrWBjCGmKLjpyQlzwrdFd2CmdQrvKQIcRuRXK8RfIpDVvenFOXoC1ZkSuUJUO5jAZa/RZboZP3uYr3ka0WshsCntg4A9FqqQtYU/GQmps+Z9eOdcDB6hiEnkdbtpIoArbxX/76SbfYMcf4RTxd4Umu0zfJI0MwwixaayveyeH9hJO/BM7Ll1gvrX+qDnPzaOpPLCI9YLg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7180.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(6133799003)(4143699003)(11063799006)(22082099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xq8t7oZMAtI64JENHWkn/sWUd+/o7wU9jSjkOkH2XUoFW6YxWYhMvfAWm+PS?=
 =?us-ascii?Q?gA3K65skut2tO4OkKJDaWgRpDbcKxK8CQZOtsE9clCA6N4bjOrMT3CgDiG+p?=
 =?us-ascii?Q?Sw/MD4lL21HVDd0n06ebt3188kXHYUdhlfngYIRw9cxK9ZQZN35hdn1XVti0?=
 =?us-ascii?Q?quu0KhX1hCSMe3oXX9NqgCq9UmNi5vYteKbGq9815HEcxjIiwc2vbpPmoAZu?=
 =?us-ascii?Q?/xJt64IzsHX79GJFswP2Xz8ynQRYETorzJ3C/4nLYGEwGRouCqzgOzuuEjkj?=
 =?us-ascii?Q?FDpdJhjxT0828wgU9ER84Gbd/MpJKGNA8nYGP3vhWGPILSbD0tNqyZCEhdG7?=
 =?us-ascii?Q?5LLwi5uz4JXwcHr0JQRzs2ygC5TL8SKsGCgbSW3CGJ53Pz0H1HCf3q+UPft9?=
 =?us-ascii?Q?RyZL82edt5XH72ikq9vj+T18Dp4/sQ+iBZl3RsdIzgpmCMs60rmYumUe52hS?=
 =?us-ascii?Q?K1+pv8OiYUc1pKaAeBbPl3uMaw40vr8KxrwnnWZ92Srg0XuIVl4IL8CK7VF/?=
 =?us-ascii?Q?vL5rR9ko421wSF232sDbBp0qUUNJuqfvrCfIrVVmwmdsASwYEI3uUCEXY8iz?=
 =?us-ascii?Q?Ijr9xHUTSpcOZEf8IpAKgi22l5FAik+q9UMxsSyWeXKSBp+8C3XzEL9eG2kr?=
 =?us-ascii?Q?rQBQTR5ShPp9i9yc2D9l2OxIsvzw8MShfxk1MxJTyzH7gLouHvIO+t5wubXe?=
 =?us-ascii?Q?3d6aC+SRjo7WKnhETC4nVkITI2LNQiGy270ox9Sp6wNJ+lccUVZo7eB6Eo8q?=
 =?us-ascii?Q?g9XekwvJUpxXFdSpH+EIfZLb+CSjtPCjpofDU1uUq0C2NPdCFfJXFUjMrppE?=
 =?us-ascii?Q?DRuddoIWOqgnELBKa6YN3savJHMH8mOasgb/POXJfALAO1Xh4P5rd2fPbiFN?=
 =?us-ascii?Q?qOsXhqEnwGRtJW473Y1j0ThZutYn1aiAIHqXxYD770R1HOAu1w4n+ngvoKDw?=
 =?us-ascii?Q?/ZvH956TnsrLlivVL1GQ/9fHutXQzO0Kr3PJIlRuUw1FTwX/fjl/srLm/rLH?=
 =?us-ascii?Q?dlhgc7EU7q11b67fhDnqKaztQi9VN98bIDlx5rJuwMp26NMLO4EIVKDPiZzV?=
 =?us-ascii?Q?4ChZJJ795TpzObJm3lXGYPU0dn4bz7Un6O8X1HDDB2PU9AywmG0GMS7KIkPN?=
 =?us-ascii?Q?Pz2UNiC4k7pJqbG98vZAEDW0y3jd0CF1pIQdNbv0qvdpRscNu2Y6OjgXZWsF?=
 =?us-ascii?Q?uf0ZKrNodwYU/WtNHD5q9KmUV5IVkbHkby0nK4tVKgU4LsLaZFv+jPgcpq4h?=
 =?us-ascii?Q?obLqRtMrlawLiWIwu0dIOk1fyzg5PaKQL1cGAIqN4GOXDcaVX9Lu56O7Kr2E?=
 =?us-ascii?Q?Eiven9dJFJO0Zqy44sAh/G0ip7qpD/7N+d+WEe4VZiq+Nwt+ujyr+6W2WuPx?=
 =?us-ascii?Q?Mz1NQflsCfPlZc1wdRgLSozXpbcpM8qdmxaW6zb9F8ApNAyIWQVYN3jKl2x0?=
 =?us-ascii?Q?IGir0La6PL59sJcgRo7UdJqIVaK00uRDQ3cCbFucCvRU3ek6QaaX9K5Ehg14?=
 =?us-ascii?Q?EQkncm0CzE2m0SJ289PB0J7Jcd6ATR1iLTFb6/GJWWGCJMo1+P+h5vxWmiQm?=
 =?us-ascii?Q?TjTJGAjWgFnjE9fTCINdQAJ34jCXxhTtj5cosuxuSiA+Ne88vGl72ToZDKC8?=
 =?us-ascii?Q?Dy4E8zb/VKheL8EH4Bzbk/JuKyZ/VfIZszBNMP7Xgj+Bn5mjfLFoKOtYMcl6?=
 =?us-ascii?Q?Bd7H3EYxsfjeoXe/gC1eZkolmTvMlGDu5hAcMSQuFMUIPa36JUFSaCIz1vV5?=
 =?us-ascii?Q?Pi/wekekag=3D=3D?=
X-Exchange-RoutingPolicyChecked: rGdUEGJHtdTYO2r4YGoZo/h9zR6mRK4iIBL9ld8a6wQfW+yzJtoFMMN5iLoRjY0kb+1qPo3pU8SieUlHZMjJnRFiHZbkGbFfZe/ZL8dHMiAyr5gN7mbhRDnvHkHG3Nel9++mG1aSqidG2TI+m/HoTqhjyy9cvaKL0YERnZng7dPiHZVrjRILAnAa6lo80ZJlHT/ApoAfk0ZDSv7UaRD9zfGetdM8Kug1Pz3yOltHGHTqwJcYXnl1Ns7iEm4R/H5wRlyz7CbiIlTPNBOx+gIbCcMir+ANSWNycHArqNlRzjnJCwRWxZno6BUAIOvPwiyWFm0oN5AF+bRoiz3LUEXaWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea82586-f8f2-454d-7274-08df2a1b7156
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 17:49:06.6318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5AnLEux0ohF4+k+EcTClCtB0PBBuhdEDNu3xBWABK4bxJ6JTSd3pKQVJ54C/47m6CIU0MPgm8sZSJpmx4Ug/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8053
X-OriginatorOrg: intel.com

On Wed, Oct 14, 2026 at 07:12:07PM +0530, Poosa, Karthik wrote:
> 
> On 14-10-2026 17:46, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] hwmon: Subsystem API Violation - Driver uses private custom mutex instead of hwmon_lock()
> > --
> > 
> > commit 5b607ffd1e7d970e08aa24f25b6f029c27e76b6d
> > Author: Karthik Poosa <karthik.poosa@intel.com>
> > 
> > drm/xe/hwmon: Fix thermal sensor data handling
> > 
> > This commit reads required thermal groups in get_mc_temp() and stores them
> > in a dword-aligned buffer, avoiding unaligned pcode accesses. It also stores
> > the pcode thermal data and thermal limit words as little-endian.
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > > index 382bf9625a8bd..1b4efbf4ac999 100644
> > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > [ ... ]
> > > @@ -840,16 +845,20 @@ static int mbx_temp_decode(u8 value)
> > >   static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
> > >   {
> > >   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> > > -	u32 *dword = (u32 *)hwmon->temp.value;
> > >   	s32 average = 0;
> > >   	int ret, i;
> > > -	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
> > > +	guard(mutex)(&hwmon->hwmon_lock);
> > [Severity: Low]
> > Does this violate the hardware monitoring subsystem locking requirements?
> > 
> > The hwmon subsystem documentation states that drivers implementing locking
> > required for interrupt handling or for attributes registered by any other
> > means must use the hwmon_lock() and hwmon_unlock() APIs.
> > 
> > Can we use the hwmon subsystem's locking API here instead of the
> > driver-specific hwmon_lock mutex?
> 
> The mutex here protects driver-internal concurrent accesses and does not
> provide synchronization required by the hwmon core callbacks.
> 
> Therefore, I don't believe this falls under the case requiring hwmon_lock()
> / hwmon_unlock().
> 
> @rodrigo, can you share your comment on this.

that's right. we need to protect our data, nor take care of any synchronization...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > > +
> > > +	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
