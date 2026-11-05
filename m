Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793915516;
	b=TGG2Es/SGiZMHSMTXjXJvzQlKAu1cz48hYXnD2dXcYELCLQTBfbPwHgrFDy4qcdGl8nd
	 iRXqNEgHEUNNoRx8Cr6We9N6QYUGYfxlWzYPdyIE4bCPRhWipLvV4qZFc/ZAemhJdJVDN
	 133q5EDL9lla8HGa4odpHqnMS2o6W1JWWgrVIES6MDHtx2oQTOzKJhYzcUJ2eR18xQAHi
	 W45WTsx6PljbWVfs2e86Ak93DDOFXyxp9tnnE4ulPbY0yWLBIpOmEDdVE12CVfVsa6ZSl
	 met6x/7Aj/JGe+cCHqMNabmFmBsR3e/nt5rDWt+ZMq0npmPl1RLbsppLWU0mu7sXKcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915516;
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
	bh=r37KMpAkzBRoY5meMEVty2O+qKa6SaMFlAbBPVHgKQc=;
	b=dkRac2yfg+E04jlo9AJnH1Yc6QfcmXFRmruaekAPsAO1ltyQMn+jD1O5VUwwU4y6dIxH
	 WHGw9hWoYHcHTqmbMP0TF5QTafaHh0jxB0Zf12gVmLa1f7YNCOcKs7l6rqgObl5WZsy1c
	 VAHZgLmv+Lp627ilmdfk9orzzi5PsvcFbsy/19byZUWtZeOS1MQsW96TfU8kSXJyaTmHE
	 8KegJvmXcV6UjM2pWNtsnHu96+bkGGLv0yftmaCbwTPl0/zvc7At0CLDB/Jq5RF0vFRdQ
	 KoIS68Xa1bOBGrsXPmg53AV5D9gZiHBqYJ4/j9AUjO64UAlCTteu9F5N8wL9B0yX4qA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UBcS6Qg2;
	arc=fail smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2557C606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 21:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2557C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UBcS6Qg2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793915514; x=1825451514;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xNDeYKULL/6QDjxC8VfpOy1s31Bj47naGBtxyNzdrmI=;
  b=UBcS6Qg2ioSyDUzZBwYXTKlnb8uVUbNxVnGmwxIsN0aNJeT+H8OTNTn4
   I0l4cZtp+bYQ95LWCYqHyE/YTaZe6JvAA4+r56TGVtt6W1uU7YTf22kUB
   W4x8DGaPniRsSoG40Or0GCFKutABvgxI1XRz1AxX93I0qjG1ZyRivPJPE
   CHO8dn3E71mkjL/F7KAp95j8dRuX+ofscV11RYlHyKGv4Z+j+QnAceICJ
   OOcahwwjkyDZ4JorAbTUJmaMs9sTbDnXMV4OXC22D40pkJ8Gtj4wT5Rfx
   W3C1MGg0Cy0bJ/ZfPD32LSQZDUyM1iJaIwQLyFk2aQGOlxXZ0zcKd6iQv
   A==;
