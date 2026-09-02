Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E73F35C6B5
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371866; cv=fail; b=WJyYFDTft3Q7xBQg6yDt18FJITtEnlg9UX2STEJMaEhKXaYi43FLEMzySOOJFOWUsXsFFI8Qi/xC9KpBBZiy7Cd94Eeaumor9Ros2xNDnFRE0PazW8TFxwjXG3gz+/VHl+5RGiCyGGNGP01j1lKNOOvoaLuevkvlTpoB1IRDL0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371866; c=relaxed/simple;
	bh=gHSySPHKmyvOhlOH/nKBEJeTF/wYcc4g9Q4QkQVzGfk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gS/2CLaqpqjYoxnX4PzchsRII8oPNe1fH9oP0qPixmK6SzT/sJ30eSmjkDWIteEOgyqTSwxBBf/OH1YQRzOwMTChGGUgnH+79/VNTkxNoAtV+4RCPUaVvUQbTNmitoGpyew3VllRrJz7lQq/wCnzgfZgpA5Jl9emeCi6dgIfdMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pm197bXH; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pm197bXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788371864; x=1819907864;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gHSySPHKmyvOhlOH/nKBEJeTF/wYcc4g9Q4QkQVzGfk=;
  b=Pm197bXHqliKtE8SB4Vvb4c9Hh+PvH+Za41UMJo56r7ayY2w0TgzE1B5
   svBQThBlvyM7ULU+kA1/vh3kbZts74WTU3Ug2V+06vLbWUhRVOfvyhSB7
   oo0G30c9EQG2AAun4XztsQmywoAqXaggVNwui1MF9qU2o5qrJdUF2FYPJ
   Agd4Y/kgrsDsx7AG3Ii+/h+PNnpPTUPUFyCB9bh7ecF2fudxnBPXdO5Nb
   pySYHV0SXMoklKy+oHC4OwIHVVlO7jIUytxzehldDnzQg1IM2R/kpmio+
   OTpztascpGNwAnVQYuahwdsg/ffaphJt4S5eanu6D6gAySJQ7NW4Rw1SZ
   Q==;
X-CSE-ConnectionGUID: PubdX3+WS2arVQiinjKHyQ==
X-CSE-MsgGUID: 8RXmTLe7R2mDpGqpz920ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88891696"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88891696"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 10:57:43 -0700
X-CSE-ConnectionGUID: H2LgFusETmWt9wQVUo8N9Q==
X-CSE-MsgGUID: 5Ppxr8BbTFCHfN/8K3WWYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="267714466"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 10:57:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:57:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 10:57:42 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:57:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cm/ty7TjwsCy9o/RRV0kPRv8fFzpWh2r3ulmeWCseRke/JrJ4EBteUCTMbJ9Oa8fj0gYUGaJ7i2XtjWxx+FDkWJaRHI05LbbKkJZNcW+3uXZ/h9Yv3LyCGCOQOQuFGcSr1w/VcXuzbAzfChORL/He9htCxEIx6gtUaLzOUFcwtGNpa1CVI/VMUTOqVVxAjTBUkEmnnV6B3OXOIqTqVxNnTNOu/5bZn4tLAwQ4OoTBRmGBhJMrNieZtH+hG8hwMw/f40RVaJqnVDnKpFSKbNxLCFX5Wyp0zC25rf1ibX8DQCC/JtE74NWRhtkOZDaxIB0L9dUSmrx+HPaftBwnrUz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHSySPHKmyvOhlOH/nKBEJeTF/wYcc4g9Q4QkQVzGfk=;
 b=g2+U5ewzXjMQJsVSaPLUCWsFAajnvdSgQccxN9qIMoedNnWnabzJg5/z6y7P9e02mvMbnIQ9+5lOAgrzb4ninEZ6MQeb3FGDMZ4rPm0fP7XORSqemZRifTEU8whjBkFm8szIQhcPCQDXv0bMTxerNx2d8zi5MoPSUYql9yEfh/T7M+4F+DBo5LUCSp7iiXbusy3KHsXClvfgXiy/5NI4b6J4jjg1ldKDaeyFlC5+S+4MhFF5+FDWXJeU3t4/dlKUrMl7eKUQOmE9wgBnitHlyz9V1xqBhYqoBUO3MnDyPDFnuD4O3TNJC8WDuuNzpaRzpEm7ExI+OWmN96MMl17xKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by LV8PR11MB8770.namprd11.prod.outlook.com (2603:10b6:408:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 17:57:38 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 17:57:37 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V20 12/15] drm/xe/vram: Check disable_vram_page_offline
 policy in fault handler
