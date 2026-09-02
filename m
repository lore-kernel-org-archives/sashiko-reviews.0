Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529D0387345
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 06:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329454; cv=fail; b=auXcxdNmAa+HndIghW3lZGz0ARtRtJFA+ty3BJXNFT06S1gYfGmrP//nzU3ax1f05vjCUAjbaNMp4/dlUhSHORnk5yhd7AYtedIEWTIOQrKPgKPOXyIePBQwW/0KDe1IUMxfAo5C+P+vXVdlsR3CaVezRzxW9/HlVhzIaw/v45M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329454; c=relaxed/simple;
	bh=qeO4UU2MUaf8nfV+fTvzSD9tj+7V0LsQKuabYBhIKso=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lakOnQ6F8DG5Lkhjlx4eLfbx/Lp0onFRb9cxOBpmpJ6Kf1xQNs1huKVHdPuLzihCbRcDRsGF6JqudeBandggnM4NrgiN/NFSC5M+8FnmtGUFrsHrNR0IxbbxWWtUfww2nyKJeIQYYxtGaPunM00/EfT97zfA2bS3QzvwgI4mS80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/cssclB; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/cssclB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788329451; x=1819865451;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qeO4UU2MUaf8nfV+fTvzSD9tj+7V0LsQKuabYBhIKso=;
  b=C/cssclBjjUEnALAWv5nh7MZKjpPQQxkuci38xYhnhStiq59qPcsyI8G
   u9bH+GkvCI33CBwaJK3gP+LeQGdMXbfr9vch7tocb3hISHE0YQ2WrulqK
   JzfOUpStcr8jAbfcqW+sqtTljzXMQnhGetiTJ9bm/FOkqsePRcpjmKLdr
   Sd5P4G+M5PZCizznACWp9pgjKdwl4Z1fRM66mDfU9Zn44BvpLg28ap7M/
   yqJdVnAEllYVUBVh0++xyIS6H9ys/yU+us9VqjHjESwLQtrNcEQvDaidF
   kkYABQ0UoJob5fnsvIALRPsck4gvIi9Qa/JOVfPIdGAHYAmsVdOBlF/Bc
   w==;
