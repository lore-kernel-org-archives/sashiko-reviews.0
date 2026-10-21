Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792620881;
	b=Sbp7YO83p9vxrrDvtyyY9Fa9bZYsIo4nd90XIKhGC2N7SfbAf1pS6w0JkSN61/Mnzw0D
	 mkoAiRJuc5qaPERlnUhZiNw1++kHj3XlZ8kSX8g5X/YPH+IInJybYfsfNM9ne0IMoFjeX
	 COjxoc19uFhBT6hpxi/AlgxT2Tj+jOf0qxRfWPJUwSJG4HVGA+SO+UihI6ssiV8tg5dqb
	 mCbTLLaClI+fq6+2T+pUzDuL9/pTbTDO/znYJTYB24JiAbU5uM2rHqabVyWYk2niIvmm3
	 4pWFsJ50kFoM/s4kDjtJQN7hVi5s8aai0BMmq/kkrCRoSbBeuiCBV4huFz0YZZcSpJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792620881;
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
	bh=QmCMiRLYO948LL3lw5fy0KXDEdc4qw2wuZbxdRf7zXk=;
	b=X/NVyvm/DRt3PgOJP3w/An89/qPukJQMxRhh8zyOkw5bDDDANcKjtRDrCKO7EaMNEs+/
	 Rji3fOxupl7bMKLqm+CSf7nmtvACdHv0G8wHWkhD1vZDauMP1PFtndVeDmcQ4wQCXIdoM
	 kpjorsCm7MvvfmKXL32wu5m5i+67c5fCZbYdROPrOcXDYtNsxfaYg6wnmAynCJUrOkhCB
	 vXLYmzDWu2+a13HS+sDKer8cQzaWUJusMu9inTa3v6AfQuNmWqOBndfT4ao/DUHtfbJ4B
	 OykAaV+iq+HfzAxF7c6DpAG7QBtQBMUaAZiMrZJZmQJWdCr/cSeWYFO5K8j8583bdRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O8sEleqF;
	arc=fail smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86A1606A319
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 22:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A86A1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O8sEleqF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792620881; x=1824156881;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xYZSmUljINgIufGgcrNhZt6fZQp2JwOjXfDpRuEq3BU=;
  b=O8sEleqF/Uaowl+xBR0aQeK1PjbKx4IkJN4glyIHEeLQHYSvSanv7Jow
   VWrob1Nj0WAQZf50Xs4PEnAs2LOd5NQPIXP8L0w6WK8CJhztrvEKeBeaD
   95gQ7tGlUnpYjDNUakliyEe9Tu+1Lyullg7f8W+Hmt/Qxds5ofGFuYc7M
   GJFmvuWee2fkqxqVomKTGmujSpN9a7oAssP4we6s36kC4VLkADmBXVSVb
   Dqsa08MVB/LrPcM9MeiYuWgFoEzVZ1nKGkFdyhdQxTR0w3bqP8ISq93ou
   WhlAd80nYonbOlkEjFBTp/r/QOuQVC6I0jPMffwXVgNzDUOY+vzWI6FwO
   g==;
