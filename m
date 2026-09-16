Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC874AA003
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 09:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551249; cv=fail; b=MVGntx3Lkamw1yI1mTx9LwhtY/YNdpuP3Y8W7bXbMkEKHM3jc+InIuVr5MvQdUyXipCKRreH0UzEJ6OvCZMg8bzm79DFfJKq0rGSghMGdjqAjkVVQTnfPtRteGfJaR9/cKqBoy9FqKFaJuzgL7dfTL8tWboLmxIWA1Oo6w4iLHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551249; c=relaxed/simple;
	bh=wAchP7A54MY8IQlDxwMRPyLg+79MOo6KozHpJQ9Zy4w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZsznPYOBH/0uPPt0bM59LLAszsFdYVk7kAqQ499I7ujhwM594Mwu4df5YvRN3h13AFjDyM7gFLd4E+hp9xpFPtre4BozaQvBY2xtsHNpd1pL92H4VuXDRp+fWl3Imiq+dU8tuJOLtFWWl/h6++4Urn/8uauYqjLQgVvN4imQCZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWmdSjfZ; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWmdSjfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789551241; x=1821087241;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wAchP7A54MY8IQlDxwMRPyLg+79MOo6KozHpJQ9Zy4w=;
  b=nWmdSjfZDlZC9XV+4WJzyvLgzFcfE5QnVdAm8JKkBQ0rywolyULsgEz8
   1AhMun/LIrE7470Omxuw1RWUNsJnkZ5Lt6ZtvV1KFMYasQvxD8KHMBLO7
   lMUjMM/CPaAPy0luWK0pDNO9erSpd7m07AvXDSQzmhYglXi6fLaWa2QTz
   JFmtfsULe7sHx0eQvSc3lMuM3cqeT7umda1sC/FVX+aZTOtu5yUILm6NS
   CPeNyEjC8gl7z5nUZ3qh6vro8s8+mvAmLdSlE0Dnco8fo0/E9rpphI8ju
   27/247DNn0XR2p110vUZJbtzqZX9VNLRkJo+RntkV5NkwTY6DtK9y5PW3
   w==;
X-CSE-ConnectionGUID: LWIOBK8kQ/+ZHFJZ2dSm9Q==
X-CSE-MsgGUID: 8lSxr0r8SACxEFFcPkqnnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93625895"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93625895"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 02:33:57 -0700
X-CSE-ConnectionGUID: rZIiLF7BQT6prjCiCrS81g==
X-CSE-MsgGUID: WjCMtPdiRzK7pHQ+wjJtmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270013694"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 02:33:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:33:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 02:33:57 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:33:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaXHYB1ExSoSjbOa8Flyig2VbNZCrD4ZB1/F7mOztibaPErRrE5BXmRbXcnHKNsL0LDEu1XdzouSyJ6HeRCjrmevnq7CIvkW4oWzfecjgW5eNF+rf0JjPCFAq0NnqugtYfQZh+9m6s+pgU81hDWZEkihwryVluHJasZ773i4aR3Fo18mO5OSxlZCixZ22XGlVOZ6Ao9PnFurBvFoc6gS25S7cw87zgbfmFvRvJmHkl74axfP4azcRj+Mv1N+kCmcfVz6M8ONgwMksg6VyDDkTj8IIYvLCNl2+p2EnooHIALM4WdwXYamfm5n3zMy07+N6txg/zPVtlLmg//EjqdLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAchP7A54MY8IQlDxwMRPyLg+79MOo6KozHpJQ9Zy4w=;
 b=pMvabLjgwFzj9oUMB40bh9Df8GIjbr2QUl/328AaoCD4BmPo1l558OgTQUjpAZFFMlZCPlQ6wb2qcFqa9lUcKGkf7RYGGZKbvyUPigLeWn/M/xbx14SpM2UsmX+/BzElTXPxFXrKjUWWTSHlIlw0MDJ7VGrsoZ+t7BEc5eqcFnjFsvEzqfD7uyq4mJbmnJG8QZTAZ2xXeyVPMiWPODFrZdJH8sPevGD5v+rnosILXlYIQojn6PQx4MxAs9iY2FmbJks4itXOEjLcG+vysT0EuIx8gtVmLVvrj2LMrdfFKig0Ge3uGH/msIk5rclROvCe/59X7HLS/VDgBweWzjOE4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA1PR11MB7943.namprd11.prod.outlook.com
 (2603:10b6:208:3fc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 09:33:52 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 09:33:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3 02/10] drm/i915/dp: Limit M/N ratio for DP SST
