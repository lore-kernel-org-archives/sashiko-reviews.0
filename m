Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD966385D9E
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 18:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597027; cv=fail; b=MZws4rApCdPu5aVmWMSUrpG0l0kQWvWK6Ufc9CZOfWkJLyHN9rWUN+igB7KVTdZnEiSbeJr2JksyIII9wCCoTVcoeJzkgW2i/Di/Sbvok0pRApt0FMdnWrAbnqLW/I8pCvKJTZx08WgVogAfSKGkSkwtwx45AcsB8p0fqW3zJH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597027; c=relaxed/simple;
	bh=CShI2c8HBPo5FpmjlzOtR0+RyTRG6e+zxtONchn2ObE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nfnN71uIk0BRlcgv8ClVgfvWK9YWSWjOXizlrEA2DGp5SjrgP3YNyubCbRFCRncw+rqL1dkvNi78DEIu77P74q7iBsWPzEibNVIjRDAVyjV9hv4Kx+DFjIRnxWhRqKp3WOEuhG92lC0pm2U6qA5G08COkq6GYWykhoa4aho3pZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POD/EPsX; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POD/EPsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787597026; x=1819133026;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CShI2c8HBPo5FpmjlzOtR0+RyTRG6e+zxtONchn2ObE=;
  b=POD/EPsXvy8Dh4NLZXuDcvNe18+Foy00Mq2Za7O0oO/scsnVYIz4N5sd
   A5RoDw85spCmSuWUfkfMssvnAtJl9lCZTMrvo8Z5Z8gjjG5m4U+nw6viq
   CWNkNmXfR5g5HOXRpn9yWq06glOfCsQiL+4X8OOV+5FngtQgleWiE2Hqt
   bCcjz9qxmsxHLW3zW5QR3b2mswqcN+MFFLBbDNiobYva+rEySisopuyOx
   58bfvOIJYV6LUB534Qhewcej9KiC+EVsQ+aOOsjN1CoPLww0YA+KUF8yH
   0LenO4YxGmtwGkM9P7E0Y1sQyWzczdgnesFdJAm8AW/j5zt30Vp9jcrYe
   g==;
X-CSE-ConnectionGUID: YhktFuKMTvulZ+UnUoQtRg==
X-CSE-MsgGUID: EuIqmtguT52pPjaQXLkAZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98733646"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="98733646"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:43:42 -0700
X-CSE-ConnectionGUID: bf8nvz8TQvKEsY3OJnDnjg==
X-CSE-MsgGUID: fXINhELKT2iIa5Zp1E60Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="265301407"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:43:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:43:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 11:43:42 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:43:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXtPfkrk7HMe6NkT91V+j09zdj7jpOKDr1DsBJr9XYOD7dnJf+5TOMMmV9WDlyBNbWwiNFGNdIXUqFrOoHsfLti1R/QaKhQgj5/YzgPjxe/eSTEbW1vtwH/bAC7QxXIjgZP/qYerbzx0cAdNKDRBlIKHpypHQRtsOl8UfkMQl8pt7EeS1viRs9FR8uoqRZTveMqTBpjlUdp5vpnbCYzObB4W4opE94eI4h8bmJD/j9PeYBIl2XAKziG30VD4ryfB4l+yj3w5o2+B3Yy4IimdF7plYFRzu/dQop4eT4aFukkICF/ktXY6PgcdrJWzBkqZXTx9t+955jWND36VTaR9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CShI2c8HBPo5FpmjlzOtR0+RyTRG6e+zxtONchn2ObE=;
 b=US53/wDYqaR20pag0VgNBS9S/wSIHho57RReALmMO5M3p2cT4ac4hcFTWIQEvbu6gnKvHJk9qSI0tQUsuVbRNTAO3q7+8kp1UMm8F1vP76eOpxU8uVfSTl9rzhLAXthunLUdd1LJme/e9TzOhpfX7PmKpIxIXnHWfmXNnqHL3sE3+ONRf+/ZeEYcN8pvHBRp+6FlJ17tqISrslF6bOBA7xC336PZHAoUgck6MtHDP+ZtwFDUFiR0EoatrhHG40S0PxYHYpVQpyqiLpOMfzTBtwfvabI7KRBCkhIbxloepGj51eZytHmkRT68upgLfgyLTPP0XMllTBDMHp5NeVtixQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DS7PR11MB5992.namprd11.prod.outlook.com
 (2603:10b6:8:73::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 18:43:39 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 18:43:39 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 03/10] drm/xe/vsec: Protect against missing config
