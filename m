Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A741745C6E3
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536886; cv=fail; b=uk0mTOLhGE8mpT0VNKMqtBJwMb5dOS9FGadeDyTjWzONh9mQRLVDIDHiPSElXUgwz0WB2r227zZR9Srj5BYTPCv1yLcgNbuFRo5y0K6GgxPgJwBnS+qOylDdBd4gBZkpP8+O8H7/x8T8yg1ewI32ANslvebN414nb94OzprgM/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536886; c=relaxed/simple;
	bh=h2ELhaWsefE+DMMfQoR6QciieRkwNAieCrVcEyZDufY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aYQesTzcbVwPXCHrRpPNRJAJbntseKYoiWiPv9KRf0iECAQmLqxPWyH+IWKp8ZyyhnLocAfNcmOZ5dz1aV540KHnLBxXk9Dd0jP5O5JwnrApr6qKCSJ0gU8MQlW6jYaI0Gl0crLZCLhnx3NnUgWrqnhLl9F5UWoN4UeY/Uu/d+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgZ3NdE2; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgZ3NdE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791536883; x=1823072883;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h2ELhaWsefE+DMMfQoR6QciieRkwNAieCrVcEyZDufY=;
  b=DgZ3NdE2YJFlpsJHIJzB6UOKgR9/PAsc2Bj4I+lirGMUtHJgoi7rSF4B
   RugkvzLyDueAa/5wprwYN+qvgBcxauj/GB/K3P0zjJF8mk5pMGB+BnBiC
   3bmue0lFl4tfF/z+dsPOZef8gk38VsgG0zNZLbBX/eru7loKotl5RCaim
   2Qx8z1IQyTZxflC+leZWBQ22bTUf71YF9t+3e3nluxcWgwGdZciL9gYUo
   GxY+zzL1NNgQeNwDVW3Bxsc2+rWj9pK5xbOuWip7D6WnxuECSbTs0iwws
   FLdQLD7agxrRqO/SR1FCxsO51Rur+EuADa2/NZbi2TbXgX/14Lf8HJIDv
   w==;
X-CSE-ConnectionGUID: QRWp4xSXQZinLakUW4Ktng==
X-CSE-MsgGUID: Seos5TtcTGSsLj0Uvqkp2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="219360"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="219360"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:08:02 -0700
X-CSE-ConnectionGUID: daeASi7DROaQqkBeJwJQtA==
X-CSE-MsgGUID: bQIDzeVkT1iBFGZkZFLmmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="371536"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:08:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 02:08:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 02:08:01 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 02:08:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLrOyR9/86IOnKn8yQ8xJK/7gPm7zoxvZXVY0mpLUGUKhjnWDB0EBoVvTAFN9oqH+QVhLvYrs9bLKThVM1BGLRMM+I+m84DQv3GIE+XpcWMBnIkHcnsrJlk8BCyqBg0gE9V30HAzFkU1nZGI4H4oqe/XJ/wI5MCAXUC0TbUqzFMQhoEj8Jvd6oi3Of6JMNB8Gm1q/QID0rs0+qh7nNkU8GJ6Jog1lvddUNivBz8iooipBLAX7q3oiJPN0mAvqmC5BanX1pyt7wb9Hsqp4eZXBv7VUjiWZxoKFMARCeT86xHhPyGSEk5nc+glKH02KiwGTUEHTXO5s9mYKRVK7OT8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8d20RBKBpLOS1Yot+aBltCh0jCkrrXc4XCNPksR9N2A=;
 b=Kp4MPs+S4tgU9ZaMXUvt8eAGY2YSXvfZQpkQd2K5mSU1iw1Q/HX2AL6iGmg9ZuO2RK8BXici3nt+f8O7W9vA4+XOWmzXHLIIL3+HPNO3Pbp840ZH7HureG7pvVG71HWTswYmM6lsYkEArsM+4O/kqQeeL5ZTmRwfdThSzoTV3QG7sDGt40luOZNeXy+Zd86/rgpRhnAZf6D3Lk4OlL+FPNoEUHknGsdmlkhCX/W3MtB1teOS1XCW6fLVmoMeSBqBBMS9BzEWRnK3QMZmaFR/y414E5K/BqsEoxagb2dHF+1cphkl5sGzD5qLcQVbhT0MP5bBlvuxeKyU0KY9GXC8IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 09:07:53 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 09:07:51 +0000
