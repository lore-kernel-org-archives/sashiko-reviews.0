Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D413219D07E
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 05:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449375; cv=fail; b=qu0Koo5BzIWfBxM8Zx3AOw/2yo60QgpikwmkvHPEbMXDjXHrCgFhkhXzIxUE/NpfQ0CtEbIHdbBcTJ+/lCJrPO/D49omjBSgCk0CRtpK9v4APYDNVyXhg1tBPbiMs3KWEgXyLu++Ml5TjtYFxYj5CWW6vx/hu6CDax9EBrQ8GJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449375; c=relaxed/simple;
	bh=pq5E2boILrrSqX2Us1Zrl2/LSXWIyijhgF1qDy1LXD0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cidTUdJpIPSJ8dv+lFxGhyfMbnDbTSRZFPmT5i3/saoYH2NtJuKGNHpZc8+IVtGWZ965LuvM7E2x9rgV+R2GDLDclD8r2r+4dIbmb5otJVC1S3IzOe+8jW3SJ5KG8KfjOIx4jevI0gEfh+ONPskzsMU/au7aqLCv5EDfN0ehv08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzD/jsoY; arc=fail smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzD/jsoY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789449373; x=1820985373;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pq5E2boILrrSqX2Us1Zrl2/LSXWIyijhgF1qDy1LXD0=;
  b=DzD/jsoYIA2wFkbnTutrdGZ1zJde+wadXhBCifqtJD/N4UeWjThyyog7
   vVexYISJ+znr3TGqNXwkqUpTQrtnCTuvccJLeq9BwXjNXjla2hWUTLanz
   Cm6OTO3E5wOAjFawseJXVm7TvjDTeHaaHCNf8gWUnaow7a8IIcYRB9gEU
   p6xyUY+Z95cuwgXf47i2Sg/Qks6TlIHV28Lzk4PAlJ/+qiA6mEwQChfAF
   UFS0l2mj4kW6FkcWwPvljFORBW78dw9cYs/0QFeqfWC8U7ymoOKVVR3LW
   QrkqpjXWjNVYABYwfxwFmBrFjAJV36A7+pf3EQK3pN0yymn/hGfzQOf8y
   g==;
X-CSE-ConnectionGUID: t5kylznxS1GmodhxmYy2NA==
X-CSE-MsgGUID: mhMSOZa4RhyqlEcptfHlkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="316352"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="316352"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:16:12 -0700
X-CSE-ConnectionGUID: FyT5pm3OQ6+kpMtvjYCYQg==
X-CSE-MsgGUID: R2MpicC7SfekUAuHuD/GRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276616411"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:16:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:16:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 22:16:11 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:16:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6avImseZ/Tkecr5ZoayJBTWMteE5SbQtuJNtGzRNdUW7zA4WuPScNSn65o8x5qimyIiFoM7ZqjF6KygP3GR097lhYsYFaAc2RZfBiUleOfoUM0uS62Q9NQrs3VYCmybOx4NK7M2TremVxVJ+eDFOv6h8VculYxhzHwd+/7gXVU3WsvpLca7e89enGihX4Gs5TY+j1mXLh2NrxU7tg9GEqtlpdqYi/J+bbuS8TnZrmNsWfi4pgQaOFtPs5tGPsarL/p2D1++xLlFn3QuRfFXFrWzr3+GHHZjGwE8UrLy6MOTzN4k/h39zOJ4IjcLDYP3HSzBxJ2T+zXO2KPLKjOyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pq5E2boILrrSqX2Us1Zrl2/LSXWIyijhgF1qDy1LXD0=;
 b=ojU4PuOcwSkAQGAC8U+BN3R41YIB6JePmHWxK7Mw7mfI1Q7XYg8T+UoS9a5Q+ku7D1rmXS+xKCZjaHPGSw+Mq/6p0V23G7phEt3Hz5c0uL2f1+AyJp2PKfpQaYKDXeIbtNsrKNK/KF+sftBFe4hU4xlwvJdXfjnF+QCoE5YKUteqmHyLileDkFVC3nf2FjYqufb6tGcO55AQ7KiXV1hPYYVXRXoeYdvwUcJb+ClBhJh11Lrc9oLQbQWFr/QdvCdb//MPdg6zPeLg3q7d+Tla8XulaBXV3hPkJzhLY/J6nnZ/2RcIKLbDTtJW1duMRnNapMx8ttlYrWPlI2yUUgYYNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA1PR11MB5947.namprd11.prod.outlook.com (2603:10b6:806:23b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 05:16:09 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 05:16:08 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCHv6] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv6] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHdRMoU5UhOW4dT8kW/rleSi0QLGLbPDLgAgAALu9A=
