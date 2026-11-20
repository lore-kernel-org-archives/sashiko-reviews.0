Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795215990;
	b=GNWhyqgThMmSk9clWn6uSXNDVFnVpkbw6eNshWeyrHwMUTr8w1havEr+uUggnNdfpnfB
	 Ve58yWZcNU7yn4Gd+U3D9HbF7AXCr5G0n6C9PounrdO6CG7DH1tJrAmRd/Jj4qccGYqfF
	 ftrx8sLYk/zWcTkyg27n/1KphXQXA7rUFl38lFjb09qCxgPsfIlRccEvDOnpgdMJ07FJC
	 OR+jlP/Ay6RKPQIZF0g2RlA7BRbaQMa/Gl0aXkG29Ck34Cs9vTyLaq4TUoW0UYYKOQ32J
	 Ogb6o62OzLa9wFeqbGL6WDsUAifPleecyclpk3ncyy3B3WlIQHO+yLbaQpJBfhr7ucw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215990;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Raz53hjwdUNbMJWlTW3DKReVnBpHgUTWW4o6ifMpoV4=;
	b=aa/wAuYgiIYjQ45oyhkljpCAdcAue0lTPS241LJv6CFGUjRDK1WDxv/rvoX2UKsMbZyg
	 +hV5uyGejWbxVbxT3r+mZ2jW6tTTmI76VIwytQ/Y0HO0+ushLXsFrm/nU/HpmgphOOXuq
	 9L5TTMBLYXNgbWsh6W/Q2CVsTa+YksVStzL5Yo+JuQH0VM/2B4g8SbozKVIn8lAbF+uBM
	 oBQWnYBcp7aia3pqWSebPc+GWJ9lnrKla22rYnxhI4A4gy0NCgZ9tHpDR32ebud1RhpEi
	 KKGGY3k3tw60rMnifJ3ZM2sXL+BPqXtd+63UDIJM7KJthqTNpxynCfzcNC1+W1lyQ+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hJvfKECh;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=i7+yPWpl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B3A606A32C
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 23:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B3A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hJvfKECh;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=i7+yPWpl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795215985; x=1826751985;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Fwgi6A4zfGanZcGLKMfFnwm3T+k2K0RZ3r/jlZqRAUQ=;
  b=hJvfKEChNXFEcevySpA/WKilRS3E0/PnaQ5SZW3ZBIVAnRPjye52sLoj
   p1XpBNrKk5HcPB3WOBI4l3u6Pqdkftp6AIJB4y7XpzEavaPAz1PqXDXGM
   MKFu6qyfSeOuaDzFnnyh8+JzophLCJYaES2eCUnxX6qwcQh6CP4ibV5OF
   z5EfhxySHdFLwQegDXJv3YSwtn+GMsIHOJf9RPEAEFOEVNtrK6VcRaM7y
   hUytPc8/MDN9mcTBVXa8GvYYcA0T10OIezbA5f4yPIEFMKL8Uf6u5juQQ
   63Zi7emNgbBo2fi0Av7RWdV2uGzJIuvoiNs3L30gbW/Qvu8t6DchHG1n5
   A==;
