Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793129434;
	b=MDAjh10VkpzQfFbM7OxNMS8nIjVKoTyRx+4Q99N8MOlRcLBc/qaEhdIghShumlwsTxpb
	 rSBgPiLujKTI7FVkdILoUUixyCqHoyPERScAlfHElrC0/+4oaD1aYo9TkM//M2Cq7oSIN
	 xF+BAwNqoGWRoNM/eayGZg1MzRXq+6jBenVhljPRyQi94Lxm+2xrIj0/QZG3P7PLhA46x
	 P0NvSSTamxYHI1MK8NOYucFwcg0Wuhmp9jFA3+xeh/jSmIB0DkCFeDcd0LxJd7C88/Inm
	 qH9k5Hd3/Qf79s6zTPQYlq9WWJjUrdUjvW+fV6XvUVQ1h9Xg+p2v7BjGr6bYedjt7NA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129434;
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
	bh=lhATCC5WwR2v68MC8QVjuFTh5yhlopKDyvWzxX07ZsE=;
	b=hlCpGFMbeHCV/2fMXOpM8H9usXhIHcK6kbuSuWDeLfhjLkziFT0BxBoaYNgZVQ3wPXNO
	 UoEOrmcD4pkQ6Ih0DmhkVCxkJ5YgMCfXX/8x+5OnFbV2a0cxb/5t1MRS3KNgFhdcvPZKp
	 RtYL4JkfLexEgUjuWM7PIfFiBj+g2eAkXqATbJT9ZcC+8Um/yY5AuBclEATgM5gRqKWnR
	 LUqN2cjd4G4nFp7UiX2Onz9/uuuwsLwco3a9gwVvB2eHkEvA1nqf2iAyG+5eSC1VEQLkL
	 j7dIwqJv+mTxehDd3/3gZKuXpKohMLMO/QsAkY5nGuoNPR6IKVEn13X/oEkDMchnHzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cwAA9jjx;
	arc=fail smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B25606A320
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B25606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cwAA9jjx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793129434; x=1824665434;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NK1Z2I5HQCJNrwshI+I32w50pR+rRQwRdUFCBjioiC0=;
  b=cwAA9jjxaO7c0YmMY/l66RmhCBkVj3piyZWZRAbf2205FOP09aMa7wEA
   OMnccgzqJQoN4JV3qa3B6F7HU2hfJezudTYUY9lJbwotI6yvvleWw7qDs
   hDBIsia2RhLW574LP2Zzfxal1yE7bvCh8ozgZoyaWFA6t8Fiyvd7vDwIP
   W6ERHxeLEXtQmpCN9lHaJbeeQCtXR1USE4DUH1QYhzgIko9edHRsD3pUG
   riDYG9dOcZqXJUSj4gv+2OvvXKMJgKVB1M0YbSg87WurOuvx27dU+bQBD
   vgVbixyW2cC5JMpwn5mbyR2W2oEwzWzoUPxFjzwL5GAIqWv/VY7NelQk/
   w==;
