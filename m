Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D13488DAE
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807930; cv=fail; b=V+voxh1Q/MikzaM9lKloSiScIW4GhnFa20P+200yZA3InsVwS7cJJTOmJz4yYVXZxe7mRYCehiAR93MHBfmDA4ct8QT+zTjV/z/3GGWBYtnturQUoZlwYgcLXpQO5wTjaNz6AeZoS8Rugtb3zQqEia2NvEiBksSamkNFtDc6aOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807930; c=relaxed/simple;
	bh=lOi8ovjwK+/YhX/jV127a8KBku5C5KDTF+5HYmAaUKU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HvZU7cAwnRlyCG+zguyT+oQpNtffRsb3Z6SKdjDSUlcHE0mQoxw56hrvisMi5Wyfdexq/w2VkPPyHbMAOy2VFIW44X972L+KgQ5cja7814Q9vsWz5TR2Dl1VfpOo324QIWWD+sARTpwsLBTL6dwqVf4URY9q964BXbHb1usoXTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XltwQr3d; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XltwQr3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791807928; x=1823343928;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lOi8ovjwK+/YhX/jV127a8KBku5C5KDTF+5HYmAaUKU=;
  b=XltwQr3daCVdEsgTd64nZM5S2xkLkriUGHReseD07AQIrXJdBRlgggX7
   7xoIS4AXUGc0qiX5F5QE5RK+caVA7m9wJMqgmkLqq1gEfEhtNwTqFdVAJ
   2Z2BLrpK77dNCy22QepseNiIaKby9Q7GeGFQQK4FYs02OmRqQDza/b7FZ
   ZYYbQptTSU1FELYMut8WEd+y9Sa+HK9YCHLD0vm98TFYxsHmotoS5kGW8
   BEb3Hep5ZhOJgCSfOvSkexvTf3sFi3VeT/13hfe4rfs9cnFpA6A46Hdfi
   vmhpu6qPlYaRFP4JJGshUoK13AkoRuN5vX6njZaSsvIFjbUy7DgKHImIu
   w==;
X-CSE-ConnectionGUID: CQ0xTELgTju6OJGFCd3ASw==
X-CSE-MsgGUID: iPoXWsOqQd2wzsCX1Lz1ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="523541"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="523541"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 05:25:27 -0700
X-CSE-ConnectionGUID: vw5yvHcKSpK+gMI4cfofWA==
X-CSE-MsgGUID: U6L5DVRIRQak/IFpoF9tqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2652251"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 05:25:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 05:25:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 05:25:27 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 05:25:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmrtRFZozCXzhfIX3e+tyMEFoRvOqOXCun+R39nILS3kb7qRs/VyzdTj3m8b1tgMqJvstxc634L+TC/FywTmVA/rpWc6xDPT785ZS6gn91gKjDgWyGbgchYRsfxGHPxQb11EvSvhuPnA3h+dQ1KsSE/9HN+gpUdHBsaKIVlHAHBqv82oJk8NIevjoGP8M7v0YZjj7M+N/IAc0ErZN93jQhGW04CSMiYRXqjIVieVbWH+65CAJ/Rhfozk6sfJ9/Bz9BBxMGP6Hj1rEAs0kdD0LPNeUCyLetRDlQOMSPN5awwHApvVMXGOqy9/fpenYE1y04bRj0gRdp7hQWxzSTOrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h10eeJonfR+OijLKu+LLcR2XEL94/Y3GScSgTkgCCIc=;
 b=uiMOGd4abYVX+MmZNU56Di52PvmWX+dR/GJktVd59RIObVYHog4nSB5zQVC4XZDXLqu8x71kDUNVuXps9vSA1fYn9bcDncbRvlLQe37+g6N2sWi9jspAYHZ24nv7nQjfgCgENr1MgVMUSrwu03SZRSNNz+5EIbcuxlKF09+rD3QDOd5b43tkEpOw79OyW00uZeqfftRtdvTKK553yx+8+ZhkSfNVQYdJt9HL7U4D5V6kiWSOr7iU7a4caf8eNkMJ4GcNaaG7zvws14Mo77RiQx4zjgyCza+Fgwm+Ju7gS4IH4rlKrkIGF2nxFUxhqSHrVTyEpYFJNg3GOdF4iMGExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 12:25:24 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%5]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 12:25:24 +0000
