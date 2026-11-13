Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794585254;
	b=mlmApRo6Q4Xj16YYlV2zKIstaaY5NeJ3CY36PN4oe88nylB/9SWeAAR0lV2ORuJE/AtH
	 h7PF+GWhGPf4tkpgBbFhM5h/uBtikUr9gkCn1ewjmKL07RW91Aq8OrPXJM7Nlkc5SdgZg
	 0HN7byQopx9oh0Ko0d0P1ZDg89wCgqoFIosUtsedz0gd6AziDkC5pe1xTKsUG9nu4bfIk
	 sFQuzqb/4wFns/rKZximBGp2TjFpy3GtAW2svthBo/4we7AS50Tgsrmj6M7nKF/na3hQF
	 jlk5llDYzvjPQBmn6SzHqiycPgXpw68vfux8mc4cg5CZsv9wwcCXXrJ9YgxyRnoGd9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585254;
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
	bh=0Gpnk2Tt8acf4alqnXVQZOraDHa1ECOteJ3n5SitSRM=;
	b=ctyZvpLg2RbdpM6CScXCV+KCq10U12/t48CAyaiST/N9wlBo+UZPbWC8U9Miw/suZXZ5
	 pH9A+ljuATyUnk+DpDtRqutKsSKOd87TdwkkGMX1Ah7c6qL98spf3e2KLkKsYnd6H2Ixa
	 F6za+DhnRXMsb3nPbQU91G+8HbZfzv5l88apYPf2wGZCXfJpH0EE3vE0U/RkQbXcpezxL
	 yRhCGlzdM2186X4mmEXwwD+RqRA2UazjZZ35XdMqKItvPwEnQdDYGiIfciiQuiYlj59l+
	 rc6l/+WqEUWRU7Lp2xa6dQ/bCk3mhltjfWm76pCks1HM9UerO4Xh9RRFGm5ybFkUIDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="dKOEh/vh";
	dkim=fail reason="signature verification failed" header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=g+MYYhPn;
	arc=fail smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109CA606A323
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 15:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109CA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dKOEh/vh;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=g+MYYhPn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794585254; x=1826121254;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ZkM3Sr9coS3+aGi2y2ja3JwhGczlO2by3PDa8JCay1U=;
  b=dKOEh/vhePh23lfIPZx5Q1aNXaRaaKSkkhxXHidYNkCHfAodrCbt0zZN
   bJbat7KWxGNuCmAhlS25CAaWsbUkZwPHA2fV0iX0QfAmtQUn+fu1Fz4xU
   tpl8s6FM1rJ8YEN/GA8oeCll/DQt8KAmoQDCLRW3S3P8yKgf/n3jT381v
   yues9T/Atgo5ihu3rzbwtPpPmuZvB9HR0HnELxOUDaI+HPyCAgJnozqdE
   8TGpFmvIxgcZICdJwfrTjektYaR+XLSJjmAz7cmDQmgSYzh+K6ZiTBZDq
   oIKQ4p7oLeQBWktMYHjM3OupiztcwYDE4shPCpmcOxzEs/NHaUfrJe4z2
   w==;