X-CSE-ConnectionGUID: q4Dxi2HFQOGeLQAxNkE1cA==
X-CSE-MsgGUID: jgbuQd5kSGmdvLjYws1R+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="76327314"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="76327314"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 23:10:47 -0700
X-CSE-ConnectionGUID: 2YymbyFoSzC0Nya/G0fZqw==
X-CSE-MsgGUID: 1kXVpue1TZ2TgybDXUig0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="265022300"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 23:10:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 23:10:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 23:10:47 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 23:10:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/ogXyPWsJfBvej5Tmv+yHFqE4/t3Df7NnvatpHPZR4HIM11MgfSsCySUdzDiibAFVafdNXZNwvB37OG1BRkUUY+puPGieDyCsxU/CKzNEDxPxoM3+SMdx5IktUIdbFIZk5caOcBHQ9LPwU5oWiFDdE32TF4+He1AswYu+40cDzC//jaajkyn2SI2zmlfJS9Ls+Hvq/hFL1wpB1SGZKPpYLBzqr5kc1vzbcNuaku5RLzm3GOCcX7uANNdFOxNs2HqMkIsGjMx8CqmbbOYwg5hzWsYRogRJF0q2/LYT4ClzUDeIueOu5M3X96IoLj5H4SfP6P/+kfy5g4Wgr/AvDe7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeO4UU2MUaf8nfV+fTvzSD9tj+7V0LsQKuabYBhIKso=;
 b=NB8u7MuxZnsY8SgBN/ERs/n2nIFOxejzI/sX1fStKs3hQyaEt+i40+aq2xaqHflCr5VbpQFd8eF+bLXh5dC+B44MxKQ6QCETcaX4rfGvCKLuc9mJ5xG6RAfdKtwqgeiwF4zlV2Dmn2CCjHybExKN5SMXOljYFSBAAK8sgy7Q42NQAYAaPA4ypStymdvo5DkahMMYU9fgGrkD5Nl3ZwUiueTQPkRhdpYWcMo6BWVZ1SXl4AFLJ9LY/ZUKubp4IoF708HSMg2euPtdddjTp308IO5Kf8FBYqRWWVuaVDaCbOviUT5rF9wImLj+xgqg/KPhpmJcX/hz+5VnVeOBBLaL5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SN7PR11MB7466.namprd11.prod.outlook.com (2603:10b6:806:34c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 06:10:43 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 06:10:43 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe/pm: allow the device to signal PME from D3hot
Thread-Topic: [PATCH 3/4] drm/xe/pm: allow the device to signal PME from D3hot
Thread-Index: AQHdNa3gcQ7x2Y8GoU2OO4BlPkXbD7aw8nCAgAnlxQA=
Date: Wed, 2 Sep 2026 06:10:43 +0000
Message-ID: <bd2fac668a777b3bd87594bcc69e8ac22e00b9fd.camel@intel.com>
References: <20260826225338.804902-1-vinod.govindapillai@intel.com>
	 <20260826225338.804902-4-vinod.govindapillai@intel.com>
	 <20260826230200.69FF21F000E9@smtp.kernel.org>
In-Reply-To: <20260826230200.69FF21F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SN7PR11MB7466:EE_
x-ms-office365-filtering-correlation-id: 5fd9b4da-0a12-40a9-d0fe-08df08b8ebf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|22082099003|18002099003|56012099006|38070700021|6133799003|5023799004|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info: lbZy/59WeFJqgvRhIIP6YGVUTnOssWgqvH3pwT3WJHnlPTrcbGS9/aGE+58dLS0eszxzCV/KOHRP9xkIY5DPFAjQnjfF2w/JU1GjsZZHrE1Cjo9kTl8+fVphmRS90lJLbfLaysxzOcInFTJ5X12PN5mIK+TvMQnZ98p53+Re0K4+JP38huyS98wtsTj2OaAa9NSAqltZLD5MZ8V/8TperqPRj7CHIY4heL5otSOiF7FEZKgFn/H0gfVV2raL+ZBYICwHISW2zFeL+pm0nvoPNYepiURHcksenBI3xEgd1bldMcDx1BtPO2IiD91W9lRMSTk/O1LbrD86qZMdf+F6lGPZbcOgy/oGGCO0EF12cofTn4eQRKILKoezv5nm964lE0fyiOu13j0SS/vZwYUeN4FjQJcbL+htiawenD2HiinFcW04UVHTGLr8I/Hck0r+sWkCDyxFu1qhSXpqUe2g5vmkXFRbJBmn6NF4nnAcWHn9BdYZXWXsyW0oiWJZBP3gwiG3rY4B57cnm2XomgxcHfLx/lyW0lV+pcTzso9gHVcCTzR2Zryo9ZTV2CZehFDO1oaqIgpZ2QPn8lnpLWuLSc4exWgSs/Dy0Kd1qasgSENhHUu32yYaTtd4OR8S6hk9MaQak/mdEehKpA566Mqgt9uYTHxlPVGTgUJZNNoYbJtRXDjjdvnMjFxPYfx9mIbG0VImmA8keTsf/gp6J0N6Aw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7777.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(6133799003)(5023799004)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVhBSTJTSVBYQWVxYldGWGN2RzM3U0cyRmZqVzBKa2UwaWlmOG5GQWN2aDhM?=
 =?utf-8?B?bmNHOURVSjJNVXo1NW5CMERPdzNtM0ZwNnY1aE5IdktkTm5NOVk1OGg3a3lK?=
 =?utf-8?B?cno0RzVIMkN4N2pMMmZrUHZVVU5JZFJ3OEFrOHVVbmtkcGxuWTJYQnJkT0lp?=
 =?utf-8?B?LzBXUDMwWlMyeHdKdG5zT1VQeXIzdUcrS3lwV0l1Mml2RGNQc3Q4a2xuQStV?=
 =?utf-8?B?ZStmSmIxRjJDR1F2Z3RGZFBOcVdDVENlSnF0Ym90aU83MWlIeHVHY2c4VnJi?=
 =?utf-8?B?dHJPS0ZEemhoNXlqWFlXVWJkajA3THFHMHRWdFlMdHFwY0FpTTJQVUg5Y1lQ?=
 =?utf-8?B?UDZ0UnVjMmU4d1pmS3c0UG5JdjYrbmI3Y3o2bzlxTjJtTWl6VUl4U3lsS25O?=
 =?utf-8?B?K1NUdWRacTVLZW1ENVIxM1hEMlVaQ2pBdEthRmJUbWhMOHpjUjRseXhKQzZN?=
 =?utf-8?B?OHNhRVlKazQ3Y083bmZUY1hjTVpsS2NYaCtLWWppQTY4R3hFaGpKSnJKcWVz?=
 =?utf-8?B?V1gvQ09PRFFzZFBqTTNIUHdNMWFoUTN3bUFuNDJWSks5SlJub0hsMEtnb01N?=
 =?utf-8?B?am9JV0dJeERBaFBOTlNPVjg5Q0NYeUVGNVhldTB3clJ3RmNlY3lCWlV1amtJ?=
 =?utf-8?B?KzFEcDRvVEdVV3Q0djBLaWxkTkczRnl6T1UzelRpa09WQTVUV3V1SWE3cTdO?=
 =?utf-8?B?RFFwMm9IZE90eFVCK3A5NUpMWWdhWmVQdUpVZTk0T2JYQzlxbWpTQXdmdTha?=
 =?utf-8?B?MEFGQWFycFR2VjJ0KzJBcGlDRmFqdVJkTyt0aWExL3pHcElKWGJNNmp3VHpz?=
 =?utf-8?B?R2RqVkdLaEFpV2VHZkM5VUJMTGZoWWhNMDhOQ0tIMmR6RnhiWFFlS2FPdVZT?=
 =?utf-8?B?b1hrZFlkOHN0TXZBUVlHZ1prU2dnNGdIaGhsQWo5cEI1WW5hZ1kvTW5QQ25R?=
 =?utf-8?B?aFZwZmVhTm5lYkVwRDdqRXVWTXFSZ2VQekRiSS9hOVU3OXZJbnphT2VZUUh0?=
 =?utf-8?B?aXJTOERqdkVQZGlndTVVRU10RnJLcFZhU3FLNCtMaWZSdmMyMTVjdGtTbmlt?=
 =?utf-8?B?bWxVWTFRUjU4bVdIbTU4NUZ5N0ZsSW1kMFBDd3ovc1pDMWRuOUJ1OWtJM2JT?=
 =?utf-8?B?eGMwSjA3Q2VjcVVpMWVDNWYwRjIxbk41L1k2Yk5keFprSDVOQldyMXZraDlQ?=
 =?utf-8?B?UlhPN0tYei9qdDhzUzJvaEdLRFhmVWd2V0dSZm9iWkYvYWNuRWFBaWhFTm83?=
 =?utf-8?B?VnVEMUtWcnRtQnpGRlNNM2hvaWdoQWc4ZVA5bWVpRkhEM0lLQ1NESldzYUZN?=
 =?utf-8?B?UU1KZkJjcVBDL3hLNmxzWkdCSkJJRDJ1OWMrL3FMbHAvMXhmRVorRFllTFUy?=
 =?utf-8?B?OVQ2MnAvSFZXSWlzWXNLUUpNeXU1VjVNaFd6TWtQQVBPTEMyK29vblFWZjl6?=
 =?utf-8?B?MllBaWt3TGhLN0N0czFFLzRmdDZncjY3TG8zYzBhemRIcGVlVUtEbGtGa0hF?=
 =?utf-8?B?TWpmZkY5WlRwMWMyc3JUQUJ4aU5OZ25VNCtwMHViQkQwa2lRRU9JeHU0SEZT?=
 =?utf-8?B?Yk1tWEF3R0xxVGZQd3hhL1JHWWRxdVUrVjJvNzk5UDZiYjIyQzdVVytZTVI4?=
 =?utf-8?B?WE1xSTVGUE90RnlSVnNqT2MzRVVROWMxUi8wZ0JpaUJYTXhaZ1g2ampuV25y?=
 =?utf-8?B?cjRpMHVTVW04K0pGeFNZV01jTTEyRjVlbXlTRFd3VHNmczhPNDRtVGt2OE5x?=
 =?utf-8?B?bzBkLy9IcFBKKzRmd2FHL1NUNlQyRm12SGUxVDVIUDZZR04zQS9pajg0KzJY?=
 =?utf-8?B?S01BY2NzblJTNVdRZi9Xejkzak9qTUxDdDBXdFJ6NkJtbllFeTlUWTlZMTFH?=
 =?utf-8?B?Rm0wYXRHNnFMemd5VlBlMExzbXFCTWRQQlpGQktOYnBqT3pzUUNCemhyL0Zu?=
 =?utf-8?B?NlNVdktqVzBtdVJHVDJWTzVldEY2a3BSY2ZGMENEZVh5NVk5UWJlNG9PSlFG?=
 =?utf-8?B?aE9XZ3M5OGRmQTZiYUlxcGtqUUpmNUptNHYyTXQ1cGhvdTAzZVBZMitxV1NU?=
 =?utf-8?B?czhyMlkvY0ZoNGhXSVE1VjNYelJseE9vU3dtS2M2Zm1HR2NYS2tVVmFOM2lZ?=
 =?utf-8?B?a09ialkzWnY2K1BxSnZvclhPbnU2b2VoUVFQVW1TUzdpSjFWaXRYWmxOWGpu?=
 =?utf-8?B?QXFZSHhhWWNsS1M3U2ladWw0Q2hIdkdHalhUNlVWUUFhNzJSbEQ4bGI4NnA0?=
 =?utf-8?B?dnB3U2U3dkwyb0xyaXp5NGtybjRQK3V6Y1I4V2F0eklrbit4Ukl5eXFnTkdw?=
 =?utf-8?B?WklZby9jbEN5TEdYUnRwS3V5alc5VVpyMnRoOGxRNzFqNjltOVIxaUZDekND?=
 =?utf-8?Q?lmHS7ARth9wRgEUCOKPd014Z74Si8y3ynPtg4KR2fIsMw?=
x-ms-exchange-antispam-messagedata-1: xAJFgN8XAMablBIvkergthUHQ6w83wloaRo=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04665495038743458D63BBE4554A6E82@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AxCgwAbf/th7F6oO7PJYxLtidG6HOnJ4L2+9QcqbLP9mB33xhU+ulme9Jv5q77BJ9Wz8PQnaizVtkE6MfsS6VwG2uFJ1vTJXBn0bAUDKRIYUDPLxJ3ewSsFhkeGBnmC3ed3DavL3pEEYbYiLDMN2xOtpQvnNrG9BVLtOrGwY+3CR4nfkr6JU2TRKwG67RLmXy42IO2TPC5Mfd/FSfYo25AhrYX/g6i9Zr6KX0jTnPWbY3e0TMYrH/nKHmTeYJIa/MUuwWY0tJK60F4XSeNhUGrsJXAUt3RSKxahUUvL262bI3o1TOemWLqYNv2/mzwH8VxbXiP4yaBhVfZ4V8kko0Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd9b4da-0a12-40a9-d0fe-08df08b8ebf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 06:10:43.5410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 46V0ClmtsHJ9eEN+2geQbtcjgr+8gLc03h2AgwDDNanFvY++whqMLPsB/PFKGbrnFAUDdh2WJcOozwdzxvnh3/uWaXAODMzOyX6SyjDHTu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7466
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTA4LTI2IGF0IDIzOjAxICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAxIHBvdGVudGlhbA0KPiBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTWVk
aXVtXSBUaGUgdmFyaWFibGUgYGVycmAgaXMgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoZSB3YXJu
aW5nDQo+IG1lc3NhZ2Ugd2hlbiBgcGNpX2VuYWJsZV93YWtlKClgIGZhaWxzLCBwb3RlbnRpYWxs
eSBsZWFraW5nIHN0YWNrDQo+IG1lbW9yeSB0byB0aGUga2VybmVsIGxvZy4NCj4gLS0NCj4gDQo+
IGNvbW1pdCA0OTUzOGIyYmFlNmQ1YTVmMDU5OWRhMjI3NzMzYjI0YjYzZDM2MzliDQo+IEF1dGhv
cjogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+DQo+
IA0KPiDCoMKgwqAgZHJtL3hlL3BtOiBhbGxvdyB0aGUgZGV2aWNlIHRvIHNpZ25hbCBQTUUgZnJv
bSBEM2hvdA0KPiDCoMKgwqAgDQo+IMKgwqDCoCBNYWtlIHRoZSBkZXZpY2UgYSB1c2FibGUgd2Fr
ZXVwIHNvdXJjZSBzbyBpdCBjYW4gcmFpc2UgUE1FIHdoaWxlDQo+IHJ1bnRpbWUNCj4gwqDCoMKg
IHN1c3BlbmRlZCB0byBEM2hvdCBUaGUgUENJIGNvcmUgbWFya3MgZW5kcG9pbnRzIHdha2V1cC1j
YXBhYmxlDQo+IGJ1dCBsZWF2ZXMNCj4gwqDCoMKgIHRoZW0gZGlzYWJsZWQsIHNvIHBjaV9lbmFi
bGVfd2FrZSgpIHJldHVybnMgLUVJTlZBTCB1bnRpbCB0aGUNCj4gZHJpdmVyIG9wdHMNCj4gwqDC
oMKgIGluIHVzaW5nIGRldm1fZGV2aWNlX2luaXRfd2FrZXVwKCkuIEQzY29sZCBpcyBleGNsdWRl
ZCwgYXMgdGhlDQo+IGRldmljZQ0KPiDCoMKgwqAgbG9zZXMgcG93ZXIgdGhlcmUgYW5kIGNhbm5v
dCBzaWduYWwgYXQgYWxsLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BjaS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gPiBpbmRleCAz
YjNiNjQyNmQ5NjBjLi5hZjU5ODU5ZmQ4Yzk2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY2kuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0K
PiBbIC4uLiBdDQo+ID4gQEAgLTEzODAsNiArMTM4NCw3IEBAIHN0YXRpYyBpbnQgeGVfcGNpX3J1
bnRpbWVfc3VzcGVuZChzdHJ1Y3QNCj4gPiBkZXZpY2UgKmRldikNCj4gPiDCoHsNCj4gPiDCoAlz
dHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsNCj4gPiDCoAlzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSA9IHBkZXZfdG9feGVfZGV2aWNlKHBkZXYpOw0KPiA+ICsJYm9vbCBwbWVfYXJt
ZWQgPSBmYWxzZTsNCj4gPiDCoAlpbnQgZXJyOw0KPiA+IMKgDQo+ID4gwqAJLyoNCj4gPiBAQCAt
MTM5MSw5ICsxMzk2LDIwIEBAIHN0YXRpYyBpbnQgeGVfcGNpX3J1bnRpbWVfc3VzcGVuZChzdHJ1
Y3QNCj4gPiBkZXZpY2UgKmRldikNCj4gPiDCoAl4ZV9hc3NlcnQoeGUsICFJU19TUklPVl9WRih4
ZSkpOw0KPiA+IMKgCXhlX2Fzc2VydCh4ZSwgIXBjaV9udW1fdmYocGRldikpOw0KPiA+IMKgDQo+
ID4gLQllcnIgPSB4ZV9wbV9ydW50aW1lX3N1c3BlbmQoeGUsIGZhbHNlKTsNCj4gPiAtCWlmIChl
cnIpDQo+ID4gKwlpZiAoeGVfcG1fcG1lX2NhcGFibGUoeGUpKSB7DQo+ID4gKwkJcG1lX2FybWVk
ID0gIXBjaV9lbmFibGVfd2FrZShwZGV2LCBQQ0lfRDNob3QsDQo+ID4gdHJ1ZSk7DQo+ID4gKwkJ
aWYgKCFwbWVfYXJtZWQpDQo+ID4gKwkJCWRybV93YXJuKCZ4ZS0+ZHJtLA0KPiA+ICsJCQkJICJG
YWlsZWQgdG8gYXJtIFBNRSBmb3IgRDNob3Q6DQo+ID4gJWRcbiIsIGVycik7DQo+IA0KPiBbU2V2
ZXJpdHk6IE1lZGl1bV0NCj4gQ291bGQgdGhpcyBsZWFrIHVuaW5pdGlhbGl6ZWQgc3RhY2sgbWVt
b3J5IHRvIHRoZSBrZXJuZWwgbG9nPyBJdA0KPiBsb29rcyBsaWtlDQo+IHRoZSB2YXJpYWJsZSBl
cnIgaXMgdXNlZCBpbiB0aGUgd2FybmluZyBtZXNzYWdlIHdoZW4NCj4gcGNpX2VuYWJsZV93YWtl
KCkgZmFpbHMNCj4gaW4geGVfcGNpX3J1bnRpbWVfc3VzcGVuZCgpLCBidXQgaXQgaGFzbid0IGJl
ZW4gaW5pdGlhbGl6ZWQgeWV0Lg0KPiBTaW5jZSB0aGUNCj4gcmV0dXJuIHZhbHVlIGZyb20gcGNp
X2VuYWJsZV93YWtlKCkgaXMgaW52ZXJ0ZWQgaW50byB0aGUgYm9vbGVhbg0KPiBwbWVfYXJtZWQs
DQo+IHRoZSBhY3R1YWwgZXJyb3IgY29kZSBpcyBuZXZlciBjYXB0dXJlZCBpbiBlcnIgYmVmb3Jl
IHByaW50aW5nIGl0Lg0KPiANClllcy4gVGhpcyBuZWVkIHRvIGZpeGVkLiBXaWxsIGZpeCB0aGlz
IGluIHRoZSBuZXh0IGl0ZXJhdGlvbg0KDQpCUg0KVmlub2QNCg0K