Thread-Topic: [PATCH v3 02/10] drm/i915/dp: Limit M/N ratio for DP SST
Thread-Index: AQHdRbsrqzGl43imikiPagpakqBXWLbQ7yEAgAACMLA=
Date: Wed, 16 Sep 2026 09:33:52 +0000
Message-ID: <DS4PPFE901A304F5633C597DE3D31EC48CEE3B92@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260916090946.677564-1-suraj.kandpal@intel.com>
 <20260916090946.677564-3-suraj.kandpal@intel.com>
 <20260916092522.9546E1F000FF@smtp.kernel.org>
In-Reply-To: <20260916092522.9546E1F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA1PR11MB7943:EE_
x-ms-office365-filtering-correlation-id: ad1d0859-cace-4fc1-98c3-08df13d59eb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|22082099003|3023799007|38070700021|4143699003|11063799006|10067099003|56012099006;
x-microsoft-antispam-message-info: 6LIpaBhlMQl+s1UxsnOOEQF21iu5NKbGGa0ENZJCf4SpiAHbu0OuV6P9LvKHgDJ7DFj33A7qKDE2UK9h1TvYu591eYzDi6qqMDxQfipcQTxAV/inQ/OtvQtDC/zwBmXqE7OrScFQGyy5pUEfIgtf5kMY9gBF8jo7Sv+ozywXVAp0MPTpq7ag2yyvcKx5mIWzJWdT2x9D+7Mz2ilNyNn6J7xFbM3astWEu8on8VfYQbHzH/lHS7oOdbJp40ZVuzn7wIhhzuL70QYOz/Wv8i/rXUnUrpKm8UlegKuG3eHEPtD16bmimGIOTdkDybOAUiRCT/J1X1IzoUDtkUGKGMf/ezbbsfm3ljtonJ98NrDU82V4afDloOi71GMLnovzjRVL4X1B2scN6O3mP6ZBejLQLSGc8Sic25IH74+EH9aNkDF7lDd/216N/wZgAgClorj5hRMApVA4yrBACK/3xM1MmzEd4lt56jQsi+Aeu+ai8QbOSIrAjW3jsjckWgI+ReQj8JIoXR0xxzd+BKsf8+waA50CQmDzLGKi7MJ2XGgWsculkc0iuLIulEtv1STZGqGCWu9AgzO07X72LcrMd7UCI56MBChVeuMQij9KhCQcCnaEZQbBNJeW4XdPjQ0Qqj2ycODu591b6+1J5GaCuS7IHO3l69XwXRASWNABmzf+auE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFE901A304F.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(38070700021)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L005aFZiL3hvUFgxUWRzaGNpZkdnV3hUaUZXdENrTEEyL3NvOG9odVJndkl6?=
 =?utf-8?B?QW1nMHdtaFhRWmpwTzdsYm5tN1Y1a0lITFBNbWhsVGVSTWMxZ2ozNUJ5YlVi?=
 =?utf-8?B?MFJjV3BoR2lsdTZoRGpZZmlGOWRBK3hGQ0tyRnIyTG9qWmw0ZE5qcnd3elM4?=
 =?utf-8?B?UDlJMFQrQVNnaGd2UW95U1JncEFqVlM3TjRJVHk2V0g2NitSMEFjNjA0aitO?=
 =?utf-8?B?aFd5Qlh5dWZ6RktvSmdMT3p2MXdwZk9PczlaenFYeVdxdUx0S1BKN0tqT1h1?=
 =?utf-8?B?bGYwdWhUL3lhNDlWMUozU25WQnkyMmF6L3NTZ2dvZnl1SzhyQitxaCsvcm1J?=
 =?utf-8?B?VVpCNmJraVVYTmFIbFVZZmFZZ0o5L1I2MStITFZFQlB0VkZtYS80bG5qOThk?=
 =?utf-8?B?WHdYOVpxdjY0UllQSGMzdzZ3aTZoNGRkMWpxK3daenhpUnRJVVdhcDdiMG53?=
 =?utf-8?B?ZWlMQ3JjMWYyc1ZuazNBMUNYTHp5TXNiYzMxN1VrMUF0cjhzYmpEVlN1aUV5?=
 =?utf-8?B?a2NhbHBQTE1GRnVMcmdSRXhIeFFvelhRS3pSWkJaYjFaTWp0Wm4zclprUEQ0?=
 =?utf-8?B?NGk5TXIzK2lWVzhZZmJzb1hBMXYwRmJEenNqOFRwRy8xY29ONWxrUThiSjBy?=
 =?utf-8?B?R0kzZUx0RjRmV2VsUDZtQ2NhWFVQOUpEMlI0YlFUYlNTY1VYS2k3N2VURlNK?=
 =?utf-8?B?VDV2ZnQ2R1kvd0dEZFRscDJMRTlMeWJVQzlvcTM4VngySDgxdW03bjBvcktp?=
 =?utf-8?B?TEtkdnFzNGtlTDdiWWkyUGJ1NngzbWpYRmwzcExVekk4WkZ0Zm5NNThsR0lZ?=
 =?utf-8?B?OE9mSEdnLzBQWmVoQmJCaTZiMnZ4OHRwcEJZYVlGTTZtSmh2WHcwd3ZpZ1hm?=
 =?utf-8?B?am5BVFVpdDVOZ0lMblQ3M1E4NC94dkpHamF6VmgyMGg0NXpUaVg5VzRUWERn?=
 =?utf-8?B?K0xtMXJtYVR0amRIenRQQ3QzSVQ4SUk1a2hQaWV0bThsMExJOW5jSjNxREE2?=
 =?utf-8?B?OUtHNzdIUEN1ZFBxK3V2QlEvaUpFQW5uVDNwSi9nOTZpQThETmFpYVNsc1Z2?=
 =?utf-8?B?QkVLb2JlU0EyMzF2NTBPb3N5UUh0NmRSeVVZS1dDb3FuZHhDNzdqdk9iSldu?=
 =?utf-8?B?M1hGd0puSFBzTlM3NjY4RFlWWEhoQ2FlVytQS1hoVjdobnZlajJVdGJnQ0NE?=
 =?utf-8?B?ZThqWDNUejJyaTVjeXF6L051cW5nZmVyWHhiR05tYzQrZTFFTlR6V0sxOEEv?=
 =?utf-8?B?dUZOb0c1a3BUckJNa0lTQzA4RW93NmdQSUoyaDNkZVF5eUI4Zzd1bEFQVzlr?=
 =?utf-8?B?QkFxZFAvUlEzRjhWdmxuVnlSNml5bEljTVdFeEdzeWN3ZHNVMENIcXN4bkpi?=
 =?utf-8?B?NmZURllaUTZiOThBOG11MWNUS0t2b2lReDU0K3F2cjRNMDRiYzRaL1c4ZFU2?=
 =?utf-8?B?emwyZjUwTjExK255K3JKMi9KTkJBSEZ3akNwV3YzNTVFVS9rRDJoZGJEc1Ex?=
 =?utf-8?B?VjJ2aU1QMjJlN1EyNUhxcTdmeGNRcVJxMFNHcCswbVJMbTRlMEFjYWZxUHB5?=
 =?utf-8?B?Nkcra25OUXQveE5aMld6NlBwMzhNMTFrNTR6dWx1SnRjUWxGSTRCckF2NlBz?=
 =?utf-8?B?RU5SbVVWVGhtWUtyZCtidlgzY0VqWDIzZEZubEl6cTErbW9kSXlWT2ZqVDY4?=
 =?utf-8?B?c2lWV0R0NjlSOThOWGlxMWtnbXF4b3l1UkVYR2J4ZSsvSUtXRW82VVR5Tm9n?=
 =?utf-8?B?eUNyQnJBYXcxeHJkemlWSnFVRkxxWUVEeG9ueDJOY1FwMFB4VFprY2JsT1A4?=
 =?utf-8?B?QnhXc2pBUSsxeHJpUmdEUytRT0dIVVZOd0liZjQxOFJ5bDRhYXRoVEUyYnVv?=
 =?utf-8?B?VmF2dG05TW1kbzRXSlZoL0F2a3FrbWcxbWNkUjM2eGFpYlV0Vk1DY2hITjIz?=
 =?utf-8?B?OTh2cUVMdmtTN1RQMk0rWFA5d3FEQzFCRmpRVDZQUGxEU1hCazNkOXMvMkNt?=
 =?utf-8?B?VGlnMXg2TUpJek1jWDRNWUJpZEM0cndDaWZXbHFBU2VhU3BTaGFJYlppWjJI?=
 =?utf-8?B?ai9YdmI1ZlUwSC9YdGVERkFpc2hSNEUrejhOcU1rcG11WmJoNTR3Z2ZiQk5q?=
 =?utf-8?B?YjVFTUxzUEpmMXJLK1ByckpwdFc3UGVXTzd6bWtJVWE4RHhhei9LMmxKWUwz?=
 =?utf-8?B?b1picGR6VTBEdFhRV2Y5Ky8xTGkwZ0JQbEszcUx1ZU1IOCs1QWRSRTU3NVlD?=
 =?utf-8?B?RFdsYU8ybTJ0UEV0SEU3YmlndFJCT05mb3pMcFhvUHFpc3FVV3B1Z1phamFo?=
 =?utf-8?B?RmFaNDdSWEYveWNhbU5za0R3Qy9JM0pOb3Iway9aZEJvUFBqQmo0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 1wWGsVr842zUcPnsWl62TdJNnvmgcFXvYlfOakBzfwuwyvMed72Vqa6htP7AKvqRLydOzKMr7u+A5ifrhNVOT3Wdw4dOMG5J0MutWqY6KAiwNBkLHNrfYU8jfMz/dD06hwvFinO7+2fi2Zw3tiD9azr+HD0oAQ1oIno3nkluqp1yKpMbGmUKQvIZ+6wLbpGTUVbL60isJjyRniLaylmo6pjJJkVnQmPTebcS7pNsrG7Kj+ZgYyVVZkSk+VRs5B39bC7g69znPJPp+cWjBiIkCJcZ2mER7ppsZEi93zCFidxZUnN6X95kaqpyuewgQvqO4Snxt9xSjniVEaTjLy+9+Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1d0859-cace-4fc1-98c3-08df13d59eb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 09:33:52.1099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XXJXX59CVzfxezU0D+KSkncZxCEuGVwe8EY8XV6PDwH7JTmorwmKh+xwkqxIFdf00ozg06N62OhKt67y34gGxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAyLzEwXSBkcm0vaTkxNS9kcDogTGltaXQgTS9OIHJh
