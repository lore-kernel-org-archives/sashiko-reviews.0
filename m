Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D7953F687
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 19:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920112; cv=fail; b=GE0Pg/MkQ7c9fFJlDygNxNUBrmCt90iKblvwoBsCvIMH3ngIadwKeeVE+TBq5gtiqLbDUEh58V7Rw05QPMs8lpVmJ898jNg0O3jTBxK8eWt6d/cOnNWC42pAZEiwNiRI/M4izdtr0K9AIsaf32EQ1XpKDGTfSBqeRNiMGPcJM8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920112; c=relaxed/simple;
	bh=8kBKXY1OQ9JyhnRCAABuxLCZjVLXBfZwkHozNMZgEOc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ai/HwQ+4EGp1wPfuRrgqAl2K+sl2wSwoZgcJF5vJmzkb0aqItVzPMX6BtfoTqi5d7PTJb5cZ9zm+viyPBlxaMABDG4xq8B2qaHNNt3JUpSg1v9yP0y1VxteNVi2mtdHYgrFx/vzB4ExnU9/E9gOXblAtqPbUOS11mIvBpgURjxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKV/Z1j6; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKV/Z1j6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791920109; x=1823456109;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8kBKXY1OQ9JyhnRCAABuxLCZjVLXBfZwkHozNMZgEOc=;
  b=dKV/Z1j6EpZKd6AgTR5EPCnv94hyql51hrermf51WF01Ucu6eUxyw+6j
   tNQp66DCmetRWPNRDTX+GT1cUygEZ23RHuXerk53TiAkMffxkNA5muCyj
   4WkPJTRRftd/HUQQJI8OlolobIgjpn1Qc9IDr9Omwj72H0vyPw64Xa7IP
   skhQdw6lNvfNPslopdezGvoQ8B1avFXrqDlTwnl/trAuKVKs6LOmkdCVQ
   jYXxqq0p8U4TpwPnBRROmIJ8VpyDf1SWpG759j1zFIEQpTFZFulnJ4Lqn
   RSmNqe5FsfEPvi6GkygRZaRHmW0N19JcuBOjZVYyRyw+zm7Y2LWb8Si26
   g==;
X-CSE-ConnectionGUID: edRuL/hESVWU4toZ4F51qA==
X-CSE-MsgGUID: bM0HxESRSG+qKNkELvBJQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="666518"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="666518"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:34:45 -0700
X-CSE-ConnectionGUID: 5WP20EyfSRytnwC6GfBXvQ==
X-CSE-MsgGUID: GlKm86r/Sq60ZCqLFNeuvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3007564"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:34:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:34:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 12:34:44 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWIjcahV7r845YdPgt1Yvjw0M3o3T41X50biFjE7+YpyZHParVp1C8W7nWVdX97yDpFYbJyrov6CXsJD6J+QJVTdfh7oMhMnD9wqbS4xFnoejB9pebQbCtMpyYA1jAsEI2OptSd0OgqSb5dtaKkxs3K09EI2W80xhnBLjOS9GDWmQQXLvN99V9I1M3zE2qjBLU1kENI4CEHSzvyMS2SgFuapISn12eDAX0jtQd3bPKdKAJV2XD3OBnvfY6pZyS5pylqAgMr4hDFEqkGhSxrVk69YZNI+Szsj9pOq1b2Ba4Pjfz4g2efutEe9MQUQa2CmpTo6NJxTVkyB3aEwULFX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4RQaS3m4NCXJMDWtYPOaB7keMHuBFFQ5uwFxyk2wyk=;
 b=mubgin+gVZVzsFy8PNRa/i8LJpzVLRF90a5pP6lp/iAfWkYeKcYEFYpzS0/L+IAGmdD7Eb6wrEPHA9Zb82keDAksFST9itMTieknlQoSzf5GPJMidX8xwlGYUr0fJ8enVDYlE88TomPcitXwwR0AhXZ15WxUGB50VM3jUkh2qhPCIRr9CRe2S4efjNIxkJIJIgfbY5+q8vFhXtuNDEXTOkikZML9o+CWKD8w8/8+UGt3gTSrvX0N5K5GklD/dVhDAUVr4ZC0BcqZmm42Z/SQDfaPj3Ydd4vgJcO1Eg74IVWFR/FPq60H+1+u9aZWugnfgivxUxZo+t80ByaDDJ+5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22)
 by DS4PPF0442004E1.namprd11.prod.outlook.com (2603:10b6:f:fc02::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 19:34:36 +0000
Received: from DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb]) by DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 19:34:36 +0000
Date: Tue, 13 Oct 2026 15:34:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v10 3/3] drm/xe/guc: Add dump_cache to optimize GuC
 CT/Log compression flow
