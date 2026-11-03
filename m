Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793688339;
	b=Gmbnrc56jY7/1w/1DhFlvoNf79EuQjznWjuedOcpyAJRiMy423sj2MK2wPRspUp6Dbza
	 Hzq56SMQIoM4Qz1Xoa4SRMxO+5pqHedCygSF9bOo3cR0RZ9kqMj7EDWNhjJ5B2bwYUDZm
	 wI1qA660qTY8F2F5TjkcBv08nDThI5pyHKbCW6YDs50ee/EFQadFgEghEjM76QA8Edskt
	 IeI+Nac1mzoz1jx4tGW0QOV+m9jYojfIYMcX3Q6/SMPzvQzN2LCWAHo8CJtAwMLpayZ/Y
	 XjajpsOUlLBO5c0TMXDI9FTLXuyEzZqNYKPGZmAR3tCFMZGvXg0f9sXwaezskKOiWSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688339;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=fugJnp94FcV5EeuDbzRtGt+9kiSzX/oDuyqqNq42mYA=;
	b=PoVbd3pYtWj2nylMnAz7kTvq8QD2uza1kIprtu+oqKK3sIyDmLmLrYK+lc/uyZHbyeM1
	 gnEPOiQpfzfCkyt5bwxVHYh/QlMRb3xW41FTtfNc5KEsOUqNu7x97QcdU4uP1MOcirg4Z
	 yY1vEeQeNbwMsTHF5Dc80BGG7QRbbb5I/85PV5ExUhxfBZJiotbOCvFf8aGWHa5T61PXo
	 v8R0+dn+xSnqYSMXpB9ppRgtJCzx1jqsFtgh8u77Ax8aTXpMjnMydhsW7YBd7pyoKesK1
	 k/aRYFoKsRq41YdJVmWbplkAVGJumIfkCy1F+9gqedu0Vu8Jbc/stgam8Vr6g1oP2lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="XAg4/4FN";
	arc=fail smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55806606A329
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 06:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55806606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XAg4/4FN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793688338; x=1825224338;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=y+/DdCaYvZAchPiPiGhvCl4aZCB2KCqurNj/rwxQNjE=;
  b=XAg4/4FN756aI5QylOjkoT63PshOM7LAJ68Dio3g/jFKAgwJWn7vbiio
   Ba4E0zgWOScQ7vkSZeHWEiDWQJVbg87Tjsg/CRnOWNQeF5/UHhXOck41j
   6uHhlaaEa8/ydpahG/zRnZH8XI8zCT96mctDyZv2tpt9vmHUpkjPL6EOC
   8e+A+haJbvI9FYnIamCsWeQ13h1qW6qvksR3Jj+iUZa4uVPEDzOQd3LEZ
   6FrzZQN1jjbFcvv0F84LLxLgQZmgsGKj/2ojGEOqT9YBMzE65V5vupmrw
   Q9vtf/fFOnNzr/wBXUggfGsb5AimvUfkZMjELG8aWoZmaoRBVWgB0HFsK
   g==;
