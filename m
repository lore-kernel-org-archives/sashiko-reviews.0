Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9293B48422E
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042498; cv=fail; b=mMMnjN/2IzuHf6hI6OAOHIunwhpe37z/lvtHcoSi4wIgXhh7Pq2N3KFUSxMHD9wWA692D90kZ1FgCd3HFCeW30hYhvRL5quS+4ezXcqNTvjfbt9qLZCE2sHzzACy31pYxlZYQZu6qQisg6H/QWza4HJUsc+uSa+D+/l2u8dwiWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042498; c=relaxed/simple;
	bh=aiUJSWXtIWBpFBHi5tpB3kKu2k1TmWKGJYqBznbgFOA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jp6/5afSqszq9A8WMS0YqlvTD10LAuQA6Cek5bM0cX5r95qmB9OGm7h33VTb9f8DTkwyIEUrlwrKCtotVGllRTX/dvnbiukMF28RetnzuH2Utn6PIp46jopxvB9GOrxg7dDi/943aSETHPdk0ytFxfxr8uSHRkvHu5NDCjLrHxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+lywAUP; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+lywAUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789042494; x=1820578494;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aiUJSWXtIWBpFBHi5tpB3kKu2k1TmWKGJYqBznbgFOA=;
  b=c+lywAUPmyHHPdoPQeFn/OiLGgoQEJ95IsLM5L56OPaFyMdDIXKZZFCX
   sYqT58p/NWETET0ZIi9dCkSKHfyUu0OINIlUsAnCK+tjIXZd1TLjEydDH
   hdDCRltofTTT7XueYDEJKs985S0c2HOtFiZ9I8ZRdete3FRonYt8yYQ+R
   z35Mzxsp7dmPmYqoGtaLxVXFnHZQ0YLt6CkxqJitJjYpaXl2nanyQGGoV
   MN2/jPrIf1xc5F40e4tlJsqNYFhHhpLBC0EOuNBVQ9mr/GYmcwijO759I
   S4aodxAiv8Wp1ZpF44pE7zGEgCTJNhbhlU+goeVEU+/RzIFSNoyHJWSZe
   Q==;
X-CSE-ConnectionGUID: yQUab65RSVun76JFKSRL6Q==
X-CSE-MsgGUID: Y9y6jRBkQDSUSGMopOleKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100843635"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="100843635"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 05:14:51 -0700
X-CSE-ConnectionGUID: TeVJeUduR5S8BJQ+l+Mbbw==
X-CSE-MsgGUID: /wzAPVnSQ3+J90NlF52p0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="295110470"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 05:14:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 05:14:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 05:14:51 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 05:14:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4ZfRZ80K/w8zWvGyazwJQI9bZ+BVWHODRuOzWjj3NR0450Buz+T9QNOaeI3CsWq1RdbShAVXdNiXSxYcsTqeHxJMzsMWiyfDQRF+NUCXb4a7xzymFmRdMfYQTMRPVi7mUgg9JlxkPQQDJMHnCpHU+utktvMwM6feBV7p+v2iMXa2bSdNkCpi+wBkR5nmtyyzbVPMlBTrtIC3anHeAnw/15l46MU+m+XC7LtzDb804kPdU1/EMEzsLJ2SbuZBFC3I6Ia/itI2aDtDe4YnCZtA76lf72hny+8PHu/GF5HNiKZJ2CGsVQgq9hSGkvCvxvk00+YJMA7efrm2BpgwgGwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiUJSWXtIWBpFBHi5tpB3kKu2k1TmWKGJYqBznbgFOA=;
 b=elIyrzEELEIoZHO0bilzGq8F3YLZe2l2LSfEXogrEjJb/+bNTlNHg6ZvSfkXDxj0AuXbx8N+m0FXwBCV0YaoFWOfbzSYCIurOsMDbkE/K23kHKoonVwRNjqsd1Mvl3ahcOxjUmZcWAbf8lAJpzbQhOLfhfd1IXW32ydqEGqGVkfQT2GW0xuA/30MTh+QXI6ngwWtYr5nIbUQTg+u70u2rDs9G7/q6DbONJ0Et5SheeSA2Ga3RYga2lGch4wMbqQ4ChujEx/pHkBheDGiXE6E8dB9NpFqgtih8o18Pu9MvobTX6OybLlvvu5fxrCaRNoJpZXu4MzuTXD8kpfKSaYwKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 12:14:48 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0382.012; Thu, 10 Sep 2026
 12:14:48 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/i915/psr: Clear stale sel fetch enable bits on
 sel fetch disable
