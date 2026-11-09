Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794262486;
	b=sTfNC9xV9b6tYv4dsVVgZmhCyrbZWT8UOk8G0AGgMOINoPoepcVrfAZBRCZtyVwsYqpP
	 bGC6U+1gUReZAHBEsw8YUJsD0ywoTTJIqTul8Q/tjkUXUwDEt2saMHNhodTi4nLR6W2ss
	 we2O0RHiziTDj+7pmUtSJbaIdqpA5zxK/kdwun0YKACgdcLgkt7rGFH7bWP5j4AjXYIGt
	 k4RV3dGCSIvE5e7mRuMx+PGHM9jdCnEO7gFJrf6a7Dx+5DlaoiFtMe90GU0InZIWe8e3j
	 v3ym1c5mvasUn8LNmk4ViYaZQL25b7uvVLDV1+le7ws3ydY1tVTWpgqtMMIGoHYjBmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262486;
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
	bh=SSvi66EST3PhKNC3JAaRvXEb23ssC+NxWQLDxRNsA50=;
	b=KRQSbEJaLiH68pw9+gd6JCGZLwjFqFnMhQpuRjSA2Oa7USurgAsjeJZdIXoFM63OVFo9
	 gfX6ylymiEK2vjIwhilbxxpvmIW/yT+iEEwSMSbL/+cdLuVseE78Cx2tSGmDMW1FKMdSa
	 Z9iVHxLJVg+aruPFo4jiYgQwrr2sDrCnBJVEM65GYkp9aW1+x6jUlKnbQDY9hjl/fX81G
	 NNvoZl/LlVEd95IwzvtY6VZcV2szimQ4vvNqjDFukfi4AE5mJW4muykP751fZahLINrYB
	 7moOoH7quKTqspTCc2eCA3kWK2RHE1AtN2DR2s+f4VCowyjx/BaP2PlU4QZi7KW3vCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BD+1K4gD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E38606A321
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 22:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E38606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BD+1K4gD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794262485; x=1825798485;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2UaKKByTkID05GnfZbWAP2jh7HaOs//+Jq9GODWa7f0=;
  b=BD+1K4gDnk7Oix6NgHZrccXJJujSRI5pxLlvCJmSm9nuKPZ6Y0cpHSC2
   aDXBkyxK5KQfCIHhKgpcWlJAkBLJevfwCPTyWHqX5l/oh2mad+4XXzuhL
   49dYSrGh+IS4qNkXLlYxKl6hfWizKxLkHZwdbgtTxn436qn2NO/+Ibj2w
   S1Y0HwRvp3NiigU0s1KWKm9zpS+UFVJ+rBp/ZNMYJ3m0wCGll3wdEqEBt
   fveW6yRKFBzM41qd+L7WACvXHR5BcXQaja5UY+eCcuif6ljQRSLWWmq3q
   XsjACDfgAcjI2zExt13xmkuArrpTkPm5xrz31J5zrDGJwWPXiq0iFj4Jt
   g==;
