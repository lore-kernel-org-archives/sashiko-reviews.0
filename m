Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795032742;
	b=IDhTzkyyzoJlw2ab/9yrtkT2JgoD9I1V4c+/GF4YLj499aG2QmjMpyisWe1x22lEpbbx
	 +hojkGbB+2d33xrgFOYYLw9+hzwXtbk5PNZfCknVD9UrioKdxLO5uELlBDhwhSl5iZtQE
	 3NSIt4qJI3DyCCOH3nsPzJJs4pPAd/x/Xz0AvhMkOYDYIKB9mdfVy8IaAXlPu/NYSPUMa
	 OVdGsksPPF5N95F3UU1yqDmW3Q0AXPlo2RUKN4Z/YUlbuaX4plzBNuqsuGrg05IKGHJXJ
	 lz+JZK9bB0S27+WveihIWAm8GM40CRGw+Q05S0zICl1h0LEwSFrzkkKdznvhT6e4D4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032742;
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
	bh=wmEFQ4VRk0CqiRMzoFadMB6wBQFIwPzenQ9GM7CjPiU=;
	b=DvK4Hz02dHiCdq+qQPz3yVKnSBNUReYYgiSSGTkX/g5iTF5vrXsqcp0l/CK/v74qOi9Y
	 OZBljc7LZRqDQ+E0Uvz+xdn0XchghlajHkJTksk7Kmbwk0PhbL4TKQ9gZMCt7/YdVkeje
	 MkFJE29yHxfx+rfZvplGjnC0hSuc8A3IcjVVJKJlGdqTf4/LXAOaFszT5MoQ1nbsrOv2C
	 YvbDyiOgINjHBCJZXV1Iral3MOxB1G9aDtvpZCRqDTyS9D7iIMvguPmsScsmXguaSIXFt
	 Yti4CwZ19AAyVT2RBIxBEKOCKAD1R9Ef0GOBkn9+lqeCvGBBCAbbpvtXlRzmXgJJtYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CTzmT7h1;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ctfBaOfa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFAD606A332
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 20:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFFAD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CTzmT7h1;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ctfBaOfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795032741; x=1826568741;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=FgNWb/6kwZPW+Fq+/+9REDQYzydtT0IJtFQa9dL1rFE=;
  b=CTzmT7h1IyKgNP6Z+OVjg3FHi5shkM2mh6pWCzm/ovqcyV/gEp2g7NqC
   xKAGP3qus47+t8ajJJRws7KY1PKds9rRPDqEIsBRdyvo9nzo5fRfUxRxj
   KFtxIGSF8RUCE6PvuDxQyJ/M2pZSfWpWy69HTzXFSCShgd6u8q8tGTbBR
   slq3RasMPYhnwb4miwiXX5xeQ0Xuja1qPAYedRdlfewjYqEFdjYEfRCoi
   dfUUSjDo3YNyisyuCMv1N5q3efWvOfpA1QPMIAPWRZoyi3pk6w38FtOke
   Hl9ywjS9su+xY/jEWsDEpJxbClU2ar2W6+nGh1XG4eYhpORVcxZNQOI0V
   Q==;
