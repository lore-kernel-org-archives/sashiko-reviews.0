Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793121190;
	b=WKTGMghNCVzmoMW+Yxw7I2c+VvTCJPWLmLVexDox/R24aF0ikZb8pNpo34wHW+MiUwHp
	 pQmOEm3MuP359ZeIdvEr3rqljVUjkGrxVutdGWVCQ/rkQvLqY5RD9FAU8sF4eSCoQ/lao
	 rqmAkEPgIRQzu7RaX3dx42WxusC9qyHVIOgWbZRfff6OmKnWL0lV7/SR8sM8cnRRyISCS
	 cK/g8Rkh027NacJr4IrBaw+Ni0EodwaWo4UfEwtkPAvPZfKXj6O87ik2MwBDjZl5n/V0V
	 nOs1w92ad0lcTTnr9mTcVUG8AAEkSe0ZR2f022nn604mdhyNLwfiYyQQ8q9q4RcUVPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121190;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=tqLAkLvlhJuyHR7LMprLFwqReNkVc9lC8MDBUvJthr4=;
	b=I0ZhzmyW+/IdL3mIZq284R2hn3AuTX6IrLEHAYd/cLnRrw05tekhTE6pnchi2NoVUT2s
	 fK0cSy2Rp0Nuo6whmjEO2u1e/T8i4+DMCwxnw8LIDR1a/qZhlyG23+O8Pup2dKpUiOeSm
	 wxwtI9HjsFGFKZTl8NrKYef30XhGZxxxC8rNMgfb2rYi1TrFr0o8OsrZXCcz0bSy8cg8t
	 R3lLijAW+SuEYjm2XDa8/VXTQ363F6AQoTJYUoAot6p43ttR5inQ422dbA+g7OhUY0kZz
	 uZPHVcGyfgDIcNy3KskTK5mmvK6L1JsJdDrETG1ub9BofIGdVyzLkKYtrfojukOKXKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e2QQz7Ny;
	arc=fail smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4591F606A31F
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 17:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4591F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e2QQz7Ny
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793121189; x=1824657189;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BaSnvLfw3RtqOflobHytcfPQKpCZq3RvaYQibQ5SRbA=;
  b=e2QQz7NyY5NsNAdWYoCZNwyiIXVbUS2ONEy+HfAdgPRnofRYmr8MjiRZ
   1JVLBlwvRXvYA2v+UNjHZg7Ospm8Gtt9Q1ChXTHBShmsgZLD8vwroa27U
   Kyhq8J+WFW5t4mcz7woKbPlyX3eIkF5wIfm6OecC3Ln2evaWdL6fr/gLW
   qAy5aj8UabYqg7eRy9ji0M/Z1bEP0gEcAzYEeWiFYDWIENYA7VH2k5kcD
   Qu7MUaYbtUGyYB10xfS9VNqyedcIhmUPxm1Bu0f/OfnzRRf7ZqZtXnxW8
   88+Gnhf28bPp6q3xzcT8p5sAoCDw6IZ1QQHk6uhge81n+H3FNWVVnwY03
   Q==;
X-CSE-ConnectionGUID: 5dVg64nGQ6qr0S0NuWgw0w==
X-CSE-MsgGUID: /ga7UcGoT4i5keizRVIJjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1815134"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1815134"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 10:13:08 -0700
X-CSE-ConnectionGUID: rTbSIx+KSY2XEKmV5H2TZg==
X-CSE-MsgGUID: vFQKM1XZQfaOeB0eLBALmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6468435"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 10:13:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 10:13:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 10:13:07 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 10:13:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URYHFJyR5qUEmkOTHvnjg0Ty4lOeqdEKHSn1pmjfhYgAIj2e/QTxsuQOdQsSz+PHXfgDn2+6FWsBK6cV82N/3l/Wp580QtQGjP77bHszwyrxrk/0t59t56wwS3zrdUD2fSLZ5k2DbOczQ2mpQ32hPfw2qsP2Am/nPaH7mjft6VJTEvRnn59DRn3M6HNhjiCe9+G8JCGm+3GVauURnP+VsWhO++7ka6IXoxqPgtsfzPAl5kDH5uA3kEUBNyje4RcwYfmuK70U5uhxpvxAV9cJjXvIiW120qAE5PEm/brpWuwtmuXQVIPwCYSu9Ym9QgrJKYHQq0FTKVbhXVcK12nUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtINbuI/wz0zrPu77J/iIzeJAV5U6TmVcRWBjFhuki8=;
 b=h+xzi9PMVIhH0RHq2UDp2VFJpnz5Z9UHapTGE4iWPMr84o1XtRzcg3wpO83mxWWqzXNY0oJ0eevAqHU/GOpoGn6L6iSG9AHEaYBZeXG1ux6IHrGFmT2oBIcYDPAcDOoJ/9hSSa+GuOxy8xeu3ZHXJEFpMz8GDncix1mKllk/oiqNhB0k74wMbyXYcmqwd/GWD6p7WBT76cNNszAgWtkDaZOl+wN9KhM0txoFgCUZesnReFI7L8G2FaEtmrJnyCLIn1RcebVILp7B55ZmXLhU9KTtHFtg/u12Fb+EvUBYmzQc2asuyUooG4ogRJDcYI7z2hlcY5mRT+Lrs+aN7gG2jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 17:12:59 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 17:12:59 +0000
