Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792792899;
	b=kdIwlKLu4W/RfTyJfG8NLRyu2o2AxXlid77vkIFCGZy5T4DGTpt2xC6qQC7beTQip7n2
	 Oc5fUo7Jd5NAqlTMqpjrgupThHORtjG9nnji5h/xJf8Ygp1LfeVSBQb/yQU9smLxnF08d
	 Az6EHQwu317svkbT86HBRCjU6Qkf9Vr9ULJmAfMz5WqIP+UHpwYYw3g6kKhKk/qCYqpYy
	 XjJn9b8oWbh1ayl2e+AWgSs77FytlltueCjAEr3c0QwfcMG58pYteZRUDA026Ca8/KO7K
	 bFz4b9o9IHQYxY/QCSKK4m+iYCLUD6w8Ga4mBTiwz3Y3UqVnkNMUYlwxBS7byccGYfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792899;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:Subject:In-Reply-To:References:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=KCRaQdNwhXiN29y1pUzdMM9XcInttjlg16Vc1GHRars=;
	b=gB9DWf1l6t/c87mavwilBA8sFzxss+mE1rdsmgX79JVerJSiOE0SsF76INT2VmjfeuQ4
	 dzWoS0W7yvXW2PyJOcvdhET6NscQB3h0qnkv3GxNK5fX49Yj8FTaMWmLhsdXlY+QC/z4/
	 KbGmaRn6aGX/pW6sbyKgt0QPl16XUklyKxPMtDa2nLe1ht6/h3b1S0iE8QlQtbqPGlD1k
	 gThZy80cmMNT6OTfe9FzCwjK4SthifH1emtnyDTZEmkElm7ccQLbIEP24C+Few2kyaUzN
	 cC7dlJprLCjO+SZJOIA9QxxN7w1r5sCeMr4QS5sOAoDjk98wp8ayyixct9UPdW2JwNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lJsw+CZ8;
	arc=fail smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967B3606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 22:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967B3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lJsw+CZ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792792897; x=1824328897;
  h=from:to:subject:in-reply-to:references:date:message-id:
   content-transfer-encoding:mime-version;
  bh=0T/vC4kt4KGYmpe+sQ7ZrJyCTRrdOuNDxYIL/OD2np0=;
  b=lJsw+CZ8esRRGZ4xvN8JuXfLI4lK3iYgLIqMiXHuCnpuicRflUtlsBva
   WrSzI/xvjt5pv/027/SM9m7CmPsMraiaP3QdvE6m9dUr3Cp9VT7WnbcwN
   VGXz7qgV2oOs9vIA8vt1QweDG9OT+sQMvm7Tyu+N2P4+MALj51Z3rurDS
   PHjTOIQ89eWNVcpTrpudgusfoUGgRmytAKdxI7en/Fa5HkI8CESC5SRXw
   /vrXUJFLQ1b+lOm8TkUsGvKgmtPdcruK9kcpntocbqZP/FJCrKtpHSzL2
   Tg8vByDzPQlV6Ua00iWoUTOd838Mv75Oo1a8NhzdIp+bJpXDQrAxroyOx
   A==;
