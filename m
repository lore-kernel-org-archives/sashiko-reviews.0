Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A5A3859DF
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 18:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597283; cv=fail; b=cqwrk4TjKIM7CsaScmelP9y84+oWdP4qARWAq2vOKqtg8Fq+oRJbkynDAVfJ6KPek0KtfRLkGar+IaLqC1OoyLe9urpUfP8xcAnBBVrZbcsINZjTKGN2MgV3+g+RibEOlOPLRYv8669Gbi7uq3/5mw/bnyjrqdM+ECDm54e/tm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597283; c=relaxed/simple;
	bh=G0BQjOuzQYontoN0t82TXd4G13HZet0tm9foGXlYgTk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Aq2VNLKGNUPaWzXFW5v0aTGjFHQjTGqkQOAMaKe4QzjvpHU2hkwpZyxfrU0Tni7IcKX3D8Rvlajjr9qxcx5nxxF5J32Jtq0old7W7I9HRrOuaGq+3WrLJ8a/RKq7x3Rnx97o+nAHgoKQZsXll77HffhK6Ckc91kDlkA3Va/UASQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLdUXhVf; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLdUXhVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787597281; x=1819133281;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G0BQjOuzQYontoN0t82TXd4G13HZet0tm9foGXlYgTk=;
  b=VLdUXhVfAUZ+MAD78Fk0KgOBzb9GpLAKDHVfEQrj4gMJlnQTFjZ28kqm
   fV9YmvNFUH/BSN2klyuwK7zXZNvz/rFrnIiRUx+m+Uok3Bbu2Gdb5eYay
   Ry7cjhVvTg1TUkD3FVLlpRRc0iaL1sMkVc7WKHGuwqVkYJdG/KhJuUzU/
   b3A5Om/Ox8d2zgKrua9E+IU9Q68abmWVLhHjC8Sr8kvBrc5D3ShLSzdkr
   jDoGBK+R7+yAws40rt6tSglFUr/I0do3I66vtheCrPE0Bi1W22WftKOs8
   viWtn0JvpYM0xEUMrcepXpgVv3Awih+O5BoW91XAVopfQoW1O7QgdrT9h
   w==;
X-CSE-ConnectionGUID: L6yirjJGSmq+4gsLCEd9vQ==
X-CSE-MsgGUID: u2AAVO+pSXCTxJ1A0R0Pnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88073132"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="88073132"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:48:01 -0700
X-CSE-ConnectionGUID: FC9X/phUSg24SHOOXnzpjw==
X-CSE-MsgGUID: 5zBLZWyJSTq2BTH4p+LaiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="267115294"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:48:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:48:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 11:48:00 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:47:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ii+oXfx1PA6KePrs85y8g4QaJEoDY7Da1qdtbLTCnEJHbLycX41Q+a66x6yeV5BwAD579ooMpiXH6EwSl3J4FyLb5hqanw1nJZIkGejebLbcqGrxLJFs18Waf6zUUFSpwreLHb2EeXzhrKTdqvTHpUsxP+GPLJxkpnouAjeyn85N3tkkwymgkIi9c6T3vFuJW7DU8e/mwCdAnn4v8TXpEIKY6ZyDkZMBthDOac1Png0Oxr2V3/iWR8Zi38mXM3cwbzMFPPDwuLD0WBGIAQTOHuZKdjMiEIEk+fW9wurHQyNuT3MJ+CRBIWyGvOQJPYk2rB32JVSBg9JSl0SQOdsDSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0BQjOuzQYontoN0t82TXd4G13HZet0tm9foGXlYgTk=;
 b=A/H50Dw9TErCZSzIgn1Lv7+OP0SGntYE1JQ/5A7sXdae/Ox0JFXnMQ+5Fp2cx6yGqvfUy0B5gmNir9SZLIWqfs+j5sGRD/mLVD20aWGLqSbWMzgxJkhR29nSKnuKiuqcHR5FJekz5aX+PMQjAwQn568GoSFddqcyCNmgxzlazDgSormFqwvAg0lFdxPmU6bcH6NY8ifpL70osXu/TcECVQh4wMTKEq92by2KP4Vo1aIoNnUhm1Z0pUBjrBsWio2m0IXkItIxjosTim24WX72YBUrgvLeSBsZYeTlvt4T6vkz771bwsNgArdngOjhQsQ5kEiBWlzAceEg+QlysY8XfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by CYYPR11MB8359.namprd11.prod.outlook.com
 (2603:10b6:930:ca::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 24 Aug
 2026 18:47:55 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 18:47:55 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 08/10] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Topic: [PATCH v3 08/10] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Index: AQHdM+UNDNPgIU8rlUqNh8d+kfgl4batZdsAgAAj1WA=
