Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4892055D876
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 19:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894576; cv=fail; b=AYI8j5OlPIAEa7yL8c9IEznJiZb2L9FLjhEb80suJSFlIp+fROIuOlSi6ySwUImiyMWx/YbfwY/7Xcjv0+g5oH4CKrO4De5HiAq3y5HJpHHbnnFY3SmM+gN5L3eLon7dw+v/4+v2il1W8WE2bO3LBG/z6lCtz0DgPQnT/H4Fa30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894576; c=relaxed/simple;
	bh=3ddy3uhDqk53++YLirAcTFvhNoG1X8Lcrp3cDmtqVyw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BkkGXLwbihAfGI3DIW0NB3DylwEnoGhnmBO8QfLQJwgyBqAxdD5x0nkfnhu+QubuBw9ZFSu2Q0oyd+2Jj5YjeU8eiuqmopRUQjp91h/AvTv/U6zPe6jUOUZ89Y3fgUCHKhydj+z/xkNo0x3cA9iX4nF0uWm5ioShs9tXNdmftfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mj53ebGy; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mj53ebGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788894574; x=1820430574;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3ddy3uhDqk53++YLirAcTFvhNoG1X8Lcrp3cDmtqVyw=;
  b=Mj53ebGywDq7qBf//XNtdqGuUk7eixrfZGA5Di2bN9xP2lGGu000mQiJ
   liiekuZjVGsyGMXa/dB8+FXfYnD6/MSjXprPi+miP1g2kLLq3l9xlzQD7
   i5ty3UaIsRa1pCVMY0Av3UnxQUGFq2d1noxjTiCfdO+xNeDqzh5BsqmUB
   G1MC90byn8dxBSXepiXddWas1ZoT1+2b0jhBRFl/IVAsZjgG6oH9ZmsBB
   8xyKoWupqWAGd4RmcGPTUuGQ/C9pl5bauEWJIx1t66l0OODZmRYXP+R2q
   yS4se+v5ltJdRO0H6DoHB7g5i3Un3lGYGvCUh+t3V1aqB7wDOqpHG/ikI
   w==;
X-CSE-ConnectionGUID: fa+iC1VdS1yKsdWh5T/qGw==
X-CSE-MsgGUID: llh307COSEKqnfEmPqgz1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93129678"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="93129678"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 12:09:32 -0700
X-CSE-ConnectionGUID: R35doBrSStOyTUyfuQtDcw==
X-CSE-MsgGUID: AIfxKu5lQQiBCGscY7Dfyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="267844571"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 12:09:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 12:09:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 12:09:31 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 12:09:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycHOVdKJOaGOLkhpQ9P0CIuWPXWaXYezl2mK7i9c8uLfspjHLIZlbDf5JzO6Qap9xK0Rh1bzbJ5sRyoHLNHoJnEjP+v2BLWXovgg8027WdiPVsgHSSw3tN/f3YlKeXcaDNrGyo70gtP/MgVw4G5OQkkoFbUFvx0AdueyauXJyB6uH7kk/748Hr56o3kqlBw9ZQ65utR8lnaAvvmDR2c4coBWBXnmaxwJ9e+ilh3zoPy7WOFoCQO69dyjb9xEEIu6jrv0r18n16lIVZMSc9I7hljqyzUjsxuW59nu4vrHkXUn3BTUxHkKtt3fFKDQ3s0hLXfln0HG2v2l3trp8ehisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ezI528kdRwrv1ytSoZzvqiCy/IWQ76R08WY6GizAk4=;
 b=BEEPzgjtyqpD5BUDx5hFaJFeUNgK/ANSwl7aEpEHLYYHoDSXobptW8jMSXwOlEhTE9GZ12WlJJJrRZ4kMs8GQEaxRmK/QdEyeodf5iMs28ZOolsGVeIgn116lJBTFKLF2BbzRwIrzAVPVVTazrKQt7w2rt+cDDkClgyYFWoyxsVOU22REKfaOVF5YELHg7Fe0RGuVCHGB8dd9+pKxDufDRwq3BotF67V/p+wnE6S3kHWVmoHazofmHIrQhHgcVuWunRzAa1y2JWWhnIoP6fmUm0+FBi1MzSXSuKjr20b04U6icLi+28bhWgwSiqnXbQEppF9ThYBlntWS3724PPqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SJ1PR11MB6225.namprd11.prod.outlook.com (2603:10b6:a03:45c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 19:09:22 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%3]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 19:09:22 +0000