X-CSE-ConnectionGUID: uA++bMYMQImTi07Xe2Mb7w==
X-CSE-MsgGUID: SfZ6+56dTKuc3EpbkvGPoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1372493"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1372493"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 15:14:41 -0700
X-CSE-ConnectionGUID: npwcg5PET2ibofTZ6niPcw==
X-CSE-MsgGUID: lIgeqjMWQfe3W5AJHBpq8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3541843"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 15:14:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 15:14:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 15:14:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 15:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lj1mL98jy3ifQJjPw2d0ZEs3XnYP8G8/ahTM9UKgbkZiNHpDeDGXySBzXEZnIFgHPtV4K4JK++prVRjriO9W1dD/aBUjAsk6WfCOfDzQtbuBSesN748/y8nHjtIDpiq6plmS4is8eOHSsYL4rOgr5oq74igsQd1D5AwjlleXs6lLK9EDdmrQojg/cSy5k7jCGMQL2qiaYun5fb16cz91Wa2QPuJxwNVNqSycTECVf9BOQlllOzc+s3hXuNJhWQAf1CYTlOo1ZoM4qGxSri8sqpV2KKU4xKcykttLPWDPYy6PPSq9tM2MQbq+OAmFsy4wBrZJmC4tPTf2QGeZfj7blQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fml8sB3G4ibG4uR+28AxbJYqT2nXhCAr4MXkv/8OL9E=;
 b=yHtjCYwORmyk3T/Bjd4uw5+ARHkZ/nzx2WZQXRPaghmF8GvVuzZXKQjvqJ5lcRC5zuUAKAqAWM/12lXJ0LrkBv7j7sHajlmKmIzyEa9SBwhfnpoVWhOhQNOUfbk1O3C6a02KJFuApcfbiM9OAXY18RQrvMkUIiXoabygzD3ncR5XqL7NxS/Aeo+QiMwsVYixd5bX3CMJ9qxYljOsf2QprMsbCTfF/pAW5ZUkR6JxkkSQNZGp4YGrqshSBuu0qLTrJ++mUXfxPw+9/ScSi/cD026SG5UDgSznQEVQkThnQzusWxXKuoZYe7USGRMS40s+igI/3fm8eoteW60PPVQdag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA1PR11MB7889.namprd11.prod.outlook.com (2603:10b6:208:3fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 22:13:36 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 22:13:36 +0000
Date: Wed, 21 Oct 2026 15:13:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/3] drm/xe: Add a minimum age gate to the shrinker
Message-ID: <atk5DqK1nGPcoSEu@gsse-cloud1.jf.intel.com>
References: <20261020190840.854525-1-matthew.brost@intel.com>
 <20261020190840.854525-4-matthew.brost@intel.com>
 <sashiko-outbox-179512@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-179512@kernel.org>