X-CSE-ConnectionGUID: lWPr8dFiRne6pX1uHvxyfw==
X-CSE-MsgGUID: T4u0jZd/T8CMCmcwPPe0sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2596774"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2596774"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:51:44 -0800
X-CSE-ConnectionGUID: Ynun4XmvQ6mvon9U502tJg==
X-CSE-MsgGUID: cTRztoq2RDClL0vGYNqvyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7166547"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:51:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 13:51:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 13:51:42 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 13:51:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpIY8EKSNC7cxl8jdA0sLw8shJX8YlTZ7pRpiH6U6vy/MSf1OXfU5R3VW/cc7JCl2kyU13Eg/i7KqLaeAfK5wXVDV0y1WNiAubzB07+vryXJX1lDSU2wyYVnkYPqDjpElA9c916b5PWfsHvWPf+4xGH3IICEoSdIuH586b7ttC5iftI+Tv33Ry6xxAFUtLR4djz+8zALdc5riEzbrgX/x2PnSXGbzgGeGueGq+3eJeMBt9IQb8ncS+6t+VFqdwPl4FrzR8HObt7/7gcSbE8zVfnneHStfRlKGMzfrQHhQmUabvN4BMyMDhc8gtpgnUx2Ibe3Ij52jDY/iDJKt+JQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r37KMpAkzBRoY5meMEVty2O+qKa6SaMFlAbBPVHgKQc=;
 b=pU5JsRmAsYH7LafTmvpwkv7HzIMHIgVh0Y2j0onwuNHV1W6WFC0uo/TKnCa1LpVkm6TZcRsGa8Ef2d/izzmm48QogUCCY3hde7qS+jKXOtXi6cZHunSmrzgrs3xanrmDy6DV+RAw6esU/2pU1PJQf7AViU1UZPNpN23o1NspaHICtjNbJqGxbgwJGlbDAx6Q2oH7+opiyoQ9m0SH0xQfX8/ayczTJ2DnAFaySMvNX9NR1aNrn7bKsRPsh+WlGOgWcg6pjvdyNwR+ML3X8y4BrsD95Ad/50Sj6hysHfvLMnJemdaoAKRh3URDbRe21KF1Uu3y62Fw5opHOi/FVPKNCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8) by IA4PR11MB9280.namprd11.prod.outlook.com
 (2603:10b6:208:56f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 21:51:41 +0000
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f]) by LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 21:51:40 +0000
Message-ID: <cdb4d163-897b-4f5f-a62c-488380de699a@intel.com>
Date: Thu, 5 Nov 2026 13:51:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/wedge: preserve pending TLB invalidations
 during inspection
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261102210242.635207-1-daniel.charles@intel.com>
 <20261102210242.635207-3-daniel.charles@intel.com>
 <sashiko-outbox-194208@kernel.org>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <sashiko-outbox-194208@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0233.namprd04.prod.outlook.com
 (2603:10b6:303:87::28) To LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8)
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
X-MS-TrafficTypeDiagnostic: LV2PR11MB183078:EE_|IA4PR11MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 196f7d92-56d2-4c04-3252-08df3b86f95c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|22082099003|18002099003|261028144727099003|11063799006|4143699003|56012099006|261026121527099003|261026140227099003|261022075727099003|261102130727099003|261009223027099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: L53ZBJAEWJUIGv+cJKrpgFk1BEgzDSPvpLq9Vf4wMC+EcjTvuPZZX0xRSMxVCuOl7pNVsg5DkTYtX1aiLrd54x4S0b6hZ5QXCXjR27eEU4OguuAX9vBHmXare6fd8p9NYr8A8DdR+I3l7D1aC+Q7KHsl71K+cYJTCInpjbXtD77fCINgBAnPK7KBEdhBSC9RyIPgh3WzY/4BCyeSPx6Bbxe+B3vCSYtpMrwziyWoWAjBxG1+XvsaD+CO3/CYxVlGqcrb66gi0kuWjz0L/YmZoCg1EybxO2r48KvkY76SMKhH3V6teSITa5/WrOijYTpxa4qt6uioPSaXca7pOjQH/56Jqn20eT+BS8SHcallGUcamhG7AmznuPdwenk/80g2EdT8SVLTLO4J18e8K51O9zMqUZ7ebbvDYn8BhRDKsY4pSn92lPWpYOdOvxRK3o01i/47kn5FYOipxTAZzbjeHbXlKe1xZP2sIAaAG1P8q+O5fmc2E+gfOhmeBvQYB0mFVRZiD5MHjGkhSlOP4HGl2xlbJ36+dyDVFo9fa0dTj9HRZo0mFVFfZqQkxT2tWVhWCUMoAxd9QENDyrHViN7+x95RlgGJRHVDtyMqhcOj6icCAQgFevLO77LQbOaA0hDzj4i8pNKLRGOj5mqSIsp2oYPcQQPATo7weN3vfqF5J6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB183078.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(261028144727099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261026140227099003)(261022075727099003)(261102130727099003)(261009223027099003)(261021123027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU9jQTZGVDZwSFkzbU5LbHROc1hVRExsa2RFYSthU2hMTHpJZFdUZEZDTldC?=
 =?utf-8?B?dnRoRkRwVWd6RmdrbWFPQU9wS2Evb1hvVWMwS056ZjZNQXBxK1FOOXRucysr?=
 =?utf-8?B?clc1RDdRWWxZWjBTSVl6aHhZRjVEM3FQQmlwY1R0czdHQU1IZ3NGNDlFZnow?=
 =?utf-8?B?VFpCSWpacTNUa1AzN3BOREd0Z2pMNC80N3o2R3cyeWY1b3h3eG1veUMvSXIr?=
 =?utf-8?B?eXJURDUwY25tbmRvZysxbzIramYyajdxS05vMnNQRzJaenFWV0RHM1NCOXVZ?=
 =?utf-8?B?aCt4MjVuUnNxYlVBbVNPVjYzVEpGVDI5d29IUzBiaTFYNko3L0xwanBBbksy?=
 =?utf-8?B?RkFuZm16ZStpdkVKQ1dJY24rTkk5UlV1akZobERFUXNMcGN3NUk4WEprMloy?=
 =?utf-8?B?azJXMHJJNkgzV2VMSXF6L3RyWHdFWnJBSWJiQndNM2x2UDMvNEh2NjhvTVFp?=
 =?utf-8?B?MG1iaEhtRWlpWDkyREhQZEN3alBLZENNeGIxc3hjeEVEMTk2VlQwOWV0WTNB?=
 =?utf-8?B?WmNGVWt2aEVicE5aQzREQzJnSTFCeG1WUjBUMTBNcCs0cUJFTGF3dlYrdUZ5?=
 =?utf-8?B?VHJTNk1EM0YvQzRwS3lFaDNpMll3eHEra3FxbGd3ei91cnVmR3NIV0doZFRa?=
 =?utf-8?B?WHo1SE9sUk5FL0Z5eW9jak5RdzZkY0Ura1FuWE1EcWc4MHdrendybDZkdUM5?=
 =?utf-8?B?MElmS282YzJ1Yk51ZmJiNUQ2SVhyZmZsTCtEeVd3RHhZREV6V1k4U3k3L1BU?=
 =?utf-8?B?MXNWWUVWWHdMdnFOTDZVTktwTlU2SmtLdHpkQzNxUHNFL3cvQzEvOXE2UWVh?=
 =?utf-8?B?TGk3Z2pvUnFpTlI1V09xSWZpd01NdHhza1VXc2V5Wm16cjV6bkNmdTl0OG05?=
 =?utf-8?B?M2k0UzV5Rkt2L2Z5L3NMZE0wK0JDVDZ0ZVJrdFUrdzZHRzd6ZFZMdlhrdFdI?=
 =?utf-8?B?aE8yZTg4VzlHajlnSm5kWEF5V2FMTFg1S3hZV3NxcUFjcDJidFU0a3BzMmxo?=
 =?utf-8?B?VkVLVmI3QUllSmtrcm1ERUJaRnRiWDdNQW1WWGVxdXM1a094TWpMSnR5amtK?=
 =?utf-8?B?SWNFTzJkZmk4SVhDdGQ5UDRqVmZxWkpjeXB0bEtRTzd2d2RiMm9IcTU2NENs?=
 =?utf-8?B?NlNrc20yNHJlZmd5VDNrTmlvWEZ4YU4wbGp6bndIVTN2c1BieVJGUE9ieUVI?=
 =?utf-8?B?N3dackNOa1pnUWRkeGo4TGxZY2RxUk02MlZnWDRxdnJKbFJVaHhjTDFTbS9H?=
 =?utf-8?B?TVh0RENXV3dqWWpCRWs3dGFyai96NG45Z2pnMVBMelNGbEVEZnhPcmxpQ2lI?=
 =?utf-8?B?aGlRV0padVRkTEtSa0NBMmF4S25CcnRSV0VaV0pGbXdVYWdwcEdhanhxSGdh?=
 =?utf-8?B?QmNESEJ5eERzRURwMC9PNlIyNmhFNVIyRS83MHR3MnlsZTVFL29aM2doeTYw?=
 =?utf-8?B?T1dmVUkwVnpmSVhhYk1EQnJhMnpUcUVsVml4anV2dUVqT2pvZi8xRlNuZ0VZ?=
 =?utf-8?B?cm9PMXJrUGFFNkp6QjR6Vjg3WEZuQ2h1K3c3RjdpSlFOSWg3QU90V1hnUm9z?=
 =?utf-8?B?SnV2RGU1ejFZVGZjOFdpQ2ZoSkRuay9rdFIyc3NSellQOWpoWmdYOTd4S2Nr?=
 =?utf-8?B?NTl2TC96MHFjSkgwQjc0eGEra1RyYkcrWTNkakZmNkdKa09RSFZkYmtTaVhO?=
 =?utf-8?B?MDZHMm9ERFd6dVVBTjZpS2NnU2RuSlZVWGNmLzMvN09tME1FblRORGp3NlFG?=
 =?utf-8?B?ZXBoOWlyMWF0VlZpQkRWbHV1Zysyb1ZaOVpMRVpyanBGbkNZdjZHZG1QdmQw?=
 =?utf-8?B?VmFIQnhFcGFyRlZ1SWhocjdwZ21KaURFNWFuQjJ1dmVOSWljVld3NjB2UnNS?=
 =?utf-8?B?ZGtEcG4yTDM1d3hSLzlPWGQrOWNpaXJINjJlVGNNOEZWN2dhUVh4cGdvb3lU?=
 =?utf-8?B?dkhrK2J5WURlaklOelVzNDU5SnQzbGo1TlhnWmdpby94ZzlvM3NvYnZNT2pz?=
 =?utf-8?B?dHJRQ012VVMwbDIzbFhCZ2VuVVp6NUVRUWNtaDJ1bFZjREVHckF6cHM5d090?=
 =?utf-8?B?bjM3c2dzUXBBWmdpMGxtNHdHZUxodytYN210dFhDTEExcEM2V2g4ekpmbWpZ?=
 =?utf-8?B?NEpKQm1tYUlkK2Zpc1V4Y1ZqeTZVQ0FJNVhCd1hTVmNoNUg1VjRMM3UwWWZM?=
 =?utf-8?B?R0tlUmwzaU1LYW5QWXdBNnRjaFdKV0JibXZSNmE3c0wyL2ViYmZnYTZTMS9r?=
 =?utf-8?B?Uk5LMy9CTlg5cU5hR3ZHR3Q3bTFKdlJPaU1mVjVBek5UMC95WVo1NDhicTRh?=
 =?utf-8?B?dytTeENvcFhwZUkydlVxWU5zS1cyNUVRUUFjemgvUlQvMVppaEE1YnljMm5z?=
 =?utf-8?Q?DxiPE148y8y9UJOA=3D?=
X-Exchange-RoutingPolicyChecked: ZPhdrdkZkBejI1i9f3jV4IaVmnYymVfr/5jUXoTstp+SISR9KgRqn2mIZJ4oz1Sb050kFsX+v8dg222wOtifG4QWdXY/Pk9pkLDvC+toumtvpC5BPlTBzjcPtscSj+VbegiStvq515hqyfEwGt0nFPkus4ImVPdbW6fhIa/7YfIjPsiKlCRRaMTnE57xZEhAakjnldyf9q9pgaxjzIt2i/xPcjOlpnaVLJaferJOr95R0yG7YcSI4YouKAE8cZU6FfPg2UIX7811KhqQPPjysC1jxKUWQkDncaNddGXBXduzwEVveHLWjgX1VKHyRdKVs7EA+bMclVEa06uXD5+NDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 196f7d92-56d2-4c04-3252-08df3b86f95c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB183078.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 21:51:40.6464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 829yUVzJwItQXFTI2DkypkTYYVeqpmGF4wY2js9mxMkj6MXpItMaCMvmzekUHL68XfxsGl/4GfCib8dBxRtmp+x7wQqi0Wc2RHwAtfeSKZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9280
X-OriginatorOrg: intel.com


On 11/2/2026 1:34 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] drm/xe: out-of-order fence signaling and MMIO invalidation when debug_paused
> - [High] drm/xe/wedge: broken TLB reset and queue ref leak in wedge_pause_work()
> --
>
> commit c122991e71ecbb496ea6c81f3c4f283b79307727
> Author: Daniel Charles <daniel.charles@intel.com>
>
> drm/xe/wedge: preserve pending TLB invalidations during inspection
>
> This patch pauses TLB invalidation timeout and completion processing when the
> mode-3 inspection worker stops a GT, preserving pending invalidation fences
> unsignaled during inspection. Replying continue resets the preserved
> invalidations before permanent wedging, while skip leaves them paused.
>
>> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
>> index c9cc5842d65b6..293929f92eb0f 100644
>> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
>> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> [ ... ]
>> @@ -209,6 +219,24 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
>>   	return drmm_add_action_or_reset(&xe->drm, tlb_inval_fini, tlb_inval);
>>   }
>>   
>> +/**
>> + * xe_tlb_inval_debug_pause() - Preserve pending invalidations for inspection
>> + * @tlb_inval: TLB invalidation client
>> + *
>> + * A reset ends this pause even while inspection waits for a reply.
>> + * Holding a runtime PM reference does not prevent system suspend.
>> + */
>> +void xe_tlb_inval_debug_pause(struct xe_tlb_inval *tlb_inval)
>> +{
>> +	if (!tlb_inval->ops->initialized(tlb_inval))
>> +		return;
>> +
>> +	spin_lock_irq(&tlb_inval->pending_lock);
>> +	tlb_inval->debug_paused = true;
>> +	cancel_delayed_work(&tlb_inval->fence_tdr);
>> +	spin_unlock_irq(&tlb_inval->pending_lock);
>> +}
> [Severity: High]
> Can new TLB invalidations issued while tlb_inval->debug_paused is true cause
> out-of-order dma_fence signaling and unintended MMIO invalidations during
> inspection?
>
> When wedge_pause_work() -> xe_gt_wedge_pause() runs, it calls
> xe_tlb_inval_debug_pause() to leave in-flight fences on
> tlb_inval->pending_fences unsignaled, and then calls xe_uc_wedge_declare() ->
> xe_guc_ct_stop(), which sets ct->state = XE_GUC_CT_STATE_STOPPED without
> setting xe->wedged.flag.
>
> However, per-queue TLB invalidation dependency schedulers
> (q->tlb_inval[i].dep_scheduler running on gt->tlb_inval.job_wq), in-flight
> ioctls, MMU notifiers, VM teardown, and new operations after
> XE_WEDGE_REPLY_SKIP are not prevented from calling xe_tlb_inval_range(),
> xe_tlb_inval_ggtt(), xe_tlb_inval_all(), or xe_tlb_inval_vm().
>
> Because neither xe_tlb_inval_fence_prep() nor xe_tlb_inval_issue() checks
> tlb_inval->debug_paused:
>
> drivers/gpu/drm/xe/xe_tlb_inval.c:xe_tlb_inval_issue() {
> 	mutex_lock(&(__tlb_inval)->seqno_lock);
> 	xe_tlb_inval_fence_prep((__fence));
> 	__ret = op((__tlb_inval), (__fence)->seqno, ##args);
> 	if (__ret < 0)
> 		xe_tlb_inval_fence_signal_unlocked((__fence));
> 	mutex_unlock(&(__tlb_inval)->seqno_lock);
>
> 	/* Undelivered: fence already signalled, report done */
> 	(__ret == -ECANCELED || __ret == -ENOTRECOVERABLE) ? 0 : __ret;
> }
>
> When a subsequent invalidation runs while ct->state is
> XE_GUC_CT_STATE_STOPPED, xe_guc_ct_send() returns -ECANCELED.
> xe_tlb_inval_issue() then immediately signals the newly issued fence via
> xe_tlb_inval_fence_signal_unlocked() and returns 0 while earlier preserved
> fences remain unsignaled in tlb_inval->pending_fences.
>
> In xe_tlb_inval_job_push(), jobs on the same (q, gt) xe_dep_scheduler export
> &job->dep.drm.s_fence->finished on a shared drm_sched_entity fence context so
> that later jobs squash earlier jobs in dma_resv and
> q->tlb_inval[idx].last_fence:
>
> drivers/gpu/drm/xe/xe_tlb_inval_job.c:xe_tlb_inval_job_push() {
> 	...
> 	xe_exec_queue_tlb_inval_last_fence_set(job->q, job->vm,
> 					       &job->dep.drm.s_fence->finished,
> 					       job->idx);
> 	...
> 	return &job->dep.drm.s_fence->finished;
> }
>
> If an earlier job's fence is preserved unsignaled in pending_fences and a
> later job gets -ECANCELED, the later job's finished fence signals out of order
> on that timeline while the earlier fence is still unsignaled, allowing
> dma_resv, last_fence waiters, and attached prl_sa suballocations to observe
> completion even though neither invalidation completed and the GT was not
> reset.
>
> In addition, in send_tlb_inval_ggtt() (called directly or as a dummy
> invalidation from send_tlb_inval_ctx_ppgtt() when !last_q &&
> !xe_tlb_inval_idle(tlb_inval)):
>
> drivers/gpu/drm/xe/xe_guc_tlb_inval.c:send_tlb_inval_ggtt() {
> 	if (xe_guc_ct_enabled(&guc->ct) && guc->submission_state.initialized) {
> 		return send_tlb_inval(&guc->ct, action, ARRAY_SIZE(action));
> 	} else if (xe_device_uc_enabled(xe) && !xe_wedged(xe)) {
> 		...
> 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> 			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
> 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> 			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
> 					PVC_GUC_TLB_INV_DESC0_VALID);
> 		} else {
> 			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
> 					GUC_TLB_INV_CR_INVALIDATE);
> 		}
> 	}
>
> 	return -ECANCELED;
> }
>
> Because xe_guc_ct_enabled(&guc->ct) is false while !xe_wedged(xe) remains true
> during mode-3 inspection and after skip, wouldn't this wake the GT and write
> GuC TLB invalidation MMIO registers during hardware inspection?
>
> [ ... ]