X-CSE-ConnectionGUID: Q/FAX8AhRXW3QQFtOv/t+g==
X-CSE-MsgGUID: aEGkW0uHS6CxM9XCPnEqHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3760734"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3760734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 12:11:27 -0800
X-CSE-ConnectionGUID: fxXH1BhXQ6i8UHzf6pJp0w==
X-CSE-MsgGUID: Z2xLudH9TcODjS2uBWNU4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10168880"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 12:11:27 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 12:11:26 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 12:11:26 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 12:11:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqYWtr3y/ArY+qAfx3XFckaKF0TE6SuQV9I1PaYw8gdeRRfFNkt/9YDgmCD8LkNPNF0VRUoiYZgH0x0B0BwtuNsrJuZ0PG+ewEUvkmKyUyY7KuAbaXCCYG+mVHkN1XR6LOxrkJuhgfj105hzHJzgWrcS1RDFQdEwfRk2nRLQX5XqSRp9So7bjHbBnQSiLXFHuqYTPHDxssNVHTEtvIFjB3qjZQxt7h5c/lTXl08Gk40Vpovc/TZ0kTgzRd2iv2tiCzDsDI4K5pMT1CfgdGaEbec39q3wMu7XD1o14pd/H0ozhndoDL8jtwtHkW25gLxUzg871vvZanwdlSttisAReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmEFQ4VRk0CqiRMzoFadMB6wBQFIwPzenQ9GM7CjPiU=;
 b=R2+AIr2a2yiFymfcvaoCLk9ahInHOLrwX1K8/mmtcOrxv5XVcYcFtTwyArX2Rp0F+fH185U7SQB9DXFZlvs035kdvWNpIy2lO+1pWELeX+hW1Qxqd7eaHzXaPH5hH7QGwA0L0z5X1A33GS8h+3clMJSFWjODS+AliscrGDCbebXTP5Rxc/uF0U/Qch7fOfeU/UWaVpXzquzrC1AfSul0nKBIpcvQn4ev7uRoirJH8Wn8Zc00O1YLUOXue6R/RJv0Bq0NwiCJutzwoZvsrFum2M39fYbxqPh4F5B1AWNud+pyqOz2DAY2zkunYkY2cSH39tqrSOhrk1B6aGCxL1pBKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmEFQ4VRk0CqiRMzoFadMB6wBQFIwPzenQ9GM7CjPiU=;
 b=ctfBaOfaZJkz84+WqrUpCnERIQbge+JrD+7hWvx0qL8xfO/+8CFu1rZgVEkJA7bgNg0UuDB0DDpB+njryxgV4GAw4WvFYarhzaLeVJVKPAvwmuMG1ltkWkXjTu7MjDwYMIWzm4MfO13veLbxmCd/91C/oq1iQiRwn+AVvhO3e0g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 by IA3PR11MB9015.namprd11.prod.outlook.com (2603:10b6:208:57e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:11:23 +0000
Received: from SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c]) by SJ2PR11MB8451.namprd11.prod.outlook.com
 ([fe80::7d5f:b2ba:92d4:5f3c%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:11:23 +0000
Message-ID: <651d5961-a310-4484-b8b8-3c0994d9e16e@intel.com>
Date: Wed, 18 Nov 2026 12:11:21 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v3 4/4] ice: use struct timecounter for E825 and
 E830
To: <sashiko-reviews@lists.linux.dev>, Intel Wired LAN
	<intel-wired-lan@lists.osuosl.org>
References: <20261117-jk-e825-e830-timecounter-v3-0-87ea4c86a249@intel.com>
 <20261117-jk-e825-e830-timecounter-v3-4-87ea4c86a249@intel.com>
 <sashiko-outbox-219882@kernel.org>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-219882@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:303:b6::19) To SJ2PR11MB8451.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8451:EE_|IA3PR11MB9015:EE_