X-ClientProxiedBy: MW4PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:303:6a::32) To CO1PR11MB4787.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA1PR11MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: a2eac93b-2923-434a-9aa1-08df2fc08d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|10067099003|261021121427099003|22082099003|261021123027099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: xRH/9IG9HFyddY2Vt/YQpe4KpTVzGnaea45T6UuCJCbm58Fzt5TED/frvcRqjl7DuLzIPO56d77qvdaZ3RZsE63LuiUQIwGsHLYuEJ2tgYucPUDpURQ2EPrMc3PmbWwGDgusdH68YTqOFIMnpZWOPgkgsQ4IWnwN2RQ0FmKt4zOSdocpoqdMr0u6b9TKrRprLN7UH1sB5B07p2ffMCfTMSr1qM1xOoB+fODz4YZAGzJwjcPz+zme875EhWi4WovRYmzrVSa7shju1GsQMC5DaLM1hC3cE1jhN68uWKSF8oqLBvm4jQYa8pPl2VMAlGZKsxT8TnuvasL3+4VyT/fCWyICHxVLrAmzJrAXLSPH+y4S6DsHkNE/87n26jdBdeA3k+t95GEesZKOD3i8jWEmYWi/UN5AMQXcUmY4ifN6kdJFyqwZWMavJ53yc8y2dJwZ9QfYs+vhmvUB9LNYiZqAYRBtxdrcWGhjsHAKqJx3tahgDOJyLbSSSCM9txsbrq/8J3/i6A6t1jiYLVY4fc/jWc5f5WS/6VLTdTMbI/eHQrWeVm89NsmOFRAWSOpqpkIGEM87DYRjYP3/xtINza9YIJj32WCVO7VgujWmMsLgeFA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(10067099003)(261021121427099003)(22082099003)(261021123027099003)(4143699003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TLesuUYOzlTgH7X70fF/zinomyu2EsBb/snouHTl77c3udvu41PvtjvfpZ?=
 =?iso-8859-1?Q?+2+YIElmARTnpLyRoeBhBF0uUs6TCmUehpOd1u0IG/cG6iUlUm0Zi0dEFQ?=
 =?iso-8859-1?Q?2v7KvTCqFhLhYbz/jkm9VecFdmOTFo+hCf91T7kqcoXdp0fn5ceRlXFacC?=
 =?iso-8859-1?Q?s+9mRga4tgq8Jr7VqKsSmXWu7zPmhVvJeXdVMgXKCNgVr99nh+ovajOIYW?=
 =?iso-8859-1?Q?5D5uKE4LlFpprdNGgeVcAfoZCL9czc0d+NDObaIoq2Bmd651y7c7LJyDvW?=
 =?iso-8859-1?Q?rRwPOz4qZ9WfXH2A603Za5BF6p75ob2qNZ0CG1uk49Nnlz+CU8whgk/Gxm?=
 =?iso-8859-1?Q?oWAaT97h3jV+1gzwZFNX9caqjpsW5y/zQZ0d5GTU6TjvSZ+I3020zBx4//?=
 =?iso-8859-1?Q?2cT1H0gBnPJWThzOs8yU3ykrMQb4Detn4x7TYSS2o4TBhRCGPXaf9rYyIa?=
 =?iso-8859-1?Q?nttPGKsmaEo6wCl4f4XDRPKoLniCgQHpZEKcCQJubcNPu/YUzzQp8kkuct?=
 =?iso-8859-1?Q?eMfM9a633vwiVzuldMoSvt6Jra8YZLDWsleHwbvIX8jX8UZeeq4J2LRGyu?=
 =?iso-8859-1?Q?niOLtzYJlUhAe7BzvRyMWvvVnhbnjYvBBtRn6xYSUFHK9XOlY9Fx/KDccC?=
 =?iso-8859-1?Q?W2SW4II79MBv/72x3YLFxWiRv1irzXpj84Bp6bz3+eMXDIj5QJlQt+hQ/8?=
 =?iso-8859-1?Q?cQDy0T/X9fOwuuwJ0Cxf29LdVpdJiAtHNduTzElVxnuGvz+pNj1jsN8S2+?=
 =?iso-8859-1?Q?cop1vaK4v4gcIkVWZkweNY1uUuOUU6Esj+N0eL7mNa5NBqcyKveCKhKzo+?=
 =?iso-8859-1?Q?6N+cqjA4RUrXYlxZ8TcN9GVik8tGNQ8bPukyrYyJ3vsssffZw6w5EcjlC0?=
 =?iso-8859-1?Q?l1QYMW3plBezNQ+9HclfHZ7CfOpLOGlolTXbRkCQLD/X2favDtxN3PM12R?=
 =?iso-8859-1?Q?10STs1ajmNwenNudMFEAGdDetC/Oft+bsh9A1WwHbhAycMIs4nvlA9ex8o?=
 =?iso-8859-1?Q?Bt5yjD6/RmO4TASh842Rpq/rR3ejULjmlDTli2ZDBQSkUK7r7+r1VabANH?=
 =?iso-8859-1?Q?OsiTdM9f0ZBqIXm6NPToWvYfFo3sZI7CGceaIcRWO8h1GmFvoicY0DC4p9?=
 =?iso-8859-1?Q?2pOldK+W4cuQSnUMBaFxd8Zi9SLsnvefq8s1G6fIAKhFor3dxRY270tBI5?=
 =?iso-8859-1?Q?Bw8dxYQ1iOKaqYkRU9e2HKB/SD8Eq1ldkIxnCMB+sRjVuf3i0jCn+E7KIt?=
 =?iso-8859-1?Q?wFg8rZt+mOAazsNtiz2AOJF9MX790W9sEdmhL4TpMFu1PdA8pYxTU5uFg4?=
 =?iso-8859-1?Q?jOsugZ54m7VsR5gnu204KqMIIpHlez7C+qGhf6PF74ekHnqa5DFdUOyvfE?=
 =?iso-8859-1?Q?GZkoY+809sJGj6iWdkG/zmd3otpUG7518vWQ6s9RuKjfGGcbkIBUXEApat?=
 =?iso-8859-1?Q?zkTKXVO13YzBOaw3/6scof96FtVzuAZDeZDRV3rsWU0mR1JhuikeWcWMpm?=
 =?iso-8859-1?Q?KkPj8ZUv08EvneD4zb2plhAuZQxthkRhoYryfnDSUxcJ/FzYB3pzaTTrTX?=
 =?iso-8859-1?Q?yF+JiKw7fB2zCx4yNjTA+Lrx5RPPWu4jy+Bzkr+teusQ3ce0/YjX9/9Z38?=
 =?iso-8859-1?Q?Z/x4RocefB+DVOXacxhEisjIgQ4HhnUweICptbywrKkDATNBqSsSvA6JbB?=
 =?iso-8859-1?Q?jpIpMCQJi5vY5NJB+d/slN9lz1owowZKEFBjnh1qZgnoOXaGJ58ZiaN5d4?=
 =?iso-8859-1?Q?W2xemxLYiGmddWIe7r1nhHUEp2g7HzkdmP26quEbX0dXPCinciLKIFmCIS?=
 =?iso-8859-1?Q?dK0HRR9ZGw=3D=3D?=
X-Exchange-RoutingPolicyChecked: IOkHqiAMYFRe9aJ6M7tm05BElb40qvqorhrNly45kwiSn7XTshOpeUgtOf6QEb3CT2HWcHKS5x7sZeHQlozFfF+zMCzhm9OWTe0bn4l6RMOWNWzLTb7Og2/qgbVNnhSqLIgMqB+Ro+e9cYySmtj4rzzRGu/H2Vh+4wl2PqwvgUrb6gWnrLvFPftjVdAOY2utm7X0rHSJnscGTlC5E12WOJ2HUjocuRhAeD8VbkwhzxVGwd1GKE1Uxngyr3WTOrqc183iBJxKhNhDXFGWqQ1Iz6aHHNddJ6hQ0BFekuT0yDWAHmgnoLqjkiE14yQGhkm70DWrcOYZnpq1cncnAg7+qQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2eac93b-2923-434a-9aa1-08df2fc08d8b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 22:13:36.6343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdlUoRyCzkpZu8LOzj42ZgYUDVrnP8riuEqkiIiKmnphtts307UNVAqwDBU6EoCUWFNWl/i8doY94F36nfi1RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7889
X-OriginatorOrg: intel.com

On Tue, Oct 20, 2026 at 07:36:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] drm/xe: xe_bo_bump_lru_locked() and xe_bo_shrink_too_young() ignore bulk_move
> - [High] drm/xe: xe_bo_move() bumps LRU and stamps VM on VRAM-to-TT evictions
> - [Medium] drm/xe: xe_bo_init_locked() bumps LRU before setting bo->vm and bulk_move
> - [Medium] drm/xe: xe_bo_shrink_backup_candidate() includes deleted and ghost BOs
> --
> 
> commit 7080502f8c1d2ffa8fd84f4e7f1ff61a34a0e8c9
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Add a minimum age gate to the shrinker
> 
> This commit adds a per-device shrinker_min_age_ms sysfs attribute and Kconfig
> default to prevent the shrinker from backing up buffer objects that were
> recently moved into TT or bumped on the LRU during exec. It timestamps BOs and
> VMs on LRU bumps and skips LRU priorities whose first shrinkable backup
> candidate is younger than the configured minimum age.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index bc4801c48fce5..fc8fe68ca0373 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1359,9 +1359,114 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >  		xe_tt_unmap_sg(xe, ttm_bo->ttm);
> >  	}
> >  
> > +	if (!ret && ttm_bo->resource && ttm_bo->resource->mem_type == XE_PL_TT)
> > +		xe_bo_bump_lru(bo);
> 
> [Severity: High]
> Should xe_bo_move() avoid calling xe_bo_bump_lru() when evict is true or when
> ttm_bo->resource->placement has TTM_PL_FLAG_TEMPORARY set?
> 
> Under VRAM pressure on discrete GPUs, ttm_bo_evict() calls xe_evict_flags(),
> which selects tt_placement (XE_PL_TT) for BOs in VRAM or stolen memory:
> 
> drivers/gpu/drm/xe/xe_bo.c:xe_evict_flags() {
> 	...
> 	switch (tbo->resource->mem_type) {
> 	case XE_PL_VRAM0:
> 	case XE_PL_VRAM1:
> 	case XE_PL_STOLEN:
> 		*placement = tt_placement;
> 		break;
> 	...
> }
> 
> A multihop move in xe_bo_move() can also bounce a BO through a temporary
> XE_PL_TT resource with TTM_PL_FLAG_TEMPORARY set.
> 
> When a single cold VM-private BO is evicted from XE_PL_VRAM0 or XE_PL_VRAM1
> into XE_PL_TT, calling xe_bo_bump_lru() -> xe_bo_bump_lru_locked() updates
> bo->lru_stamp and vm->lru_stamp to jiffies and calls
> ttm_lru_bulk_move_tail(&vm->lru_bulk_move). Because ttm_lru_bulk_move_tail()
> moves the VM's bulk-move ranges across all TTM_NUM_MEM_TYPES and advances
> active eviction cursors via ttm_bulk_move_adjust_cursors(), evicting one BO
> from VRAM moves all remaining cold VRAM BOs of that VM to the tail of the
> VRAM LRU so hotter VMs are evicted instead. It also stamps the evicted BO and
> all XE_PL_TT BOs of that idle VM as freshly used, protecting them from the
> shrinker for min_age_ms.
> 

This is correct. Will fix.

> > +
> >  	return ret;
> >  }
> >  
> > +/**
> > + * xe_bo_bump_lru_locked() - Bump a BO on the LRU and stamp its last use
> > + * @bo: The buffer object, reserved by the caller.
> > + *
> > + * Move @bo to the tail of its LRU and record the time for the shrinker's
> > + * minimum age gate. A BO private to a VM is anchored inside that VM's
> > + * bulk-move range, so moving it alone would only reorder it within the
> > + * range, leaving it wherever the range sits on the LRU. Move the whole
> > + * range to the tail and stamp the VM as well, matching xe_vm_bump_lru().
> > + * The caller must hold the device LRU lock.
> > + */
> > +void xe_bo_bump_lru_locked(struct xe_bo *bo)
> > +{
> > +	struct xe_vm *vm = bo->vm;
> > +
> > +	if (vm) {
> > +		WRITE_ONCE(vm->lru_stamp, jiffies);
> > +		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > +	}
> > +
> > +	WRITE_ONCE(bo->lru_stamp, jiffies);
> > +	ttm_bo_move_to_lru_tail(&bo->ttm);
> > +}
> 
> [Severity: Medium]
> What happens when a VM-private user BO is initially created in XE_PL_TT via
> __xe_bo_create_locked() -> xe_bo_init_locked() -> ttm_bo_init_reserved() ->
> ttm_bo_validate() -> xe_bo_move()?
> 
> In xe_bo_init_locked(), ttm_bo_init_reserved() runs before
> ttm_bo_set_bulk_move():
> 
> drivers/gpu/drm/xe/xe_bo.c:xe_bo_init_locked() {
> 	...
> 	err = ttm_bo_init_reserved(&xe->ttm, &bo->ttm, type,
> 				   placement, alignment,
> 				   &ctx, NULL, resv, xe_ttm_bo_destroy);
> 	...
> 	bo->created = true;
> 	if (bulk)
> 		ttm_bo_set_bulk_move(&bo->ttm, bulk);
> 	else
> 		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> 
> 	return bo;
> }
> 
> And __xe_bo_create_locked() only sets bo->vm = vm after xe_bo_init_locked()
> returns.
> 
> When xe_bo_move() calls xe_bo_bump_lru() during ttm_bo_init_reserved(), both
> bo->vm and bo->ttm.bulk_move are still NULL, so xe_bo_bump_lru_locked() only
> stamps bo->lru_stamp and moves the new BO to the LRU tail without updating
> vm->lru_stamp or calling ttm_lru_bulk_move_tail(&vm->lru_bulk_move).
> 
> Immediately afterward in xe_bo_init_locked(), ttm_bo_set_bulk_move() calls
> ttm_lru_bulk_move_add() -> ttm_lru_bulk_move_pos_tail(), which executes
> list_move(&res->lru.link, &pos->last->lru.link) if the VM already has BOs in
> (XE_PL_TT, XE_BO_PRIORITY_NORMAL). That pulls the newly stamped young BO
> backward from the LRU tail to the end of the VM's existing bulk-move range.
> If that range sits near the head of the XE_PL_TT LRU ahead of older BOs from
> other VMs, the shrinker can encounter the young BO near the head of the list
> and call ttm_bo_lru_cursor_skip_priority(), skipping older cold BOs behind
> the VM's range.

