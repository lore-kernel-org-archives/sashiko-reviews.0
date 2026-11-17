Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794876002;
	b=t3Qnz/1lDdeiJcnuOU5tYoQHAlyuezp/yFHCIBuV/NHSXx+1XBECd/lJN7jSZm//yBC+
	 D9EaM2tHzGbKw/4y74eLDqzrmXYBYaLd9lDtvFg+UnBi7Fw4sYznSi3Na9whyc2JJcGfo
	 cipy87JKTcxnymsn2xR0F/bcTYBVh9+ZPTPVJBIJKPrrFYVE8gDs4whtxDtOdWGPVB5Hx
	 fNfLRQfob1ltPS3O5n8fiGIJI9BTduU0Fzj/f+dg+K5ZRULPw3GTUDlyDxVswTC8g5uEy
	 jLOfUAWZVQDQqMSLsqAO9+3soj64+9/LPSDSGUMw3j+Xq5YikZd19JcZuIYPvZ+AbaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876002;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=i7juHAK3cvEQod054ao1+2nUnocxn/TIB4wX+zW0ENo=;
	b=MSrW2qdDFMLIHh70HrLhTv70YB83ueGwSbKJ7q/Ut+e18xIe+6d5t65TwpKFYcOeZGmc
	 4ZR8i0SJ+GiMzMgvZbGQUNyvE3b0xL2YRG4fw/Dwnk/Anv3TyafJ0Zdt6Se2jnmtO7jBP
	 6BA9EVJ3NGTkjQZWJouN8oKhtq1NvG181/hr32ZCj8R64UgT/2JmQciN4MVzs4MIiqdGU
	 H09+rcRWkJILjKOpKzCT2ebQ0sO2gJCqs+zO63NsBp0Az8JLAcvRjH/ITfSOyYuIXKa7R
	 /QJAbHepDNV3ok1fg7ATOmR5g6zjD8iYTGx7TMxZP95BxlkqcCi4QeM2AXk9XCdX3vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YtxI5HjY;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ORmQo42d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E5606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 00:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C12E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YtxI5HjY;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ORmQo42d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794876002; x=1826412002;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=qNC4mO22QBA4grWeBTt7qLfzuEvdaTi/Jo0nF6H/gF4=;
  b=YtxI5HjYoR7sDaNxwltgN9gTRt5I0FANMUwvsOMHOnXyvpKlTSHWTR+9
   JyiGRmoEWm5ApS/7wkz6NITYdI8Js9pBCkEXO7scX9PJBBrlW2wyJnryi
   Puiox0amuIGoOdeFGHhmEtSTbW0rgfLibdmm55/tUn87olg8r3ElLPPmA
   E9J3rwwYxI3/1STLqVMQDJSWaSWrIeJLuTUX6m4a0s6O8qZMWhOAzsHAz
   KfG5JhhpwpmtkoL1X98739r/XyIrYFKQxmrhUkz+CgJfFvBPgBshIVIjW
   J/SmgipZOQU5WpwkAYbcH0OkOxPsuWygv5y0d707I66D71RxkmMqAmkcy
   Q==;