Thread-Topic: [PATCH V20 12/15] drm/xe/vram: Check disable_vram_page_offline
 policy in fault handler
Thread-Index: AQHdOusYTz8boZXF5UOPKmRpW8N0xba7f+WAgAATLSA=
Date: Wed, 2 Sep 2026 17:57:37 +0000
Message-ID: <DS0PR11MB87186517EA62BBDCA4CD397081B72@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-29-tejas.upadhyay@intel.com>
 <20260902164823.DD9C51F000E9@smtp.kernel.org>
In-Reply-To: <20260902164823.DD9C51F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|LV8PR11MB8770:EE_
x-ms-office365-filtering-correlation-id: 1754e91c-759b-4917-2b46-08df091baccc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|4143699003|38070700021|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: rR5Ix/mTYOnbv7MkK5IDrmkLcvwYInTaf9wBnJBiZ5UoYfevkkQtyC1CmtUhWVBFKlP+wy9UemZ5kq66CyJekA8Nnrmx4HECZu2JyMUiVbahDlhO/ZBcmysk0xvd/0CT40Kj6dAyqwQDqu1fxDYM1LpKg2ZWuzGE/aNoLqCG4aaSmtZD7ecuO/ICll3N3w6/ldKK4FKCrJh7kiERaQf6c64jyydriNYfxuUFexZlNDk+1O9cnqcD8/BegcMo1hkyO4jOMIsHcYQKvYxwxxGlWWA/YSrc8L62YMiu5kGbliwJsKpRzkrcz25WZCBNijzEkXUfrK7xgqW8JoHO/Zb+DSzp/Hmc6a5pHrMyyVz37nTJEAttFSTA4WEA6dfR8q5VnDmGTAmDPwLv4mpYtn+fgmRpiEwwcDHiJ6AaNd7857tNAge/Rhi10Vee8tg6G/YCEbRWbtQcpf2lf7oEIt1IIQch57XdOkEv2IqngnNuO1ohVRR6o6UrchAC9R335tdR83ljrebQWEzR+VKOZqNqhMWOlWDQg/8gnAWoK83lqawV/GGbNSEOe59+TJm/0EfquJ7jU/zTH+AsjKiuzkfqYyLY4pyOs+SJu5KZmvjTtBkq+3A5QvXPiC1Pvk4mTeVViPWHgtEWm/MSkqnMxG23DFptSTSwMoD8yUB7DVID2/s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(38070700021)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1NaL2FTYXlHL2MyZHVKSzNyQlNzSVBZTHEzQ1Nwc1pNb0NNbEEycnlhbmdv?=
 =?utf-8?B?cnFpMmRmTXJsZTJmRC9XeXlPUEFLY2h0NlhoY2R5cHE4T01nMkowUnVoZjhF?=
 =?utf-8?B?SGRkRnRaenorMkRiNzNzMGpmV0s1ekpoaXM1emNVNDZqNEtvSWRYOUhhMnhH?=
 =?utf-8?B?QzE0VUZuOFBpSStkbHYvd2kzM296RWEwMHdHSkVLYnc4N0lUMVdHRTZLUzU0?=
 =?utf-8?B?RmlRZnk1c1c2Z2piVE1nMDN3cDhZMXphKzljdHZDWlRRQzlneXV0VkUyTzR6?=
 =?utf-8?B?S2NRNTRYODIwS2UwNi9PSnZ4dVhSNGxXSGtxcmZFWVZsOGl6QXlEOElsSUdh?=
 =?utf-8?B?aDQxY3A5Zm5hK093MW43TnVNbEN6SXhaaDBRYmYrdVM4TGxpOG43TXBrbnZX?=
 =?utf-8?B?RE5HRXRhT0d0bnR0bkdjWTJ2RDdLRzlGUDBiU2RwbTFMMEhtTFJvS1ZnNlhT?=
 =?utf-8?B?Z3lFZUhkM1lyRTdoZDBxQkRzRHdMdGcyZlNRMVdRN2dWMVhka1hpYUxteFR5?=
 =?utf-8?B?ZVRqT2dYb0Q1MUxVaUZqaWtFUTlQYmJSUFFjNHpsMGhkT1B5RW9JN0VaMGZh?=
 =?utf-8?B?eVdWS01pN0QyVnkwMVlkSjBsang1OGtmQ3JPaEVBU3FVaDJFVS9TSXNNWi8v?=
 =?utf-8?B?RzVoT3cyVm1XMHFpL2hOYnJWTTJsUDJnZ0c5RDNhdVdPbkpreFZJZU54bms5?=
 =?utf-8?B?dXRqREJuSUZuOWJ3dnJXaXBXTS9STDd4cysvbTUrZWE0RXI0NFZvbVhXMlNi?=
 =?utf-8?B?OW15cUhtL2Y3cFRIZk13NFV2ekFPd1dwM0dkZVhabzA1ZnFjdkkxNkNhSlNE?=
 =?utf-8?B?MDFOMThwNWNVZjRKaW5EVVg5cXdyYUFzTHBnWGN4Rk11UXBjMGYxSjNPNTV1?=
 =?utf-8?B?TytYKzBlcElHZXdpSC9wbVFCbXBtYmQ0K0NCNDhJczQxRTBVNnVLbTJZZ0Yx?=
 =?utf-8?B?RFJNMmdWUzNEUWNOeXB3cVpVVW54VWJxY0JvU2FLMEFhM2tCc1I2NHpDeS9I?=
 =?utf-8?B?dzEzWW5GcERZRTVDTFpsUkpMRk9ZSC8vS2RVWnhCVFpHL1RCUmhSYUx3UmNY?=
 =?utf-8?B?V0REd1BNdTN5Y2orS2YwcHhsdzd5eVVEUlFaYk5iS3oyemY5bkFpME1lVzkr?=
 =?utf-8?B?Q3NGbXl1VTRCUVIybWZpK1h6aHlieC9mOXk3eGFFY0xmVnpBK0hra0lZd0ZS?=
 =?utf-8?B?bU1pbTNMa1hvOEowWVhaeVNQbC9VSitLaXpyQ2xqRTlvMnpVSElvaGpvek5r?=
 =?utf-8?B?dUphelFRcDdCS3g1aUNBYWxzSDJvMGJuZ2NCK3owTVVqV3gvdlJHdjhYcGR5?=
 =?utf-8?B?dTlEL2w0Vzd5c0g3c05QNDl0aGQ1NXRVc3RJRVFxK2JoOGN3Q0sxa3BEZ05h?=
 =?utf-8?B?dFJjUG5Pa2ZhTXpFTzFLU1kxdU1OVUg0OWE0TThHZVlCWUxJOWpyWlZTaHE3?=
 =?utf-8?B?QUdlTXF2dFZBejlWQ1VvSURVcERpMXFXb1JDYjFPaFQzdVc5S1Znc2U1b2hv?=
 =?utf-8?B?dEJiQ2FlYmlmb3Z2MkEzNTJxVXFaaDhjZnhWRmVHaUpLb1RHNzhiQ0p2NEs5?=
 =?utf-8?B?bWltbFAwcjBUZldxZURFR0dJREdsOEUveFdLMUs1MEZxclEyNlJ2amZZQ3d1?=
 =?utf-8?B?QmdNWmoxZ05zQWxneTlQcDliSUV4eDd0eW15REhPK3pSZWwyZ3NuNzhYT212?=
 =?utf-8?B?ZXhkK00rdUJuTXpFTnJKOTJ3aGNVaFFURGw5T3Q1bHpyQUkrRDIraVljZFZW?=
 =?utf-8?B?TGFaYndqbjRHWUtYTHVxV3NFeWlkWGNMT2FWRktPek1BZWZHUEZiWWpsbWRq?=
 =?utf-8?B?WkR4WG0rT1d4OHNUMXkyV1VFT3BndTk3SDI5Q3FEQUM5QnlxY1ZzZlc4YW4r?=
 =?utf-8?B?OVlhQ2RQTlJ1eit4RUtXMG9KL3VaV3VmVmlxVjR1QXA0YmZZckFLQ0lGajF5?=
 =?utf-8?B?RXlNNVJIMWltSi9pWVZQTFNBQW92TzhvQ1pNVW90aWdsaEw5Q0ZwbFBYallD?=
 =?utf-8?B?QW1Oc1VoV3lydWEya2haZ0hjUmRrK3huVTVoaEFsakJZc3ZSV1BnaVRlaHE1?=
 =?utf-8?B?YkoxNkdPMzFpVnRoMmF6cTdOdHBDaElZcVJNRzFUR2hhM1N5aGlHNVRUZDk5?=
 =?utf-8?B?UmU4bVd1RUNTV3llcmZqNWNpZUtkWlMvVnVJdkliZVEwT0MxTVowbXQ4c2hq?=
 =?utf-8?B?KzY2SCtmTFc4OGJ6MUJVSFU2ejVXWk1nQVp4UWJuT2NjVHVPRGZEOExDUkhS?=
 =?utf-8?B?ZEpJSjNONld0ZHFhWVhtNm45bmVmVXRqT0FMNXFSSmVMYXZ3bWJqSDBwOUZY?=
 =?utf-8?B?RklhZ1U5R1g4MXFmdmM5bXlkY0tabW05VGpIaXgzWDlDZlc3T3hsdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: c0wnpQWBdzy2iOQTSrhDLqdN5QI+/4fy/NNffGYNmz+JNfUFGT11/ZbkwvA3E9EMoGp0t0uKqb6kAMFTxUweMdKJQVj7Wy58m4FJPeD2f7vG9WpodYXFPLbjmy17I0mvXYDpp0t+PjQBR1uYI86O18bbR4QB+LNVdka0GDTkQhjDduoyJONCNfLe/0ug7r00hltxpi+uDR3Oz280am4dipuD6DqJRhLAIHjfJU9xPftcULll/bNh9017v6DB/VrOIPVLFu/PdEbKBddg9IELMTTglyBcxHjjsElCWbwep5n2X+hfcvZd7XAkCTsVPT0DST3u3CxQFMrSG6J8+m6eIg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1754e91c-759b-4917-2b46-08df091baccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 17:57:37.7371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ssuzwRoJqYw/z1RjK4/r0MUU7UsgcOQI6JWh58KUUuiiAWkrPE46Vf8sZpAo1ImB2Ucb+D60usdvlzqO+yoiqloGcMmY2WVQcw0X1+1Sctk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8770
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMDIgU2VwdGVtYmVyIDIw
MjYgMjI6MTgNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29t
Pg0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggVjIwIDEyLzE1XSBkcm0veGUvdnJhbTogQ2hlY2sNCj4gZGlzYWJsZV92cmFtX3BhZ2Vf
b2ZmbGluZSBwb2xpY3kgaW4gZmF1bHQgaGFuZGxlcg0KPiANCj4gVGhhbmsgeW91IGZvciB5b3Vy
IGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUo
cykNCj4gdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gVW5yYXRlbGltaXRlZCBlcnJvciBsb2dn
aW5nIGluIHRoZSBWUkFNIGFkZHJlc3MgZmF1bHQgaGFuZGxlciBjYW4NCj4gY2F1c2UgZG1lc2cg
Zmxvb2RpbmcgYW5kIERvUy4NCj4gLS0NCj4gDQo+IGNvbW1pdCA1YmZlZTg0OTQyN2ZhYjJiNTRj
OTVlZWMyOTM0YWZlMDgzZmQ0ZTg3DQo+IEF1dGhvcjogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVw
YWRoeWF5QGludGVsLmNvbT4NCj4gDQo+IGRybS94ZS92cmFtOiBDaGVjayBkaXNhYmxlX3ZyYW1f
cGFnZV9vZmZsaW5lIHBvbGljeSBpbiBmYXVsdCBoYW5kbGVyDQo+IA0KPiBUaGlzIGNvbW1pdCBp
bnRyb2R1Y2VzIGEgY2hlY2sgaW4gdGhlIFZSQU0gYWRkcmVzcyBmYXVsdCBoYW5kbGVyIHRvIHZl
cmlmeQ0KPiB0aGUgZGlzYWJsZV92cmFtX3BhZ2Vfb2ZmbGluZSBwb2xpY3kuIElmIGVuYWJsZWQs
IGl0IGxvZ3MgdGhlIGNvcnJ1cHRlZCBhZGRyZXNzDQo+IGFuZCByZXR1cm5zIC1FT1BOT1RTVVBQ
IHNvIHRoYXQgUkFTIGNhbiByZXBvcnQgaXQgd2l0aG91dCBhdHRlbXB0aW5nIHRvDQo+IG9mZmxp
bmUgdGhlIHBhZ2UuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dHRtX3ZyYW1fbWdyLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3Iu
Yw0KPiA+IGluZGV4IDBhYjkyYmMzYzY5OTguLjAwNTY5YzUyNzlhODMgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21nci5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21nci5jDQo+IFsgLi4uIF0NCj4gPiBAQCAtOTA2LDYg
KzkwNywxMiBAQCBpbnQgeGVfdHRtX3ZyYW1faGFuZGxlX2FkZHJfZmF1bHQoc3RydWN0DQo+IHhl
X2RldmljZSAqeGUsIHU2NCBhZGRyKQ0KPiA+ICAJdnJhbV9tZ3IgPSAmdnItPnR0bTsNCj4gPiAg
CW1tID0gJnZyYW1fbWdyLT5tbTsNCj4gPg0KPiA+ICsJaWYgKHhlLT5yYXMuZGlzYWJsZV92cmFt
X3BhZ2Vfb2ZmbGluZSkgew0KPiA+ICsJCXhlX2Vycih4ZSwgIjB4JWxseCBpcyByZXBvcnRlZCBh
cyBjb3JydXB0ZWQgYWRkcmVzcyBieSBIV1xuIiwNCj4gPiArCQkgICAgICAgYWRkcik7DQo+IA0K
PiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4gU2luY2UgdGhpcyBwYWdlIGlzIGludGVudGlvbmFsbHkg
a2VwdCBvbmxpbmUgYW5kIG5vdCBvZmZsaW5lZCwgY2FuIGEgY29ycnVwdGVkDQo+IFZSQU0gcGFn
ZSBhY2Nlc3NlZCBpbiBhIHRpZ2h0IGxvb3AgYnkgYSB1c2Vyc3BhY2UgYXBwbGljYXRpb24sIG9y
IHBvbGxlZA0KPiBjb250aW51b3VzbHkgYnkgdGhlIGhhcmR3YXJlLCBjYXVzZSBhIGxvZyBmbG9v
ZCBoZXJlPw0KPiANCj4gQ291bGQgdGhpcyB1c2UgYSByYXRlLWxpbWl0ZWQgbG9nZ2luZyBmdW5j
dGlvbiB0byBwcmV2ZW50IGEgcG90ZW50aWFsIGxvY2FsIERlbmlhbA0KPiBvZiBTZXJ2aWNlIChE
b1MpIGZyb20gY29udGludW91cyBkbWVzZyB3cml0ZXMsIGVzcGVjaWFsbHkgb24gc3lzdGVtcyB3
aXRoDQo+IHNlcmlhbCBjb25zb2xlcz8NCg0KTm90IGV4cGVjdGluZyBhbW91bnQgb2YgZXJyb3Jz
LCB3aGljaCBjYW4gZmxvb2QuIFNvIHdoYXQgd2UgaGF2ZSBsb29rcyBvay4NCg0KVGVqYXMNCj4g
DQo+ID4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAgCS8qIFJl
c2VydmUgcGFnZSBhdCBhZGRyZXNzICovDQo+ID4gIAlyZXR1cm4geGVfdHRtX3ZyYW1fcmVzZXJ2
ZV9wYWdlX2F0X2FkZHIoeGUsIGFkZHIgLSB2ci0+ZHBhX2Jhc2UsDQo+ID4gdnJhbV9tZ3IsIG1t
KTsgIH0NCj4gDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3DQo+IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDkwMjE0NTM0My40NjU2ODYtMTctDQo+IHRlamFzLnVwYWRo
eWF5QGludGVsLmNvbT9wYXJ0PTEyDQo=
