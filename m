Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28583248F64
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 04:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788495026; cv=fail; b=HiOKZ/SIBXDEEAq0TRgoVugrwzQYmKOcI50HYKJadUnq/4lYTwFquDqNad+Tx8OhpP/auB8UkMgjeYfCfQM9r3d7Vno497tOyEHr5RxbWniBIfV8+A2EPuQx4+EMX2AeQe4GNUzsJ+ljd6oKtxFYdIQB4ARuzobQXQMjqwbncns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788495026; c=relaxed/simple;
	bh=ZeQxCQLW6nrGILk8NsBXxNi6laj95AQTMwdHa3ied/U=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NpP7F5Pv4pyWl4Cgmv+0hNVMp/MwWwy1wgzpBhfntl0gC4bmkGN4r41WFEV3Kzgd+gQCqI0RQ/7Ip4Kgi+QF9huGW5/2Qm1azNTiZGVXMFBWY53YzRWPPpWUczbbcVBEtS4utOvwzb497m93gYsIKK0YbBSH5jxBH5FfJw0TmPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQOCFB/O; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQOCFB/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788495024; x=1820031024;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ZeQxCQLW6nrGILk8NsBXxNi6laj95AQTMwdHa3ied/U=;
  b=QQOCFB/OE81Cs3VqRcNPpmj0xO0dfHGjMo0Qo0JXOuO/t6apz+K9oKRy
   ecRb6pW/5sdy1r6Hlfpl96PDSD0ALTsgh7UNKpo8Xtffpw/2n4qw7PWy1
   WFrY5Qpip1xJH32aZESzUXK7LrRqS7PaQPEBWO+DvHt1gFMKeyfAULn1z
   iJBcLdzGFefx8YiJHUKAg44PjXCZo8QpTFxxHWZYWO4AKdip4SmYJhHcx
   qBrtRPZS7ZoG+Pv2HXRJl59f8TYvxDrQiiLJCWs8su6wmlxIqevoZQeKg
   wHnUMFkBXx0hqCm7IElPxxaQPkoPeRDZAv16jNdUm8MzQGbcI5ANkVfZp
   A==;
X-CSE-ConnectionGUID: sJE+dzwaSxOYmjgE2noklg==
X-CSE-MsgGUID: JulJX9pIRqShsUQH1y/1AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88134159"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88134159"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 21:10:23 -0700
X-CSE-ConnectionGUID: GPwj+B7aRvOmWqBJ545uhQ==
X-CSE-MsgGUID: cF6ALUTYRw26FQK0W+zMrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="268185167"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 21:10:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 21:10:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 21:10:22 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 21:10:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGe1tMT7kr164hqEj6Hv7kqdD25qYDMW0qDvhtkc9UdE6Q44pLFjblr/efbo8O1nKfsXshOQtLk8wv/v2DPhICMQHg+9FQtEBBMtOSfnXd6Gfc8M93R42mumM2BE017OkRxqJQdsy9wrvSuvBdEVgAt+VaNI+s7ZOhPKBMeUpviTiXvmhNdQP26w51tMUq01uL++uTIMKCWBzHi0w46rHczJ51lRGpB6ZYbQ0sSGQVwpQavlUd5MJPkUKz4SkXEGvd+RCtuZMqZI/JOkhmVeGJFiTOAVirSCtF07QQs0NAgpnZWuLcngi0AucLvR3evdZpnNqpQ4XCx93PuOrZE2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VulwyufhNPrszLrs5p5RTKXoWyRj8i7VrdEZcd3tgwo=;
 b=s8TdlSD3COFCl0a0X2jogN8zdwXv+ryDQjtVPRZ6sIFghtg+aYti5j6ik4zIIhmaPRwp5iB4xS2vG1L/cxo8SGVdfFP8JY3uvWCEbWGreZ139F5+96L58lCjTLr1c6bdd0p/7yTmwKWxof3+L1FfsHHuoKo8gfHmrNH+J+7a6nx/W/bTXNtEclsEE/ZA9BDiEV9T8jlxNtNIisc+HUbMXJYhcfjv9MbRoXyTpdOjpmIB1OfaJP6xZd38m+OVMFKIOFVbWy3W2v2mcP8F3hrNoDZUW/kfzwJNmLGK0hI1Xrcz79NLDtEqD8JjXwQXxsg0K5vHPENlnRtHXGw0P37pbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 04:10:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 04:10:16 +0000
Date: Thu, 3 Sep 2026 21:10:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 17/25] drm/xe: Add device flag to enable PT mirroring
 across tiles
Message-ID: <appEprATsO8O4lEU@gsse-cloud1.jf.intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
 <20260904022207.3490018-18-matthew.brost@intel.com>
 <20260904024347.D0DC81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904024347.D0DC81F000E9@smtp.kernel.org>
