Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324463955EC
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790138592; cv=fail; b=afBtZHcZUckYk8X5PnPE7Ngj1dMpmCoopQQZyPHJ5yhkENsDLsq6SX54vgrEnkmKGJZ9MiaYYemm5LggJoOI7ohR8YVR+0EL+CjydgW0Nzt65Vm6o7YDXw6PgUuKQDw6YLAMfgAQObP9PnqT6CZ1KkQXB6EK7dufzZpi5QqEuIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790138592; c=relaxed/simple;
	bh=KwEePuIQvNPEupG0JKpg54EDJjgbtcuitsajulxPEmU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p7CpyBQLPT+NwqJK/6gZ9boDedt8D1oKCRHV0MdMzh8Ek6Gf8Z6SFpjpAkWoCy5ypEjC32vOTtfjwLTm+bva0bMt11bpi+t2OW+l+4cRuMqp54tKLkdX75a26igCiRf79KMSY3SZSia9/CFeUUeH6FNcCMlO5gyKHBtZa8c6SH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DC3QmdQQ; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DC3QmdQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790138590; x=1821674590;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KwEePuIQvNPEupG0JKpg54EDJjgbtcuitsajulxPEmU=;
  b=DC3QmdQQ/pwtOW115del/2/bGUh8WD1AnhTmFuSruxR+9UZymfS0EY8f
   HtySWKGRdKXAhhxgubSHqoqxpwH0BBlz6NxYUwL27cSZZznFTT2mzDZwj
   VcAajRp1cbJEBmXhup5CkRycqwve78l4ktKex9Gm3XXbtSfmoT5mKklU5
   P0M4lsGckkYCoGcpx9WN3HpqReTCyMDVL/FH8ZVNw3NlrESQfk/PRyiKo
   lnSPJMOtVKPyfLqE9OO9fyToFcxG9KffIo2Wdg88booWqizq5UKTuOnep
   IP3QimpKqqjJVuk3R/S7btbfFezeXrjjmki2gSs7mMlZvJdYTh2GArjJZ
   Q==;
X-CSE-ConnectionGUID: z631h1d0S/6CDNJtI6YzwQ==
X-CSE-MsgGUID: XfeBV4jSQquIS+laDvR7Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90912536"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90912536"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 21:43:09 -0700
X-CSE-ConnectionGUID: eUE9ddjgT6eFEsjQnfuUJQ==
X-CSE-MsgGUID: 64WvjEp9R4Ky3sSP2NUVWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="272024164"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 21:43:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 21:43:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 21:43:08 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 21:43:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfgsLySG21LeyIUXy+KepCu/smmjeh6oLeeNA6B+owe8I0fBoJSQt42mRVauPLsAuIplUr8pZERN7jP35z58GrqGxMbbzgFOOR9XyrJPxX3OI/C+aGzmXR9krjpoL222WQ+tf6VRTtnMdMJpH+Fsbw+GmG+d9SlviozpI3DxZL2VChJR/vep/w4AJz1+trExjGJGxHf0ynTaTEt7slitXLvmOF6s/HJEJjGjouUFmnR7KqmQ4EJkBSIeYPbg8eUcJ5/pVuben9OUyyyAfRJYlqFrEo5dc0zWlNIOQ2kKVwP+MmPySnMkkTFOKuYYV0GN70VMLz+pkkFJPcpEorlBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwEePuIQvNPEupG0JKpg54EDJjgbtcuitsajulxPEmU=;
 b=ksFEzwoTSNYIpHN/SIxxkW/FsXhc2jepMt4xYbVSnwkhC6na5qSfISSpCDoFYURHW27wmrHvFUx/xom+0ZgO5dLEcCbPHmo5DDd3FLjgvx+g3VpDypepHoyZEtKeSyYpGQZLVIYCSQot6EFRvO/FC9ts0lDn2/EoG+HaTGwXE8mDLv6O6/j+1cc9OFAR2PJGJoe+jkUZ2x0OI6qWVK3VsaCCopy5nsbtUE4MgU+MES6GNZkwW/NjdRAHd4Gdn3Id1ZjtxPfxfQBIlmfvFPwhp3536AaoIrVkhY45rGjqjDeUCkLwByjihjZQuTJaE2k9M46qmGvxlMzlakVSUY+6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by IA4PR11MB8941.namprd11.prod.outlook.com (2603:10b6:208:55d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 04:43:00 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 04:43:00 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 02/13] drm/xe/ggtt: Report GGTT errors using structured
 logging
