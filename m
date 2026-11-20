Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795215796;
	b=utLtgTc/YjGUVcBwiqbhSYBEId4qVTYmMy7PRigflfryUC28T6TXh/L64MS6SthN7Pty
	 HGL1VNxLKbyPxGUtVw937JYJAZ3Qxknvl/kcW5th0VbDDq9rkZZ+wAdLuhz7TzrV0lr8O
	 UR4M6OO5QwzzDEx6nHPKcSQ6YTi2DgoL0yErRe8XnP+VUYjbEzUvGKLgrkzf+bKQH2sic
	 NXPFfYXSJtzV4Zl4JClh+VbEAjnhM/BXF47pQwITkKNGPh80ymfYRj2ARGB4WOvE0h5Su
	 G67QJBG5mwYwrfTy1+VLgTNdvF+oYMsMnrJU77rY9DEzCLo4uOiekAny2Bgx3mLzbXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215796;
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
	bh=OBeCL6osgejT00krGzxGSTfCgzmb0reGFlLKk4su7Pk=;
	b=C60Up0F1iEkSwoRa3xActj7p8/v3Sh2kELIgHvT5jSuC85eSq52jg4VmvnGZbm4rGWLQ
	 BTwxBXU4Cpv1OOMn6hz/C0mBgQBWfX35XCB5Vy/h/FIpzQ+YicpinfcY9+6/vEG4JSxgb
	 6ujYPpbGXTN1A+4O2qx+gQV5zumN+nxZYIBtqDD3N1+UQ8inj6Nmrp3pb5RLUDw9DlF0R
	 JNvoMFqmJdVLsg9p3AsDYxonaHXIFLEOg1l7SSOZr0Msa3vrG9DhGAbcDHZlVe6TQrDgm
	 yx0pzWPnRF5+J/e6oxSe4A5cflOaAdPgRSYxiFFVV8nh/Ml+oz25e1HZIOd8Z5zj0CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FLrDasty;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=V6mluXfd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCAE606A69E
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 23:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDCAE606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FLrDasty;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=V6mluXfd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795215791; x=1826751791;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2wDPNB7edGb45y9TQOa2iAVv2Ejb+Or8JFzw+XsgYcw=;
  b=FLrDastyF0cAcJgol7hgzHdjsARNz1s+OgKpftL1WqTBqteqabLWs/7N
   a7UxRVTcMdm7iYJjY52CmbNGrnqAttLYqfQVKcEHaRnztGzVmOjZwEyoI
   r0/UOD4zAnrEU+pF3d6u2uiuB81VNEuOeAmeknUj19MLeI+YcjKFI5zt4
   xbgg7nAtw9Z5by0m0nkFEuDvMcQQqqyngTzNF80ksuTYVLGdSdkjoFp3I
   jbwM0KG1oe19NdsE9HeeGb6LkcGGAna3q5sdU8XP/yFonZYiFmCbTNEa8
   TbaP3TLcZPwhWBGO/vYeqSeiJodE2zCgneq2AGaF+F4yY8JPu99g2YLkc
   A==;