X-CSE-ConnectionGUID: LxWqr6HYRrKTf4/xtPyWIQ==
X-CSE-MsgGUID: Prn499r5TOW1Css0Yr9xTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4096953"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4096953"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:06:24 -0800
X-CSE-ConnectionGUID: ThRssnTeSCiLX58wzlLnzw==
X-CSE-MsgGUID: C4ZdASS9SNaJZwJfqJiibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10889094"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:06:23 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 15:06:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 15:06:22 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.68)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 15:06:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMQeq4QyrTeezQ4Fi3lVgxRRx7I9lUN5NVNWdwTGz3tsShhuXE0bA3fSUMCKDncfjoxCKgDdU3WqI7Vgh0ucp2frqrzQaFtERyUdJwITCBkMfQokGNjp2FoecZ3gYvxfI+ttzpgiYwqPfNElhf6hrU2X6ybh7VKjvxX5cq6UuRiM58Is2HIepzYMjMN7+7sw5to7srjhLXr9QXyq3DgjGcZ6phvRZ6NBsCv/J4yAyWrrf7n64oN5YUqHGdDBpynX77M1/hVvEsDdmbbR++4r7YCGQhGU+vISTaY2s0FyxLwnmYn408QHtsamlbnDbhU5aqobzeEYwKFz5D6btJqvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Raz53hjwdUNbMJWlTW3DKReVnBpHgUTWW4o6ifMpoV4=;
 b=VU17jqogIYljQMy4eFn+kXiCiKzjLvNvOOPoz5d9M5/BfOY7dCKAtivNt8qpUUlMRC5bJ9qlT2URk9I6FNZ6a4Gl2aoc1U6ORoJGbMw87XR2ZRk6vAgYNJMbjpsHw2hrGLeH0j86v4ROBE1L6xXUD2KGhPr16DxLmMfgeuQeaMG6g09NBDnpbpn6GBed/FhOIkcvnPiE4wf7nJ1jViv6yNy4Y7IDWUYdRcwEngX3FX+MN/l1daVHs28buYEx//JNZVOGH6hp/AMmUlWuP1pxemxcyQAa0KtEB8O7ZUlLoV02eiykIegF19tYPHovUFa7o47uC3SwVXO5ZKjEXsHeGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Raz53hjwdUNbMJWlTW3DKReVnBpHgUTWW4o6ifMpoV4=;
 b=i7+yPWplH4cF3Y3+byPJ8GHArrfbeQD+SswFbmvn3m99o77RHu9lX/pVXjkVWGHcEEmJe0YOW0t1YrV6m9FKGjuiHIM8vkMOqEsVhMs/Tzh19Oybx/LKGbAXUBXdwFxgO/TzgItx+dH2hQWPrfcvXICKnanwc01q05Lfd8Jk7uE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 23:06:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0615.012; Fri, 20 Nov 2026
 23:06:15 +0000
Date: Fri, 20 Nov 2026 15:06:14 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 4/8] drm/xe: Reject vm_ops->access on BO mappings of
 an unplugged device
Message-ID: <awDSTqFKArYxzCd5@soc-5CG1426VCC.clients.intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-14-umesh.nerlige.ramappa@intel.com>
 <sashiko-outbox-222251@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-222251@kernel.org>
