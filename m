Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937469;
	b=UkbVTRje7D4lorH8sZONGkarxHWhjeob23p8G+gId0UaLsjWXpmisE+A/YlGH+LhEN+3
	 ew2PZCWZSzueOfLtNN4RVFP24YZIA9qsg7Z5Xw4TtwkWKknt5q/foXtralWsK80hp0MwS
	 Y6T0D0H85JJIDeQSHYCE2piOnekbF4B+0yNMRhKyZ+CSfE1mZpSKyESJaiU8pDtSwy4a/
	 Hc/LlkmzQ1vguIga9N0ApMb7gnuOdUHWsqNC8VBvS3XbF9jaV4gjvGRpwUlHZYm1RfE8R
	 OtcM414wurAwr+n5RuURJpQbL/h/ND4drQxI59DKeCpkqQdLORDKZ2qXcALEF+KFfhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937469;
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
	bh=oEvHuWbAoaiuLC0kD+A4q8tftdCpu8LL1sjdistz/ak=;
	b=IhMxuDz5FNCHdUhHPWEfBj0WqmY0PBj2IQ1YLwst/+nzxHe1TXIDgoIrp81IsDJsiFJR
	 6gtnUlvBy2PlP1/fL7DAGA8PSARU3H8Uo8y1QVjecumecnm6MRmrRWbkm4DLdr+ogIEfp
	 mxL9HDU8zQ2g6gpEksON9t5qfzdnks1NyhjkJFj5ghX9k1JDxqUynvbuSbdnfvdx3IsHJ
	 XZxP6ePdZ0odsBjhmx3Q+iyQnYTtWgDnrKbJSKgYWq71d6nPRJVd1TkLayUhKjPt7sNA8
	 HpPTKGnXIrl8tGVyw0oE3aJm3wPMoAcxkA9csy9rPODl9PwRAnut73WjWt7xJbJIxDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JYtTye0v;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="evB/gMbt";
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65D7606A33A
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 17:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B65D7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JYtTye0v;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=evB/gMbt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794937468; x=1826473468;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wY1MaaedQRMcIlWblAMDOqJbqV0tNeJflqGoSTN2R2c=;
  b=JYtTye0vgQTCS61w3jGDs1HL4OIvIHHir54gPrqfjRqj2UCxokPugw6r
   3kUKEey6GaNtSiVw+Pl3jOkL1YZ/dPba/inmNv7nATgmf0duTZzoI/S9Y
   Q4FUxdjnl+J3dSOSHcVPQMVNFlHmUnndrdNqK6NgivHMReILUVtvZBR38
   cqW22JLxO0wz7m+4ku0vBReqnWBfg79asqSjkjE94OAmXbObvJul+0WLP
   nSWR+uSnppp/+G4z2LAXyJYbwO9bhLbe4cnW/ag8GPLbX09PjfsYQQQDp
   X/h/sGcqfbAoEaFFgqtRXZNNx6033R8dW8l0eHgE0pB02qK0XJ26V38s5
   Q==;