X-CSE-ConnectionGUID: NMlV2qqHQNWGvcsCoyyHFg==
X-CSE-MsgGUID: cTRJNTR3TgC0qJZJae7ECw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2403874"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2403874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 22:45:35 -0800
X-CSE-ConnectionGUID: ePkTC1+fQdm+YgA7M5wxZw==
X-CSE-MsgGUID: /4i5UH97Q62tNyE19sPN8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6176561"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 22:45:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 22:45:34 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 22:45:34 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.15)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 22:45:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvOSNmx7swdhKRs2NH4TItadGp2Jv9g65x/zmtaVx2kZjWMBvLiy/bTvfxK+kW84fKhP4+bC3h2SiKpTY64JC5dYoRceMdLHUeZf/DMLr6UpQvwsEMz5TtskUmrrOIsJ3BS6knbhqX6yE9VV4OHqmai5gNt215mpd3L+0tfscqBCjLAutUXgf2mWM8AqMlh00urutm1+FqRy7zPLHt6GfNv+NnjthhigZqvnFayc9Jx7rpE6qtoDoBsAmFcjk9uRL5uWzDmBpF3binl8DDjSZW8prPGwABYYHe398iGC9Tz7e/yf4OvpfgdMhB3Zbm7XDyBdb0TN63RJ9uPANP8a9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fugJnp94FcV5EeuDbzRtGt+9kiSzX/oDuyqqNq42mYA=;
 b=IsTcd296OPKFcDkHyfDW0OpvEMkoiB48pW8Ud9ngxh28Bpdgxj4VITWyYR24n4f1mjXKu1XVTZvBL2vnnEY2ZQSBD+QLgRQ4f/fxgyTn2NBNrLZE34xTbM+GRGn/6hfRIRwGHrDdHal/JvrXFOpkFGCpO+sMLi/eBbawolnBNMlWpabWqLhQJs4j1G/mZjl/ngG0A+hSl08SUsA5o5hq/XCvB8EmF9dpF4rs4w365eJrmdpQcE+/MTnnSWqKSwuVLkiIw8GfkH+gaH56v8HFQK0SkRNgiMZExa+E/n5J0TvC62089qVoHpRSDnaBFXyhrTngdK7+rs8hMITs/bXLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB7759.namprd11.prod.outlook.com (2603:10b6:8:10e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.11; Tue, 3 Nov 2026 06:45:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 06:45:26 +0000
Message-ID: <07797380-0ef6-49de-b192-414c68c691c7@intel.com>
Date: Tue, 3 Nov 2026 12:15:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/xe: Add support for wa_14028434957
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
 <20261103060929.1586783-15-riana.tauro@intel.com>
 <sashiko-outbox-194641@kernel.org>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <sashiko-outbox-194641@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0210.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 955905e0-c418-4201-bc88-08df39760aef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|261102123227099003|261026121527099003|260925022911599003|260925021311599003|260925021911599003|4143699003|5023799004|261009223327099003|261009223027099003|261028144727099003|261009221727099003|261009221227099003|261009220027099003|261021135927099003|261022075727099003|261022113327099003|261026140227099003|261021121427099003|261022105027099003|11063799006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: h5MuSo27YCPpPCS92Yo42N6vbn5mIqnj9Oreaab/CG7N8VP8aFJCtgmSBvqLAMu7WYtNN9vJ20GEpbqV6/m17RB7B+LPt1WQRDrgua8VlblP1a3WoDmji4BAmZM91nNBCK6EZrXfaexzhFpsZ6t7SYQsDAZzB8x/GWfjtbDbB//hi84rFvzYfVxMRtR9sWTPUJIRUv+Ppp24S+tProG6jyojKClMTyxHjkx7KFbcyh0sH7pDPLmgyC+BmjlSZjfptShrI8Yr1EFuaRL8curEYz08GcdpEvg6uIRHYSt11QawMY5QfCjVVOnn8xlbKwXTjAdn5/jeMNTi6FgTbgIpKSae7mRiNmfrc8gNUN0r2teP+//X2u2TjGnVnu1nuUit1DkktJTmYveJsOIoFZTcJ1jyKR8xuHqJsXLBkHj7BiAPm7l7YLPCt6fzWTObllCo7EpYwFyZyhJzH97JUBb+G5dJOaV/wcJVvZ9xqCmu1zoD0Yp1NwWHOI4f1TwEQzCZMdtDoZMpHKdD52KQXQG84qu3wU6raypnJkuZhBy1c0dVuWBMbV38tYTW3252bA2Cx56Qa5BbzBUnak+z7DSOf41aNEGV48RuBuLI87Cnb2kI2fZgf7XJ9EEF1wSsdsx7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7958.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(261102123227099003)(261026121527099003)(260925022911599003)(260925021311599003)(260925021911599003)(4143699003)(5023799004)(261009223327099003)(261009223027099003)(261028144727099003)(261009221727099003)(261009221227099003)(261009220027099003)(261021135927099003)(261022075727099003)(261022113327099003)(261026140227099003)(261021121427099003)(261022105027099003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDVxSUVCN1VtN01wSGMyWnhSRWY5MjdhRHd5aGxFODlwNGU1ZGR5R0U3SWxY?=
 =?utf-8?B?SU1ZNmxpcjZOYnhqMStTUTZ1dEtsMWNvNlNpNjd6SWNFL0JRdTg5SFZqaWtv?=
 =?utf-8?B?cWt1SGlUMTdxNW4xTnl1TDlEaTg5aTZCR1hXYUh3bkJwMTNKcTMrR252Vnlj?=
 =?utf-8?B?MmNiUkRnU2tlczR0RnRBQXNKMngveGpWTU5IT3h6Z3EzcUEwL3ppc0d1bDBF?=
 =?utf-8?B?M1U1VzVlTjVRZ0FDZnpQRWl2SElCemtYZjYvOXVNMDVheU84N3F2Smo0MWc0?=
 =?utf-8?B?K3hZbjNOZ05Db1FjbTRxNXpTSUZBSWdaM1ZtaG8vNURtMnpubWNNWGYrVy85?=
 =?utf-8?B?WDdPclJTSy8xNXZzMHhkMGtkbEJyUXBMK0NqTjRMTmpJTmtLNFBCT2M0ZlE2?=
 =?utf-8?B?eVdmR0ZpWmdYclpJNUdha08rMGdYSDlUSExYU0diTU9JaVJLSXZCaEF0WGYv?=
 =?utf-8?B?T3hFbzlJZUR1MVpVRW9tL25sa1h4bXJoc2xhZSsycHhKNUVjdW9zaENFUWJI?=
 =?utf-8?B?RXB0MXRRRjU3dFZSZTdzOG44aWplUkFGa3A0VEkrZWQyY2JQY20vL0NaMWRt?=
 =?utf-8?B?azFqTnBPWGphZGxKV1BacExzWEtGZkhCTjVTbE8vSk45Yy9BbXdvZkdyaGZT?=
 =?utf-8?B?UGtLdHA3SFdOK0RnTVVibkpYdGlDUDJ3Q2syNFhzREsxM1FIRE9iTVhRcnNO?=
 =?utf-8?B?ZE11ckR5M2JKaFFQSmoycG5xS2JQRWlwaStLcStSYS8wUzVKbW5iUjhWOHcz?=
 =?utf-8?B?YXNNKzVlSXJBT3I0QUxLbUJHblFCL1ZRUzVucUxGN1JaWkswYktHVkxTV2hR?=
 =?utf-8?B?VnR2OURyUDV3VmdlZGRtSFVKWUMvRWZreWI3MjRvcjdPU1pjaXF1MDVveUZq?=
 =?utf-8?B?aDZnQ1cvRUg0YVFBaHZkNlNxSkZ5ZEJBNW5NaFo0S3Y3cDRKeCszejZiUEV3?=
 =?utf-8?B?ekRwTG5tWStPSHcvb2h2b2VOZWxWNEwyR2paUHdKKzZPOG9sSGlmM3dGa3pC?=
 =?utf-8?B?WUdSL3RkWllLYlpiSFJ0b1U4eUI3d1dWcWtlb1JDbzgrZzh6dkFmeGZzZUpY?=
 =?utf-8?B?ZitheW5NbTU1Y2g0bk41Smo3cDFQYlFYckVSS3B2M21SUDJtMmxuZjlpRzQ0?=
 =?utf-8?B?c2Nvemt0d3Y3T2dlMTgraUI4Y0lQTXhtZDhaU1hLdVVKTHR6VHZBR2ZWOUFM?=
 =?utf-8?B?eHJWcUd6TEpJdjBScW9OSEFpMU04MEdibWI5U3QzM1lIdEU5NndlNHpPRDRn?=
 =?utf-8?B?TnRCaFhVWHFJWTlmSjN1emt1UUJ2WkdYSUpqMWp0N29YUDZaUVhPeDJvdlB6?=
 =?utf-8?B?NWMzb1lTL1d1V0pIRDZHY3pGTW5NY0Vob0RFTlNZYlVLRXpsU0dVTms3QWgy?=
 =?utf-8?B?YkNvM1JmWnkwTFA3Mkd1TEc2dklGaDlYYUJQb285RVp6ZWloUmdkSUhXMXdn?=
 =?utf-8?B?bTlubHJtaWtSbys0OFBJUFIwMmlhSGFyVGJ2UEtVU2tTN083dG1EbVV5WnV2?=
 =?utf-8?B?STlRTlE0SncvVGV4Z0tuYjFWaUp5MjFnU0dhTXlmZzJsVEJJM2JuSTZJbmUx?=
 =?utf-8?B?NDhYM1dkY1M5V0UwNFE2YkJobTZzSG0wRFJGNkxtWnRYeFZiUE9HcElERFhQ?=
 =?utf-8?B?cXZwaGUrZUZ6ZFBSeUEvYVVXSjdjaVZpNS9PSnlIR0wwY09MYVBnK0FTQll1?=
 =?utf-8?B?MjRMaFBVa0g2U3MzdndXemxNY2ZNTWl6SVc4V09ZQmVJWndOVk91TVd0UkJQ?=
 =?utf-8?B?VXpvaG5lb2F2KzBVemo2MmZ2UTRiVjIwbVJxY3dsRGJFWTh2bFRWL25iOUhq?=
 =?utf-8?B?WUxXSFR4VTd1UjdYZldDU0trbjVndk4vMVh0NnhxRFo3cUJ5dUdJallxL1Rn?=
 =?utf-8?B?bzk1RUZUQlNRT2Q3MmpQblZpVC9vbDN5TDhJT0pCcTduYThjOVFGUVJITjRR?=
 =?utf-8?B?R2hkZVZtTzh6dFE3cUJ6WFF3WnA4TFo1d0lybE03Yko3aVhNRDE1R2N3Y0Zs?=
 =?utf-8?B?Vmw5MHBDcFRZSG54bHBtZnNVUVRzVCtXcGFSMHRZU2phejVxT3U2MzcrRFpF?=
 =?utf-8?B?dkF1QmVNcGYvcTBDSmtWS0Y2K1VLY01hN0tnRGZ3dHlvblluQWpiRWtQSFRI?=
 =?utf-8?B?dWtldkdUMkpkSU9PM3RTSXo1eUV3QnRYa1p3MG5kN01aVVg4enBWMVVZUmJ1?=
 =?utf-8?B?UEFaQ1lOR21LaEU1Y21ENFhmeUdNNHNtZHZVNFhQNEZlaGZodHNscHU0MFBT?=
 =?utf-8?B?WS9VbnpwTmNrbTE2eU9UalpONGx5RHFsb0FYWDhISGNhL2k4Ukpxc20yQ0JH?=
 =?utf-8?B?Y2tDcjMzZE0zWVp0Q0h6SC9Td3JRNXE3V1pObi90aHBqbWpQbXJEQT09?=
X-Exchange-RoutingPolicyChecked: fVHC6+Vg4Cop2eqCbez0cXBlI1XNG3MKgSJfl4j+CxQQm515gCCeiRINyqOT7snwSeO1yem9G07owgpcTbUORFXq4ed/g3R4GuxlPVLwgP/qPgzCPvEDSBSw8L66liI+/e4p8ps5Ic+WJYekAtkU8w2oHJyzbtTQRA74rSC8nsB63qB7qhKXHuRM78taosfxPkHYyiC05xp7RCR5QZNNWgMjTN93rTYLvVQ/jgIBlwtEVVVbQSRq58Uk8OGTU+vU7nfREz+18SgD6xGi5T9Fhkpl3usaLwCw0zKbXYLrydnuMzzJYnonOvn174AyARILyJ40hcfpJsHKEG78HJiWZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 955905e0-c418-4201-bc88-08df39760aef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:45:26.5323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDMxcY/mGl7h5zieDMMCGwAopJWpyHnlvXOeGKWTXWFt9nBtqk0CUUenH9jm1gWlfTkBimZAQ5z9LALTSISDMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7759
X-OriginatorOrg: intel.com


On 03-11-2026 12:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] drm/xe: ignored recovery action in hw_error_work() and premature DB_ECC wedge
> - [High] drm/xe: race between hw_error_work() and xe_pci_error_detected() on AER
> - [High] drm/xe: use-after-free of hw_error_work on xe_device_probe() failure
> - [Medium] drm/xe: hw_error_work not disabled during non-internal AER recovery and reset
> --
>
> commit 63f8e0a3987b6eb426b195e4d8f9b906ad24b22d
> Author: Riana Tauro <riana.tauro@intel.com>
>
> drm/xe: Add support for wa_14028434957
>
> This commit adds support for wa_14028434957 on Crescent Island to process
> non-fatal hardware errors routed via direct IRQ and uncorrectable internal
> errors reported via PCIe AER.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index aaa2437d40bfe..8f2fb641f6ce2 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> [ ... ]
>> @@ -433,12 +456,12 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>   		return;
>>   
>>   	/*
>> -	 * Hardware errors are reported through System Controller on the platforms that
>> -	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
>> -	 * here for those platforms.
>> +	 * Non-fatal errors are routed as a direct IRQ on platforms that support
>> +	 * system controller.
>>   	 */
>>   	if (xe->info.has_sysctrl) {
>> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
>> +		drm_err_ratelimited(&xe->drm, HW_ERR "Non-fatal %s reported\n", severity_str);
>> +		schedule_work(&tile->hw_error_work);
>>   		return;
>>   	}
> [Severity: High]
> Can scheduling tile->hw_error_work here cause a use-after-free of struct
> xe_device if xe_device_probe() fails later during initialization?
>
> During probe, __xe_pci_probe() -> xe_device_probe() -> xe_irq_install() ->
> xe_hw_error_init() initializes tile->hw_error_work and calls
> process_hw_errors(), which invokes xe_hw_error_irq_handler() ->
> hw_error_source_handler(). Hardware error interrupts can also fire once
> xe_irq_postinstall() enables interrupts.
>
> If a subsequent step in xe_device_probe() fails (such as xe_gt_init(),
> xe_vram_memtest(), xe_heci_gsc_init(), or drm_dev_register()),
> __xe_pci_probe() returns the error directly without calling
> xe_device_remove():
>
> drivers/gpu/drm/xe/xe_pci.c:__xe_pci_probe() {
> 	...
> 	err = xe_device_probe(xe);
> 	if (err)
> 		return err;
> 	...
> }
>
> Because xe_hw_error_work_disable() is only called in xe_device_remove() and is
> not registered via devm_add_action_or_reset() in xe_hw_error_init(), devres
> teardown will run ras_fini(), unmap MMIO, and free struct xe_device while
> tile->hw_error_work is still queued or running hw_error_work() ->
> xe_ras_process_errors(xe).
>
> Should xe_hw_error_init() register a devm action to disable hw_error_work on
> probe failure?