X-ClientProxiedBy: MW3PR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:303:2a::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: df290993-93c0-437a-c3bd-08df475ae0e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261021121427099003|11063799006|4143699003|261026121527099003|56012099006|261009223027099003|261022105027099003|261026140227099003|261102123227099003|261022075727099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TUIBd/X+Q+cgFmBatxMSimhJk5E9fC1yKGqiD7ewT8RlMhJrakLKiYUftXw9RnA7wSI3+U1IHzYe38HEeKz01Od20TT4CDT5LstDb5lwhpnmU0z8RgeQcnp3tDw/HvLK+l9gcwkrZ5jNYlnq4A9LSr0ew0vGOFeOWqWWyls8+Sgy7ra74soUlJXvqgYZJDSaAcJ7RuQEeNHBbRNAVxoL7nLCqVGg6fRJuRqI8l2K0Y5ED0f85ilX5FQ32uK7xbYDO3Y03z0B/2Nh4Je4LXODL2T//pN4rHhPy8wkM8j/7UVLrLpVke6GAV7uYAJvBTUua7+an37aU79h1O/sypVw8ohqlmdirezWPuWiIGas44LF2gqR1+q2CM0FCedBGDGRL5g2cN6KfnikX+IhVvSjQcOunQhJZ8NexO9Ox8CR4nA0F/L1IVxE4cp7GI6q96qW1IoyUFXyMIl8b9nwmeJ417It1YSm9gg5/SG0+ZitjVi5uAIrM6iBwOOI7CcwyfC0Lle957dbpI3GKXN2h9s+OVw8XRERplJO0ZpfHI2zvwJcix8ccYzbhRpEIfZL1+at4zdrs2VmDE2c4ffiFVKq+2nuTuyjSWly7+e2U2/TOyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7408.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261021121427099003)(11063799006)(4143699003)(261026121527099003)(56012099006)(261009223027099003)(261022105027099003)(261026140227099003)(261102123227099003)(261022075727099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEZ5M3hYTVNoZkRiVGNzKzFFaCtkQURRWTJFSStkeHRNMkN6Z3VzZFVxMVVV?=
 =?utf-8?B?Z1hzbHNPcUlmRlFRZEVHY2xmNW1uaFVCa1BSZWVnbW8rVVU1dEd4Q2xsRktU?=
 =?utf-8?B?RG1HNXNONk0wcXBsdlpBV1JnVUJEREJqRFM5TzREZWJPSVJCNVhhSHgzQ3dy?=
 =?utf-8?B?RG5UT2M1OFhhTm5YaFFkNDliZmpicEVralE4SzFOK2N0L24wTHhXeEhzamZi?=
 =?utf-8?B?TmJaRUJYZHVycjlYd3RsQ1RPcDExejV2MDZkc3hYQnB4Y3FJWXlQR2xMaW5v?=
 =?utf-8?B?dXlvdEFhUnR6bkNqWlNJOWlFeUNIdFRVbjV0NDhsZXB5cnl1MkV0MEZ0NUhY?=
 =?utf-8?B?cXpGbXR5Sk9wcUNFZXZnVWFhT0IyUklzREZRTCtMS21yMFF1cG80ZHFOM1Np?=
 =?utf-8?B?dlY2WWtUMkQ4YlB3SU13VjRrNVpDMmlyTWgxS2poODB6eWV4K0QzcnpCSVZl?=
 =?utf-8?B?T0t3cGRVaUxBR0NqMXhielFzWDV3NzJOWmtlOUhWcklPU3RzRVZZMGRnaHFv?=
 =?utf-8?B?aStrY3A3MWpZNEpSeEVoSlNNaEpzWHIvMTJnck9TbkNsWm1ObllwTmt2OHZr?=
 =?utf-8?B?UG9aeFV2cHZvQnRpSGhQSEs4Ny85U2hYZWYrM081alVSejduVWkzcW54RzQ1?=
 =?utf-8?B?a25PcU5HVjY4Y24yQkFEd0picHR5eVl1ZHYrZGlTSTN4TmhsTjVrN1BLalh3?=
 =?utf-8?B?OEJGUzBzR0IzdkV0aU5LSlB4STRrYTNGSVVnMkFiR0NVK0NOek43QlVVbnRP?=
 =?utf-8?B?K2tqSTBZdWVmY1lSWXNnUUw2YWMwdkJLbk5KSDVqT09iZGIyTU9zM09oelVI?=
 =?utf-8?B?L1pDWkVOWjhqT0VCMzJmRTVyVjZTa3F3cHo4b0JxTkc5UDA1VEczNytNdUxp?=
 =?utf-8?B?TUxmTGNlb0xnWWdqSU01QmI1ZVNTS2VoZm5rMWhiVVIrNGZQQU1HTFFsRGJE?=
 =?utf-8?B?UW12M1RVN09VajY1N2hjKzJzU09BN0poZEhGdk5vVEZXY0lPUUlQbWo0Yk9j?=
 =?utf-8?B?LzVaY0FjMEt1U0t0OERZRElqYTVsbWt6eDBsVjE5N3E2bXZlS0JUdllIZDdW?=
 =?utf-8?B?ejYzNGdoTHUxWXJVQjFFb3IrZmNGYVhHc3JRWDZzWFhIV010OEpXTjR1L2xO?=
 =?utf-8?B?cGw1cnU0U01YSWJqYlZsekVLOFVaRHljbjEycUlheUVDM0V3cmZjQVgvSWxI?=
 =?utf-8?B?M0FLTStxS3RrNGkvSEMyblBBT2YvR1ZRaFpZb0ZLbDgya1UxU1NEcWI4RXA3?=
 =?utf-8?B?SUMrR2g2TXZmdlhRVlNIMFN2YlRPS1ZOaGlrR09KNldrTGFmVnhYRXQ2QnYz?=
 =?utf-8?B?M1F2UXNVRCtrMkN5cWwzUVFHZmludXVoNmxDaEFIVHZPVjF2cGorbWpKbWpj?=
 =?utf-8?B?VWx6SzltcVY0Zlg1SHVSZFUwVFN6T0dUKzFPMTlhdmxHQVo2WTRIeWorbjRE?=
 =?utf-8?B?T1V4T1JiNHFmcHluQzRrdGhRT2FiTmxLUStkdTlOeHFYRE5UWjZ5THIvUHpu?=
 =?utf-8?B?UFgwdHhBOHJMS0g4ZXZpdHlLaEpzTGhGNURDN2JaNFB5OURPQkVOOHFCL0Vz?=
 =?utf-8?B?MHlMUS9sUzJKZWJFTGh0dXRqYzFacENEdkhWVVNTcldRa1NxbkpWUm1ZSncv?=
 =?utf-8?B?NVdaZm9FRjVacHdVY2VGazVKbXAxWHF1N0E4R2lFM0Voc3FaVUFmQldZU2dh?=
 =?utf-8?B?cEZCaGgwYVYyTEpmVGVNS1Z0dnppVkpsekl5WmhTbkUwMjQwK012R3hkU1B5?=
 =?utf-8?B?RnlRaFZ5dkU1Ukl6QWhaSm5NSzdabDFqREZCM3pPVmJ0ekhXdVkvSWhSSytO?=
 =?utf-8?B?c3U1eHRDbDFaL2Y0Q2MvL2cybEREQ2pyL1c2Q01mU3ZVUXllZS8wa0RqcjNz?=
 =?utf-8?B?emJIQlNYT09FYjFHSEJBZ0ZuR0ZQb1g2M3ZqS0hvNHVMS1IxM3lFTGtzZmc5?=
 =?utf-8?B?bzVldmJ2SVYxeHpEZVBreHFQZGw2YXpuR3RkMmhsSmlCNTh5eXlNM3BPdkhV?=
 =?utf-8?B?Y2hqREROOWcwNXFueDN2R2swY2o4Q1NHdXE4YUtUckpjMW1MRlV2NU01TzQz?=
 =?utf-8?B?WGVQaXdhY0tWSkp0VE9jRnFvaEx0SHAzTWdIaW5zZWVEZTJjQmpjeWhBYzVa?=
 =?utf-8?B?YWxWdm1JWnNRV1R6bk8yUzhDSjlzWWR2T01lMUdDZDlVNkhqelNFZzlWb0M1?=
 =?utf-8?B?MUd2Z3NRYm9qTHF0aC9WeVFiSGZWYXh3VXVDWDdzTFB1Q0Y1RDE2c0l3VU1h?=
 =?utf-8?B?MUhYMjltYytUY3pHYllCODc3ZTVNbEtaRGgvSzkyaXkwT3AraFZYODZjeXJY?=
 =?utf-8?B?OXBtd2haY2ZpZnB1TmhmSDk5bk0rcUg5UzR4RVh4NXFCOHFza3p1Vnlpc1hO?=
 =?utf-8?Q?p781bbKLh/wxTuZQ=3D?=
