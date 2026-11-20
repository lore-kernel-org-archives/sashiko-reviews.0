Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795205702;
	b=pAAJ7rrX6D4ehHWILRkAL3qfTjN9dQCKhzUGyCLYiLCmfI3PuEH39NTe7SratIJyK8sA
	 hCBvEOpT4k7i5NCWAS4vqxTevIRfjVRvmP8MYan7124FQhTiOess26aGFQ8rzqMdxo12u
	 xI+o2stWkXWMy9qA6jZsvEYye4u5LDlx9BSq1ThdyPjysmAvIYFGnZBrY99U6GH8Arb2w
	 cM0jbyjxImIjx2Py1nZirQq1xLE7QbSAqoCfvjD/1JNCqWmGrFt6qSZ3X4EptTyrHGp2e
	 XquLYWz0cmyLvg/DsjCcBjkWsT6EukPv+fqwgpIPQESQlkdQKh6L8jkO57WuKmR5Plg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205702;
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
	bh=PaRi5U2wHxQOxGuejleNqllgVNli+etbdicUc97g5oI=;
	b=uEE74tgQDAL1vnku2h6G6k8cQMxWUpFvxtCwSkDFdB8lsGuI40DJQJyUwHdBwU04R7Gs
	 lyZXstt2X1il+D+IVqfqE08YiBtEG4BiZ7nTn440D/fQ+hq9dBGbFM2rRrxU6qJiJUpzA
	 yY3PmQSfkYPufPpkW8fvu8/yajtdsWS2zmLc4sX5dziyk36nJjRYQ78P8PQNt7U4jF86P
	 DDabd3CirfMVvgtaGHRFfRveqYJLtP9zpBmmCEmXyjCh6+7w/zeHdGOi1TmCYVF+CoSoj
	 ooZ5oQG8WoIlWd1nQQc2omDWlHGUu3Ynjyj5N0qGAM/jl+6C+vTqfIdRbkgV8+2XUBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gzklExDo;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gwGwDphg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81291606A6D5
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 20:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81291606A6D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gzklExDo;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gwGwDphg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795205695; x=1826741695;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bolgNZIbOsjMvii2nJifb9U7HlDmU/C7jjQBgMmMQVs=;
  b=gzklExDogCpxaPKjBXok5PiCDfuYynG2FXtEV6aXp0+ZluHxg2Tr2ZTA
   1VxC+LwJjXoPiHXtY/SEesGy9c7pWo6GskHhnz0y9eyA3dSHKKE6PbLWg
   bxTK4rCHxZ+wHPnxBAzis3/xIO/zwvyBs6C+kTmxH3vv9Io0xKR8W+uyd
   1kisPU4SDwvVUWAvcQtWgMe+G+Dr1Zho1zyYkNuIHZQen05U+LurHd23w
   ct6pnRB8Q7ZyFe9WKpdmM8XdcLvOTJxKkz/nnzI6PkgOedfOujFRNAnsk
   gpCAPeCj/obppqfnrpanRWNkuJOIb8DBdSjgrn6c3fKNr0sBzMpMxnYN8
   A==;