Date: Tue, 27 Oct 2026 10:12:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: "Chen, Junjia" <junjia.chen@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Unwrap sync fences before adding them as job
 dependencies
Message-ID: <auDbmaWkmhP72M+q@gsse-cloud1.jf.intel.com>
References: <20261026020721.973291-1-junjia.chen@intel.com>
 <sashiko-outbox-184600@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-184600@kernel.org>
X-ClientProxiedBy: MW4PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:303:b4::9) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: d078b490-bd97-45c3-d064-08df344d8cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|261009223027099003|261022075727099003|261022105027099003|261021121427099003|10067099003|56012099006|261026121527099003|22082099003|18002099003|4143699003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info: t+U7w21Wr5FdnQeOwkylWxjLFwZ/7g4QF10oQkqgCGshDHiJEVUYRxM7wKdWMPpZzFVv0XwNhVWcl+gEx+h+2LqBS/iV7FcSP7jextVvgwtRl0Ly7MwoYJmuaaZm0fav9vA9kyn9xKvEUNR7FCV/n3nXdlAv9eLQzzp8X+Yj//41UzK6ErYxFa7XMh5tt2hgWwOHazrBlSr6YpEyYD1rtxanztRbHQvcVD7RtFiqJfe+Jl03JkozaqIcaVkVIC5EOdmJ0N2UlAj/moHvYAJ60KqXKIsWtWWjjCSpiV02SgJy1TC1pcaxdUmp1Dp8xDJu/NKC7StCF8D9uNSeqtlITUqmkmZbXPJDJb1nPL0S4mkh8g2PXAug7Bp35H++nKnLMfzrPrym/dtqoeNBSFT/YPxvsiRU+UC3clpho+Vr94yoPu+RuumWaYh41d97tNss8MvA0bqVZKcJgM9F8sU+aDjklaF/ycS8gT52lPQwXvIQUIIbyryoNQsuWxBtFwFkBm21M8viEs7Q1JSUOMJZmQAMWe0MKjk/+9Z79nUkSIej10OcAB1JCdJhWfvRHxhLK8CoHTxkHxlNY8Hra+ZI9n12HTd/nkVj4U++sZCF2Xc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(10067099003)(56012099006)(261026121527099003)(22082099003)(18002099003)(4143699003)(11063799006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NKFoewJ4SAycCwX72U5mnAQ5vzXllFcbbSR9UQrR6lMCz8N1IOJdd71P59?=
 =?iso-8859-1?Q?R4o3qSLZ0NjXjqdjnI+NLx3ARnYAZDgOAeXsbTBTwtK7xKuLKSg+UZ63G5?=
 =?iso-8859-1?Q?fa2dJvujNF+n4iELgq16PN2fxuuwkx0l6SxTPfC28jeQhJyAkJgrXS/Tyu?=
 =?iso-8859-1?Q?whTAUIhHZ58JKmXmqrgCzkplg7niXWqBKUH2DFpknz6vdOn8B3G/9yWwlA?=
 =?iso-8859-1?Q?4MbMn6HfVY/LZb/RCxLkeDZZy51nglZB3kjzeNfdgxeFNcsbqWUidUHiuN?=
 =?iso-8859-1?Q?5Y7nPGp6yzSRT8+xJXsX+2JQ0RwQsAwG+kl66Wv3OelTgU2fGo/yrgn8lW?=
 =?iso-8859-1?Q?koFEPEeGimGK1sTD970fFdk4bk7t+qgIp8YEszVy9/x4iRbLMwggIxMjne?=
 =?iso-8859-1?Q?ijTmTeBIDT/UeyyQdDR4DF9Y1vTZts7HNAvu9IRx34g9tVTF2aByYsefBH?=
 =?iso-8859-1?Q?qAV2FRsUhaAVHjAyoPqH8EzsUFeQImmGdwsCdeuYA2RcuKuJRoLFYr/T03?=
 =?iso-8859-1?Q?KnNVM5irzPMYKvRxKsA/jMD3+dXD3fJMrcbMii6CtAfBLyOrtDaeXpsx7p?=
 =?iso-8859-1?Q?tcVLhOAwjIfFzH+SYkyRGWpTgQIPBgBHFSpOFQb14rwchKWLBsV4B2jSBv?=
 =?iso-8859-1?Q?3RRIyrNflWEFTyWzGi7rfgPZcAH+6yGc7P5mVtvcw72gPChgmoPJPM63do?=
 =?iso-8859-1?Q?5EDOsORNyAbXrNxEpzkDNy36+RutynZDrxmztHBbuyNbcXBnp/KmFu9vA/?=
 =?iso-8859-1?Q?jiDdwyBQmiga5Fkr7GwF7ogD1Ce2k6X0THQt0O1IXBORGLn7wkgBX1lqMS?=
 =?iso-8859-1?Q?OqVahnqL7uVuFFzIdHVdcGYwmAdggp910v3ICNwPZpeNC/m5PQgZEY2C1S?=
 =?iso-8859-1?Q?gLaFycz+OJ1p5eGEosgzLeqo+GcbANgAPCJIi8O7D9sAwrX3HfrQTL2SdE?=
 =?iso-8859-1?Q?4uuff9p9c7xYY2DC4LfkZR2eXMSYDB6JbzeXP246Moexvv6zN0iVRGUrV2?=
 =?iso-8859-1?Q?WB6a7vajI2DTwvhK3U0EtwaC3RuoprUFJBglLcHb3f//0GKu7g88UAcdwj?=
 =?iso-8859-1?Q?FnDV48ksbap2k1xPvcy5qQ/o1NmNOGs8/uDZfwBAhA1IS1yb5o8pMH8Rv8?=
 =?iso-8859-1?Q?Qn9l9Dq1J9irik2XJPnF6xPVIpfqj5eWM08EIGxQZJipJDsU5AadHNmc2E?=
 =?iso-8859-1?Q?adULNXx8wGHRJwzTA7IYkQ8yXhE6PcHi/19947Mv1agTDbhMbUQtnKxUG6?=
 =?iso-8859-1?Q?CIBxuq8UBxy1ffks9kh0DD073qkua8ZgCCenwE4cMJe1tWxBQIFCoO4+BV?=
 =?iso-8859-1?Q?L1XiEVuC9a+Sb2KlMDioQ8wpDcoO5urCbSuPb2bcSBelnvCbmEnQShEaKL?=
 =?iso-8859-1?Q?lAimIExWlYugU7vwItSMZ9hfbanQKrxdfnt11DhvTtoA8rbwROBm3LBLSb?=
 =?iso-8859-1?Q?9V38HRWoMsCIAvQ5ohwuoX1CEIRA1CwKGxH/VNpiSq+QYRGys1z40EwqaI?=
 =?iso-8859-1?Q?P6/JKvi4x8NKyJqxAoxiykrEsr3R2JmBjF6rycLwJeUJc9daWFGBKuYKhB?=
 =?iso-8859-1?Q?12m5SkeUfylwC84qxM9ZpOl+siIbNh7e6YU2dro5Mg63jPyc+FT5idCKXu?=
 =?iso-8859-1?Q?QjxEyj65epYKiclycBrpPRlzeQA9zpQo1ceZ5yjNhMZS1OEhMTt3dyRXUW?=
 =?iso-8859-1?Q?QnPyFPlQupl+pX3IXxE736Z8M2md0WlDT0UeYdyCppNAVv4+i2mXX0+oCj?=
 =?iso-8859-1?Q?D29Lbaz+SkVV+TozWOGRSCoemW1LQXxRoW+1EjMWc2YiNVLSyOfmQhTbKd?=
 =?iso-8859-1?Q?TwUCWiggJQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: HYigUlgfpA7nVU+nqR3lTUCsJlhz2U6MUQwSgJAw01ihcHlG0WJLzb8jo3v9iI+NgkkoZj27jJ2sGuJdH3UjN2oKHu8tm/XQrnp04XtTQZdGE1iJTQFvXDDq2+HkgUIah2G0g3G72jDJyB8toWepfOoQwvo81mdRiXlcIxtPtRJllbLQ2advhjl/pXbMJ11Mu6+tk/FOq4C7T/spukV0caUQCP4qA7kj48LTJ9Lkvi1xgOhhUg1py34Ae4af9M0WqNRaffljvEuuneiUrxFDHCq+PELqVK5fadKB+1zk9QgE8E7wjcF8N5/vo5ZEtk11trTIee1aXZi+bXekKjMuhg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d078b490-bd97-45c3-d064-08df344d8cd3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 17:12:59.1919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wX3RzOSBzYI0MqnCvNEH3905GB4iXqE+FvXeXIt7m0hIm2S7mWWwc6NL6n+Ktv6bEsAgixpII0U+RQdzZz07kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