X-Exchange-RoutingPolicyChecked: f/Y1nG/5Cdqhy4hS8BXm48AV3xG8BLKGrav+H90JK4patfzjve1awom754tH5dHzDqQ0bM0qJBGX3lrb8V/G/qHh+l8PJeyeylgwS7PZHcdAkiv8XqW9C8F3l4Tgx/vBXUvb8EXzRgco2qvOnR20g2TV23zQCTX+WRpwhmIYRtjsNdTqEWKp12xFlZuVt3CH5j4LGzcYOKMs1AlpADT0O4Mia9UUGoBF/lcazDwjqev9c/wzAmcQ2RMbGDL34zlxvH7m+0i8aGUcAeuJrpMogtHDRlbXCejsQQqf6imiBWbHAkI0qcA+lEkVL+UuO5E7SefO2VxO1l5M7u7VP+PLBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: df290993-93c0-437a-c3bd-08df475ae0e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 23:06:15.7181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4iD3urkfijTWScW3F7n4fSubI0JXj1Kq47IMGhE8Kymj7r0ZxFDjTLqvbhnHmO5KCOiRUcO8oowdZhVYWdsv41E9tKa4V2PwPRF6hxLvSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7198
X-OriginatorOrg: intel.com

On Thu, Nov 19, 2026 at 12:39:32AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential
>issue to consider:
>- [Low] drm/xe: missing Fixes trailer in xe_bo_vm_access() unplug fix
>--
>
>commit e933357c9bd9b1d3ece2d7be6b906c17ac2ef57d
>Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>> drm/xe: Reject vm_ops->access on BO mappings of an unplugged device
>>
>> A userspace mapping of a BO can outlive the device, e.g. across unbind
>> or a PCI slot reset. After drm_dev_unplug() the fault handler only
>> installs a dummy page, but ptrace, /proc/<pid>/mem and
>> process_vm_readv() can't use get_user_pages() on these VM_PFNMAP vmas
>> and fall back to vm_ops->access(), i.e. xe_bo_vm_access().
>>
>> xe_bo_vm_access() doesn't check whether the device is still there. For
>> a BO in VRAM, xe_ttm_access_memory() then either goes through the VRAM
>> iomap, which is unmapped on remove, or submits a migrate job after the
>> GT has been torn down. This applies to GEM mmaps and to the OA buffer
>> mmap of an OA stream that outlives the device.
>>
>> Enter a drm_dev_enter() section in xe_bo_vm_access() and fail with
>> -ENODEV once the device is unplugged, like xe_bo_cpu_fault() does.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>
>[Severity: Low]
>Since this fixes a missing unplug check in xe_bo_vm_access(), should it
>include:
>
>  Fixes: f85dc3c5abdd ("drm/xe: Add xe_bo_vm_access")

Will include the fixes tag

Thanks,
Umesh
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com?part=4
