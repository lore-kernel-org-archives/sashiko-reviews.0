Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793128950;
	b=pSmeCAk9LEBgIi9wJxy6WKxVBgVED8Jidaz/YW4XDsuW9tcYmwYOqWYDYEoRmn7F6VLX
	 tgCAC1xC6duGeCiF3W3DxIwVXubP4BfgdYe2ZKe1WCb1V0GXPU1esl3EEoDYOXmYsZN2K
	 WV8A/Wo3konbyMtM3ZcNcJ7vNj0z5gPY8A3smVuFyt4txo+zD/SL2Umz+tDH73kWB8iDr
	 ZWXs4hbIvKcHKFgRCTkV/kBBVH0+XFHF32SZTz/23qu6aIwUZzniFYW0TYvEGJvEG2LUz
	 JF7BGKDm+Uu3n7RlCxjtA5jjBSgQodrzJXu4rvTxU/DvRCRN+sl4ri3rcNIiLVPRExg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128950;
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
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=A9pZYWdbwW/sgWZ7Cyg9Dq7+CZ1TCJ3s8ZJ7KrvMF4g=;
	b=Hnm+mM/S87iy/jpL/yjAAcYsOej56fMLB6oTAcoUUjm5136sLaN4pL5f8p/xEBD5LmaX
	 WIkysmlDi7GVt+WD73xvQDk9gdh2RqX3jfjWyXC9LAhTjp4pd4ckkr848dvUFlz13Z2oo
	 KR8SHoVxkdmzVrvWCvs0OvPlCphqkjYb0p7LKAQ1/EMYogtJKWHxqpAO489jtDWU7nsXM
	 uVViZ7AGC+pLm96c0V40c9opDufh/rCEAqQIAZ6u0Oc+sKXyudMI6fcPiyiySAoyvbJaL
	 PuZAAYwPRttD429pzYCRFzM/tYm627mSfjHXewU70bZBaqY6ff5i4HhTzKkosa0IaWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NiUUu2Vn;
	arc=fail smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58AD606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B58AD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NiUUu2Vn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793128950; x=1824664950;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+j8Nh+pqm/MOH4/806dcaZ8MKyXDpPbRprkuSVbQ5aI=;
  b=NiUUu2VnrcBLDFFFzxDZHhLc2hWOtL74Kaehy6vIHz6NEVGqHSHyodvC
   xUwAh/eHKhCMFUPUuAj8g/TMNCDle0txzlIHnmUd9W+yLQd5f9+Jaqf6h
   E2ITvMPtL6Q0jBAYtKDjfL75KcU6X4JpcY3060A1F05pWQBxWvJ598uMu
   WpdzFGfzGWN18cOEmBlnfqeF4mfaqaYbM1nrJrgy8WWF5Mgu0tccyBDBq
   gCPh1kLbKHfp/m4+dvVtvXRRUIAxIP2MyBTCbSQc0uTe4bnnLs3hYKVFE
   9G+SfSUdbn12A/q0ZUYUInuyR5RpNFlw176jpO51qXnrBG6BICxvEJnn2
   Q==;