I think it is temporarily not in the bulk-move list, but as soon as
xe_bo_init_locked() is called, it is moved into the bulk-move list. The
BO should end up at the tail of the bulk-move list after
ttm_bo_set_bulk_move(), so this is a non-issue. 

> 
> [ ... ]
> 
> > +/**
> > + * xe_bo_shrink_backup_candidate() - Whether the shrinker may back up a BO
> > + * @bo: The TTM buffer object, reserved by the caller.
> > + *
> > + * A BO is a backup candidate if backing it up is the only way to reclaim it.
> > + * BOs advised DONTNEED, which sit at XE_BO_PRIORITY_LOW, and purgeable ones
> > + * are not: their pages are simply dropped, which is cheap, and they are
> > + * accounted to the purgeable shrinker. Neither are BOs whose tt isn't
> > + * TTM_TT_FLAG_EXTERNAL_MAPPABLE, which xe_bo_shrink() rejects outright.
> > + *
> > + * Return: true if @bo would be backed up by a non-purge shrink pass.
> > + */
> > +bool xe_bo_shrink_backup_candidate(struct ttm_buffer_object *bo)
> > +{
> > +	struct xe_ttm_tt *xe_tt;
> > +
> > +	if (!bo->ttm || !(bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
> > +	    bo->priority <= XE_BO_PRIORITY_LOW)
> > +		return false;
> > +
> > +	xe_tt = container_of(bo->ttm, struct xe_ttm_tt, ttm);
> > +
> > +	return !xe_tt->purgeable;
> > +}
> 
> [Severity: Medium]
> Could xe_bo_shrink_backup_candidate() misclassify non-xe ghost BOs or deleted
> BOs awaiting delayed_delete that xe_bo_shrink() purges rather than backs up?
> 
> In xe_bo_shrink(), both non-xe BOs and xe_bo objects whose GEM refcount has
> reached zero are purged via xe_bo_shrink_purge():
> 
> drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink() {
> 	...
> 	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> 		return xe_bo_shrink_purge(ctx, bo, scanned);
> 	...
> }
> 
> When a recently stamped user BO is freed while busy (or with
> want_init_on_free() enabled) via xe_gem_object_free() -> ttm_bo_fini() ->
> ttm_bo_release(), its GEM refcount is zero and bo->deleted is true while it
> remains on man->lru[XE_BO_PRIORITY_NORMAL] awaiting delayed_delete. Once its
> fences signal before the delayed_delete worker runs, ttm_bo_shrink_suitable()
> returns true. Because neither xe_bo_shrink_backup_candidate() nor
> xe_bo_shrink_too_young() checks bo->deleted or kref_read(&bo->base.refcount),
> xe_bo_shrink_too_young() treats the freed BO as a young backup candidate,
> preventing __xe_shrinker_walk() from purging it and causing both
> __xe_shrinker_walk() and xe_shrinker_lru_young() to skip the rest of the
> priority via ttm_bo_lru_cursor_skip_priority().
> 
> Additionally, because xe_bo_shrink_backup_candidate() does not check
> xe_bo_is_xe_bo(bo), if xe_shrinker_lru_young() encounters a non-xe TTM ghost
> BO at the head of a priority list, it treats the ghost BO as that priority's
> first backup candidate and immediately returns false (since
> xe_bo_shrink_too_young() returns false for !xe_bo_is_xe_bo(bo)) without
> inspecting the first real backup candidate in that priority.
> 

xe_bo_shrink_backup_candidate should likely check !xe_bo_is_xe_bo ||
!kref_read(xe_bo) and return false for both.

> > +
> > +/**
> > + * xe_bo_shrink_too_young() - Whether a BO was used too recently to shrink
> > + * @bo: The TTM buffer object, reserved by the caller.
> > + * @min_age: Minimum age in jiffies. 0 disables the check.
> > + *
> > + * The age is taken from the later of the BO's own &xe_bo.lru_stamp and, for
> > + * user BOs private to a VM, the VM's &xe_vm.lru_stamp.
> > + *
> > + * BOs that the shrink walk would not back up anyway are never considered
> > + * young: non-xe BOs and everything rejected by
> > + * xe_bo_shrink_backup_candidate(). Neither are BOs in XE_PL_SYSTEM: they are
> > + * not GPU mapped, hence not part of a working set, and must be moved back to
> > + * TT, refreshing the stamp, before use.
> > + *
> > + * Return: true if @bo was touched less than @min_age jiffies ago.
> > + */
> > +bool xe_bo_shrink_too_young(struct ttm_buffer_object *bo, unsigned long min_age)
> > +{
> > +	struct xe_bo *xe_bo;
> > +	unsigned long stamp;
> > +
> > +	if (!min_age || !xe_bo_is_xe_bo(bo) ||
> > +	    bo->resource->mem_type == XE_PL_SYSTEM ||
> > +	    !xe_bo_shrink_backup_candidate(bo))
> > +		return false;
> > +
> > +	xe_bo = ttm_to_xe_bo(bo);
> > +	stamp = READ_ONCE(xe_bo->lru_stamp);
> > +	if (xe_bo->vm && xe_bo_is_user(xe_bo)) {
> > +		unsigned long vm_stamp = READ_ONCE(xe_bo->vm->lru_stamp);
> > +
> > +		if (vm_stamp && (!stamp || time_after(vm_stamp, stamp)))
> > +			stamp = vm_stamp;
> > +	}
> > +
> > +	return stamp && time_before(jiffies, stamp + min_age);
> > +}
> 
> [Severity: High]
> Should xe_bo_bump_lru_locked() and xe_bo_shrink_too_young() check
> bo->ttm.bulk_move instead of bo->vm?
> 


The check should be...

if (xe_bo->vm && bulk..

> There are two cases where a user BO has xe_bo->vm != NULL and
> XE_BO_FLAG_USER set, but bo->ttm.bulk_move is NULL:
> 
> 1. In __xe_bo_create_locked(), private user BOs in a fault-mode VM
> (xe_vm_in_fault_mode(vm)) are created with bulk = NULL while bo->vm = vm is
> still assigned:
> 
> drivers/gpu/drm/xe/xe_bo.c:__xe_bo_create_locked() {
> 	...
> 	bo = xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
> 			       vm && !xe_vm_in_fault_mode(vm) &&
> 			       flags & XE_BO_FLAG_USER ?
> 			       &vm->lru_bulk_move : NULL, size,
> 			       cpu_caching, type, flags, NULL, exec);
> 	...
> 	bo->vm = vm;
> }
> 
> 2. In xe_gem_object_close(), closing the GEM handle of a private user BO that
> remains mapped in a non-fault-mode VM clears bo->ttm.bulk_move while leaving
> bo->vm set:
> 
> drivers/gpu/drm/xe/xe_bo.c:xe_gem_object_close() {
> 	struct xe_bo *bo = gem_to_xe_bo(obj);
> 
> 	if (bo->vm && !xe_vm_in_fault_mode(bo->vm)) {
> 		xe_assert(xe_bo_device(bo), xe_bo_is_user(bo));
> 
> 		xe_bo_lock(bo, false);
> 		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> 		xe_bo_unlock(bo);

This is probably not correct in current code.

BOs can outlive their handles, so I'm reading this correctly after a
handle closes for private user BO, we never bump the LRU.

Matt

> 	}
> }
> 
> Non-user VM BOs such as XE_BO_FLAG_PAGETABLE BOs also have bo->vm == vm and
> bo->ttm.bulk_move == NULL.
> 
> Whenever any BO of that VM moves into XE_PL_TT (calling xe_bo_move() ->
> xe_bo_bump_lru() -> xe_bo_bump_lru_locked()) or when xe_vm_bump_lru() runs on
> exec, vm->lru_stamp is updated to jiffies. However,
> ttm_lru_bulk_move_tail(&vm->lru_bulk_move) only moves BOs attached to
> vm->lru_bulk_move, and the loop in xe_vm_bump_lru() skips private BOs because
> drm_gpuvm_is_extobj() is false when obj->resv == drm_gpuvm_resv(&vm->gpuvm).
> 
> As a result, detached or fault-mode user BOs with bo->ttm.bulk_move == NULL
> are never moved to the LRU tail and stay at the oldest head of
> man->lru[XE_BO_PRIORITY_NORMAL], yet xe_bo_shrink_too_young() gives them the
> fresh vm->lru_stamp. When xe_shrinker_lru_young() or __xe_shrinker_walk() in
> drivers/gpu/drm/xe/xe_shrinker.c inspects the head of
> man->lru[XE_BO_PRIORITY_NORMAL], it sees the un-moved cold BO at the head as
> young and calls ttm_bo_lru_cursor_skip_priority(&curs), skipping the entire
> XE_BO_PRIORITY_NORMAL list across all VMs on the device.
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261020190840.854525-1-matthew.brost@intel.com?part=3
