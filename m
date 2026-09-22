Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE27D46A61D
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099642; cv=fail; b=MIQzHs+bZ8nxjmqLbb+lXKT3y2ha9oQN4afzwojbK0LiwapToRMrNoBQBd324tXFOUINvIx/GxCMHCEzSxTD+nvLZH8qRHtQ3N00cFhgheih81SBook+fOIXqBo4G/l6JRiJ8IKx3RhjRBNUtp7Rvk7eiDgt/mQkpib0rRUr2tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099642; c=relaxed/simple;
	bh=Fne62Zs++4+w6u6QHKHocEkfOL0kVGBq2s1nondZttQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Xzl8DJG90D1wLl0A8k7npQrPhVDD2ilTgoBKjDHtLBE2wz2/2vRfq6KwzNlkw9Zpf3S1AfbKQcPJmEnG3Dxvh/REsaBXwfaQF/Hi1KWewa+mE1Z/4aDLG7VjCDa3wEw6Ln2vv04gO8vJBWEz6yNwWaS4H5DXwJXWNYpXZ7FU0R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFYo9FBX; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFYo9FBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790099635; x=1821635635;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Fne62Zs++4+w6u6QHKHocEkfOL0kVGBq2s1nondZttQ=;
  b=fFYo9FBXe9EKaMYd4kPW5+BuXdyivzwdVMfdwNBxHM20/Jo2UblkBZ0u
   Yl47toMPZ8nqRYHfsNpcSMT66zB0GLk3d8KMFSaWBxxASi/1heroXTwu3
   Ndtl3dn2tbHL/vZS9aKX+4pv1QS+HddUM3RzyAFa1exYwJxSskAfoUpt4
   ofShgHQ5HJzqQfz3/J00auFWqqyqUelYILQfYRyMouESJfcss/4jQwYJf
   oFj5YDy4vR7Cmp4kQrjej6TCdX80Ip9gTK1uDwJ4hRHXqPHAHfp7/oJAg
   U5uESQQGFq3a/VHa9HRcVAv4r2q2CsmHO8bSlh4iiDjFV3namKE55VSF4
   g==;
