Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4F8382397
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787595736; cv=fail; b=Fm979dC9yQXjq5cSRSs5S6D3Iq2E0scpw7Bmh3+9qDDJbDCKct4eRXeGBVaKhhRZ0wcD6u7aaH0vVUMLF2rYwdP8VRgiQYtYaCvHdFZqZtpivsoBXPw3cV0QNuXwngDMqtYrEYWDTdzv/EI3MmZKljoUvjSo5x5MfffaD44IS3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787595736; c=relaxed/simple;
	bh=vDWl//Ald3DP0OAI/uosAjKrPOQeYeMOVRAlnqqoBas=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qv2dKGMHd636XXQXtTDjkuDIOHBnjK9IVi1RtXI5dwRo0TnO5AUm+PVgXq/1YwQHv0EOnj6yFGPD/0YK+uWoJLkl12O0WnXUhgKUfrQl/u52uGaIi6ObNDzW2CC5vjBOwhz92IDcuiyaeUgHod5AcC+UyrzfKfTZ9JeIsNzpCv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RoNSyyWJ; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RoNSyyWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787595734; x=1819131734;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vDWl//Ald3DP0OAI/uosAjKrPOQeYeMOVRAlnqqoBas=;
  b=RoNSyyWJrzYFAkaVi9PLP33NAmh/rj6FBD22mSh1VHWwJy8owzpL4cHJ
   qmLADtHmizYAivMmo33OcYcza7oL6Z7ciIYTzZQsYgNVP3o75PD4MLWri
   ywZgpUixJKXhsmsk8D8w7z2SY00EpVEWpjK8L9NnMGEqOfvcOshKjbnQ3
   +Tt4Wt9CeonmVLnShC2UgeLrG3ZCC2r/0TjtGmm9ccYGzYIYci2vdqTiz
   PnXPDGuNUnmu111e9bW+Kpj6DDrsFXEwhhTUpjqFqid9+9LsgREyv6wOa
   Hx0sn1cteMd8MEihHCXf3XaZegxLjo+QSViQAlPOWfy89y6ozsTbiln7Z
   A==;