X-CSE-ConnectionGUID: CND2g0IcRnCzRL4KN7HQUQ==
X-CSE-MsgGUID: b2MUYLcVRHOJ1uZAa293vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1841501"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1841501"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:22:30 -0700
X-CSE-ConnectionGUID: IrI3m71NRT60k9qNBWmmYQ==
X-CSE-MsgGUID: 95Dj1a4YSYOf3ihh9CbarA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6402757"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:22:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:22:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 12:22:28 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:22:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQ6kcpEuvZgTGfMkZuJHWYkcXkwtHGx+dPe6zDgQ0AyqATEvayJRb8za6JEkPTSWQna2DzdBnms0XjOiAs8yjvTwei0l5CRpsmeuAkqMPIlovE1Q5cWjXCjMJmtUZZ0OpVel64GqwPzMRz5vywODVpK8INcsJdLckFOzEIrW//8rI+G6HfJf6QF9sSjvu8A2EhYj8Sl1fBzMwqdD2ezDu3yztAVcfCSHj52a9js3b8VfTXMet0Z5peMAXZc0hk0G4RMdCG0CCxI6JAykQ1g1h3/YMrmPLpKsRD0K2Duvo9nZbfZ3GTTNssPD/8dBmFeavvRGJnH7IJnzYrrkmhVNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RcaK/dQgwqLdnMnQFU8dBC9xoIYQe2SuTUKrWghkyY=;
 b=Wec5bd9KpkI3WFK+0qUDmOSSts+lZeT+RlRh4fFbrs1+NOJU3OxpcS6U4iIlWMIc+T9xLUHqsohpv02KWULnGZU3xOIIzI+6UNfGwVOa1ItyZo2l/gOHbNbxuzbWfCJBTpHLVa5BKbrIxnbGJbX0qrEbx+JZwxEcawG9DfoQUc0omj4KIYcvhY9xIZwVoZ+zWZZfalopol/kE7WPmZmAv4z7Gw1GjwVjHWI1easUPLYxFhOpqLFdVo07aGa6tNPBYrGDc7UEnNs01xPO/6Jqmjdevg+EfwOnOzhxDriIUheMNfRhpGhgrwEH2xHkUf9IsBpkgUPwIZ6s+uJmK5NWxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by SA2PR11MB5114.namprd11.prod.outlook.com
 (2603:10b6:806:114::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 27 Oct
 2026 19:22:26 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:22:25 +0000
Date: Tue, 27 Oct 2026 12:22:23 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/10] drm/xe: Factor out {min,max}_idledly_ps in
 adjust_idledly()
