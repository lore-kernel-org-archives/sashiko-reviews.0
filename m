Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794328619;
	b=UTAfkU1jeBqXtXK2WxGeN6ygUtgglqTtLcC29ilC1SEo1tsq6LXe2E10+gu75+QfAWDP
	 pWQ4rRTV93/hNYDY8uR/jicBn1OyeeOKCjtR1k1p4tAhwfr1s1I+PG+Px88SssaFrysQq
	 L/Xce4pDfbS1CZkyPgogrN+k1mgjjJsXD/AbMeXt3/t+XAwN74uq7eJ5HV34WwHDlyN4O
	 dufKDyAtQQOBHVmt1P33YQ2Wia0wCEghNynf30JaBUvb3wGN7/PpbE/i4bu4Y7IERJeNQ
	 TXgy6Ts9UfYEy/69Lb5NL/U7W3X23xH3lSEdX7ocalqmBsc8FKAstsdgrm33YUXsHCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328619;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=8mvNiUSKitGyDmKMFVF+IrhFX4gG3KOWCR3u8aFRjv8=;
	b=rskO5efWxoQoIOX4vYNDD+SxUL0nolpPAxMhS0jO8uriVojRhqwcpfokSVl0yEPfxWkM
	 Pl4q6R3R7dS9STJLBcFO4vCLxDNxoOkB85jTv6xW2h153fcaXU5vrg5jcProEtUAGHaha
	 PFzITyt1oOOSj4Xbk0151dmJtP/lLOZNsS0vn2OJAG4yb5TyUDDGvB4HG3FS09JpzaOwq
	 i4GzovU+JAjbwFeVSMzbt0pC2dVsCM99AYEe8uNfoB4K12gu6xT4Y2PUJ/zH3Hlh4NpBy
	 asYQdmIxZgWVYtpS3CHFd5+3wulGQFzoc+0p5W2ONLq+i0J0rQElr5mXBHiZobcnuVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YJ6RvUxh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFD3606A20D
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 16:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DFD3606A20D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YJ6RvUxh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794328619; x=1825864619;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=hxKFRgUeu5LKUClz+Tg72Bxx2CUTi8TERN1QyWh2oE8=;
  b=YJ6RvUxhrDYLamNGy5CIvwWsy1TaBaxzfFGQwB3uCslA/KXOgcSWngUP
   QsA1YaJUW4t+3BVMfuKwwCDMhGFH5ivzalIDloUM7m1OmyY/wrgk3TW5z
   FhIMy0Mg96fzzspf68dd6E6RJVugbBt0i3of5w+poZdhL/cRfNtph/rNP
   2ZuDyU66pB1wCFmgP4sMh+tsODAT4HtR//3XXrN6UpkoE30m5WO797bt1
   HTMZ3pEHxXMYdLxrk36wGvOYf/2qFXz5e2097Ly/4/sSMrNnBkZ+bXyWc
   hLndPUMyhH2++Yczas2n1p6ZAxnSEAOT0ptnkI0L23Tsx8n9iKf0ud/1t
   Q==;
X-CSE-ConnectionGUID: w9z32aakS2GE7eNAvh1gqg==
X-CSE-MsgGUID: bkWOwEIJTgS0+C5qnyd83w==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3121208"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3121208"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:36:58 -0800
X-CSE-ConnectionGUID: KWWhR9TZTgCEhPS0BpH+4w==
X-CSE-MsgGUID: nx7SvvLHSraf3+tNNpjSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8065848"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:36:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 08:36:57 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 08:36:57 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 08:36:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0V2dF7sfqT8/lHcmiiFhLLniHJLHG6YBBR+K6I4t9vxzINL9ZeZnanm0ZRxMhMUvJHH4N7rOZxVciCy2aH5PfBeeRgQcFRVaHDp4j2wfDLr+jdJdMEyTQjdR2H24Y4t589gUYS5ib80OvzbCT17FihkYiVoIQDyDKGbUXO2WgvzBQIuS5LlrOyUGUoJB3cOoyq7hdSwWzyh3n6PbdZaakFRVLnaN8yZLccE7vPRZ8s1smdevD6FmbvZUgLCmE9V0jHGm+0sVTxpyflrOfyCcCNX+dAg36mFE+DXcBtHMG+gJxz/ImrcQsf4WIzMjOR1b04HorR4ewsZOxcQB+cbJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mvNiUSKitGyDmKMFVF+IrhFX4gG3KOWCR3u8aFRjv8=;
 b=Cs0LoEEJ8OY5CAq0CKXCGm2RKY1Rso+baKKE4v7lsC1pZNx6t1Ge/yyJcbgVpCw8a3+GLuXzbPiyseGvMEcqAA9u22rxlptiOz52O2AJ+RuIf8IUg0QuFDLw88aeZfVQfJri+XqEKhzV9QHGZarbGIyIV4NpCOfW+nyPoj+EmKxUI6v1gRLsmVxg8RtT/NIDUObDHRbktHLmIWUlbIJ6Cb+StvgngLifQBarNUhQANcfRhoVCPfK3P52TuN1v4+EFlfubNvz03iL/ko1yDaPI7vn8ymQY4fXrdud5iqyboljHkUCfoZ/Wmeir2XX3hAxOp2t+kHVAM+7WwFGQgjQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by LV3PR11MB8726.namprd11.prod.outlook.com
 (2603:10b6:408:21a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 16:36:52 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 16:36:51 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v13 16/16] drm/xe/vsec: Support survivability mode for CRI