X-CSE-ConnectionGUID: X6jVUO8sRbexlGwnTyPY5Q==
X-CSE-MsgGUID: Zjn77hDnRL6SkRSjnBAcHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="105589957"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="105589957"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:22:13 -0700
X-CSE-ConnectionGUID: qDU5fJuIRIuWKXACdcI05g==
X-CSE-MsgGUID: EqGrPI0PR5qUu/fjKkMTZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="263348357"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:22:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:22:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 11:22:10 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.57)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:22:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XINLJSqSbx1csUdaXHZxcdUAwWwasNFM77VT+T1NDdYKGDWmvf5o5uIybTKx2jxbvyJPQSNS+phosbvklyDedrEh4QaIiqLlRURVDEQzKyofcwRwZLUW1UbamRNLcy1PtgGObIfG5b7Zs0t69+12eoy1RZGShgvmAk2qGKgfvTEA87dAngKaycY3BW4uuRwA3WltuwSw0BxH4lhCKhrW3z0OwLX/S476J6I3c+Nd/hJCviRTi7U7SvcHZxU38c1J8rsMOK889aXjXgy8N+0mwNIrk8p+JPBsNwrLKTMBYMEsHllHvWcTithTWdbbUTBWT4GwCYa0JcSdYt33rK1qog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xom01fbi6SXs+MQnap8/YQj5yqUkxsGTdR0jDl/kLwY=;
 b=tzMcsOkhd4zdoRxt46V8wjuNeN/M1AvdvialPl72JCN+WYEbsZfB4ndYCqLO8YRDPkFvs713hBxVZCNr5M5ZdBaa0QH4/KR8oRcuLIMCajELSq6whjnGLrAaqxthl+wulHkIl9Icp9N+1QmK2OYFaFCFhwmrhxkm5Jf7YiyFRVFSxZ4xtJduGNru+qJWiPkYWY+qwCXg9AYmKQcCspg5xLpua7Eou/DHmtwICsz13rxNsFBewwy2aiznYvbjWwwpQUNSixPTExhW0Tk8i14n+qb61g6qWyx5xWvg9W/KiRTUlP1bK+9MOHMvtNFPZlKRXhyAl6PfRaI+35YdGhWDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by CH3PR11MB8517.namprd11.prod.outlook.com (2603:10b6:610:1ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 18:22:07 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 18:22:07 +0000
Date: Mon, 24 Aug 2026 14:22:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v10 07/10] drm/xe/pm: Introduce xe_device_suspend/resume()
Message-ID: <aoyLymx1-fZkEh-k@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-8-raag.jadav@intel.com>
 <20260821114306.23BEF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821114306.23BEF1F000E9@smtp.kernel.org>
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|CH3PR11MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: df612776-74bb-459e-bdbb-08df020c9af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8d4G4vP8EbDy8E9TXQeoGx5VHXTvGTarmK2U2zez3II7PQN+bcvvmdRa4adZKL0znVi+hCe3/oD/qr1RGDBYUk0EJhj/820mRlKV7E1RpRdsXRSM6UGgo2UTVmlx/l+mJs1CqZJq21vZpxVJOsQBTzcdjxxNcuxgCYyqu6d5ag9/vdegjQqonAGwgSwMLTrCVwp5uumq/Ms3FA7Iiwex6M0l2KhvH/k/bB4u6GSZ42zaaVqnHssSqnGMcyB41zc7upocq6e7AQhxU8BVfWKz8AKwiLUi1wXPMeAAxmKBRtwu7aJv57HjY5KNN2eYZU478EyjMHqqlxGMMGIJcUW3LY6FHbBrrCMwFupEZO3RdZKPIckw7edEQ1cKnB7b7xHeOsqPxC4mjLQd1s9sQp9jwKQfBIqzz/02vpJLUWBGWmT1Y2RXEUrlXLHvp4wW0VGqR4xrxF5p25gNI+0HVWdexk4CDuKVQqJY771EIWkCo6pAZvI07lN0QgZNSrJxCsxkU98yIughMBME9is5HYkbN+M2Tt7rIH3v1KzMB0xHnPn7PyTlMXVsXq4RbzVjbs95X2iDfuwiRZahXuel4fxYv5qA59Ez5T59HgYV6CPDajY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7752.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NSb63zmgLMu/UZLtUVO6gX+BrYS5dE3ooXHBBna/b6SZgCX/G+FlP69vuo?=
 =?iso-8859-1?Q?9ceo6f66kTFQstl2sxJFwv+ELEa6NeL05IshVh+mRhQLcXOqbpgaMlQriF?=
 =?iso-8859-1?Q?yQeRaKFYahOGUsHKKcBOXyLvPDJF8gGri9mIUd5L59OrEpxOEGRerqmUWv?=
 =?iso-8859-1?Q?l0vm2QURcw4QpDejQfLPnUc3Xf/FivdbAeYPWxRnfwWB4CM8I2XH2O1iV5?=
 =?iso-8859-1?Q?hJ9wgp5dvbTgn63N2WzflyRx9ucbZg3ZCOL0jmJEexCzaA63eZBEbm5jrE?=
 =?iso-8859-1?Q?5t7aSChlAUv4FWXC9ENdy3vgKP00BoT+KbMgTlB5g9o3XxexGcTZ7Cwweb?=
 =?iso-8859-1?Q?/GXGviw3WABs+VSGNN6G2NDD4unhYqwI1CRfOGGzhh1tmXpBUjjd2Q2BdT?=
 =?iso-8859-1?Q?hSIm79OHYQ83GGGjPGsIa+pbapT1jpZPtid7ZHPyhVWJDiTs8KQzz/hvi1?=
 =?iso-8859-1?Q?NpeelaS6LD4XJpdOrfx9zbiqOWc94ndp8//XWvkZzr5sCLGkO15/sFglj1?=
 =?iso-8859-1?Q?zjPEWDjx5Nqb4nv0zljqt3LsKUNcVLRR6aiRlio7Slb5ZgthxxjBtbyn2f?=
 =?iso-8859-1?Q?Cs9fmYrK/D4zNYlwquem49+aTY9eEhmON5IloGZlJiGxVEaCz7J3yurcYv?=
 =?iso-8859-1?Q?TGTt7+vCvKDAxlW3DZQ2s6GLzR/CedXdD61DP7K6Wg24XWvbThb+9Soc7P?=
 =?iso-8859-1?Q?LgFZ41J6rTzSkxsZ8OVJjF4EuOfK837sMJdGir01s/Sw1f/Ava9TvZUY00?=
 =?iso-8859-1?Q?xez20S5x6qN2apzY0RdXODyakOkraUYysUyMfVyY4Wj7y6QK4HFkVY53+a?=
 =?iso-8859-1?Q?mj8gzjeRrkY2TEQKH/UXjCkhsiEIJ3XM+KWon8FeGY5rWuWDJ7jD1L/TW7?=
 =?iso-8859-1?Q?6sxGoy/hPooEUhmWJcZicbfbQxr9EAoFFz7zgMeDFGk4MvOPOWEYGdROXg?=
 =?iso-8859-1?Q?jgMTfkzF+E9qCmSrnhtHHhZzRO8nd8FEvSHzsxOZWChSLz2JygsGRUF+pZ?=
 =?iso-8859-1?Q?7NhvvFldrhScufxvDk3Cl33vi+SUhAgXOBS6/wDzS9D3v+vabxHdq2F/hC?=
 =?iso-8859-1?Q?v3Os02/RWMnp38LtJvhqOonQy07883gjY1H2rWKjSWD1Ehl9r2C78M1uaq?=
 =?iso-8859-1?Q?tc7dI3z2EjYWdqWlCxPzfiCWtOEv6hwGgqHmlTIwgo/W2RQl5MHkRpWP0E?=
 =?iso-8859-1?Q?WWblmaMQSR1ukeTNx6y+ujl90kCKCGEY9jA08Wu3vJ5uR38WSDdrv1PWi8?=
 =?iso-8859-1?Q?6x3U9EnqXH+1OutksPn7QRuEG1ji4ID2qsgGenkE+PTH8db5sCZq1qS7k5?=
 =?iso-8859-1?Q?0N9+4PyYCSaAH4pNjVSsDt0C1o0+XRvN/D5b/a9NLdkIJz2YBznDyP4ord?=
 =?iso-8859-1?Q?5M6WINuiToQkYN5TTwz7l/u0GUrJORGViRDh3c+TW3Khq2CcOQ9MuAZClO?=
 =?iso-8859-1?Q?uEQIKVO5J48+UOiDBWUXfd86jm1lGWmoGgTfBkd2Ojp7z7vlW5Ifutu416?=
 =?iso-8859-1?Q?9i1hboegcZZXdNip9Hu8FCK3FMeMZHK+SW5bXNfb0nL9fzSQUrealE6JCq?=
 =?iso-8859-1?Q?5WlsODCfBmSUUvVbOeR19zKPBE0CRn+GxXaMdpgOm+SFIBMqbv/t2rSKfG?=
 =?iso-8859-1?Q?iH/ZXviD0+o6A9KXUZKkxlfeOIwohVdmAmKwn9qyBIL4Z2CO08an3fD7Iw?=
 =?iso-8859-1?Q?hSlEf0nEzdvTsmN1KVVWwFr29uLll7o5ch0OkJ15ABfImZKVXBwKMTHGSD?=
 =?iso-8859-1?Q?9/VDiI6dk2w0WrBRZRpgDxLPIQsZCeTywcJKEfe0xkGtFrrs/fyT+IhjeL?=
 =?iso-8859-1?Q?irGdXXhjeg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Mb16PkQNwa4uCyoZLfTLsmiHdjbQPtx9DbGTLpSq0ncJxxAPz+QhrjArv7OT/iqrVfpQJDrF8S9ayJ3B3ETeICCRvdC07NVbM9KfQBxkuJ7RZdtQ6m6sNzlgWccBFdEoIFKTwRDnux0b10XEKhQ4itQ7zQhtfyoy0iQoNSRzvX0+LulCv4MVcwNCAdE+7WDgbmGIaN7fc+NmFfloDqXeY+WJOpjeJi2IULF/YkCfhklWVL9Km7zQPHySJGxn5zWboa+ig0jY+WbiPQ8Ah31vXl+8YPpAPLA/qq5scoGDjhC1s6bOJkoBan/9DZFt6Stn8zpORu9mYRvyss4nRWgwMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: df612776-74bb-459e-bdbb-08df020c9af2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 18:22:07.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSQH0zwcHvIYcMA2z+lWVpfujKTzzcl/t4Tc2/Y/7wATnQst4Bqtw5CzGoGgujACb8yNA4uevViMyzC3AWcHJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8517