X-CSE-ConnectionGUID: zmQTEWzUR3mln5VzlgHp7Q==
X-CSE-MsgGUID: oEtLzt90Tj6euQbS9QQC2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3404064"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3404064"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 07:54:13 -0800
X-CSE-ConnectionGUID: EIzfcvb6TZaJ2lS6mHYrQw==
X-CSE-MsgGUID: sRWmtrM/QYC3ykpfPmejaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="10855214"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 07:54:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 07:54:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 07:54:12 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.66)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 07:53:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mkg1sbrq17hnyHVjZBU5Qfgdv9gU9j9kwIPedTrLO30Ln/kNVDeHti8FJQh7BbO9uv3Jd5lVSqeccFFZ8bNxw1DAFWHPWVjs+BDSMHvCTjTOkHx3TZbosEHh9UDPW76tS2RLk39t44kxDfwFx0M7fbWLeXF3ROSf4sM6xUh26l++GXGOfAHmWOddexZniDQCNV+Gkr3tpz4PlKMfJbtMEpL4vLcpmlemFCc66I44VVi3QLhtGonVSkOsdV/QuhmJdU967GuhYe6T6R/4z/UdX7PGzvrOyia/aqyqji+9HAWcSF8ivM4orEuYj2VEbsmtFliYqAemhJ5R/qJX+CG4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzRTdU1Lw74jjaOUW4dlxOgsmc0YrsvdeK4nOBBJxJs=;
 b=mlV1L/md/hj1sOJ2UpExizSlyE85iisB2Yf8rVhi2+bMWn7PjPITc1ElZdYvZJ1vOf4rzu9gqTHRqJzycIS5hLFupqu/NQ/95kgIarZGd0jFxgv9zRro6LSE3BczLtXkaou8lkVwTGhY6Tyc0ayIkMUlVWqRKTfft97obh16ORHcG1IpImiieEJn+IXlDmL3FbbeSvbLFOa7UP99WX9xYm9nBrJd4lxMs02TzG8mfMJpjN/pqbSPtV3E8dHHamFctfQtd7G/TJThlmEBlcWgh094FylFky2HlPAOj5x3G21RXtpmS830khU13ER7+k5hpFF/7kI4zKI35rAvtZb8HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzRTdU1Lw74jjaOUW4dlxOgsmc0YrsvdeK4nOBBJxJs=;
 b=g+MYYhPnwl1oEsO+fQJ4aw9Cfzxl8OLzsz4BuX2502kw9ZsxNWkZLwBNnAXLF07d3TvHzJLkr2VZj3O6zMKTgJL72YwrZEQ0/CMB+RdnUt5PnnL6iYF+RixcaJZAn51BYwIQs2SuIPkjuxYTxHmrx0LT+MSR0ZxdCbtYSTga2g0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA3PR11MB9183.namprd11.prod.outlook.com (2603:10b6:208:57e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 15:53:51 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0615.008; Fri, 13 Nov 2026
 15:53:51 +0000
Date: Fri, 13 Nov 2026 07:53:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: fix UAF race between exec-queue teardown and GuC
 CT pause-abort
Message-ID: <avcyjSWZqXrBtRUU@gsse-cloud1.jf.intel.com>
References: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
 <sashiko-outbox-212921@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-212921@kernel.org>
X-ClientProxiedBy: MW4PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:303:b9::27) To CO1PR11MB4787.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA3PR11MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8de0c7-dc16-4fe8-2ced-08df419e4fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|56012099006|261028144727099003|261022105027099003|261026140227099003|261026121527099003|261022075727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dQ0DTbJkEUVDfjBKoK4Os+gmWv2iCGuuO/JArTKp/AAVlVgcCe5JllLa2yRMBJvxIEK/3SSj83yadbo4b36DuZcGDRF6VnwC+lhEBSYCgyE2dAHGP9wAg9cY5c6YNFyvq03/apv2gv2KEy4ONg+SaDL8sEiLhMPLoy1QnTBQGR+8RMlGAGo6xgZnRkELutKXcn1ITd5BqyCy3/rgy2v3r0veRyLk7jMYcTFyY4Iv0gAYSLuR8/9u3EqT2jvWnI9q3IbvtnH/J+yG281I2t9Yv+0Km/wfcCrHYK5jT2gSqPdEX7sgyT8fxT1yGI4VI/CZWYqphDhbBQbw8hzeET8WJQTHqXTEpuR5vrEnR6hFfUwwRzkGzgflQwqNwKI5MQtcdROH39p9tXfF96Bfqdi4zwbIB/FY2WpvtLqKouO3TASuGiR/QnbVDtyikZ/Lpb0wt4InQUqOXzmQRU2rTY712Ar7QvmOeQUR+vWazhniOR2A+Yrc7DQawi1B2J/6SXSGf3hMOq7PJUthh5gA5DoJDb5wpXIn/vcwqCcCDmR463+JtkAwKBlE0FBhJelE9zq0Qu2hPT5fgMhYZVrCgLPBvf6WEpc3aY+YD0/Aan0+U3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OaW2JhazKYIwXjHkRHGl+IL/QkwDWgOdEvtWyZ8JgWbud1V6J53n31fOHt?=
 =?iso-8859-1?Q?+INLNW0ZYr35pHVQbTL7wHoUHrCYPtzzN4r1BmjKaLnI4pvnw5j6Q9uqNa?=
 =?iso-8859-1?Q?QADd1BrJ4na20aQUbKxsfY2+lvzlnnXdNteQgC0KSt4DUcGMSVSorPOZXm?=
 =?iso-8859-1?Q?Pc2SRYJJpjqtJ4HQR8gpgjoG4deVj9IKABEaf17FBMSlbSXjHPWGNGZlPN?=
 =?iso-8859-1?Q?idR1HkmbRP6tIvQmZkv9nDHNFE104oUVy0pTBzAjm5vUUld9SS0lXOVER5?=
 =?iso-8859-1?Q?3r8e2VYEPdzOFLD0t8sVHPmXFtUeDVOqUXFi5By/l2lIECbfFL48I1hTUc?=
 =?iso-8859-1?Q?QHYeSxTtR+Q+banapcKLQ380LoUGbbrlnGsFyBsGUcMmuWL1DVkM8Oi61a?=
 =?iso-8859-1?Q?nXsW/+NM5UfvOI+4p/SLVyWl+vts8fWKgv6kz/iRcozE/WgrSxqdTzO4ES?=
 =?iso-8859-1?Q?g1pflRRPVTJIeDROJf/MID+OKiAFxlNF3lwnOz+MVJB0mJ9wDSQHm1/vma?=
 =?iso-8859-1?Q?Te/6IVrqRkGBaBxTF2N0HsiiV/PPacVzoAgEwfkUHZUO+Qd7mngsFI3X2z?=
 =?iso-8859-1?Q?LMesMOnCzJRH6jaDcB8RVXMnoY/e1S16TEXPQKWAFqjigZ4rCsVwYG45Mr?=
 =?iso-8859-1?Q?Chgsip/dnt0hEMfumCJC3Slae87SHCBiotFr2vra5zGFWUFfWWCAPMdGyq?=
 =?iso-8859-1?Q?cXIv3rE8mqQqvX3AE8WC1IHUeVDUprqTTEWCbin4lgnL4CRUbUh7GnDHZ2?=
 =?iso-8859-1?Q?VqmDo9kRcP+V372WcSMuZWopsCp1qbOsJ1htRgtFS2v8QKmfuamYA0vvud?=
 =?iso-8859-1?Q?imMaJNTmTwjSC6ORwTYlnr0nw+dic4iv1ALTAMuInsB+TnOReHf3yVHpps?=
 =?iso-8859-1?Q?9H7xzf/9Xx01nU3lcrFTpPHKq9Mi5nqhMHV36gFG/4MM3QNFzd1UV31vXy?=
 =?iso-8859-1?Q?zoAL5w8HQ+QAnG85r8Jcvj2806EsVu5D2q1HWq4bb8zqLmscQXh/PK4m3I?=
 =?iso-8859-1?Q?BWAPsgNyoanu+mZ5rCooE/hESuNmXG27B+AJABYe8B/2fKxtEeEBMh7rD3?=
 =?iso-8859-1?Q?YQEcBgb8ZIgoido50teCoJgCHvdQ4XUYK/Zer1910ljvG84CrnJkpwX+YH?=
 =?iso-8859-1?Q?Uyihl9b3mJFvSqQEjmnShYIcCWBb3nhcmnImGwEnn1X7JA3eUXbJPDxw/J?=
 =?iso-8859-1?Q?hUtll6odqehEemg2qQhmCxH+lxMO5XN1fqZ25q/VqZsk10++Vu3iDS8tSD?=
 =?iso-8859-1?Q?xEbhjqyprx+iM3hNXZ9ExXQLO9sTORyQSbZuKBBuDUGIgROLVCl+rtAFj9?=
 =?iso-8859-1?Q?kc8J/QCRPM+zQx0haB4WTDPar9AiGWBQ1mggWWFQ6xeaEs7h1IoS5D1/8P?=
 =?iso-8859-1?Q?gQut2VIuUvqfVT82/FyX4dAiLUh1Vco8O7XqeZcwPqDF20aqVX190ksrPf?=
 =?iso-8859-1?Q?OKAdq9eSzYTLm3zD2vruHRplB+bnR5ZNx096rJsh6KZ3x3eyfYzi7dcUiC?=
 =?iso-8859-1?Q?sUZMr99QgOkU/uBwamTzmH5aF7LE/snAgEdUwXABMA3U6HjzKisVnSCwJ2?=
 =?iso-8859-1?Q?POB+UjupeB0an8JNPwJvffxExOMwi/gteuqHIuvo6IqBNbN88AAwuMyacw?=
 =?iso-8859-1?Q?+QL1SoTryrj285P1xlCRaz9IZvVlmNJRH5k5/vJL7E41BuNOJNhljueQQq?=
 =?iso-8859-1?Q?w9zX9/11G4hfuYSqW0n1c7a0KTyj+idh3+HqFWzPeWFNeDtkBZBPmstYDw?=
 =?iso-8859-1?Q?bcBr9IVlfd4I362NxSNW5mcXkW8mG6Z83E/Z3zA40WbUktPI9vVFdv1f5K?=
 =?iso-8859-1?Q?Cj8ttIzccg=3D=3D?=