X-CSE-ConnectionGUID: 0+1jKPFRTSeOIOy65ggJyw==
X-CSE-MsgGUID: CXCpiSRSST26DbvdMjoIQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3824762"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3824762"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 09:44:27 -0800
X-CSE-ConnectionGUID: 9kKvxddpSNC4T0OaouRyiQ==
X-CSE-MsgGUID: gXBo4b+FQ2eZ5R547GA59g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10134106"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 09:44:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:44:27 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 09:44:27 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:44:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HytzJUT7irJlTf9JPkXzCSF4fuH4SyS6fdSeAlJBoJKtH0w8J/4mKLS/RBqYtvPipnSI+qScwLU405d2F5lU8TXmzthNryELVYRRLqsU8nON0y59bWRhlD/j/CRyhm7H7GvQrfJEmAEDnhUYmpePh4dB9JCtaZa8yepkdnVnz8pdNz1lxV/ooJQ+1GF05rME7bx8ybdtsr8iPqk+XjyWR3VeprAIK+UgGap4NgVMXwR3i7g32yMAN3vHebK//YGtdBuSCvUcMUIVGn7LOKxbXC0mLfj7W+63sa9DQy3EoPMu2yx7yDJR61/+VDr5bAhIl5YBct8gI2PWtDuduinIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEvHuWbAoaiuLC0kD+A4q8tftdCpu8LL1sjdistz/ak=;
 b=wwq5WpqQyDhZz+GGN/ReBxcMscmTY9KuEBXR1T7xwtPyGxU7EcSFf+q6HxHJzZ4dKOtblcAjnPlKQKI4ir7kbhHev3Jhdg2f8tT8wcHkLH5buzn1a7iioWYpt+bpgmQ3+BIuaOYerJsrbV/J7dEl4xpZNI1nh16TJTPbs+0h6NMyJywq48Y4EAK5vy5iCQnnGOdN/+Zc6EaOjTHsWC7wxcnHz3BJiT8U6IF5fJ1gtHf1yTbSCAl8oat/wN7UzLmz51OtYk9XTIBZMeTxOtv7gmFdZmX0lGkMti2RH9uN8cRXURXg4wUcNQ5lpWgNpifZGzikpjLOw4gQeBHOEsEhkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEvHuWbAoaiuLC0kD+A4q8tftdCpu8LL1sjdistz/ak=;
 b=evB/gMbtmu5Ca2pbJI2pZawd8OD6Wrhh3pyfbzRMxa/U3sV02Y/kalf3zj5bsb4pLsv8SMYDY0eqaQh+v+xul2F9U2qO24lsy1SpKAbyPGKfD1XNH04rYMLLabgaNODXH9oa3N+HPeLIVbf1rc0HbW5e8zf0D4q3fNDxQBMQWss=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB9470.namprd11.prod.outlook.com (2603:10b6:208:5af::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 17:44:20 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0615.012; Tue, 17 Nov 2026
 17:44:20 +0000
Date: Tue, 17 Nov 2026 09:44:17 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 5/7] drm/xe/oa: Wait for in-flight OA batches before
 stream HW teardown
Message-ID: <avyScYwJ5LCQC8F6@soc-5CG1426VCC.clients.intel.com>
References: <20261116222752.3677159-9-umesh.nerlige.ramappa@intel.com>
 <20261116222752.3677159-14-umesh.nerlige.ramappa@intel.com>
 <sashiko-outbox-217833@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-217833@kernel.org>