X-CSE-ConnectionGUID: +FvW7E29Ta+rLALES7lHkg==
X-CSE-MsgGUID: 7ZGkFMPKRPq4KBFItYCvCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1748838"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1748838"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:30:33 -0700
X-CSE-ConnectionGUID: yFsuxFueS4SfkUXFPnbeWQ==
X-CSE-MsgGUID: S6J4GMpgRSON7/qi62tz+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4957273"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:30:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:30:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 12:30:32 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:30:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcwKurRMRfqR+WJSa+XueBgDpkc94aoEdv80zxkIUGAoVobIn8CAPr9yVpUkmLHVn1ZqLDx9FZz161umVhrWz1ERfUJgA20YGc0cYz4PdglqVV3Zt5pMb2eMbI3e2gQ4CnX3+/LNPCAZSaIKHm9jSDd6MJE9ucPq5LIWDWJf86CS1ewwT1OIjkMbX6V83/+BgSoZlZ65TYDAdt9/C6OVW8TwKrVWdUJ5OdJ9+0L/uOlBcgL4QeNtTi7gVy+9uebJELB8KFxWTPJsGHC+Dy+uoVpO4KcXYUd35tdx7fN+408yv8AAVYZURYYIf0dgNWHsTFlItbIDEoBADpG/noy2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4116R4rMrJ4IwT4Kqvc5WYGNqHrb2R1dsLirLQ5L9TA=;
 b=YAOM0X8JiDc9T3p5MYiyEzjoBaru4K1CFOTbsdDtZUXe9+AoZAABL5G2s/ydbKtnrQDtFGNl74QUnGf0usJZd3AlVBGjkN5wW7TZtfnwSbK/qj+iStp7YzgqcD8rQgOJg9L90zcs4s4xaIj+Cgjb+5F6g9p0VypwKE/VzK2D1I4iyT0lWlvwS10xlvLBEo/B9iPSqsPxtp6Gfrkm/MSM9jdP9nk18b97ILlBT6Jh9cJwBtvpSQRT4qdKyCCWSmU8NmLkI9VgksJkyMtc374BuN6sUQmwOAFnmij45IORwZQkm6EYMCoZ4QGA80eUCk73Q20wkVjpajKGsO0GcpF53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by DM4PR11MB7326.namprd11.prod.outlook.com
 (2603:10b6:8:106::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:30:30 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:30:29 +0000
Date: Tue, 27 Oct 2026 12:30:26 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/10] drm/xe: Drop early and redundant workaround checks
 in adjust_idledly()