X-CSE-ConnectionGUID: HJaGT705SD2EG99AhE07jQ==
X-CSE-MsgGUID: k204mUWVROii/s5LxiRTrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2896545"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2896545"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:14:44 -0800
X-CSE-ConnectionGUID: DqKYA/VuQzqHAtEznezo1Q==
X-CSE-MsgGUID: KyfiqFPfQf+AGcQjF7HLsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9838218"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:14:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:14:44 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 14:14:44 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:14:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w16ZE3q9KdwrhuQHunIZSFnybUPIMM2afVByRHnU2hA+fZ018MmW0hhH7nekbNkSF/3z7MFSunhgCjFvSB7/XAZ6U8UA+57WOyHKotzb3cAfXVTbfhW8YzBq3N8PDuLZckCc3i2Ci1J9mw4d4eOcrvS6OK1/Rg3tPoheZgMPGCJdUINLwb1i0Q7zUya6ViC+fyob1+mkS17pcjgp8phLNNv81YYO8vIVw4oiOq9DSdejsBEWHGrLPgcidU4HPCrz5hhlEAgqIsm0u4hubMfZcZuflao0n4Nj2yAP5LZSznz2NlNjtnIwr6ZE7poaIOhzlRAOvh+nNVz9nvmkyoCqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSvi66EST3PhKNC3JAaRvXEb23ssC+NxWQLDxRNsA50=;
 b=c/cmDaXzEf9SphHfQOt0/eQSlipmhD65KRPAtsqx583yZZ91et7/7tY9pKVPPoeyw6jQdFObmDbzgs97u+rL5iVHPvv9WZWNPP7AhNE7/UhzMnU0tkH1ifXDj7DJDUdK+TR+XqLZrcwepqwT0GAoa5C1m/kBOKkm0h7jyegOxAL6iOME63mhRuk5nL8dJNF3wSYJZdzmMwB2AVQRZe5mTYhZhvP7psfCP0kc+fYmckNoG4ZmH0ATxTNUeio6duCd8xVaJZU2AKpYJoLKYm1WyYbBSb4yvPQQbiGcl13irFJr4gHssLhAVvzc3AwqQRWM+icN1N2ofA9tkS7Oq+ggNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SJ5PPF8622363CD.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 22:14:38 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 22:14:38 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v13 11/16] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Topic: [PATCH v13 11/16] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Index: AQHdaxeA9N9OudCc2ka+78nC1CNgB7cbX7IAgAr1XXA=
Date: Mon, 9 Nov 2026 22:14:38 +0000
Message-ID: <CH3PR11MB0461493EC9BF6F318B420ACCABC1732@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-29-michael.j.ruhl@intel.com>
 <sashiko-outbox-194293@kernel.org>