Date: Mon, 12 Oct 2026 17:55:17 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Message-ID: <aszRrQMKGNnrAqY8@bvivekan-mobl1>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <sashiko-outbox-165849@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-165849@kernel.org>
X-ClientProxiedBy: MA5P287CA0323.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::13) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH8PR11MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c96b65-a906-4dce-1f7e-08df285be3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|22082099003|10067099003|261009223027099003|18002099003|4143699003|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: dEj/4ckvlbrlu09dDjyVxkwTaVExjJdfk0lj1nsyo1eE9s4/KmWaUpBKQ2becBKEv1HNcdrfyTU/A4ks2oHwQ/Ea/wIvxF/wVjX/Atrh0xuMD9y911hGLeKZUSHIx/dzcnRGqYOxq8qq3m0PTngW1z7j7WZcDXXy3BIg6bPe5zf+KcuoYbIneTdUzk4fo/QlY8RzIEktK615Sbg5PVQoXyqnHVFPCFrjfI8ZyA3OHTnfXw8qzy/qxlfBXGQs67L+34ZkFcbdX3V83Df7QyuPBWdhZik2vySfrEcb9XzFAfV0Iutn5MHznhnPztW4wN5qTrKZ7EAoIx0kmRFkhbdhzDhWq54rQMnaplbKhM2tzPdQv0sYTKvAjCbQCF+g+axh9TDtVecxkbkxFaqjbeJ7EDjzsk3Xugu4fnYN6dnkn/XNXIBjkSSBeC07md9ceP4z24sbXf35uJKQhEIqv9eGqEnOHJFo6zy1I9QxCLeqPW6ztAUCOx3PJQedrHWuzBVJGlUqOzLbN8ZC4gz+6LcqB4rc8tA0xZ3sZmF54te9n73B/K8Jj0ZtmodFORbn37JjQreXAla0KxBn9MM9VYUtkGius3Aua5XgJc/1c1KmUuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6974.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(22082099003)(10067099003)(261009223027099003)(18002099003)(4143699003)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGdkK2lWSFZXVHVaaEJtQmxmMkMzcEtEZ29YSnBkOER1SkRMb04vMmd0REVR?=
 =?utf-8?B?QXNNZkVVSXBpY2E4U1ljbDE0aUhFam5ydis4MjBsazcxOVhOaDFaM0FuUFJJ?=
 =?utf-8?B?WWE2T2FuWFpkMGpMSWZzZ0l0NTdpNnA2Q0N5eGxwMlZFZHJOSGZER0hVVVdr?=
 =?utf-8?B?VWh0NlFoc3pQcXlINUtzQUpEVEJjeDF5ckJ3NUlhLyswVEoyMXJWMTUvdFF0?=
 =?utf-8?B?MUhoaUhjVktLRDJibk5qSkRHaDVGOEFwUXZGdkpraWVzSTNPWThMakY5U3ZS?=
 =?utf-8?B?QktvOTNUczlpUkppc3Z6S0E0b0E0dmE0SUJxRWNKdVlsVmFqa3YzSjRPV3c5?=
 =?utf-8?B?d0dtaEtMZGg2S25rMlZFdmJkRk91a3FTWDRsRlhwSlNqZ3pNMWNlNmY5MFY5?=
 =?utf-8?B?MmcwQjFpWTdKUGd0cjN5eGJHcHh4QUpuckxTRU1sSmlzaDZCZkxNem9mejBM?=
 =?utf-8?B?d2ViZndvdEx3blplUXFpOTZLZGpmcFpRSlhnQVV0KzQwZ0JnT2xXcmJiVWJ3?=
 =?utf-8?B?U1pnRlg3OWVNMC9CQjdhbUlkVUlnQ2VYSnBlWmxoaHFyeWpINm15RDFNWUdn?=
 =?utf-8?B?dlBLT1R5b21BdzE5Y0xWNW1JY0FxbW8wdUU1U09kaHRDYUVORzFtVFpjM2xO?=
 =?utf-8?B?NjF6cjJETDhkZ3dMUDZ2OElXNzZkQTMxbVFzQnpCVmY5R215UHdyMEU3ajJ5?=
 =?utf-8?B?N2VQU0lZbFliK21FZFFTNVl1Nm5aeSs2dVJKbUFvb0dWdGFuZE1jNFg5WFNo?=
 =?utf-8?B?eTVKZkRXeFBWdXdzcVFkbWwydFRZRFdveFp0LytlY3VRYkJtVzRybDhiMVht?=
 =?utf-8?B?OG9Jd0lpOWlTc2xDZUp2VVR2TGE3V2VMWnQ1RWp2TTJmSWNoRlpaWlIyazVt?=
 =?utf-8?B?K3V3cUxVVDY1eWRFeTRWS0NKQVl4YkZLUGc5am8zNmpXYWxpNHJ5UjUxNWdz?=
 =?utf-8?B?RFlhbndGY0dFVnRkYVdjRWFVc0xPSVJHQ1RZcWhJNHRVbkZ1ay9QMk1RV1pV?=
 =?utf-8?B?SDVMbldsNktQb1MrVzdaQnBNd3MybTVQd3hPSGpQdFNhZTFZbDZlaHBFVENr?=
 =?utf-8?B?RHZxUlpUWHVEVWQ0Y2VZUm5zRmxJR21BR2xrdmFweGtXc24xYmorZjlpR2d3?=
 =?utf-8?B?SEJtc1liSWxBTHZCOEpPSjVMWkN6TjAyTjBWb1ZZN1lwa0laMDBDZGxqWU5B?=
 =?utf-8?B?ZVZrU3pTamJRWm5BZXFXVFB4VG9WM0gzYmphUkh5RndBWGhoWTdCdHgrY2g2?=
 =?utf-8?B?VkpwS1g2WTBpam00Q2t5ck5FZm5oV0Z3RjY2aWRmSnorTzYvcU56bmdKWGpW?=
 =?utf-8?B?V3ZxSGdGazdSN01OM3dLWlI2dG1BbVlraElWbDVWUW1EcVVNcUw1RVI2VFIx?=
 =?utf-8?B?ZXZwSnBJNm1yL2VvNEd0MFZTeWlBVHFoWit6RlRJWkgxUEdtWmFtMWtsOW9x?=
 =?utf-8?B?dGtiV2VibnpXaTNWbkZheFlYWktHdDVLTDFFenEyQTBoL3laTjgwTVA0eU94?=
 =?utf-8?B?RVk2bUQxVHRyZVRoK1VORzZIUjFCMk1PTjB3Q3g1MUJjQnprWGtaVFJaL2hq?=
 =?utf-8?B?ODhhclBidTA4a010ODdvTWhrZVJFSEM5MVBRY3E5bHZPZEYrOWl6czBQNHhu?=
 =?utf-8?B?b2NueXQ4VXVPZXVIaDRRNG9rcWxhaktFeHpQS0xmV3Mwc2Q3eko5LzJ0QVRO?=
 =?utf-8?B?Wm1kdndtdHY0MGR1dlFmZDEyRnVYRGpTbjJ3MDZaNng2MzJyUndJVi9QOWtZ?=
 =?utf-8?B?MXFvRjJsSFdNTW5GK1NleWoxQ0QzcjUrRndHZU80Nm5Jb1pqd20xZVo2TUtZ?=
 =?utf-8?B?U3FXL0VyejVINVhYazgyc0Foa1Z0N1p6VmwrNTZCNWZQVUtWRDhwYXVzb0pQ?=
 =?utf-8?B?Q3hXL3JDVXRjK29Yc1BleHVORHZIeFZEUEIrUkN1QTZpTlE5UmU4bTZDTmdI?=
 =?utf-8?B?U3QzdjU3UmxCcHpSS2ttZEFqUXdGRmpkaHB5YUlPVzB4aUh5NmdXNFdZSjFp?=
 =?utf-8?B?aGNvNzRDZkovcjUvOUl2MW0rQlVrUGU3d25EMHIralV2SEhDeDNMenFNNWoz?=
 =?utf-8?B?SVFmZ1cxZlN6eGdKNXl5Wnk2azE4Y0tEUHZmUTNEeE9uWlJxSjQ0SkpMKzIz?=
 =?utf-8?B?QnJQUzJRS0dZWVNmNEdVOHFHV3g2U3Z4SWNsQ2Vpb1QwQ3RndzVONXRwaWhv?=
 =?utf-8?B?SjVqVFdWLzJhWHVSbXhUcDlZeEdmL0sxN01XVTltVG1PWmxCcFlpVDNRNkZG?=
 =?utf-8?B?NmdZSUttbFpXaWlmZkFqblhRZ2d0Z1h6bTJWbytSdVlVbk1nT1Z4YWRJR2Nz?=
 =?utf-8?B?VldubEYzY3ZPR0oreFBWY1ZDejN0MjRJWjBacjJOdElsajJOQTMxQnc4clpU?=
 =?utf-8?Q?lzSrQbIELbpKhX4T/NdFgYwz0nGkWrCsXaHJQ?=