Message-ID: <20261027193026.GE203565@msatwood-mobl>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-6-b0453f79c4e1@intel.com>
 <sashiko-outbox-183249@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-183249@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0346.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::21) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|DM4PR11MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: a7639007-ee63-416d-e7ee-08df3460c28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|6133799003|22082099003|261026121527099003|10067099003|261022105027099003|56012099006|11063799006|4143699003|261022075727099003|261021123027099003|261009223027099003|261021121427099003|260925021911599003|261026140227099003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: a97ZnMFf2Mb3Ii4nAgDRaNtW6sn5FlIAJ4SOVApY+6B26v7msWW06yVGli0e0kEb9rvw/AqsSKqwuUUCk5dl5gHmxinXFXO51IqYqRZw8zgESnCNIQjbkgk0IuhxDTDIT4orwtmOFlp0cevfVkofayG8gJUn3tCpeXGNneIk5WJEXyQSZbL/byw/j84oM2PeDj5JLTBSm6Qa8dp2cQ8psj6muvamWAmKk3kWdYuuRLQQqOsobOrlWWapzJrl26Il6JnTO8jHDcFTQRIFJ4+qDVSORdWSi81sXoxncQzoX/ypgo+uzqnOWDTrL3+b3CyKBmN85IDeFMG7rRa5LEMDPr7LWsYGgnRmJJ3RzduZT5f9muxKK3Zi3W2WJpHQRUe8/k2nwZWDif0gEgIP/AVSdgjXaXgOZLHNe7GPX0TMOkasspB1Ut4ZNoWti4oNToTAtlq6MoO88QHapvSA8Ft0DbtuTsqNLxz/tRi847OG6FLb1+c4wbSFz5ykVF7haBetq3u77MP74hQhb9Wq+acFBrRHi8i0uC9TDA6VUzT7befWd4XWmtOiKKrB+cNKIaFnKu5721VFn+hpJFXorakFYUz1CXYGB5yoFxRJFZuCWaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF89507EDE4.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(6133799003)(22082099003)(261026121527099003)(10067099003)(261022105027099003)(56012099006)(11063799006)(4143699003)(261022075727099003)(261021123027099003)(261009223027099003)(261021121427099003)(260925021911599003)(261026140227099003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oJQEhC7dGpm79n3zXEBDBIFV5V6EidSa5pOYsUmpFbpcrrK6tqCrcp0L+r?=
 =?iso-8859-1?Q?eVXrzzkJodgETIsHJGpr5nXnw4nnZRavTN1xyioGnRkorjyvx8BRgMap+7?=
 =?iso-8859-1?Q?Z8+9Md1RZ33wSva3uZIRvOLdsQVIIAau6X3Nz3OPdju/t+Y1PCCjflFPJd?=
 =?iso-8859-1?Q?/sMqK8L3yggRV9xzcq/v3bvLDU/miT/XMQIm6huEyHhYvPCH5pPKs7I3ie?=
 =?iso-8859-1?Q?jlvzzCIiU6DahMMk5MgJLuy++tKiTQrs9FmdEHZFG1kLgJd4Fdus3ZyIUd?=
 =?iso-8859-1?Q?EqujcqG8wZHimB0rsFw4bTYyrq8GPONjn2JdaaW+t1MnCV29P7c7AudGes?=
 =?iso-8859-1?Q?0Mv7mZh7fiysjcJNr3y3Zuv9bErMU6Xa69Nndtul8J/i6SOkuVfn5Ml4+Y?=
 =?iso-8859-1?Q?CLQXDSQBTP2cFnYqqvPRj3WNWmKTjYBVbJROYCrNk4mdxjEv9ktFsthtn+?=
 =?iso-8859-1?Q?03g9fLZvGEMFn7+9dZKxdgTNwyEHVtqO/p26w8z291QpIddsLTOCcK0Gdu?=
 =?iso-8859-1?Q?xkSaa9YUbIgqGLj8OJY3Clb3WbmLCAwKrwCs6Pj8k5DjjxuITzX656LvWD?=
 =?iso-8859-1?Q?MSbjWOU2Xk404+mbK1L3AvE+DB8VBS+rXEPryE7hJEZ8VCju02MBLW8Ltx?=
 =?iso-8859-1?Q?H9pteSpAE1yJuwFv0Cm4qc9klGkt3iChvLQJMW6ZB7xqLHFjXEdPcxp1xo?=
 =?iso-8859-1?Q?PUNz8jXvDadPnLdOD5mD/hEWI56PJRyqQb+nLPJW9n8ZJ2YhBY1DhleqCy?=
 =?iso-8859-1?Q?2HfAhjFJWvF9Jr6ySJgl5H9Sh9TE/8M9hjstcKiIqi/A9k3OD9/AW+aLNP?=
 =?iso-8859-1?Q?g5A7usgcQ63I17yYTk6HRFrYZ5rXnUrbx50XIRp+qBpuH7LE7ifkhg7GsU?=
 =?iso-8859-1?Q?9YYwFEW3LiJ6qDTlcX73mKieIhT7dcNeCaKzDE8PzQdg5R4PbkVrEcuYrU?=
 =?iso-8859-1?Q?dnYrDXRHsRSnlobeMYsMNSmMI4s5hHOJx2gLIurN6/YrBe28k+0x4pkhYm?=
 =?iso-8859-1?Q?4Qk7A7QZJ3dGVUCzzz5JE01QGPvU81UaFNM4fQk2bdoh7GuNCoTT3stW9r?=
 =?iso-8859-1?Q?Eg5RH9+wNg+FtGRUdjZj7QKhvO6igRybzuSJomqV6WAS+uUYdNDQ4GqT8R?=
 =?iso-8859-1?Q?1ldHpID65FIc1eQwmvVc3UEbO5+9hbTqh0VFP76440d7chq3sNaBRRh1sd?=
 =?iso-8859-1?Q?4TUmCBE8GyqGemyCG6S0sZ6Ns/pa6IejO8z1E3KBqGBm9O+rFsXRslVwZk?=
 =?iso-8859-1?Q?Zp0PYm/7/7eiVmbhSbNMWAf4TazBTL+qfLm9YWlrY4iaaTomHvtM5qiXlY?=
 =?iso-8859-1?Q?UBkEIut/7DNd4kA8OHtSkg/7rJcDSUechLINZQXxQpa9+0k0fhvrBTY2mt?=
 =?iso-8859-1?Q?A3WBlaS/YqXFxlnGbezE1X9Smvx5MRatQxntr6J0RNLlMpI0JTQxvLGa4c?=
 =?iso-8859-1?Q?3zF8T1HCwzOBEDUtksRRLb5ldH/BkZ6tcT6v3+EaIXAHjr3fhp5Gp4Lr33?=
 =?iso-8859-1?Q?EXZgt+Z/0NEJEf7oQPWB0F8CZ6kXzcsqSgzZH+X3TgBBGCRNcJNxwJIDAn?=
 =?iso-8859-1?Q?BdmWFUGigv/Cp7sDRrkpN7XCHs+1MyfxzhFb8ZP/SSVkySQksvuT9VTTOP?=
 =?iso-8859-1?Q?1ctR40DoK8WTeOcUVN2KN+pWsO2xunwcIn652zPHTHC5bm6vpJLlqPOOiv?=
 =?iso-8859-1?Q?Ma9plJgibIwBysN7kZr41fixiDwl4OiEvu7VUlhWrFS8AOahu5MzNiif/h?=
 =?iso-8859-1?Q?blgkj+H8IpEZkzaRTP3wjZDv7f/y9Qt7M0tEivuU/LOpTn7+SIRoBRg2+d?=
 =?iso-8859-1?Q?Hf0wgKMHSAEa3LvMuWN/xzYApxzBtZ4V60OBuN14j1yVRAhcP739tNe+Yy?=
 =?iso-8859-1?Q?Ro?=
X-MS-Exchange-AntiSpam-MessageData-1: 3e4UpZtxCpmR05oo/BKg+JWkslvpCpnTW/s=
X-Exchange-RoutingPolicyChecked: zMy4H7epj3vxtBcbO8HbWJpfxtlLvmM3+nS28v174c8LGsfjPnM4fgbng2VAAVRGMse5N6a2ieXqfyG5gOG/lIbJG3RfrMKBM3p0W8mOG2A5mme5B4cQ+IRaKJcZMmBXOxKjbHZ0AsqG9vH/bY9MNOFXsCfVrRVw0LjBDRYg5LRVhoKOD6Vi+1NifLFVf9Og0AyTjp+1SdhCaptDLLnS87uHOHCbOXXNlt9L4UZeEi5fXu2MYc+cxOgJ4dolP2HIOEiPc4h0yx0g6LjbOS1HrF/srA81sZQZJkI61/K7aVm9jlcFlrid7wmaHMCKcQsdR8ULiMKfPO6W1YhkMyepNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7639007-ee63-416d-e7ee-08df3460c28c
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:30:29.7287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OppL9G36raioKKFJfi95Jhu38h2GHKQjM+8TXkz+Z+7anzTrvtC/pFiDZiLr/t6eW+1koBVb1O2ELoP0WnRF+QQRz0eo22+UrKtnkl55s8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7326
X-OriginatorOrg: intel.com

On Fri, Oct 23, 2026 at 09:22:02PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe: 32-bit multiplication overflow in adjust_idledly()
> --
> 
> commit 1632f9f2c26646be902e4438963fff43c54e34fd
> Author: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> drm/xe: Drop early and redundant workaround checks in adjust_idledly()
> 
> This commit removes the outer workaround check in adjust_idledly() and
> unindents the body now that each workaround check is scoped to its own
> conditional block and the function returns early when no workaround
> applies.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index e201fa96ee867..00af7344067d3 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -600,77 +600,75 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> >  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> >  		return;
> >  
> > -	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
> > -		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
> > -		if (!idledly_units_ps)
> > -			return;
> > +	/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
> > +	if (!idledly_units_ps)
> > +		return;
> >  
> > -		if (XE_GT_WA(gt, 14025941587))
> > -			min_idledly_ps = max(min_idledly_ps, 5000000);
> > +	if (XE_GT_WA(gt, 14025941587))
> > +		min_idledly_ps = max(min_idledly_ps, 5000000);
> >  
> > -		if (XE_GT_WA(gt, 16023105232)) {
> > -			u32 maxcnt_units_ps = 640000;
> > -			u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> > +	if (XE_GT_WA(gt, 16023105232)) {
> > +		u32 maxcnt_units_ps = 640000;
> > +		u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> >  
> > -			max_idledly_ps = min_t(u64,
> > -					       max_idledly_ps,
> > -					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> > +		max_idledly_ps = min_t(u64,
> > +				       max_idledly_ps,
> > +				       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> >  
> > -			clear_inhibit_switch = true;
> > -		}
> > +		clear_inhibit_switch = true;
> > +	}
> >  
> > -		/* No applicable workaround found. */
> > -		if (min_idledly_ps == 0 && max_idledly_ps == -1 && !clear_inhibit_switch)
> > -			return;
> > +	/* No applicable workaround found. */
> > +	if (min_idledly_ps == 0 && max_idledly_ps == -1 && !clear_inhibit_switch)
> > +		return;
> >  
> > -		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> > +	idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> >  
> > -		if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED) {
> > -			idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> > -			wa_applied = true;
> > -		}
> > +	if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED) {
> > +		idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> > +		wa_applied = true;
> > +	}
> > +
> > +	idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> > +	idledly_ps = idledly * idledly_units_ps;
> > +	idledly_hw_ps = idledly_ps;
> >  
> > -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> > +	/*
> > +	 * min_idledly_ps is applied before max_idledly_ps, which takes
> > +	 * priority if the two ever conflict (not expected in practice).
> > +	 */
> > +	if (idledly_ps < min_idledly_ps) {
> > +		idledly = DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
> >  		idledly_ps = idledly * idledly_units_ps;
> > -		idledly_hw_ps = idledly_ps;
> > +		wa_applied = true;
> > +	}
> >  
> > -		/*
> > -		 * min_idledly_ps is applied before max_idledly_ps, which takes
> > -		 * priority if the two ever conflict (not expected in practice).
> > -		 */
> > -		if (idledly_ps < min_idledly_ps) {
> > -			idledly = DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
> > +	if (idledly_ps >= max_idledly_ps) {
> > +		if (max_idledly_ps) {
> > +			idledly = DIV_ROUND_DOWN_ULL(max_idledly_ps - 1, idledly_units_ps);
> >  			idledly_ps = idledly * idledly_units_ps;
> 
> [Severity: Medium]
> Can the picosecond multiplications in adjust_idledly() overflow 32 bits?
> 
> In the Wa_16023105232 check:
> 
> 	max_idledly_ps = min_t(u64,
> 			       max_idledly_ps,
> 			       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> 
> both REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) and maxcnt_units_ps (640000)
> have type u32. The multiplication is evaluated in 32-bit unsigned
> arithmetic before min_t(u64, ...) widens the result to u64. Since
> IDLE_WAIT_TIME is REG_GENMASK(19, 0), any register value of 6711 ticks or
> greater (~4.295 ms out of the ~671 ms range) exceeds U32_MAX when
> multiplied by 640000 and wraps around.
> 
> Similarly, idledly (extracted from the 21-bit IDLE_DELAY field) and
> idledly_units_ps (8 * gt->info.timestamp_base) are both u32:
> 
> 	idledly_ps = idledly * idledly_units_ps;
> 
> At all three assignments of idledly_ps in adjust_idledly(), the product is
> computed in 32-bit arithmetic before being assigned to the u64 idledly_ps
> variable, which overflows whenever the delay exceeds ~4.295 ms.
> 
> When reached during GT initialization via:
> 
>   xe_gt_init()
>     -> gt_init_with_all_forcewake()
>       -> xe_hw_engines_init()
>         -> hw_engine_init()
>           -> adjust_idledly()
> 
> this truncation can trigger a spurious xe_gt_WARN_ON(gt, idledly_hw_ps >=
> max_idledly_ps) warning and program an improperly clamped IDLE_DELAY value
> into RING_IDLEDLY.
> 
> Should maxcnt_units_ps and idledly_units_ps be declared as u64 (or the
> multiplications use mul_u32_u32() / a u64 cast) so the products are
> evaluated in 64-bit arithmetic?
I agree with the bot, similar to others in series move from u32 to u64
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com?part=6