Date: Mon, 24 Aug 2026 18:47:54 +0000
Message-ID: <CH3PR11MB0461490625152DA6FB015BA830C1A02@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-20-michael.j.ruhl@intel.com>
 <20260824163717.32DD31F000E9@smtp.kernel.org>
In-Reply-To: <20260824163717.32DD31F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|CYYPR11MB8359:EE_
x-ms-office365-filtering-correlation-id: 30238403-ffd3-452e-d089-08df0210357a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: h9/2TV4gNIFSivE9qyBoBZlhoe/bM2TX1US/kZXJ4pNyu7vmQ+ly7n79r9ijIOkiw3pUKCdMFpdEyOjMPR0Q458EW55quPk5LnKw6YzretPKQsksXmWLq7r8jVll+0B9GQt1sLD/SeY9Z2MMfcfAnOU6PpbtmgX16I+ylExM30oVq2F+gE6w1POhjAz03LJYC7D0rGdbR92V6gb1judZQydKc0p3Et18n5AL4tvAa6wmDlfUXCm5vgl7zgl6rf3qeNedbSMzqQgYhSz+cDnmehNlGuQjTnaWTGlY09//NoZNJOfIhxGcv3Um+fwPHTz5zd6NiaC0oclViGVmJmPpWkxVuPHlWxrh1r8YL5msX1oxG6tewI1hxO7LvPS99ESk5yUDnJAOKyGis5AUSiCY4omdvNk1BOfOtmhrnsE0F3+t3sV3E3aCDzZMq+SbCyO5r1Gk12unsYmvaNEGAqrsbza4aHVNiQDSfu9FHIkEj2E7TDBvuo97Lf6cLDrQblRm+hapwb1JeYSlSjcmyDqkjwCtqe7EU2IfRHztNvEuxFo9SKRe4TF7xidJMwRqTGEYoLZavASGEHAZVuhciATBvIK781JSjfIEWNXjI2MZb4ve9HsaneRaUgdZDlEt+6vFKR3GnIQeV9ctmK+EymqQIMCfd1SBPP/iHVH40SwcN2U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVh4aGRkcDNBL0pJTFJsUEJCMjY0eDdVQ1FDNDl5cHZXdlZwOGtmbE11YzEx?=
 =?utf-8?B?YXV6Z0ZRbzZjczBiN1hXNkU5d082eWM1eEs0SzZvMzdQeUNTM2NuZjZaZ2hS?=
 =?utf-8?B?WUNRaDZTeWlzNGc4bnJHdTBIbzZYTVhLM0dwMGxVSnIxeElMZ0xjOXRtdjc5?=
 =?utf-8?B?dTl4MkdtZkIzQTB5ai90SjN6R0ZaNWhUanRzbGw2QWVyUk12MTYxWHkrTW5V?=
 =?utf-8?B?YWRRNE5oYUh6RlJYQi9kQ1NxRlhDR0ZhVjIvRis0VzdCUWFZKzBkTlVnMkx3?=
 =?utf-8?B?czJFaGxzK3pXSzFsSlBJYnhhSGVFN1poMVg2WHA4UVpadHhCVFMxZ203Q3U4?=
 =?utf-8?B?dnVoTm1wN01nRHdtZUFDTlpta1ByZXZadS9hRGNsK3pXc09XZ2lrUURxVWhm?=
 =?utf-8?B?VFZFMGpjMTQvNlM2T3JlMW5BdHJXYmZWbmIzdTBnOXdBaERtcVpzWWxDem9R?=
 =?utf-8?B?YmlLOUdCa3EwRHRPRnJYNzFlclNYdCtySGJldzN2RTNqV0duV1hPcE1LNm9t?=
 =?utf-8?B?SExXcFJ6ZGxZT1N2aWRMQjI0Z1UyU3FVL0dzc0FTMFdhWmVaTW8veHRISnZu?=
 =?utf-8?B?bTFxVDcyVTlXVFhadG1BL1EvTGtmY2ZBSGFzYlAyNVkrWS9mOURhTUk3Mjhp?=
 =?utf-8?B?UXNuVU1mcndwVHJ4L1pnbFdacFBYcmt1djRyVFF3NkNDRW5WV3FoQjBZSjhx?=
 =?utf-8?B?S2pRMVJkY1VDaldaeWpMV2EzbVhnUTVJdkpaamM1THcwRzYzVG5GQ0VuQWtV?=
 =?utf-8?B?OXE2SUUyckdHRnFoRmxmR01zY21LdlpWQktRQ0VJMnNmdytFOFJlNjJKbURM?=
 =?utf-8?B?NDVyQ2FScnRtejcvdTJyV3lwNUpsbUtQbW02TDBZc2JNcHo2M2VDWDBJMjdR?=
 =?utf-8?B?bEhHSGtSZzlEV3NYemtIekdkSzR2NnFhL1llenAwYms2VDBNUzQ3SnRKMnkv?=
 =?utf-8?B?a05GNGp3dmJlL3h0WjBTZW9nbmRNU2V6MHdwVXJRNXlYcVNFRkxYWHozU0VW?=
 =?utf-8?B?TGp6Rmd6bU1jY1N0VktwbzJqMGNocXFCR2l3ODIxMWM0ZXB4dytwTjhDc1ZY?=
 =?utf-8?B?cGd3UGF4U2VyVG54ZXRpbTg5Tmg3NncwbmRnQUUrd3pTNFpibXpPcFRmdE5y?=
 =?utf-8?B?eWt3NnRqaWhkelZRMjUxbnJUM1RTalBmVjFaQ20rcGlBV0dDdEdqSDhUMzVO?=
 =?utf-8?B?VC9vRk5ld2hub3FTZDRXeSttTjJYNVg4ZHFiaWM1eU9Jdm9BSXZUVmdSM2tV?=
 =?utf-8?B?T2x0VytlWnlvb0pzSGplQ2U0VDhRTDg2Si9Kd0RyckdlcVpmTEhFbWpMRGli?=
 =?utf-8?B?RlF5Z1RHdVlIdmY3RUFYR2w2RkhWWm9tc3BCMTNMelFZdWZmWi9YZm43WndP?=
 =?utf-8?B?bFhiTEdwU1NmTmxwNXZKRkFYN3Q3VVBvYmJObjdKRThHSzRTRTBFbm5qdjg5?=
 =?utf-8?B?c1pCdWcyNFl0cjgzMmsxUHJ1U0F6VnRUbDZHNlN0eW04Y3g5UVlBeHZYKzVs?=
 =?utf-8?B?R0xFU3FPZVJUZ1k5Ymg4SU16cHdybjBINXhwNjJxTHNISTdOUm9WSEZzMitD?=
 =?utf-8?B?WXFBbzNRZmMwbVpsSzFLNWZoazJZZXBRZTVSMWM3TzZ1dms1Mm93WFhaMUNy?=
 =?utf-8?B?dUtvYkYrMFpYczVScXo4UG1kR05OL0lHSUFoVUFKcXFrSHBFSUJmelRnaWwx?=
 =?utf-8?B?eU5EbDNHKzRnN05YMFp3VFpSLzliTXNzUENnL3Z2cU5tbDZFWll2Qll0NFRT?=
 =?utf-8?B?WGwzS1RRaXpjTGVVQ0hZNVhxa2ZjK2Q2MWNKcWpYL3Bma2VTNVMwbXNwdTlE?=
 =?utf-8?B?c2pQWjVhY1RFN2VnV3orMUpsWHZtaTE3Njl3SnJTZzdESzdYbmV4RzBHajZN?=
 =?utf-8?B?bVlmS2V5VHpaZzNzL1R0T3hJMFJLYVg1MnBPQ1FyTWpPWXFlVFJ4SERZaFd1?=
 =?utf-8?B?MEZRUks1SlpnNGZ4eG9qZ1JiUFhXRUNFQzZEZ3AvcmlIMTE3Y3drNlNscXBN?=
 =?utf-8?B?WEVXQmJoUGJ4SndjNVh4WGtWZE1BRHZjd2p6OStmMXl3TkYycmRyczY4MDNG?=
 =?utf-8?B?LzZ1c0pDS2hHczFJcmJWZWRoUlgrQXB0TXlHaUk4bGJid2xxQ1loVUxRN0h6?=
 =?utf-8?B?MktSeWg4eksyOGhnTUs0UFVPdG0wbGhHK25ncmF1cld2Z1FrWS9nMEc3VTdU?=
 =?utf-8?B?S2pUbTF4aC9hTkxYQlJya2QyWS9EZGx3TFBGRm80ZDI5cVI5b0pENXNIcGtp?=
 =?utf-8?B?dXZ5cy9xR3BGK3pyeC92TlZwYkREWTNGSDFOcXlpR3hQMHZ0Y1k4dmpuRmFn?=
 =?utf-8?B?Yzl4ZlRCTFdJS3EzRTVnRjhyMnhuT2RYRHpFb3AwYXVRM1NtcVljQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Qq199zMkFZ7O7TwvdaOHV9V6lMXtJLZ/639xjWq0Vnl8MC0gC+mvpuk85qClbnRuYwpsqJU13q5OBUgyXAy8tYbYlwgoOhYiBuYTpO0zNxuG40aZMoQ7dYfOWuyJvtYoc6X9fCJNFjVxwcxUoawl1X96XSA42urArU1mW4a5fe5UUXQDIucUVFvW9EcYdtZOOwwyPnilwagyaiIX6bUR7UCIkywrRqZrwRoy6l3bb0/CEO5fBLTuQuTTKeu60JHpgds1NIHuZwZVlH4YMR0mqNiR4ezbeMMdRlXz5BXwVIX5Oa59cGm7g69MLYUZFaM1KVbRrfNP0/7upFdpklvc2w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30238403-ffd3-452e-d089-08df0210357a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 18:47:54.9251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hnBvMP6ak1oQ1wxxFqIwidnHzzxvfMuQ6sp+nKan5U5MpvHGoGwtbErl/vWnskZd8seurN2gSJxOefIIhCedIKWypyycIZ2XsSQaARxDvX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8359
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBNb25kYXksIEF1Z3VzdCAyNCwgMjAy
NiAxMjozNyBQTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNv
bT4NCj5DYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwOC8xMF0gZHJtL3hlL3ZzZWM6IENyZXNjZW50IElzbGFuZCBQTVQgY2FsbGJhY2tz
DQo+DQo+VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcg
Zm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj5jb25zaWRlcjoNCj4tIFtIaWdoXSBUaGUg
Q1JJIFBNVCBmdW5jdGlvbmFsaXR5IGFuZCBWU0VDIHJlZ2lzdHJhdGlvbiBsYWNrIGFuIGV4cGxp
Y2l0DQo+SVNfU1JJT1ZfVkYoKSBndWFyZCwgYWxsb3dpbmcgVmlydHVhbCBGdW5jdGlvbnMgdG8g
YWNjZXNzIFBGLW9ubHkgU09DX0JBU0UNCj5NTUlPIHJlZ2lzdGVycy4NCj4tLQ0KPg0KPi0tLSBQ
YXRjaCBbOF06IFtQQVRDSCB2MyAwOC8xMF0gZHJtL3hlL3ZzZWM6IENyZXNjZW50IElzbGFuZCBQ
TVQgY2FsbGJhY2tzIC0tLQ0KPmNvbW1pdCAyMGVmYjcyY2NiNDA1YTAzMDk4ZjkzYWU1OTc3ZjM0
OWNiOTQxZjBhDQo+QXV0aG9yOiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVs
LmNvbT4NCj4NCj5kcm0veGUvdnNlYzogQ3Jlc2NlbnQgSXNsYW5kIFBNVCBjYWxsYmFja3MNCj4N
Cj5UaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIG5lY2Vzc2FyeSBjYWxsYmFja3MgdG8gcmVhZCBhbmQg
d3JpdGUgc3RhdHVzIGFuZA0KPmNvbnRyb2wgaW5mb3JtYXRpb24gZm9yIENyZXNjZW50IElzbGFu
ZCAoQ1JJKSBQTVQgdXNhZ2UuIEl0IGFsc28gYWRkcyB0aGUNCj5sb2dpYyB0byByZWdpc3RlciB0
aGUgQ1JJIFBNVCBmdW5jdGlvbmFsaXR5Lg0KPg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV92c2VjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdnNlYy5jDQo+DQo+WyAuLi4gXQ0KPg0KPj4gK3N0YXRpYyBpbnQgeGVfcG10X3JlYWRf
cmVnKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyIGd1aWQsIHUzMiAqcmVnLCB1MzINCj5vZmZzZXQp
DQo+PiArew0KPj4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGtkZXZfdG9feGVfZGV2aWNlKGRl
dik7DQo+PiArCXZvaWQgX19pb21lbSAqZGlzY19hZGRyID0geGUtPm1taW8ucmVnczsNCj4NCj5b
IC4uLiBdDQo+DQo+PiArCWluc3QgPSBGSUVMRF9HRVQoR1VJRF9SRUNPUkRfSUQsIGd1aWQpID09
IFBVTklUID8NCj4+ICsJCUNSSV9DUkFTSExPR19QVU5JVF9ESVNDX09GRlNFVCA6DQo+Q1JJX0NS
QVNITE9HX09PQk1TTV9ESVNDX09GRlNFVDsNCj4+ICsJZGlzY19hZGRyICs9IENSSV9ESVNDT1ZF
UllfT0ZGU0VUICsgaW5zdCArIG9mZnNldDsNCj4+ICsNCj4+ICsJeGVfcG1fcnVudGltZV9nZXQo
eGUpOw0KPg0KPltTZXZlcml0eTogSGlnaF0NCj5DYW4gYSBWaXJ0dWFsIEZ1bmN0aW9uIChWRikg
dHJpZ2dlciB0aGlzIGFjY2Vzcz8NCj4NCj5JdCBsb29rcyBsaWtlIGRpc2NfYWRkciBjYWxjdWxh
dGVzIGEgU09DX0JBU0UgTU1JTyByZWdpb24gb2Zmc2V0IHVzaW5nDQo+Q1JJX0RJU0NPVkVSWV9P
RkZTRVQsIHdoaWNoIGlzIHR5cGljYWxseSByZXN0cmljdGVkIHRvIFBoeXNpY2FsIEZ1bmN0aW9u
cw0KPihQRnMpLg0KDQpOby4gIFRoZSBjYWxsYmFjayB3aWxsIE5PVCBiZSByZWdpc3RlcmVkIFNS
SU8gVkYgaXMgaW4gcGxhY2UuDQoNCk0NCg0KPkFjY2Vzc2luZyBQRi1vbmx5IGhhcmR3YXJlIHJl
c291cmNlcyBmcm9tIGEgVkYgY29udGV4dCBjYW4gY2F1c2UgTU1JTw0KPnRpbWVvdXRzIGFuZCBo
YXJkd2FyZSBmYWlsdXJlcy4NCj4NCj5bIC4uLiBdDQo+DQo+PiBAQCAtMzc1LDggKzQ3OCwxNyBA
QCB2b2lkIHhlX3ZzZWNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4+ICAJCWlmICgheGUt
PnNvY19yZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uKQ0KPj4gIAkJCXJldHVybjsNCj4+ICAJCXhl
LT5wbXQuYmFzZV9vZmZzZXQgPSBCTUdfVEVMRU1FVFJZX09GRlNFVDsNCj4+IC0JCWluZm8tPnBy
aXZfZGF0YSA9ICZ4ZV9wbXRfY2I7DQo+PiArCQlpbmZvLT5wcml2X2RhdGEgPSAmeGVfYm1nX3Bt
dF9jYjsNCj4+ICsJCWJyZWFrOw0KPj4gKw0KPj4gKwljYXNlIFhFX1ZTRUNfQ1JJOg0KPj4gKwkJ
aWYgKCF4ZS0+c29jX3JlbWFwcGVyLnNldF90ZWxlbV9yZWdpb24pDQo+PiArCQkJcmV0dXJuOw0K
Pj4gKwkJeGUtPnBtdC5iYXNlX29mZnNldCA9IENSSV9URUxFTUVUUllfT0ZGU0VUOw0KPj4gKwkJ
aW5mby0+cHJpdl9kYXRhID0gJnhlX2NyaV9wbXRfY2I7DQo+PiArCQl4ZS0+c29jX3JlbWFwcGVy
LnNldF90ZWxlbV9yZWdpb24oeGUsDQo+Q1JJX0lEWF9URUxFTV9ESVNDT1ZFUlkpOw0KPj4gIAkJ
YnJlYWs7DQo+DQo+W1NldmVyaXR5OiBIaWdoXQ0KPlNob3VsZCB0aGlzIHBsYXRmb3JtIHJlZ2lz
dHJhdGlvbiBibG9jayBiZSBndWFyZGVkIGJ5IElTX1NSSU9WX1ZGKCk/DQo+DQo+U2luY2UgdGhl
IG5ld2x5IGFkZGVkIGNhbGxiYWNrcyBpbnRlcmFjdCBkaXJlY3RseSB3aXRoIFNPQ19CQVNFIE1N
SU8gcmVnaW9ucywNCj5jaGVja2luZyBmb3IgSVNfU1JJT1ZfVkYoeGUpIGFuZCByZXR1cm5pbmcg
ZWFybHkgY291bGQgcHJldmVudCBWRnMgZnJvbQ0KPnJlZ2lzdGVyaW5nIHRoZSBQTVQgZnVuY3Rp
b25hbGl0eSBhbmQgYXR0ZW1wdGluZyB0byBhY2Nlc3MgcmVzdHJpY3RlZCBoYXJkd2FyZS4NCg0K
VkYgY29uZmlncyBkbyBOT1QgaGF2ZSBzb2MtcmVtYXBwZXIgdXNhZ2UsIHNvIGJ5IGNoZWNraW5n
IGZvciB0aGF0IHRoZSBhY2Nlc3Mgd2lsbCBiZSBQRiBvbmx5Lg0KDQpUaGVyZSBhcmUgYWRkaXRp
b25hbCBwYXRocyB0aGF0IHdpbGwgbm90IGhhdmUgc29jLXJlbWFwcGVyIHNldCwgY2hlY2tpbmcg
Zm9yIHRoZSBtaXNzaW5nDQpjb25maWcgY292ZXJzIGJvdGggdXNhZ2VzLg0KDQpNDQoNCj4tLQ0K
PlNhc2hpa28gQUkgcmV2aWV3IMK3DQo+aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYwODI0MTYyMzE3LjI0NTAzODAtMTItDQo+bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tP3BhcnQ9
OA0K