dGlvIGZvciBEUCBTU1QNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNh
c2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvDQo+IGNvbnNpZGVy
Og0KPiAtIFtNZWRpdW1dIGRybS9pOTE1L2RwOiBtb2RlX3ZhbGlkIGFsbG93cyBtb2RlcyB0aGF0
IHdpbGwgZmFpbCBhdG9taWNfY2hlY2sNCj4gZHVlIHRvIGRlY291cGxlZCBNL04gYW5kIGJhbmR3
aWR0aCBjaGVja3MNCj4gLS0NCj4gDQo+IGNvbW1pdCAwNjE2YzExMzI5YjhmOGM1Y2EyNTcwMGVi
NzFjZDIxNTJhMTRmZTU0DQo+IEF1dGhvcjogU3VyYWogS2FuZHBhbCA8c3VyYWoua2FuZHBhbEBp
bnRlbC5jb20+DQo+IERhdGU6ICAgV2VkIFNlcCAxNiAwOTowOTozOCAyMDI2ICswMDAwDQo+IA0K
PiAgICAgZHJtL2k5MTUvZHA6IExpbWl0IE0vTiByYXRpbyBmb3IgRFAgU1NUDQo+IA0KPiBUaGlz
IGNvbW1pdCByZXN0cmljdHMgRGlzcGxheVBvcnQgbGluayBjb25maWd1cmF0aW9ucyB0byB0aG9z
ZSBzYXRpc2Z5aW5nIHRoZQ0KPiBoYXJkd2FyZSBsaW1pdGF0aW9uIGZvciB0aGUgTGluayBNL0xp
bmsgTiByYXRpbyBsaW1pdCBpbiB0aGUgdHJhbnNjb2RlcidzIHRpbWluZw0KPiBnZW5lcmF0b3Ig
RERBLiBUaGUgY29uc3RyYWludCBpcyBjaGVja2VkIGR1cmluZyBsaW5rIHJhdGUgY29uZmlndXJh
dGlvbiBhbmQNCj4gbW9kZXMgZmFpbGluZyB0aGlzIGNoZWNrIGFyZSBwcnVuZWQgaW4gbW9kZV92
YWxpZC4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHAuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5j
DQo+ID4gaW5kZXggMGNkNWU2YjUwMzRjZi4uZjZhMjE1MmM0NDMyYSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gWyAuLi4gXQ0KPiA+IEBAIC0x
MzAwLDYgKzEzMjksMzEgQEAgYm9vbCBpbnRlbF9kcF9kb3RjbGtfdmFsaWQoc3RydWN0IGludGVs
X2Rpc3BsYXkNCj4gKmRpc3BsYXksDQo+ID4gIAlyZXR1cm4gdGFyZ2V0X2Nsb2NrIDw9IGVmZmVj
dGl2ZV9kb3RjbGtfbGltaXQ7ICB9DQo+ID4NCj4gPiArYm9vbCBpbnRlbF9kcF9tb2RlX3ZhbGlk
X21fbihzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLCBpbnQNCj4gPiArcGl4ZWxfY2xvY2spIHsN
Cj4gPiArCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShp
bnRlbF9kcCk7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZHBfbGlua19jYXBzX29yZGVyIG9yZGVyID0g
ew0KPiA+ICsJCS5rZXkgPSBJTlRFTF9EUF9MSU5LX0NBUFNfT1JERVJfS0VZX1JBVEVfTEFORSwN
Cj4gPiArCQkuZGlyID0gSU5URUxfRFBfTElOS19DQVBTX09SREVSX0RJUl9ERVNDLA0KPiA+ICsJ
fTsNCj4gPiArCXN0cnVjdCBpbnRlbF9kcF9saW5rX2NvbmZpZyBsaW5rX2NvbmZpZzsNCj4gPiAr
CXN0cnVjdCBpbnRlbF9kcF9saW5rX2NhcHNfaXRlciBpdGVyOw0KPiA+ICsJYm9vbCBmb3VuZCA9
IGZhbHNlOw0KPiA+ICsNCj4gPiArCWludGVsX2RwX2xpbmtfY2Fwc19pdGVyX3N0YXJ0KCZpdGVy
LCBpbnRlbF9kcC0+bGluay5jYXBzLCBvcmRlciwNCj4gPiArCQkJCSAgICAgIElOVEVMX0RQX0xJ
TktfQ0FQU19GSUxURVJfQUxMKTsNCj4gPiArCWZvcl9lYWNoX2RwX2xpbmtfY29uZmlnKCZpdGVy
LCAmbGlua19jb25maWcpIHsNCj4gPiArCQlpZiAoaW50ZWxfZHBfY2FuX3N1cHBvcnRfbV9uKGRp
c3BsYXksIHBpeGVsX2Nsb2NrLA0KPiBsaW5rX2NvbmZpZy5yYXRlKSkgew0KPiA+ICsJCQlmb3Vu
ZCA9IHRydWU7DQo+ID4gKw0KPiA+ICsJCQlicmVhazsNCj4gPiArCQl9DQo+ID4gKwl9DQo+ID4g
KwlpbnRlbF9kcF9saW5rX2NhcHNfaXRlcl9lbmQoJml0ZXIpOw0KPiA+ICsNCj4gPiArCXJldHVy
biBmb3VuZDsNCj4gPiArfQ0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IFdpbGwgdGhpcyBs
b29wIGNhdXNlIG1vZGVzIHRvIGZhbHNlbHkgcGFzcyBtb2RlX3ZhbGlkIGNoZWNrcyBidXQgbGF0
ZXIgZmFpbA0KPiBkdXJpbmcgYXRvbWljX2NoZWNrPw0KPiANCj4gQmVjYXVzZSBIQlIzIHVzZXMg
OGIvMTBiIGVuY29kaW5nLCBpdCBoYXMgYSBoaWdoZXIgc3ltYm9sIGNsb2NrICg4MTAgTUh6KQ0K
PiB0aGFuDQo+IFVIQlIyMCAoNjI1IE1IeiwgMTI4Yi8xMzJiKS4gVGhpcyBtZWFucyBIQlIzIGNh
biBzYXRpc2Z5IHRoZSBNL04gcmF0aW8NCj4gbGltaXQgZm9yIGEgaGlnaGVyIHBpeGVsIGNsb2Nr
IHRoYW4gVUhCUjIwLg0KPiANCj4gSWYgYSBoaWdoLXJlc29sdXRpb24gbW9kZSAoZS5nLiwgMy4w
IEdIeiBwaXhlbCBjbG9jayBuZWVkaW5nIDQwIEdicHMpIGlzIHRlc3RlZCwNCj4gdGhpcyBmdW5j
dGlvbiBwYXNzZXMgYmVjYXVzZSBIQlIzIHNhdGlzZmllcyB0aGUgTS9OIHJhdGlvLiBTdWJzZXF1
ZW50bHksDQo+IGludGVsX2RwX21vZGVfdmFsaWRfZm9ybWF0KCkgcGFzc2VzIGJlY2F1c2UgaXQg
aW5kZXBlbmRlbnRseSBjaGVja3MNCj4gYmFuZHdpZHRoIGFnYWluc3QgdGhlIGFic29sdXRlIG1h
eCBsaW5rIHJhdGUgKFVIQlIyMCkuDQo+IA0KPiBIb3dldmVyLCBkdXJpbmcgYXRvbWljX2NoZWNr
LCBVSEJSMjAgZ2V0cyBmaWx0ZXJlZCBvdXQgZHVlIHRvIHRoZSBNL04gcmF0aW8NCj4gbGltaXQs
IGFuZCBIQlIzIGdldHMgcmVqZWN0ZWQgZm9yIGxhY2tpbmcgYmFuZHdpZHRoLCBjYXVzaW5nIHRo
ZSBtb2Rlc2V0IHRvDQo+IGZhaWwuIERvZXMgbW9kZV92YWxpZCBuZWVkIHRvIHZlcmlmeSB0aGF0
IHRoZSBzcGVjaWZpYyBsaW5rIHJhdGUgc2F0aXNmeWluZyB0aGUNCj4gTS9OIHJhdGlvIGFsc28g
cHJvdmlkZXMgZW5vdWdoIGJhbmR3aWR0aCBmb3IgdGhlIG1vZGU/DQoNClllcyBpdCBjYW4sIGJ1
dCBJIHRoaW5rIHRoYXQncyB0aGUgcmlnaHQgd2F5IHJvdW5kIGZvciBtb2RlX3ZhbGlkLCBhbmQg
dGhlDQpleGFtcGxlIGRvZXNuJ3QgYWN0dWFsbHkgaGl0IGl0IC0gYXQgMy4wIEdIeiBVSEJSMjAn
cyByYXRpbyBpcyA0LjgsIHNvIGl0DQppc24ndCBmaWx0ZXJlZCBvdXQgYW5kIHRoZSBtb2RlIHdv
cmtzIGZpbmUuIFlvdSBuZWVkIG92ZXIgNi4yNSBHSHogcGl4ZWwgY2xvY2sNCmJlZm9yZSBVSEJS
MjAgZmFpbHMgdGhlIHJhdGlvLCBhbmQgYnkgdGhlbiBIQlIzIHBhc3NlcyB0aGUgcmF0aW8gYnV0
IGNhbid0DQpjYXJyeSB0aGUgYmFuZHdpZHRoLg0KQ2hlY2tpbmcgYm90aCBwZXIgY29uZmlnIHdv
dWxkIG1lYW4gZHVwbGljYXRpbmcgdGhlIGJwcC9EU0Mvam9pbmVyIGxvZ2ljIGZyb20NCmNvbXB1
dGUgY29uZmlnIGluc2lkZSBtb2RlX3ZhbGlkLiBpbnRlbF9kcF9tb2RlX3ZhbGlkKCkgYWxyZWFk
eSBjYXJyaWVzIGEgVE9ETw0KZm9yIHRoZSBzYW1lIGtpbmQgb2YgZGl2ZXJnZW5jZSwgc28gSSdk
IHJhdGhlciBub3QgYWRkIGEgc2Vjb25kIGNvcHkgb2YgaXQuDQpUaGUgZWFybGllciBjb21tZW50
IG9uIHRoaXMgcGF0Y2ggd2FzIHRoZSBvcHBvc2l0ZSBjYXNlLCBwcnVuaW5nIG1vZGVzIHRoYXQg
YQ0KbmFycm93ZXIgYnV0IGZhc3RlciBjb25maWcgY291bGQgZHJpdmUuIFRoYXQgb25lIGlzIHVz
ZXIgdmlzaWJsZSwgc28gSSd2ZSBlcnJlZA0KYXdheSBmcm9tIGZhbHNlIHJlamVjdHMuDQoNClJl
Z2FyZHMsDQpTdXJhaiBLYW5kcGFsDQoNCj4gDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNjA5MDk0Ni42Nzc1NjQtMS0N
Cj4gc3VyYWoua2FuZHBhbEBpbnRlbC5jb20/cGFydD0yDQo=