Message-ID: <8eec8c58-a7a4-4286-a781-a7b1f137c087@intel.com>
Date: Fri, 9 Oct 2026 14:37:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Add wa_14028434957 to Graphics Version 35.11
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261009075224.1316885-2-varun.gupta@intel.com>
 <sashiko-outbox-165051@kernel.org>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <sashiko-outbox-165051@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0150.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::7) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: deeccaa5-f57b-42b4-eec0-08df25e4cbf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|4143699003|56012099006|260925022911599003|6133799003|10067099003|260925021911599003|260925021311599003|11063799006;
X-Microsoft-Antispam-Message-Info: Aas+qDC8N3W1PLwTVFZz9zb74kSNeRrQ7jT38hej23eh9YXz5l/5RX8cTinzbqfFzyakrlGVrKjzCM1pL7w3G+Td0bOFvLJSos+XhSZnmIX4UOodbz7eHbGQh2bAHpOeqcT5wT09fPCdPMwbS93EU7ZG2fzGK4/KcHNxaAk14FIu7OULzBGr/wUs8Sd/m4r5EbqJb7+bGanK+Ec3CiwuICP3EPriiXhfVl8dcQaesIOYzNItMzgrBkj4puUGAj8D7b72IebcGjFSbQzO6ySyoNLHrVjdPJkHwSo9vM7ZhhCV90MYWf073NHUiJy7OZRgMGvkN7lDTExxHzSttXjB3nwaPAOMJOWD6n3AByEPK79rquRUYBAPbvF28gt/vDNNIo9fvMDtBwf6LevysNJw3k+8W6lEWaBJrDfPLwT0Mmjkx6/c4RzpplvS8kLAVoGt84YokCX2UoPwyOBGtW9zjppp3NWpx5i7rqguaiBvkX8TFIwCcNm7GfdTGzU8fvLWGcsmjbDAFlU6EkCOQw6PHjUw0fRpXQUYntb3vOSDvFUFbr+9pJ/6rru5lFRF5fRXcKngCVVwCCvnIsu5K6EZDaJ9vUnhRCMqySFy3jq8BC3qvw02INKvI44OiydznB9r+9vcdZ0tEGbm6Xpd4it//fA+S9MipwD5bfIA20lQuHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(260925022911599003)(6133799003)(10067099003)(260925021911599003)(260925021311599003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0tWcVpabjl5OENMVXBTbVdTQWQvNzN0ckZlaXZseVRvTWFRYml3dDRCTCtk?=
 =?utf-8?B?M0FyemJJMzluaml1TXlqVVJzOXZyRlorQ2EzVHc4eW80dlRaTG40SlJaS2pN?=
 =?utf-8?B?LzYva3pUZG8yeTVzWnRpakpJQmI0dFY3VkF4bW9zeFJIcU9BR2pOalNkUUhv?=
 =?utf-8?B?QnAxQXJxb29ydjIxR1N5M0h1UllDWldFSVVMWWNsK3Z6bU40eTA0bzUvNEVj?=
 =?utf-8?B?Vlc3Z0ZQc1c0aHUzdDF4bnNKODF6bTdPdXJHWXUzODJZMWZvcXJKMjk4NWtt?=
 =?utf-8?B?V2xmcktPVnBuTVRNZ0ZsSEVhMlloaDNadWJMVFJwRkpMTFBaWmNkdDB0WkQx?=
 =?utf-8?B?TzdaN0wxWFkxWitJbmVtNkxvRTFmNjBQWndFb1FFNkRjN0NwYnR6ZVpQd3Q5?=
 =?utf-8?B?ZGNoZjFLeWdoNTFSa21nVHIxZEgvQXhBcjdRQlpYVnZzVnVHY0VyZ1pIaWIw?=
 =?utf-8?B?c1FaMHlKZnVMWTFDSWZYOEl5QlhCWGdxMENFMmpvTloxNEdYRzROdzJrV0dM?=
 =?utf-8?B?dmRKSzF0cDBSeVd4TWswclpWemxZUGMvUmVmbTNKOXNOaW41QTZDVWJRYUc0?=
 =?utf-8?B?b3FQQ2RTdHZ4R0thSy9mMkQrTi9hV3VVR2JRWjFuVXRtMkJVSS9ZUENaR2RT?=
 =?utf-8?B?YWxjVURtWGh6ZmVmRktibjNDMUZxbC9YT0VBM2hxaFhpSyt2a0pYb1VZZHhX?=
 =?utf-8?B?Rmk4SFVHbXI4TVQ1QjRnOFVJcDdpeCthL2VITjBiNGcvQ0FEU1I1MEliYWdV?=
 =?utf-8?B?U3dBZHE1WVdzNEdLL2tMd3hRSFc4THdSUUJ5SFNOZmRWQTZZQW9JcUF6ZXhh?=
 =?utf-8?B?MFVKVkJRYXRnRUFYSHJzWG1obzFvSmI5U2U1OU1QaU9PMkRrSVFuSmVIaFpJ?=
 =?utf-8?B?QWpSeUVxaHFyRVpMdHJ4RzQvZHlRYy84Q1N4cEtBbFUzOFYwR2VvWnFaaVhz?=
 =?utf-8?B?cS9BY0k4SVNwbTlkeXhxNThLanlWOFh6NFNNNktGS0xiem9QaFBvOFBBLzNp?=
 =?utf-8?B?L0JhYzQyOVIwWXpOWWVqRzIxWHVodG1vZ3gyd2N1NmdmOG9RRkQ2bjdUeG1k?=
 =?utf-8?B?aE1wYVRZdzhIbGNTQ0p1QkFMa0ZqemFPdW1lTU9jdlZvbit6OGxodENpUmVn?=
 =?utf-8?B?UDQwSXJtVXArdHQvNGw5b2t6My9Fb3hkcWNLQi9jejRnSWwycm9yTStucFpv?=
 =?utf-8?B?c2pPb29FbzRDUURFcWJVTXBrRFhtWnhzR0dNSjhzQTJiNzFQUGkrUVc5a2xw?=
 =?utf-8?B?UGRRZnZrQnMyNnF6N2IzVGNNNnh6WGpnZ0lNQXNnNmdPSlk4d3gxVjg4VkhB?=
 =?utf-8?B?Y1NXMFllVkpLTHRhN2JIQkVtZ1B2ZGVSL1pyQXVRaDRacHpyNlNRa2E1NUpB?=
 =?utf-8?B?eHJqNzVqZHBGeUhTdEszeS9YU2EzbkpkRDdtb3M4Z2Fyc3M5MmNhanpBbzkv?=
 =?utf-8?B?OXlFcDFSMmtqTHJ5SlY1YnduNXh2MTJPU0w1WG1JMW5Hd2NPeWdqZ0dicmdV?=
 =?utf-8?B?OHlLb0k2TkJBNmpLOFVLa1JoYW1uTWc4b3NzRlFyWmIyMWU4MzV1V29KOXIx?=
 =?utf-8?B?UEg4ejdwSlp5RDIrWTVXdnpzLy9pWUlpMlBWL1R4TUN6RXFQVjdPVERqQzZi?=
 =?utf-8?B?WHMrVUtVaHhHRnhxY1FSdURNU1c4Y0FVODAzQzVlQWs5dXVDMVBwYUhyVWls?=
 =?utf-8?B?N3lZTmd3TW8zZXIzWDhVQWpQMlRNNWZNbGV6NW5GQ0VNZGtHWlN0THBzb3JB?=
 =?utf-8?B?WTdRVmhPTngrKzVDdDd4ajF4Y0RrTFVoY2RBZkVPTUlwMlQ5eVNnV1FmZ3VW?=
 =?utf-8?B?b3lvcSsvSGZteDA3K3NjeEd5K2RLL3YzM0xBaXNMcWNwYUpNOUM4VDBaVFhI?=
 =?utf-8?B?d2l1UWJVMktOTjhrTWlFbDFucS8vN2FXK0RtQ0NSWnZmUHlmRE1HQVFJbzlO?=
 =?utf-8?B?aHlnOWF1Wk9tWkJ2TlR2OTZsTmxNa3pOekFCV0lVZU9Ed2w2aW85SlY3NjNj?=
 =?utf-8?B?Ny8zOHUyS3JuTWs0S3QrQnA2ZTdkcitjckJLZ3l2RkRxb21HY0dFMmJQSlky?=
 =?utf-8?B?emxSUGFEYUZjSVdnZWM1cjZvSFNTdmNRbmQxT01BdTFST25oUVB4M1p5S1VG?=
 =?utf-8?B?VEppU05uSWdhbjN5NkQzMnRmZTdrU3Rtc1BZdHpQMS9MQmZjWTNCL2lOUjZC?=
 =?utf-8?B?SVFDbGM3VHpackMwcFd3Z3luUko3S1FWOUlpbGQzd3hzT0VnZDk2YXh3M1Z5?=
 =?utf-8?B?WnFJVjRHMGMreFZyWER3MDBDd3ZvYzQxYk9zb2RhQ2t1cS83UmxkSVJ3R0Nq?=
 =?utf-8?B?SUtzU1QxVlU4OGtkc2NFRDVqcGd3b0VGU3Zxa3o0RDlMNG1iUHNQQT09?=