X-ClientProxiedBy: MW4PR04CA0257.namprd04.prod.outlook.com
 (2603:10b6:303:88::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 154b7eb2-bfd3-4b0c-ef30-08df0a3a6d39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: il1mqFx0+sFiFGnem2cwmoxuaBcE7awx/ESykMMvzFKByzeaklj9I6UX/P7JlArqx4TZiwf5CIT4C3FiP0YemtH+9qmnz7/Ddl/8xxelh3uenqdj7/sjRhqtKatB9UQdwQutc+ia6DtpVf2oONSrgZ0QIGbSCCmPk3Ho8wuRqWZezcdiFiV6wUDAF0arIZuxGd3+QigI2xBU1t45Ov3VnlxU7WxoMFqbN36UhBdCFgPNU2bw6czZmSclpz8rwGB5STl+LJXeFx1UnOvui6UUdBGJmZnBb9dcy0JMgmPAH65akg+sagF+2A4eGtep7eaIHeYmGoyVL1F47CCNlPHwget/s7ojQM+wB5Ps67i8gwgpL26SU8A23IenJyWgfoBMfAeSCqgnsSwkHJHsGd44A2+0YipOS5r19sOObj9pQ6hrZvH5RCHtxUQDMUAN6gg3Juqw3wWchSiyrrx8gHo/8rg7rF2+Dn8In1ipCOboy0svXg3VG9k14wv0yKrWicWJKj4zWuy7GeZxLAX1BkUGGExtCKk2e/at7S/hVnMIyqgh8v+eAa1B3yJfF3q9cpv//Syq8Cn9Uem7+o9IMQ8m1F5NJKRnLV9ON3zVHG81WhM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xqckdTSuzlkzTzN5rTt2fJR8sg0rPep4wSrEdxWC0oX1e3aq9rw21FjguV?=
 =?iso-8859-1?Q?CcyjnvPlvXiCmCLstkDJfpqOZZyPG+Z5Pg5qiUyHHl+9gUCwrGjLUIW8jK?=
 =?iso-8859-1?Q?urfkaNDinqkL7XbijXpNivm6ykvJnO5ixQdINJY8QfaALCbpNAlZ9+ABvG?=
 =?iso-8859-1?Q?QgV6YeyVRBQBhaensYlo6eYE6g0i/pSckpTBZTbnoKPjSUv9PSk/gNFhid?=
 =?iso-8859-1?Q?kIJFgqXw435Vbbc0EjNRom9FCSd2yYYAzhcTc8Sc1Ijk0hwEm+zHPPjkpV?=
 =?iso-8859-1?Q?mmxvD6Pprra6oiZNI6uiLzt6rQYixMkCHfTAoUeSwjTLNwUN+mk6sM1s7n?=
 =?iso-8859-1?Q?t7O9esiuh9jFrFS9S+idh/STnJYNzuWC8dG6w4pi9hgIyx5FtNP5cEsD7g?=
 =?iso-8859-1?Q?NHHll/+0uCvAnU9IigHPEoQQZ3oZjt/VhIOEDN4+kOgiGePCO7GTE//juf?=
 =?iso-8859-1?Q?AQ9veH64UVGgz4UT/s4VhPuDSDH3tvKjvsdROtU8l6GMklCNgWHJvBuC/F?=
 =?iso-8859-1?Q?srFARRfp8ojytm3HM3KDh0jbtSBmwYORrIudh2dzBbwGmEZu/VK66ZUF+X?=
 =?iso-8859-1?Q?VwPUzdgBBXPuEelZGA74gcKZrh7Lu08oGQSzyIRk9vTO6Zl5gYUDxbAoQv?=
 =?iso-8859-1?Q?ouT7kRh+UvpzyY3Q5mes9cm5sCew3Jy7D01UlO5uMOSnAZR1LY5HaUJ5BF?=
 =?iso-8859-1?Q?hleItCvmSroBTRFHjE1ucCYIGvxSPWGvRmxkSQ21Ah4pJiw+mAMQyJNijU?=
 =?iso-8859-1?Q?Kbr4LvjcWbw2kx3soNKdvJGAYiC1ZnJhk57/XKzIYDJEapwu+cbjs9xFz5?=
 =?iso-8859-1?Q?skPvswRDMoFgZ/GQ7j6WqedepbSq/+amD95TZl1p7umGftpGbMytvfVka1?=
 =?iso-8859-1?Q?KZTcRrQ1MjAeg2Ufskxb80J+on1VbPnVff7xNPSSNdS0zhJIiKnIeuNX8r?=
 =?iso-8859-1?Q?C0CYFrsY2SlOgMMc3haEQD6HlASp6PmNgJuFQaRkBTNRNjK4FTTEKU6nZu?=
 =?iso-8859-1?Q?oqkU9LGtwRR3RZU3WYDcTIb/MsSRKqGoW2thf7vyvdZ4HpDjwYa0IfcS3a?=
 =?iso-8859-1?Q?miONqXo6ZV00KF20s7OnzXkAPbAvtV6E+cd0j4WDohpznQf4a9ERIpACy8?=
 =?iso-8859-1?Q?EOccN21r+S6IVEAhOlkUfCqJ4OvooDDEsQQeO2bUfv/QDxYsiZiivNBj3N?=
 =?iso-8859-1?Q?DicCR073hSjLOJwzVJFOjycOMp+dLpHL4oUpczSQMkTDQ4418bP9efKtE7?=
 =?iso-8859-1?Q?kT2mvdulqUO2b8K3TYflQX0KMJ3sFbVi8aiAue0EIgUeanjZrlHwcvW0r/?=
 =?iso-8859-1?Q?+PWW8avTLZ5B2qF0IdUNiuGuAkjlMVZnl14a3fjfDYom6OftY5LlECx+Ck?=
 =?iso-8859-1?Q?LmE7cQYbh1AOsvlwm5pIbVJJuJjg8cA1wap45Dpv85CkPQNQIzg6f0SIqM?=
 =?iso-8859-1?Q?CZJuOGgfAqCO5N7en46WwCVWyBta+3u6rWjTj4/yBazLvavnO6K1R5oVza?=
 =?iso-8859-1?Q?hqnq00vp7SUxiF3sxUXpggwmjLKcrfEfOoelaOKqfbwDxERBRMBbtNPKj3?=
 =?iso-8859-1?Q?v79275DVlMVec158gnYZ2lk4i5x+HnFhBXown3NGXXX54yBR5iF6ruxmn/?=
 =?iso-8859-1?Q?jMusBF4sBtlTRN67gnFzXDZyW2EVCaP3dwc/fiF6MKW4YVbR+6hHznXmGI?=
 =?iso-8859-1?Q?UVqxw6WvkwZhYpMytWLm6wUP7nYRcfwnwBA27l0l9WJeK78scW9imGB179?=
 =?iso-8859-1?Q?QEkvRIfKknuW6yTzELX2wcsk6F0+N3m+tVTD/hZq1HFY6EgmPY3chQev7L?=
 =?iso-8859-1?Q?xCKdLxaXjZq4cMJxUojLf65QmOgPDEU=3D?=
X-Exchange-RoutingPolicyChecked: llWPrzU54fOwAExSR0rJRQdTTM9op1JLL2kzD+p4c4bUUzuSu6TwcarY10D3PXIRMKVI5uijI7TGYQRopZoiAFo/P65o/BUeevvY5s9wotudMkDBtAQc0U8ZNULrE3W/OymBB3CKMn1qRtbRI8BVWmea6jpkai3B0W2xNLw6GUAUmqT5GeMKIDv0r9oPyAlFTyLHABNcQov67+d87MenGz9ulHzYhgxVfZXvfwfj5zsTeH4CN0fCEDdoY+GD5eAXcMQfB08zCAXJaCGQ3lk9/zIAoXnR6+vP61jSEMDsqjkgOZd2UxZrYKYT32aeYU+lgq5MH61qNT6Y4BF5N6TWGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 154b7eb2-bfd3-4b0c-ef30-08df0a3a6d39
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:10:16.8733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c96qo9lmm6lqTI3z/DpOrbMRkUtvq/eUmZINTIAAXnkRhin5gPgrc04ajUHiLhoun3agTIkF5UxBt+9SsIgQ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 02:43:47AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unused page tables and scratch buffers are incorrectly allocated for secondary tiles when PT mirroring is disabled, wasting VRAM, and migration VMs are forced to use remote page tables.
> - [Medium] Memory leak of page reclaim entries (`prl->entries`) on error paths or when TLB invalidation is bypassed for tiles with disabled page table mirroring.
> --
> 
> commit 38fe6ff118093de1244d8bbcc84d59616c09c17c
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Add device flag to enable PT mirroring across tiles
> 
> This commit introduces a device flag to enable or disable page-table
> mirroring across tiles for memory-bandwidth reasons. The flag defaults
> to the existing behavior on PVC but allows flexibility for other devices.
> 
> Link: https://patch.msgid.link/20260228013501.106680-18-matthew.brost@intel.com
> 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 05bbac6c2632e..bf2cdef44179d 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> [ ... ]
> > @@ -2541,9 +2552,21 @@ int xe_pt_update_ops_prepare(struct xe_device *xe, struct xe_vma_ops *vops)
> >  	int id, err;
> >  
> >  	for_each_tile(tile, xe, id) {
> > +		struct xe_vm_pgtable_update_ops *pt_update_ops =
> > +			&vops->pt_update_ops[id];
> > +
> >  		if (!vops->pt_update_ops[id].num_ops)
> >  			continue;
> >  
> > +		if (pt_mirroring_disabled_for_tile(vops->vm, id)) {
> > +			struct xe_page_reclaim_list *prl = &pt_update_ops->prl;
> > +
> > +			/* Transfer root PT update ops PRL to current */
> > +			*prl = vops->pt_update_ops[0].prl;
> > +			xe_page_reclaim_entries_get(prl->entries);
> > +			continue;
> > +		}
> > +
> >  		err = __xe_pt_update_ops_prepare(tile, vops);
> >  		if (err)
> >  			return err;
> [ ... ]
> > @@ -2924,6 +2953,9 @@ void xe_pt_update_ops_fini(struct xe_device *xe, struct xe_vma_ops *vops)
> >  		if (!pt_update_ops->num_ops)
> >  			continue;
> >  
> > +		if (pt_mirroring_disabled_for_tile(vops->vm, id))
> > +			continue;
> > +
> >  		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> 
> [Severity: Medium]
> Does this skip releasing the page reclaim entries for secondary tiles?
> 
> When PT mirroring is disabled, xe_pt_update_ops_prepare() takes an extra
> reference to prl->entries for secondary tiles. If the operation succeeds but
> TLB invalidation is bypassed (or if called on cleanup),
> xe_pt_update_ops_fini() is executed. By checking
> pt_mirroring_disabled_for_tile() and continuing, it skips the needed
> xe_page_reclaim_entries_put() call, which can lead to a memory leak.
> 
> >  	}
> >  }
> > @@ -2948,6 +2980,9 @@ void xe_pt_update_ops_abort(struct xe_device *xe, struct xe_vma_ops *vops)
> >  			&vops->pt_update_ops[id];
> >  		int i;
> >  
> > +		if (pt_mirroring_disabled_for_tile(vops->vm, id))
> > +			continue;
> > +
> >  		for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
> 
> [Severity: Medium]
> Similar to the issue above in xe_pt_update_ops_fini(), does this leak the
> page reclaim entries when an operation is aborted?
> 
> By skipping secondary tiles when mirroring is disabled,
> xe_pt_update_ops_abort() also bypasses xe_pt_update_ops_fini() for those
> tiles, meaning the reference acquired in xe_pt_update_ops_prepare() is
> never put on error paths.
> 

