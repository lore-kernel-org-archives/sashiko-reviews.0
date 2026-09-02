Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368F737A83F
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 17:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371785; cv=fail; b=UlR1ittWjNIDi2z3rtfq24GBKCuxb+MGDPK7pBE/XnyBTI6CBgo2dDsFWRDRvPf3R+oZk2zeGqenWfAPpphW0+j+SYM2TQpGAWdbc+hwEvGID62kK0+LS2fWr92mPJd5bU6pXGJDs4BnLSsaYiMjFtUOmWq1BaszRZcR/we2uZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371785; c=relaxed/simple;
	bh=s+l41AlZgd5Vvqbw0+ENjtqI/693ymDscETQb9MX+l4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zb16swgUbggGOFA8dZAIK9Obw++eF927sxKrYOTb4rwWMY1a/tiNQmGYIrvRXooVcyVDe38QVbt1lhttO1IvT+pFJP7iVXyO3rhfLtv+Wy/jsNV1Rg8BY694gqPFDQuNXE740L0Er3ioaHH5o/oTf9MIlO+ch2plUaOEfH16YsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewGfnR3t; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewGfnR3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788371784; x=1819907784;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s+l41AlZgd5Vvqbw0+ENjtqI/693ymDscETQb9MX+l4=;
  b=ewGfnR3tqZnIgz5P8+EKZNCnNyuJjdls7f9UUBVeGbnxOEp8CzHhZa1V
   7ZFTCjJBiWn7UzT/8kgrxPvw6/L7st9dDS2PZ8EnB9PdvHtvtISokqKU1
   4aMT5+ozzSmZjgiJZSHcU+l08O7vdfF3E03P7nwKg4BOFBNPdwXGc907J
   fhzQ7NUwvSnY5TyfjNdicwF6Nz4eBs1mkQiNR869zgr8Oyb2jYdKKCFJH
   PACgQwUomnneAUe1/WSmeNWbBudjYN2cyIcxw/23lpGhBCgcZw/RG73HF
   Kp/9ArSmt3IwVOpGQGC5SdmKxuSBwVMWl5I0RZER1Sjs80pYKAzk4HfWU
   w==;
X-CSE-ConnectionGUID: fBc6Y9eyQUiOPMNG2/lFjQ==
X-CSE-MsgGUID: kb0LlZaYSqGAF9hGrPrHrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88875156"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88875156"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 10:56:23 -0700
X-CSE-ConnectionGUID: pUQiKZp+QIm5E8KPwjEjYw==
X-CSE-MsgGUID: arUXMyxCRBCaP2s4CS4sVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273240399"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 10:56:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:56:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 10:56:22 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:56:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Go8HN/g+nXsedhoVdp3OCLf9k58T6ufBHpX/cE0/NaRs/zQuYL+pEpLbi1EA/p1CNj9i3TIO7G50cq4U8RbFwlYE3SWeNUX1JnbBM7pkkSJA0/p7rqCYZH5dxTHtnLwUlb2kumlKyhHWaGZXA0+sBhEuMyGnrpuK3SCfD66zDK42YpDrJIQMA8TeUakkj1fMkEd562r1iYSp+J/kPIxARRHt6VZ3E/RByuYLiqmcFjs+LBanpXmSzf3weLu5xm2MOv//oOY2UOJaqgxBfl7Hu5JU0WQz0LnW9XRs6jpLUJhIExcAPHMFuW3SWYS/rOyfWlB6FRFnusnGIGbeQFv4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+l41AlZgd5Vvqbw0+ENjtqI/693ymDscETQb9MX+l4=;
 b=atBT4SRrus/YpW0FJTprhiYWR8wOV2weMyNNdI9otPiakhlDadbLF7YSpk0vdBJgCbR2P+EsI0RpSS47J+7z9ErHc+mdjnMSHy7E58dL+bUFlcJec2p7n6godWt2d7YkWvis0/TqCaRrxYFql/t60FyNrWLMUFPMtxKOX503Z8x8PLnDi8X1ag/iLnMAspuH/nz/CdVlrAMpswJvGQknx94/Q73Dr8D7i3UfofMIr/XFV7EeUNEQBFEMy5MUSlKKJ7CIzwjHMiGwjovdXizOkAZFfFWuwUKmSTOszq54tpykUiNn0T5cTdYAkcGgk47WcQPAhan+v0LLumhLdMUVjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by LV8PR11MB8770.namprd11.prod.outlook.com (2603:10b6:408:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 17:56:18 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 17:56:12 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V20 10/15] drm/xe/configfs: Add disable_vram_page_offline
 attribute