X-ClientProxiedBy: MW4PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:303:b7::8) To DS0PR11MB7408.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: e2475af9-29c9-4088-32a3-08df44d268bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|6133799003|22082099003|261009223027099003|4143699003|11063799006|5023799004|56012099006|261028144727099003|261022075727099003|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: 90AhTWCNootk8fktV+Xjr8KNl8r5PdHWtQilSoRR4pgRyRuTCe613uxPwrqPWMZkxAB4kVwaxc1owu8sgXWcvSURcj2bD7UZb+etiqvV1zJ0uqVR2HgO7rgw1mVrBWRpOwFXIXYUQmp70GgAJsFcXNVnZ9XHxW2+iUg4ewy8Jmq2/F08t/2+/zICzNwP52cz9si/fg5OIcn2Y7vKkn+ymOwK97SVo4m3jOF/u57wi4kF5ZXJCahEKAD7D8TvYNtdDMqZmM1AxVzd40Oz309F7FYnFGrrcYYFiYObFgsQlBnTllHcegFcgCjVljF69IKdT7A6XkrxEOgfyI8XcoJ8WlHQgSqlUD8wYY9dUEe/aAw1PU8qfmTfQ6IHTDmjudQcips2vfwRB4ijFdAy5hwnOpKv71t3O0x22+Ji+R/2udsQGy+tFqk6q1yo4lDMXJwnXSFo0wte9lsGPeoyyFm+exMVC5aWKPu61wVTIXGMvDb9ps5IdliM2CXwRE8G3u4DSPWCdATQzXdN/ZjWQ+MreY8GK1f93PNwQqbo5+bzZ3OUNOWjQqAgreEQOesSz5KyQuK+xl8v8SIHyDvF+OlFKYHFFSOy/oyNxrbbvUE/6fo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7408.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(6133799003)(22082099003)(261009223027099003)(4143699003)(11063799006)(5023799004)(56012099006)(261028144727099003)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFlqLy9VdUsvSkQ3L2lqU0NOMjRiUFp6RnRZSDROMnZrdkhoNmNvUE1mdzBI?=
 =?utf-8?B?WHF5NTFXclVQaXQxSWdiSmlKRnY2dGs5cVpNR09aWlowUzRQVnZ0SGVlNUZF?=
 =?utf-8?B?M044T1YyUmVpaTk5QzZaRWkwT2hNc3c1TFFuS0Uyak1LTlc1Nm5DNkEyNVZ6?=
 =?utf-8?B?Q0FMSVBLUlRyMU9IL3RRVzMvckJJNjZqbjJiN2NibmI4akxNTEpSNktYcENY?=
 =?utf-8?B?RVVpRGhrYU5rWmdhRzJ5SW5jSVVTOVZGRWFZbjc4RFUzOTN6bkhhT1duZHlr?=
 =?utf-8?B?cURDUVF1KzBwbTR4MDhrbDd4bWFuYVRYZFlPSFl1K2J6Zkc4djhrS1ZJQy82?=
 =?utf-8?B?R0Y3enNrZG1CVDFtdUhDaEZ5UHRxNFAyRjdNU1JocWNTYTI0MnRUZWg1NmNL?=
 =?utf-8?B?cW9udFpMRmZTZ2c3TjNiOXRqRnVJdnZNeWRtUjNUOEJmcThrNFRjZDZkVjlU?=
 =?utf-8?B?Qm9tYXNLRmhza29ocjFOOWNJWm9CZzhRWjV4dGlaQzBhSzExQWhXQ3RRUE1j?=
 =?utf-8?B?ekQvMUVGdTlJU1V3aUN6R0o3MEZIRzJWTDNzcWlIdUdDSFMzckdwL3JrSHIx?=
 =?utf-8?B?ckdCTk5kVUFXSFFYTkR1OFJWSTBkUEt2d1h3ZjJzaUFNTTdIWllhdE04RURM?=
 =?utf-8?B?TVpHZXR0N3BGK3dhekVjNjVVYnRUNERjcTVSTnBFL1RWbjltaWZWUjlNcDJt?=
 =?utf-8?B?blNiM25UUDM4a2xsQ3pVRFQwZ2lUdEhTbXUvRlBLV3NQdFFqeTNRVmFndHEw?=
 =?utf-8?B?NU5VQ01pQ1M1V080N0pWR0NhSmZ1QkUwRlV0QUJUYk4xQW9VSU9vdHpnSTJy?=
 =?utf-8?B?MVVHK2FkajBkNFl5SzFqZ2NaQzRsNk9EQlh4c2dxeXdYekI0YWpRNk1CK0I0?=
 =?utf-8?B?REhyNzJHR3JjRWErUjlZNzFTa1JWT0lHNWJJZ0pvODNXdXpzUGIwSHhUZGNr?=
 =?utf-8?B?M0p6cmtMeWZDTWtiU2FjQ0gxRFNKSHlaTFV0bVZCYXFHSG9ta2t2ZGxwTzZH?=
 =?utf-8?B?THc3bm15TEhIVE0vMFRXakoweWxpK0VKZkNHRm1URFhwYWxNT0xPcnZWKzRN?=
 =?utf-8?B?ek9JT05ZTGd1N05lTWRCMWMvd0ptazY1enk2SXNKZkVGMGE4d0ZSa1ladUxa?=
 =?utf-8?B?TUQ3QjFmclZFRjJSNHByeGw2V0daQlhlUGsrU2prTjlhK0JUeW8vTWxHM1Ar?=
 =?utf-8?B?WlN5MG1TTGN2cjgzNVZhNDRVakIrZ24zTGF0MzdsRmdnangrSnVLbXNwLy9r?=
 =?utf-8?B?Q21IOXNWR1I0SHJoMGE4VWRUMTRlYWxUL0Vja25TQTZBSS9zVXFrQ1A2cFhN?=
 =?utf-8?B?TEJnUXRVd0VWV05QdlliRllaNWZwWnlPMHFnZmF3dXVFcnlRa0lDc0NrVDZm?=
 =?utf-8?B?czduVVkvekFIYjRqNTNaOFNDdlJ6QjlpWHZiS1g4QWJFSW85YnRIVmNZUzVV?=
 =?utf-8?B?NTFoSHYvclNOWTY1VU1XSnp5VXJDczBVQ3ZZbm5Wd1R3ZEVXS1pPaEMwWHFr?=
 =?utf-8?B?dDVId1BoT05TMndXYWUxWURzTjhjWFdmKzFxcWhBdDhRVlkwdnZ6M2hZOWRJ?=
 =?utf-8?B?emZGd2VrSnAxdUJxSUU0eE1LaS90bVA2anJvWmpSVllCbWZaVTRzVEt3Z2Fi?=
 =?utf-8?B?aEptMjF6QjhlaFZkd1hWN21nL09aczdTdms1M0RZVnZFZ09BSXltTnhpNmpy?=
 =?utf-8?B?aXRoZzQyb3dWZ0l6RWRDZHVDVTBaMnY3OTFvTmpyZFFGd1JVTndmTGdGVlB0?=
 =?utf-8?B?VUk0eE1ZOTM1VCtqUGFXZ0IvbSs4QlZvQnZucTJFZk5qOEtVYU0wdENTL002?=
 =?utf-8?B?OGl4Z0dSeU4xUnlkR05GKzBqUWdzTjNtYXB5ZTFjQjVRS3dBTTVHRWRrK3F6?=
 =?utf-8?B?M0lLbFJsUUdvMWUzZWtGNWJ6WWVpcDdzalBKakJLamZIUjJjVjJibDUwTFd5?=
 =?utf-8?B?Tmg4VERQVkFWNGlQdkMxTXVDeWNpcmtTQ2gvQ1ZkNk1nRGpDdUJGOWU4UE5K?=
 =?utf-8?B?SDQ0dHRXNklsN2lFRUUzeUFGWUoxZHdGVlpzVFFCOTc2dW1QL0pDYWQ2NXRV?=
 =?utf-8?B?a011eTR0U05ndGp5Vk9yQUpnRGdnNjhFY2UxRldNVjRIbVE0ZVQ3NU85KzRL?=
 =?utf-8?B?ODNScDhGZWxwbVJoaFgvdTVVVi9KR3FtUFloOFVQdkdLbmN4TU9GYW5vNnFT?=
 =?utf-8?B?TWZ3MDVKbUxnd0xxckJLSzF4Qk8vUzFvNWxBR2pQa3Z5L09zK2krUWVydUdh?=
 =?utf-8?B?Tk5hUHFBZTVMd1NMaVEwK05meXNOa2RtWW9INXo4VGlablJNNXNNR3FwdmMz?=
 =?utf-8?B?R0p5TGdkNUNrbGtEMWdvN3ZVdFpwdWV5U1E4OXE0KzEzanV1SHZZQVRRTXpt?=
 =?utf-8?Q?IpVS+qIAslkbuXva2vfSWDizi/v4J1+PWQOg6?=