X-Exchange-RoutingPolicyChecked: HS0TPq8vAnRToljaCBnpeOX3Z3TplzXFg3RFDj52/YHLmpV1qzh+tufWv8yMKf/8UGtAFe/OoyXd0KjJoiHW2dNcdOfXs1PXqBBBnx5n5Mg7B1i7Czuk5T623iTcC1nFMSzEcL/sW5yCwrJaimtrpcEkBTRsiwH2anhZZi2AETAkDcPF1dWKSSFVWp6iiZzqbv2+7FlxguqgtuZ7YkKZDCjawPmhBN8L94BX/bfadavp0ApD5TW5mbyFFiQ0EBjXkSuA3T5h5jedLmtn/8rEhRpRJtXh/CQqVre2OobrfXYcuLUHMJS40OdMF/ano6AHos/CqLO9glA/THAqvE0D6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8de0c7-dc16-4fe8-2ced-08df419e4fc5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 15:53:51.0173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pt4/Uhxz9DgA/nOk2+cw7hBNNN9nE5WmVAVwAxXDeP12/2hlfyqh9enegFJyRPweNelw2rWjDlPrMiVXed1ueg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9183
X-OriginatorOrg: intel.com

On Fri, Nov 13, 2026 at 01:46:25PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] drm/xe: stalled CLEANUP and queue leak in
>   xe_guc_submit_pause_abort()
> --
> 
> commit 904ab0c1661eb0e9b87cd4d66b549b254ac2e0f0
> Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> drm/xe: fix UAF race between exec-queue teardown and GuC CT pause-abort
> 
> This commit uses kref_get_unless_zero() in xe_guc_submit_pause_abort() to
> skip exec queues whose refcount has already dropped to zero during
> concurrent teardown.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 9e7c2778029ca..92290b8be24aa 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -3297,12 +3297,18 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
> >  	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> >  		struct xe_gpu_scheduler *sched = &q->guc->sched;
> >  
> > -		/* Prevent redundant attempts to stop parallel queues */
> > -		if (q->guc->id != index)
> > +		/*
> > +		 * Prevent redundant attempts to stop parallel queues, and skip
> > +		 * queues already dropped to a zero refcount via their own
> > +		 * independent teardown (guc_exec_queue_fini(), xarray entry
> > +		 * not yet erased)
> > +		 */
> > +		if (q->guc->id != index || !kref_get_unless_zero(&q->refcount))
> >  			continue;
> >  
> >  		xe_sched_submission_start(sched);
> >  		guc_exec_queue_kill(q);
> > +		xe_exec_queue_put(q);
> >  	}
> >  	mutex_unlock(&guc->submission_state.lock);
> >  }
> 
> [Severity: High]
> Does skipping xe_sched_submission_start(sched) when
> kref_get_unless_zero(&q->refcount) fails leave sched permanently stopped
> with an unprocessed CLEANUP message, leaking q?
> 