X-CSE-ConnectionGUID: gVUTUDilRumNaKIrX5wirg==
X-CSE-MsgGUID: NM4C+ZAxS0WszG8eU5Zd8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4096724"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4096724"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:03:11 -0800
X-CSE-ConnectionGUID: /ekaU01USZiHlLeMkwfy7Q==
X-CSE-MsgGUID: RQHa85TwRzO5BAeRweXKhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11129903"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:03:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 15:03:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 15:03:09 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 15:03:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXWfQh+OmMYu5X8611uTzX3BbNiV17z83nBBzswpb3IBkpsqr6mR6FywKc4Y3vWA7GfD3s7XiO9ykgwzqhNbrGPM3tOvsm1kMxBc1rEX4i2E8J/t+Yy8xmmpZZ99e/aZt4J2QZZ793Vhh8Ht4udDr5iabOaoMa8v3U0aX2RUsSmEtCbvgNSJNhwel6ZAn6D+qiZTkj7BaN7Bj+rxXanG9uuVzLRNSVboY3kRhItPLmxIhgWVwLMTpocxIZMh79aDzvNnBOI2w/55Xa8MGsOOHr/atVV+XrZ/KRAn3R+1V3H2fE96AmG7olbebMC4OmrIlsbcxYvC+JnwOkRVhkS3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBeCL6osgejT00krGzxGSTfCgzmb0reGFlLKk4su7Pk=;
 b=WlUi8COAWsChOzXM1mJbsqugftAI8U4hbw/qgtHVy9KWrdk9tDX4SgGsv3Dn5CA+9LrOufjUcM5j0RCI9pqdrjaPTeNIzHfcid5dUjRwcFOHAjyrgF/pfiRWt96rxu+pE/Af13NaoMkUFC4i+aAf5sbwVcYTDIAuDMFF33RhazIdfaSEp6ZNK1B+Ye9PzWGsp0KuLus610LC608v/qdZybsaQEjRQJTHvqkoEdL1z6b4HNVjS6ovR1Vz1m3NTiVyS13+Dv4fEkWPoy875si8PBDUl9/Oaq/DmZEPu0rWinl75NaS0+MejYfYudn3MprIUHmsb6+XlcLECH+6XABCcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBeCL6osgejT00krGzxGSTfCgzmb0reGFlLKk4su7Pk=;
 b=V6mluXfd8p4UxCcM47yKyorUp7WogtSqCpQ1nAtaOr4XXl2MrtWkcaSV8ezj+7b/8AgNaffLfw1LNj+Ks11T1Y558lkp7qLx+Ww9QGKbaqbDjgFOTmV2BeH5ZBygr7RnkIa+4Q8xDj94VWLXQ4yEz89PI55gOPadwJmPOELMYyE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 23:03:00 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0615.012; Fri, 20 Nov 2026
 23:02:53 +0000
Date: Fri, 20 Nov 2026 15:02:51 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 2/8] drm/xe/oa: Use the drm device address_space for
 the OA stream fd
Message-ID: <awDRmw5tB5CwLMZV@soc-5CG1426VCC.clients.intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-12-umesh.nerlige.ramappa@intel.com>
 <sashiko-outbox-222249@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-222249@kernel.org>
