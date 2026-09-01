Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9D1379989
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 05:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788239161; cv=fail; b=QcHLs/fvvsEHg9VlarkOXmLmVa7/PcL1CneaadhKxv73nlyIR9W16TVjgkl+cBHMtYiqlKrBxbZHF8Fed+L2M4PpoS3nNZJHcRR7q6QqpQkdsVhhXXgy1oOQW/Hl/F/NclgHmmzcDymg/Fwe52huQlFPTEiJrExd+egUcPhiiLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788239161; c=relaxed/simple;
	bh=AgNP35ttARoL6Nl2WzBZHes14WndtTbPE73EayqZuLw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eXdv27gsA4TRetQr+j6+YB9s7uRzl501CsAkU848/iyI0Xtam5a4AB+LuaS1tsuS1hkpm5DagJImueRZmiiTxE9cr0/zsWBlZvQkTSLMUS9hy9CoRpcXy+gjJcVX78hJAlLSIlmA0sbLLuyG3ZELVK/iSmH5gwjmNAy+mtU3tn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6zEda9/; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6zEda9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788239159; x=1819775159;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AgNP35ttARoL6Nl2WzBZHes14WndtTbPE73EayqZuLw=;
  b=F6zEda9/0sBpR9FPNH0v/lyssZvWy2v+WPitJafXPCD/aHxqb028ARbE
   WMDTJ/TDZd8Ep5Z248VoFdLdoSOMsJsZGEQG7xw6fCiNurQcDKDSJ0BZv
   er6fioUUE4o8EYBqcT8vO6bWi1tBoUijXm6Au6zP+yBIu+v5W79BB17RK
   ZtZBP2Kr6CWIS9rLU3BGK26YhQkQ3YpDT25gBIlDmF2m7/EoZc4hGD3MH
   2T9cHxIOO2LR9+VZUq083mxTp2at3mcSeACMXyjsKgz5yvIGL/mufdUlD
   JebCETINDhTFgimT1ZKPKQ+j9n30BYUHhvhpP22Ifr8PsUpAoIDG15qa4
   w==;
X-CSE-ConnectionGUID: vqcfnNtPTTasPjo+DSc82w==
X-CSE-MsgGUID: pqsj6iKTT6uEBcAGSjj+wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="100008789"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="100008789"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 22:05:58 -0700
X-CSE-ConnectionGUID: KVeVHFDASUKHYE5NLeunuA==
X-CSE-MsgGUID: kogzCO2lSZC5w4LCKPhpOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="293823134"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 22:05:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 22:05:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 22:05:58 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 22:05:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOW7ikoINWwCnhP9rkpjf5bWNFNrgAFZAI2kUD1ZOC+3S45siFROEOlY3sVY6huCBKRglnsX41D4Ccrz161Rb9QWUhYLvKCxi7g0MqETOFGuLxEieMZ7wzFMUv8F1BGBN+JyGSxKjnhOGufdgdjZsoCKl1sSosJhnQWLAl8Tc6eIXhvinimfQbSLrUJ13WV2321McdBUWVpV5zihIEEVhYNh/hC5jGtFpOk2qofmsBkMM9LPV/Kb2zfjS9Z42qwmsaKyu+6okER+gAXWK0xfYanjulqVwoNF6/59DwdxI8yzjNuBDI6IzXN6uShnIzOZGtiFFaxyZ/ExLNT9SBEO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgNP35ttARoL6Nl2WzBZHes14WndtTbPE73EayqZuLw=;
 b=vj+ZTUyng8E5oEEP/uto7FOnfdeevaD/U2mZ5yqh8SVHtmVlvaQtVPhuoJfANu11n5hjfpTCmeGU7QpjqKYsOMI4uoHIt1Zz6oefm5nfY9/ydTDagVK3QkiifWoovB4iO0Ip9cyUg0xhSNZL08OXa6BNSfZB0dJjEKJ87Qkzo0iNnEzTK8OCgtP9l+xEZ6aNVBaLBBXm8N2sN1pKyIwzds6sVIXxA3wy+0vlyReXryW2nD4V2bbbjMJpPDcXOQv44pViv/rapH757S8ddEhFVUsWMIHA+9T7Vifoy47zJS2AsHw7iolAAm+en2Br9KbA5hObRsgqJ58S7+YAIn78vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA2PR11MB5052.namprd11.prod.outlook.com (2603:10b6:806:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 05:05:43 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 05:05:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V19 06/15] drm/xe: Guard teardown paths against purged BOs
