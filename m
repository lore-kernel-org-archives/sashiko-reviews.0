Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795804423;
	b=ps+Dx3Vs8IJuQmui1ObC6x6zb59eyTSMQSWDx9cX8P7koS0MHNz5YMbT4dEzuEWVKhZR
	 Qwhvkw3qZlPDpF816bW0CN96UR2+4Fts0/aaClgIjt2aY/YVekscqym+qlzuTriEqM1XW
	 UtheUkwt4x2KOPUYXnVtjPDC1J/oqrsXKeV9yUskOmfIFZbvkQvPEpaaXcNFoI4vn9V/t
	 5YuwUp0+ZlJmRk/x1zcBwu5tgF/vPPifzGb1O5L5HP4exe7iAfo/5Y9TZEnC9PRbwu7FD
	 rL55/W6QyM7OKkP1hLhVteK4ffV83PiCSGWjL3rhgzuGpCKohpfLJWvZmNy6KV9IbKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804423;
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
	bh=pCFrQ/PeVdhOBem/6q/1NVUx2OaD5gw9sGcSbga+jZw=;
	b=EN2pNYiyfvdfx48tmbmrxVzrvBS1oXM8BqbtZ+sRhuy7AI3qtN7hvVZiodyJsxQ6fmhN
	 IvfTyi2D1cSEjgwONK+NJNH8T5TodFgmsD/V8tXpW+qUX1S3XIB2eWBu6Lhd9+OdUTC3C
	 UZhc9zqLjjJDJusSLFVJ/rX520qArkeyC1Eh8uXogCU0iwQj3cts59SIzgg6wyhahItmr
	 Ihnl57D9dMoJTazKe7prULG7zIu4KwzzQ9qgzzCE0Gd1KnmN6//uXN50mYLTucdvJbwrn
	 SwJsaBS69tJGOrUZxW4ryRetXxyvIQibk+YKnfbrvrY4iWfcNbRYKKcULPPDLiK7ofw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jEbG99zx;
	arc=fail smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB7B606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 18:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BB7B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jEbG99zx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795804422; x=1827340422;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jT52/YOH61uwg4QkSUhTfFjKZOs/KmsdaIv3v3Q7wVc=;
  b=jEbG99zx8OY3bHF0wYWwlisNa/XWd94oHY1zjhzGxTA+JXyIAd7mFikG
   cRXvsS9dZ66CLWqp6nezTIknAcCrOACqurwm4QThAZ6R1l+pbts9zNb6Q
   6M/I0aM2KMQ/ryTh6soJN73I64ZfaQZ0dPdh/fdDkheXsvb3Dw9Sf++ah
   fYGzcPu6DVPPkAYf4cs9WFaAkWQqLvxElIfib30eHLzOKXFVt/hYsHlDH
   iPg0phEmPuMPZQ66qI3XZSA/yy15MsZegt7KEyA5U5Fu7vu1/z/cz+FwR
   zaLyroWQrQbfgA7amf9YCy3FQLnMfMtbapJMkNO3fKp7bALXqdlrE6w4R
   w==;
X-CSE-ConnectionGUID: lAaffES5SrS88AD20p4V4w==
X-CSE-MsgGUID: ZFM0dc6STbKxyK3k8p1chA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4680183"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4680183"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:33:42 -0800
X-CSE-ConnectionGUID: HroElWZrSm6FEyqDkr5N+Q==
X-CSE-MsgGUID: 7xzv03nqQpe5+b7kb/WGFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="3973982"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:33:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:33:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 10:33:41 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 10:33:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izDoADLVDO9ZJjRWYdEhZEyizN0TxexjU+D9KmUnXbktUPKAdvOQ6F1dNBQ0y9mNjiljZ7v2WApOW5GyiSyCFsVxU/S85joSC6fCFo+Ae84irjAuTfee1lvnbO44mvbzdYqSMeAsCUoynP89o2nZ7bpfRFeZvYvpvIW7wHqVRu39duHWUaHBtIftfCMOWywApXXf7pUA/BZcH51VKId/doySAutkMcj4rNWuR6ojxDRDl6aAePxwobIs6vtGzS666NyAl/zqsXxAaxgglN08Ubqk1LDbRYOG3h+GtqV5r6mpV4mPsGLtDoDfI/VkZ604bvL1tZfl6XEu5jyoYZOUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/slvFrX+vgccOqP7AuFKZwamWo/LCNx5zssygU+Btco=;
 b=UMrrFdbB+RG/52s5uV8cVpewe+x4jVk29/GCXyx5PVn0aG27c5Jxo9QD9DMqH0Jd7001bGhV44ZZ1tVofvKWWSwux36KsfjFkJNYl4XoI2CYqU7LM+6MYu907T9/c/m9opnAHxnAKWyo88HCDlacZ0SINHavRqAWhcXD/LZGEjx3wdMvE0kxd8V6tegHimBdppRY1IKjuw+T5FISVGuYCos8QQjkGhOQBMv88YQetA5UxMK6ROeZ90td+u5+C9rvDdLKAJeqppaQdJK1kVt6leudmIhKjCLUyyAWJnvpdaGOQCmdLvgZhIBdE6of5KQQalCyEGPknBM+IqnrMUa8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 LV0PR11MB793350.namprd11.prod.outlook.com (2603:10b6:408:602::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 18:33:38 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 18:33:37 +0000
Date: Fri, 27 Nov 2026 13:33:35 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 4/6] drm/xe/cper: Handle CPER allocations in atomic
 context