Same as patch 2.

>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> index 4ade392b47bef..c27fd22e28ac7 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> [ ... ]
>> @@ -90,8 +94,14 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>>   	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
>>   		return PCI_ERS_RESULT_DISCONNECT;
>>   
>> -	if (is_aer_internal_error(pdev))
>> +	/*
>> +	 * If non-fatal error processing is in progress when uncorrectable internal error occurs,
>> +	 * flush and disable the worker to prevent further processing, as a reset is imminent.
>> +	 */
>> +	if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
>>   		xe_ras_set_aer_internal_error(xe);
>> +		xe_hw_error_work_disable(xe);
>> +	}
> [Severity: High]
> What happens if hw_error_work() is already past the
> xe_ras_is_aer_internal_error(xe) check when xe_pci_error_detected() runs?
>
> In drivers/gpu/drm/xe/xe_hw_error.c:hw_error_work():
>
> 	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
> 		if (xe_ras_is_aer_internal_error(xe))
> 			return;
>
> 		xe_ras_process_errors(xe);
> 		return;
> 	}
>
> If hw_error_work() passes xe_ras_is_aer_internal_error(xe) just before
> xe_pci_error_detected() sets aer_internal_error and calls
> xe_hw_error_work_disable(xe), disable_work_sync() waits for the in-progress
> hw_error_work() to finish running xe_ras_process_errors(xe).
>
> During that call, hw_error_work() drains all pending error records from the
> shared System Controller firmware queue (including fatal CSC firmware errors
> that enable Runtime Survivability Mode and wedge with
> DRM_WEDGE_RECOVERY_VENDOR, or Punit errors that wedge with
> DRM_WEDGE_RECOVERY_COLD_RESET) and discards the recovery action returned by
> xe_ras_process_errors(xe).