Thread-Topic: [PATCH v13 16/16] drm/xe/vsec: Support survivability mode for
 CRI
Thread-Index: AQHdaxeEfV9HeIgtu06+sH9JphLeCrcbX9EAgAwrWoA=
Date: Tue, 10 Nov 2026 16:36:51 +0000
Message-ID: <CH3PR11MB046149480C7E56AFD8BE6A24F4C1722@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-34-michael.j.ruhl@intel.com>
 <sashiko-outbox-194294@kernel.org>
In-Reply-To: <sashiko-outbox-194294@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|LV3PR11MB8726:EE_
x-ms-office365-filtering-correlation-id: 53f089be-9162-4b64-2f9f-08df3f48d2c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|260925022911599003|260925021911599003|260925021311599003|4143699003|56012099006|11063799006|18002099003|22082099003|6133799003|10067099003|261009223027099003|261021121427099003|261028144727099003|261102123227099003|261022075727099003|261022105027099003|261026140227099003|261026121527099003;
x-microsoft-antispam-message-info: Q9PCcM5zh8obLz/ayszbzA1Faq7tsHDtEYwl44bbKX+czorOQD9UQkgrSIGHuDDI5XecpHX+0dyBg8YJSWX4P6QkvMWKPholwr7UoyyEyrMaKZxU56ZbbsRoHMbQ7gN5r7hAJOL57T1yVXs/Fpe9NNFMyqsJbRQlK52YIf1g5jOtExz9wlCFlZvGxoE/r/dpk0+yHhdX92TrMEblojz7OXnjWXNPdtpkgDdr7Z2F+rNJfL+wbbRq9ULXCzoNtHTc0xQSWSg1NYq+MM9REGjkOW9aOtzjYY2BKXzZ/4jMVH2Yb54P4G+JuxcuZfyludpnnZK0WhqBZECRTyvytTyle0mBj/GsILff0PFrrQo/O1IfGL2c8BtpU5oUZnJ8uvr4B+D7br3n+daGL5UwGVe1PPubO4PGBP1Fem8Wtm2QWrkTnvvERw8yG0iHcVZnPTKbl3xltU/XXblgmwhPYCkNvxLXft7P6ne1B0nzezivbHZ9VGsS2VzaUMLReF/iZy6QXXYkb1sZIeAlE0MYJb6oSDIhyV1Tf17lGigiIRJgByU4fj4LqrB/b/mabM87KxJiGfXkJ8tcnN5xAwmiw9paSU2BaLAzBuHgmUJl51oeSYkQd+hKTJMGMvQYsO8Os9KBRSTrymr4QKzxvgHiHu3maYsBXbnj/PimISEooLxKJQY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(260925022911599003)(260925021911599003)(260925021311599003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003)(10067099003)(261009223027099003)(261021121427099003)(261028144727099003)(261102123227099003)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AhH4VYyIYv2jCu3u549+wNBl151k/AVw99XsMsnKeK9jpTY2YO9o8myQCl1E?=
 =?us-ascii?Q?Xqa/4HVwXaC+REDCTlQ5MakHgaznKqNFsUla2uNqZG05Q2G1TN8uMdX/T44d?=
 =?us-ascii?Q?OtLt54NymcxDKXrg4mZaWXM8WS0nrgfKdhmTrNhGCtJNlhea9zfmleSyF1kF?=
 =?us-ascii?Q?XYasLHWRqERdSngfbCwPMC9L1TSdIRdcj/VbjMgDIvIFhOk+IUrYCxcqeK5T?=
 =?us-ascii?Q?MmZU6ZdDsUcObZOYEje50H8Sy8wlWp2pV4rJoIfK6m1qXkIcloZu8mfZkryg?=
 =?us-ascii?Q?aQAFv1lfZ/PYi11WIGrHatOHYuAB1fDaco4MwaG1IKStribDnxy009OfyNln?=
 =?us-ascii?Q?Yh2f+aPZidJ2o6QIEI59UIDr4ATHj2qtmiKhKRxzLuNnNlagMl0OZmNnOrGU?=
 =?us-ascii?Q?Z9DRD+FEYtjSNplGOotrzzrBkdEWJNn4vJi+vK2LW18eZxLOWP2kvuXUKtdU?=
 =?us-ascii?Q?nrXpJ/1SDE46K8Uygmr1hh7sg5WVmBokLurds79Z4tjFao0iSnrk9IH9jD7z?=
 =?us-ascii?Q?+hX70LWVfn3gk50/biW+FdWG+WpZV+75kWuQvUESWsa4PffOAfR/nprCyWRe?=
 =?us-ascii?Q?lyLI0XS6qGJ215djIAxNx5wMR14tY3uSszXkBg5kPpgvr/yWEATsjJv3aoCA?=
 =?us-ascii?Q?whn2uGt780QcynyJ3ESAA+7V8ixC9tYZ9XcE+V1ibfdmYIskNvLUla1xEF1E?=
 =?us-ascii?Q?ZWahSE8EO2H6l1uiLwvFfxqJW5xbfum7ewBRBLAEATm76zEIN/RnRX7CuPnX?=
 =?us-ascii?Q?cttTzXTqKv+SM7+PvsDhedx0F+VRoz6UgpeLfNEEm9Ji4TEHHypgiAoeO5ke?=
 =?us-ascii?Q?8c6/tUp6obFICZF0GPihxqgdo6t58Q75WohzfpdOO4Ae9LmQ8+QtnozOrzKr?=
 =?us-ascii?Q?ZgTh7jCE5cfnapEHLVPPVfVeiBIA8vhIasvEhFqoQF9P7/5e5mtsoblmJnsB?=
 =?us-ascii?Q?RkfwsaYTJ49uJJDsNPgTqwakhxoqcc0g8pB9vHIEgg9SDreVk3lantNiTI5K?=
 =?us-ascii?Q?/Tr/f7+kIDadqPk9yH6WJSWkkQPVgTGPR/Qy4pEVdZ58WIL52CHoZ9pUC/tS?=
 =?us-ascii?Q?t9Phq/FrbLE35U5ZJu9PUZkgDKcEWUDUzKgvP5YZQdnCSQ5ErxKGtyOKcDpd?=
 =?us-ascii?Q?6OkiX//63/v4r1xxWJ2Q1mzyFbpwvuVekPy6FfCMm82qUI018WmAwwLCV6SR?=
 =?us-ascii?Q?NytN2QoXfJul9ShUzh9+P8crMaALTP5+6W7BzHC1TCUu26J16ckL0fS8he1m?=
 =?us-ascii?Q?J9HNj8LTLmPQQ44ot6rIgGSyDxbzBfjnKSrlmocccBlt/sOfeSP8H3tKq0h8?=
 =?us-ascii?Q?vy+P7Ym9UWe7AETuxQ7Jl36i+xFfcCs7HZKLXyirhDY/UxkE/GM8BSoI5Kii?=
 =?us-ascii?Q?7wCtKy9lS6hUWCEvxljFOXTFNON2AA/mz60hDkqM9Mh5TmKaFXFLAo7RUXx+?=
 =?us-ascii?Q?sI2byVVgCnIGvuDgw0mvoJSFx0Fpa4K8qCCyYc3RtjVc/rX8r1yOfpqqNnnn?=
 =?us-ascii?Q?H9B9xiify8nq6bbScx0dRbvfWQmChG4IiuecscSBFzcu4ITD1wn3wCQJxHMi?=
 =?us-ascii?Q?PgP9aDW4ip5tx+3BPTwmZqbsTf29WI8VDzXR78KeTQulypplfjdvHmorYMWF?=
 =?us-ascii?Q?58YeW8X0aEXqekNgyt6y4T7kccuHXqRQqJU+ekhfIy67v/dwxdi72dAc+q1A?=
 =?us-ascii?Q?nhpNgULQqP9IeRJg0iO9ARpboMbq9R9GXqCXacUjd6iilKAsUychyXCYpIdx?=
 =?us-ascii?Q?NL4oB8raaQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: StX6lISSKTYp3Q1d2hyudnuyu0Dft1Pkt/PnoavbOINXwLkqyPp2H6bZDYxM+2H1ZD6vJtTBznJzrh29h9v9XZ+BkZFvQMdyihQVkEKZ1XIm+5rkS/t7bBmc4q0d2wzJhUZu+CAh54lI7S2eWd2U3XNz6Bd3+l3QUyCRhOLQqSWUwCJV8L+cxZDQA13DDfu2NUDtzo8Y9033+ZDTJ2d5VMq5OZL6IbFXI84OTHZtCr+mSPEQ3YwfvDV3GRVnqu3pUU2zG97KR7VB6wwxkxXky1F4JRL0Shs6VECyr5k8YqTq6Mxsb4gZdCgaSXFSxibmJcmD/ofHHOZjXBfh/zT+1g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f089be-9162-4b64-2f9f-08df3f48d2c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 16:36:51.5642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ocmNv8q562RSQycLCnjNMhxHnlhXEjRsmV9Ug77vPkjnz/mfayCegpQCByLXtrSWmc0jFGOyMbHKoZv9xUEIE9PgFWJ1dW9tDFtROH+AzNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