X-OriginatorOrg: intel.com

On Fri, Aug 21, 2026 at 11:43:05AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [Critical] External pinned BOs lose their DMA mappings during FLR suspend but are not unbound from GPU VMs and not restored on FLR resume, leading to an exploitable DMA UAF.
> - [High] Deadlock in FLR prepare path due to waiting for migration jobs after disabling interrupts and stopping GuC.

Raag, could you please take a look and respond all Sashiko's new findings one by one
with your analysis?

Thanks,
Rodrigo.

> 
> Pre-existing issues:
> - [High] Incomplete rollback on GT suspend failure leaves device in an inconsistent state.
> --
> 
> --- Patch [7]: [PATCH v10 07/10] drm/xe/pm: Introduce xe_device_suspend/resume() ---
> commit ee6e16bf1e226eef6a606f3d7137d9fbf63f7e82
> Author: Raag Jadav <raag.jadav@intel.com>
> 
> drm/xe/pm: Introduce xe_device_suspend/resume()
>     
> PCIe FLR prepare/re-initialization flows pretty much reflect system
> suspend/resume flows with a few notable exceptions. Repurpose existing
> helpers for PCIe FLR with an explicit flag to distinguish between both
> flows.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 396d02eb2af83..012ba47660982 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> [ ... ]
> > +int xe_device_suspend(struct xe_device *xe, bool flr)
> > +{
> > +	struct xe_gt *gt;
> > +	u8 id;
> > +	int err;
> > +
> > +	err = xe_pxp_pm_suspend(xe->pxp);
> > +	if (err)
> > +		return err;
> > +
> > +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> > +
> > +	for_each_gt(gt, xe, id)
> > +		xe_gt_suspend_prepare(gt);
> > +
> > +	if (flr) {
> > +		for_each_gt(gt, xe, id)
> > +			xe_gt_flr_prepare(gt);
> > +	} else {
> > +		xe_display_pm_suspend(xe);
> > +
> > +		/* FIXME: Super racey... */
> > +		err = xe_bo_evict_all(xe);
> > +		if (err)
> > +			goto err_display;
> > +
> > +		for_each_gt(gt, xe, id) {
> > +			err = xe_gt_suspend(gt);
> > +			if (err)
> > +				goto err_display;
> > +		}
> > +	}
> > +
> > +	xe_irq_suspend(xe);
> > +
> > +	if (flr) {
> > +		/* TODO: Drop all user bos */
> > +		xe_bo_pci_dev_remove_pinned(xe);
> 
> [Severity: High]
> Can this cause a deadlock during the PCIe FLR prepare sequence?
> 
> When flr is true, xe_gt_flr_prepare() stops GuC scheduling. The
> guc_exec_queue_stop() function explicitly skips banning and triggering
> cleanup for kernel queues like the migrate engine, leaving pending migration
> jobs in the scheduler.
> 
> Later we call xe_irq_suspend() which disables hardware interrupts. Then
> xe_bo_pci_dev_remove_pinned() calls xe_tile_migrate_wait(), performing a
> blocking dma_fence_wait() on the migrate engine's last job fence.
> 
> Since GuC is stopped, interrupts are disabled, and TDR wasn't queued, will
> the fence ever signal?
> 
> > +
> > +		unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
> > +	} else {
> > +		xe_display_pm_suspend_late(xe);
> > +
> > +		xe_i2c_pm_suspend(xe);
> > +	}
> > +
> > +	return 0;
> > +
> > +err_display:
> > +	xe_display_pm_resume(xe);
> > +	xe_pxp_pm_resume(xe->pxp);
> > +	return err;
> > +}
> 
> [Severity: High]
> This is a pre-existing issue, but does this error path leave the system in an
> inconsistent state if we fail during system suspend?
> 
> If xe_bo_evict_all() fails (e.g., due to system memory pressure), or
> xe_gt_suspend() fails on a subsequent GT, we jump to err_display.
> 
> The error path only resumes the display and PXP, but doesn't resume the already
> suspended GTs, undo xe_gt_suspend_prepare(), or restore the evicted BOs. Could
> this leave the device permanently broken until a reboot?
> 
> [ ... ]
> > +int xe_device_resume(struct xe_device *xe, bool flr)
> > +{
> [ ... ]
> > +	if (flr) {
> > +		if (err)
> > +			return err;
> > +	} else {
> > +		/*
> > +		 * Try to bring up display before bailing from GT resume failure,
> > +		 * so we don't leave the user clueless with a blank screen.
> > +		 */
> > +		xe_display_pm_resume(xe);
> > +		if (err)
> > +			return err;
> > +
> > +		err = xe_bo_restore_late(xe);
> 
> [Severity: Critical]
> Does skipping xe_bo_restore_late() during FLR resume create an IOMMU bypass or
> Use-After-Free risk?
> 
> During FLR suspend, xe_bo_pci_dev_remove_pinned() unmaps DMA for external BOs
> (dma-bufs), but the GPU page tables (which may reside in system memory and
> survive FLR) are not updated to remove the old IOVAs.
> 
> When resuming from FLR, we take the "flr == true" branch above and skip
> xe_bo_restore_late(). Since we skip remapping the external BOs, are those BOs
> left unmapped while their old IOVAs remain in the surviving GPU VMs?
> 
> If userspace submits jobs to the old GPU VMs, and the GPU accesses the unmapped
> IOVAs, could the GPU silently corrupt or exfiltrate memory if the IOMMU has
> reallocated those IOVAs to another device or process?
> 
> > +		if (err)
> > +			return err;
> > +
> > +		if (IS_VF_CCS_READY(xe))
> > +			xe_sriov_vf_ccs_register_context(xe);
> > +	}
> > +
> > +	xe_pxp_pm_resume(xe->pxp);
> > +
> > +	xe_late_bind_fw_load(&xe->late_bind);
> > +
> > +	return 0;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260821112436.545405-1-raag.jadav@intel.com?part=7