This is right - if the kref == 0, the queue still needs to be started again.

Matt

> When the final reference to q is dropped via xe_exec_queue_put(),
> q->refcount is already zero when xe_exec_queue_destroy() ->
> guc_exec_queue_destroy() queues STATIC_MSG_CLEANUP onto sched->msgs to run
> teardown asynchronously on sched->work_process_msg:
> 
> drivers/gpu/drm/xe/xe_guc_submit.c:guc_exec_queue_destroy() {
> 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> 
> 	guc_exec_queue_add_msg(q, msg, CLEANUP);
> }
> 
> Callers of xe_guc_submit_pause_abort() first stop every scheduler in
> exec_queue_lookup via xe_guc_submit_stop() -> xe_sched_submission_stop(),
> which stops the workqueue and cancels sched->work_process_msg.  During
> driver unbind or SR-IOV VF removal, guc_submit_fini() drops references on
> wedged queues (and earlier devm release actions such as xe_migrate_fini()
> drop kernel queues) right before calling xe_guc_submit_stop().  If
> xe_sched_submission_stop() runs before work_process_msg pops
> STATIC_MSG_CLEANUP, exec_queue_destroyed(q) is still false, so
> guc_exec_queue_stop() does not destroy the queue either.
> 
> When xe_guc_submit_pause_abort() then skips xe_sched_submission_start(sched)
> because q->refcount is zero, STATIC_MSG_CLEANUP remains stranded on the
> stopped scheduler.  guc_exec_queue_destroy_async() and guc_exec_queue_fini()
> never run, leaking q along with its runtime PM and drm_device references,
> leaving its entry in exec_queue_lookup (which trips the xa_empty() assert in
> guc_submit_sw_fini()), and hanging xe_file_close() on
> xef->exec_queue.pending_removal for user queues.
> 
> Should xe_sched_submission_start(sched) be called before checking
> kref_get_unless_zero(&q->refcount) so pending CLEANUP messages can still
> be processed?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261113132149.2989667-2-tejas.upadhyay@intel.com?part=1