X-CSE-ConnectionGUID: /WS2aDCkQpKJ8DdXSQ0eJg==
X-CSE-MsgGUID: BkIFtlfTS+ms+36X56h/Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102083449"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="102083449"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:53:53 -0700
X-CSE-ConnectionGUID: WyqwlhaARRGJ5WZ5+aUJsw==
X-CSE-MsgGUID: tdWxdantSw66hqczyUSaog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="272437573"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:53:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 10:53:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 10:53:52 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 10:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJ5M4KuBBn8TxQvdWkP687E5WyVjg2vZfzVRDP4XHd1YBbJgeJJ0ywgMZ0yox21AYBfPJ+iNuRunU1EOZ3tjACW3zdiYcCxWK5XekbI2BBDB1JzFIwy9exSbsnkOW8bL96O4t5JsLa3b4KYMcGNG3/KA+un6TSHWsY2s+MfuD+BLwVqpRUX9oI1p2LoItrQbV25iDn7dBZFxNtuGg0AVJQ4QdXxk9nYfIHRySBXSsTkNmAdjpofSXwod3+PYwNLATEeHiP/OnknMRQaKMExS81wwaaGsLmrFjd3UIacWWehI0FnnsxG6JIRZH4KLs7wKhpl48XjF5Kga7JbaJDFLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fne62Zs++4+w6u6QHKHocEkfOL0kVGBq2s1nondZttQ=;
 b=pPFe/KxykECnRrEMXHbU8e+6ZYO5+0bkGgdiZ4u0x/u2j/FrLhHeNzrLqQrZ7L+m7YWjdooUnqjDnGGWwhXGGnaY3kArq5ykNg2vlY0x6pyZodTkd6Yn3XCvIlwiNDkZB1hEwKAt65PGfWJV0/5sVdWGFLR8NvF6ArwXOQ2OqLSyAyIIf41b2lBDCkZTCqyGB+DTE3RsdPN/5pR3mfl6V+yl+NKr09qfHvLMbapagUldPBDGo45TZn8dU8xZcpgmcMdsQqnfCPoNU8X/g+FKFScqygDErg2nHkylfKByzCkrb4xSlCpfTyiupiU9ZxqMPiXH2UoiQkS3YzFMikhzDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by CO1PR11MB4884.namprd11.prod.outlook.com (2603:10b6:303:6c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 17:53:50 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 17:53:50 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/gsc: Define GSC for NVL-P
Thread-Topic: [PATCH 1/2] drm/xe/gsc: Define GSC for NVL-P
Thread-Index: AQHdRvQ1WuGqm18oBEWEvrWJWssjubbTXRwAgAeLnAA=
Date: Tue, 22 Sep 2026 17:53:50 +0000
Message-ID: <1118fab5df55cecfcadc963c6a7d03da7e3a5288.camel@intel.com>
References: <20260917223042.715286-4-alan.previn.teres.alexis@intel.com>
	 <20260917223042.715286-5-alan.previn.teres.alexis@intel.com>
	 <20260917224016.9B59B1F000FF@smtp.kernel.org>
In-Reply-To: <20260917224016.9B59B1F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|CO1PR11MB4884:EE_
x-ms-office365-filtering-correlation-id: 4f5e1f03-5c00-4ef1-eef1-08df18d2756c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: tgAVUsdlYreV3edmXD+DkycasmwVl+FbAOw+F0tnJfaT1sknfv2Ryo3lqJxj5CYPLiEZZi71pzDAy5kHcbhsvNjnvIdeInoEQe2Ro3236qfjL+CBSAOH61+4ld99VqJNPciEY+U0jxaFa1qi3RwviaXKnzZw0iQViTASWeJMR4hpMwSA6WomPd28nOvEUcLtdElb9aAwfaTBMWM9345o52CgKN2jiLnVqZcNuo96lIgAZQuREvY1s8V8CdkHD4Fx2ZYUlT5bKSUN49LKbxFFi6g0oTwlQPHFy3ognwXpkcA+naXjy7e80II2DMZ4M0MNInHhcFBKMmct1HCk6/8od+2MnLO725DPm54yHV3etx01KsvVxMpkNjh9GPpZU8Vcc78wyeAziwy1Tk8OF/Mu8xARFdx+/JRKAxqCelANGILY+KwYk2cE3dSYv/0RGJyahgDP02cOUyQELyu8mtAirfnrN788qaNkzuBSouJoe5aSsQ9Qw7I5Ng/QK27V31flo0LmDVNon4qku2995IfgrIzX6pBAtTpenYAXsrLWxqliKBqAl8iPPKxlxk0lRO+HvLMrw9PPikxPgByyub+8RDGjviOJutwZq0hGgweooJ2zBiph/7IUcn2r70Y2+9uE0bYAWMkEHR/2Uq//DSHtY6tJKNzHAQTpC9Ti6FHspgs3QOU2jA+lHR1QlJvigoT5Y/zgCFIyAbahO9XjFF/II3hP9vabzvW4ZrZnouonJ2A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR11MB9883.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cCtCYTR5NjFQa0JXWTJVaXh5WlNyb3ZnZHk4VFJOZnl5UmlUZ292ajZHRWhO?=
 =?utf-8?B?UENFNVJkY2tFRkxDYjhLWmtDdy9lbWlrNXBtZzQ3TlBPTjNrNGd1dXRvUWJi?=
 =?utf-8?B?U3F6VDNycm1ub2Jxb0VTaUJmRFU5OFVBd0NiN3l6dXRYK29LeXRTMzA0S0g1?=
 =?utf-8?B?SUpYZlZia0tNSlZxb28xQ1pUMEoxdDVMNHRVN1BTYW5uYXlDTWMvd3E1ZHA3?=
 =?utf-8?B?b0QwWGw0d2t6bXpsUlNPaDZjK0Zvd293ekRMbUVXTXNHU0JTd1AyS0xkWkc4?=
 =?utf-8?B?QWcyKzFKSiszbGFyam5tNW5lRml2Qk9veXd1L3ozekNyTCtYaEU2VmNMTkFW?=
 =?utf-8?B?WUM1eXhKQ3YyaXV6aWEyL2g1ZkJOK3c2c2V3UUlCQzJTeXpwVHBkd2lNNDVX?=
 =?utf-8?B?MmxlQnFNaUpTalhPdkZwU0JlOGZTZFpqS3pPeXEvckd3emt4MUUzWGx4YTI0?=
 =?utf-8?B?cjNwT0JBbVArbGU4TktJTFRtWXdJcEVpWnlLUkJTSFVFSm9iN0Rzei80R2tq?=
 =?utf-8?B?UzJ4MjN4akZBVlhzSy96eitGU0dJUWhHcDU0S2VIY09FN0RCdVlGMHc0Z29z?=
 =?utf-8?B?aEFiV0VhcGRvcE53UzVwMEtrS2pOYTgzdG1uajNRcGcvUTRvSEN5MDIxREhG?=
 =?utf-8?B?cDlFeHg3RlprWkFFQStVMUpSTEVJVWhXN0c0VkZkcWRtc3VhUEFBTXhRQllM?=
 =?utf-8?B?b05weXJhSkRBRGhRbjU2T3dhU2poVk1CRy94LzVXWEFSM0lFaTRIbEtjREdp?=
 =?utf-8?B?VFZQZ3FhTm50bkhaL2RKRzVNQVNManRlTyt6TzNsQTN2SG5nYmFPMXNNUGcr?=
 =?utf-8?B?bHRkOTFUNlp0TXpiWWdtTXRrc2NxSnFrOEtSV2MrYjVKSDNlTlk2cjJ4WE15?=
 =?utf-8?B?aXREUE9nM2NBS2JzTGQxcGJpeFJ3UDdxY3U1VFBrbXJoenYrNG0yK29tQXp6?=
 =?utf-8?B?YU1scWtTYUFKa0JCV1ZmRkhXMlhqUGpLNGxJQWVzMmlreDRoa1g3bitSaXFG?=
 =?utf-8?B?d2NSaE8zdHlDNEVBQTJtdmtkQTFrOHBhMmhFeXdMdEYzSjVjaUg5NzVxVjM2?=
 =?utf-8?B?ejNuMDg4amZmUUVUdjRGSldHcXBYVWY0QkxGbnlma28raTVoN0JZUHV6U3M1?=
 =?utf-8?B?dHR4WFcyVXltWmpTTlFUSzRkU2ZqUEhGU0lpZ1J6Z3JLMEtjT0JRQ0tZeHM4?=
 =?utf-8?B?N25lZ3FWd3gvUGExZ2lWRUNZNjVaNkNxQ3RSRXpZZkxUMklUSEZGMWw2YnBI?=
 =?utf-8?B?VlgwcysrWHFXUjd2MHVsMTNlblB3Wmp1ZlhkREtLMWNqVEJXK0RoSDV2ZVhY?=
 =?utf-8?B?bHpMSEtUTXp6M0M2bzhTSGt0QU1oSzdUd3dWYW5rKzF2T2lJZkpncW85OVhB?=
 =?utf-8?B?aXgvT2QyYk5pVUpWeXdZN1BLdkpRNSsybm96TCtQd2Vva0thMHNPUHQrOGE2?=
 =?utf-8?B?TWxFMWpyZ3JMUHJMY0c4R3lVRSt4dVliRDRRM255NGpLaldJWksvMjlITi9z?=
 =?utf-8?B?b2VaU3lteUxQSHBTK2JBQi9uL3ByMU92TTM1UjF5ZldrNWdSbTRqN045TWNk?=
 =?utf-8?B?bXpSckFmaDN5QW51Vmw2aloyZ1Q1MTdKS1JXaE1MeEIwRmVWaEFFV3lrYzVz?=
 =?utf-8?B?K3M2ckI0LytyK0FiQUlBSXc0UkQvbUhzZFRMQjBHS0JSZ0xuQ0lxL25VamFC?=
 =?utf-8?B?OTlLWklTMndobldCZVRONjRvZ0VVdTczK0xhdElHMExLbTF6UmlVTGtTZnMv?=
 =?utf-8?B?aktFWUlGN3IzcytaQ2pvOWhsRkNJSUpBMFErTDFoM21vSnVnbVc4bjVGUlhk?=
 =?utf-8?B?VGhMME5HMFJsTnNnbCtnbXl0cVE0cUhYckJZZjV5bW41alZOT3k4TlFIYUFO?=
 =?utf-8?B?RmhxejVWNzNMNWVuOGJtT21RSXJnMERwWnZXREpLNTlwa2RRM09hQ1VUbVpI?=
 =?utf-8?B?ZnQ3OGNtdVkwdURnTmZzSWl2aVZhaDFBQkczWGN6eXpoQ2ttNncybHBFVXV2?=
 =?utf-8?B?TDBSemdxVzlHaTBPeWlrRDZOZzZaRk42MkFsbEhDNjJBWGlsTWR5aEdQZVhw?=
 =?utf-8?B?Mk8wQnlQVE5WNk9lSHlYc1hJaXEreEtqS3B2OWMrVkFUNXZybWJXbUFlU2th?=
 =?utf-8?B?RklmTEdJZ3dTeUhFaEVTR05oYTByMk1rRDcxZUNUWFNsWVlTMHJJRTB5dVR1?=
 =?utf-8?B?TWNPeEttWUJXS05lV2JpUm5wc0w0eGlzOHk1bFQzckRnZkRXQ2FRTUp4dWk1?=
 =?utf-8?B?VlBIRGRQakJoQmhTd3UzeEkyeEx6SXF0cGprMzVMNHk2MlliTmdnajEvVUlq?=
 =?utf-8?B?dVpaZjJVcHRTL01KL3RnVCt4M04yZTZydUtPbU9qSW5xNkFJMzlkRUxtRTZP?=
 =?utf-8?Q?bQzpBQFfuFlhQfhu18Vt/0FFRD51BB4EBNg6K?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13AE08DBBD1F9C49AFC78C87A2D10487@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 49ceucGH0KMEPra9x4f+b/syZ03GEUok14EcnW77auLlFY9zwd14J0prmaMhzhKBKBUJ0uXPc5UFM5XFHurpAR3cWJaDuzCqRqleQF06Yd/ta+v2s28wOFPVcDmeFRcNutmJ5243CYh4Mb3mhuSQ855S1c1f+oOs+3nbyeQJtVj76fRZOmsFidt8xPRL+TWJogHWrCax3C8Uddrlxpiw83lINJeCzl/pkrzbNu9UU8xzPuFY+3sRxLJL9HGoHpuuj1nkyhjsaRJM8TYSPA6Azv6bcAzy1za9d7sd2VaGAg2BqxrlSXFLGbF8OjJNmqKjy7ieRSwksO+JzgoRIdQ9rw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5e1f03-5c00-4ef1-eef1-08df18d2756c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 17:53:50.1827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vdvn6bGsiwXrRxKtJ/XQWIejCdo9nsuYyAHVwu/PVGJbaYtX5JSfuDCQxgjNPfS0mrIYTdtsW75qs1n6cq/v+ijuGziaigEUXpThSEdhtK1agiBr64lazGwyLyS6kuvE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4884
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDIyOjQwICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0g
eGU6IEdTQyBmaXJtd2FyZSBsb2FkaW5nIGZhaWxzIGZvciBOT1ZBTEFLRV9QIGR1ZSB0byBhcnJh
eSBvcmRlcmluZw0KPiAtLQ0KYWxhbjpbc25pcF0NCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBXaWxs
IGluc2VydGluZyBOT1ZBTEFLRV9QIGhlcmUgY2F1c2UgdGhlIGZpcm13YXJlIHNlbGVjdGlvbiBs
b29wIHRvIGZhaWw/DQo+IA0KPiBMb29raW5nIGF0IHVjX2Z3X2F1dG9fc2VsZWN0KCkgaW4gZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3VjX2Z3LmMsIHRoZSBsb29wDQo+IHRlcm1pbmF0aW9uIGNvbmRp
dGlvbiBleHBlY3RzIHRoZSBlbnRyaWVzIGFycmF5IHRvIGJlIHNvcnRlZCBzdHJpY3RseQ0KPiBk
ZXNjZW5kaW5nIGJ5IHBsYXRmb3JtIGVudW06DQo+IA0KPiAJZm9yIChpID0gMDsgaSA8IGNvdW50
ICYmIHAgPD0gZW50cmllc1tpXS5wbGF0Zm9ybTsgaSsrKSB7DQo+IAkJLi4uDQo+IAl9DQo+IA0K
PiBTaW5jZSBYRV9OT1ZBTEFLRV9QIChlbnVtIHZhbHVlIDE1KSBpcyBncmVhdGVyIHRoYW4gdGhl
IGZpcnN0IGVudHJ5DQo+IFhFX1BBTlRIRVJMQUtFIChlbnVtIHZhbHVlIDEyKSwgdGhlIGNvbmRp
dGlvbiAoMTUgPD0gMTIpIGV2YWx1YXRlcyB0byBmYWxzZQ0KPiBvbiB0aGUgdmVyeSBmaXJzdCBp
dGVyYXRpb24gd2hlbiB0cnlpbmcgdG8gbG9hZCBmaXJtd2FyZSBmb3IgTk9WQUxBS0VfUC4NCj4g
DQo+IFRoaXMgYWJvcnRzIHRoZSBzZWFyY2ggaW1tZWRpYXRlbHksIGxlYXZpbmcgdWNfZnctPnBh
dGggYXMgTlVMTCBhbmQgZmFpbGluZw0KPiB0byBsb2FkIHRoZSBHU0MgZmlybXdhcmUuDQo+IA0K
PiA+ICAJZndfZGVmKExVTkFSTEFLRSwJR1RfVFlQRV9BTlksCW1ham9yX3Zlcih4ZSwJZ3NjLAls
bmwsCTEwNCwgMSwgMCkpCVwNCj4gPiAgCWZ3X2RlZihNRVRFT1JMQUtFLAlHVF9UWVBFX0FOWSwJ
bWFqb3JfdmVyKGk5MTUsCWdzYywJbXRsLAkxMDIsIDEsIDApKQ0KPiANClRoaXMgaXMgYSB2YWxp
ZCBidWcuIFdpbGwgcmUtcmV2Lg0K