Date: Tue, 8 Sep 2026 12:09:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [V3] drm/xe: Skip clearing purged page-table BOs
Message-ID: <aqBdYNhD2b+EKCUy@gsse-cloud1.jf.intel.com>
References: <20260908114545.915049-2-tejas.upadhyay@intel.com>
 <20260908120458.6D42F1F00A3A@smtp.kernel.org>
 <DS0PR11MB8718070BCCDE4CF62B8F94F581B12@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB8718070BCCDE4CF62B8F94F581B12@DS0PR11MB8718.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0099.namprd04.prod.outlook.com
 (2603:10b6:303:83::14) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SJ1PR11MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea48438-81a3-4e5a-28cb-08df0ddcb0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wwUtUHst9Q3JrVUW3vmpOTHg9BmIyvf/bdsot1k9YfYm/MtlGxpYLyXYLycLCBXA3BBIskbcY3Fi+7Xe7qE37vpQig8mx2tsP8WIAyNw9Z9Vq7d0gAoG5zNfdQ58r7HVUq6zbQIOs41/pHouJ/KqVaTKy2H0SiExjpinHqqnUGhRiogdCFIrrjVR8W2EBtTE2o4e8Zvjf4/HY3O/+w1jaOmtLqVh/MNHB+2Mv7/Iiv0kiGOU6yv5zB4x5yeZULUsO38KqijgUeWucVPS7SxFmp1A1g/qikuYEcL1obchLaz6N84rcK6YInVaDneC2OPiBSQ0aFU/UjfIq0eIGrwxP+viUdaQ9CV2ZtYRKc+GOqd+m/RYvST2WqI3W9N57jeVwdK3M0ysCU5Pm7/4PWl4EJLs3DcprJMe0fwhzG+3YsTi0nFyfdek2sAjdEClqn9iTObPvyOSyyhnwggpLk1ShDn15KgPreOGJXLj7BbJ7ChqAjXHnKf10AydZoQTNUGKrzewXdhNTp6ZFqra9RA09EK8WlUCIRaBr1jxNRG9KgyDFQFt8KkIpe8TENwAYnHOYkvcJwODzZBI+A/nbt8ltVKlfUfSPvjFZVjasO7j/TA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vVR6NvmiN4+x+pRyVmong2RTo2dzDAkEPkHaW/UYOiMje6etuSCJjj3WDD?=
 =?iso-8859-1?Q?7Ndc8EIR4vnE+8sd9eAeOVCpnOCtIwT+Kfu7FFBGJE4jAxSMX8Pcno+ho8?=
 =?iso-8859-1?Q?Pb/LtCJD2gkMmuCHEvcjJ68lfOg2tWCSRQqB9e0JVlR0IrDINyTOF1v4h6?=
 =?iso-8859-1?Q?D6QuArKZpOESSUR3ScPKwAdonES6UaZaQhV3y0p+tvQHVteqQmEhFzvpkj?=
 =?iso-8859-1?Q?ejX/Q7Yhulw31zJlNFiwlG6tEkCPJ50n8vGNpbYfPCEKEjOQicsUPvcsO8?=
 =?iso-8859-1?Q?MeOsyLSoX9MjukeDEibJ7pfvykgFQnYrIvHK2GgpkU7et4gH4oIiQ5xcUN?=
 =?iso-8859-1?Q?RbpoyEiSEsUKCVERruxRnVoMkMbJC1qCSm1+0LysOh4VS1uqrb+vBXCVQ8?=
 =?iso-8859-1?Q?dIri2/2ZK0tBdOiCaCv/uksPMjlf5ojvGw2suni+RT2G5qy/3jz4W6BrqE?=
 =?iso-8859-1?Q?EviZY7lUsYSGpORvFODZBCN9MmfVOqbaHJ7cgP8dOVzdWE/55mqcAkSJnf?=
 =?iso-8859-1?Q?r13m4sbn/RwTwpeP/gzpvgno//ms05MIz0oqbrBWJ28vH+YZj6AsHxgW64?=
 =?iso-8859-1?Q?R9ColpNrnrxPCqOiaE5e04XIjA/6rJZ4WLWIhOghJkFMJ409iZaxGy58jb?=
 =?iso-8859-1?Q?mBUQC37AKqxlTDaKP63RtGFXvYYr+Ojb1F2NqE/dITcltVx9eU0/kna5yC?=
 =?iso-8859-1?Q?iP5CDdSc53fv53YpmQJDJVcsaLnfaHxFDQSvJO4JtwHTU0mVd2xevZnMQa?=
 =?iso-8859-1?Q?wYeOz+72/3FUp6/iRXZfaJ3f5ap+x3t3o24bsczej5SeS6TOZJhZtv5O8K?=
 =?iso-8859-1?Q?fIC4hoxkhqWqEPalMet4TpVCdt5cmeBOEN/q10cCINb7VxZCcQhx9HWsi7?=
 =?iso-8859-1?Q?XsZJ+wnHqkPCgAwOWZKQIVx47TMLxBNbemYX9Y8woMwGskfjjCnedkxtqi?=
 =?iso-8859-1?Q?RpqC5bjys5gYIu2GRG/IXFcioJ78pmzKlxDN4w3/TKp+EvtyYVYNn1w/aP?=
 =?iso-8859-1?Q?/xSB6iVkFYWA7qtC4bK21Eha8Y/FTMqCP9XWvo//MGDUAxdwu9vwloC/ZD?=
 =?iso-8859-1?Q?asXexXXQqP6r09ap78M9dw+haPOuWIxcfa5wFl1pWbg/iZxQ36gEFpS5Ww?=
 =?iso-8859-1?Q?O3ia9t/eu+iKk4aibwf+eNedf6y/RP4/KMlykM1fF7oAcWS9aaMrakXl5l?=
 =?iso-8859-1?Q?EI3vzjNRuDpSa9YQXTShj5oMMwMTJKH3JYR2DkKTgT3XNWACUmKr+TWRA2?=
 =?iso-8859-1?Q?H1sgZRI8q8dze8QigwgHqI4x2xaGtPNs+0fMqPR92IF2xGdBjz7GTygQ5q?=
 =?iso-8859-1?Q?XNN1V2HUOtBXe1koRH29+72pl6Qs5BIQmv9H/lRYr058OawJKgT4SVjVYR?=
 =?iso-8859-1?Q?x5op2SwQDLMlmcdBKyc3p4vFpaRgo2fjfjdm9Fwkv4iMQIgG5F4cALz7SR?=
 =?iso-8859-1?Q?2aGwbCaBRJg8uZ39EYabrcyOzqsawEOKa5hcmvmaNc6slB5nOcRXxFF9oX?=
 =?iso-8859-1?Q?eqvZp+r3/eAfpREedSoGzvNv8gI+CooqhEgGBwtwGQAE2bljDYjNKgrPJG?=
 =?iso-8859-1?Q?VA30RB1VxEl6KYWP6HfIpMyqP8uT03MqLzXrc2sPzoPn7lkriQsEG98JOY?=
 =?iso-8859-1?Q?fK/KQRhqxnv3OROvlWhlwgvKC99CH2ciJXcwkwIU1spPfha0zK40TzL4FO?=
 =?iso-8859-1?Q?pJ9+rgaU8boqJtd/YGXVKhk2CY7R3u11cJRWJ/RLXBHZWAOCqEbzrdmsKM?=
 =?iso-8859-1?Q?9gD+t4KqFMJqrGptPnAHLA2MBERPKQUK6+5el+answBy/33UAfYVfqBMMb?=
 =?iso-8859-1?Q?DghpCV7BRE5A4KRAFW+fP4ZKn4DKgXk=3D?=