Missed this. Yeah this should be above the wedged check. Will fix this 
new rev.

>
> When xe_hw_error_work_disable(xe) returns in xe_pci_error_detected(),
> xe_wedged(xe) is not re-checked, so xe_pci_error_detected() returns
> PCI_ERS_RESULT_CAN_RECOVER. Then xe_pci_error_mmio_enabled() calls
> xe_ras_process_errors(xe) a second time on the now-empty firmware queue, gets
>   the default XE_RAS_RECOVERY_ACTION_RESET (instead of
> XE_RAS_RECOVERY_ACTION_DISCONNECT), and triggers a Secondary Bus Reset and
> re-probe that tears down Runtime Survivability Mode sysfs and clears
> xe->wedged.flag in xe_pci_error_resume().
>
> Conversely, if hw_error_work() wedges the device on a double-bit ECC error via
> xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET) just before
> xe_pci_error_detected() checks xe_wedged(xe), xe_pci_error_detected() returns
> PCI_ERS_RESULT_DISCONNECT without flushing hw_error_work() or requesting the
> bus reset.
>
> [Severity: Medium]
> As reported by Sashiko on v2 [1], can tile->hw_error_work also race with PCIe
> AER recovery and device reset when is_aer_internal_error(pdev) is false?

All internal errors require a reset.  For frozen errors, device will be 
wedged

