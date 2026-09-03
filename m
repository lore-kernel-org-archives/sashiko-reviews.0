Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6A14D90AE
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 20:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467720; cv=fail; b=AgG61Od1HlVy4XEkSB68O0EuYD7h7PWvag+ShvzYAc2RY43+t6tVlrNyQ/Ha/zdU66LHaa6AMzvWciImXw/L2xRqUAhsLkXsA3TWSwSx834hkwbmjWVdU7meZb3AtCK5wud4CP/W+VwXLiKkZ9OgZfUjexVcUg+mqAvFSM1SkNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467720; c=relaxed/simple;
	bh=lYrMf3oIse5hZjA0+NtwmyCsIj52yx4vIuMZLcP/d3I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P/SsMpWflkS6ltiSL0rpIMjgYKZptT7vjrTI9MLhKN5mRO73UEKiLqLGkG7JFWLIsn7IqlERy9ygLNSRwLVHjKPb4Ckfauc/oIcrHnBGMErbPkPy9NVCKMqqX9AphgtVWGU6dt2n/qAGKUmsioRw4XUb3RiP4fgmPsXlXERlGio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=niPAKvVD; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="niPAKvVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788467711; x=1820003711;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lYrMf3oIse5hZjA0+NtwmyCsIj52yx4vIuMZLcP/d3I=;
  b=niPAKvVDsHOAg4fseCfEb2gDp/+CqF+ueSwS0mVQhiUpee3aTLiDa5V2
   7LPhsrzp7L252aCfXKVRRfyDnOWPs5mlV/0YwUTy+nuP1XFmaiOHzo8HE
   nx70XFMIgAxFiNZbEAz8C7DhBsKOiwS8MZ+EEftB9pfM3niIK4M6AQux1
   TRBS+3YAXeBlxP05YRG3BODgL7kQqIeBWqfoGbvJAmckbkB+1DCZ/LGDA
   /YqaBUAPjHvlenr3waKoLvtCYWds99lLs0XkB1/WRalqvxc0Z2xV6nSyC
   Rl+pxJjgLCvg2HPOmpRFh+Dnrushx/QZNkcKj4DlU04nYBFMDKCrVJPaC
   A==;
X-CSE-ConnectionGUID: YoHM+oRWR4aEYEd6F1aksA==
X-CSE-MsgGUID: FRCQmHPvRV6kg8MT3JjK7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88887371"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88887371"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:35:02 -0700
X-CSE-ConnectionGUID: rd0jF1huTcexiZ+v8O9qYQ==
X-CSE-MsgGUID: Z+y5tq9gT+izbuchljyUIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273986374"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:35:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 13:35:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 13:35:02 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.20)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 13:35:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4mdOYb9xTePXK9+wDdNZsNi6YGiFXXQhvoTmkJqe7CVQWyjti1cpuJM3atNH9KLDAuLACypWMaFcljptLcZM6FukBWMZkfF7E+CzNoC3FnqZ4+LZtByTSfy5ds3Cwc2rTJI1YGPVe2IqWxSdjSQJVEg9I60BGobwEviFg05k61Sg2js5NiisCe42MeZiP17/cyluKvc7xwmBobS35mmzd76gbwljN/tqBceihKflrfa6lRd5VpGlLjoTyKGuokT+Ecvy9piijRP7xfzg+AloqCF/DuRT5QL1TrnpkevfowJEJLQ3y6EkE9GX9rFgNemkfUj/CMVX/iMsJHfF8P0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYrMf3oIse5hZjA0+NtwmyCsIj52yx4vIuMZLcP/d3I=;
 b=xbLcybkS1ndHJH5evZ6I/PI6o4pZDAoTu99LGiNjAlM9xw6siG0pHXTYDWDLego4lO5u0JJCsloWlfX/PgaKbC02iUbI7a++BFHzmlZxTJOHyVwpr+J8Q9jO1bbP67II4zXYoaWw+8WTq44Mi4pUlS/WKEWaJDj5ZfPU1eGDXHkrDb5r+RTtBn00vqmFDx/oG3vTwACNXqlTmEEC+qKFCboVjzJeldefDzfZdEInQ1TaoUe80j6U2WS2kXIdON0CeJGQnoXz9gs7M8ggqCPValrW5l3+RRxA8SkWMZ6gzde6+6RBhHkA27Do+Go5LxtpAda3fPbGf65XA7fU4HG4dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SN7PR11MB8111.namprd11.prod.outlook.com
 (2603:10b6:806:2e9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 20:35:00 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 20:35:00 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 09/18] drm/xe/vsec: Add DOC text for VSEC