X-Exchange-RoutingPolicyChecked: QZElxpZgR+b8M2ncIlPOXukkKEwL7mFkl1NXuUGF2ImQu4acWLSMNDgwmraQ0KQEvDZDh/5niXJjDBpQ4PDsveBehXYkiWqNQXqL/fKwZ1VhUBj6eIeW1bWcL5/OzfLyGOYXrUqXxZSxZ5Q67F8I1hDUF+wVTRSLMkRPvXG2vQhREjF9mxkqCHaZhcSDeXvAgB8Y+DaIc4L9ffVoP8ylti/0FgbtIVsO6s55ioAZxYhssDiWejPIU484/mpQEb6cgGSdNTZyOyQovlxeMAHvbDXsvh6WCQWLimNKyZtHiwmW8PdTg02jOedXA8NFLEtsGp113w+68ekVCweN3cTuRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e2475af9-29c9-4088-32a3-08df44d268bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 17:44:20.3536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqrUln/WPGK/kaffJiZ6Rd+wuckRbfLfJpTDbRrvyBVgCUcgeucAq70yeSR1yMulEu6FTnNT3/yl1gIxQyjlztzsoCqTQuub4DZuZot6fhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9470
X-OriginatorOrg: intel.com

On Mon, Nov 16, 2026 at 11:00:49PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential
>issues to consider:
>- [High] drm/xe/oa: killing exec queue in xe_oa_stream_drain() leaks
>  jobs and wedges GPU
>- [High] drm/xe/oa: context LRI batch fence in xe_oa_load_with_lri() is
>  never drained
>--
>
>commit 78c0868da376abbc9e627eede4220f1019cbf62e
>Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>drm/xe/oa: Wait for in-flight OA batches before stream HW teardown
>
>This commit records the LRI batch fence in stream->last_fence and adds
>xe_oa_stream_drain() to wait for stream->last_fence before hardware
>teardown, killing the exec queue if the wait times out.
>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index 8ed427ad67b48..1a37312de099c 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -733,6 +733,12 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
>>  	dma_fence_put(stream->last_fence);
>>  }
>>
>> +static void xe_oa_update_last_fence(struct xe_oa_stream *stream, struct dma_fence *fence)
>> +{
>> +	dma_fence_put(stream->last_fence);
>> +	stream->last_fence = dma_fence_get(fence);
>> +}
>> +
>>  static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri, u32 count)
>>  {
>>  	struct dma_fence *fence;
>> @@ -753,6 +759,7 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
>>  		goto free_bb;
>>  	}
>>  	xe_bb_free(bb, fence);
>> +	xe_oa_update_last_fence(stream, fence);
>>  	dma_fence_put(fence);
>>
>>  	return 0;
>> @@ -876,6 +883,38 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>>  		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, OAM_LAT_MEASURE_ENABLE, 0);
>>  }
>>
>> +/*
>> + * Wait for the last OA batch of the stream, so that it can't program the HW after the HW
>> + * teardown.
>> + */
>> +static void xe_oa_stream_drain(struct xe_oa_stream *stream)
>> +{
>> +	struct xe_exec_queue *q = stream->exec_q ?: stream->k_exec_q;
>> +	long timeout;
>> +
>> +	if (!stream->last_fence || dma_fence_is_signaled(stream->last_fence))
>> +		return;
>> +
>> +	timeout = msecs_to_jiffies(q->sched_props.job_timeout_ms) + HZ;
>> +	if (dma_fence_wait_timeout(stream->last_fence, false, timeout))
>> +		return;
>> +
>> +	drm_err(&stream->oa->xe->drm, "Timed out waiting for OA batch, killing exec queue\n");
>> +
>> +	/*
>> +	 * The batch is most likely still waiting for an input sync, which no TDR covers. Kill
>> +	 * the exec queue, so the batch is dropped instead of run when the input sync signals.
>> +	 * A batch already on the HW gets cleaned up by the TDR the kill triggers, give it a
>> +	 * moment.
>> +	 */
>> +	if (q->vm)
>> +		xe_exec_queue_kill(q);
>> +	else
>> +		q->ops->kill(q);
>> +
>> +	dma_fence_wait_timeout(stream->last_fence, false, HZ);
>> +}
>
>[Severity: High]
>Can killing q here wedge the GPU when q is stream->k_exec_q, and leak
>jobs that are still waiting on an input sync?
>
>When stream->exec_q is NULL, q is stream->k_exec_q, which is created with
>EXEC_QUEUE_FLAG_KERNEL.  Calling q->ops->kill(q) invokes
>guc_exec_queue_kill(), marking the queue killed and arming immediate TDR.
>Once the job reaches sched->pending_list, guc_exec_queue_timedout_job()
>checks timeout_needs_gt_reset():
>
>drivers/gpu/drm/xe/xe_guc_submit.c:timeout_needs_gt_reset() {
>	if (q->flags & EXEC_QUEUE_FLAG_KERNEL)
>		return true;
>
>	return !skip_timeout_check && !xe_sched_job_started(job);
>}
>
>Because EXEC_QUEUE_FLAG_KERNEL unconditionally returns true even when the
>queue was killed, guc_exec_queue_timedout_job() triggers two asynchronous
>GT resets and then fires a kernel WARN and wedges the device.
>
>In addition, a batch blocked on an unsignaled input sync sits in
>q->entity->job_queue rather than sched->pending_list.
>guc_exec_queue_kill() only schedules TDR on sched->pending_list and does
>not call drm_sched_entity_kill(q->entity), so stream->last_fence is not
>signaled and the second dma_fence_wait_timeout() always waits out the
>full HZ.  Because the queued xe_sched_job holds a reference on q via
>xe_exec_queue_get(), xe_exec_queue_put() never reaches
>xe_sched_entity_fini(), leaking the job, exec queue, config buffer, and
>runtime PM reference if the input sync never signals.
>