Message-ID: <20261027192223.GC203565@msatwood-mobl>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-4-b0453f79c4e1@intel.com>
 <sashiko-outbox-183251@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-183251@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::14) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
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
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|SA2PR11MB5114:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b5c6869-58c6-428f-0ab4-08df345fa22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|23010399003|1800799024|376014|366016|261026121527099003|261021123027099003|261022075727099003|261022105027099003|4143699003|11063799006|56012099006|261009223027099003|260925021311599003|260925021911599003|260925022911599003|10067099003|18002099003|22082099003|6133799003|261026140227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: 45T60YTOUdtNTDcxe3d4xqIu069k3iER6jC0CjrrLG5SlHKXAgukAJCiJWQ7srlz0jWgpPqUT1LRrQUqoyFGaC/adBkKoYcaqpSAflVXu4pwRiZOxNr2tjCsWSgG0w3zuth5mpw8RdfRwGVMIQ/y92CCTiUHCWRJrlXjopORklkQTpxdtUx5FX2SltwUOIawZnYkJsgHCH31MTe6uO18ons28/ZhszVvlGGwSY+eijTpa8Z1GgMAD02qQt7uhzduiI+lq++4VLueQUDxeunNXF6pLktuosTL5E+POHKyCfMGJIxdjU1lgmTEeihRU1zwvWD6WW9ulsjfhlBA8CgL6yuxeHKc37HS26BaOp6oVIYThh9kF85aZW0rWKxQB+owjrKGnUDcsRAv+z3PbzIUmG2bKu9Xziz9DeRxyfffsq19qk/3/Vc9llNSF3gfPb/T016qYpPylvPImJ3JnLFLVE0/lTTmkYGwAvjjraIMsK9MsbmF1qN+8eBBtt6Qz1/FXwpCbU647CKZIeIEfcEdasi/8l6jnmFAKDcRr6F6sSbwHglIM/7VfTzOp6IVugXOpEnXXpagLlNFjUOlIQBuux1PtN6JkO5Mvg8zZCzYNv8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF89507EDE4.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(376014)(366016)(261026121527099003)(261021123027099003)(261022075727099003)(261022105027099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(18002099003)(22082099003)(6133799003)(261026140227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7gAGbaWxNS3WcVpB72RF83vzDaRH9OZMIGaw6zA3hxJjveWR8cN9qFGj6+?=
 =?iso-8859-1?Q?c03/vEUL+IWzWFn5D/x3rUeMGQMrfMR6mJT09AuwKlhEv79/cBgKeGncEP?=
 =?iso-8859-1?Q?N15u3deM6ZIt5DoVheCpXuYqofJnvEZaWsMtQnpsLgIZ83C25bNtYASqR0?=
 =?iso-8859-1?Q?86yUQbqminiTsyvIbVoPPP2ESQjGKrd/HTdLAsHTclnRCuD3cTvj2lDxqK?=
 =?iso-8859-1?Q?XDFIWxzyvZIh1hi80WMbymCN5tJO1+r75hGZX+tb2/P3Y3ke4Tr7tf1qdm?=
 =?iso-8859-1?Q?N3PaKMaFoECco5EboFBnOhnYc+lYqQCd7muviNY3PDND0fHjITtsnTMMs+?=
 =?iso-8859-1?Q?VImZka+wU4glqo4Chy5x5gm4+nr4f5Bm8tN81bAO5G+Wcdzm2Hhr0HV0nH?=
 =?iso-8859-1?Q?f5tumKEOxFV4q0ThU/zAqXiNCz34FNyCTuf6HBuXZSUqzXYd4t0Odf9LhH?=
 =?iso-8859-1?Q?tyXzQCSXvmCtp3EKTUYn7PWx+67fkZTJadjMkExlYPxaEjETcrmUSG7u7F?=
 =?iso-8859-1?Q?Jruts1cT4wo4dNg+5QmOUP58963zMpyisAm+tJsHb51+/nmeeOEu8/avvp?=
 =?iso-8859-1?Q?LAZ7eIZdX02H7WC4UxHdFPuASqx5/RRP1aYR+Zj8nwkJbeyofZYZ3AgbLy?=
 =?iso-8859-1?Q?cMUoWBgq/CEWEaeieOeXiLaTSlqa/K5xrKN9o/ljZWHOqE8eZbRA6SNw8C?=
 =?iso-8859-1?Q?8AJT7F6rmRZ9m1PBkW51TBbKEkGBpOghZiWE3xhwFFJipz/R/iLnIuoVDV?=
 =?iso-8859-1?Q?A7oD1UpfwG0q13CG059NFnay2NaC0a3XXVJiBNLcyZeCANqTc8mO4DuJF7?=
 =?iso-8859-1?Q?cXGsBG1GZVCTytNlgDFh+XzEeGckr7eaHBZNtnNG1NoeC6JyJT6j6tdONX?=
 =?iso-8859-1?Q?XdLSQyRS1bxyogWlqNxmnQxMt1/16dUUXNDPm4AJ5EDYtpqqT8aOLpNdjU?=
 =?iso-8859-1?Q?/8nNsrEgY2uKRxw/G6Neq25WqPcsjeelY4tb09fMMpZBbOSXLCggpPYiNG?=
 =?iso-8859-1?Q?gzAqhs8O0gZuqRRVoMxCScVptUjulkkT3ZiTAafmy58Uy1XvueXZ2syZoj?=
 =?iso-8859-1?Q?8L8aZGUw3SsGV0B7uR2LLw59gUZd1on5Voi8UMt8hGYhE+k56elBdVu4jI?=
 =?iso-8859-1?Q?Jd660DRGUcQrSk6zAynEcGtP9pD/M3onlXCFarOUgMWR4MM+7kBSc7BKt2?=
 =?iso-8859-1?Q?OyDQFvJ3s/qmUqR7yBzV61KxLZtcdmtMWw9vx7EvgbNY38szSypHa1Wg3K?=
 =?iso-8859-1?Q?SDjFVnndrF3hfeHOtuvTA6v0wIfdf1f3akjozbLhig36W+OSFkiJStXq5B?=
 =?iso-8859-1?Q?NOwf9o6suGG3t4B31zBFTUWtyBl3shhC6bOyd64uX2o8Vtanj7Ig+tlCaj?=
 =?iso-8859-1?Q?7BcvEFvjOt6pUP8gRuu90AQfo5qMqqyUkjOweWrHNQdiElUcEzCqswF8gq?=
 =?iso-8859-1?Q?u007QK5PM3SqjGlcDY7cZvID5V3UYm4z7Q01bML+dO20ZJqRGvw8Re6NqX?=
 =?iso-8859-1?Q?5qeGSHGOQh5htsb7gZnEJehu5nISvo9qCgHk1Wpq3RyfIiMOKXpB54XyQL?=
 =?iso-8859-1?Q?9NyTUxE1wRK7LZqSiLlelESNv7KbabbVIqfib1qMtp4+x+Ho5s5lkuOljX?=
 =?iso-8859-1?Q?MNr2cGw9vRMSuR927TaC8a92PAda7lPdD44ZD5lwvBXTqSBvg92/TXqft7?=
 =?iso-8859-1?Q?iE+CwXc4wbPY3zCosOxAjn2pBRAh9eB7dE9J74KdgKlXFm8uZLW0Oydyoq?=
 =?iso-8859-1?Q?4GnttDFjelhieVpspFvC0AHynFjJuz3B/vaDZ9Ez0ctqSFM0XSAZw9xiT9?=
 =?iso-8859-1?Q?k5kovmspnsNnz+3aYo42RFm3qMS2V24PUVaGxVRmnQcjBKyQZdMb0Nz+fj?=
 =?iso-8859-1?Q?g8?=
X-MS-Exchange-AntiSpam-MessageData-1: 4BCEwvbCTJe6QVWBo550InUPRwXPQ/53EbM=
X-Exchange-RoutingPolicyChecked: f4AD1jYBB1gVeeSHW0Km0PL7trna8xaG6chV+IFA8FQnFVpTNvjr0mXKu78JB86TFvJ0aBDMuE6zKRHihZ2ghEjoPIdHzBOn6A+/3/A58WhPNdHVTrRFSk2Y17S48LTr4k/ROmzX5eYZsGDA5zwZtbLEJ1ZpvmuETNBw4wVkAw1TvHo8TcIK2tb/wiBDhFELZqHHDKCmPUN/1+h2XHsox/p3JNMViq+6SlYp2DJFrxKm4QcAW2UQO0a3OwctgMc26GZqLwp3X1tgWH23TzIm/W1+xTUHD5ZjE4cgz7RL4G2WI3z4ZZ1G7r+tZRRKG9hj49vA/leWFDq/yNQ6fpGivQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5c6869-58c6-428f-0ab4-08df345fa22d
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:22:25.8746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uF1ntKhE91VtCM0YOjWrIQ0ZrVuVASm8+f+DfJC4Mw5xna7gye7VyeIuLytYeek/jCne/7KYnoPNqLeDGPe3bL0EIllqSa4/4Spu5DYqjqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5114
X-OriginatorOrg: intel.com

On Fri, Oct 23, 2026 at 09:23:04PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe: 32-bit multiplication overflow in adjust_idledly()
> --
> 
> commit 032b173104de210ca0228dd31e057951f3cde20d
> Author: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> drm/xe: Factor out {min,max}_idledly_ps in adjust_idledly()
> 
> This commit reorganizes adjust_idledly() so that workaround-specific logic
> computes min_idledly_ps and max_idledly_ps before applying and rounding
> those limits to the RING_IDLEDLY register field.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index dcc8a6d53c5d0..2d2a80cc2da35 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -585,99 +585,81 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> >  	xe_reg_whitelist_process_engine(hwe);
> >  }
> >  
> > -static u32 idledly_floor_ticks(u64 idledly_ps, u32 idledly_units_ps)
> > -{
> > -	return DIV_ROUND_DOWN_ULL(idledly_ps, idledly_units_ps);
> > -}
> > -
> >  static void adjust_idledly(struct xe_hw_engine *hwe)
> >  {
> >  	struct xe_gt *gt = hwe->gt;
> > -	u32 idledly_reg_val, maxcnt_reg_val;
> > +	u32 idledly_reg_val;
> > +	u32 idledly;
> >  	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
> > -	u32 maxcnt_units_ps = 640000;
> >  	u64 idledly_ps, idledly_hw_ps;
> > -	u64 maxcnt_ps;
> > +	u64 min_idledly_ps = 0;
> > +	u64 max_idledly_ps = -1;
> >  	bool inhibit_switch = false;
> >  	bool wa_applied = false;
> > -	bool clamped_below_maxcnt = false;
> >  
> >  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> >  		return;
> >  
> >  	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
> > -		u32 mincnt_idledly_ps = 5000000;
> > -
> >  		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
> >  		if (!idledly_units_ps)
> >  			return;
> >  
> >  		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> >  		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> > -		idledly_ps = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val) * idledly_units_ps;
> > +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> > +		idledly_ps = idledly * idledly_units_ps;
> >  		idledly_hw_ps = idledly_ps;
> >  
> > -		maxcnt_reg_val = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> > -		maxcnt_ps = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt_reg_val) * maxcnt_units_ps;
> > -
> > -		/*
> > -		 * Wa_14025941587 is applied before Wa_16023105232, which takes
> > -		 * priority if the two ever conflict (not expected in practice).
> > -		 */
> > -		if (XE_GT_WA(gt, 14025941587) &&
> > -		    idledly_ps < mincnt_idledly_ps) {
> > -			idledly_ps = mincnt_idledly_ps;
> > -			wa_applied = true;
> > -		}
> > +		if (XE_GT_WA(gt, 14025941587))
> > +			min_idledly_ps = max(min_idledly_ps, 5000000);
> >  
> >  		if (XE_GT_WA(gt, 16023105232)) {
> > +			u32 maxcnt_units_ps = 640000;
> > +			u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> > +
> > +			max_idledly_ps = min_t(u64,
> > +					       max_idledly_ps,
> > +					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> > +
> >  			/* Clear the inhibit switch without disturbing a valid delay. */
> >  			if (inhibit_switch) {
> >  				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> >  				wa_applied = true;
> >  			}
> > +		}
> >  
> > -			/* Warn only on the value read from hardware. */
> > -			xe_gt_WARN_ON(gt, idledly_hw_ps >= maxcnt_ps);
> > +		/*
> > +		 * min_idledly_ps is applied before max_idledly_ps, which takes
> > +		 * priority if the two ever conflict (not expected in practice).
> > +		 */
> > +		if (idledly_ps < min_idledly_ps) {
> > +			idledly = DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
> > +			idledly_ps = idledly * idledly_units_ps;
> > +			wa_applied = true;
> > +		}
> >  
> > -			if (idledly_ps >= maxcnt_ps) {
> > -				/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
> > -				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
> > -				clamped_below_maxcnt = true;
> > -				wa_applied = true;
> > +		if (idledly_ps >= max_idledly_ps) {
> > +			if (max_idledly_ps) {
> > +				idledly = DIV_ROUND_DOWN_ULL(max_idledly_ps - 1, idledly_units_ps);
> > +				idledly_ps = idledly * idledly_units_ps;
> 
> [Severity: Medium]
> Can these tick-to-picosecond multiplications in adjust_idledly() in
> drivers/gpu/drm/xe/xe_hw_engine.c overflow 32 bits before being widened to
> u64?
> 
> When hw_engine_init() calls adjust_idledly() on non-VF platforms where
> Wa_16023105232 or Wa_14025941587 is active, idledly, idledly_units_ps (up to
> 8 * 83333 = 666,664 ps), maxcnt_units_ps (640,000 ps), and the return value
> of REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) are all u32.
> 
> In the three assignments:
> 
> 	idledly_ps = idledly * idledly_units_ps;
> 
> both operands are u32. Since IDLE_DELAY is a 21-bit field (REG_GENMASK(20, 0),
> up to 2,097,151 ticks), the product can reach ~1.398e12 ps and wraps modulo
> 2^32 for idledly >= 6443 ticks before assignment to u64 idledly_ps.
> 
> Similarly, in:
> 
> 	max_idledly_ps = min_t(u64,
> 			       max_idledly_ps,
> 			       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> 
> REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps is evaluated in 32-bit
> unsigned arithmetic before min_t(u64, ...) casts the result to u64. Because
> IDLE_WAIT_TIME is a 20-bit field (REG_GENMASK(19, 0), up to 1,048,575 ticks),
> the product can reach ~6.71e11 ps and wraps 32 bits for IDLE_WAIT_TIME >= 6711
> ticks, which can misprogram RING_IDLEDLY or trigger false
> xe_gt_WARN_ON(gt, idledly_hw_ps >= max_idledly_ps) warnings.
> 
> Commit d864065ea25e ("drm/xe: harden adjust_idledly() against divide-by-zero
> and overflow") previously added explicit (u64) casts to prevent 32-bit
> truncation when converting ticks to time units. Should idledly_units_ps and
> maxcnt_units_ps (or the multiplication operands) be promoted to u64 here as
> well?
Similar to previous patch the bot is correct here, please adjust in v2
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com?part=4