Thread-Topic: [PATCH v3 03/10] drm/xe/vsec: Protect against missing config
Thread-Index: AQHdM+UPdFjFUiXfk0qW9eJpr0KbFratZaqAgAAi7SA=
Date: Mon, 24 Aug 2026 18:43:39 +0000
Message-ID: <CH3PR11MB046149A7987F01521DF80E839EC1A02@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-15-michael.j.ruhl@intel.com>
 <20260824163635.C03301F00A3A@smtp.kernel.org>
In-Reply-To: <20260824163635.C03301F00A3A@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DS7PR11MB5992:EE_
x-ms-office365-filtering-correlation-id: c3ddf978-2bd8-4cc6-c180-08df020f9d26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|10067099003|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: 3bSD+p4J1oG0acIYktHawr47G/OZmFiNqTDKr9EFmFqIJ21nwTMsrJIxZreJIAwf+9nFdtqhImDzUNO4Zt9CZOw5UdpmhV2OcpKc//yHSCnMXpEjNjmS/TlboKr/apRWdOASVuDFL56aR67HiEU3vEMOBMZD8cmHh2QLqUpFmjmCKZMppcUqDkRjKTIrbw0dcwSUYBov66eNOmJT5yV2L2v/QMNFRxDUVX81hGPia0lQ3wnatOHdkvF09R3RoCHhsipl6u5mIEDJThnvhpWsaSUItffjQKdJYlqPdig1ryIA7cOqLMpgtX5Em2Hi8KtnXnkN9QpVv4HzNNoWlaUOcEZpB1Y9iJEV+e1jPqKsUHWIhdKlNsNA4uQQ2P3IrC2GmOMNT2Awi84/DDS+mBAs3lSvwXs1/rUmwETjtGEzrGHEm7/NTvicRZAVoXiWnOLBzIicpj/hFWzJQtL5oXWyaPERGt09Jr6oSKHXgPuMwODKl8c9DYlsxWfCCt0IUjspZd3fz+viVmJEmc08D4GtmjhzbT1qxaZNw6jiUcVfX1F1vQV9YT/qCwwgtbdnYSuXjxlac95sQOBaTlmsHTRBC0G5NbGmaPdLNoaRFur9lGx3QnjIxYeT5K0wHaEmxVYhKpQLTfAcG2wmVNfDNcVK+QXNsoFc5/5RwHQ1TWH1BKE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SCs1clNiN1pnRWZuajdHUmRwTWpBVnFOeEVQeDMrTm1qWUVsRDJQM3ZScGYx?=
 =?utf-8?B?VXdqWlRzVFRraFU4MHJ2MHJpSk1tT2xpZ0FYcGc2bmhhQ2NveVJwMUN3QnV1?=
 =?utf-8?B?Rkd6SUFUMkhRRU9UTmJ5V0piZy9HWGFlVHpqRGEzUWJIU1NUcEZQRVBpeUlS?=
 =?utf-8?B?QVd3bEtXcFRSN0ZHbCtCUys1dWo5ODA3L2V0UStnVWxGRjlDVjF4TWpXN1dH?=
 =?utf-8?B?U3BzZGFmUzRUYjl2SUN1MGh3cXRHTlZhWXpENE9tZ1VjZ1cybndNZld2cGIz?=
 =?utf-8?B?bXJhdlJVVzJUN01BQXBoTDZ5ZTNGZ05xckZJRURUOURXWWpHTWZvTFFxSy9q?=
 =?utf-8?B?czVRNWQ5ekdwZ3BYOWR1OHByUnlCMGRoNGRSaTRWbXZIWE1vQnZpeW16YlZj?=
 =?utf-8?B?RStWNmRQRmlsYy80T25mMWNnWXZ3VDNrWUNMaG1QZFpONXFVandyTTZXQXpp?=
 =?utf-8?B?c1RRMUs2U0dQUE9FUm1YRktHWldWTEk2Y3hjWU9qcDRjeDNadUQ2elNicHI4?=
 =?utf-8?B?YkdyZlMxd1hLTDMxdFJhSzNwSmVOeHVVemE2UnhWVldPTmp2VUdQcVhWcDdP?=
 =?utf-8?B?U1VWMGpUVUU0eTNQNFQ5VlVITEpPTU9RQzdjMEdGZkt3LytHV0dhUmNmNFRy?=
 =?utf-8?B?OVVlUTA1eUhITUJrSDBmY3c2SHJlQTBXMjZkd1pIRTdTWThyd1NFaUhvUmp5?=
 =?utf-8?B?aWRyUExoL2hvd0NYVG5RSDB1UmlteVUydnNGLzBnb3QzMXJNUzM3Z1BDZUUr?=
 =?utf-8?B?R1VZOWg2RkovOWorN0l6YUY1UUg2dzc3Ylh6aEc2NjhJOGNxUUtZSVlhSHRF?=
 =?utf-8?B?YVhMNVh1S1AwNGV6eFdqVTZWU2t6enNoU1AzSXdFWGZ1Zlo5Y3d5bjdhdHNM?=
 =?utf-8?B?cm12VUl0Zy9aV3lGODNrejNHeFF6bHBFVnNBMzM5THN2aDRnbTJCTGZ1bEly?=
 =?utf-8?B?QXgyNElKTEl1NjZGT2pOWnNNNTYyMjhxWUw5QkY2VWZDS1JOS09OenVFdlZD?=
 =?utf-8?B?VWh6cDlRdUpET3FyRmc2ZUpBZDEwNkxITG45dEQwc2hNMXVidXQ3VEN1TzNI?=
 =?utf-8?B?aVpST2NLaHpzK25TYUNKSi9jenN2U2JpT1VIeThTeUt5b0FqWmp1T2g1eFlO?=
 =?utf-8?B?dmRRZnpzcER4V01Xakh3ZFU2ek8vQ05GNlg0dnI2b1Fzb1Y5MUQ2OGdCTFBv?=
 =?utf-8?B?YlY2YUtybk9sQnBuRHNvbHpEZDBINnBWRVdQQmU3Y2VLYzdtd3JBZnIyVGpl?=
 =?utf-8?B?NTJJZ25qTXZyQkF5cmJ1WC9nZ25DdENYeUR3TldFYjRydWJ5eWdRTHJNQjBq?=
 =?utf-8?B?Mzk0WXN2Z1VtSCtuN0tRSW83Z3NYNEx1c2lhcEYxWHZEWk4xNGkxa2VxU2t5?=
 =?utf-8?B?MjZOcXczaERLQ2VsUnF3OUtJTFRDWHUwNnlKMXFXUlBuelE1UXFqTlpqNHR4?=
 =?utf-8?B?K05TQ0tGVks5Z0t0c3JZTTZaWkJBWWxJTG02Z2tGenFjWVZydzRBTE51WmJ1?=
 =?utf-8?B?V2R1RjJNS3pTcTFXdWtsbVREbG56bnpzUzRacS9IRk5HRnRTOVNuNkV1RmNk?=
 =?utf-8?B?QXlUWW8rdW9zd29LTDluWUQzdE4zem8vc2RsT2VKRU5wcTR3UTEvZHlWRS9T?=
 =?utf-8?B?bXhVUHBRbnZMSE1Gc3U2R0RlWG11R2FoOFRvWlFxWm5wcEpRNW16OFYvM0xY?=
 =?utf-8?B?b3k4Q3QrSXdUbEdPSE9PMWlKU3dFajRwVG9TMC8zSFpmVEQ0SSsxbU9ycEtr?=
 =?utf-8?B?d204UVB1K3BHcDkrMlFxRzRjZEtEMkpIa0pCSFJWMmc2QlZ3alcxUitKMmhU?=
 =?utf-8?B?QmlvbW4zZ2xEckdXY2RDUGJRdG9FeGJjOEdzcXovckVGQlluWGxrQXdGVUx2?=
 =?utf-8?B?cjdMakl4U3RBRkJJOUlLZjdLZ2p5bVk0UThwUnZycVFxQTE5bzg0dGlHNnh4?=
 =?utf-8?B?elF5bVVQNUo0dGdXVkNiSXZKNW9NemZQd29OYWdmK3B0M2ZwZHVWcE9iV0Z1?=
 =?utf-8?B?OG44SXJTaGUybGZLcjYxMDZTY3BIQjZWMDFSQzk3Q2tnR2p1UStoZVJXVEQ5?=
 =?utf-8?B?djRzTWhtaVF0TFQ2VDlwanBkbE5KalVhM2UzVEVhTTlvNGFhSXV6T01DVHBP?=
 =?utf-8?B?MjBKdWhyRTZmN083STdzM3k1c0VkQzNNM09iWVlBWFVyNTQrQ2o4MTZYQkIw?=
 =?utf-8?B?MTF6L3cxZU1jZ1NZMTNsUDdFenF2NjFwMWNSdnpIMXRmZ2VnTXhoL080eEJN?=
 =?utf-8?B?SFdmcFVHSko4bkxCdElRdUloWGZFTDZ0QzZBQno3U0pWMFBaMWtJUWN0QldX?=
 =?utf-8?B?QmZGMitabFdCanNOZnJ3dUFTakN3Vi8vS3lMUDlpd1hnbGNyLytYdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eK6FOACIztsMW+t1pJTHQ6OjzU1AIE7JmV7BVd+gy1gMh8pGA0g1D5SGm5GYsKDUSehTAbsmkUkU/ETlgGspFX3IvtPhVvn7L60GQSn/S4doryAfZ7b+vNEDIBdUO6JFEOSIlKSmUMumQsY6cUrfOBB63nZhpQj+Q1Hsd57/fgn9SD//gOXJWfT0paugow49Ji9xUCAiSRHMxHFqzat9bZQfNJxMBuKfX0mKmk9ncaYw0x4YCvP+2N/GfOlahqA3lKiOrF6h7BZKEF4wFW7+eiN9y12gI+Gk3o0bOgo1Xu/JAOfBSmf0krFuw2ZhEGHnmeVPVCxbXZEym+3ZpAxuaw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ddf978-2bd8-4cc6-c180-08df020f9d26
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 18:43:39.4020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PLoI/SUn0iALEXdFw2cY9+MnzeqsuNU+Zynz7YC2aDnCljmDf7Kb63TndNpuJBlZhoBRfC6rPBdgSaWPbyiWsDkALzjthQcVbpJAEv2Bcm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5992
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBNb25kYXksIEF1Z3VzdCAyNCwgMjAy
NiAxMjozNyBQTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNv
bT4NCj5DYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwMy8xMF0gZHJtL3hlL3ZzZWM6IFByb3RlY3QgYWdhaW5zdCBtaXNzaW5nIGNvbmZp
Zw0KPg0KPlRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIDIgcG90ZW50aWFsIGlzc3VlKHMpIHRvDQo+Y29uc2lkZXI6DQo+DQo+TmV3IGlzc3Vl
czoNCj4tIFtNZWRpdW1dIFN1YnN5c3RlbSBndWlkZWxpbmVzIHZpb2xhdGlvbjogVGhlIHBhdGNo
IHVzZXMgdGhlIGFic2VuY2Ugb2YNCj5gc29jX3JlbWFwcGVyLnNldF90ZWxlbV9yZWdpb25gIGFz
IGEgcHJveHkgY2hlY2sgdG8gcHJldmVudCBleGVjdXRpb24gb24NCj5WaXJ0dWFsIEZ1bmN0aW9u
cyAoVkYpIGluc3RlYWQgb2YgYW4gZXhwbGljaXQgYElTX1NSSU9WX1ZGKClgIGd1YXJkLg0KPg0K
PlByZS1leGlzdGluZyBpc3N1ZXM6DQo+LSBbSGlnaF0gVGhlIGB4ZV9wbXRfY2JgIHN0cnVjdCBp
cyBtaXNzaW5nIHRoZSBgLnJlYWRfcmVnYCBhbmQgYC53cml0ZV9yZWdgDQo+Y2FsbGJhY2tzIHJl
cXVpcmVkIGZvciBzYWZlIFBNVCBDcmFzaGxvZyBjb250cm9sIHJlZ2lzdGVyIGFjY2VzcyBvbiBk
aXNjcmV0ZQ0KPkdQVXMuDQo+LS0NCj4NCj4tLS0gUGF0Y2ggWzNdOiBbUEFUQ0ggdjMgMDMvMTBd
IGRybS94ZS92c2VjOiBQcm90ZWN0IGFnYWluc3QgbWlzc2luZyBjb25maWcgLS0tDQo+Y29tbWl0
IDZkOTA1MjJmNzQwMjBiNmUxN2YxZjk4NTg4ZWQxNzQwOTc3YWRmYjQNCj5BdXRob3I6IE1pY2hh
ZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KPg0KPmRybS94ZS92c2VjOiBQ
cm90ZWN0IGFnYWluc3QgbWlzc2luZyBjb25maWcNCj4NCj5UaGlzIGNvbW1pdCBwcmV2ZW50cyBQ
TVQgcmVnaXN0cmF0aW9uIGFuZCB0ZWxlbWV0cnkgcmVhZCBhY2Nlc3Mgd2hlbiB0aGUNCj5zb2Mt
cmVtYXBwZXIgY2FsbGJhY2tzIGFyZSBub3QgY29uZmlndXJlZCwgc3BlY2lmaWNhbGx5IHRhcmdl
dGluZyBWaXJ0dWFsDQo+RnVuY3Rpb24gKFZGKSBpbml0IHBhdGhzLg0KPg0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dnNlYy5jDQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+WyAuLi4gXQ0KPj4gQEAgLTIxMCw2ICsyMTAs
OCBAQCB2b2lkIHhlX3ZzZWNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4+DQo+PiAgCXN3
aXRjaCAocGxhdGZvcm0pIHsNCj4+ICAJY2FzZSBYRV9WU0VDX0JNRzoNCj4+ICsJCWlmICgheGUt
PnNvY19yZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uKQ0KPj4gKwkJCXJldHVybjsNCj4NCj5bU2V2
ZXJpdHk6IE1lZGl1bV0NCj5UaGUgY29tbWl0IG1lc3NhZ2UgbWVudGlvbnMgdGhhdCBzb21lIGlu
aXQgcGF0aHMgKFZGKSB3aWxsIG5vdCBwcm92aWRlDQo+c29jLXJlbWFwcGVyIGNhbGxiYWNrcy4g
SXMgaXQgc2FmZSB0byB1c2UgdGhpcyBmZWF0dXJlIHByZXNlbmNlIGFzIGEgcHJveHkNCj5jaGVj
ayB0byBwcmV2ZW50IGV4ZWN1dGlvbiBvbiBWaXJ0dWFsIEZ1bmN0aW9ucz8NCj4NCj5BY2NvcmRp
bmcgdG8gdGhlIFNSLUlPViBndWlkZWxpbmVzIGZvciB0aGUgeGUgZHJpdmVyLCBWRnMgbXVzdCBi
ZSBleHBsaWNpdGx5DQo+YmxvY2tlZCBmcm9tIFBGLW9ubHkgcmVzb3VyY2UgcmVnaXN0cmF0aW9u
IHVzaW5nIGFuIElTX1NSSU9WX1ZGKCkgZ3VhcmQgdG8NCj5wcmV2ZW50IGhhcmR3YXJlIGZhaWx1
cmVzIGFuZCBNTUlPIHRpbWVvdXRzLg0KPg0KPlNob3VsZCB0aGlzIGNvZGUgZXhwbGljaXRseSBj
aGVjayBmb3IgdGhlIFZGIGNvbnRleHQgaW5zdGVhZCBvZiByZWx5aW5nIG9uDQo+dGhlIGFic2Vu
Y2Ugb2YgdGhlIHNldF90ZWxlbV9yZWdpb24gY2FsbGJhY2s/DQo+DQo+PiAgCQlpbmZvLT5wcml2
X2RhdGEgPSAmeGVfcG10X2NiOw0KDQpUaGUgY2FsbGJhY2sgY2FuIGJlIG1pc3NpbmcgZm9yIG90
aGVyIHVzYWdlcywgYXQgdGhpcyB0aW1lLCBjaGVja2luZyBmb3IgdGhlIGNhbGxiYWNrDQpvbmx5
LCBpcyByZWFzb25hYmxlLg0KDQo+W1NldmVyaXR5OiBIaWdoXQ0KPlRoaXMgaXMgYSBwcmUtZXhp
c3RpbmcgaXNzdWUsIGJ1dCBkb2VzIGFzc2lnbmluZyB4ZV9wbXRfY2IgaGVyZSBleHBvc2UgdXMg
dG8NCj51bnByb3RlY3RlZCBNTUlPIGFjY2Vzc2VzIGR1cmluZyBzdXNwZW5kPw0KPg0KPlNpbmNl
IEJNRyBleHBvc2VzIFZTRUNfQ0FQX0NSQVNITE9HIGluIHhlX3ZzZWNfaW5mbywgdGhlIGNyYXNo
bG9nIGRyaXZlcg0KPndpbGwgcHJvYmUgYW5kIGNyZWF0ZSBzeXNmcyBlbnRyaWVzLiBIb3dldmVy
LCB0aGUgeGVfcG10X2NiIHN0cnVjdHVyZSBsYWNrcw0KPnRoZSAucmVhZF9yZWcgYW5kIC53cml0
ZV9yZWcgY2FsbGJhY2tzLg0KPg0KPldoZW4gdXNlcnNwYWNlIGFjY2Vzc2VzIGNyYXNobG9nIHN5
c2ZzIGF0dHJpYnV0ZXMsIHRoZSBkcml2ZXIgd2lsbCBmYWxsIGJhY2sNCj50byB1c2luZyBkaXJl
Y3QgcmVhZGwoKS93cml0ZWwoKSBvbiBlbnRyeS0+ZGlzY190YWJsZS4NCg0KVGhlIGRpc2NvdmVy
eSByZWdpc3RlcnMgZm9yIEJNRyByZXNpZGUgaW4gYSBkaWZmZXJlbnQgYXJlYSBmcm9tIHRoZSBk
YXRhIGFyZWEuDQoNClRoZSBjYWxsYmFjayBlbnRyaWVzIGFyZSBub3QgbmVlZCwgYW5kIHRoZSBw
b3dlciBzdGF0ZSBpcyBhbHdheXMgY29ycmVjdCBmb3IgdGhhdA0KdXNhZ2UuDQoNCk0NCg0KPklm
IHRoZSBHUFUgaXMgaW4gRDNjb2xkLCB3aWxsIHRoZXNlIGRpcmVjdCBhY2Nlc3NlcyBieXBhc3Mg
cnVudGltZSBQTSBjaGVja3MNCj5hbmQgYXR0ZW1wdCB0byByZWFkIG9yIHdyaXRlIHBvd2VyZWQt
b2ZmIE1NSU8sIHBvdGVudGlhbGx5IHRyaWdnZXJpbmcgTUNFIG9yDQo+QUVSIGtlcm5lbCBwYW5p
Y3M/DQo+DQo+PiAgCQlicmVhazsNCj4+ICAJZGVmYXVsdDoNCj4NCj4tLQ0KPlNhc2hpa28gQUkg
cmV2aWV3IMK3DQo+aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODI0MTYyMzE3
LjI0NTAzODAtMTItDQo+bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tP3BhcnQ9Mw0K