I had to instrument a bit this behavior to understand what could be done 
here.  Since this is a best-effort inspection approach the current 
behavior is alright.

Holding every new fence would introduce a number of potential risks: 
synchronous GGTT callers wait non-interruptibly, sometimes while holding 
the GGTT mutex, and could remain blocked indefinitely after SKIP. 
Suppressing only the MMIO fallback would not address newer-fence 
signaling or mapping changes already made.

This is going to be documented.

>
>> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
>> index c22c3544adcaa..f7b2ec9d68863 100644
>> --- a/drivers/gpu/drm/xe/xe_wedge.c
>> +++ b/drivers/gpu/drm/xe/xe_wedge.c
>> @@ -17,6 +17,7 @@
>>   #include "xe_pm.h"
>>   #include "xe_printk.h"
>>   #include "xe_sriov.h"
>> +#include "xe_tlb_inval.h"
>>   #include "xe_wedge.h"
>>   
>>   /**
>> @@ -115,6 +116,9 @@ static void wedge_declare_now(struct xe_device *xe, unsigned long method,
>>   	if (!gts_already_wedged) {
>>   		for_each_initialized_gt(gt, xe, id)
>>   			xe_gt_wedge_declare(gt);
>> +	} else {
>> +		for_each_initialized_gt(gt, xe, id)
>> +			xe_tlb_inval_reset(&gt->tlb_inval);
>>   	}
> [Severity: High]
> What happens in wedge_declare_now() if a GT was reset or resumed while
> wedge_pause_work() was waiting, or if wedge_pause_work() is re-entered after
> xe->wedged.declare_pending is cleared?
>
> First, as noted in the comment on xe_tlb_inval_debug_pause(), a GT reset or
> system suspend/resume cycle can run while wedge_pause_work() waits in
> wait_event_idle(), restarting the GT and re-enabling GuC CT and submission
> while xe_wedged(xe) is still false. When the user then replies
> XE_WEDGE_REPLY_CONTINUE, wedge_pause_work() calls
> wedge_declare_now(xe, DRM_WEDGE_RECOVERY_NONE, true), which skips
> xe_gt_wedge_declare(gt) and calls xe_tlb_inval_reset(&gt->tlb_inval) directly
> while the GT's TLB invalidation backend is active and running.
>
> Second, when wedge_pause_work() finishes, it clears
> atomic_set(&xe->wedged.declare_pending, 0):
>
> drivers/gpu/drm/xe/xe_wedge.c:wedge_pause_work() {
> 	...
> 	if (!READ_ONCE(xe->wedged.shutting_down) && reply == XE_WEDGE_REPLY_CONTINUE)
> 		wedge_declare_now(xe, DRM_WEDGE_RECOVERY_NONE, true);
> 	else
> 		xe_info(xe, "Inspection released without permanent wedge; GTs remain stopped\n");
> put_runtime_ref:
> 	xe_pm_runtime_put(xe);
> clear_pending:
> 	atomic_set(&xe->wedged.declare_pending, 0);
> }
>
> Because wedge_request() does not check xe_wedged(xe) in mode 3 before queuing
> pause_work again, a subsequent wedge request after XE_WEDGE_REPLY_CONTINUE (or
> after another path sets xe->wedged.flag) can re-enter wedge_pause_work() and
> call xe_gt_wedge_pause() -> xe_tlb_inval_debug_pause(), setting
> tlb_inval->debug_paused = true again. When the user replies
> XE_WEDGE_REPLY_CONTINUE to that second pause, wedge_declare_now() returns
> early at:
>
> 	if (atomic_xchg(&xe->wedged.flag, 1))
> 		return;
>
> before reaching xe_tlb_inval_reset(&gt->tlb_inval), leaving
> tlb_inval->debug_paused permanently true.
>
> Furthermore, each time xe_gt_wedge_pause() runs on repeated pauses (or when
> xe_gt_wedge_declare() later runs), it calls xe_uc_wedge_declare() ->
> xe_guc_submit_wedge():
>
> drivers/gpu/drm/xe/xe_guc_submit.c:xe_guc_submit_wedge() {
> 	...
> 	if (xe_wedge_is_hanging_on_any(READ_ONCE(xe->wedged.mode))) {
> 		mutex_lock(&guc->submission_state.lock);
> 		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> 			if (xe_exec_queue_get_unless_zero(q))
> 				set_exec_queue_wedged(q);
> 		mutex_unlock(&guc->submission_state.lock);
> 	}
> }
>
> Since xe_guc_submit_wedge() grabs a new reference via
> xe_exec_queue_get_unless_zero(q) without checking !exec_queue_wedged(q), while
> guc_submit_fini() only drops one reference per wedged queue, wouldn't repeated
> calls leak xe_exec_queue references?
This behavior will be modified once newly issued requests are cancelled 
and signaled while inspection is going, also the logic for older 
preserved fences is not resolved, but the blocking will be extended.  
  At this point only a power-cycle may be necessary which will also be 
documented.