Message-ID: <as6HwRY4HvjFPB7N@intel.com>
References: <20261006175129.3366784-5-alan.previn.teres.alexis@intel.com>
 <20261006175129.3366784-8-alan.previn.teres.alexis@intel.com>
 <sashiko-outbox-162316@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-162316@kernel.org>
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To DS0PR11MB7192.namprd11.prod.outlook.com
 (2603:10b6:8:13a::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7192:EE_|DS4PPF0442004E1:EE_
X-MS-Office365-Filtering-Correlation-Id: ce4898e7-bda3-496d-cfb7-08df296103a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|261009223027099003|4143699003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: U+6DpMZFK+VOAIc9NKWoN05d+elejw1AKLOsf+9t7olnybR0e9kaN2DqnA1JdkTzGZQVcehS5ju5u4Ks19RLDHSjhCy6gqZUKj1s1/dblNI68Y/D/GrqH2k0ZY+U07KalG1hmcbsjhvoxo8lbpWE0qQHDUyu8wndqX6x1JLOGXudsH5tNrqMr1nLQA5BkGcZidaCVc1/WGK3DlUukhuMIL4/qPl8eSWxDaRD/RGpoyLuYZDF+dOr6Ac6hFb+ATgvg3zxv1N8dpyAFfxnnMqeOnCEawH9sMJWbfuC+iK2aqami3L550i7YhJnmt0HspwikpN1lfHhOS7YlSwF13YkH1Bp+LRAMzNUZb6BAIbfsTmFIQ7YfCAlsH6GBf+NRrNMc6EKNSvJ4rdpbD+HJvsGhYhbbSWIxbVMijd/qU38yJX8cYxrXnQQ/OF0Lvnf+gHSx6DtBQZ6u4+0Af7C/X8dtY3XZnfUfZ7mrXLKmNP42/JhBOCreayYYrS+WGaiIgv7dvbthihl7F5eA3KHkifC4MDtzENQ3/66wvu36vD4vWV33lq/Fk+I490r7uKc7C529QBWMttPYErpENiywzr3vQsFBl05KS4uQUhXbrFq52Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7192.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OzL4/oU2DroyPlJeHuQIMsSRmGMk2iUwsHZNhF3wgECjjL/BD7L6PGhlaJ?=
 =?iso-8859-1?Q?CTTwB2xxMbiPOVhfN3eFHQDSjw1kpNvhn2njmnLz0mx0q4OHyex8g6rj8U?=
 =?iso-8859-1?Q?/7m9G6C9+GA/LhqbaWDMfpiIk7ktZxtok4eg62DThlttdpHtWucSHbeviK?=
 =?iso-8859-1?Q?4ekJlb9G/+qfseYfyF/T0irG4jayPBLtl3FzvHen+hnMZSfCOUJcUcHJFl?=
 =?iso-8859-1?Q?gYs0u8v/ppDoA97qvejKYEPAY9HZy/FMZwv/PmNWMAWNJOexygsoASj9fC?=
 =?iso-8859-1?Q?smwLHuiKG+uGZQNa02K4NLqp2L9i/+NhkSWzsmvUSyK4KP+gNpby/6y4fh?=
 =?iso-8859-1?Q?tG5B5harl2eL5PhSu584pgh9kdJGKwscSrFRxdDG6VBH7n7tG1l4Ly0ngX?=
 =?iso-8859-1?Q?VSJhU6LLjqwPwGXtbmUaBfXou0VQ61uxr70/+kFIevi7xQABo3JFM2/shS?=
 =?iso-8859-1?Q?+rmIUGEqEuyTHc2fjupMzkck0oSOV44EYaqIR47zxyn+Cz5dMz3VieCFlP?=
 =?iso-8859-1?Q?S+fKMdzWnoO+nW3jKcjQvJvTLPYVhbW54CN3N14i4ICB6/ZL6X00SsX24c?=
 =?iso-8859-1?Q?OgJ9tSm+4/FIexyxnQOxCaxeRRhzXCeCxxq9GJ7/rGUTlKOqjmrq6m8gb2?=
 =?iso-8859-1?Q?YsZAztjKhL3i0KZLgry2cY9xdf1Bn45rJy+pXmLO8DTGjvrv7lOeyo1a05?=
 =?iso-8859-1?Q?xipx8DQUqBMp+u4k6+ulQR3Lxs6iSTJ5mK669No5GWadlEEKrX7tP671jg?=
 =?iso-8859-1?Q?Lb8ZH2ewkUxsTd245JgYDKbWcgjZZodDm5Ww9pan2J7NH1TJ6mwSkzdJec?=
 =?iso-8859-1?Q?ewSLGIQqsw942vUq37jWI8F25rO7N5BX80R6Um8FtS3966UsMcCeqhr5xP?=
 =?iso-8859-1?Q?3q85y8G9X29PvtQXN28dc1jDDQlqeAnHKlPIGRfLv8UtMNaOc4ssQ9HhfK?=
 =?iso-8859-1?Q?jODE99J4sO/KaaK5hkq3IP7I1BQY0NUD07EMTVtmSmDSEyfXxE3JcQdJVp?=
 =?iso-8859-1?Q?hLYtkPBWS+m0+idWlguzQUQ22kR0QibFocz+XgNcHgVs9YTMBGYhUdVnKd?=
 =?iso-8859-1?Q?lK6QT2aIlEfmv6cDgq1+boEpc3/aaTgKEaSBW6sBMwI0J01nCKqRE82cpu?=
 =?iso-8859-1?Q?ueFgukxjIMP8rrg+WErMLVkKQAR/LkjuDQTvK/k3vR+qHVV5d9rV5KgUhh?=
 =?iso-8859-1?Q?9JfxhsBPk/VzmLBNyJ+OdUosmC84MNVXob7J1YqI3aj1N6+OSkWt/1shQT?=
 =?iso-8859-1?Q?K0ekt9y5Y0/Bvd/WXsmuUz1Yy1dWCdWkMB8fcGqQDWRZUSawUgEIH2ncBV?=
 =?iso-8859-1?Q?hopQRPGp1pwyXREd8dUn4E62/AmYqrp8SLMvGUXvq0L5bfTrA+cdPzSnc2?=
 =?iso-8859-1?Q?BDCty71Ffvyqi2jLhgoLo/YEer3HyzlUbPPPgRXn+PCOXYRlixBcNQJQgy?=
 =?iso-8859-1?Q?aqvnZett7Y3AuTrVUdZy00wF/QgN6Y5ObuJ/BBKuFdO/ynx4XSLKLOYgsn?=
 =?iso-8859-1?Q?erTf4YMvluE79zV28VMDtNGzq5XXPUq4/Ac0UlolLSMeOYBXdYeB/73kQ6?=
 =?iso-8859-1?Q?tTePQn5WKwRukEHORh/1KGAXofN9BMdnmzJBieSbfcFAwGwum5NCR21eLe?=
 =?iso-8859-1?Q?K/MppRAHE/FASHu8XnHKr1GQUHdFW9HzVgkDp6AZsO8TIJWINxWaa5hKmp?=
 =?iso-8859-1?Q?TjZKW05J31lpG7xPS2HWOnFuEjzTFbR/S/mQ8pTA7yEaDfE2pX0wWUYlV6?=
 =?iso-8859-1?Q?GhrqMDdMLwHqr75v4fK++20u2fh4vgqI4nLiiqoCQobnrWfoQUhTAeSA6K?=
 =?iso-8859-1?Q?us7vgC5P/0ze58Cn46Y1u8L1IW7K754=3D?=
X-Exchange-RoutingPolicyChecked: b/BPFvq5vKZsH7ZFyZvYEFop1qGjDDN/K1lrb5PixJV2cnhX4d6qWN47lq0sMC8xpXsy3y3KmuahLcqV9YC0m7nryqhXzzm0U1SLeAEOTIWPe64wWC51fVO+wAtKv57wz0CX+cdl5Jd4pKkEpsujiUVzJZ6DISCSlXOXkRIH9aXgNrBvScOfZcRI69oEcWoY5r2gzKGdgxVA5mqdo/Bq6EZMYsl0nt58Ity1im+b/Z/3R358XqyHwHJIbTDoYBtgXV7O3c/Wzik0+ZZGeFpFLN44I6YLWgodsaZd4aomYx8NreoAY5x/yqpT+MJmz+bILEvjzWM5qTrrQp5dOkPjcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4898e7-bda3-496d-cfb7-08df296103a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7192.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 19:34:36.5226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huAw9GsIangFl9RkcOv5UVz9HnISErV7HEXgVSCT6VukxoXiJF3rsGPPZZ/aNLtE6/FCrCqpoWJ/6FW0/OoeZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF0442004E1
X-OriginatorOrg: intel.com

On Tue, Oct 06, 2026 at 06:04:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] locking: Sleeping in atomic context when freeing vmalloc'd dump cache under spinlock

