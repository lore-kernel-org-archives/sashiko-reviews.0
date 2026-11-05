Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793915919;
	b=4chx+Gw1L6Jv7MH6vAcG9/nPbgqM3J8/eNCae8Z69QGZaSZ8p21dG+sg3W7ibmEt0UTc
	 Inv4yevs64BY4rxFs3eSxyUu4ZdpwF6zt1nF5v4+jSf68/HWl8o+Fpy+hupbNltiZ3RSy
	 IyxqioA33c/SuHpcnmr+mMHg8u8VFTTxHsKw81YRS/3JsxkakIfWGEwGO3U6sr9BJkohY
	 564abzBX3997ploVXihl44q/iEfFT3ThLJczGzxuemYi2vzR8uEidBaZT/Rc66DcHO4SV
	 /ow/iyVV72jBXNTSK8cbOSGLXM/Fi3l6eP/codLJOq4NclxjRJXhzSuwytV228pHRiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915919;
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
	bh=La1CO87wUAL/yxP4YgUuO37P8e/0F6z/5qH+LzeT6+M=;
	b=RcXZzQqH600GydpTaIuPLzfw7UIK0vsf0kCbDwHTN5bRTI0RlvmSrICC0eikxC+o0f16
	 DokbbRIrHSCzRXqsW+vbuEiDCmbWDLduu3MttGO4JpXZtH9yldjDJzJON5LwPhLFpJLPr
	 SKHmwHawufNrKPGelFHm8PFAD9EkRTXCUJtIi3iq5NEvu9axP7VC2axm8c1lEKrvrc/Ac
	 b4ym1nwTv73RE9pGEmr1tOQQohbUWo5VCee63+9JbTZYPw6ZPVRHGneCv0mWT2UUuOBaR
	 cYT6yL9Rrix/8BB9tdKULs5SoPJwKgqzCdbrSxZW55Faf/aFO5CnJPhiXIGswNHLWRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="D/jDphIj";
	arc=fail smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AA6606A326
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 21:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63AA6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D/jDphIj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793915918; x=1825451918;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=qgGWlq2qxYWlqCpnQyp1hI5ehbOYk1+ldQ0pchAeW8M=;
  b=D/jDphIjTQqh0al4ThaXoMWzpyEIJ2XbWw07QC5pWwVrric/lIU5LMND
   BCU6EM3fc75NX3Sym0ZMi1L5gjXILtQzJAJXS9eS011rRu1Z657Izkqmm
   qS8t/38IRee5JEXDG6jfnar7t8l0oVAfeo28QtViwy8JLicmiUrmeB29I
   1irNUzsJFbA7rLP17gxI9RecDA4OXFc+gDgU07+OGTLqt5FeVHmNfDJ0r
   7JzRAGdlmketCCK5NrGfungOHZ/GlcDOYTPpwUgs6t9zgKlAgk9lcJep+
   5Hl3Ffvfdn1VyzwqyC2f1U500+6W/ZEr468Mr2oA4PhvHzmJNaTOWvJCl
   w==;