>Sent: Monday, November 2, 2026 5:39 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-xe@lists.freedesktop=
.org
>Subject: Re: [PATCH v13 16/16] drm/xe/vsec: Support survivability mode for
>CRI
>
>Thank you for your contribution! Sashiko AI review found 1 potential issue=
(s) to
>consider:
>- [Medium] drm/xe/vsec: NULL sc->mmio dereference in wait_for_fw() on
>survivability error
>--
>
>commit 6e126caaac7b556b33b3c1891921257efd2a418a
>Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
>drm/xe/vsec: Support survivability mode for CRI
>
>This commit adds a VSEC configuration for Crescent Island in survivability
>mode to expose the PUNIT crashlog PMT capability and initializes the SoC
>remapper during boot survivability mode.
>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
>b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index d73cdad0b3a9c..4ce84bafcbf57 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>[ ... ]
>> @@ -352,6 +353,7 @@ static int enable_boot_survivability_mode(struct
>pci_dev *pdev)
>>
>>  	xe_heci_gsc_init(xe);
>>
>> +	xe_soc_remapper_init(xe);
>>  	xe_vsec_init(xe);
>>
>>  	if (survivability->fdo_mode) {
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index 1ed904ec14965..6d4ef9cb9f60f 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>[ ... ]
>> @@ -316,9 +336,10 @@ static void cri_late_bind_probe_work(struct
>work_struct *work)
>>
>>  static bool wait_for_fw(struct xe_device *xe)
>>  {
>> +	struct xe_survivability *survivability =3D &xe->survivability;
>>  	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
>>
>> -	if (xe->info.platform !=3D XE_CRESCENTISLAND)
>> +	if (xe->info.platform !=3D XE_CRESCENTISLAND || survivability->mode)
>>  		return true;
>>
>>  	while (retries--) {
>
>[Severity: Medium]
>Can this dereference a NULL xe->sc.mmio pointer and lock an uninitialized
>xe->sc.cmd_lock mutex if enable_boot_survivability_mode() fails after
>xe_vsec_init()?
>
>During early probe in xe_device_probe_early(), xe_sysctrl_init() has not r=
un
>yet, so xe->sc.cmd_lock is uninitialized and xe->sc.mmio is NULL.
>enable_boot_survivability_mode() sets survivability->mode =3D true and cal=
ls
>xe_vsec_init(xe), which registers the crashlog auxiliary device via
>intel_vsec_register() with devm-managed cleanup:
>
>drivers/gpu/drm/xe/xe_survivability_mode.c:enable_boot_survivability_mode(
>) {
>	...
>	survivability->mode =3D true;
>
>	xe_heci_gsc_init(xe);
>
>	xe_soc_remapper_init(xe);
>	xe_vsec_init(xe);
>
>	if (survivability->fdo_mode) {
>		ret =3D xe_nvm_init(xe);
>		if (ret)
>			goto failed;
>	}
>
>	ret =3D xe_i2c_probe(xe);
>	if (ret)
>		goto failed;
>	...
>failed:
>	xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable Boot
>Mode!\n");
>	survivability->mode =3D false;
>	return ret;
>}
>
>If xe_nvm_init() or xe_i2c_probe() fails, survivability->mode is reset to
>false while the VSEC crashlog device and its sysfs attributes remain
>registered until PCI probe teardown runs devres_release_all().
>
>If userspace reads the crashlog sysfs attributes during that teardown wind=
ow,
>xe_pmt_telem_read() or xe_pmt_read_reg() calls wait_for_fw(xe), which sees
>survivability->mode =3D=3D false and calls:
>
>  wait_for_fw(xe)
>    -> xe_sysctrl_is_oobmsm_fw_ready(xe)
>      -> xe_sysctrl_send_command(xe, ...)
>        -> guard(mutex)(&sc->cmd_lock)
>        -> sysctrl_send_command(sc, ...)
>
>Because xe_sysctrl_init() was never called, would this lock the uninitiali=
zed
>sc->cmd_lock and dereference the NULL sc->mmio pointer?

caching the survivability mode value in the PMT context.  If the error path=
 is taken
the state will remain.

The sysctrl usage will not happen.

>
>--
>Sashiko AI review *
>https://sashiko.dev/#/patchset/20261102221314.119028-18-
>michael.j.ruhl@intel.com?part=3D16