X-Exchange-RoutingPolicyChecked: 5lehIUB9fFPDLlwjzzgtGPUljYeB3iknyhwzGAleti9BVdyd8d25GSb5uHMpCIeEyGSZjeZirgOBi3Xcb+iA/0JXkmmcFhXeT0hXpdwxxGWSLdGzUvsOjDnFyGnybkhWAllBtLbzAH4JH1BY8HO0w8S3UE6EyF41ZlGeUJsgWsIwaBF0UwRlaCZyBe3LgPKvRgmZJAPhaRZHQTKRygtwmxmgojNnQc1RWq5+IgJ69VN/Z3lmPH0jkjkqqbsgJamI7nZEZyhFCc3/7IYckZ8qhbOGVTaiE4Ho7JTyxLPmQaKTMybkKZ3OcXw1T6AKwhBAtPJcXrlLP2/QVpSa1k2MIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea48438-81a3-4e5a-28cb-08df0ddcb0fc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 19:09:22.4722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zA+eDfEFqdS24KE1X3QaVAmyb9Ub7nGhfCb9KY9wGT8TtiSHT90ng8Qo3k0j2VqIWHJWwew0GCAf+uEI6WLgCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6225
X-OriginatorOrg: intel.com

On Tue, Sep 08, 2026 at 01:26:04PM +0000, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> > Sent: 08 September 2026 17:35
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [V3] drm/xe: Skip clearing purged page-table BOs
> > 
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s)
> > to consider:
> > 
> > New issues:
> > - [Critical] Early release of xe_svm_notifier_lock in xe_vm_close allows MMU
> > notifiers to unmap memory while GPU page tables are still valid, leading to a
> > physical memory use-after-free.
> > 
> > Pre-existing issues:
> > - [High] Missing NULL check for pagetable BO `vmap` in
> > `xe_pt_zap_ptes_entry` leads to a crash if the BO is purged.
> > --
> > 
> > commit 70efaa606c2633943ad2267dfc95c288525971af
> > Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > 
> > drm/xe: Skip clearing purged page-table BOs
> > 
> > VRAM page offlining can clear a page-table BO's vmap before VM teardown
> > calls xe_pt_clear(). Check for a purged BO under its dma-resv lock before
> > writing to the mapping.
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index 5d990c1c3740a..426e8a29c755a 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -236,9 +236,11 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags,
> > struct llist_head *deferred)
> > >   */
> > >  void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)  {
> > > -	struct iosys_map *map = &pt->bo->vmap;
> > > +	struct xe_bo *bo = pt->bo;
> > >
> > > -	xe_map_memset(xe, map, 0, 0, SZ_4K);
> > > +	xe_bo_assert_held(bo);
> > > +	if (!iosys_map_is_null(&bo->vmap))
> > > +		xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
> > >  }
> > 
> > [Severity: High]
> > This isn't a bug introduced by this patch, but does xe_pt_zap_ptes_entry() in
> > drivers/gpu/drm/xe/xe_pt.c have a similar regression with missing NULL
> > checks for the pagetable BO vmap?
> > 
> > Looking at xe_pt_zap_ptes_entry(), it accesses &xe_child->bo->vmap without
> > validating it:
> 
> Found couple of more places like, add_compact_pt_prl() and xe_migrate_update_pgtables_cpu(). Will hand there as well.
> 