X-CSE-ConnectionGUID: 8hZnT6TUQqiRm1bVJXr0jQ==
X-CSE-MsgGUID: TCW6sFcLS4uexlSxzUQJ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4002476"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4002476"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:14:54 -0800
X-CSE-ConnectionGUID: QHMdh3kEQzSmof1B8Os0cQ==
X-CSE-MsgGUID: zbOY+gRMSh2lT/WKh8Xmng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11102284"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:14:54 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 12:14:54 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 12:14:54 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 12:14:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/j1nr5iNSqMFONoEBHaRbTVjPp2Es89oszOx0/H7pkLfDh6UzXc8Jov5VEC82keATDgCrUOJFpNCUzmo8iRuHOqecZfaiqrxvlc2UPP2Wm35zKOIFkAzDuzm0YaZ78B7bntm9qr5pD1zNaIixqDOUYu0BETPnVbjRCVGAeaEBpa0VAfh1snnq4cVm5dTkNxRha3DYeXRDCKFKz7Yy59CLm/xCvKFJFXYvbDsxLcChubmj5HxNwtW4Q6BxIeQ4RMdU/hoBwa/iS+SqL8nVXMRWxyVsuE4w4vCNwf7zJCkJcovML3/usMlLi/rWEr6gKa/BL52KZ6iYgSBQoL4s3L8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaRi5U2wHxQOxGuejleNqllgVNli+etbdicUc97g5oI=;
 b=pBmGbErWQL8NbHuZjYFEeV7yYwQvaZGYeRlwPwHoTi6ZB+VMs7rsbbDC9Yc9F9xJJpJ7Fso7q6hcAxMb53V1BzwRslJ41HDzImTKc4DBfTIrcckpv81v9/AfqRyjGrMxkXt69z6vsAeStV1FxHvyI+g5kPenl9T+++K5mpuqe5K/L7YCj6b81J8MB/jJcVKRj9VgwKrYNxKdY6a7Zd47ttUlyb8oIcMq69+3VGeoFxUTWlBVTsxoOQh0z73qmoFVhVvt4OEjxEUImjvPWp6azK4BDOCJ1x5Pb1MWp1pcZOt4y5Q+cY2sF3s+QfYJCKCeKc2cc/eQzbRf/VZh+astDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaRi5U2wHxQOxGuejleNqllgVNli+etbdicUc97g5oI=;
 b=gwGwDphggxe2sD0jtiDuduMYsETrrK4i+S4lp3cVI+oPMJiCc7pMRonSeE/p/M5d4F9Y+QFFDWhOGso2Vfcupi+ravUEYM4k+D+WT7kgn1s6jQSxWXdrEAilrnU7Zl164RdUdQjNcH2jFnz1EIxuSQGYd2Nz7s9cOuIqbB9Jq8w=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB6734.namprd11.prod.outlook.com (2603:10b6:806:25d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 20:14:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0615.012; Fri, 20 Nov 2026
 20:14:50 +0000
Date: Fri, 20 Nov 2026 12:14:45 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 1/8] drm/xe/oa: Ignore a HW tail pointer outside the
 OA buffer
Message-ID: <awCqNad8YS4wtPxO@soc-5CG1426VCC.clients.intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-11-umesh.nerlige.ramappa@intel.com>
 <sashiko-outbox-222253@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-222253@kernel.org>