The exec queue kill is now dropped. The side effect is a bad OA config, 
but that will just require a user retry until it is fixed in a later 
series.

>> +
>>  static void xe_oa_stream_hw_teardown(struct xe_oa_stream *stream)
>>  {
>>  	if (stream->sample)
>> @@ -909,6 +948,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>  	/* The poll timer may still be armed if the OA disable was skipped */
>>  	hrtimer_cancel(&stream->poll_check_timer);
>>
>> +	xe_oa_stream_drain(stream);
>>  	if (!xe_wedged(stream->oa->xe))
>>  		xe_oa_stream_hw_teardown(stream);
>
>[Severity: High]
>Does xe_oa_stream_drain() ever wait for the fence recorded by
>xe_oa_load_with_lri()?
>
>xe_oa_load_with_lri() is only called from xe_oa_configure_oa_context(),
>which runs in xe_oa_enable_metric_set() and xe_oa_disable_metric_set().
>During xe_oa_enable_metric_set(), xe_oa_emit_oa_config() runs right after
>xe_oa_configure_oa_context(stream, true) and overwrites
>stream->last_fence; if xe_oa_emit_oa_config() fails, xe_oa_stream_init()
>tears down the stream via err_put_k_exec_q without calling
>xe_oa_stream_drain().
>
>During xe_oa_stream_destroy(), xe_oa_stream_drain() runs before
>xe_oa_stream_hw_teardown() -> xe_oa_disable_metric_set() ->
>xe_oa_configure_oa_context(stream, false) submits the context-disable LRI
>batch.  That teardown LRI batch is never waited on before
>xe_oa_free_oa_buffer() unpins the OA buffer and xe_force_wake_put() drops
>forcewake (and for OAC, after xe_oa_configure_oac_context() writes
>__oa_ccs_select(stream) to OAG_OACONTROL).  Moreover, if
>xe_oa_stream_drain() timed out and killed stream->exec_q,
>xe_oa_configure_oa_context(stream, false) submits the disable LRI batch
>to a killed queue that will never run it on hardware.

A second drain in the disable path will be added in the next series

>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261116222752.3677159-9-umesh.nerlige.ramappa@intel.com?part=5