Message-ID: <awnM_6w4MFY6XK1q@intel.com>
References: <20261127092914.2176025-8-mallesh.koujalagi@intel.com>
 <20261127092914.2176025-12-mallesh.koujalagi@intel.com>
 <sashiko-outbox-236990@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-236990@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0139.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::24) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|LV0PR11MB793350:EE_
X-MS-Office365-Filtering-Correlation-Id: 62372aea-5b0d-4ade-8b64-08df4cb4f3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|4143699003|6133799003|261009223027099003|22082099003|18002099003|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: SFHVViZXTtNhGjf8SS4o2z1Xto+mmX1TK9kRtbbZnrBWz0GW/w2r3fZX9JMO1BJ02Uu5F+meq8Lyoaa4MdErtkrigb0e6L6NrOYl+uD6ib7603rbYrIgRZjTpFSljsFmRGX6n9/Q/+y5XLtEcFndHG55tCNUdwBEazEBOYKy4+eRmIauH/OmHyf7RJLDsPV1vWGz2JHLFDHEVRMrsRa5AA1ZgEE6CDnXQOUC/J0zqk/LZ/WfAXmW6BnQhZZv0VaGHTzyosa2dd6gJQuZ7j4L1+3ily3+iFBRVO/QsfUeX6qb7fgZdv85fdMrnt2Xy4CHMnEoyQvshkuvnEIgfSDwnutjxW8aY7ZTOlUtPCztKN5moRcWH8+ik7yeAcSLcxBQAYh4dNZ28HV+Ad1dyN57Hqiz8f4XOXI4r5EySpjpObD9COZvLK/i85UP6CAEdLeioJOroEhLj4artmSHjEnBao8TjRXbGm34abcVFoJxC59rrqWTJ7raLfViE1q+2HzHNGmaSc5ZY2nx9Pk71pAY7r55yq4/ZW67SZYzYNZAeGvFtEkWlab0Yjb865O3+fPSM7g452cYH3HogECi35WckhmvYaPNEO0kRhN5sE7b330=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5990.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(4143699003)(6133799003)(261009223027099003)(22082099003)(18002099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ELjIT32MUXWdY6ABYsOPL2Tx8eGRfZGOhX6ZR1OCeFq1fVTbGhKCgMheYp?=
 =?iso-8859-1?Q?rDXS6FFdIBr6IrB3Jy6c64v1Ada5Wph9B2RX1kDgAd/2m9h50E21oUFW46?=
 =?iso-8859-1?Q?++2DZMgx00gSJ621Ac2l60W0iAce74O/dMygE/EseuIYyeYK2Fo+RaXyhf?=
 =?iso-8859-1?Q?XNVkTc64GMCFd+ZMCNn6iCAQHgHqz+eumHC/wV4hFD0OZ4piuclj/FYKXZ?=
 =?iso-8859-1?Q?tKemWF0eXbOEMt0leqrzHhKG49pW6r1gkyvmsyEf0nYaQaNhWAVLpRzhIl?=
 =?iso-8859-1?Q?XZ0i3iB/tWpT5rFa9pCvl/rBh0ra6D0P8YP1deG9rYJAkgfWcWARPo491O?=
 =?iso-8859-1?Q?GQTUqRgutxs0vHpqJxFDvK6yHb8YbLECFTxpjvsIDIbqfxwGn8cm/9oreG?=
 =?iso-8859-1?Q?69ZKVa+wX5YjhTriDAsBMNARsjmtp1okwlh2Pphb7vOuVzdRvntGhHGlmV?=
 =?iso-8859-1?Q?O+VuFdOkj6wIK0d62SIlaKw4QNvu8RMkGgWBBWbcUomP+cCZPWZ21LNFAg?=
 =?iso-8859-1?Q?IGxapaVhrzDy46VYZYwim/R47MfeRC3hnaGtlkWb03be3egPYk/CTHuzRk?=
 =?iso-8859-1?Q?HzascGnKehvipHi2kMyBoUDX7Q6iAMZKUz4NlKXsLpqLg6rydfiPdsnoAM?=
 =?iso-8859-1?Q?TIBx2CSpyWKtlSFsq0CZMh80lTw6x8nePC8YHDpX2j+j9cDr1MKvSzuewU?=
 =?iso-8859-1?Q?JaXiQ9+nUAQOuoEzdAbIn9iuf3TiWgy5RdO4Xqa6Dg+gw2p1IL4G9KxL5M?=
 =?iso-8859-1?Q?BSA9VkEcAscy3ptLhwo41AnZMM+d4nDb/PJ+MUDy32nHVtvbEL8klHuVXy?=
 =?iso-8859-1?Q?9WC4tsY8rCW4I/HZJsGOfQhThM+1VjpOaHaNMv19hJK3oxMCQG9ObbkCsA?=
 =?iso-8859-1?Q?+wTu55ZO8x93+0SqBmcD7/Dwh6USq5NYzFaQn5Wmzn6tjMaBh5x7cUCOnr?=
 =?iso-8859-1?Q?4CsAw+45Q3utUOcFQJkJccalllsPYhqPc1THSBxNvPgGTjjVKM6khXyGQQ?=
 =?iso-8859-1?Q?tR/zXMJF+QJYOM5vWE2Iiz0ERzzD7sXr4Qgt9nmCwXRme+FcFSXfsk2yug?=
 =?iso-8859-1?Q?fdM94D2tlITnK78edsbfcGVV4fa4C4W+qZrdHEzc6P4eQHf5iWbGUbncq4?=
 =?iso-8859-1?Q?JKkB8zQJ6MV/edcelP7+KlZKQhSJ8gY+U7itpxoXKCJyPBl/ViEceoAmi+?=
 =?iso-8859-1?Q?PLC4h3q1QfXvVL66fRRY/y3THJ1EeAe+hyP6Tl5JGMcp56A6qdwXlv2Jo5?=
 =?iso-8859-1?Q?+a0bszVeIGLMZo3FerOYNuAI+I2sha3m1V208imLAnOXH4jZze9t4ex+ia?=
 =?iso-8859-1?Q?DuonbL4X0QNLeHWoy4uwp/twsDDt05lVhPdRElV7c23eoS3b+p0hYGWSJb?=
 =?iso-8859-1?Q?hMd6Mp4z7anWpUL0TwCv4bS6h53KITCM3XMmYgI8CFnbsn/ViKm/inyYls?=
 =?iso-8859-1?Q?lfzfA15E5SHY4CtdPbpXF6mGRtU8WjJYEZ0HSf6OD6vugSnPHciYcPO7bP?=
 =?iso-8859-1?Q?7h4cY5lKoB3IDscnPqHxQrpR6guPBZtDcU7N7DWrwVhCd4tV3QGMbe/sZX?=
 =?iso-8859-1?Q?s5rYBvIlXtfyczzIREK3fayyC22Xyt4Ebo2orAprWV0DjVHZxbxx+mIXKz?=
 =?iso-8859-1?Q?ncAdQEiyrJ02VV9moBfo3sCavLD08zLSNJN8VEMpCoY95PsBXHShYaOIvB?=
 =?iso-8859-1?Q?JaDoKPoNwabFiBXj0nPjQJLzr1xkRqv0iMp0jiVyIkMaCH3RE2JWeo825Y?=
 =?iso-8859-1?Q?sF3CdWXQK4y98dknGBsBaeACUBuRG4TqIDrHtMebvRALv35fwBxnfFxyOI?=
 =?iso-8859-1?Q?yYinPssDAQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: F20BIbBentUPFBrsFViLHmi43uzmqOdfqZkvNljhW5m2VwdSy/UiaU2Ns71gtAcZl2dELAriBkH1DV+XbSEmah4HhkkAfKs2+5U86O/WlnZ2WGDwayUrm0jWRmCecAYY2/F9n2SCRB/D8BqU4RxzQbUbfH0fEgEXLmeXUtd5+URxklFIRqWdqRr5hMfwoDhoSaHGK04F5VP62Tf/8tPCTfd46tnNGXa/nwsrd0teOH5ydc8b7ae99QWLMaFiSDdtTMNPXQxMiI1kaDO3WIW6RBwvAcOsdjOlGbIsHKTItYbSirJcMDgOv24TjuOTeSCPBRdfSYvgQyaOtmWBVErE+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 62372aea-5b0d-4ade-8b64-08df4cb4f3b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 18:33:37.8446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qE0sW4EhKUH/LK+VBiEOwJyUyAEBgRm6p2ib2VdvPSkh16IQrT98K11CQrJOqYXLp+S5y4sM5qoQpvwfzORMow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB793350
X-OriginatorOrg: intel.com

On Fri, Nov 27, 2026 at 09:37:41AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/xe/cper: commit message contradicts GFP_NOWAIT use in
>   cper_emit_sw_err()

I addressed this with a change in the commit msg while pushing it to drm-xe-next

Thanks for the patches and reviews.

> --
> 
> commit fa3585155a74f119f9e4b51f2fac71fc5b12420d
> Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> 
> drm/xe/cper: Handle CPER allocations in atomic context
> 
> This commit adds a gfp_t parameter to cper_record_emit() and updates
> cper_emit_sw_err() to allocate software CPER messages and records with
> GFP_NOWAIT instead of GFP_KERNEL.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> > index 9161f2b52e9ba..10a4085d47f0a 100644
> > --- a/drivers/gpu/drm/xe/xe_cper.c
> > +++ b/drivers/gpu/drm/xe/xe_cper.c
> > @@ -183,7 +183,7 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
> >  static void cper_record_emit(struct xe_device *xe, u8 severity,
> >  			     const guid_t *notification_type,
> >  			     const struct xe_cper_intel_hdr *ihdr,
> > -			     const void *einfo, u32 einfo_len)
> > +			     const void *einfo, u32 einfo_len, gfp_t gfp)
> >  {
> >  	struct cper_section_descriptor *sdesc;
> >  	struct xe_cper_nonstd_record *rec;
> > @@ -191,7 +191,7 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
> >  	u32 total_len;
> >  
> >  	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
> > -	rec = kzalloc(total_len, GFP_KERNEL);
> > +	rec = kzalloc(total_len, gfp);
> >  	if (!rec)
> >  		return;
> >  
> > @@ -477,7 +477,7 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
> >  				    entries[i].einfo_size, &ihdr);
> >  
> >  		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
> > -				 entries[i].einfo, entries[i].einfo_size);
> > +				 entries[i].einfo, entries[i].einfo_size, GFP_KERNEL);
> >  	}
> >  
> >  	free_info_arr(info_arr, num_entries);
> > @@ -511,7 +511,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
> >  	char *msg;
> >  	size_t msg_len;
> >  
> > -	msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
> > +	/* TODO: Handle xe_log_* helper function for atomic context */
> > +	msg = kvasprintf(GFP_NOWAIT, vaf->fmt, *vaf->va);
> >  	if (!msg)
> >  		xe_warn(xe, "Failed to allocate CPER message\n");
> >  
> > @@ -525,7 +526,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
> >  	timestamp = ktime_get_real_ns();
> >  
> >  	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, msg_len, &ihdr);
> > -	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
> > +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len,
> > +			 GFP_NOWAIT);
> >  	kfree(msg);
> >  }
> 
> [Severity: Medium]
> Does the commit message match the changes in this patch?
> 
> The commit message says it adds a GFP argument to xe_cper_emit() and
> introduces xe_log_*_atomic() helpers so callers can use GFP_KERNEL or
> GFP_ATOMIC "without relying on a single GFP_NOWAIT allocation policy".
> The code instead adds the gfp_t parameter to cper_record_emit(), uses a
> single GFP_NOWAIT policy in cper_emit_sw_err(), and leaves atomic
> xe_log_*() helpers as a TODO comment.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261127092914.2176025-8-mallesh.koujalagi@intel.com?part=4
