Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2BC378D9A
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 05:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450699; cv=fail; b=tUeiUrqieXLZBSv99MX6M2WN6GQTRmDfW0zOAHe4W0y8Oi3dok38ZEEBy448x4RDVnH5cqPC5YBvwZRLqm3rElPEsybvIEbEPewymSlYtyN/0WGggaOFdkMy8DzTi7ikxlE9svLvaNSreFoPjPyG1mdt/1rk9mLfcONfxxsncVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450699; c=relaxed/simple;
	bh=/OH5hY9pqbNa51FV1Bs/g2L4XhTEoAZ2AJfvW9Ql9X0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GZOzpG4iSIhZA1ZI+/WJuimb1ydrbcQCB9b0JfeheUSmJecjuzu3AZr2vfG2LarIkR+s5JLP5xoM4/Tdqahijcf6O1cG6+cjw3J8JmXbWpbYn3Pg+Q0pVOL5IfCVwv1lb5l2XombI0MS7D6zJxI2tqfd4NlS/CjhiUOoxrlEJgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DckA+kYG; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DckA+kYG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789450697; x=1820986697;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/OH5hY9pqbNa51FV1Bs/g2L4XhTEoAZ2AJfvW9Ql9X0=;
  b=DckA+kYGYs5rtnLCoQHktWtBKboaTMRDG2r5VnhGuxiD2oQRh5DintKd
   AZbV2Z7/dhh5Px+xz4E8Am/OVo2/UipGQHRDH12tcQ+2ShFtc2JOh5wkF
   XDXjUW5JlrqHIYa2VsukovkxhZv61KCW4WJHsdXLU8dMbBRtoUTIoZqUu
   OJLU293tuEqtuJjgGo6cMmuFZUGyk3jPgo8TuredUW/w1FvqIScHGoFxk
   g48YYJ/i334MKyX7aiYcvFksnkKGBkBtpPthgW8foy1U2gVSTtqT4Y3c1
   zmJs9g7WHOZchygNdjYKEDhBwuT2wsRs7QHnPTvJdD0/TRvBqDt9HMHVk
   w==;
X-CSE-ConnectionGUID: 33IB6uMcTF+QV4p6OVAsEQ==
X-CSE-MsgGUID: OYbTQbxHSUiXGII1yXpjqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93629445"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93629445"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:38:16 -0700
X-CSE-ConnectionGUID: D1tpi5JjSjiHbCQRXCGfyQ==
X-CSE-MsgGUID: JkfMfmvvRkaXUpIVE2SJHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271438270"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:38:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:38:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 22:38:15 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:38:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tynZcnJmqj+yrhLK4ZYKaUGZ7S4bl9iR+/KGKSkCigEUozcZ/UT6KJgMR2lcj40Ezilflp/9QPDvMgwv0CTRjZutW6zRKoV7p5JDNkLKbY0xVnJn1aqPVfhyCI3x+C18tZbf+LeWZjJ6LQ5xGkuYO4X6QEgHSWAHSL7LdZPS5esFig45GjW1ohaJyKYdtCV9Pm70HfhvL4eRcyZaN68B5aLVcM2JU5Y35eEDl+Itbb66aUSVh1jZL77M2kfuwVHw2DpKk9uqDOKM5XgbttPKzEcKs9iR1KylPz7rktF6i10FAaKbmfMAcf/aJE/g2tUSfUoMOU1GlhcJd6Xp5JFMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OH5hY9pqbNa51FV1Bs/g2L4XhTEoAZ2AJfvW9Ql9X0=;
 b=FszGmagrb43cZzc8hIjZplasnDSC6HgTMKVF8ZVNf5BfJHuuVCPjIW5d+/EdpWnGc2iToaRm3cyJ4VweE79xfCQbFbiMPALegecFZQq2hMYTQzj8idv4HmygdOYQUJf5/m+0ZHdfwJfGu6IKURaMHuaYEzGmmxzCaDswZlXB0eqQkycKNf89RV/mrmclKKfC2uM9zwAn9P6Qdz+1bFrIieeoSbAigDesLi4S3FOWROuu4mEVf4MM99LQ0qfbyqkRcqDf3S1qD9FIyHV+0SrucivenoDpL8CHLOE9lG8J5XdyP8BCVLeS/zdOBN9AOOBKKpdDgP9H1jtIy7NMegImpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS0PR11MB7622.namprd11.prod.outlook.com
 (2603:10b6:8:144::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 05:38:07 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 05:38:07 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 08/10] drm/i915/display: Implement Wa_14021768792 for BMG
 DP for link_m/n ratio > 10