X-CSE-ConnectionGUID: wyvS8kJoRnC+UFzC5HVVLw==
X-CSE-MsgGUID: ZW5+sLUoShOuYPL7SPyNvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1432347"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1432347"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 15:01:25 -0700
X-CSE-ConnectionGUID: lztQIbpCRMuoVocurmiTIQ==
X-CSE-MsgGUID: TBTn6lRzSBuaFwov+Osmkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5564792"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 15:01:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 15:01:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 15:01:09 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 15:01:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbXowxvxE6bpr64qw3rBJ2tB7Hq4rzFdp4rdEJ4uPh0uIzLT06E3bcbrfdIlnhiMtAWp7sW7qkRdKGH+NK4NBd6MPWtrdPv2JoglSDpucfydEK4zy6fWdr8py6iBDOq5TMiCscCU7fCbDo4zMWLOKRJL1mXSWTGKixEtf+4oSzK/UziWFShAp1KmNlrjHEx6aWH5mbOuZzlh3mZf5rPFL1hnjRiksZpHLm1w+BHbKlHhwgedWUWrttNNyF0GmCQ3xmyiBjii3EKBlPXrzI6lu0rAAEB3T7h7+U2XXb0STTXoaol1nZoW28a+NHf2/7TXQ1keoNK1tQAvQFFH26KfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCRaQdNwhXiN29y1pUzdMM9XcInttjlg16Vc1GHRars=;
 b=xxHk+I6mM0r7NAlg6JeYlr1sF3fzaLSg/gIK8pPROXZZzYsBUPClK9VLXJTT0JT0wL5t+ZwYhdMnjtvspnbMfDu0zzBOjMbVSFtftUG5tV3CIYsVqD+uEdnptlBXtXoGs5erHq8azYcLErKs2vSXv0V/it8mMyx+hw3/xYfkpttG7lwXGFSUXfEOHP1MscbZap4xend3cUI8+V4+3zp2M1DHFhMT/pIg5owrrspatWVKXlbAU6KVriNaEQhFpeF8gajqyTqELEyRxfon7vv9JAZOjIH9vBlZcodiRhjie8/n4m8TVZx6pnsMXcBLlUCQN3m4yomGc9iMdOZ0bHMP8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 22:01:07 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 22:01:06 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/10] drm/xe: Use picosecond as common unit in
 adjust_idledly()
In-Reply-To: <sashiko-outbox-183245@kernel.org>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-3-b0453f79c4e1@intel.com>
 <sashiko-outbox-183245@kernel.org>