Date: Tue, 15 Sep 2026 05:16:08 +0000
Message-ID: <IA0PR11MB73075CACF73E3FD17D345DF0BABA2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260915042300.2201757-1-arun.r.murthy@intel.com>
 <20260915043200.982921F00893@smtp.kernel.org>
In-Reply-To: <20260915043200.982921F00893@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA1PR11MB5947:EE_
x-ms-office365-filtering-correlation-id: 72a0277b-d7d0-424f-df82-08df12e87376
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|38070700021|11063799006|56012099006|4143699003|10067099003|6133799003;
x-microsoft-antispam-message-info: qG9XT2dbnLLKBkXMZ4/5frFM2KkbKSwhAcD1f+PtZHFqOJL0x7GbOGJW2hHEhjFr8EZf1vGU8frRrN+Gx0dIPqmcehVG8boyiSMmmwb2OnksrG9necQqBgrSsvPEEgQ8A9k0qJxWncGVnN1aA1OK/80AYFu4uqhJRQMCYcmFjvnJP7u9oVw3CzoPrynNQ77aRDm6FKRVTIMewHFUsPYkxssD5ZRKw+f7pPBSjlEN/qhbTDnLzMWbd0X5ThUyhA9lnIF/XUQTI/uRCQl7t2kpwEfulzQPeIqQG6hAPt2hMUFyDW8INRzEHHYds7sF3dxKvXP4Pv0YjOG3Qi7ZIqdv+JNqT1iRRWcHy37KHywBJHqeepFcfxAfSxeyFyswkRlpJjTZ9HOOu43cjqLq+Ai1dhI04+k37iiJqNe+nDhwodckjho3H9Hfn7q+WyuWjoCXkher1PfzAEjeEJIPQ0KeuMCNrsqZ1pe11Ods9nujhuVXa+NCEVFFd5wVe7XAA9ZcrGPdSz+nXgtnFoLHpFHqx92gkJOYlFzLlzWrmcRJcQ+oSZCOxuK3JZH9cOPPkSYORe0kZMmPQmu0JOWrs5668F3+P9NBBiXnSnjAt+Ai1t8fO0RXddTaaP73KjLFYO4OzBwn1G/xJ7T9qtfPBq7FLw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(38070700021)(11063799006)(56012099006)(4143699003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0ZpNFFhVGVzY0xTY1NwWlo1cjJJQ2pyaEFud1ExVXlPN0tSaVVQTVZpUWRQ?=
 =?utf-8?B?b2plVE1Xa0dVbmYzTldpNE5iUGVremY0RFBvdWtNRzZ6RXlhaytRNkJ3U0tz?=
 =?utf-8?B?dFh5Ry9KaTExN2thd1JMK2E2OEZuNVFKWFcyMnZGWkFDWDFPWmVvZ2hTV2ZL?=
 =?utf-8?B?aXZTY3EwQWVxcno1OUpES24vZE81NzJCWmNaV1BWNWxiYWpRcnFQWDQ2U1NN?=
 =?utf-8?B?RWdTa3JjVnBWR2dIYkNxZ2QrRk1BWHpjNURnN2VqYmFFeGFWTW02TVZXamJS?=
 =?utf-8?B?TzZrMlVoWGdEVjBja3FmZGVzVlVxbEJZdUVwdjhsNDJUQU9VRHdVMzA5WFg1?=
 =?utf-8?B?NEhzc2VuT05OOTVLdWVFY01IQTNPaFl1M292dnV3cXlJNElicUxUWjIySVhj?=
 =?utf-8?B?MWEzeVNBUmlGRS9OemVFSEJ6MWpHc25vMkFacSt4c1pMazJSSHV3UW1iYWxP?=
 =?utf-8?B?aDJjSElRZzRQa0tYakhHMmlnN2pPY3R5RUlCUHN3MkxYRmh2QjBvUFNQd2Yz?=
 =?utf-8?B?b3BTQTdpc0o1N29rTUZSVWNvcXRCK0Jjd0JaYTgvdzZ3dzE3ckE2TkVoa0xY?=
 =?utf-8?B?V0V4T1dsNzlXUVEzbHdObUJKVUFieXN0T1dTYTV2NVkwTHVNWDZ2N3hZNG1I?=
 =?utf-8?B?a2RXQ1owcGtqVThIYTI2Y0NNRnBVSFlDYnQ4RVh0bXlhVzhCdlZFblMxV3JK?=
 =?utf-8?B?bktwcktKV1BRZGdZZU9zcXFXbFVYSlZGZHpndXVVY3RqaUpzblV2UWYrRmds?=
 =?utf-8?B?V0daSTlVNVFrdW9tTk1HeVdENXVzZWJHeXhPbUMwWDRnRVFKT01QQmRrYmFO?=
 =?utf-8?B?WkNsMWppYTVDOC9LTmNmM2llWmg3dTE3ZVNJV1JkK1I1RmtBVjJMY2YwWExz?=
 =?utf-8?B?OGtuRDhnUFRBSUlnY004YWdVZHNBQWxnWENhV0tka2lDYklTanU4WDI2Q1hY?=
 =?utf-8?B?bGpjcHY2OGdObml6RDFHTmhpRmVMc004VldUVW5HOUNnSitBZFN5OWhhbkV3?=
 =?utf-8?B?cW55RGhZLzJlbjZWcjZldmZlMkN1L0pXdHBlV1VXNDJXdU84bU1hZHRLYno3?=
 =?utf-8?B?YjFuSVdhQXAvc2xpRExsNTZ2a0ZLSi9RMU4vOFhRc0FCVjcwak1qUnF1UW1T?=
 =?utf-8?B?ZUM3OHMwTTRlV1g1KytzTUlhVGNtWFBZK0NZNjFJd1hERTVJaXhVek13UmVq?=
 =?utf-8?B?OXRvUUtJSzlVL0lYNXB5R2Q1VmMxN1g3bXd4NXFROGFoZHNLcjI3TFFHNzlI?=
 =?utf-8?B?K0FWSVIveCsyRytKNWRoY1NFaWlMKzY0RHVtb2x1UjMyQ1U1OUlvcUdNQkt4?=
 =?utf-8?B?TFE0NmVUK2dNTlpKazJHajFhNlNjeDRLSHJVVVkvSjE0L2NEbkRSOEl4Yll5?=
 =?utf-8?B?bGY4OFdvQStCODFxRTJWeEdLT2VLWWthcE1xTkxxaXdwTEJtOFpMUERpZnFV?=
 =?utf-8?B?K2ZEdy9jbzY5c1lXT3Q0MkxXYm0wdHFKcDJ6dlhjWE9YK1pTczZaWVN0YVFZ?=
 =?utf-8?B?SzZlRWdyaVVNeWJNZzhmSzVjZW9WR3NsWHVRcWF3TnRrY0h0OFlxUzVjSVhU?=
 =?utf-8?B?Q2UrSWpBT1JweW0rUGhtVFB5anQ3ZFZsMnZMcUExNGFyNU8rSjVwTHdBbG5M?=
 =?utf-8?B?bnRjMWVyTWtxUVhybFE4N1g0N2Y3Yk5WdjZQMklLeHc3YThROUY4TzlhMTVr?=
 =?utf-8?B?U2lMd084Z3pJcWNTbkRjcEZGOE5iVzB6L0NGOXJNMTJIUEFHSjlUb2QrVFJW?=
 =?utf-8?B?Uksvd0ZiYVIvaytHNTNSYVdGNnRlbnMvYXBDTFkrOFNMS0doQ2I0azV4SlZR?=
 =?utf-8?B?T3dPdXI3eFV4STBMdkdQays2bHExNmo0OVZ1ZUt4cVMzTEE0bWJ4TkxMSkta?=
 =?utf-8?B?UjRxaEU4Y0FSbDFyaFVFTzFkU3lYYTdnVDBBR2pXcGZBc25TUTFReWtYVjN6?=
 =?utf-8?B?SEVjWm80S3ZablUrQUlvRXliQW5OcGF0REMvemZuZktTWVRmMTlwb01nTUlI?=
 =?utf-8?B?WGJhNTJHMTdVZEo1allBVHd1RUM4aStBeFJEb05lemtGRktiRituUDIzUWFo?=
 =?utf-8?B?NGtxdW02Z0FLT0s5VW1UU2tEdkovUFhwa2pmdDZ6c0lWMVFhbWQvK0p3QXVx?=
 =?utf-8?B?S1R4ZFppZDdCcnVqa29QM1QzVi9HQ3BlSXRzWFZPaDRzaytaR3V2M0hHczUv?=
 =?utf-8?B?REtVWFk5RDNVNjRqTnZjK1luVTZiUUE5N0ltbkdvMUNtVlFLT3RuMHVab0Qx?=
 =?utf-8?B?ZkZBWDJCa1hzQ1BuclZWQ3RGcTZ5OFRqTDZJMGhmVzhyNmxnZHBSMldYbjlH?=
 =?utf-8?B?clZ0ZTRpbHhpd21GalpraEZTaUgrampLN1AwZS9UcEUxbG0yNkNHZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 1NGI2wjpGiXLSE8o4mRvZsolvzLeo30sTLKyp4cYr5GeQvPrLdk4lAGwJ9dS5iwPU38HdTEyZPuna3xkkC+PLtRy/gD4KpUSVSFGky/Kx2uy2Sz4g4bkFDi2k6yfNS6kGdEOpHQUVBeCNynfLZeyO2285blHC4NMynznX5bhGFyivxDAiRw6S7yprKZBltuRizEkemjiVQTRv2A5Z7zgWowmtElgg8NV2Vhu/KM7mT3QwpPNdXka23wTwNLWfxctE5cEQ1l00U7aIXbSQ5MuD6mFsuBK8QUY+PuqL4aCUdedlnEGyIQl1J84GglBNpdO2vmXYYbqw4MToAJwkkYSXw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a0277b-d7d0-424f-df82-08df12e87376
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 05:16:08.8361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: by8KPIwn7v15VzBYqYRbovBEYiuaRdAy26aWtzdQTOonvemgJ9rK6+Qe23l69LWJrNGR+eyDMIfz8jBMSBw6hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5947
X-OriginatorOrg: intel.com

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIg
MTUsIDIwMjYgMTA6MDIgQU0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGlu
dGVsLmNvbT4NCj4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVj
dDogUmU6IFtQQVRDSHY2XSBkcm0vaTkxNS9kcDogT24gRFBDRCBpbml0IHdha2UgdGhlIERQUngg
Zm9yIGVEUA0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBB
SSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj4gY29uc2lkZXI6DQo+IC0g
W01lZGl1bV0gZHJtL2k5MTUvZHA6IERQX1NFVF9QT1dFUiB1bm1hc2tlZCBlcXVhbGl0eSBjaGVj
ayBtaXNzZXMNCj4gRDNfQVVYX09OIHN0YXRlDQo+IC0tDQo+IA0KPiBjb21taXQgYTE2MjMyYmI5
NmE4YTJiYTQxMDVhNjk1MTgwYzU5NzgxMDgyZjcwNw0KPiBBdXRob3I6IEFydW4gUiBNdXJ0aHkg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiANCj4gZHJtL2k5MTUvZHA6IE9uIERQQ0QgaW5p
dCB3YWtlIHRoZSBEUFJ4IGZvciBlRFANCj4gDQo+IFRoaXMgY29tbWl0IHdha2VzIHVwIHRoZSBl
RFAgc2luayBkZXZpY2UgYmVmb3JlIHJlYWRpbmcgRFBDRCBjYXBzIHRvIGhhbmRsZQ0KPiBmYWls
dXJlcyBkdXJpbmcgQVVYX0NIIHJlYWRzIHdoZW4gdGhlIHNpbmsgaXMgYXNsZWVwIG9yIGluIGFu
IHVua25vd24gc3RhdGUuDQo+IA0KPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvNDM5MQ0KPiBDbG9zZXM6IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS93b3JrX2l0ZW1zLzE2NjU0DQo+
IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiA+IGlu
ZGV4IDBjZDVlNmI1MDM0Y2YuLmM0NGQ1ODRjYzA3YTcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+IFsgLi4uIF0NCj4gPiArc3RhdGljIHZvaWQg
aW50ZWxfZWRwX3dha2Vfc2luayhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKSB7DQo+ID4gKwl1
OCB2YWx1ZSA9IDA7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBS
ZWFkIHRoZSBjdXJyZW50IHNpbmsgcG93ZXIgc3RhdGUuIGRybV9kcF9kcGNkX3JlYWRfYnl0ZSgp
IGFscmVhZHkNCj4gPiArCSAqIHJldHJpZXMgdGhlIEFVWCB0cmFuc2FjdGlvbiBpbnRlcm5hbGx5
LCBzbyBhIHNpbmdsZSByZWFkIHN1ZmZpY2VzLg0KPiA+ICsJICogRmlyc3QgY29tbWVyY2lhbCBl
RFAgcGFuZWxzIGFyZSBWZXIxLjAgb3IgMS4xLCBvbiB3aGljaCBEUENEDQo+ID4gKwkgKiBEUF9T
RVRfUE9XRVIgaXMgc3VwcG9ydGVkLg0KPiA+ICsJICovDQo+ID4gKwlyZXQgPSBkcm1fZHBfZHBj
ZF9yZWFkX2J5dGUoJmludGVsX2RwLT5hdXgsIERQX1NFVF9QT1dFUiwNCj4gJnZhbHVlKTsNCj4g
PiArDQo+ID4gKwkvKg0KPiA+ICsJICogSWYgdGhlIEFVWCByZWFkIGZhaWxlZCB0aGUgc2luayBt
YXkgYmUgYXNsZWVwIGFuZCBub3QgcmVzcG9uZGluZywNCj4gPiArCSAqIG9yIGl0IHJlYWQgYmFj
ayBEMzsgaW4gZWl0aGVyIGNhc2Ugd2FrZSBpdCB1cCB0byBEMC4NCj4gPiArCSAqIEluIGNhc2Ug
b2YgQVVYIHJlYWQgZmFpbHVyZSB3aGljaCBpcyB1c3VhbGx5IGEgUE9SIGNhc2UsIHRoZQ0KPiA+
ICsJICogcmVtYWluaW5nIGJpdHMgb2YgcmVnaXN0ZXIgMHg2MDAgaXMgc2V0IHRvICcwJyBvbiBQ
T1IuIFNvIGEgYmFyZQ0KPiA+ICsJICogd3JpdGUgc2hvdWxkIGJlIGZpbmUuDQo+ID4gKwkgKi8N
Cj4gPiArCWlmIChyZXQgPCAwIHx8IHZhbHVlID09IERQX1NFVF9QT1dFUl9EMykgew0KPiANCj4g
W1NldmVyaXR5OiBNZWRpdW1dDQo+IFdpbGwgdGhpcyBza2lwIHRoZSB3YWtlIHNlcXVlbmNlIGZv
ciBwYW5lbHMgdGhhdCBzbGVlcCBpbg0KPiBEUF9TRVRfUE9XRVJfRDNfQVVYX09OICgweDUpIG9y
IHN0YXJ0IGluIGEgUE9SIHN0YXRlIG9mIDB4MDA/DQo+IA0KPiBTaW5jZSBEUF9TRVRfUE9XRVJf
TUFTSyBpcyAweDMsIDB4NSBpcyBhIHZhbGlkIHN0YXRlIHdpdGggYml0IDIgc2V0LCB3aGljaA0K
PiB3aWxsIGNhdXNlIHRoaXMgc3RyaWN0IGVxdWFsaXR5IGNoZWNrIHRvIGZhaWwuDQo+IA0KPiBT
aG91bGQgdGhpcyBpbnN0ZWFkIHZlcmlmeSB0aGF0IHRoZSBzdGF0ZSBpcyBub3QgRFBfU0VUX1BP
V0VSX0QwIHRvIGVuc3VyZQ0KPiBhbnkNCj4gbm9uLUQwIHN0YXRlIHRyaWdnZXJzIHRoZSB3YWtl
dXA/DQo+IA0KT24gcmVhZGluZyBEM19BVVhfT04sIHdyaXRpbmcgRDAgbWF5IG5vdCBiZSByZXF1
aXJlZCBhcyBBVVggaXMgaW4gd2FrZSBzdGF0ZS4NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1
biBSIE11cnRoeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiArCQl2YWx1ZSAmPSB+RFBfU0VU
X1BPV0VSX01BU0s7DQo+ID4gKwkJdmFsdWUgfD0gRFBfU0VUX1BPV0VSX0QwOw0KPiA+ICsJCWRy
bV9kcF9kcGNkX3dyaXRlX2J5dGUoJmludGVsX2RwLT5hdXgsIERQX1NFVF9QT1dFUiwNCj4gPiAr
CQkJCSAgICAgICB2YWx1ZSk7DQo+ID4gKwkJLyogQWZ0ZXIgc2V0dGluZyB0byBEMCBuZWVkIGEg
bWluIG9mIDFtcyB0byB3YWtlIChTcGVjIERQMi4xDQo+IHNlYyAyLjMuMS4yKSAqLw0KPiA+ICsJ
CWZzbGVlcCgxMDAwKTsNCj4gPiArCQlkcm1fZHBfZHBjZF93cml0ZV9ieXRlKCZpbnRlbF9kcC0+
YXV4LCBEUF9TRVRfUE9XRVIsDQo+ID4gKwkJCQkgICAgICAgdmFsdWUpOw0KPiA+ICsJfQ0KPiA+
ICt9DQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA5MTUwNDIzMDAuMjIwMTc1Ny0NCj4gMS1hcnVuLnIubXVydGh5QGlu
dGVsLmNvbT9wYXJ0PTENCg==