X-CSE-ConnectionGUID: sa0SceuTTY+QSUKJ/FS8qg==
X-CSE-MsgGUID: 0neh98+8RmOsTLdTO29RcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3533109"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3533109"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 16:40:01 -0800
X-CSE-ConnectionGUID: hdl5dybeRkCw+/oO+B1NMw==
X-CSE-MsgGUID: SRu96St8SUm+kr4+2YFutw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="10016210"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 16:40:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 16:40:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 16:40:00 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 16:40:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OyhIb15UzdCnFktwb6zQSISAG95En/NcOmXcwNZCEVRB3xUZp0n6xGoabIC6rIvVhuz8HfTXzYXveuMcbreb0pzgFU68mAf361mBmDF00jBoVDzsOUjgx5KjUYwbTBireQpnQDONxWQ8BzPDIS2bjoD73YTsbPodu9uXMPqk01O5gkZPZy2Fvdp+o52yhCiL/lXCKBQ6uVN4DHNmFpWefH+yQq7XK4R/O15PcnZA7WCqal8v2LO2ofdUJ/hYpUzWJu0y+YzI2TpObmrxXVMaBut/RlDVu0kOy7nYAygvhZjS6CwK7CGwlqQZM9mu4Mcqni6f6sdJuvO/UThi5uTKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7juHAK3cvEQod054ao1+2nUnocxn/TIB4wX+zW0ENo=;
 b=AlJxBVRcjwwAY4HvUMhDgep2B1N/P6Yv2+p/TMcDxLOtPbp11JsKrCA78n9QifyaxybN4YSFjjZQYgiigSnZvs6trkuDDvhFLd7106lgvfM8UE7qKslUFlJE+G6IFpZzCqJG+PfV9qCVbmdO+U8WVdNbOLs2GFCubVJHCCTaQK/CU54OZLQL5DBvB3HyBB4P47TwU4fLZomhD7gEWOfr5cEQhr5TEFOnsrZ+1z0DU8R+pYmJdkG6jACvklr74ma8mmSt4fBd7hIZk44fQIgoitU8Z05bzxQBgp9zzztYARk9p6HyGeajgl+TLvMbicLHqTggtff38OvrVpCAIWcOZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7juHAK3cvEQod054ao1+2nUnocxn/TIB4wX+zW0ENo=;
 b=ORmQo42daYsoVvBU2/SktYkQQSHhQE6fxLEROzBDUj+PczT9ks8sU4DiNQujePW6OTj0Q2fYOOUCh+vDIX2XYyWnXyKygbhQszxYMxOdcYrFrNjhqbZ8WW15Ms+xxbQ6rELQOd8y0RSzgsk3XZShEiFsyQ9uWPWSfs6Pk4KCDJs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 by DM3PPF99D0888FA.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 00:39:58 +0000
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c]) by SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 00:39:58 +0000
Message-ID: <d7ca984f-e9ac-4299-88d9-5c9c48de1db6@intel.com>
Date: Mon, 16 Nov 2026 16:39:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v2 4/4] ice: use struct timecounter for E825 and
 E830
To: <sashiko-reviews@lists.linux.dev>, Intel Wired LAN
	<intel-wired-lan@lists.osuosl.org>