Date: Fri, 23 Oct 2026 19:00:58 -0300
Message-ID: <87ld7ohyat.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::20) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d42faa-e995-4dad-2a27-08df31512345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|260925021911599003|260925021311599003|261022075727099003|56012099006|260925022911599003|11063799006|4143699003|261009223027099003|261021123027099003|261021121427099003|10067099003|261022105027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: G1nYrPJ2LpcXbXVMsAth7OjFELNDSSrnKWPkGwRLY3tIYJf3daFGikXPQjWhd4IzVqxkPEh1OI77Glng/mZUrhLfyfFfrf80SWpP3LNcr41Ot1ZvAAoh2Lvweljwj+bBcWQZUckAmu0yK9GdPQIK3AcEQlT5EJbM5VodtMTHwSEtVaKFXM7QunVcW+9MPM9/nGBCtKFvQcW1YJP7Ej/EbXvr9Zm05jvr67NAozgdU8RS5zHJUDXNhmIha8eSAXE2l7HO3y6BC+uJXnxPwWyxyV7Q7EXwhkt3mviBeaX8EcC1inv2EMF60AbeAdgSVeqwSy0B+On9Xu6kIasHFplF3IxWN19M54U53NOtcOiiuThiZmM/QVRExw1cFvEoO+IJH8nDLPEKtkcjIoKZxIATs1oeOlPnL2oKg2ozQaN4Ko7VhRH2l/F4xNUMkSmCL93prHNY9f3ZvDdZIyWoWZqjvE8R4Fyf4L5E+g5OJmxlnnKWzhBgJB45F0dQo6pWug3LveZHyEiP+SsymAOcBgqhu8L6Q2+YjB56L62CVP6KSM1YVgfLk0Qo9hpS4fZJ96lbdPjT+T8btFSzPIjBQQuGh0t/inZX+3HWn9zNryUcsCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5095.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(260925021911599003)(260925021311599003)(261022075727099003)(56012099006)(260925022911599003)(11063799006)(4143699003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(261022105027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDdHU0VtNE0vNDBQRHNPUVZHY2RNWFJWbVlBVmpJakJBM1NJODJOa3VDMUJx?=
 =?utf-8?B?L3FvTWJWNTR0OVd1MHJHd3B6aU5LK2V1QVVJY0x6QllYL1I2K2plUWVRa1BG?=
 =?utf-8?B?N3BUNVdtMUZNWHZQYXVPTHVwc3IwWVBZUDZtYWFkR01GcVhIdlhKOUxBQ05W?=
 =?utf-8?B?TnVCRnUrL1hZYnpGbUhIK1JObXBUL3d6WWJGdTNSbUlHWVh1L3hvdVBQczl3?=
 =?utf-8?B?Rk0rSXdWMzF4aE9oeGkyVkZBQ0JQWXBxRUMwNmtNME54cVI0c0hXbVhXUGpw?=
 =?utf-8?B?bUY0NG9LWTEvMEN0cFl0QjFaMExmK0VldjJRVGl2Y1dvTjhUNUVOVmpJUVhB?=
 =?utf-8?B?SFVmcDFENm44RGFXN1plWTEyV2cxWm5obVlWRTdDYkkrck9FSUdPQ0FPRDh4?=
 =?utf-8?B?ejhlcCtqNGNvTjZEZXQzbHhhdTU3KzYyQjBNbmhuMGFYQWhTbzIyQ3hVSmV4?=
 =?utf-8?B?MStOVUtUOHRYbnM5VEg2UUJoYmtYQ0JpWmY3U3RDVmNNYkpmRzFab2hjcUor?=
 =?utf-8?B?N3g3c2h4TXNDbFA1aU5Qdm02L0dnUFUzK1RuYi9qZUJBM0NvTVRvdk15TUoz?=
 =?utf-8?B?d0JyeFNOOU1YVWNDWVAyVGZpeXNMeXFCNysxL2RscGJBU3FiUlV4L3NHbkEv?=
 =?utf-8?B?MEp4ZjVJWkdwd2pPZGdQbUJXTnBkcWcyaGtPb3RYWlpFMkYwNTdhaHR5UTdD?=
 =?utf-8?B?Z3B4WFZ5Qmw1d2x1T3hCOGVyeUdZY25CZGpoeEJkalhhQ3lOdXRqL2c4Tk9w?=
 =?utf-8?B?QS85UGhEaGQ1UGZodmhreGx3Q2ZkR2RMRXZuQ2YzdGJnbERJTjVvRGl6V1c1?=
 =?utf-8?B?aUZWSXBZR2x6YzZ3K0VBRC82Yng4RHBLLzZIVFB3WDhUSTFPeVcvR0ZUNmQr?=
 =?utf-8?B?YTBWczRyVFBwR1E2UHZqekZOVnRPSzJob2h3UXV5MzB5dmtoNXp5aXRRR0l1?=
 =?utf-8?B?SkY1akpPbVFTTWdEWXNvU0R6S1pwaUV4MCtEU3ZTeDF5Q0h5eFdtZ1JqUzEz?=
 =?utf-8?B?MU1vdit5SGN0eVpTeVZkVTlteUpMTWVKcjNjVlFoVUVNWXRiNjNRaTc0ems2?=
 =?utf-8?B?ek9Zb3Ixd09BQXpKWGl5akR1all2VklvSE9FU3pmNEl0ZmYrcVNqeWh2Zk1q?=
 =?utf-8?B?dDM2ZGdYajlwMkRsWGNYY0orVkx1ZFpTZ2xPWlRYdUU2ZmdxZTgxcE91Nzc0?=
 =?utf-8?B?MTJtNEpPR1NPVHVNZyt0MzQ4bFJVampvUlQ2OHB2TGsyMlVUb2FnOFhUa0Jh?=
 =?utf-8?B?SjJ6WE9TQmk2bWQ4aDFqMEltZzdmQS9RMkNGMVd5VG5pZzgxNVlKZTVQSXpx?=
 =?utf-8?B?cC9PRVZKd3hSZzJ6bU54TVFNbGR4TDZHY2xGbWhEK1hFdzJJeG5FLzBmRTMw?=
 =?utf-8?B?eW1kaTlqT1p5MFVBMTErSnFZbVlWMlhYK2xKcWVoSThPZEdsSzRtYUw1ZDF2?=
 =?utf-8?B?ZXJ6dU9DOEtSUStTZWRINmpSRjQ3bmNPZnMwYXM0ZWgwWUdXOTk2blhPc2xS?=
 =?utf-8?B?enVtVHE4YURvNmlBZDlSOTlzdk5Ib3hjWkEzUDJyL0ltY0VvSEw1aFZOa3M1?=
 =?utf-8?B?YnlKNlQ4T09OZS9pMUlNTUtBNjlONjUra2xkYWdxZ0Y1WXBxTE9QR3dIV2hI?=
 =?utf-8?B?a2w1bjRWL2l0T1k0RjRiVjhwL0xLcnY2R25IRFBaaDlKazNXNDZKR0JSdHlM?=
 =?utf-8?B?Y0pnY05JdWpCMjNhNkZXb1hmbWhoWS84VFFBYXpSdzdtQ2ZKLzNEaDJ3TTFF?=
 =?utf-8?B?RjE1MWdKazhzTTAvQjNZK2QrS3FLQXpLNHUwa1JPNzI4VHRLRnNmSlRRSEY3?=
 =?utf-8?B?MnllSFErY1lnczNBL0FxTjNPNG9CSHJ5Ym1GYVBPTzFJRmpLTmtpUlczMkh0?=
 =?utf-8?B?K2FYdDFhL2NHNmdrQURIdGhtVnZXRW5LRDZOaTQ0bE94UjZJQ1Y3ekRMVHZZ?=
 =?utf-8?B?TW5hWXZUdG9XU1k4ZnRKQVovczVJek9VYkJFSDB5bm83aDNRZ0p1aEw3QkJO?=
 =?utf-8?B?bXNGM0UyVWVHOHlRUkVnRWhQdVoyMEFjT05KV3grOXM1K3JwTnJZT01sU3ZY?=
 =?utf-8?B?SThCZXJWamJFR0Y5bDZnV29HYTVFaFdObDZYcVpqK3ZhOWl0ckVYcGFMYkZB?=
 =?utf-8?B?eDlTalA3dVJVcGtTZUtBUHpZbHR2M0ZBdHJMNjdNakcxZ2MzRXlCVFhick5r?=
 =?utf-8?B?d2JsMGRVYnIwa0pWNU1BUHVHYWpoRDFITnRDbVltNHUxakhESzQyS3hNVkN4?=
 =?utf-8?B?bUd2MUtVZzdZWkdpNnp1UERZUFU5MFc1UndoTHpPVE9yemtsMFhoZEpaaGNQ?=
 =?utf-8?B?WUFubVUxdlEwU1oxTG1QZ3dHTUpYS1FUaXZRSG9qVjd5dmovRGJWUT09?=
X-Exchange-RoutingPolicyChecked: mAuUWz74XKkulIq3Hdti4rYdoAJUuVDd/9M8Pz7vHBeYDtas6o/K0GJwLwB/LrMvYXc6W5cUblPnrxVPXcd6jfCClbx0MiPI1YKJ99njkzoyyzthO1uPA+XX7qHsm1zQzIh4kuxagTmOs4tjzupif1+/ySWEZ7DhgXAtFWVo6w1q1LZN1fJSjAcgm2I0h8sLp/2MeQaovukiH+PXgy50wuBn81k17cCSCUh5YPhlunY2jS4hpeOwur5zLbQlhCHorqKQFhdG/cEFct6SBoZ02Mp/0zwzoY+QgdT6MVWEKdiyhV/Rsx4/bwOKftOiXElKWypp2QZbkHC+MlnBN2XqAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d42faa-e995-4dad-2a27-08df31512345
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 22:01:06.5793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSrPDfQOWcVXWLeHvRf2szPjS+COSCYeJGnAeuNIxXPvYkAHqFpkhHnmD+auV9gKOZPPFZxAmksJJ61EahglEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
X-OriginatorOrg: intel.com

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] drm/xe: 32-bit multiplication overflow in adjust_idledly()
> --
>
> commit 6274ddb08f811b772af3c2cc759b8be4b565872c
> Author: Gustavo Sousa <gustavo.sousa@intel.com>
>
> drm/xe: Use picosecond as common unit in adjust_idledly()
>
> This commit changes adjust_idledly() to use picoseconds instead of
> nanoseconds as the common unit of time to avoid precision loss and
> eliminate extra integer divisions.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_h=
w_engine.c
>> index 6872d1ca656e2..dcc8a6d53c5d0 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -585,17 +585,19 @@ static void hw_engine_init_early(struct xe_gt *gt,=
 struct xe_hw_engine *hwe,
>>  	xe_reg_whitelist_process_engine(hwe);
>>  }
>> =20
>> -static u32 idledly_floor_ticks(u32 idledly_ns, u32 idledly_units_ps)
>> +static u32 idledly_floor_ticks(u64 idledly_ps, u32 idledly_units_ps)
>>  {
>> -	return DIV_ROUND_DOWN_ULL((u64)idledly_ns * 1000, idledly_units_ps);
>> +	return DIV_ROUND_DOWN_ULL(idledly_ps, idledly_units_ps);
>>  }
>> =20
>>  static void adjust_idledly(struct xe_hw_engine *hwe)
>>  {
>>  	struct xe_gt *gt =3D hwe->gt;
>> -	u32 idledly, idledly_hw, idledly_reg_val, maxcnt;
>> +	u32 idledly_reg_val, maxcnt_reg_val;
>>  	u32 idledly_units_ps =3D 8 * gt->info.timestamp_base;
>> -	u32 maxcnt_units_ns =3D 640;
>> +	u32 maxcnt_units_ps =3D 640000;
>> +	u64 idledly_ps, idledly_hw_ps;
>> +	u64 maxcnt_ps;
>>  	bool inhibit_switch =3D false;
>>  	bool wa_applied =3D false;
>>  	bool clamped_below_maxcnt =3D false;
>> @@ -604,29 +606,27 @@ static void adjust_idledly(struct xe_hw_engine *hw=
e)
>>  		return;
>> =20
>>  	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
>> -		u32 mincnt_idledly_ns =3D 5000;
>> +		u32 mincnt_idledly_ps =3D 5000000;
>> =20
>>  		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crys=
tal clock. */
>>  		if (!idledly_units_ps)
>>  			return;
>> =20
>>  		idledly_reg_val =3D xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_=
base));
>> -		maxcnt =3D xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_bas=
e));
>> -
>>  		inhibit_switch =3D idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
>> -		idledly =3D REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
>> -		idledly =3D DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 10=
00);
>> -		idledly_hw =3D idledly;
>> -		maxcnt =3D REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>> -		maxcnt *=3D maxcnt_units_ns;
>> +		idledly_ps =3D REG_FIELD_GET(IDLE_DELAY, idledly_reg_val) * idledly_u=
nits_ps;
>> +		idledly_hw_ps =3D idledly_ps;
>> +
>> +		maxcnt_reg_val =3D xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->=
mmio_base));
>> +		maxcnt_ps =3D REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt_reg_val) * maxcnt_=
units_ps;
>
> [Severity: High]
> Can the multiplications computing idledly_ps and maxcnt_ps in
> adjust_idledly() overflow 32-bit unsigned arithmetic before being widened
> to u64?
>
> In include/drm/intel/reg_bits.h, REG_FIELD_GET() returns a u32:
>
>     #define REG_FIELD_GET(__mask, __val)	((u32)FIELD_GET(__mask, __val))
>
> Because idledly_units_ps and maxcnt_units_ps are both declared as u32,
> both multiplications are evaluated in 32-bit arithmetic before assignment
> to u64 idledly_ps and u64 maxcnt_ps.
>
> For idledly_ps, dropping the (u64) cast that was added in commit
> d864065ea25e ("drm/xe: harden adjust_idledly() against divide-by-zero and
> overflow") means IDLE_DELAY (a 21-bit field, REG_GENMASK(20, 0)) multipli=
ed
> by idledly_units_ps (up to 666,664 ps) wraps around U32_MAX whenever
> IDLE_DELAY is >=3D 6443 ticks.
>
> Similarly, for maxcnt_ps, scaling the unit multiplier from 640 ns to
> 640,000 ps in u32 means IDLE_WAIT_TIME (a 20-bit field, REG_GENMASK(19, 0=
))
> multiplied by maxcnt_units_ps wraps around U32_MAX whenever IDLE_WAIT_TIM=
E
> is >=3D 6711 ticks (~4.29 ms out of its ~671 ms range).
>
> When either product wraps, xe_gt_WARN_ON(gt, idledly_hw_ps >=3D maxcnt_ps=
)
> can trigger spuriously, and the Wa_14025941587 and Wa_16023105232 checks
> can program a corrupted IDLE_DELAY tick count into RING_IDLEDLY.
>
> Should idledly_units_ps and maxcnt_units_ps be declared as u64 (or the
> operands cast to u64 before multiplying)?

Thanks for catching this. I'll make sure to add the cast to u64 to the
operations in v2.

--
Gustavo Sousa

>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-wa_16031=
259911-v1-0-b0453f79c4e1@intel.com?part=3D3