X-Exchange-RoutingPolicyChecked: cWj2/eiADbZ1VJ3k34M4oK/MWWZWlY4h7dsfvL83wl79/5//AyV/ILM/ohCeew2MqkDAoKUQ0w1mywgUBvm2r36mUI+pgqN9KI77LREquJSMbPmD4mjSOVt7FZ3hYa+56DgdBLh87QEXGQX+L4kZ9l9/XGtLzgc4Ijukt4R3JbUP7Jd3XMlr1NRLvPWzYZmfXlv99Q67Qtn61op0buZYUrnkiImvN3CVHZwbPApZ6qFXlQu8pWW/arZQg7N9Ml+wS3a++jZ0DNORWX3ZBuob6CFtPaDVwzS3ztw92ywaRyA4mV/YmFKJllHgaGVAEMKBhg9jY0DUp5nupYq2tige/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: deeccaa5-f57b-42b4-eec0-08df25e4cbf7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 09:07:51.7956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4G5RWyOuhPW8XT4Mc6zI+ZuFzZKMHVVmePLpRPHBUDo4bAp+xNVIjcJmStqqHBH+xutRjV4iNHLsTkVKm472iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
X-OriginatorOrg: intel.com


On 09-Oct-26 1:32 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe: early MSI workqueues wedge device before cleanup handlers are registered
> --
>
> commit 64d5d3713cb5cf15e2cdb1f9711919646d7c8e35
> Author: Varun Gupta <varun.gupta@intel.com>
> drm/xe: Add wa_14028434957 to Graphics Version 35.11
>
> This patch prevents the SNIB AER latch from swallowing back-to-back
> uncorrectable non-fatal errors by intercepting the MSI and reusing the
> existing GFSP error containment logic. Because GFSP mailbox queries can
> sleep, handling is deferred to a workqueue to ensure hardirq safety,
> wedging the device if a reset is required.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 5f2abc9485ff5..bde707a3fb641 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> [ ... ]
>> @@ -173,6 +178,29 @@ static void csc_hw_error_work(struct work_struct *work)
>>   	xe_survivability_mode_runtime_enable(xe);
>>   }
>>   
>> +static void nonfatal_msi_work(struct work_struct *work)
>> +{
>> +	struct xe_drm_ras *ras = container_of(work, typeof(*ras), nonfatal_msi_work);
>> +	struct xe_device *xe = container_of(ras, typeof(*xe), ras);
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	enum xe_ras_recovery_action action = xe_ras_process_errors(xe);
>> +
>> +	/*
>> +	 * TODO: Request an SBR instead of wedging, once VR driver
>> +	 * quiescing support is in place.
>> +	 */
>> +	if (action != XE_RAS_RECOVERY_ACTION_RECOVERED)
>> +		xe_device_declare_wedged(xe);
> [Severity: Medium]
> Can this workqueue race with driver probe?
>
> Looking at xe_irq_install(), it calls xe_hw_error_init() which processes
> pre-existing hardware errors via process_hw_errors(). This immediately queues
> nonfatal_msi_work if non-fatal errors are already pending.
>
> If the work executes concurrently with xe_device_probe(), it will call
> xe_device_declare_wedged(xe) which acquires a PM runtime reference
> (xe_pm_runtime_get_noresume) and sends a wedged uevent.
>
> However, xe_device_wedged_fini isn't registered until the very end of probe,
> and drm_dev_register() hasn't finished yet.
>
> If probe fails in between, could the PM runtime reference leak? Is it safe
> to send a wedged uevent on an unregistered DRM device?
This could be a genuine issue, we can add drm_dev_registered() check here,
but waiting for Rodrigo or Matt Roper to comment on this first before 
sending another version.
>> +}
>> +
> [ ... ]
>> @@ -436,6 +464,15 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>   	 * here for those platforms.
>>   	 */
>>   	if (xe->info.has_sysctrl) {
>> +		/*
>> +		 * Defer non-fatal MSI handling to process context because the GFSP
>> +		 * query can sleep.
>> +		 */
>> +		if (hw_err == HARDWARE_ERROR_NONFATAL && XE_DEVICE_WA(xe, 14028434957)) {
>> +			schedule_work(&xe->ras.nonfatal_msi_work);
> [Severity: Medium]
> Could this execute too early during initialization?
>
> As noted above, if a non-fatal error is present during module load, this
> schedules the work early in the initialization sequence before cleanup
> handlers are fully established in xe_device_probe().
>
>> +			return;
>> +		}
>> +
>>   		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
>>   		return;
>>   	}