X-CSE-ConnectionGUID: ZZWvbvl4T1+2YVTlfyOjjg==
X-CSE-MsgGUID: XeCEkQLHQUeFYh0E6w+FhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2824546"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2824546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:58:37 -0800
X-CSE-ConnectionGUID: oWvYC+VcQFmBC6dbhr6qGA==
X-CSE-MsgGUID: 0a/QY51DRpeVXoJkzgSpDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7152215"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:58:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 13:58:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 13:58:37 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 13:58:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCLHKrZekiq3VWfLYPe5yArm4ebrJbKqny+li03yxUJGm4AlqkqO3pSaUb8oDeHIhiB+R4Y9gkUsJ9ZndYbRiH7PXjC9UDQZwwzt5AiS7yoxUR36NQoVqw7Np+4qAIQncxRC1NYr4OS5UT7+Gk+/oVEevXyqGRPeg9PEwuhd4YPhxoXh17XYIWanmZU5fIvkwQ1Pm+0pkh7UM4bN/S+anrs6UPen14UII0ph7hfXbHa4/6D8cK4Blfq5Kv6HQxQG2VHdVz1hAJkluI5A+9UwN9eLiD8xED5uP6SohiOAMIDcYSfsIDHjguSGf+VKnXCkBcluS4j9j0ocVNO8+K1EJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=La1CO87wUAL/yxP4YgUuO37P8e/0F6z/5qH+LzeT6+M=;
 b=yAhShs/r0IrE274lzLQj9s6iPLynjKTxqlL3BkQ84+7Yyqse5Mm5oIAll1A9rjgWSlNVnnzkn6TCDFyNVU2x8ybcA4pQhuVxGat0cblY5q+GwKQdK2PMmmw0x98P0ul76JS7wSOYcn/SDhXXgOsmIAzqmzBA1IfGFEd7VQU1w0Ar4sLPLu6hI2wdieWq9p4SsgiNR5A7RbWz6/sdjnF+xJiU+tnGfZQonKH8b4hifPW45FSk7EwzhGdh9jQzyOimwJht8ru+Bk8rqrgHuIydqz0A0oZugpXdgB56ZfN+P/dbYDysb9a4ubDol1mwWDIeJ3Y+59EhoohzgdHiigdR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8) by SN7PR11MB8025.namprd11.prod.outlook.com
 (2603:10b6:806:2dc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 21:58:31 +0000
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f]) by LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 21:58:29 +0000
Message-ID: <87e29c03-6930-430e-bb0d-73ba4b92fff2@intel.com>
Date: Thu, 5 Nov 2026 13:58:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/wedge: request inspection for additional fault
 paths
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261102210242.635207-1-daniel.charles@intel.com>
 <20261102210242.635207-4-daniel.charles@intel.com>
 <sashiko-outbox-194198@kernel.org>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <sashiko-outbox-194198@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0212.namprd04.prod.outlook.com
 (2603:10b6:303:87::7) To LV2PR11MB183078.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV2PR11MB183078:EE_|SN7PR11MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bbf1808-abd3-4583-9dc7-08df3b87ecde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|22082099003|18002099003|261028144727099003|11063799006|5023799004|56012099006|4143699003|261021121427099003|261026121527099003|261102123227099003|261026140227099003|261022105027099003|261009223027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: 31GLFDky81v9SQlDYOxWpnm57ftqsve9HuN7OIXOWvvdLL/AZXqVkTLTdpCXhDldvFq2RCY5TInq2r5zig3t5UQl7n8cfwkYBNhCu6JrW+dkK8NPZYtrDvjyog7bwUfRWeNQWxamm4gR+SqwC+wI0xZL/90JHOLNBkH5AX4Y3I0+85e15/2OjtdemhplnQQl79HwRp+dB0uBQmfZuSGzO3MgmiFb32wiktwN4EG5bPzbRdHLegHSiI3HwtDFmGq9jWeUNF1j+twsDnFViH9ySZP4h2b9+ryiWcWQ6by31I0PbicbHPuzpffvskV4jduHs5kUqSkPvFGDmGvBM12N0NHMR+HjpqSiIWh2yY4n3K+FxRXKSujo/YqAm4o+Go/3swfHL/HxJsHPda3CiER00ZcWy16oowFUB/yey7sW7yChaM76x9PmFl5AiBpK146OCepGQC5uWSbYMRxI/+9q9KZDOByj78MZ3YXRrBH6YrrFsvImPhibYZsb2w/ltAoszg4FN83bZTuCkv4eLwPJxYy6cPITqhspwXtHF0kuz/V4IpWRXa3+OKW54NzFQCIPNk+OOuo7DxTIgpt4bjx43BquwYBp92SdYHyhQH8AdNx2mF4k9bVz9LX09GEtQFKR+s0u7Ir76vXUiMslu0U2BXfxQwjLFvcKeY54KLcZZKU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB183078.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(261028144727099003)(11063799006)(5023799004)(56012099006)(4143699003)(261021121427099003)(261026121527099003)(261102123227099003)(261026140227099003)(261022105027099003)(261009223027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzlPWUtaOTZTS1RlRVNtejBCWWQ3RGc3ZUZ1Qm16TVpPZ0s1NDlyUDNsblZn?=
 =?utf-8?B?VU9TbktkT2F1ajA3UDdjeDFDMkh6eURrSXpNYUF1NHRrNlBkOG5QOUNDbkEr?=
 =?utf-8?B?OFg1TUNOUitMY3pPUnRTbTh1UFFOVU5lUzd6U1JDYXMvZ0FWNGFwUDNUdUIw?=
 =?utf-8?B?WkNnTUlQdU5jZ2Y0YldtR1BUMGNEK29sU1I4amlUT2RaMDBxNTBXMFdBb2xi?=
 =?utf-8?B?QlV2TjhseGp3b0ZuME9mV2E0bGhlYjJOY0tDYWZ6RnQ2ZFBUWnJpLzAxNm5O?=
 =?utf-8?B?WXc5NitQMTh3ajk0RXFBUzk3NUlMb1hKaUtRZitUSUxSNEF1TjJtSHM4aTYy?=
 =?utf-8?B?V3Vpd01ITFJtTlVYSUdsS1NLbVFJcHplVzdJVy9pbWNlMlM4OXR4VCs4dlg5?=
 =?utf-8?B?TXJrejI1dkRKcWdnN0d4ZWt4WnFxY1dhRzAyalM0ZS9PQkJMSm9MVzllUEpl?=
 =?utf-8?B?Vk9tbGhFNklBclFBSi9kc1drRHI2cFdoYnNiUHp4djhUTjlsYUw4WWJBcG1u?=
 =?utf-8?B?NStuUUxDM2x6WnBzdzdwdk9vYm93VlZZVzVFQ3QwT2JhWGk2RGNXVGJVK1l2?=
 =?utf-8?B?bldoWEI4WWswSmwvbHdxcVRlSVpKQWlXdFZQbDVZZks1L1RaUUdMdkoydkph?=
 =?utf-8?B?YVdyQUtjWDREbWtnTEpmYkVCdEZVNTFUa0FaMjRkQTZad2hMWXVYcjZ0RXY1?=
 =?utf-8?B?VnBDNG4rSWhCVGw0NE9LS1pOTURDSWQ5SVAxQkV6ZUVld3JORUZXdmVHNGRp?=
 =?utf-8?B?YVd0alpwcjQvalM2QkVldmRTYklYNmRmREJvVWpMaWthUmd1eTVJMEpER01a?=
 =?utf-8?B?QStEd0I1OEhScHY2dnpUcmtRRHBQa0F4YTlhZVh1aG1kalVWWHZHeXlVTXRG?=
 =?utf-8?B?ei94QkV4TlVLZ2lqS25SNVFPTVdTR3I5dFF4Z2F3VVVicjE3Wi8yK2FtVVlR?=
 =?utf-8?B?a1hoQTI5Ui9kYmdEQkNsdGh2OUlMdzlHd2tqQXdDZVZJK0s2U1BYRFVaMDJx?=
 =?utf-8?B?M1lhNnZMbVdZMFhWM2JnQkd6UUZ2RU1WeCtrc0xGNVJEcndhNlpUc3pXVXUz?=
 =?utf-8?B?Q0s1SkUyYXZaUUNQckkxcU9VWFV6Y2ZBbzg5ZnAvZ2x0bXJYbFZpakxCNlNm?=
 =?utf-8?B?S3RNekUvTzVKNXh3TXRTRFRXR284bW1DdGN2NDZzUFFOdXM3TGRFTngyZE9u?=
 =?utf-8?B?V3dsMnQyVDZ5QkF3eXFzNE5tZ2Iwd3FHOEJRL2FEbnB2bUU5UW1ybG43LzlG?=
 =?utf-8?B?NmZSangwZjlScUR5RE5Nd1FjT3U0NHA3aVdVOGlCT2Y4eDBqZmpycUdUUGwy?=
 =?utf-8?B?ZExUU21rWm11QXpxTmFqeW1kMllNUFp3bFZGdDBtcTBYMFBVT2lLaHMzNGRE?=
 =?utf-8?B?U0RVQ1hObkw3TEhxVGVqcWhZU0FicTlldnpGNGtFa1hQSUd1QXNDTkNiRzZ2?=
 =?utf-8?B?blluRmdqYkhDVmFrVU9rNDlWSDY3RlFSVUZkWkgxbnR1OGN2S0Q0dTN4UlN5?=
 =?utf-8?B?Ym9QMDROUzlaa0VQcWhsNEVvZitla3QySUhseUhrOFNINjFpKzBaUFhwRCtR?=
 =?utf-8?B?bGpDMXd1U3NaREY5ZzJUZnNnbGtCMVpPZ1FiOGVueG1NYVU1UmdveW9wbGF2?=
 =?utf-8?B?RFlsZ2lFTTYzMEU5MTF5dW9qRDROdjlDMkw1NkkwSEJwWlpGTHM4S1Z2V3Fr?=
 =?utf-8?B?bm5YTTN5WGdIZ0JZdjlCYXlKSTRqSnROUWhtaWRPb01YM3FvZGtPb1B2emdP?=
 =?utf-8?B?cTIwWEc5Z25mZUxUZUlnTTVSVWszVHpUVkpYR2tHQVpRL3pYTVFCazVDYTVs?=
 =?utf-8?B?ZmNsYndNNzBaWXlnNDhsZCs4TjVRcEZNK2pXTityQk51WmI0aC9DTmdxNUdi?=
 =?utf-8?B?K3ZaRDdlQk1Sc0t2YmdtOVlBc0N6NnpqV09MK2xPSElPRXBLb2VoUURZYTdq?=
 =?utf-8?B?SFNnc0RpZDNoU2dId1VmWk9jZmZFUHltaUU0VnExU3Frb0JJOUphZ3NpdWdw?=
 =?utf-8?B?N3FRa2ZPWTRrQmhBbm9CbEFUMzU2c1BNc0h3cmVmSGNkdXhmaG92ZE4xbHhr?=
 =?utf-8?B?L3U1TnZNd0NraTc4OUNVbHRZKzZtR0hhYkY5bjdpQmdCVjgxM3N0NHdjOGhn?=
 =?utf-8?B?dkxUZExXSFdPeVBqRkdQd1VMMFRscEVQUGRTK3ZwdEdVYVFFSmRCS1d6dlow?=
 =?utf-8?B?Y0pLeGl3OGRlcmNzT21JWGgzWUVBNnFYbUE5Y2JwT2U0alhybkdlZy84WUdU?=
 =?utf-8?B?TStybmVoTmQ2QTcrU3VKbHEvSzNBbEJkS2RpaFEySzdrY0xPY25wMlVHS3Zp?=
 =?utf-8?B?OGlHcjUvWWFTTHpFQzZDdW1xeU9tWXN2dEU5OFlFbFRld1dQc3BGUnhrZEZ2?=
 =?utf-8?Q?qtkPlnHRNF5ero0Y=3D?=
X-Exchange-RoutingPolicyChecked: O7zq+f81+3oCVREfejUau0UJg93+z2liDWxiWhUHca86h2bUgfqczJjBxkDgaoQ9gf0kDcKzIdTXJf2lqR0zDpQszcQpHQ3UtdWIVLe82rWJV0iNFNWljloN+nx18yMt4Oah5L5zUj2zmZoizZjDt4P4sVMAtDun0Z8v3X98PCU+t//P9RC2RG+NN/p7J4g4UDA3ObFp+bR26rWVSPSvhZr1CgY30FwXyDhDW2YbccU1VSBMtPrzpcZGKo7KPFQs59Ptpg8KkdOoJoUXBsJtEzYsIHeCUw/0SarZ6eIK2lGq0p2llxzJLdoFOpnVaVYJvl4r9VZseogHnsc502ZSPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbf1808-abd3-4583-9dc7-08df3b87ecde
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB183078.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 21:58:29.1631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQh+74SjNNO0NW4IX7oqsAe2D+wl1uROSvyl703YDwIk1uD7xAfCMtLdNmf5sq2BkVEMvabONHTk3Z7CcIqju7WCUrtoiNG+PY3Uf/RAL7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8025
X-OriginatorOrg: intel.com


On 11/2/2026 1:27 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] drm/xe: infinite TDR loop in xe_tlb_inval_fence_timeout() on aborted pause
> - [High] drm/xe: wedge_request() re-runs mode-3 pause after CONTINUE or SKIP
> - [Medium] drm/xe: stale pause_failed in wedge_pause_work() blocks TLB inspection
> --
>
> commit dd97fca485155b946444998386ef977057638b19
> Author: Daniel Charles <daniel.charles@intel.com>
>
> drm/xe/wedge: request inspection for additional fault paths
>
> This commit extends mode-3 wedge inspection to cover unsuccessful pagefault
> service, GuC memory CAT errors, TLB invalidation fence timeouts, and
> MMIO-enabled RAS reset requests. It also adds fallback handling for TLB
> timeout inspection when runtime PM resume fails.
>
>> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
>> index 293929f92eb0f..ffb839c3b7524 100644
>> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
>> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
>> @@ -17,6 +17,7 @@
>>   #include "xe_printk.h"
>>   #include "xe_tlb_inval.h"
>>   #include "xe_trace.h"
>> +#include "xe_wedge.h"
>>   
>>   /**
>>    * DOC: Xe TLB invalidation
>> @@ -84,15 +85,27 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
>>   	int timedout_seqno = 0, seqno_recv = 0;
>>   
>>   	spin_lock_irq(&tlb_inval->pending_lock);
>> -	if (tlb_inval->debug_paused)
>> -		goto out_unlock;
>> +	if (tlb_inval->debug_paused) {
>> +		if (!tlb_inval->debug_pause_pending)
>> +			goto out_unlock;
>> +		if (!READ_ONCE(xe->wedged.pause_failed))
>> +			goto out_rearm;
>> +		tlb_inval->debug_paused = false;
>> +		tlb_inval->debug_pause_pending = false;
>> +	}
>>   	spin_unlock_irq(&tlb_inval->pending_lock);
>>   
>>   	tlb_inval->ops->flush(tlb_inval);
>>   
>>   	spin_lock_irq(&tlb_inval->pending_lock);
>> -	if (tlb_inval->debug_paused)
>> -		goto out_unlock;
>> +	if (tlb_inval->debug_paused) {
>> +		if (!tlb_inval->debug_pause_pending)
>> +			goto out_unlock;
>> +		if (!READ_ONCE(xe->wedged.pause_failed))
>> +			goto out_rearm;
>> +		tlb_inval->debug_paused = false;
>> +		tlb_inval->debug_pause_pending = false;
>> +	}
>>   
>>   	list_for_each_entry_safe(fence, next,
>>   				 &tlb_inval->pending_fences, link) {
>> @@ -106,6 +119,17 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
>>   		drm_err(&xe->drm,
>>   			"TLB invalidation fence timeout, seqno=%d recv=%d",
>>   			fence->seqno, tlb_inval->seqno_recv);
>> +		if (!READ_ONCE(xe->wedged.pause_failed))
>> +			xe_wedge_declare_mode3(xe);
>> +		if (!READ_ONCE(xe->wedged.pause_failed) &&
>> +		    READ_ONCE(xe->wedged.mode) ==
>> +		    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE &&
>> +		    atomic_read(&xe->wedged.declare_pending)) {
>> +			tlb_inval->debug_paused = true;
>> +			tlb_inval->debug_pause_pending = true;
>> +			/* Keep timeout processing until inspection owns the pause. */
>> +			goto out_rearm;
>> +		}
> [Severity: High]
> Can xe_tlb_inval_fence_timeout() get stuck in an infinite out_rearm loop if
> wedge_pause_work() exits without calling xe_tlb_inval_debug_pause() and
> without setting xe->wedged.pause_failed?
>
> When both tlb_inval->debug_paused and tlb_inval->debug_pause_pending are set,
> subsequent runs of xe_tlb_inval_fence_timeout() only exit the re-arm loop if
> debug_pause_pending is cleared by xe_tlb_inval_debug_pause() or if
> xe->wedged.pause_failed becomes true.
>
> However, wedge_pause_work() can finish and reset xe->wedged.declare_pending
> to 0 with pause_failed still false in two ways:
>
> 1. If xe_wedge_prepare_fini() sets xe->wedged.shutting_down = true during
> teardown before wedge_pause_work() reaches the for_each_initialized_gt()
> loop:
>
> drivers/gpu/drm/xe/xe_wedge.c:wedge_pause_work() {
> 	if (READ_ONCE(xe->wedged.shutting_down)) {
> 		if (pm_ref)
> 			goto put_runtime_ref;
> 		goto clear_pending;
> 	}
> 	...
> 	if (READ_ONCE(xe->wedged.shutting_down))
> 		goto put_runtime_ref;
> }
>
> 2. If wedge_pause_work() has already executed its xe_gt_wedge_pause() loop
> and declare_pending is still 1 (for example, after wedge_declare_now() runs
> xe_tlb_inval_reset() on XE_WEDGE_REPLY_CONTINUE, or after a concurrent GT
> reset clears debug_paused while waiting in wait_event_idle()) when another
> TLB fence times out and sets debug_paused = true and
> debug_pause_pending = true.
>
> In both cases, once declare_pending is cleared to 0, debug_paused and
> debug_pause_pending remain true while pause_failed is false. Because
> debug_paused is true, xe_tlb_inval_done_handler() ignores incoming TLB
> completions, and xe_tlb_inval_fence_timeout() re-arms fence_tdr forever
> without signaling the expired fences with -ETIME, hanging callers waiting on
> pending TLB fences during xe_pci_remove().