X-MS-Office365-Filtering-Correlation-Id: 3890b126-7e04-4d28-5c43-08df45b01e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|4143699003|261026140227099003|261102123227099003|261028144727099003|261021123027099003|261026121527099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: 2B8FCxQThsDgJi7KSr+wdq+zfvYFw6+oYO9CYC27qJpKjYE0FLGH7w2tDyHuljkLh+D7ETvrp8HY17ZzH5TGbbvdMyj0zVjVbg91JeOM97fHuYgNcES6WJrVruXsfK+t2lRZcveealutPme20Rpj/J2IxyJ0ZbtmWiSlJicDZydbhvSKLfXgVAaaBBvrs5/xuKxqLuVqhh6Kp6/qSgIOd8UQuL+chTwrfGL2Or1e4CG90BApedydodBa1iNaMIo0AudaRuv0NFQv5tGYQu9NtAWIuWmqPBEABTSic2V4/kcGYNzY01/FKbPZWDTPuQ29zsa+dn35CHSHz9LpPTi9k4jLCyfJS9Yz/6hO+2fRv4hoOFM4gIRzo3TcNpP0ZBIiKm47joJrINluMKZ8sEzVLdJfcgBZwICAvhLVplIaplDR+b5Vl6Cmys5rqpIQvFjIKZ5tPiUMe75e7g6H2bp+z9P0U10eKzula3ni2ulw1TRhJm1Wj0gxprnX649Eqb3GBn7S9oC8yQJwpQZOpMY9Z63Npmk9SThKnITaWKvHO2j4e4sAFGPzGPaa1rM/DKXfmAWoqZZ2ZDvWzN7uq0bUhKtE2O0ZOMJTyiTgQoohnwiJ+EoeX5GIxyUpBi2jBnxz9rtK9gVK7/VmJTZ8DTKewvC/tzM4CcrTT3JUXicF+lE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8451.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261102123227099003)(261028144727099003)(261021123027099003)(261026121527099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmhyNHlMTUVKaVhwMytMT3FXVVdabzFldDdVODlkT1o4NURMTTNPWmE1QWZP?=
 =?utf-8?B?TVpBMUxwRDlJdE9nUEFxanN1Y2pHS1ZBN0d5NjU1SUdzQmZJdFExdDFLTWZs?=
 =?utf-8?B?RW9yM0FyTUo3UC85YkxsQU4zcGIvclBaai9nTkVtQXc4YlVydjM5Z3JSQmQz?=
 =?utf-8?B?ZzNCaUdGNEx5QzJSdjBrS1pVZk00KzdmMDdtR2pWNm03V2p6MmhBUXFkMnJz?=
 =?utf-8?B?VEJyZzVaUnVFK0lHQzA2a1NDRmpyZnNYVU9mMGFMR0hQaDRZalN4ZGI4OS90?=
 =?utf-8?B?cko3MDZYY2dscUlJMlNyU0YrcnJrQVpwYWR6QVpzZFZNWFQ1MURqdndMQ0Nv?=
 =?utf-8?B?SUVLazZYSEZIeXFkcXlaWjE0bzc0NG9tZTkzcmtZS1NYQytwOHhWKzJFYW9D?=
 =?utf-8?B?V0FkMzN3eTNmd2NtZklicGVyRzRaWjhPazJ2YkNTNEtlWXRjbTdMNENJb2p5?=
 =?utf-8?B?MU5lUWxRL0RkbVpWdzJXQzcwbXJwcUVETzhQTmNlMWhmbms3alB3NUFmRTM5?=
 =?utf-8?B?U2htSEJOZkRJWFhrT2xnQnVRbnhYSkNNUUJCdVYvTCtwUHdFUWVNd0hmM0Vj?=
 =?utf-8?B?K1FNY2twRWR0MytVd3ZEWTdEM0FNZjB4OElENnVveWRJUjh0MWZUZW1DakhQ?=
 =?utf-8?B?UWZ5d1NEMnN6bUl3QlFIRDA4RElWNGkrOHM2eWMvMThBZ0xCemhuWEc2d0Z4?=
 =?utf-8?B?ZGR3am5MaEEwaHNpTHYzaTQ3QU9qV3Z1cUExdmx5aW1MRTlTRzJ0VlhWLzF1?=
 =?utf-8?B?OGFVWFJ2RWVQY21hU3dLblErdkNEMEZ0dGkwY0pqb0NwUC9RZ1huK1FLc0Ez?=
 =?utf-8?B?TkRhbTFDN2tDZk5GR2s4WXNValhsM1crQzMzS3FMWE1pZ2VZc3haVEhvd3VE?=
 =?utf-8?B?MFRQWkNaYWxpbGFOS1VkaFFGMzVoNFhkZjNtTG9Odk5CZTZCT3VFdG41Z21i?=
 =?utf-8?B?aTlTVW54R1gwSXpwNDNkWXduYWExMGg0VkpacjZVUThzUjNWUlhzL3U4Y3RS?=
 =?utf-8?B?K3UvcjU4WWpjNmxZeWREeTB4QTVmRndnOXBMOVVhdkhDVVhKMUF0UUtqSkgv?=
 =?utf-8?B?L25GWXBqSG1pTE9aYnh6OFNhaGdGOW5iaXQ0ald6VzZyRUlMYzZGaW1FM3RX?=
 =?utf-8?B?aVpnU3diSWw3YlZCUDM0aTI3QkZDMXRweUFQRzQ1OHRudGV1SkJJNGZLclBs?=
 =?utf-8?B?RkZHYjNnYW5iYkU3RUs0WGVIM0lmRjArM1dkNzNnTVNMcmVSQlcwWHZYN2Vn?=
 =?utf-8?B?elZoZEhiZ3JyRzBmUDU5dmk4T0EwME1RNHRjZ0hOa1dKQnZRL0VQaW1JNFBq?=
 =?utf-8?B?UkJ3a1R5MndxaWp5WnpidFduRjdBQkpKQjJnUE1rQVFUbkZNczNHeGZFdis4?=
 =?utf-8?B?TmYvTE5ST0ZtYnRicFAxaTlVT1pvSjFBSWpYUEhYOXhwamg3d1NpVjVlRGNi?=
 =?utf-8?B?ZlNLby85b2xjUks4cytEbnp2MVNXcmluaHd5a2ZxQzNSdmZvTlMwd29MSjcy?=
 =?utf-8?B?MS9ML2FoWVdycmo4QTZpQm42MGFvYnhDMSsrVENhUFA2VER5RkVkVCthV1RI?=
 =?utf-8?B?S2YzYit5eUUxNFlaT2FxS3Q1eDA4Y0d6MHdGaXpSWXM5UVRqaGlrdDZaSFRw?=
 =?utf-8?B?YUFXS3lEaTJnTHltKzZocFU1UG5QcDlnMkxhdndTVjg1M1c3UmlEYVg3d1By?=
 =?utf-8?B?d0hybmZGS3Mva1JPdzVSWXllMkhTSnQ3S2VBMnF6cDlqUFpjN2J1Z0xLRWtr?=
 =?utf-8?B?UTAwTyt2d0paK2h0b2VDRVUvY3NGQjJwWDRTLzFJT2xpSzYzMmRVSHd0Q2J0?=
 =?utf-8?B?QUN5ZnZabzZPdnBlcGlpWS8zMVIvelRkR0xaRzdsdzJ0OWJRL0dCeXphYVAz?=
 =?utf-8?B?cld2T2tacmFTcEJvVkp6UmloSGhpeGZiVmtrelM1L1dMWGdLNWp0NjNPaERB?=
 =?utf-8?B?RFZ2eEpKb3llOXdZM1BRRkpQM1NtemJnNU8zeFpURmk3Q0Y5NFVXajFtMXUx?=
 =?utf-8?B?MUhjYVNwK21BeSs3bFNudS9JVjJ2RXJFaU9XMHQyNXRobmlMQ1hUazNGdzdr?=
 =?utf-8?B?VmZRVU5JZ3orajBEUWN5MGpkVnM4bjJraFo2NGlFVkpYUXc5cmI2YW5xWEcx?=
 =?utf-8?B?ODA3Z2RnUjVvR09MUzBUMmpDKzBoMkhTanpzeVphQjNyNnN4dkpNWnB0REMw?=
 =?utf-8?B?bFB5RnM3Q3hWMUQ1Rnp2NlBJZWU3UFh4eEJCNGxkZWtLVXpMZ0lmNW5hc0lR?=
 =?utf-8?B?R0p6UUxac1RnR1RWYTdxV3NkSXhNSlBwUWVtTjVHUGVFWVFxcUd3YVVrUGwv?=
 =?utf-8?B?ZE1henY1b3U3dGhyRFB0b1B5VzkyRjRuQzg1VENpa3p1dDlGQS9hTmtobUl4?=
 =?utf-8?Q?CsXP9imJzXpwA3j4=3D?=
X-Exchange-RoutingPolicyChecked: uz1jGc/p643+yCfG84KMzXdviqEQU8wjrCPj1nuYcj4jK1vwvtyEhQx/L1VFjvfBKl8taH1sLVSG816Vj8og2sQ2NafdEWf4Czw7MKaw+xCzYbUxLVpDjji7OHJsKMG7NkG7slbVgDMu5dtkDloY6fhIPlz7Dx8LpihAlo7lPtG5VWwq0e2vNg6K/Qw6qUu2Pwyf3Sbu7nXOwMnKPCHl91szA7E+ijCgDcy2Uq4OzxE+Na5yKIy/Fi1hd+Sqs7ycp/cm+gPWo2jj1VzhdHbBhY0XPdeKafmScXT3EG34KBe9YMxOdJ2iApaWRDGlj8lF8YfqqJpOSIobmVpzB5Oiqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3890b126-7e04-4d28-5c43-08df45b01e30
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:11:23.4751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QAmq+k/Q+8774CDIzPa0VMK/9Yprg42cF4pdiypeZpQ3nPXBZ8MebY9fFsjGvBmOlhEvQ2ttTCd3ZzVivRPRPTjXUJXcz0jjG3NOqiZmQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9015
X-OriginatorOrg: intel.com

On 11/17/2026 4:50 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ice: unreleased phc->lock on error path in
>   ice_ptp_rebuild_owner()
> - [Medium] ice: premature phc->update_time store in
>   ice_ptp_read_cycles()
> --
> 
> commit b8fa2e5442cd684f10151ff2ab484f07d9521f1c
> Author: Jacob Keller <jacob.e.keller@intel.com>
> 
> ice: use struct timecounter for E825 and E830
> 
> This commit switches E825 and E830 devices to use a seqcount_latch-protected
> timecounter and cyclecounter in struct ice_phc instead of directly adjusting
> the hardware PHC timers and using the legacy timestamp extension logic.
> 
>> diff --git a/drivers/net/ethernet/intel/ice/ice_ptp.c b/drivers/net/ethernet/intel/ice/ice_ptp.c
>> index d07dcf619bb18..a74a2075e5f53 100644
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
>> +		smp_store_release(&phc->update_time, ktime_get());
>> +		return time;
>> +	}
>> +}
> 
> [Severity: Medium]
> Can publishing phc->update_time inside ice_ptp_read_cycles() allow
> ice_ptp_extend_32b_ts() to extend a timestamp against an uninitialized or
> stale phc->tc[1]?
> 
> In ice_phc_init() and ice_phc_refresh(), write_seqcount_latch_begin() sets
> phc->seq to an odd value (directing readers to phc->tc[1]) before calling
> timecounter_init() or timecounter_read() on phc->tc[0]:
> 
> CPU0                                  CPU1
> ice_phc_init()
>   write_seqcount_latch_begin(&phc->seq)
>   timecounter_init(&phc->tc[0], ...)
>     ice_ptp_read_cycles()
>       smp_store_release(&phc->update_time, ...)
>                                       ice_ptp_extend_32b_ts()
>                                         smp_load_acquire(&phc->update_time)
>                                         ice_phc_cyc2time_with_trace()
>                                           seq = read_seqcount_latch(&phc->seq)
>                                           /* idx == 1 */
>                                           timecounter_cyc2time(&phc->tc[1], ...)
>                                           <-- reads uninitialized/stale tc[1]
>     phc->tc[0].cycle_last = ...
>     phc->tc[0].nsec = ...
>   write_seqcount_latch(&phc->seq)
>   phc->tc[1].cycle_last = ...
>   phc->tc[1].nsec = ...
>   write_seqcount_latch_end(&phc->seq)
> 
> Because read_seqcount_latch_retry() succeeds while phc->seq remains at the
> same odd value, the reader converts the hardware timestamp using the old
> phc->tc[1] instead of discarding it or using the updated timecounter.
> Updating phc->update_time after write_seqcount_latch_end() (or after
> write_seqcount_latch() once phc->tc[0] is populated and latched) would avoid
> exposing update_time before a valid timecounter snapshot is visible.
> 