Thread-Topic: [PATCH V20 10/15] drm/xe/configfs: Add disable_vram_page_offline
 attribute
Thread-Index: AQHdOusTwj8NiaaIb0CSW+cu5duFuba7fC6AgAAWbVA=
Date: Wed, 2 Sep 2026 17:56:12 +0000
Message-ID: <DS0PR11MB8718761CF516B0004449127581B72@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-27-tejas.upadhyay@intel.com>
 <20260902163505.EFA9E1F000E9@smtp.kernel.org>
In-Reply-To: <20260902163505.EFA9E1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|LV8PR11MB8770:EE_
x-ms-office365-filtering-correlation-id: eb56f87a-b41e-4b6f-a5fe-08df091b7a05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|4143699003|38070700021|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: aO3vH/UMywvV5dOsuATdPDuUz447YOLTmqxh4rxjEdCpih+46/NyIGw9TWhsHl8XsceiOxJHK9eHoUK3g5fPcSwJfUW2ihL1d/1fqlJt8VVsItSQzZnKJ4JdtgxyLWPsgwzROk6d4X5cDxOm78EcqfRgZkh3qCHowzwb1yExO0bpdjsrC3jt84xW9Lib/iF2S0icxadMwcTMQZwA2wtBzySdRWXMF0SHbsjyrUk7sj8tNW40tF5Wo+8G7ISPlkn0iWuVHkaIRuVdqqxRoU2cmHPlG/J4Fj4RWkiqHpE/HanX8ter5X8nPo7XWtykXmAbx4OmikL+RceEOgFrzCUnEQHlqhzVhNohCNYcYsZC8eIRF2Mu3as1BxuYCLvd3LqbSlxDjaDLZ4cMWtUVmxfE3RTKDxkkwtV7KknmowQKJCO2j4Fsg3Bv42qNhmdCc5sl+POy0TocP14Kng0cBt0cYe65goyQKE+zXf51L9Qteub72FdWMNRwkGRFdSPk3DqbPtUOD3zPSO2LUNh2w7absJZ50GrnfsaqvTspzjL/3nPSE9dUshdDptPbJMVZ83MQtxsnOaTc/m5Nkt/WZaqPZkbkBAqNwdTGooSvK78J5w2uFIFrAyHC9iD6w3JgZuiqIVLud82Ke3ra0xd6XUu9jp5sos35o9AigrALz5LizbU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(38070700021)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlBSYWFYMTFoZ1J5VzR1R0ZnVWRka0hUeWJQdWk1OFdwdThETWJES09CbHNM?=
 =?utf-8?B?MXF6aWpFODJxVlNhVFFoOEFKYWI0L3c3RTBGS0JwLzNrK2pxSTh1NWRNNWtp?=
 =?utf-8?B?MFp0Y285aHdOaTUzR2V0ZVBLOC9kV2ptUWJhVitWSE4xTHdKblVRK090eUdy?=
 =?utf-8?B?Rklua0V0bEdjbkQ5eU9JT2FsekhBQlZFRWk1cSt0TDlsd2VBbUFFNXRUa3Fx?=
 =?utf-8?B?bmM3M0FjTFI3RllFdXFlMGFUc1hUY2UxY0x1TkxRM0FVcFNvWndGaGJ5WDd0?=
 =?utf-8?B?ZGptbTgxSjJ6MHVONFNOVmV5bnU0ZERZNWREMmxRTGd2dVJQTkNYZ3pWdDFQ?=
 =?utf-8?B?anpZVStDMWtINHhuMmxEaDVkWTQ1NWZIc1RCRk9vZ1Q5bC9vUUNLcndScGpp?=
 =?utf-8?B?VHM3d2k4V0l1eTJid3JUdjRDNXlHazdNUTBHOTg0bDBOMlRPeHJXZlVMQ2dY?=
 =?utf-8?B?NmR4aUdaUnZqNm5pTTIzUlY4Qk9SS3oveEt3RmdXdDVqR1BwcmNnUWcrYlNz?=
 =?utf-8?B?OUMxV0hDVmJUNFNCejZwQUZtTDJxS1ViUC9lanBwTmk0TjQzTU15RXhvSVhw?=
 =?utf-8?B?WExJQzI2aU0yRUVxRlZIWk5hMGswaW1BVzB4ek9XVUxXdHBuTjEzN0FPSVJJ?=
 =?utf-8?B?ZENyUm5UcFNCZ3lIMXlaOUNhVkJZaWVvYTYxb25ReG9rV0xnaUxZbElDM1Q3?=
 =?utf-8?B?VEEwa0szZXc1SzdQUnZQM2QvMWxGZ1pHUFhNTStxTUl0MWhLVEE3SWtJTHFy?=
 =?utf-8?B?TXJTU01PZjR1dldJL2xpVDdXQzVoRHZnaWM3V29lVk5Kb0RUOG1USWw0M3M0?=
 =?utf-8?B?V2VFaVVRUFU0WWh5RkdYOC94eVRjcHpwZ1lQZGgwYWtRMko5OW1TTUdQVWxz?=
 =?utf-8?B?Yk1wZVNQb2tyUk1mQUFVWTRHdThuT0p3dWQwZXg3M2o1NEZENVdObmdMZjlY?=
 =?utf-8?B?eEU5VmpMZVlFMGxPTmVuL3ExekhOdFlRZHpzYVpzdGljakp4ODBIMis5QVcy?=
 =?utf-8?B?UkJJU0lIV3BjV1laMUsxVHFuQTU2S01WanFWdjlUdkRHLzJTNTNSSnZUL2pW?=
 =?utf-8?B?UWhqRit0RzBnbzJzNVVtY0Nwd0gxeXBSTXJmWmlHRmR1WUhFZHZ1VkRRcjli?=
 =?utf-8?B?ekhOMGtBWExIcGRuR001anhkRk9mM0NwczFCbUcvZ2xsU3llMFdnaThoWUJR?=
 =?utf-8?B?cXZCU0R5QXJCaU1JaUh4bGRDWlVnUElQV3NXdk5Hd3NvZVo3b3YyWmNwaWQ0?=
 =?utf-8?B?azczbXUzMmxnSVd0aGl5VjUyMTNYY1VkUS9SaWxjb3liN3QxRDlyY3FUUk5Z?=
 =?utf-8?B?TXNiem9tUmt2enpUeXdnYXdVci9QZ1QwK1ZISXBrYVNjbWlFU3NWS3h5L3Vu?=
 =?utf-8?B?RVc3Vi9WK29vUEFiRXlRQndxb1RQY0xEbVhnNzdaNktMZXI2OFVjWGRhWTF0?=
 =?utf-8?B?MS9lT1hyMHR5dVlvbkttclZ3dGRiQUp5d3BsTkdJSXlCT3g5QW51dUVKMUlF?=
 =?utf-8?B?TTI5VkRrdEdPM2JSZllWOENxN2EvZE5VVTZuM2FUL0ZWdW52R0V5RTNrdjdS?=
 =?utf-8?B?NlgvT0tmWUhBbnFCRDMyQzlYK3daQVllS2pGVEVrYmZQMWNQTUc2NWJZdWRW?=
 =?utf-8?B?bzFhTUJIdUVzelpmdDFxcFBTRTQ3Z2FOdnMyQkZudFJwOVF4YjUzbWwzd0hT?=
 =?utf-8?B?T3hIaUNkMWhxS3JzT2daZHBoYlpZWS9nbTlpVDhDbUNwVjJlYzVJM0RmcHZW?=
 =?utf-8?B?d1hPSTdsWktlWStRVUxmbTBRT2hqMkcybnc4VEo0R2UwQXluZFdZUUplR3pi?=
 =?utf-8?B?d0VoL2tUN21jR0U1R2tKaWxZZk14YnFlcW9HaW1tZSsxOVA1OW5IWXdwUGpW?=
 =?utf-8?B?L3hQNWUwRGhvZjVHWkEwTU5PUlA2OXpvTFE0akpna0NGbVZrZ1lyTFNTbCtJ?=
 =?utf-8?B?cDZGVHpCbkJFRDUrK0dXbzc5NUw1eUM3WHEvcUR0QTZGRGVaOXhtTzFoSEhE?=
 =?utf-8?B?ZlBjeUZNK25JTjk4RU9HSE5YTEQvRUN0ckNuNjRQNWlxelQ2WlE1WlZ2bVdp?=
 =?utf-8?B?Vm1UM3dCKzlxMWIxZjVld3hhNzdDZ25pTmF4eHRwUTZOQk9odkJzNkJjbnJm?=
 =?utf-8?B?WkRnSFNoNWZVOERSYUJoS3NBMkF6bXhUaDFVd0RRdUwwSExWMVMrdWFhdjZB?=
 =?utf-8?B?TkdSMjk1YWpxeGJ3TW5nU2RhYVV5Yk9mYXpPb1BuWlBJWXg3SlRpT1NhL0t1?=
 =?utf-8?B?NFZjNm9mQ0N6ZE5OTjZtZy9velJab2hJWmM1bmNaeFhsNjdJUkduY1BvMmVZ?=
 =?utf-8?B?OUdMYWtNeVBFY3l4OU0vdjNwWGthMmhYc0l6M09zWDd1blNSSUJpUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: H0cTnwFLLgbRBriw23jBDsLZ/OQNFWSSz6JH2lu84jJlSJkznT09B1qh2K8iuHlhCkV44vkUmiCVQ3ZFMAiBwQEf3ToZGYVnBGVDgqbkpxoB0XyPblvPwU2WAwmtst43p9S6xSUEVutfgEZx9aqhY5lxCNq9TTYFchm+gSh2T6VgK02WvRXA6LmHehz0ldyDI6b44tCk2ABqZbIlagI1cdsRtF9xoJJrfmR4244zHOc1BDz3gfjTGUITWejP7R5GSHfyny/ANUoG5ZPuz0U6T2IB9ii+9585p5xkUq9GVll+1j+40yfC5bP1XLBIC7WAPx1BuPkfgMH8zCGZVOBjLA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb56f87a-b41e-4b6f-a5fe-08df091b7a05
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 17:56:12.5677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Q9hgTXrTsy+KbTxv+a7uNAwWOkfxo+GnSczbPkmuQwHiYcaEYT+WWPa/J8vZGD7om3k3HXCovShoKTqUyBqLTDKRHMKsUsOeDg0YMbhU2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8770
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMDIgU2VwdGVtYmVyIDIw
MjYgMjI6MDUNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29t
Pg0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggVjIwIDEwLzE1XSBkcm0veGUvY29uZmlnZnM6IEFkZA0KPiBkaXNhYmxlX3ZyYW1fcGFn
ZV9vZmZsaW5lIGF0dHJpYnV0ZQ0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlv
biEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykNCj4gdG8gY29u
c2lkZXI6DQo+IC0gW0xvd10gTWlzcGxhY2VkIGRvY3VtZW50YXRpb24gY29tbWVudCByZXN0cmlj
dGluZyB0aGUgYXR0cmlidXRlIHRvIENSSS4NCj4gLS0NCj4gDQo+IGNvbW1pdCA0Mjk5ZjhmNDYw
NDFmY2UzNjI0NzMzNjE5MzhiMzUwZmQzMmZlNzAxDQo+IEF1dGhvcjogVGVqYXMgVXBhZGh5YXkg
PHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gDQo+IGRybS94ZS9jb25maWdmczogQWRkIGRp
c2FibGVfdnJhbV9wYWdlX29mZmxpbmUgYXR0cmlidXRlDQo+IA0KPiBUaGlzIGNvbW1pdCBhZGRz
IGEgbmV3IGNvbmZpZ2ZzIGF0dHJpYnV0ZSBkaXNhYmxlX3ZyYW1fcGFnZV9vZmZsaW5lIHRvDQo+
IGNvbnRyb2wgaG93IGJhZCBWUkFNIHBhZ2VzIGFyZSBoYW5kbGVkLiBJdCBhbGxvd3MgYWRtaW5p
c3RyYXRvcnMgdG8gZGlzYWJsZQ0KPiBhY3RpdmUgVlJBTSBwYWdlIG9mZmxpbmluZyBvbiBDcmVz
Y2VudCBJc2xhbmQgKENSSSkgcGxhdGZvcm1zLCBmYWxsaW5nIGJhY2sgdG8NCj4gbG9nZ2luZyBv
bmx5Lg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2Zz
LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jDQo+ID4gaW5kZXggMDUy
Y2NlOTYyMTYxMS4uYTljNzI1MDRjOGE0NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfY29uZmlnZnMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25m
aWdmcy5jDQo+IFsgLi4uIF0NCj4gPiBAQCAtMTU3LDYgKzE1OCwxOCBAQA0KPiA+ICAgKg0KPiA+
ICAgKgkjIGVjaG8gMSA+IC9zeXMva2VybmVsL2NvbmZpZy94ZS8wMDAwOjAzOjAwLjAvZW5hYmxl
X3BzbWkNCj4gPiAgICoNCj4gPiArICogVGhpcyBhdHRyaWJ1dGUgY2FuIG9ubHkgYmUgc2V0IG9u
IENSSSBiZWZvcmUgYmluZGluZyB0byB0aGUgZGV2aWNlLg0KPiANCj4gW1NldmVyaXR5OiBMb3dd
DQo+IERvZXMgdGhpcyBkb2N1bWVudGF0aW9uIHN0cmluZyBhcHBseSB0byBlbmFibGVfcHNtaSBv
ciB0aGUgbmV3bHkgYWRkZWQNCj4gZGlzYWJsZV92cmFtX3BhZ2Vfb2ZmbGluZSBhdHRyaWJ1dGU/
DQo+IA0KPiBCZWNhdXNlIGl0IGlzIHBsYWNlZCBhYm92ZSB0aGUgIkRpc2FibGUgVlJBTSBwYWdl
IG9mZmxpbmU6IiBoZWFkaW5nLCBpdA0KPiBhcHBlYXJzIHRvIGRvY3VtZW50IGVuYWJsZV9wc21p
LiBIb3dldmVyLCBzaW5jZSB0aGUgY29kZSByZXN0cmljdHMNCj4gZGlzYWJsZV92cmFtX3BhZ2Vf
b2ZmbGluZSB0byBYRV9DUkVTQ0VOVElTTEFORCAoQ1JJKSwgaXQgc2VlbXMgdGhpcw0KPiByZXN0
cmljdGlvbiB0ZXh0IHdhcyBpbnRlbmRlZCBmb3IgdGhlIG5ldyBhdHRyaWJ1dGUgaW5zdGVhZC4N
Cj4gDQo+IEFkZGl0aW9uYWxseSwgcGxhY2luZyB0aGUgbmV3IHRleHQgaGVyZSBwdXNoZXMgdGhl
IG9yaWdpbmFsICJUaGlzIGF0dHJpYnV0ZSBjYW4NCj4gb25seSBiZSBzZXQgYmVmb3JlIGJpbmRp
bmcgdG8gdGhlIGRldmljZS4iIHRleHQgZG93biBpbnRvIHRoZQ0KPiBkaXNhYmxlX3ZyYW1fcGFn
ZV9vZmZsaW5lIHNlY3Rpb24sIHdoaWNoIHJlbW92ZXMgaXQgZnJvbSB0aGUgZW5hYmxlX3BzbWkN
Cj4gc2VjdGlvbiB3aGVyZSBpdCBwcmV2aW91c2x5IGJlbG9uZ2VkLg0KDQpOaXQsIHdpbGwgbm90
IGJsb2NrLiBXaWxsIGZpeCBpbiBmb2xsb3cgdXAgc2VyaWVzIGlmIHRoaXMgaXMgbm90IGJsb2Nr
ZWQuDQoNClRlamFzDQo+IA0KPiA+ICsgKg0KPiA+ICsgKiBEaXNhYmxlIFZSQU0gcGFnZSBvZmZs
aW5lOg0KPiA+ICsgKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gKyAqDQo+ID4g
KyAqICAwLCBuLCBOLCBmYWxzZSAtIERvIG5vdCBkaXNhYmxlIChPZmZsaW5pbmcgaXMgYWN0aXZl
IC0gZGVmYXVsdCkNCj4gPiArICogIDEsIHksIFksIHRydWUgIC0gRGlzYWJsZSB2cmFtIHBhZ2Ug
b2ZmbGluZSAoTG9nZ2luZyBvbmx5KQ0KPiA+ICsgKg0KPiA+ICsgKiAgRXhhbXBsZSB0byBkaXNh
YmxlIFZSQU0gb2ZmbGluZTo6DQo+ID4gKyAqDQo+ID4gKyAqICAgICAgIyBlY2hvIDEgPg0KPiAv
c3lzL2tlcm5lbC9jb25maWcveGUvMDAwMDowMzowMC4wL2Rpc2FibGVfdnJhbV9wYWdlX29mZmxp
bmUNCj4gPiArICoNCj4gPiAgICogVGhpcyBhdHRyaWJ1dGUgY2FuIG9ubHkgYmUgc2V0IGJlZm9y
ZSBiaW5kaW5nIHRvIHRoZSBkZXZpY2UuDQo+ID4gICAqDQo+ID4gICAqIENvbnRleHQgcmVzdG9y
ZSBCQg0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcNCj4gaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYwOTAyMTQ1MzQzLjQ2NTY4Ni0xNy0NCj4gdGVqYXMudXBhZGh5
YXlAaW50ZWwuY29tP3BhcnQ9MTANCg==
