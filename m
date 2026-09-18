Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8EF2AE68
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 03:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702595; cv=fail; b=MDJ3ILWCae99mfIvI/i8+pnE8HeMSx3Oesg0GzTzEoUB3mIh3yQCPbkSPdieqZWtZ9d52cBlfSWvz9mftLvS7Sz+HcUd412RUXBC7xHPoip1oIvlWqWXlX4kuYu1TjPNmGSWCb9Grb5hpIEmjdXfpQzHCo1y9SfPSsCS3cLxQ1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702595; c=relaxed/simple;
	bh=XPB3TUoOv2UnuNOdg/gBjJspCvsFQiuhKPp+gzhEt7o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dm4L4mLwYFUDKUBU1W7Dn8xt/bQlwDicet/xmOYFjB7OZ0MQaaGoO6Vr6Uv9DfpzBOH6AdvpCfNaD28QjOor+XOO0wynGyA5yA/YUhfaLzB/mRBd4ttskehvP3opGx9031ZABdA64jJus3Jh0aqzaKkdlZG9wdp3/FITvrrKvQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBhv2FCW; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBhv2FCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789702594; x=1821238594;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XPB3TUoOv2UnuNOdg/gBjJspCvsFQiuhKPp+gzhEt7o=;
  b=jBhv2FCWGGW28VN164e2ZqGN6rUDrn5zbMEAIOpfOFtn82nin6dS/ikj
   hpsckBeBRoErE5eb9RLrrHqk2ohnOZl/Nk/89R2VnunzdNdLRGc/G3adu
   zPTMj7Io7O8+2QpmaREHgK5iApRc5ltwyX7O59KGrpoxX+v1Gmd9mRpX2
   KobKpqP6a2XIdvFqxOgIE3KpKruAGYEgASPSqXt4O2xQuU5hnrU+XGfjT
   wka7LRYTwCV+Uwy6BhzlbgG5QgHOESH4bIh31FEdCw+eoIfsLLZIjKae7
   JC8Fw3P9pwp6BmQpl7wHI6lVFEslWgitBMQnbpAIOhvLwwTuJLokEn+Es
   Q==;
X-CSE-ConnectionGUID: ai9nIQwwR/+4NXVnJ23BMg==
X-CSE-MsgGUID: 6Qja4laJS/2vgd3hPwTWrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100843895"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100843895"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 20:36:33 -0700
X-CSE-ConnectionGUID: kC6gIl3aTBGFim9uZFl8+g==
X-CSE-MsgGUID: 6SJqlU12QMqXaQXEuo1eag==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 20:36:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:36:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:36:32 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:36:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jv3elGIE7dMr8Gq9gwLxcF3Oo5OyimgLF3qQ40qAHv6BXrSc/cUORMuDXScC0IoMwJkavXGcVYrUWtYJRzHvH9WPM4jJUbmRwiFrjrCDQjxozFYbnG1klQTVkh0fnCJsblGnW8qZq+VLTdvZNqdppRNGaxJmFnKukCniOKFucZe6TUgJfM5TvZJg7kAmvHd4zBRH8NrEQJPxDvXG0EJa12qqrwAc0QHAGeVdQgrcG2i6BI6GnKg4JaeHLvl3JBmi7gWQCGbQnM8BTvnShEiSA82T415TEv+h4fNklEgBsmFXLP2Clq6nWm+R4HCnWvnz0qdbIblGR7tPqlYadmIu/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPB3TUoOv2UnuNOdg/gBjJspCvsFQiuhKPp+gzhEt7o=;
 b=XY5bneJPotk23igpQHA3IsaZojYxmUIXuv1kvHQ2qVkUPo0fbohsUtGaARwVDx1kWevCeM/VbMLPuhEM6R9XMwnooFhy5aG0ouMtN0aNB/7JO52Kgq37s0e16vgG2iTF9tEjy5/OpTzfzmCBTD2wwoyQRjqKu/BgLLUyWLHseb2mVeVuYlvzMs2SyE+xzEP+MyCE9nMBm6yCttcMYfY8Pma58PNQ1wlLGTg7qcWv1513a96ikLBRDuQIRSOnyT9oNxSfOX5SGpnU/F69GuPlHKm3LbhvfFg3rHP4EZQv+6ikGSRlJkIuVHCCqe23kdHcQdVh8avsZLBT354b5hg8/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH0PR11MB5109.namprd11.prod.outlook.com
 (2603:10b6:510:3e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 03:36:28 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:36:27 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Nikula, Jani" <jani.nikula@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 07/11] drm/i915/hdcp: switch to drm_dp_dpcd_{read_byte,
 read_data, write_data}()