perhaps worth splitting this series and resending patches 1 and 2 for merging
them? while refactoring this one?

> --
> 
> commit 4127e505817735f2e0895aab3e86bcc1556be816
> Author: Alan Previn <alan.previn.teres.alexis@intel.com>
> Date:   Tue Oct 6 17:51:31 2026 +0000
> 
> drm/xe/guc: Add dump_cache to optimize GuC CT/Log compression flow
>     
> This commit introduces a dump_cache structure to store a compressed copy
> of the GuC CT and log buffers. This avoids recompressing the buffers
> multiple times during xe_devcoredump preparation.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > index 47adaf70d5bfb..90aeaccea596c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> 
> [ ... ]
> 
> > @@ -296,30 +310,48 @@ static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p
> >  err:
> > -	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
> > -		   length_label, total_size);
> > -out:
> >  	kvfree(dst);
> >  	kvfree(wksp);
> >  }
> >  #endif
> >  
> > +/**
> > + * xe_guc_dump_cache_fini - release a dump blob's compression cache
> > + * @cache: cache embedded in the snapshot being freed
> > + */
> > +void xe_guc_dump_cache_fini(struct xe_guc_dump_cache *cache)
> > +{
> > +	kvfree(cache->data);
> 
> [Severity: High]
> Does this code risk sleeping in an atomic context when xe_guc_dump_cache_fini()
> is called?
> 
> The xe_guc_dump_cache_fini() function calls kvfree() on cache->data, which
> may be backed by vmalloc() if the compressed blob was large.
> 
> In drivers/gpu/drm/xe/xe_guc_ct.c, the ct_dead_worker_func() workqueue function
> calls xe_guc_log_snapshot_free() while holding the ct->dead.lock spinlock:
> 
> 	spin_lock_irq(&ct->dead.lock);
> 
> 	xe_guc_log_snapshot_free(ct->dead.snapshot_log);
> 
> Calling kvfree() on a vmalloc pointer triggers vfree(), which can sleep while
> acquiring the vmap_area_lock or performing page tree operations, potentially
> leading to a deadlock since hardware interrupts are disabled.
> 
> > +	cache->data = NULL;
> > +	cache->size = 0;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261006175129.3366784-5-alan.previn.teres.alexis@intel.com?part=3