>
> In xe_pci_error_detected(), xe_hw_error_work_disable(xe) is only called when
> XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev) is true.
>
> If a non-fatal PCIe AER error occurs without PCI_ERR_UNC_INTN set on the
> Upstream Switch Port (state == pci_channel_io_normal),
> xe_pci_error_mmio_enabled() runs xe_ras_process_errors(xe) while
> tile->hw_error_work may still be running xe_ras_process_errors(xe)
> concurrently.
>
> Similarly, when prepare_device_for_reset() runs (either for
> pci_channel_io_frozen or when ras_action_to_pci_result() requests a reset), it
> flushes gt->wedge.worker and calls pci_disable_device(pdev) without calling
> xe_hw_error_work_disable(xe):
>
> drivers/gpu/drm/xe/xe_pci_error.c:prepare_device_for_reset() {
> 	...
> 	for_each_gt(gt, xe, id) {
> 		xe_gt_wedge_declare(gt);
> 		flush_work(&gt->wedge.worker);
> 	}
>
> 	pci_disable_device(pdev);
> }
>
> If hw_error_work() already passed its initial xe_wedged(xe) check before
> prepare_device_for_reset() set xe->wedged.flag, could it continue issuing
> System Controller MMIO mailbox commands and page offlining while the PCI
> device is disabled and undergoing Secondary Bus Reset?
>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 58a0b5fa676d3..1809c3c893dee 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
> [ ... ]
>> @@ -671,8 +674,15 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>   			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>>   			    "Double-bit ECC error detected at sw address 0x%llx\n",
>>   			    info->sw_address);
>> -		if (ret)
>> +		/*
>> +		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
>> +		 * Wedge the device with a bus reset for errors that require SBR to recover.
>> +		 * TODO: Trigger SBR using pci_reset_bus
>> +		 */
>> +		if (ret) {
>> +			xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
>>   			return XE_RAS_RECOVERY_ACTION_RESET;
>> +		}
>>   		break;
> [Severity: High]
> As reported by Andi Shyti on v2 [2], hw_error_work() ignores the recovery
> action returned by xe_ras_process_errors(xe), while handle_device_memory_errors()
> wedges the device directly for XE_RAS_MEMORY_DB_ECC. Does placing
> xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET) inside
> handle_device_memory_errors() instead of handling the returned recovery action
> in hw_error_work() cause regressions across the callers of
> xe_ras_process_errors(xe)?