X-ClientProxiedBy: MW4PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:303:dc::34) To DS0PR11MB7408.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c8a590-9e7a-46dd-d1db-08df475a685d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261021121427099003|11063799006|4143699003|261026121527099003|56012099006|261009223027099003|261022105027099003|261026140227099003|261102123227099003|261022075727099003|261028144727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 2Ed71uY5pwYwa4USs72cUrodrfNDxihyjtF0T+298VGFQKD+cZTj0L4p69z1up8sd6FcBRfgpZCiR0q7g+GXMfXkrmGP6efCWei9Jbm/om1D4Z6/bLLLVBGaCJASUzRBFybnWcxvV3q6RpAJxYiOA3Vjn3Ca9GR5gDPzVaV+fdO+u/hYTcgVLf0pQ+TCFHJqnCMSODLRpNSekYXY5ISUBSxwKr+OZLGvENaPqcs53m/ACUcVqq5iLFFyMxxvTX0guyKc20wt6E8TUJMB98p4fJrt+rCiA93wjasFAvnZyh/81BPQN0sS9wBcLPrIJUbV2eOZCYy0LH3eS+aKgl5hK4FoaA6WpWnpYGa6KBg4r5S8RFK6Y9y822cUJA62k1MQnyg2SjC81BmPsDjDx3wf+2f572jklDBHBgUBGP/W9LP6soeUkgISjMdp72bE/LX/cHAd53QrT0F+nK0WJMEvORyTjvsUpSIWqDyN7w2SPqPI4yg2IQjsIKrMMPu0P7MPr8TpazwGRlhnuOw4ruBLYSPaedrUJQsUWocVL5vWRpPRZT5FnwQ6jOSw2qJlgszGj2dkgM4NRTnjHL/mVYmyLD+zxHyBt78L9SH0wSxFYvo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7408.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261021121427099003)(11063799006)(4143699003)(261026121527099003)(56012099006)(261009223027099003)(261022105027099003)(261026140227099003)(261102123227099003)(261022075727099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2VmV2xmSzlSUG12Zk0ybTh6ZXppakVFNUEwVlc1clhab1cySkJ0N2l5VkNq?=
 =?utf-8?B?alVzVnBzVEZ0WVhQaHk3ZlVzRE5sYmFCakxScyt2ek8yMXJIQjYyMWhDbHJD?=
 =?utf-8?B?WHdnNDVudmFHUFlhd3FKb1hzSUM3WnlNNHRBNWxSWFZyRjBIaXpta0JTRHdY?=
 =?utf-8?B?UFFubitPVTBXNjdDdUFEaU9kWTBWZzlWMEhuMy85c2pjREkzUHM1MlhRSGp6?=
 =?utf-8?B?Rk16dW12MWg3V2V2TXJaNTc5dzNPOEtKWTZiVUpib3pHRzlhL3lERFZxRFFV?=
 =?utf-8?B?blV4cTdqQVlBZ00zQWFOcElDR3ZLTVkxTmkvbmRrVjFmejd6SXF4Y3JWdkIw?=
 =?utf-8?B?WFVJV1pyUGNPRk5rTGpnOVVWVTAzWCtobU10WEhrejlhSXI2dktJVVQ2TEsz?=
 =?utf-8?B?bG1jRzZTVE9PYVl5VHdIclJmVGZmZU9pRGxPOUgrNW1NeURLZ0R4OWtSL2FW?=
 =?utf-8?B?aEh5UEpuZ0FTT3Boa2wyM0ZSK0NXWFVOckpVQkZvZ0RTN0d0SmpISG5CK0VS?=
 =?utf-8?B?amVkV0F0OTJXOUlvc3RRRTNtWkVkeEE4eWVjT05LMUp1cDZGT0FhQXByNHlE?=
 =?utf-8?B?VWlxb0ZIUDRQUDZjRzA5dHZURlFVZVY1VU5Nck8wbXdqWTJmT3RoWnR0eXA0?=
 =?utf-8?B?MkhTOU01OHNDR01jcmFaZCsxS2VxdlRMdG4xUm4zQ3pTL2NYem8vTzZsMDl4?=
 =?utf-8?B?MDk5cWlxZk0wM25WN3BaVllzdlhreWJ0REJISktlZjZLY3kxRURqMGlDbVdI?=
 =?utf-8?B?YXRKYlJQeWVkU05vQ1JBT0RWVjF2bE5ncXNQWGJvZW9UUUxoWW1sZHh3bUF2?=
 =?utf-8?B?WThQWjcvQ1lKNjNSMDJVU3BQamtzWVlrMnAxQ1B0UDgvL0o1TjNzMDJGR0hs?=
 =?utf-8?B?RjVpSjFJK3J1UGNaZVRwVFNuZHQ5ZllhQ0c2cE5ISC92Ync5V05xbWwzakxi?=
 =?utf-8?B?ZjFPeUl2TThvYjB4dFlBMXhZWTFENXVUWmFRV3QvYlU4TmRrakkzbEE2RkF2?=
 =?utf-8?B?U1BIQWhlVG40ZzlLQlBPa2kxNkpDL3k2TjlaRlZ1enE2TVYvZjUwY3EvT2kr?=
 =?utf-8?B?RytIditGQUR6R2RyRzlpNmlzRWZXbFNOcDZ3SnhmOG5RdDZYVzBKdkpIR1lB?=
 =?utf-8?B?Y21GT1hMZUtIdUI0dFFFd3JGc05nZGRsaHNDd0YyY1M5bFIwMjdwSzVOMTgw?=
 =?utf-8?B?NXY5ZlZBa0UwUzAxd3dRQlVncDRhRC9nOXRkRmZKZTk3UmU2VzdPazFyZjQz?=
 =?utf-8?B?QTR4UU5YT3FNbFA5aG54ZHFOY3FYYWc5d0pQaTc2cTVIMWxDZHY5THZGWnBV?=
 =?utf-8?B?Y2V0SURNb3ZROHpYSjcva0hrMEZQQWI0V3VwYlJvWUdDekdPdi96SnZWRkpx?=
 =?utf-8?B?U1hJVHhxelRYNWs1ZW80S3JHTk9hMXA2RVd0eWxPYUdFL1NyUTgzWjhwM01I?=
 =?utf-8?B?MUVuVE9CK0FyRHVkR3RXUlI4MGZIakVPUVgzM2dCQWdEL3VYczVCT2VVRUJE?=
 =?utf-8?B?TUY4cmFoTjVzVTN0M1ArRkVxQVA0b2U4ODRrRUo1Mklac3N3eVYxdnlaWEpO?=
 =?utf-8?B?VlJLTnF1S2V3VkNJOTV0WVZNR1hVWk9ibDV3MjZucEJJalQxUzJvd29OZG9C?=
 =?utf-8?B?Z3p4QXFxMnM2d0JQWWt2QmFsOXEyeU81eEloL2lYMDBsMGduSHlDalJqSGNL?=
 =?utf-8?B?cUlpd2poK0FYdFVCdFBXQUFTS1BRREZDWk1NTUFnZHpEL3B2UTMrTTZtTGJ2?=
 =?utf-8?B?WWovek1zUUFTbHBUbW41ZFhOTElJQXlDaWRYamVtOVMzcUFFajVJb2JyZWFh?=
 =?utf-8?B?VWF3Q2tncFdNMHptY21qT3dvWGt1U05NdXc4Z2kxSVVra1dBOW1SSWpTNE9E?=
 =?utf-8?B?UmxjbWNQZGNsNVRLcExpUGNKSHIzWU1wdThlL3JTVy9LRGMrS0svR2pvRVAx?=
 =?utf-8?B?WS8zT3dac2p5V0U5L1kvZmljRUp2NXliRjdpZ3Z1MG9BRmdKZTNid1pkN1Fn?=
 =?utf-8?B?ZlRIYWxza3VaOGpLUkszQjlXVjlURTYvOGNBMnRqQlJTS3BtVUJGWE1XTkN4?=
 =?utf-8?B?RnFYTWxoZ2psQWhwNWplR1g2aWJqM2piYjRTV0wydTFmbDl1YnR5ZUI5VEo5?=
 =?utf-8?B?RjRacU50YXM4QlB6bDBIVEhESjVBdHF3L0poS2QyKzQvTUZEZ2o4ZWRsVkhV?=
 =?utf-8?B?b2tWcDJSUTJRQmZBZmJOYmFzRkJXVHhvWkxCY04rdm5BMTZPZ0E4a3VOTWp5?=
 =?utf-8?B?d3FhTXBwTUdDa0ZFaDdlQXF3Qk5Wb3l6bUdRQnVYWk9WTjVLejFOdzhiVDZm?=
 =?utf-8?B?N1l5VklHbDEvbUF2ZWV3VkNLUEM4K1NMLzJBekNWRSt4Y29pbmg1TCs2WjNy?=
 =?utf-8?Q?LYkHDwpNxJSoE72w=3D?=
X-Exchange-RoutingPolicyChecked: E1SID/wKds1s1zH06RAlKGaPjSEkHdwgP5kggfmaMtaHio57TPdLrBQ/OEQC31WFasoAGYY1RNT3FIQVr14JuP12rhZnsbI3+W7VjEy56JZc3NtNobl9c5Ly/IYJ/tjL3F0YuynCuHXKGH/dSlh7qz5AzLmkd20xkN7URk/m/+gMMl64tAkpe3D4IR8BkBDn9SIuf+exqAWcFI7sQuFOV4xaPndblpMsrN0882a3Ocijb3DDgLvzZyFkfEfXKI6DDDCLRD02Mba+JfZMh7mUBWUuvvI+5iWz3W7AYB57dCZY8dDn3IEDMSIilcCmY3N0gxEprhKjdMcrHqqzV8WtPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c8a590-9e7a-46dd-d1db-08df475a685d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 23:02:53.5027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxXCxbsdrKQF09YxoR0tza6bTsjWXcKamgt1Vu65vUjpfxxJZiMtfJwIBl9cx0Um5d0ToIdCulHv+Q4bjK2hOTjmoGh+bsFimYqE6U17dwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7198
X-OriginatorOrg: intel.com

On Thu, Nov 19, 2026 at 12:39:26AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential
>issue to consider:
>- [Low] drm/xe/oa: missing Fixes trailer for OA buffer mmap
>  address_space fix
>--
>
>commit 578317c3691785f24541d656435be9897f349165
>Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>> drm/xe/oa: Use the drm device address_space for the OA stream fd
>>
>> anon_inode_getfd() hands back a file whose f_mapping points at the
>> address_space of the kernel-wide singleton anon_inode_inode, shared by
>> every other anon_inode_getfd()/anon_inode_getfile() user in the system.
>> Any code that needs to invalidate userspace mappings of the OA buffer
>> via that mapping (e.g. unmap_mapping_range()) would end up operating on
>> an address_space it doesn't own, with the potential to affect unrelated
>> mappings.
>>
>> Keep the anon inode singleton and only point the file's f_mapping at the
>> drm device's address_space (drm.anon_inode->i_mapping), same as drm_file
>> does for drm fds. f_mapping must be set before the fd is visible to
>> userspace, so reserve the fd with get_unused_fd_flags(), create the file
>> with anon_inode_getfile() and install it with fd_install() after setting
>> f_mapping.
>>
>> To keep the OA buffer mmaps of different streams apart from each other
>> and from GEM mmaps in that shared address_space, reserve a GEM fake
>> offset for the OA buffer with drm_gem_create_mmap_offset(), and move
>> the vma to that offset in xe_oa_mmap() by setting vm_pgoff, the same
>> way drm_gem_prime_mmap() does. f_op->mmap runs before the vma is linked
>> into the address_space, so the vma is tracked at the OA buffer's own
>> range, and drm_vma_node_unmap() on the OA buffer only zaps mappings of
>> that buffer. The TTM fault handler already subtracts the fake offset
>> from vm_pgoff, so faults resolve to the right pages unchanged.
>>
>> drm_dev_unplug() now also zaps OA buffer mmaps along with all other
>> mmaps of the drm device.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>[Severity: Low]
>Without setting file->f_mapping to oa->xe->drm.anon_inode->i_mapping and
>assigning a per-BO fake offset in vma->vm_pgoff, splitting an OA buffer
>VMA triggers WARN_ON(bo->bdev->dev_mapping != vma->vm_file->f_mapping) in
>ttm_bo_vm_open(), non-zero mmap offsets miscalculate page_offset in
>ttm_bo_vm_fault_reserved(), and drm_vma_node_unmap() and drm_dev_unplug()
>fail to unmap OA buffer mappings.
>
>Should this include Fixes tags for the commits that introduced OA buffer
>mmap and switched it to drm_gem_mmap_obj()?
>
>  Fixes: 392bf22238ff ("drm/xe/oa/uapi: OA buffer mmap")
maybe not this one

>  Fixes: 41255b2f1e03 ("drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap")
This one applies and I will add it in the next rev.

Thanks,
Umesh

>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com?part=2