I'm fixing this by making update_time also protected by the
seqcount_latch_t instead of separately, and applying the seqcount to
both legacy and new updates. I think the end result will be better and
address both concerns.

> [ ... ]
> 
>> @@ -3207,14 +3519,24 @@ static int ice_ptp_rebuild_owner(struct ice_pf *pf)
>>  	if (phc->update_time) {
>>  		s64 delta = ktime_sub(ktime_get(), phc->update_time);
>>  
>> -		ts = ns_to_timespec64(phc->cached_time + delta);
>> +		if (phc->use_timecounter)
>> +			ns = phc->tc[0].nsec + delta;
>> +		else
>> +			ns = phc->cached_time + delta;
>>  	} else {
>> -		ts = ktime_to_timespec64(ktime_get_real());
>> +		ns = ktime_get_real_ns();
>> +	}
>> +
>> +	if (phc->use_timecounter) {
>> +		ice_phc_init(phc, ns);
>> +	} else {
>> +		struct timespec64 ts = ns_to_timespec64(ns);
>> +
>> +		err = ice_ptp_write_init(pf, &ts);
>> +		if (err)
>> +			goto err_unlock;
>>  	}
>>  	mutex_unlock(&phc->lock);
>> -	err = ice_ptp_write_init(pf, &ts);
>> -	if (err)
>> -		goto err_unlock;
> 
> [Severity: Medium]
> Does jumping to err_unlock when ice_ptp_write_init() fails leave phc->lock
> held?  The err_unlock path only calls ice_ptp_unlock(hw), so any subsequent
> attempt to acquire phc->lock on a non-timecounter device will deadlock.
> 

I'll fix this.