X-OriginatorOrg: intel.com

On Mon, Oct 26, 2026 at 02:24:16AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe: dma_fence leak in xe_sync_entry_add_deps() on error return
> --
> 
> commit 7c1f1992f566aa87fc231ce7e528d8b1c35d0686
> Author: Chen, Junjia <junjia.chen@intel.com>
> 
> drm/xe: Unwrap sync fences before adding them as job dependencies
> 
> This commit unwraps fence containers in xe_sync_entry_add_deps() using
> dma_fence_unwrap_for_each() before adding unsignaled underlying fences as
> job dependencies via drm_sched_job_add_dependency(). This allows the DRM
> scheduler to recognize same-entity fences wrapped inside timeline syncobj
> chain nodes instead of treating the container as a cross-queue dependency.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > index 06b1c913588ab..73fe7f05ba166 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> 
> [ ... ]
> 
> > @@ -233,9 +234,30 @@ ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
> >  
> >  int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
> >  {
> > -	if (sync->fence)
> > -		return  drm_sched_job_add_dependency(&job->drm,
> > -						     dma_fence_get(sync->fence));
> > +	struct dma_fence_unwrap iter;
> > +	struct dma_fence *fence;
> > +	int err;
> > +
> > +	if (!sync->fence)
> > +		return 0;
> > +
> > +	/*
> > +	 * Unwrap fence containers (e.g. dma_fence_chain from a timeline
> > +	 * syncobj) so the scheduler sees the underlying fences. That lets it
> > +	 * drop dependencies on jobs from the same entity and only wait for
> > +	 * jobs on the same scheduler to be scheduled, rather than waiting for
> > +	 * the container, which forces a full GPU completion wait and drains
> > +	 * the queue.
> > +	 */
> > +	dma_fence_unwrap_for_each(fence, &iter, sync->fence) {
> > +		if (dma_fence_is_signaled(fence))
> > +			continue;
> > +
> > +		err = drm_sched_job_add_dependency(&job->drm,
> > +						   dma_fence_get(fence));
> > +		if (err)
> > +			return err;
> 
> [Severity: Medium]
> Does returning early from inside dma_fence_unwrap_for_each() leak the
> dma_fence reference held in iter.chain when drm_sched_job_add_dependency()
> fails?
> 
> When dma_fence_unwrap_for_each() starts, dma_fence_unwrap_first() takes a
> reference on the head fence and stores it in cursor->chain:
> 
> drivers/dma-buf/dma-fence-unwrap.c:dma_fence_unwrap_first() {
> 	cursor->chain = dma_fence_get(head);
> 	return __dma_fence_unwrap_array(cursor);
> }
> 
> That reference is only stepped and eventually dropped as
> dma_fence_unwrap_next() walks cursor->chain to the end of the chain via
> dma_fence_chain_walk():
> 
> drivers/dma-buf/dma-fence-unwrap.c:dma_fence_unwrap_next() {
> 	...
> 	cursor->chain = dma_fence_chain_walk(cursor->chain);
> 	return __dma_fence_unwrap_array(cursor);
> }
> 
> If drm_sched_job_add_dependency() returns an error before the loop finishes
> iterating, should xe_sync_entry_add_deps() call dma_fence_put(iter.chain)

I traced this through and I believe this feedback is correct - upon
drm_sched_job_add_dependency returning an error,
dma_fence_put(iter.chain) should be called. We probably could rework
dma_fence_unwrap_for_each to be guard based so this happens
automatically when the scope is exitted but we can look at that in a
follow up.

Everything else in this patch LGTM.

Thanks - Matt

> before returning err?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261026020721.973291-1-junjia.chen@intel.com?part=1