X-Exchange-RoutingPolicyChecked: Vt+sf6LwrWoKkhj0YlnHLgDDmHoy3kFysMSLYbSBhHLDVPYDOKTUTSE3oPaszhIg8jPp2zdl7XiwU/1i8mcI4EmJRH9WwqL4MNExcIR/5RdKxMMq3nKMvN1wckHkTFUPloLxsaUkcqlOWJ9yklvJl99AtdlJCK8bQd+pkBfJtaxJdvA2x8DV9C35+61SNRkhs0IdpkSxvOfNGa4L0gcSW8+fp+PBlyEAw28oCSdDvLWLTFkvs5L1D8SEDQUepafmQW8VOVYhTvXsvbivOHl/nEinIDQXEh5+Ax+dDJxTUESB5TiuFXFEkuMofhHW/ouZqJDOGBdHEuGDcYR9PIMOuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c96b65-a906-4dce-1f7e-08df285be3b7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:25:24.0598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCXJgzJOeVFAZyMlAtApeQiKQl4RkBCBwLSPVLJdhyBA36YXP+5rNd3Q+67eqjmx1cZ5K0NG+r78+Ng4FArbbnQtMkPg9e0TwejQ24hmfeMQSdGLV7vu+oIrlJ2PcGtb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
X-OriginatorOrg: intel.com

