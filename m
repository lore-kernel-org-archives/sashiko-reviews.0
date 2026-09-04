Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A852B51C336
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 19:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788550657; cv=fail; b=DYsMsSRTvn12JHMRF86aEAt5xWe/OhbeLRzsZy3GnTyAJnDflOVe4P4lVgbW3iIum6fnCN3xAq88H76eunZmpqfVKbfh3ntToQJZ/Ul3rJPqe7feosT3BJewgY80FyclPdncwrfR/vUHn5+bbw8RRMx1+S1DcRHb5KtATQR8IQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788550657; c=relaxed/simple;
	bh=1l+ePsNgae3kfZjnu6mlweY4BN3FahHNamWtCHYGQzg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NK2OZXhNz2f+yvp087MAP8y0SQ9IaqdIR86ZquFOwcajjaGu9b/VF7iyiMyp9fjKh2M1scewl6Nx3MpP06P3KfqOKoMV/T1PucxNLAVo66cl6Tka07dPk7Oh9SJIUs475sEoQ9aHqJnugNyFrq88ZFMVMgCMiuQggxOuT/o/2XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXyeLRRg; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXyeLRRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788550651; x=1820086651;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1l+ePsNgae3kfZjnu6mlweY4BN3FahHNamWtCHYGQzg=;
  b=gXyeLRRggkloOUo5E4PwvPa9iAK54K/XwtTo16FEfZs8DmkQtT5/DZRG
   2B/W4+x7kp4s0rvwAB11YiK4SRfBr31QkphSLr3007DbyHzoHTmTfnPKI
   2g1ijiAGLFNeDq8ldLknmOLu/aqelqfRFW2y6e1EWUtEDCu6PlsFV3JZ/
   OsNPu2+LDhF4/YUfd1uqmSQQ/SVr3yDs9Xgp8GCt/6CNWeb08uSymQ/5M
   JfK4ZhiC6Y/Vq29N3FRVF65GUxwMOZhMvPlrForHp5Hlu/J1tuKl8mA6J
   7ItNF/KRbiCAmdwnIQcPibLwQ1yjkKiapPJtPa70ZLsgIB26UGA2kojOI
   Q==;
X-CSE-ConnectionGUID: jhEfSvzoRd6RzTq7tjXW9Q==
X-CSE-MsgGUID: ysTFPsPkROSCLlx/PfY9gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="114601858"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="114601858"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 12:37:29 -0700
X-CSE-ConnectionGUID: 6uhRDr2uQdCZqOi4dmLkmw==
X-CSE-MsgGUID: qC0J2PPiSpuVCdJWxSKAdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="293625663"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 12:37:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 12:37:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 12:37:28 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 12:37:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJ+nNN3iNXaA3oStMcXIJFS6QclUn+PiFAa5Kv4X9Xc5HdYU8izULMbvD74aRUh9zJ/QF9ZxXY63F6mgsm+qTlm+rPdOZkZvAhwbEN/181I3thNJkXVuJQxh8ErNA+8oMvwxWn0+vEep96ofmx5CbAakoVblELJw6M+qUhdyLdYg9OJ0XDwuoXy5o1OtkXFsdS71apeRm6UO2nYMT7dTaM44140B91egiREBEEIrhTBk0QJV0Xiyf57eEsGIZSSZctHCgVIOOL0FQX5yFFhPILqw1vFV1d1xIY837mNXkcjeWVzBRPiDDwpimcAoaES+2ANM3BTcYNSLPCK6iI3KIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1l+ePsNgae3kfZjnu6mlweY4BN3FahHNamWtCHYGQzg=;
 b=YJ3gxMzxAystXzwDDRWnfnA1SIYEOS6D8iSJkUD+eYOEkBM5IUHTMZVlr0vy9lfly22F+6OXnN6SylgW2vRZyOZYYJ/+FI+csBwSszFGM2sed6kOtZCN+8+KLp1dP6csTf28cCf8ifY2pA/Cp1aPo77DOmWEF682alEsLp7lQBYozSujpiLqfv4HXjvUFvAtC5wkKO68wFKC3U/Qp5X6L91KIJGKqlTB2982aq3Mu2gJMDr0ZD7sMLXtoGpRjJRfVlD7IW8FE97/M4chchWz64EcYmRsXMhphFtrmXIVgmkQdpbuZPqT6L4OGtfPJoIl8lX5hi88IE2P+qQk5SHWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SA0PR11MB4653.namprd11.prod.outlook.com
 (2603:10b6:806:94::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 19:37:26 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 19:37:26 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 12/18] drm/xe/vsec: Refactor BattleMage PMT defines