Thread-Topic: [PATCH v5 09/18] drm/xe/vsec: Add DOC text for VSEC
Thread-Index: AQHdO+BUM4196CGdF0+1rVH1Chapkra9SsyAgAAEtMA=
Date: Thu, 3 Sep 2026 20:34:59 +0000
Message-ID: <CH3PR11MB0461491B475B375A191CBDE710C1B62@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-29-michael.j.ruhl@intel.com>
 <20260903201744.138211F00A3D@smtp.kernel.org>
In-Reply-To: <20260903201744.138211F00A3D@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SN7PR11MB8111:EE_
x-ms-office365-filtering-correlation-id: 12008368-be4a-4dd2-73dd-08df09fad336
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|18002099003|22082099003|38070700021|10067099003|4143699003|11063799006|3023799007|56012099006;
x-microsoft-antispam-message-info: rjFQnJ16OxfGSYVZnI0ceVsLVFbs6+Nx+mN651MukrperAPK/MNy8GaV7JO0lbqElLNlTZelTZZWFWax63ygZieUcTcXHAsFvXS5e4ssQmp9lc8unE8sUwINfLAn2J3hn3nN00XiAlq1vgqEeg4wlyOhHID8YOTJA0qKnXOhiHbJUpU+0XyB0qtmApHbEzm+9nSzqibLz0WSynRCtYA0N+vaLZ4LYFwu6Kiz1C7EJawvoEgN95q6xUqkaWvQWbjMbLyC0x1WOGro0riPcItqVPWfm3d4O2wvmSvNAShF4KXy0u3hOPUaGPu0zvLDDS0ZQxuxEBk50lII/E7hwPgHbNV5/HUAkD9WE7oBlEG/t06QMOVtHQHdsww0Wu9JEv7NeTTCPmd5smw+T4civ1RtDP7xo2llMSRlht2v4yGoAgZ5ylMR9ySgUol5N1T53uYgqtBNrxM/7nPOH1yqYm6Mp5Avw20tlvBsDCRFmhNOfInqCLRokz/qqSLRWgD08s4WhyqGReqHbA9rL4h+o8/Kf0lUeX/cxh2xWn9DDEHr5S/Oa82dam5XEBrx+oRusBzEUE7JSZeNKpPCTfMD09yT4azsOQ6wCBwl+IUd4tr4+DzZAYXfqGwG+ZXY0dmW+2BBptObm2J8HBzIm9/LuzYhKj0GFVfE2o7ibWc2Hmwpjng=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(38070700021)(10067099003)(4143699003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0xGSDN3MlJnbjFRKzNhRDdrYTNna3lrYmJrV2xEYlhiV3R3VGl5MUNjeG9K?=
 =?utf-8?B?YUx6QzVwanVvOFhYdW5IR01BekdLMWk3NVRiVUdEa0pZNVp5Q2dsOEptb3Fn?=
 =?utf-8?B?OEhtZWtESmxwN2hDVlUraHA3eGdiU2E3dXhZMXBUZ2JpcU96RjNaV0dNUE5x?=
 =?utf-8?B?UUQ5cEdIVFZKTU5jeXBmUHBoY2FmNXlERkRpOWpjL05BLy9wQ3JOQm0vMUti?=
 =?utf-8?B?aVlWQXhFUVJBTXlJaEVBMTFuOGVJQzg2azFKQXdzZVBNQmJKUmhnM1J3SHo0?=
 =?utf-8?B?WmxCMEJMTDZLSUMzMjdTMmhoZTRORm5vR3FlbDk2d1M3YzhKV1BmZURiL0VF?=
 =?utf-8?B?ZThQTWI1Tmo4eFdGTDdiakppWGxWUHlhcXJXeTlwM3c0R09tQjgzN1RUdi94?=
 =?utf-8?B?RWttb0drbWNCQ21HaFNzOUgwUUJabU1IMUVsSjQrcitOeVZFakxNR3ZPekZ1?=
 =?utf-8?B?dVRaWDdjbXc3dFZSNmpVcGJyVGpCN2JMYXIvdU9BbHZuc0dubHFtUVowSXU0?=
 =?utf-8?B?aXFVcHgwVlp5VXNWeHFROXQ2ckE4REtLRW92d1BkU0pEak5vTGI5VnFKK1kw?=
 =?utf-8?B?RTRmRzlwTmFyaVU4S0sxaUo0RGhhNDJFL0N5TlI3RkJlczJBSlUzQWhQQUxa?=
 =?utf-8?B?Q3BkTTh3VlRZK1dtVytHK2drR1J0cEpPWW02N2p1ZW5wQ2djdDF6MGt3TmhH?=
 =?utf-8?B?ekEwNmlhZTJxY3BNRW1lNzc1aEhMVUhVbnBoaG1rWFRsQUNUaGpCOEcrN3VJ?=
 =?utf-8?B?d0c5THhOVGk2U3NGY2tKK3ppdFdzYTlqMFJEbE81OVF3TVpObVhrVTU2UmFq?=
 =?utf-8?B?U0xiRXVublZqWDJ2Y2dOdnp2S1hGQWdWeTExekxLYWZmS3p6WW9EVCtwdWYy?=
 =?utf-8?B?K2ZjN3k0blUvTWcrUXI1NXJqNlY3UlFVeS9wNUdVVXZwbkxGektHMzR1YmFp?=
 =?utf-8?B?bHkyaGphVUNpZEROS0RyNThnS1pRME1NbGgyZnVaUmZ5RHhWRjZMU0k3VW4y?=
 =?utf-8?B?QXVXdllSc2JwK3poNVZIeXpvSzJyN0p5aHM0NkhmRWtPeitneGVvSlJiOG40?=
 =?utf-8?B?Y0tXTjVCcUxYM3h5VVFMM3VDT3ZjWDhKYlBtek5GRU1jTENIUWltZGE5dHFa?=
 =?utf-8?B?MVQ2UU1PSzFLUkJqcDZKVkU4cW10dndjWm05YTRsL3dkdXV3b1RaNFNCejhX?=
 =?utf-8?B?RUszc08vZ2YxRzlkNWZDbnpGVzNoYlBjOElQaU1YeEtmQ2hBemxGR3MraDRa?=
 =?utf-8?B?WVlia0tvNmZONGtYekpaNTczd2JHay80UzdneFBodUIvOGVRWnluRzhSMjVt?=
 =?utf-8?B?a1dtT3J3R2orY3NEMUFWUCtPVkhEMk4zU2g5dDZ1RXUyZHR2dnFWRldMUCtv?=
 =?utf-8?B?UFR4bUlZNE9LWTRUMGZZYW9ldnhhbStnSkhtT2FxV0FoeExXVlZSYU9oTmFa?=
 =?utf-8?B?MXBQd21nRlVOMnhNVDhwY2RpbEJRUUhKRVZuenAvejNtdGlZbjh2cmFmRGtM?=
 =?utf-8?B?YXAybGhubW9CclFhWFhwSjdXRXF3dUYzTjEzWmJqNzJoUWVPTWE1MVVYcUpr?=
 =?utf-8?B?VmFJYjFPK3Rid29MYUlETmhPUjk3SjkrbVF0eGFYemVBbDVJaGVRZ2lLRmVa?=
 =?utf-8?B?ZVVMaXlyUjJnUzZjaXM1dXZmTlRqVE1Kd0VVeE1UZysyc0crdUQweGtxTktL?=
 =?utf-8?B?MzB6aUtLTnVDVnhOSENQSkJ4aVdFYTVUZDQ2OW5TMUZpeTVzVUJvbGIyUCtP?=
 =?utf-8?B?clUrc0xwYlV1eVUzRkxWdkc0cjFYdWdndEQwQTFjS0lFV2RYWkkzSTgrL05Q?=
 =?utf-8?B?aFA1S3c3VmNWaG44QWdqU0ozcGhsU0wwQXEyb1ZQbnVmSFhCOEZlbDgzQ2h2?=
 =?utf-8?B?Sm84VGhEUWdBd3RNUXlSS2NpOUJaSHp1dlpuSDBwRWgwempaWTBYUVhZWEJC?=
 =?utf-8?B?YXRjYzdRME0rZDYzV2xneDFJOGtMeTFGRU50TmJVc2hENVUweXFkMHh6MW94?=
 =?utf-8?B?dm5QZzVlaDRKcG1MVFJEYUlKOWRmYm5pUVlZUDBRc3Z2aTlpK2J3U2pIRG5P?=
 =?utf-8?B?Tm00ZmFCKzFaMUNqdU5LdWRJUVQ3bUZWNktwMEV0WWZkUXBoZENtcWI2YU9V?=
 =?utf-8?B?V004TkxZMFFZS2p3NHJhTUoyMnpwSUVlMmROTG1rc05LS0JxTnZ3cjgyQTFy?=
 =?utf-8?B?S1JjTWc4YWQ5N29sVUJDQ3BmTFZDZ3U3RmFxdnJKeG5YcXpodmNybkIwTEdZ?=
 =?utf-8?B?Tjg1eGM3UTg1NWYyM3Jiam1VWlVncEZtY0RJcUl2SVc0eTRzd1lHVmVsQlBC?=
 =?utf-8?B?K2V3NWlCMkxzMm1FU2NmcWRKRUxza1gyMDlCSjdFZGdnZEUyVnJBQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 07pTxvef+/sKPooXXDI0iXLejh5A0QF2AdD+2PvpQqiaZRBPB2Uj5DlJxpzXCI/CyHuW4mSpiycrP/Fi7mEJQ/KgldUFWcY3tOAC2b9pUboP4TRkhSAsUgDbIm26Q8LV4AS6Id2QEmQq46tFIXdNoY8GhXO/GRXCzLWo0YwGgcEoSaYunjbnKggjp9UAqL9Z6l3ryChAOs+h1S/+lHyWgBgWI/YaZUKjaVeBjnQlyIIPg3+PhK1HmgzbPPlfjxqIbNMkhiCwNwBKYkPTJes0JWiu1bW+QmCGBuw0MCegpOzITKoQ1zj+Hv7Zf+f3ja7JZ2VkUYiCKV1ltW1McKEiPg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12008368-be4a-4dd2-73dd-08df09fad336
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 20:34:59.9424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F0sENbF84F9F5ac6ltYi2d/brSzxQDf5gftg2O5IVJL5sIYVkBr5fKtJ29FJRHFuncdtA9H29mJHC5dd7sj0RhE7aKVP0+EYHHF5721wAZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IHNhc2hpa28tYm90QGtlcm5l
bC5vcmcgPHNhc2hpa28tYm90QGtlcm5lbC5vcmc+DQo+U2VudDogVGh1cnNkYXksIFNlcHRlbWJl
ciAzLCAyMDI2IDQ6MTggUE0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBp
bnRlbC5jb20+DQo+Q2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjUgMDkvMThdIGRybS94ZS92c2VjOiBBZGQgRE9DIHRleHQgZm9yIFZTRUMN
Cj4NCj5UaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBm
b3VuZCAyIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPmNvbnNpZGVyOg0KPi0gW0xvd10gSW5jb3Jy
ZWN0IGtlcm5lbC1kb2MgdGFnIGZvciByZXR1cm4gdmFsdWUgaW4gYHhlX3BtdF90ZWxlbV9yZWFk
YC4NCj4tIFtMb3ddIFRoZSBuZXdseSBhZGRlZCBkb2N1bWVudGF0aW9uIGZpbGUgYHhlX3ZzZWMu
cnN0YCBpcyBub3QgaW5jbHVkZWQgaW4gYW55DQo+U3BoaW54IGB0b2N0cmVlYC4NCj4tLQ0KPg0K
PmNvbW1pdCAwMTEzNzNkY2YyMGVkNzAxOGIxMjc5MzcwYWU4YjFhZjM0NmZmZmY1DQo+QXV0aG9y
OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj4NCj5kcm0veGUv
dnNlYzogQWRkIERPQyB0ZXh0IGZvciBWU0VDDQo+DQo+VGhpcyBjb21taXQgYWRkcyB0aGUgbmVj
ZXNzYXJ5IGZpbGVzIGFuZCBkb2N1bWVudGF0aW9uIHRleHQgdG8gdXNlIHRoZSBET0MNCj5zeXN0
ZW0gZm9yIHRoZSBWU0VDIGNvbXBvbmVudC4NCj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2dwdS94ZS94ZV92c2VjLnJzdA0KPmIvRG9jdW1lbnRhdGlvbi9ncHUveGUveGVfdnNlYy5y
c3QNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAwLi4xYTg3
NTQ4NDg5ZWE5DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS94
ZS94ZV92c2VjLnJzdA0KPj4gQEAgLTAsMCArMSwxNCBAQA0KPj4gKy4uIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKQ0KPj4gKw0KPj4gKz09PT09DQo+PiArVlNFQw0K
Pj4gKz09PT09DQo+DQo+W1NldmVyaXR5OiBMb3ddDQo+VGhpcyBpc24ndCBhIGJ1ZywgYnV0IHNo
b3VsZCB0aGlzIG5ld2x5IGFkZGVkIGRvY3VtZW50YXRpb24gZmlsZSBiZSBpbmNsdWRlZA0KPmlu
IGEgU3BoaW54IHRvY3RyZWUsIHN1Y2ggYXMgdGhlIG9uZSBpbiBEb2N1bWVudGF0aW9uL2dwdS94
ZS9pbmRleC5yc3Q/DQo+DQo+V2l0aG91dCBhIHRvY3RyZWUgZW50cnksIHRoZSBkb2N1bWVudCBy
ZW1haW5zIG9ycGhhbmVkLiBUaGlzIHRyaWdnZXJzIGENCj5TcGhpbngNCj5idWlsZCB3YXJuaW5n
IHN0YXRpbmcgdGhhdCB0aGUgZG9jdW1lbnQgaXNuJ3QgaW5jbHVkZWQgaW4gYW55IHRvY3RyZWUs
IGFuZA0KPm1ha2VzIHRoZSB0ZXh0IHVucmVhY2hhYmxlIGZyb20gdGhlIG1haW4gZ2VuZXJhdGVk
IGRvY3VtZW50YXRpb24gdHJlZS4NCg0KWWVzLCB0aGlzIGlzIG1pc3NpbmcgZnJvbSB0aGUgaW5k
ZXguICBJIHdpbGwgYWRkLg0KDQptDQoNCj5bIC4uLiBdDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3ZzZWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4+
IGluZGV4IDQ2OGEyMjEzNzhmYWYuLjUyMjNiZmU1MGVkZTYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dnNlYy5jDQo+WyAuLi4gXQ0KPj4gQEAgLTE0MCw2ICsxNTEsMTcgQEAgc3RhdGljIGludCB4ZV9n
dWlkX2RlY29kZSh1MzIgZ3VpZCwgaW50ICppbmRleCwgdTMyDQo+Km9mZnNldCkNCj4+ICAJcmV0
dXJuIDA7DQo+PiAgfQ0KPj4NCj4+ICsvKioNCj4+ICsgKiB4ZV9wbXRfdGVsZW1fcmVhZCAtIEdp
dmVuIGEgZGV2aWNlIGFuZCBhIFBNVCBHVUlELCByZWFkIGRhdGEgaW50byBhDQo+YnVmZmVyDQo+
PiArICogQGRldjogdmFsaWQgWGUgZGV2aWNlDQo+PiArICogQGd1aWQ6IFBNVCBHVUlEIChmcm9t
IHRoZSBQTVQgZGlzY292ZXJ5IHN0cnVjdCkNCj4+ICsgKiBAZGF0YTogYnVmZmVyIHRvIHBsYWNl
IGRhdGEgaW4NCj4+ICsgKiBAdXNlcl9vZmZzZXQ6IGEgdXNlciBvZmZzZXQgcmVsYXRpdmUgdG8g
dGhlIGJlZ2lubmluZyBvZiB0aGUgZGF0YSB0byByZWFkDQo+PiArICogQGNvdW50OiBieXRlcyB0
byByZWFkDQo+PiArICoNCj4+ICsgKiBSZXR1cm5zIC1FSU5WQUwgZm9yIFZGIGFuZCBQTVQgV0FU
Q0hFUiByZXF1ZXN0cw0KPj4gKyAqICAgICAgICAgY291bnQgICBudW1iZXIgb2YgYnl0ZXMgcmVh
ZCBvbiBzdWNjZXNzDQo+PiArICovDQo+DQo+W1NldmVyaXR5OiBMb3ddDQo+VGhpcyBpc24ndCBh
IGJ1ZywgYnV0IGRvZXMgdGhpcyByZXR1cm4gdmFsdWUgZGVzY3JpcHRpb24gdmlvbGF0ZSB0aGUN
Cj5rZXJuZWwtZG9jIGZvcm1hdD8NCj4NCj5UaGUgc2NyaXB0cy9rZXJuZWwtZG9jIHRvb2wgZXhw
ZWN0cyByZXR1cm4gdmFsdWVzIHRvIGJlIGZvcm1hdHRlZCB1c2luZyB0aGUNCj4iUmV0dXJuOiIg
c2VjdGlvbiBoZWFkZXIuIE5vdCBmb3JtYXR0aW5nIHRoaXMgY29ycmVjdGx5IGNhdXNlcyB0aGUg
dG9vbCB0byBmYWlsDQo+dG8gcGFyc2UgdGhlIHJldHVybiB2YWx1ZSwgd2hpY2ggY2FuIHRyaWdn
ZXIgYSB3YXJuaW5nIGFuZCByZW5kZXIgaW5jb3JyZWN0bHkNCj5pbiB0aGUgZ2VuZXJhdGVkIEhU
TUwgZG9jdW1lbnRhdGlvbi4NCj4NCj4+ICBpbnQgeGVfcG10X3RlbGVtX3JlYWQoc3RydWN0IGRl
dmljZSAqZGV2LCB1MzIgZ3VpZCwgdTY0ICpkYXRhLCBsb2ZmX3QNCj51c2VyX29mZnNldCwNCj4+
ICAJCSAgICAgIHUzMiBjb3VudCkNCj4+ICB7DQo+DQo+LS0NCj5TYXNoaWtvIEFJIHJldmlldyDC
tw0KPmh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkwMzIwMTAwMi4xMDY0ODg5
LTIwLQ0KPm1pY2hhZWwuai5ydWhsQGludGVsLmNvbT9wYXJ0PTkNCg==