The timeout worker could keep rearming after the inspection worker
exited if debug_pause_pending remained set. I have to change it to defer 
only
while declare_pending still indicates an active inspection request. When 
the worker is finished, timeout clears stale pause state and resumes 
normal operation.


>> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
>> index f7b2ec9d68863..4ed215991cfe1 100644
>> --- a/drivers/gpu/drm/xe/xe_wedge.c
>> +++ b/drivers/gpu/drm/xe/xe_wedge.c
>> @@ -189,7 +189,8 @@ static void wedge_pause_work(struct work_struct *work)
>>   	if (!pm_ref) {
>>   		xe_warn(xe, "Mode-3 wedge could not retain active runtime PM; resuming for inspection, hardware state may have changed\n");
>>   		if (!xe_pm_runtime_resume_and_get(xe)) {
>> -			xe_err(xe, "Failed to resume device for mode-3 inspection; aborting pause\n");
>> +			xe_err(xe, "Failed to resume device for mode-3 inspection; restoring TLB timeout handling\n");
>> +			WRITE_ONCE(xe->wedged.pause_failed, true);
>>   			goto clear_pending;
>>   		}
>>   	}
>> @@ -197,8 +198,10 @@ static void wedge_pause_work(struct work_struct *work)
>>   	if (READ_ONCE(xe->wedged.shutting_down))
>>   		goto put_runtime_ref;
>>   
>> +	WRITE_ONCE(xe->wedged.pause_failed, false);
> [Severity: Medium]
> Once wedge_pause_work() sets xe->wedged.pause_failed = true on a runtime PM
> resume failure, how is pause_failed cleared for subsequent TLB invalidation
> timeouts?
>
> In xe_tlb_inval_fence_timeout(), xe_wedge_declare_mode3(xe) is guarded by
> !READ_ONCE(xe->wedged.pause_failed):
>
> 	if (!READ_ONCE(xe->wedged.pause_failed))
> 		xe_wedge_declare_mode3(xe);
>
> After xe_tlb_inval_fence_timeout() observes pause_failed == true, clears
> debug_paused and debug_pause_pending, and signals the expired fences with
> -ETIME, nothing resets pause_failed to false except a future execution of
> wedge_pause_work(). Because future TLB invalidation timeouts skip calling
> xe_wedge_declare_mode3(xe) while pause_failed is true, TLB-triggered mode-3
> inspection remains disabled indefinitely after a single failed resume.
>
> In addition, if a later non-TLB fault (such as a pagefault or GuC CAT error)
> calls xe_wedge_declare_mode3(xe) -> wedge_request(), pause_failed is still
> true until wedge_pause_work() is scheduled and reaches WRITE_ONCE(...,
> false), so any concurrent xe_tlb_inval_fence_timeout() will fail pending TLB
> fences with -ETIME instead of pausing them for the new inspection.