Thread-Topic: [PATCH 07/11] drm/i915/hdcp: switch to drm_dp_dpcd_{read_byte,
 read_data, write_data}()
Thread-Index: AQHdRbWpoQ6LEVafzE6x+U55NpEHSbbQ4T+AgALOzFA=
Date: Fri, 18 Sep 2026 03:36:26 +0000
Message-ID: <DS4PPFE901A304F9D317B8B81F2479D1079E3872@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <e168dad72f78fdb74419da94b0a38d732159fc82.1789547331.git.jani.nikula@intel.com>
 <20260916083531.D26AD1F00893@smtp.kernel.org>
In-Reply-To: <20260916083531.D26AD1F00893@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH0PR11MB5109:EE_
x-ms-office365-filtering-correlation-id: f668f2d7-7b22-4f13-9b15-08df15360526
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|4143699003|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: QAVNRzzvHPGvxGklrT2udsW7UbEw6dtFwh1mTn9m0FxJ/yaVZ2Ns2HTTkm9ZHyMjTp6z2mBlVvZYGhHivH05xZtAr8qt8kQDlmNo63vy4zlQ85zp6FSxljAX0dwDdP3ladHDtKxH4ObKugITPp8K7dV9XlIZwiSZht89u9rRecrHwEgIGYkBYFHtxk+eiA45ge6lzDiFj8s2s37w66zq1ORbl9vLle4VpT+FOcKEPBSRnhSFLen2q+FGcUCJrd+3xbJS3d9ySEqM8rl12OmcYpmI1glPNTp9vmp7qR2pQrexjcs8VM21QPANM5HBtuE7laJ1C4Jdy83I+oJqtcpj6no5YYolQ5r8d9+rClG0RrIb9APjzBWIUfslr6lTdaVEK8qTGzF8J5ZnCvG2Lb/tu+gup2opL0FzQlJx+o4UuUAhelwLPO/m/atjQrmH9zBmjznuxIMkmCwjSBuTbhk4KKwlDQM0vjsbf/lraeq2WDjpY/+8KiW9PnX1yLP07NumH+LE7OKxZq+I14xWvLpefFIXhGoJ7mZJEj+yEjNkTvyZKf/HIyTGZ3jpWlNKcuze6SfDCy8LEesT3Adp3QFvm8P5yc1qtvQrDReLJxPlL9vgSZFFDkJhn4EdvK49x+331Kfn9xF2eflkXnUOI/LRA6DC51oxpz9HDM6UeDwsmlI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFE901A304F.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTBmY1NGdmxLcExWRms4ZnFHNG9xU0g4dk5Dakl3ZmMvSCs5ZlIzbkdVZTVX?=
 =?utf-8?B?MXpvSmE4R05oYUpwd3Zwb3FzejlXL3NvTllwL2M2TGNORVU1SEUrRmZULzA2?=
 =?utf-8?B?aEtmNGpVZ00xMkZSTzVtWkttdjhpeTA1NEFCckRyTFpvVWYvOFFPZW9RbC9J?=
 =?utf-8?B?RnkzOHdraW40aENxdnVZZFhNTU1vMkFoZDRwaHVpdGFlUnYxNWhJYnJRSEV2?=
 =?utf-8?B?MC9BeklMcVhCVzcvdTc2MDJKYis4bzd3WHBnU2JYOFFZUm9JdmwzTit4WkFi?=
 =?utf-8?B?azdFZzZoUng0WjRlZTA3VkpQYS8yZnNzd0dYdUlVZWc0WlNBZnRoWlhFK2xz?=
 =?utf-8?B?d2gxR09XRmpoQkhvMkQrMmtiMzB1anVZcFliUUdjQkRFcHV2Q3lmM1RyYlhR?=
 =?utf-8?B?b3Y2a0wwL3IySUVDclBoamxLNG9GbkN2M21wQ1ZrbXZ0MEJsK3dzRjZ4Q2d6?=
 =?utf-8?B?ZnNqYk8wdWdoaWxOTDkrV1RKYSszV2FGTTZFN3BrZGkxYzVDMFptbTNBbzIy?=
 =?utf-8?B?bzRibk9HK3prZzhPRm5sWEcrNHpnSjNMMEpFUTh2eHB6ZG0rUGw3OFJZVkFq?=
 =?utf-8?B?K3BSZEZXTW9pN1U2VjdPVDZDTURMZzRXNzhMV092S24xWkFuUDhjVG1UZUpL?=
 =?utf-8?B?QzFodG1UUHczekJUc0NmWjJEK0tzajZmd1p2UUJPdHZFaW1SMnF6TnVKRGJR?=
 =?utf-8?B?dGZINndlbjJrLzB1OWJhRXRMd3kwU05KNjAxMEJVOTF0VnkzckU1MWZOTnAz?=
 =?utf-8?B?bDE2SkhSaEFZQWlRcjR2RWNIenZXOFV4eEdIaW83WWlwaFJXQVhMTlM5aXEv?=
 =?utf-8?B?Ym50RHVmWWZ5V091R2RkWVBaUEI4OXRldnJPR0pqNGZrUHRBblpmcWs2dDVa?=
 =?utf-8?B?bkxMTnVlaExMTU1xbkVoNHpuMk5sNFEwQ05Vd1YwbStKd1JIV1oxRkZXSkNx?=
 =?utf-8?B?VGtnK3J6Z3QvL0luU0hObEplOWhnV0c3c2lBOEM0UDNKeXo2SHV6UzNmNk1C?=
 =?utf-8?B?Qk9YeEJrdGpUUWw5Z0FIbXVHZ214N05rNjl2UHVPZnFHQ0MvZDhvcHVkaFBt?=
 =?utf-8?B?Wk10VFAvdytZZzJnelUrNS9JRXpDQUx6eWNiSEZ1S0dXT29HQ3BkTlFka0xU?=
 =?utf-8?B?WlVLa1hhWnNjb29VNU9PdUwxY2Zjd1EwS0Zwbks4WHovN0tEeko0bXV0SjJw?=
 =?utf-8?B?cUJ6RG9kUHJxdlZMUWpBdzducjlrbytLWDJKYyt3RXlaWjl5SGl4T3gyM2dz?=
 =?utf-8?B?MmhnbHJmdlZXMUpiZk9EdCtkOG82bFBXdGJkdnRiOUpFUFZRRVpNS2taUHdr?=
 =?utf-8?B?c3U1c0FOb2w5VTYvaGdBMEdlZGRNdHdsc3JHNHptQUV2bHBESEtTUzdiak9p?=
 =?utf-8?B?Z1VUMnB5QWxVR1VDdnM5c1pueXBQSkVDV1lWOWhVTGg3ZFlSRnhTZVBDaGJL?=
 =?utf-8?B?QjNrMHF1cVI2Qm52K1BMejA0MEFGL01menhnVEQxZXZxYVlvbmNvQkFTdFZS?=
 =?utf-8?B?d081THBkNkE2eTc0eCtVMnh3UlQ3ZXNlZUNIYlFQcHJFajlOTTJ1dVN6RFVD?=
 =?utf-8?B?YXlwNWNXbG50NGZ0Z3dFNVBDcENoVXl5MXNhVFVNcTlic0pZeklicWkvL3Nj?=
 =?utf-8?B?dXMwbVRLUkNGSlYrNXRBL0wvTFZobUZ6N1pmNjNvOVZJVHJNQUZRdjFrcXJv?=
 =?utf-8?B?NkRlZnJDRGE5U2RvR2kwaDdZNjBheHpFQWpWL25Ea2lCS2hvWDRpcW1lbjgv?=
 =?utf-8?B?ZktsU2o2TEZNbFpLd2JWajdmQnNDY1hWY04vcEZhZTF0b29zYzV1Sk52ZEVP?=
 =?utf-8?B?QjE4OUVRdWdhd1lKRVpDMmlGbVcxNGo2WUhoWXI5K1BISGVBVWlNYXVwQWti?=
 =?utf-8?B?c1BlcmtwWXh4b3VySXhoNlowSUY5aUdrTDRtN2FuQ3psYnJISkpxWllYeWVl?=
 =?utf-8?B?SE9VQ0NUY2twUjdUb3phZWJxdXY0ZFJ2OVBBOEVaVXBXVVlMVytaQUhabWVT?=
 =?utf-8?B?aVVZKzlUb2hIUVd3TnZrdkZiNWRkYTFmZWtVMmx6OUo4TEd5VlorZTFjd1lO?=
 =?utf-8?B?bklrYVJsWEpMdXVnQlFpVnZFcmxkb0RGTUhINkowMU9ValFXdzZsbkJOblUx?=
 =?utf-8?B?ekt5aWZscDJoRlZyZVRidzZ4dSt2TmNJMTlQV2c4UjBreWQ2ekNpOUlUWkQ1?=
 =?utf-8?B?ZVRsWi9VcmVnR1RXaHduU3Y2TVljZUhQaGU0REUvZGFhcFZLTnJJdUtUY0pZ?=
 =?utf-8?B?TWtPTzQ0ckJLbm1VL3IrZDVVVUExR2huOGw0UHNXa1FGYktaRUZHWi9talF2?=
 =?utf-8?B?clY1eno4ZDViQlJ2Y2Q5ekYzZWZHRVhMWGlPek9tbm9zSVFSbldSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NbUVTtgKy7MFybuP2bzq/tD7ap8P2lmmdnVb2kr+/Mid956WSFGhfxL5/f3O+Cfu09XRtQIUTow5BE3CPl005/1tuozgFWIa8u4NsQbdASeQPnx6GyMY8RLn+eCEBtwdbns0AWUAyMB2a/VGR5ZrJj4FRqs4ILM4mWLoGvxz59ejLUX8I9EI4dz+uv3oHzBV8Xp5MPUbMbum+mA3eG4DIfKiSuvJwvOJWaNHtin//dJycEocvDXxTCDgfYbSdEuLNsXF/i7q0pCBxhyxEOql5TgTM+L/r095jrZYFD34LQimk8UBfDdwMmADUzOI79p703OJxUPw/AUivfQtWUkCgw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f668f2d7-7b22-4f13-9b15-08df15360526
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 03:36:26.8403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J/hFBZlT8HljZ0upcQ1hQZ4+6LOFp18d/YCs9bUktlm/koNILp0NUOA9AlbSQbxAyEP0JLQvF7J+hfPpwG5bKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW1BBVENIIDA3LzExXSBkcm0vaTkxNS9oZGNwOiBzd2l0Y2ggdG8gZHJt
X2RwX2RwY2Rfe3JlYWRfYnl0ZSwNCj4gcmVhZF9kYXRhLCB3cml0ZV9kYXRhfSgpDQo+IA0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAx
IHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPiBjb25zaWRlcjoNCj4gLSBbSGlnaF0gZHJtL2k5MTUv
aGRjcDogaW5jb3JyZWN0IGJ1ZmZlciBhZHZhbmNlbWVudCBpbg0KPiBpbnRlbF9kcF9oZGNwMl9y
ZWFkX21zZygpDQo+IC0tDQo+IA0KPiBjb21taXQgZWY1ZTI0NDNhMTlkZjJiMTMzMzY3OGFkODA1
ZmU2NGJlOTI4ZjRkZg0KPiBBdXRob3I6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5j
b20+DQo+IA0KPiBkcm0vaTkxNS9oZGNwOiBzd2l0Y2ggdG8gZHJtX2RwX2RwY2Rfe3JlYWRfYnl0
ZSwgcmVhZF9kYXRhLCB3cml0ZV9kYXRhfSgpDQo+IA0KPiBUaGlzIGNvbW1pdCBzd2l0Y2hlcyBE
UENEIGFjY2Vzc2VzIHRvIG1vZGVybiBmdW5jdGlvbnMgdGhhdCByZXR1cm4gMCBvbg0KPiBzdWNj
ZXNzIGFuZCBuZWdhdGl2ZSBlcnJvciBjb2RlcyBvbiBmYWlsdXJlLiBJdCBzaW1wbGlmaWVzIGVy
cm9yIGhhbmRsaW5nIGFuZA0KPiBjb252ZXJ0cyBsb2dnaW5nIHRvIHVzZSAlcGUgYW5kIEVSUl9Q
VFIoKS4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHBfaGRjcC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RwX2hkY3AuYw0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHBfaGRjcC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cF9oZGNwLmMNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gQEAgLTQ5MywxNCArNDkzLDEzIEBAIHNz
aXplX3QgZ2V0X3JlY2VpdmVyX2lkX2xpc3RfcnhfaW5mbyhzdHJ1Y3QNCj4gPiBpbnRlbF9jb25u
ZWN0b3IgKmNvbm5lY3RvciwgIHsNCj4gPiAgCXN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmRp
Z19wb3J0ID0NCj4gaW50ZWxfYXR0YWNoZWRfZGlnX3BvcnQoY29ubmVjdG9yKTsNCj4gPiAgCXN0
cnVjdCBkcm1fZHBfYXV4ICphdXggPSAmZGlnX3BvcnQtPmRwLmF1eDsNCj4gPiAtCXNzaXplX3Qg
cmV0Ow0KPiA+ICAJdTggKnJ4X2luZm8gPSBieXRlOw0KPiA+ICsJaW50IHJldDsNCj4gPg0KPiA+
IC0JcmV0ID0gZHJtX2RwX2RwY2RfcmVhZChhdXgsDQo+ID4gLQkJCSAgICAgICBEUF9IRENQXzJf
Ml9SRUdfUlhJTkZPX09GRlNFVCwNCj4gPiAtCQkJICAgICAgICh2b2lkICopcnhfaW5mbywgSERD
UF8yXzJfUlhJTkZPX0xFTik7DQo+ID4gLQlpZiAocmV0ICE9IEhEQ1BfMl8yX1JYSU5GT19MRU4p
DQo+ID4gLQkJcmV0dXJuIHJldCA+PSAwID8gLUVJTyA6IHJldDsNCj4gPiArCXJldCA9IGRybV9k
cF9kcGNkX3JlYWRfZGF0YShhdXgsDQo+IERQX0hEQ1BfMl8yX1JFR19SWElORk9fT0ZGU0VULA0K
PiA+ICsJCQkJICAgIHJ4X2luZm8sIEhEQ1BfMl8yX1JYSU5GT19MRU4pOw0KPiA+ICsJaWYgKHJl
dCA8IDApDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gV2ls
bCB0aGlzIHJldHVybiB2YWx1ZSBjYXVzZSBpc3N1ZXMgZm9yIGRvd25zdHJlYW0gdG9wb2xvZ3kg
YXV0aGVudGljYXRpb24/DQo+IA0KPiBTaW5jZSBkcm1fZHBfZHBjZF9yZWFkX2RhdGEoKSByZXR1
cm5zIDAgb24gc3VjY2VzcyAoaW5zdGVhZCBvZiB0aGUgbnVtYmVyIG9mDQo+IGJ5dGVzIHJlYWQp
LCBnZXRfcmVjZWl2ZXJfaWRfbGlzdF9yeF9pbmZvKCkgbm93IHJldHVybnMgMCBvbiBzdWNjZXNz
Lg0KPiANCj4gTG9va2luZyBhdCB0aGUgY2FsbGVyIGluIGludGVsX2RwX2hkY3AyX3JlYWRfbXNn
KCksIGl0IGV4cGVjdHMgdGhlIHJldHVybiB2YWx1ZQ0KPiB0byBiZSB0aGUgbnVtYmVyIG9mIGJ5
dGVzIHJlYWQgc28gaXQgY2FuIGFkdmFuY2UgdGhlIGJ1ZmZlciBwb2ludGVyOg0KPiANCj4gCWlm
IChtc2dfaWQgPT0gSERDUF8yXzJfUkVQX1NFTkRfUkVDVklEX0xJU1QpIHsNCj4gCQlyZXQgPSBn
ZXRfcmVjZWl2ZXJfaWRfbGlzdF9yeF9pbmZvKGNvbm5lY3RvciwgJmRldl9jbnQsIGJ5dGUpOw0K
PiAJCWlmIChyZXQgPCAwKQ0KPiAJCQlyZXR1cm4gcmV0Ow0KPiANCj4gCQlieXRlICs9IHJldDsN
Cj4gDQo+IFNpbmNlIHJldCBpcyAwLCB0aGUgcG9pbnRlciB3b24ndCBhZHZhbmNlLCB3aGljaCBj
b3VsZCBjYXVzZSB0aGUgc3Vic2VxdWVudA0KPiBwYXlsb2FkIHJlYWQgdG8gb3ZlcndyaXRlIHRo
ZSByeF9pbmZvIGZpZWxkLg0KDQpFdmVuIHRob3VnaCB3aGF0IHRoZSByZXZpZXcgc2F5cyBpcyB0
cnVlIEkgdGhpbmsgbW92aW5nIGFoZWFkIHdoZW4gdGhlIHJlY2VpdmVyIGlkIGxpc3Qgd2FzIG9u
bHkgcGFydGlhbGx5IHJlYWQgd2FzIHRoZQ0KV3JvbmcgY2FsbCBhbmQgSSB0aGluayB3aGF0IHRo
ZSBjb2RlIGlzIGN1cnJlbnRseSBkb2luZyBtYWtlcyBtb3JlIHNlbnNlLg0KDQpXaXRoIHRoYXQg
TEdUTQ0KUmV2aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29t
Pg0KDQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtw0KPiBodHRwczovL3Nhc2hpa28u
ZGV2LyMvcGF0Y2hzZXQvY292ZXIuMTc4OTU0NzMzMS5naXQuamFuaS5uaWt1bGFAaW50ZWwuY29t
P3Bhcg0KPiB0PTcNCg==