Thread-Topic: [PATCH V19 06/15] drm/xe: Guard teardown paths against purged
 BOs
Thread-Index: AQHdORUEhic5gxNruUuo9v3BGxDS9ba3zFQAgAFcT2A=
Date: Tue, 1 Sep 2026 05:05:43 +0000
Message-ID: <DS0PR11MB87182C7034A3D7703694545381A82@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-23-tejas.upadhyay@intel.com>
 <20260831080346.9903D1F000E9@smtp.kernel.org>
In-Reply-To: <20260831080346.9903D1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA2PR11MB5052:EE_
x-ms-office365-filtering-correlation-id: 9bd91969-e243-45af-be71-08df07e6ad13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|6133799003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: LzFFHmpx+qcIGaU/UMdI7VUpCbsk/j2OS2vqvoWFdpsiqaYwUY1nLwoM3NbaOGhlStz3Nkq039DogWF618Nbyg6ERo2zc1Vv2aQt/sTC3sxxibhjA4lBagQkS5pzzXbq5zSLI2Q//K3mVm4pLulwqkyIkiEPfcdb3ln+ABwejdTOwS+JMnjL0lcPNl31GyyY1Vf1APg4CRIfQhg4JWuRMdn/e56TO7Sf+gONKXDA7+FbO/2g8HiI84ahn3aKEMVS/H4Bv4SpMTAAWLfdoD+yfXdWD2kfVy9IwLJWttTVPhxQrkpXM104COmP4oFHTyc7hbM/WHCjGGeehtM14QABqWDslagcBZs0vDmlh5Pw99bGPR20ckE2J4wQUuP6eMcwmBeuIA6nhDJ389FMRKiGIT8WZdfCZdRRZG2PMx+pF4we0XNKomiVkf0dXX5ogZ0L/NHVdOlnrgsgh/hQntPn4NLoQwa8LsqU+hWzsJmTeZJP5p7l4PojqrJllfJEs4As5p0OQE9qLwhUFohKS4Z1Z6t/KBMUepVcBd5sjC+hQvMnb3KZzw7RL7ptmPAbyT2kbv0b2vXGivzBgHiyfcPzutsr5nbigBu0CfkB+2rN/V5Gb+ocI3QhzXREajhYs3RclBaBxWQSDExmGyqQjyAw2iAuFqHzTyN0wYSDVy5a5sk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(6133799003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjBMU1pwU1dWREVPcmpFYTQ5Zm9YQWN2UXltMXBIVTNRWDN3Mm9SNU9ZTUZP?=
 =?utf-8?B?RnlGbEJ1WGdMcmZTbk5DL2ZXcGdUUmV2U0Zsc1dPUERTMlE3SENWWUlZVmJk?=
 =?utf-8?B?U08zS2dHeGdDV1pjdGFWKzQyMFEwK3BuV0o3RHdDS3E5MjRPTHRFejUzRFpw?=
 =?utf-8?B?UTdaaXVmS1d1R09kN2VQQnlXaXlxbGMyNHZ4bWE3blRVK2FtN2N1RnlHNmR3?=
 =?utf-8?B?Rno4b2lIcUREZEVRSWthcUdDWU4vY1cvQVladDBwbjhNaU5LTkRJSGhkMmtp?=
 =?utf-8?B?VytoWGhPZlJQaWRyblgzZnJETEZuK1V0NmJOaE82Ri9qQVhtMzFWajI4Vzg3?=
 =?utf-8?B?c3lGbnV2c0VBWm9RSWNra0FvTmZqM1ovcDJNbXducnRyZHlYUDN0ZExlZlRh?=
 =?utf-8?B?NVVmTzN5SzdVMWkvaUJBRnFtYlFTLzJUVGFBb1ZFQ2t3TFNzVE1RbG1KSXNC?=
 =?utf-8?B?d3ljd1d4QkJpeitVVkw0TEYvNXdCUmk3eEkyMFdoZXlSeHZxRzJNbWhxckVG?=
 =?utf-8?B?T0t3a3g4NlJFZGovSjRCQUUwZTlTWk44MzZGOHN2ZXBNUHlERmhodjJselRH?=
 =?utf-8?B?LzcrODlKdDBRMG5MdTFhWWdidjMyYlNtU2IrZklScUxRdVZuZTA1eWNNMTQ0?=
 =?utf-8?B?WTMrVnBBbHpTbGNBcmhKSFZ6dnFJb1o5a1VFRVN6alNNb2FidUF0aWVXT3I0?=
 =?utf-8?B?eXNKUjdMNGRzTjlEWVpwditaNTlRUDVBbDZhNFU2TlkrN21tWnJpWmFoakdz?=
 =?utf-8?B?dmZuN1h4a0UrTVBzYW52WDM1WW9BRy9lbHY1dm9MNnpXcGZ2WEpkQVhIUTVs?=
 =?utf-8?B?TW1OZjRQeWt5V01wOUFNZVR2QUp2ZXFTYnlVMkd4NU1UTmkxK2d3dlVuaU9u?=
 =?utf-8?B?ZE81UEtpZStPbHpYS3lsTWg1c1ZFVGV2ZlYybTNjby9KazRTWE54Zm5sVEtE?=
 =?utf-8?B?KzduVTQzK0hTdGFRYzdaTllDUzg5SE5qMHhVc1lPaGxwYXp2RkJ1bVJTUVQ3?=
 =?utf-8?B?Qnk3V29XUFpSbXdtZUluaXhsdFBUcktScDZpREhtY1U0NGhNKzU5MGlKaVhl?=
 =?utf-8?B?Y2E1VHdxK1o1R1d6TFJHQjFkamY5aTEvMm5PWVduNHpMTlpXUHM1Tnk4a2Uv?=
 =?utf-8?B?MXgwaUNnVXM2SzhqYityK0IrSnhlZFo0aHJvSk5JYVZLc0dvUFovMDdWcXVz?=
 =?utf-8?B?dWpkWEszbytXZXVmZkE0L1E4ZWN5bExnMWowQ1BsU2NjS0dtc3pJbmxacWF6?=
 =?utf-8?B?QUVZalFtak4wdUFvcXJBQ0RIS2JrMDlNSFdpVmdyVWZjMVJQZnJtZjZjeWJn?=
 =?utf-8?B?ZENrQW95ZThXa3ZKQzJ3aHBMMzVKeEo3dnJaN2FRZVJIanFiV2xtdlRFOFI4?=
 =?utf-8?B?Wk5SZHlSYzJtaXMrNmNUS0lxTE9XQlZKN2VlMEN0UkljVE1kdTNaQllUWDcy?=
 =?utf-8?B?SUFSSjFndEI5bVBOVEIzYU8zUlRRU1JyMkUxa2hvMFRpRXc2WVltLzFGUjZM?=
 =?utf-8?B?eDlBV1k2cXlodnJwbFBRRDRuenVxTCtzTngyd3NJSHpyQ0JtTDBkcHRTVS9v?=
 =?utf-8?B?bVpRbmZSQk51QWQ5LzFjRWZjR3dhOWhOWS8vVnNQbzFRcEFBR3l1NlNJeWth?=
 =?utf-8?B?VCtuRDFHQnovV2Y1UWxoWHpYcW5XOTZVSEkxVUlKaFBLYnl0emtndG01cU8y?=
 =?utf-8?B?cW5uSUgybXNRbnB1dS92dmUwUWhYWmRQRExOTGI4R09wQlNIN0doQmdFRDB5?=
 =?utf-8?B?QUptZ0lmSC9WQkpTS2hWaWhKUXkwMWtpNzdkT2ZzN1FoK0RNN0s1aFlMSXNI?=
 =?utf-8?B?dVNhVFk5eEsrcTcxWkJ2VTUwR3BWN1dmTjRxditSdUJ5NmhzaVVMQmV6dUY2?=
 =?utf-8?B?UGp0c0NSREdhRGR6WThGMVhnTk1iNUFYNkplWmwxeFUrZjZVUGtGdno3OTVB?=
 =?utf-8?B?MHhTUGUwR2hWTkdyMWxDWjdNNGtzSzZ5UENkdU0xTTE5WGQyUWdvQW1MRXhV?=
 =?utf-8?B?NG1QNk5WTTh0WU5xRGdya3lFSmJ1b1JWN2F6bERTc1RRQzJuSXh1dDJ3VjU1?=
 =?utf-8?B?RlgvQStpajF5b0V2bFEzeUZMZU1Yck5KTEpUamtia0ZmYWdyaWZ4czN6TnNq?=
 =?utf-8?B?Tm5Oa2U1WWVVMGF1V1lXZG1zTUVUSXhZMWRnenMrL2VkbTVsZHdVcVRmTlZv?=
 =?utf-8?B?M2Joemc0VENqVFdTV1FBU3dsV1h3Yk9QbzF6Y1RXcWlOKzlTZkJnVkkxQWk1?=
 =?utf-8?B?dWFzeWZFSmlhc0RlVHhHQ01ab2haR3NRSzBCeHZiUHE2Um1kd2tRVXdNbllo?=
 =?utf-8?B?YzR2ZVVkaHAvWS82WHE4VGpQREI5WWNxRjhoUTRJdldVS0dVSDBhUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MKj1OJlebAGmIejuEulAs+gm93Rfy8HZ1qW6B6a3jH/HQZQ5jNq2GvB/O2eC8mzPZflCNLk+ZE78Bgz/XRlVD86HSVM/GPq2dcFQawIbqYpgU7/O2HHegpHM6vg3TchRYwNOwGf1v4E+0ShvY3nwzHj+EnYm+IY95a+625mm8QVSaXlzwEybQabuQqBZo9Nzvi15itbNLXEDv/egRbam/AqSOUMopXoJ7onpSsgjpzLYYLlXMrILXMA3MPeCekuJzzCw1KK2tz75oHO32vf0sCI4iePOl5Dn6ZXmOIo7gCxwn81/Q6wnfQsG6j1KglqWmeWQhNvBru1Jn3HiLvv+7Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd91969-e243-45af-be71-08df07e6ad13
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 05:05:43.7441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJgUSCHxANu8Xq831Ya1QH2asDcnwfyXeu3+cz6g5d/PcN9B8iLO+WlpCUfrXtnTlB2aKzWBZkcmqepcUijzzund/b2OzCJI0XTqvYp0bOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5052
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMzEgQXVndXN0IDIwMjYg
MTM6MzQNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0K
PiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggVjE5IDA2LzE1XSBkcm0veGU6IEd1YXJkIHRlYXJkb3duIHBhdGhzIGFnYWluc3QNCj4gcHVy
Z2VkIEJPcw0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBB
SSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykNCj4gdG8gY29uc2lkZXI6DQo+IC0g
W0hpZ2hdIGB4ZV9ib191bnBpbl9leHRlcm5hbCgpYCBsYWNrcyB0aGUgYHhlX2JvX2lzX3B1cmdl
ZCgpYCBjaGVjaywgbGVhZGluZw0KPiB0byBwaW4gY291bnQgdW5kZXJmbG93IGZvciBETUEtYnVm
IGV4cG9ydGVkIEJPcy4NCj4gLS0NCj4gDQo+IGNvbW1pdCBiMGQ1ZDNmMjE4ODU3MDNmZmUyODFi
ZmMzNjE3NjhhMDIxM2QyNjY4DQo+IEF1dGhvcjogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRo
eWF5QGludGVsLmNvbT4NCj4gDQo+IGRybS94ZTogR3VhcmQgdGVhcmRvd24gcGF0aHMgYWdhaW5z
dCBwdXJnZWQgQk9zDQo+IA0KPiBUaGlzIGNvbW1pdCBhZGRzIHhlX2JvX2lzX3B1cmdlZCgpIGd1
YXJkcyBpbiBzZXZlcmFsIHRlYXJkb3duIHBhdGhzIHRvDQo+IHByZXZlbnQgdW5waW5uaW5nIG9y
IG1hcHBpbmcgYSBidWZmZXIgb2JqZWN0IHRoYXQgd2FzIGFscmVhZHkgcHVyZ2VkIGJ5DQo+IFZS
QU0gcGFnZSBvZmZsaW5pbmcuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ID4gaW5kZXggYzI1NTMy
NzY2OWRhNS4uYjE2Mjc1M2NlYmI3MCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfYm8uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ID4gQEAg
LTMyNjcsNiArMzI2Nyw5IEBAIHZvaWQgeGVfYm9fdW5waW4oc3RydWN0IHhlX2JvICpibykNCj4g
PiAgCXN0cnVjdCB0dG1fcGxhY2UgKnBsYWNlID0gJmJvLT5wbGFjZW1lbnRzWzBdOw0KPiA+ICAJ
c3RydWN0IHhlX2RldmljZSAqeGUgPSB4ZV9ib19kZXZpY2UoYm8pOw0KPiA+DQo+ID4gKwlpZiAo
eGVfYm9faXNfcHVyZ2VkKGJvKSkNCj4gPiArCQlyZXR1cm47DQo+ID4gKw0KPiANCj4gW1NldmVy
aXR5OiBIaWdoXQ0KPiBEb2VzIHhlX2JvX3VucGluX2V4dGVybmFsKCkgYWxzbyBuZWVkIHRoaXMg
eGVfYm9faXNfcHVyZ2VkKCkgY2hlY2s/DQo+IA0KPiBJZiBhIHVzZXIgQk8gaXMgZXhwb3J0ZWQg
dmlhIERNQS1idWYsIHRoZSBWUkFNIHBhZ2Ugb2ZmbGluZSBtZWNoYW5pc20gY2FuDQo+IHF1ZXVl
IGl0IGZvciBvZmZsaW5pbmcuIElmIHRoZSBETUEtYnVmIGltcG9ydGVyIHBpbnMgdGhlIEJPLCB0
aGUgcGluIGNvdW50DQo+IGluY3JlbWVudHMuIFdoZW4gdGhlIFZSQU0gb2ZmbGluZSB3b3JrZXIg
cHJvY2Vzc2VzIHRoZSBxdWV1ZSwgaXQgZm9yY2VmdWxseQ0KPiB1bnBpbnMgYW5kIHB1cmdlcyB0
aGUgQk8sIGxlYXZpbmcgdGhlIHBpbiBjb3VudCBhdCAwLg0KPiANCj4gV2hlbiB0aGUgaW1wb3J0
ZXIgbGF0ZXIgdW5waW5zIHRoZSBCTywgaXQgdHJpZ2dlcnMgeGVfZG1hX2J1Zl91bnBpbigpIHdo
aWNoDQo+IGNhbGxzIHhlX2JvX3VucGluX2V4dGVybmFsKCk6DQo+IA0KPiBzdGF0aWMgdm9pZCB4
ZV9kbWFfYnVmX3VucGluKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCkgew0KPiAJ
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBhdHRhY2gtPmRtYWJ1Zi0+cHJpdjsNCj4gCXN0
cnVjdCB4ZV9ibyAqYm8gPSBnZW1fdG9feGVfYm8ob2JqKTsNCj4gDQo+IAl4ZV9ib191bnBpbl9l
eHRlcm5hbChibyk7DQo+IH0NCj4gDQo+IFNpbmNlIHhlX2JvX3VucGluX2V4dGVybmFsKCkgbGFj
a3MgdGhlIHhlX2JvX2lzX3B1cmdlZCgpIGd1YXJkLCBpdCB3aWxsIGNhbGwNCj4gdHRtX2JvX3Vu
cGluKCkgdW5jb25kaXRpb25hbGx5LiBDb3VsZCB0aGlzIGNhdXNlIGEgcGluIGNvdW50IHVuZGVy
ZmxvdyBvbg0KPiB0aGUgVFRNIEJPIGFuZCBtYWtlIHRoZSBCTyBwZXJtYW5lbnRseSB1bi1ldmlj
dGFibGU/DQoNCnhlX2JvX3Bpbi91bnBpbl9leHRlcm5hbCgpIGlzIG9ubHkgY2FsbGVkIG9uIGV4
cG9ydGVkIEJPcywgd2UgZG8gU0JSIGNvbnNpZGVyaW5nIGl0IGNyaXRpY2FsIEJPLCBzbyB0aGlz
IHNob3VsZCBub3QgaGl0L21hdHRlciBhcyBwZXIgY3VycmVudCB1bmRlcnN0YW5kaW5nLg0KDQpU
ZWphcw0KPiANCj4gWyAuLi4gXQ0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcNCj4g
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODMxMDY0OTQyLjMxNTcyMC0xNy0N
Cj4gdGVqYXMudXBhZGh5YXlAaW50ZWwuY29tP3BhcnQ9Ng0K