Intentional change.

Thanks
Riana


>
> First, in drivers/gpu/drm/xe/xe_hw_error.c:hw_error_work():
>
> 	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
> 		if (xe_ras_is_aer_internal_error(xe))
> 			return;
>
> 		xe_ras_process_errors(xe);
> 		return;
> 	}
>
> Because the return value of xe_ras_process_errors(xe) is ignored here, any
> other error path in xe_ras_process_errors(xe) that returns
> XE_RAS_RECOVERY_ACTION_RESET (such as sysctrl mailbox failures or response
> flooding jumping to err:, unknown memory error categories hitting default: in
> handle_device_memory_errors(), GLOBAL_UNCORR_ERROR in
> handle_core_compute_errors(), non-CSC/non-Punit SoC internal errors in
> handle_soc_internal_errors(), or unknown RAS components) neither wedges nor
> resets the device on the direct IRQ path.
>
> Second, xe_ras_process_errors() loops over all errors in response.arr[] to
> compute the highest severity action:
>
> 	/* Process and log all errors and then trigger highest recovery action */
> 	if (action > final_action)
> 		final_action = action;
>
> Because xe_wedge_declare() latches xe->wedged.flag on the first call, calling
> xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET) immediately on a
> XE_RAS_MEMORY_DB_ECC error prevents a subsequent higher-severity
> XE_RAS_RECOVERY_ACTION_DISCONNECT error in the same batch (such as a Punit
> error wedging with DRM_WEDGE_RECOVERY_COLD_RESET in punit_error_handler(), or
> a CSC firmware error wedging with DRM_WEDGE_RECOVERY_VENDOR in
> xe_survivability_mode_runtime_enable()) from recording its recovery method and
> sending its uevent.
>
> Third, xe_ras_init() calls xe_ras_process_errors(xe) during xe_device_probe()
> (with aer_internal_error == false) before xe_gt_init() and before
> drm_dev_register(). Even if page offlining is skipped when aer_internal_error
> is true, a boot-time or warm-reset-retained XE_RAS_MEMORY_DB_ECC error during
> xe_ras_init() that fails handle_page_offline() will call
> xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET) before drm_dev_register(),
> setting xe->wedged.flag = 1 and causing GuC CT communication in xe_gt_init()
> to fail with -ENOTRECOVERABLE.
>
> Finally, if handle_device_memory_errors() is reached from
> xe_pci_error_mmio_enabled() during PCIe AER recovery,
> ras_action_to_pci_result() -> prepare_device_for_reset() intentionally sets
> xe->wedged.flag without sending a wedged uevent or setting
> xe->needs_flr_on_fini because the PCIe AER core performs the slot reset.
> Calling xe_wedge_declare() inside handle_device_memory_errors() sends an
> unintended WEDGED=bus-reset uevent and sets xe->needs_flr_on_fini = true.
>
> Should handle_device_memory_errors() simply return
> XE_RAS_RECOVERY_ACTION_RESET and let hw_error_work() check the final_action
> returned by xe_ras_process_errors(xe) and call
> xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET) when final_action ==
> XE_RAS_RECOVERY_ACTION_RESET?
>
> [1] https://lore.kernel.org/r/20261026060459.771448-15-riana.tauro@intel.com
> [2] https://lore.kernel.org/r/auIedl6plynJE3ML@zenone.zhora.eu
>