Thread-Topic: [PATCH 08/10] drm/i915/display: Implement Wa_14021768792 for BMG
 DP for link_m/n ratio > 10
Thread-Index: AQHdQaQu5umR4T+770KznO+LnCEDwrbIyVuAgAZbleA=
Date: Tue, 15 Sep 2026 05:38:07 +0000
Message-ID: <DS4PPFE901A304F8862B814BAE0FBFBAC0FE3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
 <20260911041449.3699400-9-suraj.kandpal@intel.com>
 <20260911043050.65A871F000FF@smtp.kernel.org>
In-Reply-To: <20260911043050.65A871F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS0PR11MB7622:EE_
x-ms-office365-filtering-correlation-id: b3c6791a-82b0-4d17-215e-08df12eb858a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|4143699003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: TGHhtAJwt5XaFskmsNBuvf1WjIegl6SGYmRjJ0RfW9hFW117FG/5ZfkxjWSoBKbPhq/lC/hGhTdhZIMoEDuDDfO55kSK6AK6oceW2Y7X2+4zX+iAai9aYr+gIoP0McHTyMofBtjIJjBXZwy7CwEh1cXXUe0JF1H3tA68zLBhIomMMFvJG+lFagCt/lavu1D2zXTbOszNHbPBt2ijwMS2hmeoh5UbY6S3nGWpu6KgmnGM6Y0K7sQ40HfYm7G+4ybnfoc84n/+ISsUJ8Fav8gjivEEWV70/glulVta28sTrva9EOLyI91vX0RkDzOyBDA/ZoLUiKAQPHjCGAgLVwEaSKekoffdaCXA5FmPfXbNU9tsjkHBDuTnvhVQhfx5ESaNs6Znx6BEjuSzvxcrOX3Ldae3v4nIiQKUqobGID+d7veQE444Oc+l67ceQ46KHWcHEWvyiGqLJZcYO/o8KN6PPfxxr3aUhAEURihhX/VStUtVtz3GdRfOAGQ5/eZ0FOrxKNwBkFeIsPHbQ6rFXiZSbjPVnnLkbcPVjVjZcZ2ZPh88sO8+lgr1yDpGD5IDKM67mPEvDnW1BuET+6JCUbchFzAn4S7PXbPyQLIeeGw2o7CEcZLWvMc6wr0hNaGVL+OGrx8zt1Cuk+C6xnPH28s5V+Pt6eKZP3orDKI0WumG4ns=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFE901A304F.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(4143699003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWxWRit5dzNlTHZUaW5NUkFMRUpWSHc2TFhHNGpYMEQyWjJxNXY2VE1JS1h2?=
 =?utf-8?B?Z3FWek9ZWHJYck1aeTJiY05WbGdseHc4WjVJSzBmVzFpbE1LblRPeDY1QUk2?=
 =?utf-8?B?ZE8zM0NFN0tHK0Yzd1YxSGlxdC9Mbk9mQVV3WUtuMW0yQ0s5UmdYR05JQTg5?=
 =?utf-8?B?N3VsMERVZW1EZngvK2Zsa3pLN2VsZjJTb3JvZHZnL0ZpalJBQUVBYXJoK3lC?=
 =?utf-8?B?ZHEzUzVqV0o2TjdVYjBMTU5ZUkU3OXloRGpkaXZVYzkxVDJQQWorNyt0TUJ3?=
 =?utf-8?B?U3FvNkpjR2ZMTnM3MU5ZaGtNSzE5UDdJLzFUaEcvSlRSaG40Tzh1c0pTOFVP?=
 =?utf-8?B?eng2VnlQYmxScmZlczRuWUplRlJVRndzbVNGY0hmRDR6aFdZNlRJTEFlbDl5?=
 =?utf-8?B?N0p6Tys4KzF2aFIxTDgwNjRnZ0gwdnNBQ1hydEtabnRNQllXaENYOXVUWWxh?=
 =?utf-8?B?OXY0ZWZaZ2x0a1hJK2oyTXpCeVBkVmR0WEZydTUwMTNLMUY3QWtQZHBiVWlN?=
 =?utf-8?B?aG4vTGRoK3lpZ1J6Zys3c25lSzN0R3l5Tk5obUl0ZEVzSXBvNFZCVXBaamxK?=
 =?utf-8?B?UzRja3RUWHFOK0hmU0Y4aDMrb1JMc2JOLzBoeGlabGpQQS8rc1U5WnpUQjhr?=
 =?utf-8?B?NlhJTVpxYzhKOE8xa1A3bm5VODAyN0Y1aG1GM2lsZU5ONG9CVnFBU0xoRklh?=
 =?utf-8?B?MXZCWmg5QVAxRjZzWlE4eGh5ai80a1VMZGN0VHNjU0JzUGN0OXdsUFltanNo?=
 =?utf-8?B?ZU0vVCsvaCtmbWJMZkVvaEpESkNuSnBlQkRHT2ViVkZ1TFBOMkdZVklhSTJT?=
 =?utf-8?B?WEExTXVCUGhSTnR1ejdWb0R0UmJ1OGtudU9PajA0cEVVS0x4NUIzQlBsOFlT?=
 =?utf-8?B?MkwvWDdmc3lOb044RjU0MjFTZnovbjAvVzdCUnRyMDVMNjdZZm9SVktTemN3?=
 =?utf-8?B?V0RUc1hoK0hLa0F3K0YwWkFrYmRrOVRTZC9xalc4cEhDVCtOOW4wQ0tzbXla?=
 =?utf-8?B?ZkNyV1BWWXJ4NXBDcmhQSnVYWFdKZjM0M2tTT0UyR2o1NWxJM1I1TE5KYzln?=
 =?utf-8?B?RnFFYjZHVE9KcjZ2NGVoclU0TmYzS1hTc0w5VEVSck1CMHY5T0t3bVB1WmJi?=
 =?utf-8?B?TEVvKzI1TWx6RU4veDFvV1ZiR2V0WGlFTjBpVEg4bFJOdFRhZ0FDaXdxaWtO?=
 =?utf-8?B?cDhVN0YzNXZOajQ5OTdreDVBc3M1OThad2V4elpYSnlUZmdsM1h5SzAwSTdn?=
 =?utf-8?B?UlU4aHFhSEswRExialNicTVkaFpTRnZaTytyVnhwampTOXZIWWd6WERBWnU0?=
 =?utf-8?B?ZndCY3BMcnI5cEJSTUNMaHo3aVkxbnZZU3JiWVJOWm8raFQwd04wUm5aNWlj?=
 =?utf-8?B?bmk5VE9XZmxjdGI5SEtVRW4vQWUwVDM5cEh0R1lvL0dncnNJaVlBdlVkdVI2?=
 =?utf-8?B?ZFdueDVwQ3NuV092aFljSkFzYWlKOEcweHUwZVNDMGlPdUxPbjBDUEowVi9J?=
 =?utf-8?B?NmxleFpoOWY0aW1tY2dhcnk3M0JFa0RNRm9xZTJrRnNoVU9pRm8reHlsQ2kw?=
 =?utf-8?B?eTNaN2VDUzR5V0ptVm5tVEpEV1V3b05iK05yUStSMmk3Yksra3UwbTNiQzdY?=
 =?utf-8?B?K3ZnaTEzMG1vOTFWenFYcDZnMzUvK1QxdmVsQzZJMzBQM05FR1ZBL2dadnIy?=
 =?utf-8?B?YWlsRGRuWS9Yc0hXZCtGS3ZORWZETTloclNYZUdKREc5c08vQ0w5T3QyVyto?=
 =?utf-8?B?YklVZDNEcUJaVHpSNVY3Q3ppRG5OaUp6SUZxWmhXbXdHUnpYeXlQRWtXdWdG?=
 =?utf-8?B?RFZUM2YvKzdXYVJjR0I0bS9qVDJFeldtT1YvL1JLZURnaWNkclRGaExZaHQ1?=
 =?utf-8?B?RlJvam5nMHdzOXptOWVYV1VuNU5KQ3NOVWl6OURtODZTUjFHWTdudXhVVDRE?=
 =?utf-8?B?QzFXb2dUREM3TzFhQU9QWkg3dVlLOUJhUmF2QWlrZ1N1TkZUMFNjeGk3UzNt?=
 =?utf-8?B?V0t5Q1Y5MDIyNjRxU1ZoV1dQMDNHcjNxME42em1DSG5LT1U2N0h6M3hndDRs?=
 =?utf-8?B?VjZPSTBEUTd6Y0ZwczdlaHowM2VpRFBkdHJjMU9wK1RpTnhHTHRQYzFjWmhN?=
 =?utf-8?B?cHp5TXFwTHBVWGNJQmo2QnFaMkJLR0Q0bVJsb1dMbThpMEUvbUVyN1MvUFlj?=
 =?utf-8?B?SDVMS25QdW1IYW44enBBMHBCdDJ0LzZJV0tYb0d4TlpoUDlWalVTd2JQQU0v?=
 =?utf-8?B?Zm81b1EyQ0gwTkZzRDBaS0wxdDhhem1ZdldOV2JuODdJdlRLR0VIelF0dnVa?=
 =?utf-8?B?WWUzQWY2VnBkeUd3SHhLelVhT0JXN0JEWDZqRHlvK3hHRmNlM3NFUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jLXOYosPE51yTMj9BLMoZpvOiQlT4AUT2yXomgOg4EEaHOjRxZmL/OZlJg6twCqpy8rDUMuKpVX9RPI7XfxCQvvxiUKi37m74I8jrzXhUtRg9h9vaE7p6cl04a94LvOSGjzkkudsRNnziqSX1+UJgwdMu76R2O/n5GBA8gI0TI/GAOtPs14ya6LNn5zyz26fzT2DqptqdVDedGiNW1sUBpC0pypJDEovLfivqBntyFsO8pkZmrRZ6qMAIDDWIGtGR5QJ1X4cnkJrrAIpSF/Bvw2HRtvfYsMcPy/gttKPuQuaJx9y4XBvRLuwFwOXfVFn308FZSOXdFOSR4/dMQAbvQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c6791a-82b0-4d17-215e-08df12eb858a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 05:38:07.6364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xo86gx5d6di8RHUIRGmUeHxGu10JbrzfisAB6/mbR6bBEo+tsMwDRo2bj/Lt6M1NkFyE8yFZQ7G28mcivjj/eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW1BBVENIIDA4LzEwXSBkcm0vaTkxNS9kaXNwbGF5OiBJbXBsZW1lbnQg
V2FfMTQwMjE3Njg3OTIgZm9yDQo+IEJNRyBEUCBmb3IgbGlua19tL24gcmF0aW8gPiAxMA0KPiAN
Cj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91
bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj4gY29uc2lkZXI6DQo+IC0gW0hpZ2hdIFRoZSBg
YnlwYXNzX21fbl9yYXRpb19saW1pdGAgZmxhZyBpcyBub3QgcmVzZXQgdG8gYGZhbHNlYCB3aGVu
DQo+IHJlY29tcHV0aW5nIE0vTiBwYXJhbWV0ZXJzLCBjYXVzaW5nIGl0IHRvIGxlYWsgYWNyb3Nz
IGF0b21pYyBtb2Rlc2V0cyBhbmQNCj4gcGVybWFuZW50bHkgZGlzYWJsZSBEUlJTIGFuZCBzZWFt
bGVzcyBNL04gZmFzdHNldHMsIHdoaWxlIGluY29ycmVjdGx5DQo+IHByb2dyYW1taW5nIGhhcmR3
YXJlIGZvciBzdWJzZXF1ZW50IG1vZGVzLg0KPiAtLQ0KPiANCj4gY29tbWl0IDEwNTFlNmYzN2Vh
NGU0YzM2MjllZDFlOTMyMDZjMjM3ZDgyODYxNTkNCj4gQXV0aG9yOiBBbmtpdCBOYXV0aXlhbCA8
YW5raXQuay5uYXV0aXlhbEBpbnRlbC5jb20+DQo+IGRybS9pOTE1L2Rpc3BsYXk6IEltcGxlbWVu
dCBXYV8xNDAyMTc2ODc5MiBmb3IgQk1HIERQIGZvciBsaW5rX20vbiByYXRpbw0KPiA+IDEwDQo+
IA0KPiBUaGlzIGNvbW1pdCBpbXBsZW1lbnRzIHRoZSBieXBhc3MgbG9naWMgZm9yIHRoZSBNL04g
cmF0aW8gbGltaXQgZm9yIERQIG9uDQo+IDEyOGIvMTMyYiBsaW5rcy4gSXQgY2FsY3VsYXRlcyB0
aGUgTS9OIHJhdGlvLCBzZXRzIHRoZSBhcHByb3ByaWF0ZSBmbGFncyBmb3IgdGhlDQo+IHdvcmth
cm91bmQsIGFuZCBkaXNhYmxlcyBEUlJTIGFuZCBzZWFtbGVzcyBNL04gZmFzdHNldHMgd2hlbiBh
Y3RpdmUuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
Yw0KPiA+IGluZGV4IDU4NTc2MmJlMDdiYjIuLjI3ZmZkOTM3Yzc1ZjIgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+IFsgLi4uIF0NCj4gPiBAQCAt
MzM4NSwxMCArMzM4OSwyMSBAQCB2b2lkIGludGVsX2RwX2NoZWNrX21fbl9yYXRpbyhzdHJ1Y3QN
Cj4gPiBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLA0KPiA+DQo+ID4gIAltX25fcmF0aW8g
PSBESVZfUk9VTkRfVVAobV9uLT5saW5rX20sIG1fbi0+bGlua19uKTsNCj4gPg0KPiA+IC0JaWYg
KG1fbl9yYXRpbyA+IG1heF9tX25fcmF0aW8pDQo+ID4gLQkJZHJtX1dBUk4oZGlzcGxheS0+ZHJt
LCAxLA0KPiA+IC0JCQkgIkxpbmsgTS9OIHJhdGlvICglZCkgZXhjZWVkcyBtYXggYWxsb3dlZCAo
JWQpXG4iLA0KPiA+IC0JCQkgbV9uX3JhdGlvLCBtYXhfbV9uX3JhdGlvKTsNCj4gPiArCWlmICht
X25fcmF0aW8gPD0gbWF4X21fbl9yYXRpbykNCj4gPiArCQlyZXR1cm47DQo+IA0KPiBbU2V2ZXJp
dHk6IEhpZ2hdDQo+IFdoZW4gcmV0dXJuaW5nIGVhcmx5IGhlcmUsIHNob3VsZCB3ZSBleHBsaWNp
dGx5IHJlc2V0IHRoZQ0KPiBieXBhc3NfbV9uX3JhdGlvX2xpbWl0IGZsYWcgdG8gZmFsc2U/DQo+
IA0KPiBCZWNhdXNlIGF0b21pYyBtb2Rlc2V0cyBkdXBsaWNhdGUgdGhlIENSVEMgc3RhdGUsIGlm
IGEgdXNlciBwcmV2aW91c2x5IGFwcGxpZWQNCj4gYSBoaWdoLWJhbmR3aWR0aCBVSEJSIG1vZGUg
dGhhdCBzZXQgYnlwYXNzX21fbl9yYXRpb19saW1pdCB0byB0cnVlLA0KPiBjaGFuZ2luZyB0byBh
IGxvd2VyLXJlc29sdXRpb24gbW9kZSB3b3VsZCBjYXJyeSB0aGlzIHRydWUgZmxhZyBvdmVyIGlu
dG8gdGhlDQo+IG5ldyBzdGF0ZS4NCj4gDQo+IE5laXRoZXIgaW50ZWxfbGlua19jb21wdXRlX21f
bigpIG5vciB0aGUgZWFybHkgcmV0dXJuIG9yIGZhbGwtdGhyb3VnaCBwYXRocyBpbg0KPiBpbnRl
bF9kcF9jaGVja19tX25fcmF0aW8oKSBzZWVtIHRvIGNsZWFyIHRoaXMgZmxhZy4gQ291bGQgdGhp
cyBzdGF0ZSBsZWFrDQo+IHBlcm1hbmVudGx5IGRpc2FibGUgRFJSUyBhbmQgc2VhbWxlc3MgTS9O
IHVwZGF0ZXMgZm9yIHRoYXQgY29ubmVjdG9yLCBhbmQNCj4gcG90ZW50aWFsbHkgbGVhZCB0byBp
bmNvcnJlY3RseSBwcm9ncmFtbWluZyB0aGUgaGFyZHdhcmUgZm9yIG5vbi1VSEJSDQo+IG1vZGVz
Pw0KDQpBbGwgdGhyZWUgY2FsbCBzaXRlcyAoaW50ZWxfZHBfY29tcHV0ZV9jb25maWcoKSwgaW50
ZWxfZHBfZHJyc19jb21wdXRlX2NvbmZpZygpLCBpbnRlbF9kcF9tdHBfdHVfY29tcHV0ZV9jb25m
aWcoKSkgaGFuZyBvZmYgZW5jb2Rlci0+Y29tcHV0ZV9jb25maWcsIHdoaWNoIGlzIHJlYWNoZWQg
b25seSB2aWENCmludGVsX21vZGVzZXRfcGlwZV9jb25maWcoKSwgd2hpY2ggaXMgb25seSBjYWxs
ZWQgZm9yIENSVENzIHRoYXQgbmVlZCBhIG1vZGVzZXQgXyBpLmUuIG9ubHkgYWZ0ZXIgdGhlIG1l
bXNldC4NCg0KTm9uLW1vZGVzZXQgY29tbWl0cyB0YWtlIGludGVsX2NydGNfY29weV91YXBpX3Rv
X2h3X3N0YXRlX25vbW9kZXNldCgpIGFuZCBkb24ndCByZS1ydW4gY29tcHV0ZSBjb25maWcgYXQg
YWxsLCBzbyBkcF9tX24gaXMgaW5oZXJpdGVkIHdob2xlLiBUaGF0J3MgY29ycmVjdDogdGhlIGhh
cmR3YXJlIHJlYWxseQ0KaXMgc3RpbGwgcHJvZ3JhbW1lZCB0aGF0IHdheSwgYW5kIHRoZSBmbGFn
IG11c3Qgc3RheSB0cnVlLg0KDQpTbyB0aGVyZSdzIG5vIGxlYWssIGFuZCBEUlJTIGlzbid0IHBl
cm1hbmVudGx5IGRpc2FibGVkLg0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KPiANCj4gPiAr
DQo+ID4gKwlpZiAoaW50ZWxfZHBfaXNfdWhicihjcnRjX3N0YXRlKSAmJg0KPiA+ICsJICAgIGlu
dGVsX2Rpc3BsYXlfY2FuX2J5cGFzc19tX25fbGltaXQoZGlzcGxheSwgbV9uX3JhdGlvLCBjcnRj
LT5waXBlKSkNCj4gew0KPiA+ICsJCW1fbi0+YnlwYXNzX21fbl9yYXRpb19saW1pdCA9IHRydWU7
DQo+ID4gKwkJZHJtX2RiZ19rbXMoZGlzcGxheS0+ZHJtLA0KPiA+ICsJCQkgICAgIkJ5cGFzc2lu
ZyBMaW5rX20vTGlua19uIHJhdGlvIGxpbWl0IChyYXRpbyAlZClcbiIsDQo+ID4gKwkJCSAgICBt
X25fcmF0aW8pOw0KPiA+ICsJCXJldHVybjsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlkcm1fV0FS
TihkaXNwbGF5LT5kcm0sIDEsDQo+ID4gKwkJICJMaW5rIE0vTiByYXRpbyAoJWQpIGV4Y2VlZHMg
bWF4IGFsbG93ZWQgKCVkKVxuIiwNCj4gPiArCQkgbV9uX3JhdGlvLCBtYXhfbV9uX3JhdGlvKTsN
Cj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyB2b2lkDQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJl
dmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTEwNDE0NDkuMzY5
OTQwMC0NCj4gMS1zdXJhai5rYW5kcGFsQGludGVsLmNvbT9wYXJ0PTgNCg==