References: <20261113-jk-e825-e830-timecounter-v2-0-9c357a7ed349@intel.com>
 <20261113-jk-e825-e830-timecounter-v2-4-9c357a7ed349@intel.com>
 <sashiko-outbox-213873@kernel.org>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-213873@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::7) To SJ2PR11MB8451.namprd11.prod.outlook.com
 (2603:10b6:a03:56e::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8451:EE_|DM3PPF99D0888FA:EE_
X-MS-Office365-Filtering-Correlation-Id: b78892d8-628c-4f1b-64df-08df44434ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|6133799003|3023799007|5023799004|11063799006|4143699003|56012099006|10067099003|261022075727099003|261026121527099003|261028144727099003|261021123027099003|261009221227099003|261021121427099003|261009223327099003|261009221727099003|261026140227099003|261009223027099003|261102123227099003|261009220027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: s2SN5zgVwDTzo44Qy/oOaFUviO1ASxjPP0cbbjassfS++V8ttJrTyqrHnu737pXcKfbQlCLmoyvkZKf7Wgxi+58Wk42CW1JCDQ+qgRwVqfrlr0YpqsbC34BZAQ8L53OgYhsVuDqLZdnXoatoS5Kmt3mQm4s+ffPpoopUIHz9kxnxi8UMZtTfAd/oiTX7NbpJSKdmxIZcmCY1lcWC8MFXf7IM6rdAcPQFquX6rG89Aoa+wmCXe2uDlXa38WIaIEk2t4s62eOs88KaOjBIr4f4D6f6AeOmhhzrCZaurnU54B3HMD0SbomedoaBSb7bKVLOvFl5Lk+85mJPZO4MhIw6uT+sOtL7J97a4Vk47SZ8czyxfUp3GWd/x+a2sGI69RST6+bO9SjV1zipGwRv1LNupC8FD3XfP412AeueCNmVc9N+YpBnVvmrDSqLor3mEuGai1QKQmwadnLs0xONuG4MULhiMUxeysuRG7iB9xLoV59Jd2ECPzJdYBEkAn4M+IVyyfdcUxr932fAh4R51qu0W7GZeD4O6/3/Fo2sTIiuKUN1sAXyKzrac9HTpGNrHVqfaypbJc9MoTCNQMRmGVzj7kPukFvfPOBM6+O7Hg+Fq/lGPiJPI0Lo3xNOMvCnG2FnwezO11AXDaLjo1ciuMJyO67sKed2pNBTYDqIML27hVk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8451.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(5023799004)(11063799006)(4143699003)(56012099006)(10067099003)(261022075727099003)(261026121527099003)(261028144727099003)(261021123027099003)(261009221227099003)(261021121427099003)(261009223327099003)(261009221727099003)(261026140227099003)(261009223027099003)(261102123227099003)(261009220027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUF1emhhbGdNOHltTm1XL0lpaDBGeEpMQStRd3ZwMGJKNmdiMjJRWVpkMmI2?=
 =?utf-8?B?b2RJWFNaRDB1ekM1ZHl2YzdXbi9aZGtHeFBydXpPbnltS2VRaGZpRDZFejln?=
 =?utf-8?B?cDRNMzE1Zk5LQ1ZkN2k4R2ZNN20zcjBRWUo5eExta1FWUXp4eHNhbmNPZEFo?=
 =?utf-8?B?RXhSZDdrQ0JPdkVKK0ttdVQwcWp2QzdjZW5wQ2JzM2YyZXNUTXlUMDRxNGF0?=
 =?utf-8?B?L0pGZzNrV09YZkdnT01hVWFWdEx5TXpxVTBBQmRReEE2dEpCbCtyaUdZRVBS?=
 =?utf-8?B?WlRHTTFEUkFFQzB4WXlmRythUi9IbC9YUThzYkFFWHNTV0crd3h0aUFQKzRr?=
 =?utf-8?B?blRlZFNQczBhN1hnSDJnM0xkeCtTM0JKSktzUHJiVVVKS2NIRWlTVVdVckRZ?=
 =?utf-8?B?blNvT05jb1JlcnZvSWRPdGZWNDdvTkZxdERCMm4xdUIvZFd6YmR1SEcwazY3?=
 =?utf-8?B?WEtDUE9mMDQ3VWFIWjhzMkZnNXNwbUdaZTgyVmVEMWlxOVlwVmFMZnZydFls?=
 =?utf-8?B?aW1VYlM3V0RPUnUyenZBK2VBZkFVU1BoUDE4dEQvcVUvYkFGNFNtWkZOL0JE?=
 =?utf-8?B?ZitLUGM3U0JwOFdSRnlEUnk4WGVMRlZUQ0V0cWJWQThNY2JrKzd5eGQvd1hE?=
 =?utf-8?B?SDVjZEdpZ0xrVEJ4R3pqQW5TNG9nV1hJd0U0OFM4L2JvVXJ3Ylo5WUllRUc2?=
 =?utf-8?B?Tngyb0Z3MmF2RG1RMnFXUmFiNEFReHA5ODEwaFp5Nnk3SnVsdzRZcC94OElL?=
 =?utf-8?B?d1NKL3BXYXp1bDJEZFJ2OVpUczZMR0tzbEQ3Nlo2UUc1TmFPaWlIUnpKYkty?=
 =?utf-8?B?dHBMNzlITFhtcm5RTGtaWVE4YnVBWDNRTFFSd2hQSGFWRGloRTVxbGtNeVc0?=
 =?utf-8?B?RmFqQUFUNXozNnk4VDFKQkM1cC8zOER2OWpRUTNnemZCeHVSRFg1MnplMzRu?=
 =?utf-8?B?TWZoQjg0dW1BbGdOVFFJNEpqdTI3bFNzTkk5UWo2OWljM1k4ckEvWGl2MzdQ?=
 =?utf-8?B?clF1eXM0RWJuOEFXU0E2RE5XS2lOWjZnakdYVjNZYUV3U3J5Um1XUXAzTGI1?=
 =?utf-8?B?ampnUDNtUFJWTzkvTW92dlJJeURXYUZwQlRXRXBGS2pCTXhiTm4rNjIya2ZI?=
 =?utf-8?B?cjRha3VoNEN5N3FWcGxpdStmb1lZQ0hzRlhmTVVnUWJyMmg0WFhyaFFLc0hK?=
 =?utf-8?B?bUlFdlcxQnlWNis3a0ZvREsxZk8wbXRSeDk2aXZGS25OVGR2RUE5UG5Ib3g5?=
 =?utf-8?B?dVZUUlBiYUNGaW11WW1pU1M2aXdiYnZ0N2dMdGdJcGNqaHMrWWl6SWZjbDJa?=
 =?utf-8?B?UHFnMFlPRlpXaGgya21QR3Rka3c3UlQ0TWNRQ3dIU0gvdUJXeWdMTjBRK2sx?=
 =?utf-8?B?TStIRW5EWU5yYzdUY20yVURaeE00YUpsV0cxeGtmVkhiaEZNTEQyUzZjcjhw?=
 =?utf-8?B?eStZTmRpbWp5NG9EZEFaSkpCbVA4QnVydW5WdktUbjE3Q0l0YUpnUnZxR0hP?=
 =?utf-8?B?a0Z0eU5oMnBxWEhiRGpjSjg5cDJtYTJzQ2hORndma3lWVDlYcTdDV25GN2tG?=
 =?utf-8?B?cXBtdXArRmUvSFZLU0NCWEROUThFWjRSUGZuWEdOSnlkYWZBVU52emFhVnNq?=
 =?utf-8?B?UUZqbmlqV0ZMZDRkODRSYWRETDQ1aWxwcEJxcTU1Rmo3aCtwNk1uTjg1YkpL?=
 =?utf-8?B?Sk5PMDBKampDZGZXZC9rYUNaNnlTMmU0ekZuYnBINU5XZ09Wc0VUZlRkVFRN?=
 =?utf-8?B?eXpnNHR0TlMrNjBHR0xCM3B5T0lCNjUrZFU2ZzkrWEYwdlp5UXduclp3c2x2?=
 =?utf-8?B?dXg4Q1h2NTZxelMwc0kybEswMnYwSFhwcUpnY3pVaXRiWk5CUXAxamlzRkpJ?=
 =?utf-8?B?c21XZENYdk9oMzRiKzRDZStmS1g0WlB4WWppd1kyVDBYK0xUYks5SEVZU29l?=
 =?utf-8?B?Z3kxeHkvRDFJTERhNEYyNndhT0p3NGZUWndHRHhrbSszaExFK0hnVWZ4TjRO?=
 =?utf-8?B?VitpSmJsQ2FvQlBPMndyL0FpQXhnUHV0eFRBQjFzNUZvTHRMTXpmcklTamw5?=
 =?utf-8?B?UHVFOUVYaG5oZzFTNFQzbjZaMVh0VG9JNDN2UENCMUxoNjF5NUd4amxUd2Vj?=
 =?utf-8?B?MW5qaGtkSmNmYk8vRU5NZlFpNXQ0ZGpkVTlnNnp1MCtWTjhGZzNGV1MzRGh2?=
 =?utf-8?B?MHdjcnNTSnQxU29tYmhMVStsSnkrK1c3bkhrSUpzNEphTVByZ2JRam8vNE5D?=
 =?utf-8?B?V05IVmtBYXJMWTBzSUZnR1hJeFRjNmtmTzZTZGxGN0kzMkl1dGw5L0piMmVW?=
 =?utf-8?B?eHdhMWFQczd1MVVyb0hsTGZOTmJlNHpQMnVPU1BsVlAzdDE4RU44QT09?=
X-Exchange-RoutingPolicyChecked: p4tEspHTBIe3csfCmaxtEUCMfwpELNqo5SoEKN3kJ0ClBHkV+0zAJOp2L9QY0rXRppUPsM3kUzOfmqRgeW/FSssNc0neuz/sUyFonjA1mA18BKstc+Sm0De35Z+nCpFY+5BaY0MuIWGRGZ9vWpPSyl7uYN8K/qFa9Nia9JqK0CHj5aW8/znGIPCoRlZqcgPvhyNOC4u815cbxLktfRj/XTlQcg1n1BIK/g1Klhy029i1yu5PUAHIFtr8N1rUapf5l8g01zG32fMoEPf24b4k2b0dvL0Y+6dE+VgKpMxhJ8HlUP+P6ghKiUn1ChqK0Zjq1EKFgvLV7oR56iTr4yo7nA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b78892d8-628c-4f1b-64df-08df44434ec4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 00:39:58.6472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6x/dvkH4u/HqI8kzoLDvDG5NB+5AY5GlejhddQgAf8jZxDCwfikxWBxf9DjWu4jy3bZXmutIHwD+9FjYdfNT/8BSfdfmKc+7c4YVQQbOpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF99D0888FA
X-OriginatorOrg: intel.com

On 11/13/2026 3:46 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ice: perout_rqs updated outside phc.lock in
>   ice_ptp_gpio_enable()
> - [Medium] ice: premature update_jiffies store in ice_ptp_read_cycles()
> --
> 
> commit 2dbce654e6813d30b319e71f8e68ca2b82a4b244
> Author: Jacob Keller <jacob.e.keller@intel.com>
> 
> ice: use struct timecounter for E825 and E830
> 
> This commit switches E825 and E830 devices from direct hardware PHC time
> adjustments and legacy 32-bit timestamp extension to a latched
> timecounter/cyclecounter stored in struct ice_phc.
> 
>> diff --git a/drivers/net/ethernet/intel/ice/ice_ptp.c b/drivers/net/ethernet/intel/ice/ice_ptp.c
>> index a0451c1083a41..b48d1bf3bbf59 100644
>> --- a/drivers/net/ethernet/intel/ice/ice_ptp.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_ptp.c
>> @@ -272,6 +272,202 @@ int ice_ptp_read_src_clk_reg(struct ice_pf *pf,
>>  	return 0;
>>  }
>>  
>> +/**
>> + * ice_ptp_read_cycles - cyclecounter read() callback function
>> + * @cc: the hardware cycle counter structure
>> + *
>> + * Read the PHC time via ice_ptp_read_src_clk_reg() and report it for use
>> + * within timecounter_read() and timecounter_init().
>> + *
>> + * Although the cycle counter is masked to 32-bits for timestamp extension,
>> + * this still reports the full 64-bit time to enable determining the phase
>> + * difference between the PHC hardware value and the timecounter properly.
>> + *
>> + * Return: The current PHC timer value from the hardware on success.
>> + *         Since failure cannot be meaningfully reported, return the previous
>> + *         cycle_last value when unable to access the device.
>> + */
>> +u64 ice_ptp_read_cycles(struct cyclecounter *cc)
>> +{
>> +	struct ice_adapter *adapter;
>> +	struct ice_phc *phc;
>> +	struct ice_pf *pf;
>> +	u64 time;
>> +	int err;
>> +
>> +	phc = container_of(cc, struct ice_phc, cc);
>> +	adapter = container_of(phc, struct ice_adapter, phc);
>> +
>> +	scoped_guard(rcu) {
>> +		pf = rcu_dereference(adapter->ctrl_pf);
>> +		if (!pf)
>> +			return phc->tc[0].cycle_last;
>> +
>> +		err = ice_ptp_read_src_clk_reg(pf, NULL, &time);
>> +		if (err)
>> +			return phc->tc[0].cycle_last;
>> +
>> +		/* Paired with smp_load_acquire in ice_ptp_extend_32b_ts */
>> +		smp_store_release(&phc->update_jiffies, jiffies | 1);
>> +		return time;
>> +	}
>> +}
> 
> [ ... ]
> 
>> +static void ice_phc_refresh(struct ice_phc *phc)
>> +{
>> +	lockdep_assert_held(&phc->lock);
>> +
>> +	write_seqcount_latch_begin(&phc->seq);
>> +	(void)timecounter_read(&phc->tc[0]);
>> +	write_seqcount_latch(&phc->seq);
>> +	/* Update the secondary copy */
>> +	phc->tc[1].cycle_last = phc->tc[0].cycle_last;
>> +	phc->tc[1].nsec = phc->tc[0].nsec;
>> +	write_seqcount_latch_end(&phc->seq);
>> +}
>> +
>> +/**
>> + * ice_phc_init - Initialize PHC timecounter to new start value
>> + * @phc: pointer to the PHC structure
>> + * @init_tstamp: New initial value for the timecounter
>> + *
>> + * Initialize the PHC timecounter to a new offset. The latched sequence
>> + * counter is used to ensure readers get a consistent view of the timecounter
>> + * phase. We always pass the same cyclecounter structure, so the mask, frac,
>> + * and cc fields always remain the same, and only the cycle_last and nsec
>> + * fields must be propagated to the secondary structure.
>> + */
>> +static void ice_phc_init(struct ice_phc *phc, u64 init_tstamp)
>> +{
>> +	lockdep_assert_held(&phc->lock);
>> +
>> +	write_seqcount_latch_begin(&phc->seq);
>> +	timecounter_init(&phc->tc[0], &phc->cc, init_tstamp);
>> +	write_seqcount_latch(&phc->seq);
>> +	/* Update the secondary copy */
>> +	phc->tc[1].cycle_last = phc->tc[0].cycle_last;
>> +	phc->tc[1].nsec = phc->tc[0].nsec;
>> +	write_seqcount_latch_end(&phc->seq);
>> +}
> 
> [Severity: Medium]
> Does storing phc->update_jiffies inside ice_ptp_read_cycles() publish
> the timestamp before either phc->tc[] copy is updated?
> 
> timecounter_init() and timecounter_read() invoke cc->read() before
> writing tc[0].cycle_last and tc[0].nsec, while phc->seq is odd and
> directing readers to phc->tc[1]:
> 
> CPU0                                  CPU1
> ice_phc_init()
>   write_seqcount_latch_begin(&phc->seq)
>   timecounter_init(&phc->tc[0], ...)
>     ice_ptp_read_cycles()
>       smp_store_release(&phc->update_jiffies, ...)
>                                       ice_ptp_extend_32b_ts()
>                                         smp_load_acquire(&phc->update_jiffies)
>                                         ice_phc_cyc2time_with_trace()
>                                           seq = read_seqcount_latch(&phc->seq)
>                                           /* idx == 1 */
>                                           timecounter_cyc2time(&phc->tc[1], ...)
>                                             <-- uses uninitialized or stale tc[1]
>     tc[0].cycle_last = ...
>     tc[0].nsec = ...
>   write_seqcount_latch(&phc->seq)
>   phc->tc[1] = phc->tc[0]
>   write_seqcount_latch_end(&phc->seq)
> 
> During initial bringup or after a reset or delayed refresh (>2s), CPU1
> sees a fresh update_jiffies and extends a packet's 32-bit hardware
> timestamp against an uninitialized (zero) or stale phc->tc[1] snapshot
> instead of discarding it or using the updated timecounter.  Recording the
> new jiffies value and calling smp_store_release(&phc->update_jiffies, ...)
> after write_seqcount_latch(&phc->seq) (or write_seqcount_latch_end()) when
> cc->read() succeeded would ensure readers only see the fresh timestamp
> once an updated timecounter copy is active.
>

The problem here is that I do not have a way to check if read fails. I
suppose we could modify the timecounter API to support reporting a
failure from read? In practice this read should basically never fail
except in cases near a teardown that drops the ctrl_pf from the
adapter... I don't really want to try and add yet another variable to
the structure but that would be an alternative fix here...



> [ ... ]
> 
>> @@ -1974,7 +2202,10 @@ static int ice_ptp_gpio_enable(struct ptp_clock_info *info,
>>  		if (on && pf->ptp.state != ICE_PTP_READY)
>>  			return -EIO;
>>  
>> +		/* Serialize against concurrent timecounter updates */
>> +		mutex_lock(&pf->adapter->phc.lock);
>>  		err = ice_ptp_cfg_perout(pf, &rq->perout, on);
>> +		mutex_unlock(&pf->adapter->phc.lock);
>>  		if (!err) {
>>  			*cached = rq->perout;
>>  		} else {
> 
> [ ... ]
> 
>> @@ -2086,6 +2319,43 @@ ice_ptp_settime64(struct ptp_clock_info *info, const struct timespec64 *ts)
>> +static int ice_ptp_settime64_tc(struct ptp_clock_info *info,
>> +				const struct timespec64 *ts)
>> +{
>> +	struct ice_pf *pf = ptp_info_to_pf(info);
>> +	struct ice_phc *phc = &pf->adapter->phc;
>> +	u64 ns;
>> +
>> +	if (pf->ptp.state != ICE_PTP_READY)
>> +		return -EIO;
>> +
>> +	ns = timespec64_to_ns(ts);
>> +
>> +	mutex_lock(&phc->lock);
>> +
>> +	ice_ptp_disable_all_perout(pf);
>> +
>> +	ice_phc_init(phc, ns);
>> +
>> +	ice_ptp_mark_all_tx_tracker_stale(pf);\n+
>> +	/* Reenable periodic outputs */
>> +	ice_ptp_enable_all_perout(pf);
>> +
>> +	mutex_unlock(&phc->lock);
>> +
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Can releasing pf->adapter->phc.lock before updating *cached
> (pf->ptp.perout_rqs[rq->perout.index]) in ice_ptp_gpio_enable() race with
> ice_ptp_settime64_tc() or ice_ptp_adjtime_tc()?
> 
> The POSIX clock layer only holds down_read(&clk->rwsem) across ioctl,
> clock_settime, and clock_adjtime calls, so ice_ptp_gpio_enable() and
> ice_ptp_settime64_tc() can run concurrently:
> 


Its weird this was placed here, but ya, I think we do need to hold the
lock until after the report back from gpio_enable.

> CPU0                                  CPU1
> ice_ptp_gpio_enable()
>   mutex_lock(&pf->adapter->phc.lock)
>   ice_ptp_cfg_perout(pf, &rq->perout, 1)
>   mutex_unlock(&pf->adapter->phc.lock)
>                                       ice_ptp_settime64_tc()
>                                         mutex_lock(&phc->lock)
>                                         ice_ptp_disable_all_perout(pf)
>                                         ice_phc_init(phc, ns)
>                                         ice_ptp_enable_all_perout(pf)
>                                           /* cached->period is still 0 */
>                                         mutex_unlock(&phc->lock)
>   *cached = rq->perout;                 <-- HW keeps pre-settime phase
> 
> When enabling an output, ice_ptp_enable_all_perout() sees a zero period in
> perout_rqs[] and skips reprogramming GLTSYN_TGT for the new timecounter
> phase; when disabling an output, it sees the old non-zero period and
> re-enables the output in hardware right before *cached is cleared.
> Writing *cached without holding phc.lock also races with
> ice_ptp_disable_all_perout() and ice_ptp_enable_all_perout() reading the
> struct under phc.lock.  Holding pf->adapter->phc.lock across the *cached
> update in ice_ptp_gpio_enable() avoids the race.
> 