In-Reply-To: <sashiko-outbox-194293@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SJ5PPF8622363CD:EE_
x-ms-office365-filtering-correlation-id: a4db325c-04f7-48b8-6f14-08df3eaed862
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|4143699003|11063799006|261021121427099003|261021135927099003|261021130227099003|261021123027099003|261021133027099003|261009223027099003|261022105027099003|56012099006|261022075727099003|261022115727099003|261026130827099003|261026140227099003|261026135527099003|261022113327099003|261026121527099003|261102123227099003|261028144727099003|18002099003|22082099003|6133799003|10067099003;
x-microsoft-antispam-message-info: 71t57a2FBcmL+EAXl2qk9H3rH2HhsqJgi5SLt2eFjba/eWUfp3CbqDYekgjCnqhNe5hEqToen4K90zPPacRtBWrn40v9fqEz93JPUxuHvzdjjrVCvTk5ors7ZA5rLUlLnCpa0QBaVw9cP5xOjht0S9/KKlGqb38vg1oopOAq3XKmUi7ya+NSMVBO5tXKN8rE1no6gf1Fuw4MMnW+DHtIxVvYvfXG7szG4r9nMoz1mQsrIyXVge+IuGrJb4z0R17/tTZhWcQzr+n0aN0z7zSgWmHqkQBgE1nVc/tHJauK7gotBzgQXiOJZUSi/ERWq34ZrnzmWnP8Mc28RUCrVqYpJIOZxSuUlo9OsZSsJZPrYoNnAxo8gOfcRlXDcXwQ7Ld7VLKiXECRlanRPmEpmi2Fxv19n8RwpDY3xfbc/+YHZGG5msgBH4yNcvVxS08Y1st7VKmgd3Jb0O7dm4tTuDd6BbJHrsyoNTTEm8vOwyQmKTxcAoYvBev96jSa73R/dWFcoAVTpDnwQwLSkyHzklDViDgmX38gEbOI9+GPgAY2T6xcHUpVAQreij1LZLA4d91f3ibUZLNEppX4vocYatjUoWPSx7mojkDsK+g8tKdcG7JNfBn3OB/jMOZokoHOvBg8hKlN/aF4ZITDnlyVCyiMN1xViLf3pZAcANN5Wgs+z7M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(4143699003)(11063799006)(261021121427099003)(261021135927099003)(261021130227099003)(261021123027099003)(261021133027099003)(261009223027099003)(261022105027099003)(56012099006)(261022075727099003)(261022115727099003)(261026130827099003)(261026140227099003)(261026135527099003)(261022113327099003)(261026121527099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iaJnXZM8rTlM6+Z5tQLo+M99OrEuKf4foRLCdTuxqweu6bQgqAttRD8i2A/I?=
 =?us-ascii?Q?djyY0izOdUYQWUjs0TV+4wluZJOGXr3TqRkJYbDeNYVQZK0KWQ2VYM7YNEgr?=
 =?us-ascii?Q?PpUhUXFycQzEvTnTNv5d9lcK7M2ZjMfqBNcE5Yv3HOJo+mVJcn2cBzsmWWEg?=
 =?us-ascii?Q?cjymyKetB1eocOs/QlBvH4BE+C/ey74cZs/Ee/vRu2ez3k/wXKkFvzr2M4sd?=
 =?us-ascii?Q?6LdZOyTabF+UfikDLuDiMeEMqoQeXBOJHiyyqmgKDUeeKLAc5M1xdW7GJ/I1?=
 =?us-ascii?Q?++IkXTd0OtiPq8iAR5rq3+BlNOxiCnBGgSyHVDdIQ3brcY2CZT2NxfJo07bE?=
 =?us-ascii?Q?E5sdzDa3hlyAPYmoH8LoZ/ZYRCcZ8yvbDYHZGhvNnNwU4FXm+HqOqU482pKa?=
 =?us-ascii?Q?kpOQAzIIPaRvz2TRNxd2mabzGIk7h8Yi4s2X+X8Gc5As3hexTk8yPC4G0G0u?=
 =?us-ascii?Q?AF2rS7QN5ThV9S2E6TP6G34cTfpnzphNop4b7HHDGqZv6+I2UCnTbx9HubQ4?=
 =?us-ascii?Q?eU4BknoBCScE26Uadfb8QZs/s+T8V7zQqdVEBfVSKOPzURxuguzL5JTQVmGU?=
 =?us-ascii?Q?/kum5F2QLIuLGnYAgYpw9waJ+br/+9wyHEqLBJLTYiH3uoYAL8QDH2kqgIUJ?=
 =?us-ascii?Q?1FB3W33VP1OlCvKp1gCNKkLSEc6NVvHOJezMW9W021MGKJoof9uBmbj4Dfzw?=
 =?us-ascii?Q?StVL6co5uPXKJMvU1spv5EGqpXHLnJiflVgnD+g82O+uXZKYiW62zO8sdEbp?=
 =?us-ascii?Q?r8G4p4iOlbDUcwB8t9laWRKoME/4YNce4eVP/G/rt8d6FJqOU1P47XXiXKL3?=
 =?us-ascii?Q?l8U6dlJGCfFnEYYB6Du4ipst9A86pADtdnisWEtEwDT49rA5nenawHo0HHhC?=
 =?us-ascii?Q?cRWOnQta4tSAHwEEtz0rgDE1TOOVFDomKHdTnKMnuUDmcWM3RnLBr9UAF/qo?=
 =?us-ascii?Q?JpMJs74kwKM0++RUj1wGR7pRYBrcrBO7dBwR2QF487WapHf2TfA5h8sI1601?=
 =?us-ascii?Q?ZgZ9HbSEyYFCgyalQEgUKx5CRZhduaDZsqKnDR87ycpsVfzmz3i0YFjzkzca?=
 =?us-ascii?Q?+k/AifzlFsSQSkzIVHTGQ1bkN5giTy988Nv+xJOjPD6Fy+UeAPJDbtD3SCdX?=
 =?us-ascii?Q?KkM8H+HhotPnOX/8qQNrH0k/5Aoo+RojZeD9ugTl4fPTbAWZ3hfYsIMpCUjN?=
 =?us-ascii?Q?gpFF6JXFRnTKnPUZe3pOH+RyhI1gZqL4d1KxKTgbT9Dlfv+Sy5BjOPCzHFXu?=
 =?us-ascii?Q?aUtl9Q2VJ/7SyyeHsxA7mgTw8C7g4yLY+KvWjKQuGOAIneHq/q1EMiejuhj8?=
 =?us-ascii?Q?hatqz+9H7/E5WzuXmhkTjHNtqGAK5nZNuSn6sMb4Ywom0YOiAK4TxjVwI29S?=
 =?us-ascii?Q?fsK37LOKe9AOgQVtiRuLrYmE1bhEfwAPJFL+iIlgsLSvBVQCxfJseefkKWCu?=
 =?us-ascii?Q?Y2Jd+eXV88jNEU+LryPd/zhTTS8SMhkhQEcnpzM8Q0lH2fosQu8J2YNTogQx?=
 =?us-ascii?Q?OUbf6ycJhT/0GnpjDSOGkS5mzGrYvn0xLn2zVzRgMbHmyc85Jn67oi9CPFMS?=
 =?us-ascii?Q?yDjcxM/PDLIel71aevQ7BRlcg0gOoO1ThuqzhD7a1ynD+QCloKkqKDmBiPo/?=
 =?us-ascii?Q?I02p23UqDRURu5mJGdwgde6FnHJMHC5JHYwHbZa+gvA8Jym04VwLFnBAPrmO?=
 =?us-ascii?Q?E80VlrB1bbxyf8pNMp/dWCAQrx2kysw54PCRnl7Y3FWN1i5EYb+Y+oHtIQip?=
 =?us-ascii?Q?U8l/WJU0WQ=3D=3D?=
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
X-Exchange-RoutingPolicyChecked: I5jCM9KOJgHPZ/K7+ws/y+qUaM75IY1iwhqlmUb4Vt9cEZKB7UjcjDkb5KOHlwOAEV0qpbbdqnRRfFV619mMKY7/5f1BxpLc6e519bcd9Q6a228tCOXmnyZe2BTS/ywFJ0tjbDdBJEh7oFxwWI+L2u3PN0V0ZIll4GcakufR9b9+6ZT1hIp1Xgnsou6QGmYDaGFJ4P+rKPeJx7/VfDwlY0xjF2Vk5AZhBkdWnSp3j/MxwmdTx7RNQq4FCVCY4a27l+dT1a6D++rJ3eb/VafbjA5jjOFQy6hg7Wjs/TET7SkM+xttwHXeXo/XvbxVUklxmDiWI08Q464rGduw7j97Ig==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4db325c-04f7-48b8-6f14-08df3eaed862
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 22:14:38.5014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bH7ELt6BlKLxLSFF7k1vCSK1ZIuWKrWWDFRbscQ5bG8nQ1Sk3HkS966FQzQ0o+eY2r0IWMsEyLKlUApRSDKaS37SDeCyOyAnkR/Pqm7ZJ8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8622363CD
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
>Sent: Monday, November 2, 2026 5:39 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-xe@lists.freedesktop=
.org
>Subject: Re: [PATCH v13 11/16] drm/xe/vsec: Crescent Island PMT callbacks
>
>Thank you for your contribution! Sashiko AI review found 2 potential issue=
(s) to
>consider:
>- [Medium] drm/xe/vsec: xe_pmt_telem_read() leaves CRI discovery window
>remapped
>- [Low] drm/xe/vsec: mixed goto and scoped_guard() cleanup in reg callback=
s
>--
>
>commit dc4cd399324f5200a61e70ed93f8ba5b2a90435c
>Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
>drm/xe/vsec: Crescent Island PMT callbacks
>
>This commit introduces Crescent Island PMT register read and write callbac=
ks
>to access the discovery status and control areas via the indexed MMIO wind=
ow
>and registers the CRI PMT functionality.
>
>> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>> index a814d7151eeae..0f6e3be520c09 100644
>> --- a/drivers/gpu/drm/xe/xe_vsec.c
>> +++ b/drivers/gpu/drm/xe/xe_vsec.c
>> @@ -358,20 +358,120 @@ int xe_pmt_telem_read(struct device *dev, u32 gui=
d,
>u64 *data, loff_t user_offse
>>  	return ret =3D=3D 0 ? count : ret;
>>  }
>>
>> -static struct pmt_callbacks xe_pmt_cb =3D {
>> +/**
>> + * xe_pmt_read_reg() - read a crashlog register
>> + * @dev: the xe device that registered the callback
>> + * @guid: PMT guid of the crashlog instance
>> + * @reg: data read from the PMT data structure
>> + * @offset: which data to read from the PMT data structure
>> + *
>> + * Read the requested PMT register based on the pcie device and guid.  =
The
>> + * supported struct is the Crashlog Type1 Version2.
>> + *
>> + * Currently this is for CRI only.
>> + *
>> + * Return:
>> + * * -ENODEV device is not available (hotplug)
>> + * * -EINVAL invalid guid
>> + * * 0       success
>> + */
>> +static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 =
offset)
>> +{
>> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
>> +	void __iomem *disc_addr =3D xe->mmio.regs + xe->pmt.base_offset;
>> +	int ret =3D 0;
>> +	u32 inst;
>> +	int idx;
>> +
>> +	if (!drm_dev_enter(&xe->drm, &idx))
>> +		return -ENODEV;
>> +
>> +	if (FIELD_GET(GUID_DEVICE_ID, guid) !=3D CRI_DEVICE_ID ||
>> +	    FIELD_GET(GUID_CAP_TYPE, guid) !=3D CRASHLOG) {
>> +		ret =3D -EINVAL;
>> +		goto dev_exit;
>> +	}
>> +
>> +	inst =3D FIELD_GET(GUID_RECORD_ID, guid) =3D=3D PUNIT ?
>> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET :
>CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
>> +	disc_addr +=3D inst + offset;
>> +
>> +	xe_pm_runtime_get(xe);
>> +
>> +	scoped_guard(mutex, &xe->pmt.lock) {
>> +		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>> +
>> +		*reg =3D readl(disc_addr);
>> +	}
>> +
>> +	xe_pm_runtime_put(xe);
>> +
>> +dev_exit:
>> +	drm_dev_exit(idx);
>> +
>> +	return ret;
>> +}
>> +
>> +static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 =
offset)
>> +{
>> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
>> +	void __iomem *disc_addr =3D xe->mmio.regs + xe->pmt.base_offset;
>> +	int ret =3D 0;
>> +	u32 inst;
>> +	int idx;
>> +
>> +	if (!drm_dev_enter(&xe->drm, &idx))
>> +		return -ENODEV;
>> +
>> +	if (FIELD_GET(GUID_DEVICE_ID, guid) !=3D CRI_DEVICE_ID ||
>> +	    FIELD_GET(GUID_CAP_TYPE, guid) !=3D CRASHLOG) {
>> +		ret =3D -EINVAL;
>> +		goto dev_exit;
>> +	}
>> +
>> +	inst =3D FIELD_GET(GUID_RECORD_ID, guid) =3D=3D PUNIT ?
>> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET :
>CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
>> +	disc_addr +=3D inst + offset;
>> +
>> +	xe_pm_runtime_get(xe);
>> +
>> +	scoped_guard(mutex, &xe->pmt.lock) {
>> +		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>> +
>> +		writel(reg, disc_addr);
>> +	}
>> +
>> +	xe_pm_runtime_put(xe);
>> +
>> +dev_exit:
>> +	drm_dev_exit(idx);
>> +
>> +	return ret;
>> +}
>
>[Severity: Low]
>As reported by Sashiko on v11 [1], this isn't a bug, but both
>xe_pmt_read_reg() and xe_pmt_write_reg() in drivers/gpu/drm/xe/xe_vsec.c m=
ix
>goto-based cleanup (goto dev_exit) with scope-based cleanup
>(scoped_guard(mutex, &xe->pmt.lock)) in the same function, and duplicate
>nearly identical bodies differing only in readl() vs writel().
>
>Since the guid validation only inspects the u32 guid argument, could that
>check be performed before drm_dev_enter() to avoid the dev_exit label (or
>convert the remaining cleanup in these functions to a consistent pattern),
>and could the shared setup between xe_pmt_read_reg() and xe_pmt_write_reg(=
)
>be factored into a common helper?