Thread-Topic: [PATCH v3 02/13] drm/xe/ggtt: Report GGTT errors using
 structured logging
Thread-Index: AQHdP38+BkrmGe5Qk0isBUdxPodsNrbEgpOAgBcqMaA=
Date: Wed, 23 Sep 2026 04:43:00 +0000
Message-ID: <BL1PR11MB54130709E73D78C2A0861042E2822@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
 <20260908104550.1283933-3-dnyaneshwar.bhadane@intel.com>
 <20260908105705.A85261F00A3A@smtp.kernel.org>
In-Reply-To: <20260908105705.A85261F00A3A@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|IA4PR11MB8941:EE_
x-ms-office365-filtering-correlation-id: 5929961a-fce6-43c3-12d9-08df192d25c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|22082099003|3023799007|11063799006|10067099003|38070700021|56012099006|4143699003;
x-microsoft-antispam-message-info: ZWJFSHPfS67Jw+jZW62xZqImPo29QD9rFZT6DivJgddH8ez9E+/VW7jx7FNkAU8UeoiOVBUURwyy4iTQ1aIXkKQodRvCr8wcriBYBsN5wYZRne9TCvEFL/1Ky+qasykpzML+Z42EjsiVa9vSYmyPjaZVijbSQ262dLMyY142j/zeRacznl+gn2+f6eXxp7Lj2i9MZBh76usbU9lv6DFGL3w4hGT0Tb3MktEDCJiYDsS0K4Y2yA8/yP4Wsin0HgFO4o1BjlgeXXNr3ix4yHb+Ag1ieSgAg1kL5zXo1l7lNYdW0dhBkbLJztIWD5zNZsaMDkekR2RoLC/1fsZStwjiDL9kjZnTIK8toKc4qS2XXBfYq2Vmy48OS5pRfpOK0nwPeJ+v7aOnG5mO0Agowh3hQqJZFXA/WzsXDLnIcU0VwtoSYWT5Zvsgpb/mIcZsLIA6tYUuGb/sJ/9AXnAHzifVzZPp6msv/VSVWrjhguOdzOXibayAYyfTPnRvqSjt6ihDxbqhyTpRjlFoQAF2wtxPqyxW5A2V7k3b4Vr8CLm7bBR+eLifdHTlkYtcoiAPTfrBt33aiv4Ox9JcyzsoJIXsudHQkqkxRVBH1uMaMIQqSgqFzhwDbzqw+dr+zXaMOSEuVj3gwAk83NHZwwv5912gu5aBF2pa75dmdrEV7WZoKrs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5413.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(38070700021)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHNkT1Q4TFRFTmNWS1Q0eDRhcS9qZGNYcmtHa09LdDJQT2pFY1lLWDRuRW0y?=
 =?utf-8?B?c3FxcTdOWjlCdWw3dWZiZUJRUHV3MUlqRlZFK2gxSWppK0VQL05WT1ZqTnhF?=
 =?utf-8?B?UGV3MUJzSllzdU9OZytxTGMxcmVsTTUrV1F1bmIyRHBINVhNVnF5dXFrTkFY?=
 =?utf-8?B?enBOZS92SmtnaWlWUFkxSmwrYWt3V3F0WTBQN0N6WjBMcEFjaFVCVExkMlEz?=
 =?utf-8?B?MUdpMXVRUTVmREFUNWZpRkdzUFlqS0hhc0NabjJ6LzNCNGpMdGlyQ0dRaXVN?=
 =?utf-8?B?YndtRm1taXJodnZqeGVXeHpmWnlWTUx4dHRFNFNpWm1mbUFVSnkwcWN2aGlZ?=
 =?utf-8?B?b0tLU25uNnFpMmhIcHM2cGcwYU1WVGdSenZ4VERnNjBuZW1CYVVrWmpqaTBo?=
 =?utf-8?B?Z05wbkNqcDJoQ1hlN0xYUUF4M2Vuc1lSbFBPQVU4ZnZPOXF0N3lxbkozbFo3?=
 =?utf-8?B?K01UWjNPV0RQSnpaUFlWaVUySFg2NkZaOWxuNDNObVljSFhuWENjUEM2eHpX?=
 =?utf-8?B?akRPSEFpSi8wQU5tRXlNM2JTd01YWE5oRnV1M1pxL0grd1l3eDlSd0NIWDlS?=
 =?utf-8?B?OGYwR0d6MTUySUoza3ZZNWtwVnlGZEhxWUc2VFl6QjNoZHBFWFdWUUY2eER5?=
 =?utf-8?B?Z3lpUUZEcmM3azlHMHh5OTJNUE54SmlqYTkrQytyenRsbGhDa3dGYXNuQ2Zx?=
 =?utf-8?B?ZWNhb0tpY0RhaWowSENQa2lQRVB6STMxbFJLK0hmZUM2OVExUi9RZHQ4RlZL?=
 =?utf-8?B?a2lRVmt4WUY2cVcycy9DY2FZeEZ6SWN6UGdWR1g1VkNTZ0tUNGxuUXZINXRN?=
 =?utf-8?B?U1VsTmNNM1JsSG5PSlRnUHFNSlVXWkorNkNtRG91WTlvYko2RlZiT1BReFNk?=
 =?utf-8?B?Q1EvMEh2RWVaMmtJb0x5eXRMMVI4dGhEM2xCR1JjTW52OGkvZEZKZVRsdXZz?=
 =?utf-8?B?TUVzcGJoczVnUlVsSkJCSk5nRUtqZkxqblBkMkQxMFdyaldxa2lGeTlSRm1Y?=
 =?utf-8?B?RFBJcGZ1SDNzeXQzeVZqTkpXMkZERlp6WEVKMEhIeGlVSzQ1dncwL0FyYmhQ?=
 =?utf-8?B?UnNuNHVpMFFidzFTZnlIb3hFdWJxOEN3WCtHMkNmYjdBSTFhTXdSMVlCblVF?=
 =?utf-8?B?MTB1OHJZWmdOQ0QyRVVYTkIzdlA1bmVLTmpxUVhLd0JMS0ZOYnEvayt5V1hT?=
 =?utf-8?B?L05GOTRGSk9TOGc4V3YzcU9iOWJpRzVPUFhIaW1NUmhUQk9vdDE2QjJvUnJQ?=
 =?utf-8?B?VVprWDBHYmtVTmVkTE8rMGhtUHdTRWkyWUZ0ZkxyeFVNVUhkZ1dUOTI0eldN?=
 =?utf-8?B?ci9kYk0zVVJCKzJtaXNTaHVCdVRrMDRmVlVjdWpSaWJ6bHFSRTVzRWhmeVN2?=
 =?utf-8?B?RVNxVUhRdFNHRzQzOUs1YmVHbjFabm04eVVQUHN3WGN4REFvMEU5MkhCdDdQ?=
 =?utf-8?B?ZFZpOERSU3RmRUlXZEhDemhhSEtUR1BjYmJPMlAxMVRselNoWW01SjVFb094?=
 =?utf-8?B?eEJTNHB6cXRCMUExTnRyaDlNSUZHU04zbG9hcFBJaWxkT0N3c1VTdGpmQUNi?=
 =?utf-8?B?U2V6cHg1eFJrbWVGcnV5cEdXcGlBWUpHSzJBL1lzRnBGM1VKeEsxZ0FxbVU2?=
 =?utf-8?B?d0xPYnNHZitINHpEOXlndXZHUlUzZUZhUHBDeWJvNlp6RnIxQ2x6MUJnMUFL?=
 =?utf-8?B?N2huWTBya1Z4R2U1V1c0U2xsTE1kaHR0S296Y29DTkE5SjdGeDdRTVZHRVlt?=
 =?utf-8?B?SFlhVzI1cGRraUVHdUxIY09zYWpoUE9WVDhCRGRxNTJqcmZQSWZpTnpOeUxQ?=
 =?utf-8?B?YWkwOTZLMFEyYTNKTWhIdTU1YkxEUVRucTFpVFRraVFzVjkzRGJXR3Bqd2Fm?=
 =?utf-8?B?UVhna2tmK3E3WHcyVGNZM3M1dnRxMGNIUk1zbTVGU0I0T01xRnU3dDRFazln?=
 =?utf-8?B?OXVhYUVwL0dBeUN2R05LZGJMWU50YjBpZUhmeEs5eFoxd3RSYjRMeWdEVU1S?=
 =?utf-8?B?RWlJNTdpU1VMcGVFblhOQWlyWTV2YW9NaXdDdjNoU2lxVk83OFVsQjdpbHJs?=
 =?utf-8?B?dlVvbGlIbEFkUm54SWJDb252VlVaaUJ3dXZXOEREbDVVQS82YmtkdzNNUFNP?=
 =?utf-8?B?MVpuZjJFMG5ZTFhsVmFJT3VIanR0WGg3bkFJMkVOV0d1dVdjckVHSGZXMHp4?=
 =?utf-8?B?enYyZEZyM1hoUkJrdVhMa1lQVWdLRUJ3WkVEMkdWL21veG4xVHUwRXhCK2F5?=
 =?utf-8?B?Mm1YbVplajlXaUdwdVRGYnlMNzJjTG9EcXlaekVWUEdIOUs3ZzFTN0hNR2JP?=
 =?utf-8?B?clFMRXovUzQ0SjI4NjhhS29EdENGYktHZFRmZzJBak15STJ1eDRjUjV3N3J2?=
 =?utf-8?Q?AAeK0gU8o6YIkyQE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Jm/ZLAHq5x4fCRRbF8dEaRS4/gS4gLSxTIU03xtqlfr0Y3uyCY8i5mohartwBwKW1xBoEWGOtyENgCVv5awwu6+YY5GWQ7WrJIdfiV/UJqcvHDOwIsHvpUgv4/wIyfsyijDNrX3ZPOLEJpzdXX3mT3+jKSDAApex2MUNQvwdeWp88H+/QeoM90yQmfjhi9cRc4AhQu0nk5VsvGfkf2xKWlAln7X88fjNCs8/bw6LHMo3RHNzZJwzEmk02RpsV/D5UrTyLtdUqckQUUbEFRzn0j6KhZnNVAq6hmsJ2XjH2D2APK8EnDiTDYbNDN4mGlbB9yKy5d5aE3BXAU/lCp8ZCw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5929961a-fce6-43c3-12d9-08df192d25c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 04:43:00.6967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: crFZump7PU8OP999c3W4WdK54QKyXovoVLMsDAHh5uPO6IlprhMMTyxVR18b4RCM072uCYpcDrALXm2375EiLnWdXwZFDOyOsAjooMF7Zqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8941
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2RheSwgU2VwdGVt
YmVyIDgsIDIwMjYgNDoyNyBQTQ0KPiBUbzogQmhhZGFuZSwgRG55YW5lc2h3YXIgPGRueWFuZXNo
d2FyLmJoYWRhbmVAaW50ZWwuY29tPg0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDIvMTNdIGRybS94ZS9nZ3R0OiBSZXBvcnQg
R0dUVCBlcnJvcnMgdXNpbmcgc3RydWN0dXJlZA0KPiBsb2dnaW5nDQo+IA0KPiBUaGFuayB5b3Ug
Zm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlh
bCBpc3N1ZShzKSB0bw0KPiBjb25zaWRlcjoNCj4gDQo+IFByZS1leGlzdGluZyBpc3N1ZXM6DQo+
IC0gW0hpZ2hdIEludGVnZXIgb3ZlcmZsb3cgaW4gVkYgR0dUVCBib3VuZHMgY2hlY2sgYWxsb3dz
IGEgY29tcHJvbWlzZWQgUEYvR3VDDQo+IHRvIGNhdXNlIG91dC1vZi1ib3VuZHMgTU1JTyB3cml0
ZXMgaW4gdGhlIFZGIGRyaXZlci4NCj4gLS0NCj4gDQo+IGNvbW1pdCA4MzVmZjI5MWVmYWU4NGU5
MmY0YjQ2NjRmM2Q1MzFiZDBmNDgwZjVkDQo+IEF1dGhvcjogRG55YW5lc2h3YXIgQmhhZGFuZSA8
ZG55YW5lc2h3YXIuYmhhZGFuZUBpbnRlbC5jb20+DQo+IA0KPiBkcm0veGUvZ2d0dDogUmVwb3J0
IEdHVFQgZXJyb3JzIHVzaW5nIHN0cnVjdHVyZWQgbG9nZ2luZw0KPiANCj4gVGhpcyBjb21taXQg
cmVwbGFjZXMgeGVfdGlsZV9lcnIoKSBjYWxscyB3aXRoIHhlX2xvZ19lcnJfZmF0YWwoKSB1c2lu
ZyB0aGUgR0dUVA0KPiBjb21wb25lbnQgdGFnIGluIEdHVFQgaW5pdGlhbGl6YXRpb24gZXJyb3Ig
cGF0aHMuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ2d0dC5j
DQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ2d0dC5jIGluZGV4IDYzZThiZjE5MzYwNTgu
Ljc3Mzc3N2FmYzY4YTINCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ2d0dC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dndHQuYw0KPiANCj4g
WyAuLi4gXQ0KPiANCj4gPiBAQCAtNDE0LDggKzQxNiw5IEBAIGludCB4ZV9nZ3R0X2luaXRfZWFy
bHkoc3RydWN0IHhlX2dndHQgKmdndHQpDQo+ID4NCj4gPiAgCQlpZiAoZ2d0dF9zdGFydCA8IHdv
cGNtIHx8DQo+ID4gIAkJICAgIGdndHRfc3RhcnQgKyBnZ3R0X3NpemUgPiBHVUNfR0dUVF9UT1Ap
IHsNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2Vk
IGJ5IHRoaXMgcGF0Y2gsIGJ1dCBpcyBpdCBwb3NzaWJsZSBmb3IgdGhlIGJvdW5kcyBjaGVjayB0
bw0KTm90ZWQuIEkgd291bGQgbGlrZSB0byB0YWtlIHRoaXMgc3VnZ2VzdGlvbiBpbiBzZXBhcmF0
ZSBwYXRjaC4NCj4gYmUgYnlwYXNzZWQgYnkgYW4gaW50ZWdlciBvdmVyZmxvdz8NCj4gDQo+IElm
IGEgY29tcHJvbWlzZWQgUEYgKGhvc3QpIG9yIEd1QyBmaXJtd2FyZSByZXR1cm5zIGEgbWFsaWNp
b3VzbHkgY3JhZnRlZA0KPiBnZ3R0X3N0YXJ0IGFuZCBtYXNzaXZlIGdndHRfc2l6ZSB2aWEgdGhl
IEd1QyBLTFYgcXVlcnksIHRoZSBhZGRpdGlvbiBvZiBnZ3R0X3N0YXJ0DQo+ICsgZ2d0dF9zaXpl
IGNvdWxkIG92ZXJmbG93IGEgNjQtYml0IHVuc2lnbmVkIGludGVnZXIgYW5kIHdyYXAgYXJvdW5k
IHRvIGEgc21hbGwNCj4gdmFsdWUuDQo+IA0KPiBUaGlzIHdvdWxkIGJ5cGFzcyB0aGUgPiBHVUNf
R0dUVF9UT1AgY2hlY2ssIGFsbG93aW5nIHRoZSB1bm1vZGlmaWVkIG1hc3NpdmUNCj4gc2l6ZSB0
byBiZSBwYXNzZWQgdG8gZHJtX21tX2luaXQoKSBhbmQgY291bGQgc3Vic2VxdWVudGx5IGxlYWQg
dG8gb3V0LW9mLWJvdW5kcw0KPiBNTUlPIHdyaXRlcyBpbiB0aGUgZ3Vlc3Qga2VybmVsLg0KPiAN
Cj4gPiAtCQkJeGVfdGlsZV9lcnIoZ2d0dC0+dGlsZSwgIkludmFsaWQgR0dUVCBjb25maWd1cmF0
aW9uOiAlI2xseC0NCj4gJSNsbHhcbiIsDQo+ID4gLQkJCQkgICAgZ2d0dF9zdGFydCwgZ2d0dF9z
dGFydCArIGdndHRfc2l6ZSAtIDEpOw0KPiA+ICsJCQl4ZV9sb2dfZXJyX2ZhdGFsKGdndHQtPnRp
bGUsIEdHVFQsIC1FUkFOR0UsDQo+ID4gKwkJCQkJICJJbnZhbGlkIEdHVFQgY29uZmlndXJhdGlv
bjogJSNsbHgtDQo+ICUjbGx4XG4iLA0KPiA+ICsJCQkJCSBnZ3R0X3N0YXJ0LCBnZ3R0X3N0YXJ0
ICsgZ2d0dF9zaXplIC0gMSk7DQo+ID4gIAkJCXJldHVybiAtRVJBTkdFOw0KPiA+ICAJCX0NCj4g
PiAgCX0NCj4gDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MDkwODEwNDU1MC4xMjgzOTMzLTEtDQo+IGRueWFuZXNod2FyLmJo
YWRhbmVAaW50ZWwuY29tP3BhcnQ9Mg0K