Both of these are correct, pt_mirroring_disabled_for_tile should be
deleted from xe_pt_update_ops_fini.

Matt

> >  			struct xe_vm_pgtable_update_op *pt_op =
> >  				to_pt_op(pt_update_ops, i);
> [ ... ]
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index fbfc42afef8b1..795d0ebb10047 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> [ ... ]
> > @@ -1738,7 +1748,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
> >  
> >  		for_each_tile(tile, xe, id) {
> >  			if (flags & XE_VM_FLAG_MIGRATION &&
> > -			    tile->id != XE_VM_FLAG_TILE_ID(flags))
> > +			    tile->id != XE_VM_FLAG_TILE_ID(flags) &&
> > +			    (vm->xe->info.has_pt_mirror || id))
> >  				continue;
> >  
> >  			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
> 
> [Severity: High]
> Does this allocate unused page tables and scratch buffers for secondary tiles
> when PT mirroring is disabled?
> 
> When has_pt_mirror is false, the loop does not skip secondary tiles for
> normal VMs, causing it to unconditionally allocate pt_root structures and
> scratch pages for all of them. 
> 
> Additionally, for migration VMs on secondary tiles, this allocates both
> pt_root[0] and pt_root[tile_id]. Since xe_vm_pt_root() unconditionally
> returns pt_root[0] when mirroring is disabled, this abandons the memory
> allocated for secondary tiles and forces the migration engine to use
> pt_root[0] over the cross-tile interconnect, defeating the locality benefits.
> 
> [ ... ]
> > @@ -5072,3 +5083,21 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
> >  	}
> >  	up_write(&vm->exec_queues.lock);
> >  }
> > +
> > +/**
> > + * xe_vm_pt_root() - Retrieve VM page-table root
> > + * @vm: The VM.
> > + * @tile_id: Tile ID
> > + *
> > + * Retrieve VM page-table root for a tile ID, used to abstract if PT mirroring is
> > + * enabled across tiles.
> > + *
> > + * Return: VM page-table root for a tile ID
> > + */
> > +struct xe_pt *xe_vm_pt_root(struct xe_vm *vm, u8 tile_id)
> > +{
> > +	if (vm->xe->info.has_pt_mirror)
> > +		return vm->pt_root[tile_id];
> > +
> > +	return vm->pt_root[0];
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260904022207.3490018-1-matthew.brost@intel.com?part=17