The previous behavior allowed a later non-TLB trigger to retry mode-3
inspection after runtime resume failed, even though TLB-triggered 
retries were
suppressed. I have to make this failure terminal for mode 3: the failed 
attempt
retains the existing TLB timeout fallback, and subsequent mode-3 
requests are
rejected.

>>   	for_each_initialized_gt(gt, xe, id)
>>   		xe_gt_wedge_pause(gt);
>> +	WRITE_ONCE(xe->wedged.pause_stopped, true);
>>   
>>   	spin_lock_irqsave(&xe->wedged.mode_lock, flags);
>>   	WRITE_ONCE(xe->wedged.reply, 0);
>> @@ -294,6 +297,39 @@ void xe_wedge_declare_mode3(struct xe_device *xe)
>>   	wedge_request(xe, DRM_WEDGE_RECOVERY_NONE, true);
>>   }
>>   
>> +/**
>> + * xe_wedge_mode3_wait() - Inspect a recoverable PCI error before reset
>> + * @xe: Device with accessible MMIO, kept alive by the caller
>> + *
>> + * Request or join mode-3 inspection and wait for its worker to finish.
>> + * Do not hold mode_mutex while waiting; teardown needs it to abort inspection.
>> + * Waiting has no timeout and can stall recovery and removal of devices in the
>> + * same PCI hierarchy. Other devices can request reset after this callback
>> + * returns; frozen-channel recovery can force reset regardless of our vote.
>> + *
>> + * Return: true if reset must be declined because inspection stopped the GTs,
>> + * the device is wedged, or teardown started. Otherwise, normal recovery may
>> + * proceed.
>> + */
>> +bool xe_wedge_mode3_wait(struct xe_device *xe)
>> +{
>> +	mutex_lock(&xe->wedged.mode_mutex);
>> +	if (READ_ONCE(xe->wedged.mode) !=
>> +	    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE) {
>> +		mutex_unlock(&xe->wedged.mode_mutex);
>> +		return false;
>> +	}
>> +
>> +	if (!READ_ONCE(xe->wedged.pause_stopped) && !xe_wedged(xe))
>> +		xe_wedge_declare_mode3(xe);
> [Severity: High]
> Should wedge_request() also check xe->wedged.pause_stopped and xe_wedged(xe)
> before setting declare_pending and queuing pause_work?
>
> Here in xe_wedge_mode3_wait(), xe_wedge_declare_mode3(xe) is skipped if
> pause_stopped or xe_wedged(xe) is true. However, direct callers of
> xe_wedge_declare_mode3() and xe_wedge_declare() (such as
> xe_pagefault_queue_work() draining additional failed faults in pf_queue,
> xe_guc_exec_queue_memory_cat_error_handler(), or xe_tlb_inval_fence_timeout())
> go straight to wedge_request(), which only checks shutting_down and
> declare_pending.
>
> When wedge_pause_work() finishes after XE_WEDGE_REPLY_CONTINUE or
> XE_WEDGE_REPLY_SKIP and resets declare_pending to 0, any subsequent fault
> calls wedge_request() and queues wedge_pause_work() again:
>
> 1. After XE_WEDGE_REPLY_CONTINUE has already wedged the device and called
> xe_tlb_inval_reset(), a second run of wedge_pause_work() calls
> xe_gt_wedge_pause() -> xe_tlb_inval_debug_pause(), setting
> tlb_inval->debug_paused = true again. Even if the user writes
> XE_WEDGE_REPLY_CONTINUE a second time, wedge_declare_now() returns early at:
>
> 	if (atomic_xchg(&xe->wedged.flag, 1))
> 		return;
>
> without calling xe_tlb_inval_reset(), leaving TLB invalidations permanently
> paused.
>
> 2. Each repeated execution of xe_gt_wedge_pause() -> xe_uc_wedge_declare() ->
> xe_guc_submit_wedge() walks guc->submission_state.exec_queue_lookup and takes
> another reference on every queue via xe_exec_queue_get_unless_zero(q) before
> calling set_exec_queue_wedged(q), whereas guc_submit_fini() only drops one
> reference per wedged queue, leaking xe_exec_queue references.
  Another mode-3 pass after GTs have already been stopped could
repeat queue-wedging work and acquire additional queue references. The 
central
mode-3 request path will reject requests while one is pending, after GT 
stopping,or after a permanent wedge

Preparing version 2

-- 

Daniel.