X-ClientProxiedBy: MW4PR04CA0074.namprd04.prod.outlook.com
 (2603:10b6:303:6b::19) To DS0PR11MB7408.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f4050d-7a65-4ee3-d7a7-08df4742ee2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|260925021311599003|56012099006|260925022911599003|260925021911599003|5023799004|11063799006|4143699003|261022105027099003|261028144727099003|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261009223027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: rWxXYt9LdYRJoANUdkdzKFFDCAXMkM+w5BxvtHWIRGWNiFg2QoN8mZvckchCfWaCVqqgO6zpUV6wmC7MAxOiXfKdOA1zDMjPvQXR+qrmNN0OQ5j8+WlWONMQ4x740lb9KZNCsd7wvfOM2kvMs8bzR2DUdD7bNGvyZiTx0pzX1G0DYlS67WkMwVu6iN/EFFdG6sw0tkaiwFs6K5xpgHcfYiMdHX7so2Jg3H/kBV8NVOb5vJ1E7VcYUBKfQ0SitCURTrp1MTPe9l/WibKjiQHWMzQ8HBczUJKf+exRKbSyMlecEsenWy0IhKWW9ROcJLxPhKkrCJDpSsJQSmTiFCNWJbuqv/rBfRx01fStED35kPIU5rLpfEQOeI7BEY1Y9szIGNWFV+tv+NSgcd++jVwHRubhF5QfMHz2y0ZrO2/o1MvvR+84sqwL8wPIEBO6M4e1Q693OASpQqNSZbXkJOG6Nvx3VFDMFRAyhJWq665142IdLD9GLtRGNjkUeJDprk+OAqZWG6qnqR/XCT4eMruGxk19Wk7cUuOv30V7pf1g5OiIPk/slhP2Ii82142QaDt+rYVY81oH7WYxCFn4JXhzc72JTrpsUuzxdfaXtkF+EU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7408.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(260925021311599003)(56012099006)(260925022911599003)(260925021911599003)(5023799004)(11063799006)(4143699003)(261022105027099003)(261028144727099003)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUovRDJ6V2xHejZjdWFFVXZMcEZsZXJ5dFZXM0QxZlFvb09CbFVqb0NzbnhX?=
 =?utf-8?B?azQxdjYvZmZuREl3QkN6VW4wYitvalFiRDZGa2NYUmlYaENHZ28xSXY0eXcv?=
 =?utf-8?B?ak56VVNrRlFKUTM1UWhZd1ZNNkRWRnJPMXczbXUwNzR5QnJ0VURBYjlycW4w?=
 =?utf-8?B?ZWZpaGRGeUJVRldMRTdaVGNwN0lIMHpIZS9JYjNVYVM0d0pvY01RKzhWUC9S?=
 =?utf-8?B?czl2MXFYdWpSTEkyR3RqK0RWS2JqTVlnYjZVdElEdGo5OERVR0xYSGMyUThi?=
 =?utf-8?B?L04vU01WZFROM0o4Tm5PcVcza0lka2FnSzQydmNSbU9NbEVsR3lRUXJWWjlx?=
 =?utf-8?B?S3ZENW03SGRJWGh3cHlTQm9yakF6ajdDUWZWUXFzTXdDeDJuQk5DZTNBRm0w?=
 =?utf-8?B?VkRmVSswZnRzVmxOL0preCsvUk5JNHZneENLVXFGWGpoblZNR0ZpWlY3bzAx?=
 =?utf-8?B?ckY0Qmp3RmdpL3EwS2N6M3EwQnZIMnFrYVFWcnpISDl6WjZPem94KzlWWk45?=
 =?utf-8?B?aUt2SHUxWTczcGd5UTZIWU9EYW0vcUJQby9ka0E0b2FRSDhVVEZ0NC9CRWlH?=
 =?utf-8?B?OVpLUS9udm1FcXpNd1dJMS85TjFmQ01YN3RhZW5ZdXowV1NTZG9hQXhpbFBk?=
 =?utf-8?B?MFhpeFJKbGRBWXlZR3M2N0VoUXl1TGlXWjdmTi8xWEVsMG9DMEJYVk9CVFlF?=
 =?utf-8?B?bXYrNzgzd210cTZSZS85b1p4SVJ2VGVjN0VtakE3L05ja3oyZEkxWFNiUlY2?=
 =?utf-8?B?UmFnblBKTlA4YXVkZzYzdFYvVnVZY3djRTMxM1pwTTdoNWprNnF3bTNaWlpp?=
 =?utf-8?B?SzN4ZE5yUWVMN2ZvZmNYOTZLWDNrK1dIOHNONW5NVWRLbzgwczdRQ2VieWZj?=
 =?utf-8?B?TXIzMldJNzh2ODdYUWlxMzZ2ZHYwQnA4eWJlTi8zN01SL1ZoZ0dGVW0xWURZ?=
 =?utf-8?B?T09OLzJzeHp4eW5HQ3MwYThDUnRIZS9OMFN1ZnBicmgxU1BrQTRNWmJvK2VK?=
 =?utf-8?B?M3dqaG00YWx5c3h2S2FUN3pyVVRYTWFCQ2gyQ2JPbnhmcEpnU3RTQmZ4UlA3?=
 =?utf-8?B?Nm52RE5RQ3owT2hpZmhxR2JqQ1hzMW10eExaQk1PYytBcEM4aldxcG8vT1RO?=
 =?utf-8?B?aFNCUkRwbGZJOC9hTGM2QjhNUTRjbGdnTjF0WWZsdTN0Ylh5djNNTktDMXU4?=
 =?utf-8?B?WXlPZ2dHVElpOXBSUUdPeVYwL2VQYXRsbGtjK3krRm5MQXV1NkJuY240ZWhH?=
 =?utf-8?B?WnIyekxvNUZHa2xmbm84ak5FTGZkQWtGazBzU1BpN202ditGYjNpd3QxR013?=
 =?utf-8?B?UVIwM1Q2cm81ZTJubXYrc1o5TW1QMVJaMitZTzNZTjR0b015a0FEYUw4dUR3?=
 =?utf-8?B?cHhZbW9JbFVhemNXZ3V5WHZqU3lNc2l4YjlvZk9tM3J5T20vbU9Iak9kWlh5?=
 =?utf-8?B?Vy9wMm5rSTZpQ0dKSDI0UzdpQzM3UGd3QkhYLzBLVVZiMm82QnBPZU5wazRP?=
 =?utf-8?B?VDVPTmN2RzQ1S3B2bjBEOEt1S0prWHI5SExVT09xSDRxS0hyVU0wcWJPUWZV?=
 =?utf-8?B?MlVMWVJKUWJpR0Y4US9yNDFHSGVSbjREaU5pcVRsZjZ5UlF5NkIvMFFOYjYx?=
 =?utf-8?B?dVpLOHcycVZGVkVVcE1sNjBhdkl6YW1DUTdwR211RHZwZFJCVFF1ajUycnE1?=
 =?utf-8?B?R3U2Y3V2WEEreWtLUGxleGZqeGJWUjlxUjFrMHd1ckZCY000NVJpaWMyU2tj?=
 =?utf-8?B?ZW5jY2FhOW1BUmcwNjRuUjdLdGdPY3dRRHhtSHo0NEZqUEQ4VnRlbzc3TVBH?=
 =?utf-8?B?L2E3QUdPTTREOUk2OFZTTG1yRE03blFpbURSVHM4dDVTZE9PM0N2OFA2R0k4?=
 =?utf-8?B?T2tvWW5yUXRBak9TTVIxQWNSM0dzbXlxZlRrdlpCd0pBSm01enE4MytWMFh3?=
 =?utf-8?B?OGdlZk4zdVB4aDVZaUc1ODhEaElsNDZESFF1YjMvV0dXdkR1QmxObHVmczdQ?=
 =?utf-8?B?VkdnUkhhNVhYMVRlUkNMU0JvbG5ISzJwb3d4T2IvTGVPaE55bEkzdDRQcFl3?=
 =?utf-8?B?ZitqTFAyZ2Q5QkhuMmRYdjVtRUJpTEVrWEx4TlNqVEtncXVzZ3hLR1JuMkJ1?=
 =?utf-8?B?YU1DL3RyUWRtZHBnUFVSSElzVFpTRWdGSk1CUXEwbm4yUG85bkdPcUxTNkVE?=
 =?utf-8?B?R2w1ZTFHL2tvc3JlSXlwK1VkNi9LbW5MWEI3T082djJBK2JWM0ZicnMzN3pZ?=
 =?utf-8?B?NmtGZXE4L1RoV25ML0JiM1hrdUl6SGtjK1JGYkRURlFoSDU4dmI0ZkN2N0lr?=
 =?utf-8?B?MWIwWlR4YU95ME5QRWxkcmlXUVZ6cTFNNTg1WHJ6NW43WThmditlTDFnOStw?=
 =?utf-8?Q?+NjCJgA6ZSsjUo+o=3D?=