On 09.10.2026 16:47, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/xe/i2c: UAF on client devices when i2c_designware is unbound
> --
> 
> commit acaaddc70630047a3af20f747eb4eed375a715a1
> Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> drm/xe/i2c: Fix use-after-free on driver unload
> 
> This patch fixes a use-after-free during driver unload by replacing the managed
> software node with a static struct software_node. It also modifies
> xe_i2c_notifier() to match against the parent device instead of using i2c->dev,
> removing a dependency in the two-step platform device creation sequence.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > index f4f3819882897..f0566129b7e70 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> [ ... ]
> > @@ -98,7 +102,7 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
> >  	struct device *dev = data;
> >  
> >  	if (action == BUS_NOTIFY_ADD_DEVICE &&
> > -	    adapter && dev->parent == &i2c->pdev->dev) {
> > +	    adapter && dev->parent && dev->parent->parent == i2c->drm_dev) {
> >  		i2c->adapter = adapter;
> >  		schedule_work(&i2c->work);
> >  		return NOTIFY_OK;
> >  	}
> >  
> >  	return NOTIFY_DONE;
> >  }
> 
> [Severity: High]
> Does this missing BUS_NOTIFY_DEL_DEVICE handler leave dangling pointers if the
> i2c-designware driver is manually unbound? 
> 
> If the adapter is unbound (e.g. via sysfs), the I2C core will unregister and
> free all connected I2C client devices. Because this notifier doesn't handle
> device removal, i2c->adapter and i2c->client[i] are never cleared and become
> dangling pointers.
> 
> Later during module teardown, the xe_i2c_remove() devm action executes:
> 
> drivers/gpu/drm/xe/xe_i2c.c:xe_i2c_remove() {
> 	...
> 	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++) {
> 		i2c_unregister_device(i2c->client[i]);
> 		i2c->client[i] = NULL;
> 	}
> 	...
> }
> 
> Will this explicitly call i2c_unregister_device() on already freed client
> pointers, causing a use-after-free crash? Additionally, if the unbind occurs
> before xe_i2c_client_work() executes, could the workqueue dereference the freed
> i2c->adapter pointer?

This needs to be addressed. But it is not a regression from this patch.
It was existing earlier. Need to be fixed in a separate patch.

Regards,
Bala

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261009164241.923756-2-balasubramani.vivekanandan@intel.com?part=1