Thread-Topic: [PATCH v6 12/18] drm/xe/vsec: Refactor BattleMage PMT defines
Thread-Index: AQHdPJrX1oHLbMEIe0a1csoHxvyRP7a+xCGAgAAMDrA=
Date: Fri, 4 Sep 2026 19:37:26 +0000
Message-ID: <CH3PR11MB04614923358C061642E5B01F90C1B52@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
 <20260904182451.1164868-32-michael.j.ruhl@intel.com>
 <20260904185328.5EC681F00A3D@smtp.kernel.org>
In-Reply-To: <20260904185328.5EC681F00A3D@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SA0PR11MB4653:EE_
x-ms-office365-filtering-correlation-id: 92ffa9b6-d8f6-4a4d-ac6e-08df0abbf355
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|56012099006|4143699003|6133799003|10067099003|22082099003|18002099003|11063799006;
x-microsoft-antispam-message-info: 7WlEuqbZZKVctj0E9VWIYQk9ZneS5VS6ujoiUjcGnaXpgo8ADhPl9sGp8NZD/i8vvD47gJrZVXYhPZ7HdTvAqFRoYrprf+Gf3HbQNiKiXgJk3x99VlfAHrwckH7omuS+Yts0pVBGU0LPQL+QY4Ojlx/pmgGTPJ4w+aMkQb8lt8DSJ9VYYbBnR4CveFawbZSrpqVQ4fPQJNRmhPvF6jIqOxkIf6sdP0obYHFbFFJ2tKkcctpMA1wwoR16/W3bKOB+wi8cs0LdVqy2MHR3LL9x4mdqwQBadpWc7TWB7N4oYVTDrbEGq4cnRljzRa5x3rMiyNxLGmLqdkqsK3tY2Kv4Xwo3U7zM+Df+Pzo5BVHPwUFnqziaRX9ON2DihRHmvgfBlqv+RcyZppfkk/49YKvNIpFkM9zHmErl/5+NuT3NRVUFFwaK5ayfUOWbR6HJShtceobKAnjgwIo9feEFXA3Zs4qrUS3WHzL7CtXaPJokn/+yLcVs2nvgkoQYRaPEnt4dgoDeQg0eR5bqZgNmvra8MjYLv1/gAuB0aKbHQ9zd07nhzwBHdAEMpV8ejXn6vwjVCbX8ah4A10paSV0k9kEgnNhjfWSyLMieksInrvfqSs/PpAkt4vrxqJVnDQkuiP1C2ysZIFFgXMLQbtLZZ049kJ3D3Ptsr8VYQ/OiG/TM8zI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(56012099006)(4143699003)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTR3WlpuTkFjVkgvU0FIK1BLb3VXYVhMYXZEWU52R0Zad0oxTDEzeUdpeUll?=
 =?utf-8?B?UzFCZUZMZmZjallpWVR4TTZVVzZlKzhUS1h5YTZVN0hINDh4RlRiNElNcVps?=
 =?utf-8?B?V3FiS2xucndWZlhPYkd6VGNneXBkZ3MxZ3BrU3QyQ2VGdFVkTUpLQnNzc2RY?=
 =?utf-8?B?TlQ1M2EybVBDSG5sZjdNbUtNcS9KZzhzQ2wwb2xXNi9xRUZJbGh5SmtKODZJ?=
 =?utf-8?B?RFk0a2FvNkZUTWVNYVNaTkxmVEM5OTVDbmNXeVl0Mkptb0gxUFpxSVU4UmpM?=
 =?utf-8?B?ZUVRYVFidTkvT2RHWVJpblpSVEFyeWtGaWFsNDdwMzZaaVhUSm5JaTF1bGNT?=
 =?utf-8?B?dlVEMnR1Q241SEozSnlDK1VNZCtPVkI0eHVLNHBQWk0xdzZra3Myb1BXWDJr?=
 =?utf-8?B?aTFscFBFZ215Vy8vTjR5Q1k4S2lWSHl0M1pqQlJIaW5kQ3RsTHUveFBEMkxI?=
 =?utf-8?B?eFBjd3ozNzRaZ2dUcGVOb3NiSDJsb2l4Q1pFcjBzYytzZGNBeTY4UnpBd243?=
 =?utf-8?B?SytpVDNydXV1VHM4N09mL3BNYW5hWUgvak5vY0hsajEvTzMzN2s4WmRWWWdn?=
 =?utf-8?B?TDZOOTJGdUQ5ckJMRmhvNHVLK3BTMzVsRnJDd2VmZVpQbjFsb1VSSyt2Qmxq?=
 =?utf-8?B?c2srOXA5dklNaGpXc0xrSDd5YXM1anRzWUxDMTV6VmFsS3FsUitBTWYvVUJX?=
 =?utf-8?B?TWhtUmJJbnRRdUZNcWNKOCtYOWpTVGo1MGJiM1hFNjBaOTU1R0FlS2QrSkhV?=
 =?utf-8?B?NXdic3YxaEpTdmZOWCtiT3QvOU5hWGRSS250QmRMYjBjc1hVNnhNRTUrNWdz?=
 =?utf-8?B?Mm0xemtmS1E1MVhScGNzVkx6OS9QUmljemdMcFA0eVFZYjljbHRQMC9Jbmk1?=
 =?utf-8?B?Q2IrY3FWSzhtU3JnOUNzRnRpMFdPeXdaaDBHODl3TjVJZVRINE12UCtKZXJI?=
 =?utf-8?B?S3JObW9lNFl4cW5PZHBtWTJyVXR5SUJJNmZid3pjckpaYzA1YVFyVjgxS3I0?=
 =?utf-8?B?dDVWVEtnZ2pDV2JVeTV4REc2WWltSHpRWDF6ZmFLYU1WcmI0TmN2VnZGWGQz?=
 =?utf-8?B?aXRtc3BXUnFhRGhBeXdkMERSZEtxRUhDOTJMa1dVSThDUTA1MWFUbEd3TzFq?=
 =?utf-8?B?bnV2L2xjNUFXeGZQUzFYNHdTYjdyaTRGTWdFckNtTWQrRGwzbEpIL0tXTDZj?=
 =?utf-8?B?cm5tMmdVRGJ5TGMvNkJHL0FzUXFQVHBqaFB3ckdhMDFhSy85M2RHcmo0L3lt?=
 =?utf-8?B?QjRJWno4UUJiQ3VHL3dKWThEWGU2UWd3cDVIbWFoRDN6ZUhrRUtjMzNLajhG?=
 =?utf-8?B?bXdrMW5nVjVLU1dQZHdQdG9YZ0JITG9XVEp5K2w3dEVPbGVma0dWWEJvNTlI?=
 =?utf-8?B?V1g1ZGpwMkU0RXVGQ2EvYjhnUUNiL3JjVnZLdFdMa3ArUllJVnFPalQ3UWpJ?=
 =?utf-8?B?RndjQVUxVndYZ0xweUI4ekk3SG9ac1lZWjBFWHM4amR2RS9pazQ4Zjc0L0w5?=
 =?utf-8?B?UEVhZ1hGemJNaERuVVhhYXpnKyt0TUhqaEJYS1kwU3gzUTUrNFVUUFlDZEpH?=
 =?utf-8?B?ZGV6VzMrTHJJdUFvWDc0MWJOc0NaNmszUjZTZGFHQ1cranhkUVEyRmttT2hH?=
 =?utf-8?B?bUU2WjRmUEVXem12OGZldUY5ZTNmdlFWUmF1KzIrZ1JHeW1FQXVXTXNZbG5o?=
 =?utf-8?B?SUFTWDJBM2l1VTBrVVJSTEtrYnJEcVc0WWVTcm1tcEsvckxwL1FWWnJqL21O?=
 =?utf-8?B?eGQ4dWJNcEhkcHJMLzFGSmRFMnd2SU4yRW5XT1Fkd2N4Q0dxazI2VjRYU1l2?=
 =?utf-8?B?ODY1MXlRa1RTZmxKRmlqaUVCR0k2WnN4ZmhodEx6aWdnemZ5VlBXLzlTd0pn?=
 =?utf-8?B?SThicTdId0VkdDJtUFFPU2dPYkZvTFh3U3lBaWw4bjd6a2pHdHlVdkpHSTVE?=
 =?utf-8?B?NFJTRVE2QUdnUkJ2dXgzb0paTGlTaUcxZ1FHdTRJd0ZlVWN3bHZDQkR3b1F0?=
 =?utf-8?B?SnR5NnZhYW8xekRiLytveVY2WE9wQjdrTlN0OWdZNGFGc3F6blR2a0RIUnd4?=
 =?utf-8?B?V3N1VGhpa1hBR3ZidDRlcFFNdFdvV1JZMjBNT0pTVXNOS205NTA0bXlsSk94?=
 =?utf-8?B?eGltOWJWSzl1NnZuUFl1MlNhVnB5ZVJNMDV3YWZ0VmZMaDd4djJqTVZ1aE9M?=
 =?utf-8?B?S3d2NUNQR0ZWdkoxSlhmQncvVWcwWldLQzZRdFAxMTJlbFRXK29NbVNTRzJu?=
 =?utf-8?B?d0lFR2FnVGJzV1A0Yisra2tNYkQvcWQxRHpVTTh4dW5lU3lYVGx3K29ES3hw?=
 =?utf-8?B?L0o1cjlQVC9QMmpVWlZWOXpNaE9rWEpURnJYUDlKSm5WUG1SU24vdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mMFPnmiagcD4ZvNrKzBDNWLiPcLdwmrPxjYfuaOZ/PN//AYOeYvRaryqGSigzFKKga4+YrNBr5qF1OCfUjd9+FeVuZ66LwIyArSKttxU6DdeGETGN1Wq+TIVFjm1YBeEu1eLH1M1LAf/3byo3RpqaoG/6UpFXbncWnbFmG0UCCacnzPAJCkG8J4YUw2j9TYqbLgIbYjBporzb9q2YWDvf5PqFtHWSzTBvm4Kuv43I7DjT/vdNf2DB5IFjMrGVsrKO34bGzohp+RGMxWYtW+hIMOq+GrqgV3FApOA75yve5DzfVKpePiDnX3GBZvfyg78P+oQiubAKD62Ur+HPjyCyg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ffa9b6-d8f6-4a4d-ac6e-08df0abbf355
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 19:37:26.6912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +5TpbThRhAfA42aXBnHXO9OtO47wxyrvUYfrDNewy+RWY7taSzvo5FqVP34ZGnl5j4CrDu+J3JBWbNcuRjPKe7BNMkKe2td+9c6W27nAuZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4653
X-OriginatorOrg: intel.com

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPlNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDQs
IDIwMjYgMjo1MyBQTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVs
LmNvbT4NCj5DYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogUmU6
IFtQQVRDSCB2NiAxMi8xOF0gZHJtL3hlL3ZzZWM6IFJlZmFjdG9yIEJhdHRsZU1hZ2UgUE1UIGRl
ZmluZXMNCj4NCj5UaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAyIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPmNvbnNpZGVyOg0KPg0KPk5ldyBp
c3N1ZXM6DQo+LSBbSGlnaF0gVW5pbml0aWFsaXplZCBgeGUtPnBtdC5iYXNlX29mZnNldGAgY2F1
c2VzIGB4ZV9wbXRfdGVsZW1fcmVhZCgpYCB0bw0KPnJlYWQgZnJvbSB0aGUgd3JvbmcgTU1JTyBh
ZGRyZXNzIHdoZW4gYWNjZXNzZWQgYmVmb3JlIGB4ZV92c2VjX2luaXQoKWANCj5jb21wbGV0ZXMu
DQo+DQo+UHJlLWV4aXN0aW5nIGlzc3VlczoNCj4tIFtIaWdoXSBDcmFzaGxvZyBjb250cm9sIHN5
c2ZzIGF0dHJpYnV0ZXMgcGVyZm9ybSBkaXJlY3QgTU1JTyByZWFkcy93cml0ZXMgb24NCj5YZSB3
aXRob3V0IHdha2luZyB0aGUgZGV2aWNlLCByaXNraW5nIGhhcmR3YXJlIGhhbmdzLg0KPi0tDQo+
DQo+Y29tbWl0IDU4NGI0Y2FhNmEzZWNjNWYyZTkzOTE5YzViMWNiNmFiMDllMDY1NGMNCj5BdXRo
b3I6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KPg0KPmRybS94
ZS92c2VjOiBSZWZhY3RvciBCYXR0bGVNYWdlIFBNVCBkZWZpbmVzDQo+DQo+VGhpcyBjb21taXQg
cmVmYWN0b3JzIFBNVCBkZWZpbml0aW9ucyBmb3IgQmF0dGxlbWFnZSBhbmQgaW50cm9kdWNlcyBh
DQo+Y29uZmlndXJhYmxlIGJhc2Ugb2Zmc2V0IHRvIHN1cHBvcnQgbXVsdGlwbGUgcGxhdGZvcm1z
LiBJdCBtb2RpZmllcyB0aGUNCj5QTVQgdGVsZW1ldHJ5IHJlYWQgcGF0aCB0byB1c2UgdGhlIG5l
dyBvZmZzZXQgcmF0aGVyIHRoYW4gYSBoYXJkY29kZWQgbWFjcm8uDQo+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92
c2VjLmMNCj4+IGluZGV4IGE5YmFmMGJmZTU3MmMuLjAzMWMxYzBhZTU3MDYgMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdnNlYy5jDQo+WyAuLi4gXQ0KPj4gQEAgLTE0MCwzNyArMjAxLDc5IEBAIHN0YXRp
YyBpbnQgeGVfZ3VpZF9kZWNvZGUodTMyIGd1aWQsIGludCAqaW5kZXgsDQo+dTMyICpvZmZzZXQp
DQo+WyAuLi4gXQ0KPj4gIGludCB4ZV9wbXRfdGVsZW1fcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHUzMiBndWlkLCB1NjQgKmRhdGEsIGxvZmZfdA0KPnVzZXJfb2Zmc2V0LA0KPj4gIAkJICAgICAg
dTMyIGNvdW50KQ0KPj4gIHsNCj4+ICAJc3RydWN0IHhlX2RldmljZSAqeGUgPSBrZGV2X3RvX3hl
X2RldmljZShkZXYpOw0KPj4gLQl2b2lkIF9faW9tZW0gKnRlbGVtX2FkZHIgPSB4ZS0+bW1pby5y
ZWdzICsNCj5CTUdfVEVMRU1FVFJZX09GRlNFVDsNCj4+ICsJdTMyIGNhcF90eXBlID0gRklFTERf
R0VUKEdVSURfQ0FQX1RZUEUsIGd1aWQpOw0KPj4gKwl2b2lkIF9faW9tZW0gKnRlbGVtX2FkZHIg
PSB4ZS0+bW1pby5yZWdzICsgeGUtPnBtdC5iYXNlX29mZnNldDsNCj4NCj5bU2V2ZXJpdHk6IEhp
Z2hdDQo+RG9lcyB0aGlzIHJlYWQgZnJvbSB0aGUgd3JvbmcgTU1JTyBhZGRyZXNzIGR1cmluZyBl
YXJseSBwcm9iZT8NCj4NCj5EdXJpbmcgZGV2aWNlIGluaXRpYWxpemF0aW9uIGluIHhlX2Rldmlj
ZV9wcm9iZSgpLCB4ZV9od21vbl9yZWdpc3RlcigpIGlzDQo+Y2FsbGVkIGJlZm9yZSB4ZV92c2Vj
X2luaXQoKS4gVGhlIGh3bW9uIHJlZ2lzdHJhdGlvbiBzeW5jaHJvbm91c2x5IHJlYWRzIHRoZQ0K
PmluaXRpYWwgZW5lcmd5IHZhbHVlIHRocm91Z2ggdGhpcyBjYWxsIGNoYWluOg0KPg0KPnhlX2h3
bW9uX3JlZ2lzdGVyKCkNCj4gIHhlX2h3bW9uX2VuZXJneV9pc192aXNpYmxlKCkNCj4gICAgeGVf
aHdtb25fZW5lcmd5X2dldCgpDQo+ICAgICAgeGVfcG10X3RlbGVtX3JlYWQoKQ0KPg0KPlNpbmNl
IHhlLT5wbXQuYmFzZV9vZmZzZXQgaXMgbm90IGluaXRpYWxpemVkIHVudGlsIHhlX3ZzZWNfaW5p
dCgpIGlzIGNhbGxlZA0KPmxhdGVyIGluIHRoZSBwcm9iZSBzZXF1ZW5jZSwgaXQgd2lsbCBzdGls
bCBiZSAwIGhlcmUuIFRoaXMgd291bGQgY2F1c2UgYW4NCj5vdXQtb2YtYm91bmRzIE1NSU8gcmVh
ZCAoeGUtPm1taW8ucmVncyArIDAgKyBvZmZzZXQpIHRoYXQgbWlzc2VzIHRoZQ0KPlNPQ19CQVNF
IG9mZnNldCBlbnRpcmVseSwgcG90ZW50aWFsbHkgdHJpZ2dlcmluZyBhIG1hY2hpbmUgY2hlY2sg
ZXhjZXB0aW9uDQo+b3IgaGFuZ2luZyB0aGUgc3lzdGVtLg0KDQpIbW0sIHRoaXMgaXMgYSByZWFs
IHByb2JsZW0uICBOb3Qgc3VyZSBob3cgdG8gZml4IHRoaXMgeWV0Lg0KDQpXaWxsIG5lZWQgdG8g
cG9uZGVyLg0KDQptDQoNCg0KPlsgLi4uIF0NCj4+IEBAIC0yMTAsNiArMzEzLDkgQEAgdm9pZCB4
ZV92c2VjX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+Pg0KPj4gIAlzd2l0Y2ggKHBsYXRm
b3JtKSB7DQo+PiAgCWNhc2UgWEVfVlNFQ19CTUc6DQo+PiArCQlpZiAoSVNfU1JJT1ZfVkYoeGUp
KQ0KPj4gKwkJCXJldHVybjsNCj4+ICsJCXhlLT5wbXQuYmFzZV9vZmZzZXQgPSBCTUdfVEVMRU1F
VFJZX09GRlNFVDsNCj4+ICAJCWluZm8tPnByaXZfZGF0YSA9ICZ4ZV9wbXRfY2I7DQo+PiAgCQli
cmVhazsNCj4NCj5bU2V2ZXJpdHk6IEhpZ2hdDQo+VGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1
ZSwgYnV0IGRvZXMgdGhlIGxhY2sgb2YgLnJlYWRfcmVnIGFuZCAud3JpdGVfcmVnDQo+Y2FsbGJh
Y2tzIGluIHhlX3BtdF9jYiByaXNrIHVuY2xvY2tlZCBNTUlPIGFjY2Vzc2VzPw0KPg0KPlRoZSBj
cmFzaGxvZy5jIGRyaXZlciBpbXBsZW1lbnRzIHN5c2ZzIGF0dHJpYnV0ZXMgKGUuZy4sIGNsZWFy
LCB0cmlnZ2VyKQ0KPnRoYXQgcmVhZCBhbmQgd3JpdGUgUE1UIGNyYXNobG9nIGNvbnRyb2wgcmVn
aXN0ZXJzLiBJZiB0aGUgcGFyZW50IGRyaXZlcg0KPmRvZXNuJ3QgcHJvdmlkZSAucmVhZF9yZWcg
YW5kIC53cml0ZV9yZWcgY2FsbGJhY2tzLCBwbXRfY3Jhc2hsb2dfcmVhZF9yZWcoKQ0KPmFuZCBw
bXRfY3Jhc2hsb2dfcm13KCkgZmFsbCBiYWNrIHRvIGRpcmVjdCByZWFkbCgpIGFuZCB3cml0ZWwo
KSBvbiB0aGUNCj5tYXBwZWQgTU1JTyByZWdpb24gKGVudHJ5LT5kaXNjX3RhYmxlKS4NCj4NCj5T
aW5jZSB4ZV9wbXRfY2Igb25seSBwcm92aWRlcyAucmVhZF90ZWxlbSwgcmVhZGluZyBvciB3cml0
aW5nIHRoZXNlIHN5c2ZzDQo+YXR0cmlidXRlcyB3aGlsZSB0aGUgWGUgZGV2aWNlIGlzIHN1c3Bl
bmRlZCAoRDNjb2xkKSB3aWxsIHRyaWdnZXIgdW5jbG9ja2VkDQo+TU1JTyBhY2Nlc3NlcyB3aXRo
b3V0IHdha2luZyB0aGUgZGV2aWNlIHZpYSBydW50aW1lIFBNLiBUaGlzIGNhbiBjYXVzZSBQQ0ll
DQo+VW5zdXBwb3J0ZWQgUmVxdWVzdCBmYXVsdHMgb3Igc3lzdGVtIGhhbmdzLg0KPg0KPkNvdWxk
IC5yZWFkX3JlZyBhbmQgLndyaXRlX3JlZyBiZSBpbXBsZW1lbnRlZCBmb3IgQmF0dGxlbWFnZSB0
byBlbnN1cmUgdGhlDQo+ZGV2aWNlIGlzIHdva2VuIHVwIGR1cmluZyB0aGVzZSBhY2Nlc3Nlcz8N
Cj4NCj4tLQ0KPlNhc2hpa28gQUkgcmV2aWV3IMK3DQo+aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwOTA0MTgyNDUxLjExNjQ4NjgtMjAtDQo+bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tP3BhcnQ9MTINCg==