This is correct.  Updated the code.

>[ ... ]
>
>> @@ -399,8 +499,15 @@ void xe_vsec_init(struct xe_device *xe)
>>  	switch (platform) {
>>  	case XE_VSEC_BMG:
>>  		xe->pmt.base_offset =3D BMG_TELEMETRY_OFFSET;
>> -		info->priv_data =3D &xe_pmt_cb;
>> +		info->priv_data =3D &xe_bmg_pmt_cb;
>>  		break;
>> +
>> +	case XE_VSEC_CRI:
>> +		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
>> +		info->priv_data =3D &xe_cri_pmt_cb;
>> +		xe->soc_remapper.set_telem_region(xe,
>CRI_IDX_TELEM_DISCOVERY);
>> +		break;
>
>[Severity: Medium]
>Can a call to xe_pmt_telem_read() leave the shared CRI_PMT_OFFSET MMIO
>window
>banked to a telemetry or crashlog payload region instead of
>CRI_IDX_TELEM_DISCOVERY when PMT discovery headers are read during probe?

xe_pmt_telem_read() will not be called until the xe_vsec_init is complete.

The other uses are not initialized until after xe_vsec_init is complete.

>On Crescent Island, both the discovery tables and the telemetry/crashlog d=
ata
>banks share the CRI_PMT_OFFSET window controlled by set_telem_region().
>During auxiliary driver probe in pmt_telem_probe() and pmt_crashlog_probe(=
),
>the Intel PMT drivers read the discovery headers directly from the ioremap=
ped
>CRI_PMT_OFFSET window without calling read_reg() or holding xe->pmt.lock:
>
>drivers/platform/x86/intel/pmt/class.c:pmt_get_headers() {
>    ...
>	memset(entry->disc_header, 0, header_bytes);
>	memcpy_fromio(entry->disc_header, disc_table,
>		      min(header_bytes, resource_size(disc_res)));
>
>	/* Used by crashlog driver */
>	entry->disc_table =3D disc_table;
>    ...
>}
>
>and:
>
>drivers/platform/x86/intel/pmt/crashlog.c:pmt_crashlog_header_decode() {
>    ...
>	header->access_type =3D GET_ACCESS(readl(disc_table));
>	header->guid =3D readl(disc_table + GUID_OFFSET);
>	header->base_offset =3D readl(disc_table + BASE_OFFSET);
>
>	/* Size is measured in DWORDS, but accessor returns bytes */
>	header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
>    ...
>}
>
>However, in drivers/gpu/drm/xe/xe_vsec.c, xe_pmt_telem_read() switches the
>remapper index to mem_region and does not restore CRI_IDX_TELEM_DISCOVERY
>before releasing xe->pmt.lock:
>
>	scoped_guard(mutex, &xe->pmt.lock) {
>		/* set SoC re-mapper index register based on GUID memory
>region */
>		xe->soc_remapper.set_telem_region(xe, mem_region);
>
>		memcpy_fromio(data, telem_addr, count);
>	}
>
>In addition, xe_vsec_init() sets CRI_IDX_TELEM_DISCOVERY without holding
>xe->pmt.lock.

This code is strictly sequenced.  The lock is not required here.

>If pmt_telemetry or pmt_crashlog probes asynchronously as a module or is
>rebound via sysfs after any xe_pmt_telem_read() call (such as from debugfs
>residency reads or an earlier telemetry sysfs read), wouldn't
>pmt_get_headers() and pmt_crashlog_header_decode() read telemetry or
>crashlog payload data instead of the discovery headers?

hmm, this sequence might have an issue:

read telem file
unbind driver
rebind driver...

I will reset the indexs to discovery in the data flows.


>[1] https://lore.kernel.org/r/20260923181115.2514193-38-
>michael.j.ruhl@intel.com
>
>--
>Sashiko AI review * https://sashiko.dev/#/patchset/20261102221314.119028-1=
8-
>michael.j.ruhl@intel.com?part=3D11