Thread-Topic: [PATCH 2/2] drm/i915/psr: Clear stale sel fetch enable bits on
 sel fetch disable
Thread-Index: AQHdQEs/zGibcrYjLkmfiJR6dIDXZrbGHReAgAGbHtA=
Date: Thu, 10 Sep 2026 12:14:48 +0000
Message-ID: <MW4PR11MB68878EBFFCF64D83B19B460BE3BF2@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260909110332.3528029-1-nemesa.garg@intel.com>
 <20260909110332.3528029-3-nemesa.garg@intel.com>
 <20260909113205.B55FA1F00A3D@smtp.kernel.org>
In-Reply-To: <20260909113205.B55FA1F00A3D@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|SA2PR11MB4793:EE_
x-ms-office365-filtering-correlation-id: adcecdbf-0695-4d83-26a5-08df0f351bd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|4143699003|6133799003|11063799006|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: elQxv7GlreKKdFMhrUbxusL5yrvX9huZFIiLvhVmiWamiGTXZA51NfVQAJ8Goyt1bBERmoA4Vsn2eBxNxpvJgLkSLJOzTkaMozen5ZEED51liJe3Gw+MZijeacwYoaCn3mhRNXET1gYBKcuzNYw5TUo1eK2dDLa1+JKVPwGRfY/3Of8nu7mGweg9iPIwuik98DEjhtIgtgXn6fITkFiIt/3bjiyaWc0sPUQH8WzsiT8JlByMJn0QVifQOy8TYjsgTr48lcbcTlVNeX/H3vT1cBQhMilLLM5jima9/RIyWIUyM60cL3SvWuEX0pzSZSxlqKsgyeoh0lQ/lKTdZCFhotMbzA8TH6QMTpB/D1LtICMDx0p74EGvrQWDlu5Ub87Kg3qQBzOT6i+M7l9RI+zrrWEaFSZEXPEPWQ8MXSS7ZuIlKnl5g83rqg3mI1Xhoymp3jFspHy6dvWRQiIy86l6doLdwOTMhPRAQY0YqfPRn9Z+TuWUtmtn1m2sMCWqsABjA5OEadqb4Clj+FVnpy+CoiYg2LSaysAdV7N+KSNDqfCkxp5iKyZCdHFXEn5qeZpTF0hJkSsQajWdZP7ylRYzZu5GXGmwgo7CdZglGdTsjvKz8+8g/du0R/1/KF7smqCerg5hMqlAXZp0WuMQWks+flHJZSCvudJXFby4Ea5ZshM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB6887.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(4143699003)(6133799003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzZzK3N3M0wyVkNrQ1VORVdaOXdJUExwbzVCTy9tRG44NEhodGhURDMwUkJy?=
 =?utf-8?B?NEJqV0NnSmFEWjZlR2VUZHlDMFFxcXFFUW10VkJTdU1wNnY1cnpXWWhUc1lH?=
 =?utf-8?B?OGtkNTdJNW92UnRYRTlLR0xYSFQybkI5Mm80dzBIUk91K2hBMFpnczNsQ1Zr?=
 =?utf-8?B?U3hKNHlVR01GYXN6S1d3eGZKVkxWNllEeW5ZNUtKYUZ4OEg4V2w0ZjhRR3ZE?=
 =?utf-8?B?azNtWUE5NFRQOGJpbm40VG5Nc3orWUQ1eDN4L3BDNi94ZlVtVzlTNWVyeFls?=
 =?utf-8?B?Z1Z1NTdSWmlOOUpsM0F5dGNMeEl2aXE4V25YaGdqZnJYN1VJcjhIRFNBQnpZ?=
 =?utf-8?B?b0VDVGpvUTI0c1d1UzdIUlNLcXM4cEw3UkVlTEJGM2FCWXkweVYrME1TNDJ5?=
 =?utf-8?B?OUE5VS9MQlVsM2ROM0ZqT0x6MHZpMDlNNWg4dkZHN2FNUXQ4akhhaHg2b3hy?=
 =?utf-8?B?dmRSTWZtbkpPYXk3cTVuR04rUDhONEl6YS9PNHphb2pZV29CTmFWYTFRQmdp?=
 =?utf-8?B?bFpHaFFSeHBYN250MUEzWVp5MGZ3cDMxN0ttVjZsN2tXRlNRQVZJejIvSTlo?=
 =?utf-8?B?eVJGTkk3d1BWcXJvQ09ZblZ0cDBpN1FXby9BZy9BdkpOZncvVXpjUkYyZVZv?=
 =?utf-8?B?THRHeUdBUXVONnJCQmt3Smw2VExuTVUvUGJpbzRHUXBYYlJxRmpEZjBLZ01B?=
 =?utf-8?B?Sm1iTUtWRUZKazFRYUtncEFQU0N0TFQxODN3OXFENjlLd09uWGxwa3ZLNlE2?=
 =?utf-8?B?NGovUlZwVyt5ZXpnVWE5eWIzeThOS2NXZlJva00yaUZLcUVobXlnQ25ycEZT?=
 =?utf-8?B?bEhuNFRGTEdBbHFwL2NiUmFpc3YzdmxDS0MvampJeHF3a3RQT2doVUNidkph?=
 =?utf-8?B?eTNJVnlScXJEdmJCVWhHdVI1ak91VkFDbGtYQStOeUQ3VWJJZDBmcTNLNTJR?=
 =?utf-8?B?OUNydCtwd3BkWVNEYUMySnlHUlBUTkJLTjlQaHlXREgycndpS25TRUovQ3Rz?=
 =?utf-8?B?TUdGektEeTJjMHBtZlhVM3I3ZUJOeWdnSTVOb3V3R3Y2R08vVlprbk5YWVpq?=
 =?utf-8?B?NDJKN3pLMmNPQi8ralRjSHRtN3hzMGMzekxkTEhrRTcrTFZXd1hIbzJ1OE8v?=
 =?utf-8?B?djVsV1N5ZkxjVUdTM0h2RDlhN2hlbGRNZ3o2SzZ0UW9YblhHa1VwSVRrSWVH?=
 =?utf-8?B?TDZhREl5WEtGbElmRWQ1WndmMGo5Q2cwcE9YU3NKMCtpNDBQYjBPN0JiZHRy?=
 =?utf-8?B?enB4UkZjVjVUOG4wdWViNnVLVjVwbWcvc0dFcFczWU8yK1N0VHBmVUJNckhi?=
 =?utf-8?B?ZkVNMDMrenhqQzlEM0RiYkI2NjBBMnpEMU1NbzkxcllvbXlkc0YzcVVXOHRE?=
 =?utf-8?B?cERVK3ZlRlhTMjlMN3hLUHllaG5jREd5QTgycU5BL0VwM3RxTC9Lc3N3NTlG?=
 =?utf-8?B?aGQzM1h0WXp5RW1OSVNYRjhiYzEyVlZoQ0VqejB1eVJLSkc4dEJJNlJZd1RD?=
 =?utf-8?B?OTZyOXNTLzloa3l5SHhkNlIyMHgzRE80eGkrZGpiWTZETjdTQ091L0RnbEZU?=
 =?utf-8?B?bU1UZlhlUmRQVTdaQ1ZmWkE3bzFRQ1BWcGdadFZFNDJNbWdMNDNWVnRrdkxl?=
 =?utf-8?B?VjJPOFJnRXdjQWM1M2hxQWNseGdMVjI4TGNvOEl5YmZWbXptMFNIcVB3bUhq?=
 =?utf-8?B?aHB0dFNZY1N5eHl1RzNMT0VqblpNR2ExU2lMNlVBNGdnNVJrWjFEUDQreWQy?=
 =?utf-8?B?N0lkcWY5bHRFaHhxNjFtQk9lQ1JKWlBra2wwZDMxYXVlMXF1YnA3UnlxdmpE?=
 =?utf-8?B?dWtSZlVEL0VMQXdZR3NCM2d4cHNrVno2Y21QZXkwTTJNU0dDclYrYmhvVFRG?=
 =?utf-8?B?Mi9FeUVDZytwb1U3bkx4N2cvaGZPa2dtYnFIa1pHTzJBUnRuSDZqNUMxWEox?=
 =?utf-8?B?WWVQTXI5VTZCNCtjYnhZaEJvNC81d1gzb2ovN2owQ0ljSHRGbEdpYzVyTFRT?=
 =?utf-8?B?ODJFeHQrNVNWaFNXejZkaHBHVzFYNzBXMGdWQWVQUkdzbTIydTJDVk9nUm5J?=
 =?utf-8?B?RlM1Y3kxRnBSRSszUFRsRkN2b0ozYlFLUVd0U0V4ZDFIeVdYbUQ2dk1pQUdT?=
 =?utf-8?B?MHNCd0VZejA3ZjNhZjFyR21Fb21QWWxZOVdEQ0xIVS9OTS9hU1dpejhKSmlH?=
 =?utf-8?B?WVljUnU1NVd5ZG8wK0xXeUxHVEhZek5kMUdRY0IwamdHc2FpMVRpaWp5akV2?=
 =?utf-8?B?VlRWS0RVWmhEQ3FKcko3V083anJpVXhPSU5XNUgxc0tYZWVnM0prWXpGQ2Js?=
 =?utf-8?B?cUlQYXNpYTdjblkrRDZNZ2l4M2g3eEVNdDgzVHc1Mi9uVDhISlpFUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uOyPFWQTjSSH5ebAwkWLMH4rKqmUUK7DbkyHDCSBdIWAKp38vyxSL/LNAwuE1Wil0jkVYsZRmsSFt4wRNChQc6Ly775ZM27IKZJbMqGCSGU2ruHt+h3I+QjHC8yko7SXPfXxx5B7e+cy76iZB4mongRbztCQ5ubhouCLej/XFq7bTybGrvzg5SyGYKHdrWlO/evIRsRykhQTwTgn6FgOAzC0M203WZBgs4Db1lr560kafTKX09WAigSgkIS6ORXJRRiIGloIsv6hJEBmBrxngQSAuQWn2Avd90YcRgyn4XoWfLeUQUd1Wj1ghLQthEhwgZR76IIVxQwOo9OAyWOf4Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcecdbf-0695-4d83-26a5-08df0f351bd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 12:14:48.4401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fGPlHMNlwAQZc9BrnzMip4+2/f77f0HxFSYX/eQKGFnSaUZAYuuRaQj3i+9Qv8rkdI5VsVfRw4PvsXaxIs9h1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4793
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0
ZW1iZXIgOSwgMjAyNiA1OjAyIFBNDQo+IFRvOiBHYXJnLCBOZW1lc2EgPG5lbWVzYS5nYXJnQGlu
dGVsLmNvbT4NCj4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZHJtL2k5
MTUvcHNyOiBDbGVhciBzdGFsZSBzZWwgZmV0Y2ggZW5hYmxlIGJpdHMgb24gc2VsDQo+IGZldGNo
IGRpc2FibGUNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28g
QUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpDQo+IHRvIGNvbnNpZGVyOg0KPiAt
IFtIaWdoXSBUaGUgcGF0Y2ggaW50cm9kdWNlcyBgY2xlYXJfcHNyMl9zZWxfZmV0Y2hgIHRvIGNs
ZWFyIHN0YWxlIGhhcmR3YXJlDQo+IGJpdHMgd2hlbiBzZWxlY3RpdmUgZmV0Y2ggaXMgZGlzYWJs
ZWQsIGJ1dCBpbW1lZGlhdGVseSByZXR1cm5zIGVhcmx5LCBza2lwcGluZw0KPiB0aGUgYWRkaXRp
b24gb2YgcGxhbmVzIHRvIHRoZSBhdG9taWMgc3RhdGUuIFRoaXMgY2F1c2VzIHRoZSBmaXggdG8g
ZmFpbCBkdXJpbmcNCj4gbm9uLW1vZGVzZXQgdHJhbnNpdGlvbnMuDQo+IC0tDQo+IA0KPiBjb21t
aXQgNmQ5NWY1ODQ1MjhkYmUwNWUxY2Q5NzZkYjQ2MWE0NWM3MmZiNTMxOQ0KPiBBdXRob3I6IE5l
bWVzYSBHYXJnIDxuZW1lc2EuZ2FyZ0BpbnRlbC5jb20+DQo+IGRybS9pOTE1L3BzcjogQ2xlYXIg
c3RhbGUgc2VsIGZldGNoIGVuYWJsZSBiaXRzIG9uIHNlbCBmZXRjaCBkaXNhYmxlDQo+IA0KPiBU
aGlzIGNvbW1pdCBhdHRlbXB0cyB0byBjbGVhciBzdGFsZSBzZWxlY3RpdmUgZmV0Y2ggZW5hYmxl
IGJpdHMgYnkgdHJhY2tpbmcgdGhlDQo+IHRyYW5zaXRpb24gaW4gY2xlYXJfcHNyMl9zZWxfZmV0
Y2ggYW5kIGhhdmluZyB0aGUgcGxhbmUvY3Vyc29yIGFybSBwYXRocw0KPiB3cml0ZSAwIHRvIHRo
ZSByZWdpc3RlcnMuIEl0IHVwZGF0ZXMgaW50ZWxfcHNyMl9zZWxfZmV0Y2hfdXBkYXRlKCkgdG8g
cmVjb3JkDQo+IHdoZW4gc2VsZWN0aXZlIGZldGNoIGlzIHR1cm5lZCBvZmYuDQo+IA0KPiBDbG9z
ZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vd29ya19p
dGVtcy84NzM5DQo+IA0KPiBbIC4uLiBdDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfcHNyLmMNCj4gPiBpbmRleCBmNDkwYmViNjY2MjllLi44NzJlMjUzZGIxNzg2
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNy
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+
IFsgLi4uIF0NCj4gPiBAQCAtMjkwMSw2ICsyOTAzLDE5IEBAIGludCBpbnRlbF9wc3IyX3NlbF9m
ZXRjaF91cGRhdGUoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ID4gIAli
b29sIGZ1bGxfdXBkYXRlID0gZmFsc2UsIHN1X2FyZWFfY2hhbmdlZDsNCj4gPiAgCWludCBpLCBy
ZXQ7DQo+ID4NCj4gPiArCS8qDQo+ID4gKwkgKiBTZWxlY3RpdmUgZmV0Y2ggaXMgbm90IGFsd2F5
cyB1c2FibGUsIGZvciBpbnN0YW5jZSBpdCBpcyBkcm9wcGVkDQo+ID4gKwkgKiB3aGlsZSBwaXBl
IENSQyBpcyBhY3RpdmUuIFRoZSBwbGFuZXMga2VlcCB0aGVpciBzZWxlY3RpdmUgZmV0Y2gNCj4g
PiArCSAqIGVuYWJsZSBiaXQgc2V0IGluIGhhcmR3YXJlIG92ZXIgdGhhdCwgYW5kIGEgcGxhbmUg
ZGlzYWJsZWQgd2hpbGUNCj4gPiArCSAqIHNlbGVjdGl2ZSBmZXRjaCBpcyBvZmYgbmV2ZXIgZ2V0
cyB0aGUgYml0IGNsZWFyZWQuIE9uY2Ugc2VsZWN0aXZlDQo+ID4gKwkgKiBmZXRjaCBjb21lcyBi
YWNrIHRoZSBoYXJkd2FyZSB3b3VsZCByZXN1bWUgZmV0Y2hpbmcgZm9yIGEgcGxhbmUNCj4gdGhh
dA0KPiA+ICsJICogaXMgbm8gbG9uZ2VyIGVuYWJsZWQgYW5kIGtlZXAgaXRzIEREQiByYW5nZSBy
ZXNlcnZlZCwgc28gaGF2ZSB0aGUNCj4gPiArCSAqIHBsYW5lIHVwZGF0ZSBkcm9wIHRoZSBiaXQg
Zm9yIGV2ZXJ5IHBsYW5lIG9mIHRoZSBwaXBlIGFzIHNlbGVjdGl2ZQ0KPiA+ICsJICogZmV0Y2gg
aXMgdHVybmVkIG9mZi4NCj4gPiArCSAqLw0KPiA+ICsJY3J0Y19zdGF0ZS0+Y2xlYXJfcHNyMl9z
ZWxfZmV0Y2ggPSBvbGRfY3J0Y19zdGF0ZS0NCj4gPmVuYWJsZV9wc3IyX3NlbF9mZXRjaCAmJg0K
PiA+ICsJCSFjcnRjX3N0YXRlLT5lbmFibGVfcHNyMl9zZWxfZmV0Y2g7DQo+ID4gKw0KPiA+ICAJ
aWYgKCFjcnRjX3N0YXRlLT5lbmFibGVfcHNyMl9zZWxfZmV0Y2gpDQo+ID4gIAkJcmV0dXJuIDA7
DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IFdpbGwgdGhpcyBlYXJseSByZXR1cm4gc2tpcCBh
ZGRpbmcgdW5tb2RpZmllZCBwbGFuZXMgdG8gdGhlIGF0b21pYyBzdGF0ZQ0KPiBkdXJpbmcgbm9u
LW1vZGVzZXQgdHJhbnNpdGlvbnM/DQo+IA0KPiBEdXJpbmcgYSBub24tbW9kZXNldCBhdG9taWMg
Y29tbWl0IChsaWtlIGEgZmFzdHNldCB0cmlnZ2VyZWQgYnkgY29sb3INCj4gbWFuYWdlbWVudCBv
ciBDRENMSyB1cGRhdGVzKSB0aGF0IGRpc2FibGVzIFBTUjIgc2VsZWN0aXZlIGZldGNoLCB0aGUg
Y29yZQ0KPiBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19tb2Rlc2V0KCkgZnVuY3Rpb24gZG9lcyBu
b3QgYXV0b21hdGljYWxseSBhZGQNCj4gYWxsIHBsYW5lcyB0byB0aGUgc3RhdGUuDQo+IA0KPiBX
aGVuIGludGVsX3BzcjJfc2VsX2ZldGNoX3VwZGF0ZSgpIGRldGVjdHMgdGhpcyB0cmFuc2l0aW9u
LCBpdCBzZXRzDQo+IGNsZWFyX3BzcjJfc2VsX2ZldGNoIHRvIHRydWUsIGJ1dCB0aGVuIGltbWVk
aWF0ZWx5IHJldHVybnMgMCBoZXJlIGJlY2F1c2UNCj4gZW5hYmxlX3BzcjJfc2VsX2ZldGNoIGlz
IGZhbHNlLg0KPiANCj4gQmVjYXVzZSB0aGUgZnVuY3Rpb24gcmV0dXJucyBiZWZvcmUgcmVhY2hp
bmcgdGhlDQo+IGRybV9hdG9taWNfYWRkX2FmZmVjdGVkX3BsYW5lcygpIGNhbGwgZnVydGhlciBk
b3duLCB1bm1vZGlmaWVkIHBsYW5lcyBhcmUNCj4gbm90IGFkZGVkIHRvIHRoZSBhdG9taWMgc3Rh
dGUuIENvdWxkIHRoaXMgY2F1c2UgdGhlaXIgcGxhbmUgYXJtIGNhbGxiYWNrcyB0bw0KPiBiZSBz
a2lwcGVkIGVudGlyZWx5LCBsZWF2aW5nIHRoZSBoYXJkd2FyZSBiaXRzIGFjdGl2ZSBhbmQgcG90
ZW50aWFsbHkgY2F1c2luZw0KPiB0aGUgZGlzcGxheSBjb3JydXB0aW9uIHRoaXMgcGF0Y2ggd2Fz
IGludGVuZGVkIHRvIGZpeD8NCj4gDQplbmFibGVfcHNyMl9zZWxfZmV0Y2ggaXMgcmVjb21wdXRl
ZCBmcm9tIGludGVsX21vZGVzZXRfcGlwZV9jb25maWcoKSwNCndoaWNoIGludGVsX2F0b21pY19j
aGVja19jb25maWcoKSBjYWxscyBqdXN0IGZvciBjcnRjcyB0aGF0IG5lZWQgbW9kZXNldC4NClNv
IG9sZF9jcnRjX3N0YXRlLT5lbmFibGVfcHNyMl9zZWxfZmV0Y2ggJiYgIWVuYWJsZV9wc3IyX3Nl
bF9mZXRjaA0KaW1wbGllcyB0aGUgY3J0YyBuZWVkZWQgYSBtb2Rlc2V0IHdoZW4gZHJtX2F0b21p
Y19oZWxwZXJfY2hlY2tfbW9kZXNldCgpIHJhbiwNCmFuZCB0aGF0IGhhcyBhbHJlYWR5IGNhbGxl
ZCBkcm1fYXRvbWljX2FkZF9hZmZlY3RlZF9wbGFuZXMoKSBmb3IgaXQuIA0KVGhlIGZhc3RzZXQg
ZG93bmdyYWRlIGluIGludGVsX2NydGNfY2hlY2tfZmFzdHNldCgpIGhhcHBlbnMgYWZ0ZXIgdGhh
dCwgc28gdGhlIHBsYW5lcw0Kc3RheSBpbiB0aGUgc3RhdGUuICANCg0KQ29sb3VyIG1hbmFnZW1l
bnQgZG9lcyBub3QgcmVjb21wdXRlIHRoZSBQU1IgY29uZmlnLCBhbmQgdGhlIENEQ0xLIHBhdGgN
CmdvZXMgdGhyb3VnaCBpbnRlbF9tb2Rlc2V0X3BpcGUoKSwgd2hpY2ggY2FsbHMgaW50ZWxfcGxh
bmVfYWRkX2FmZmVjdGVkKCkgaXRzZWxmLg0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpOZW1lc2EN
Cg0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0
Y2hzZXQvMjAyNjA5MDkxMTAzMzIuMzUyODAyOS0NCj4gMS1uZW1lc2EuZ2FyZ0BpbnRlbC5jb20/
cGFydD0yDQo=