X-Exchange-RoutingPolicyChecked: pWXxzODALZ6TvtHnpbPX9Gis24IgM0FLdyvjieg6NTQseSmRS7kxPHPHqcvSxRZaGgbfBIR+xDom/aujwtaGJdZPC7Lov75rgeIqvO3LrjIZ+Ms3liYmowFH1Xquh1ssY5V1U1WDxwLZvMoc4PQbi2vBbOtLtrWABLEU/I1MKvbzrPmYftBGlB8W1EaP7R+iM93VvkssPoOw6W2B2RuIp2dd5gQT2+3Sn8DGMoZZIWiBcVVi0JkN5qCmnpC2h2s+W4HFtTYTEQgYqkrYjzYy/z533Nyqq+F61rwBILfhbKkPveBwHjoYoVo0xxGC6CBGSP+Qb42ew36oWpmCvkzxog==
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f4050d-7a65-4ee3-d7a7-08df4742ee2c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 20:14:50.1717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xq4A8V4XtMo/Tx8SV65fUcL0kGBoe/MXMe9lfyYN9SlCLGBSduB+gwVtwP8558D4m+wiiYNANP1bPO1+vLkpRIqDidRVPFbDuL/IomdN0/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6734
X-OriginatorOrg: intel.com

On Thu, Nov 19, 2026 at 12:39:47AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential
>issues to consider:
>- [Medium] drm/xe/oa: early false return in
>  xe_oa_buffer_check_unlocked() desyncs pollin
>- [Low] drm/xe/oa: Fixes trailer cites 3a1fc394ba85 instead of
>  cffd77865f47
>--
>
>commit 42d5de4e7078897659a5043b18ec1b877eb0c6b7
>Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>> drm/xe/oa: Ignore a HW tail pointer outside the OA buffer
>>
>> A device that stopped responding, e.g. during PCI error recovery or
>> after a surprise removal, returns all ones for the OA tail pointer, and
>> a reset device returns 0. Subtracting the GGTT address of the OA buffer
>> then leaves a tail offset way past the end of the OA buffer.
>>
>> Since xe_oa_circ_diff() replaced the masked OA_TAKEN(), nothing brings
>> such an offset back into the OA buffer. xe_oa_buffer_check_unlocked()
>> walks backward from it, reading report ids and timestamps out of bounds
>> of the OA buffer mapping, from the poll hrtimer in hardirq context and
>> with the OA buffer lock held.
>>
>> Ignore a HW tail outside the OA buffer, as if no new reports landed.
>>
>> Fixes: 3a1fc394ba85 ("drm/xe/oa: Changes to OA_TAKEN")
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>[Severity: Low]
>Should the Fixes: tag point to cffd77865f47 ("drm/xe/oa: Enable Xe2+
>overrun mode") instead?
>
>Commit 3a1fc394ba85 ("drm/xe/oa: Changes to OA_TAKEN") only renamed
>OA_TAKEN() to xe_oa_circ_diff() while keeping the (XE_OA_BUFFER_SIZE - 1)
>mask.  Commit cffd77865f47 ("drm/xe/oa: Enable Xe2+ overrun mode")
>removed that mask and added stream->oa_buffer.circ_size.
>

Agree, fixes tag should be updated.

>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index 838802482adaf..fdd2d11ce4e7a 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -270,6 +270,15 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>>  	hw_tail = xe_oa_hw_tail_read(stream);
>>  	hw_tail -= gtt_offset;
>>
>> +	/*
>> +	 * A device that stopped responding, or was reset, returns a tail outside the OA
>> +	 * buffer. Don't walk the buffer from there.
>> +	 */
>> +	if (hw_tail >= stream->oa_buffer.circ_size) {
>> +		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>> +		return false;
>> +	}
>
>[Severity: Medium]
>Should this return stream->pollin (or recompute it from the unread data
>between stream->oa_buffer.head and stream->oa_buffer.tail) instead of
>false?
>
>If reports had already landed and set stream->pollin = true before a
>reset or PCI error makes hw_tail out of bounds, xe_oa_poll_locked() will
>still report EPOLLIN via stream->pollin, while a blocking read in
>xe_oa_wait_unlocked() will wait in wait_event_interruptible() for
>xe_oa_buffer_check_unlocked(stream) and stall instead of draining the
>buffered reports.

Ideally yes, but at this point, we know something is off and we do not 
want to guarantee that reports can be read from the OA buffer. Note that 
reading reports itself will result in MMIO access that is not guaranteed 
to work at this point.

Thanks,
Umesh

>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com?part=1