See my comment here [1]. Properly handling offline PT BOs and making
this safe with respect to zaps, asynchronous VM binds, and asynchronous
TLB invalidations will likely require a larger follow-up change. Let's
focus on getting this fix merged first before expanding the scope, as
this change is both necessary and correct on its own.

[1] https://patchwork.freedesktop.org/patch/750921/?series=173375&rev=1#comment_1384263

> > 
> > 	xe_map_memset(tile_to_xe(xe_walk->tile), &xe_child->bo->vmap,
> > 		      offset * sizeof(u64), 0,
> > 		      (end_offset - offset) * sizeof(u64));
> > 
> > This is reachable via xe_vm_invalidate_vma(), which only holds the user BO's
> > dma_resv lock or the SVM notifier_lock as seen in xe_pt_zap_ptes():
> > 
> > 	else if (xe_vma_is_userptr(vma))
> > 		lockdep_assert_held(&xe_vma_vm(vma)-
> > >svm.gpusvm.notifier_lock);
> > 
> > Since the page-table BO's dma_resv lock (the VM dma_resv lock) is not held,
> > could a concurrent VRAM page offlining event purge the page-table BO and
> > clear its vmap, leading to a NULL pointer dereference when
> > xe_map_memset() executes?
> > 
> > [ ... ]
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 9e71567b27cc7..e77ff3cf3ca38 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1876,10 +1876,13 @@ static void xe_vm_close(struct xe_vm *vm)
> > >  	bound = drm_dev_enter(&xe->drm, &idx);
> > >
> > >  	down_write(&vm->lock);
> > > +	xe_vm_lock(vm, false);
> > > +
> > >  	if (xe_vm_in_fault_mode(vm))
> > >  		xe_svm_notifier_lock(vm);
> > > -
> > >  	vm->size = 0;
> > > +	if (xe_vm_in_fault_mode(vm))
> > > +		xe_svm_notifier_unlock(vm);
> > 
> > [Severity: Critical]
> > Does moving xe_svm_notifier_unlock() here create a race condition with
> > MMU notifiers?
> 
> Will fix this.
> 

Yea, don't move how long this lock is held in this patch.

Matt

> Tejas
> > 
> > If xe_svm_notifier_unlock() is called here before the GPU page tables are
> > cleared and the TLB is invalidated, a concurrent MMU notifier like
> > xe_svm_invalidate() could execute.
> > 
> > Since vm->size is 0, xe_svm_invalidate() in drivers/gpu/drm/xe/xe_svm.c will
> > check:
> > 
> > 	if (xe_vm_is_closed(vm))
> > 		goto range_notifier_event_end;
> > 
> > This check evaluates to true, skipping the zapping of GPU page tables and
> > allowing the physical memory to be freed prematurely. Could the GPU then
> > still read and write to these freed physical pages (which might be reallocated
> > to other processes) until xe_vm_close() finally clears the page tables?
> > 
> > --
> > Sashiko AI review ·
> > https://sashiko.dev/#/patchset/20260908114545.915049-2-
> > tejas.upadhyay@intel.com?part=1
