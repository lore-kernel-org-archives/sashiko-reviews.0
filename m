Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97159431E47
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 20:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467664; cv=fail; b=HK0gyIeJrJJx34FK5aO4zoK2i1eJEfeaPouHq6boiU5pfFdwZKXnaBuRbzvVfCqDW6CzGlSJupu4eqcKAc6Bo4GL33QWSBIZd68fIwUo20X/yDrAmlM49omr+VQfuYANEOpw5L+1sMqMtjEZyjVzKHjxqeyIhy5fiSqb90ANjIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467664; c=relaxed/simple;
	bh=CeZCB0NJlHt4fcliemZZpPs7uEbJfecUUQQg2qPtyoU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tXYcoMt+/NLn6ZyVpONRb8Z2k/31yrnXjxWbbkW6gD02/W+DAlmjgpbNRamJMgQRT5h4WtM9frrrtrUzlXdY7/HGw8x16Je364C83BdeN28tO+bXYTed49dMu2nzvPrTNKRdSpcfhaIa25DS+rZvMfPjjwPRJ7JYhag+hVSvXyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W60AN+U1; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W60AN+U1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788467652; x=1820003652;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CeZCB0NJlHt4fcliemZZpPs7uEbJfecUUQQg2qPtyoU=;
  b=W60AN+U1jonryYY8Pf1+FPqOnwX2zhP5UZwtel1Ar8Q/PeZHp4ydne6j
   8Nmx0Tpf7iAhYHpxm6K3+4HqF9FLJxe200On7oTEmou1D6Jqeyna9GuFs
   4ouIPwly7i64gxPYRwCSaGJuMMRwmSFOML8Ciw68aPSiQakHMVyyLAMjV
   a3jSGOU/inmDc2GkYdr3OjO1G9avIYf/TJ/m/ZmpngLAts+O7aoh3TRDe
   Js3DvtVqasBnhjJCjE4Nr4ZC68TW3mTEp9wDlbtdn3kMhxue1P7CYW3qp
   VfYnb2WGykhy6nKKPsQbRrP7miKwzt3AHMubi3CbbTzVTB9eO5m3xXUNB
   w==;
X-CSE-ConnectionGUID: zjPeFdvmS2qxvCwtfiJjTQ==
X-CSE-MsgGUID: L7mfrdxhRem45RB11E7cYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88727338"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88727338"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:34:06 -0700
X-CSE-ConnectionGUID: TD17/Cj7RpWTbnKTJDPzVg==
X-CSE-MsgGUID: jq4NydSvSn+qmtb281kbNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="271792972"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:34:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 13:34:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 13:34:05 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 13:34:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mC2nk4Fj/R+aWnM3AlSgZMbrDkpUf6RuvcXyz5FGTjLmF1ENsHCsFERAhTTxtb4M/jxqsFugbJL+XcOzzaaeXDwAQhOSi0wU7D5/VOrjk+0EnQxx2DY4EsCWrBv9MHTcK4po+TEtdZZOJD4PW4/jC0c3nv9n6b2sX1Gq1J73LZrszTd6jG6iL0mZYUWUXaso3Cm84BsBOfRgD/62JeHiJXBxTACeEU+AnjbcdNZ6VqPQeF0FTftC59BcPy4y1oSJ1FkOrsS4xBectrmt9abnmtT01CDgyq+tte3uPnTFarDuVFzZMuuHQ0K1pkUcoVCbBa2tymNquTh9sbHJyd++Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeZCB0NJlHt4fcliemZZpPs7uEbJfecUUQQg2qPtyoU=;
 b=CXrjAZ43L6oV+1g/ON5aouCFeno0f31fZAV15pGt/8elJGW/3uDP4lwIbk5JA5UkoQDOckrQiV0KNQAYoyYF/P/whpAb93tpy6azUzmWb50IxK0cOIz+1eC797FmqcGTaGJtcw0ApxqxXh3a8DwS3+2hFkjxVr8yn8g2IFcH+EUsqy2RoIoHmvDs+3SKq7q8hLINydj1zr77J3VA8Ah9bwp79n19cZkAl3bljX2CIWWD3L0Wm58DBW0sOSRzIoASVMx9emIa5m2o3CRD8R44DphxVO+LGqMfAGKW9VUyuxk0IDVjldCrsdoFne0R5g5hPaM5RQbimpAQLYCq0N/vow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SN7PR11MB8111.namprd11.prod.outlook.com
 (2603:10b6:806:2e9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 20:33:54 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 20:33:54 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 03/18] platform/x86/intel/pmt: refactor rc with a
 return value
Thread-Topic: [PATCH v5 03/18] platform/x86/intel/pmt: refactor rc with a
 return value
Thread-Index: AQHdO+BTtpwavYDC4k+KJnY+GEShyba9S0cAgAAD7iA=
Date: Thu, 3 Sep 2026 20:33:54 +0000
Message-ID: <CH3PR11MB0461497B0273A64341847F5D33C1B62@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-23-michael.j.ruhl@intel.com>
 <20260903201927.2C40E1F00A3D@smtp.kernel.org>
In-Reply-To: <20260903201927.2C40E1F00A3D@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SN7PR11MB8111:EE_
x-ms-office365-filtering-correlation-id: d0bc3eaa-6182-4aaf-7790-08df09faac4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|18002099003|22082099003|38070700021|10067099003|4143699003|11063799006|3023799007|56012099006;
x-microsoft-antispam-message-info: bhcf5c8IS8S/Euii2+uufTdEajZwtGFdxNFxsy8GxR6OwmTXue+se/ciJp+wOGtMCFStHSdK+hAifH+gxzhB93w+nPJmR4aXYNJvtBkTt1IEl/OyWM7iwB6mVN4kPbzRrC7ow+ZqdwLHqwvn89t8wgh58CHfcHzQ+tQcBRmVRKjhwWhHFugSgzVgt2GVQNiusfXIhNwQLAc7DfeBHl3TIsnbiJT9UFfJrgcmJI1KUjvzPaJ+R8Wg4OF92jhqalBlmfNH/v4qM+qtpAx7Uxv8NVxqGjLvbZGQz2geMHAamHw5TTJB4kbwDAjyYxbAlhi7T+pdxL4PFf/hCLQ7ju6BC1pdf0LbcjeAnE8oKz5Lp9trm5IPgWYkbLiYi/1DXGllH9Yftdlmw9BJ8S8s8qIX7e+iE6wFxdG/ulZemcC7Xs5gPX+0zkMRBKwCse9FZ2pIhsHT9RsOgSO6HGR8cdUkjJeA7vVzkE6oET3eTMuPvdiJ9S/t7OZSVhXICDWS9T/ftoWUd3m63dl2avITEDsyBuu2WzrHRaNXl4J9Rf9HO7rKZ3KmDlSZq9LSfQtG1lnkJQJBYmExumNbBi65Ci2aQ7Tj89oaSSTGzMklRs/WFBUiZ+/+ckhZfIaPpSh2cn7DXHvEhCaLV5enbTaoiGifcXT+a4Qtefi4mLvLYuWO5Gc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB046149.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(38070700021)(10067099003)(4143699003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnRHR2NCbjBzYjlOODlNclprYzJHOFI3ZTltalNjM3FSb0tENVZCWmtxMllU?=
 =?utf-8?B?TWxMR0hHWGYzWWo0dGtWc2dwekJkSkZDMzB4ZTF6dFhRL0ppRzhpUHJybk5T?=
 =?utf-8?B?NmQ4dlBiYkM1VUYwQ3doNDRyKzVUSjYrdWFJWjhzcVJNR2c0Y1krb1hmckk3?=
 =?utf-8?B?MVZsYjIzUzVReDlaMVJRRG90TFVOVnZrZFhDTzd6cVl1TXBZQ0o0QTF6enJn?=
 =?utf-8?B?UDloZG0rQ0hFTzUwd2kvUGlkQWpEaEJCc1VobVc3RjJ6a29laVZGL0xtTnJ5?=
 =?utf-8?B?eWJRTjNpd0NRejkvMDBCTU1reDJJdVJZczRpZFg1OWsybjNRdVlkSGNBZ3M0?=
 =?utf-8?B?ZHNXd3R6MUlNUmJiYjh6ZXFJdFZaQkM5K1NGV3pKVzhvRE5peTFSWG82cHV3?=
 =?utf-8?B?NGtMQ1U4ZlFzMm5DMFd0RlNBK1pxTEZCNnNweWF2cnNueVdPakUzNHV5OFV2?=
 =?utf-8?B?SFBkWHN2cFpydHVQeHh2Y2s0c1l5UGc0Zm8rSlI1dTlSSkM5TnB3RWlwYWsz?=
 =?utf-8?B?bTNRaStBKzZUS2VtbzdVWUt3TVhaVmJGNFY2dXhONGVZMTcxVUZHbk1SRmtD?=
 =?utf-8?B?R2ZBVlNEcVpFSFJ0NDVWZDJkYUNqS1BEQzNNZEsyU1NzQTFmdFJJeHlEZXZV?=
 =?utf-8?B?YmVXUktBSk94QTI0b0J6Uk5SOXhoTWJDd0o1VDV1MTJ1NXowR21tMnZPYVJk?=
 =?utf-8?B?MjF2SFRnNVdtT08wdW1KeExBVkI2aWUyL2dQcGFGVWtwWjJiQU1FcWt1d21y?=
 =?utf-8?B?MFlWM2trRVZzUjlqbzhPRENLbEpwYzhCMThvWXkvMFRYTWJPK1Bqd21yYWRM?=
 =?utf-8?B?bkNHbVVhU0JkR05lWjJCVjVpa0dJVk9SWXZtTU91Y2xEMnhycDJRZTZaY2M1?=
 =?utf-8?B?VWJQUlpPZHUzNkNEMEpYSUpTb1ByUTZRR3hiNWZubVlKZmk0L2ViZlRJNEtj?=
 =?utf-8?B?VjZRVVQ1VmJuczRyU0xicWg4MWFUc2FHcEJBQ2JRNklERjNDMTVCRUkrMTVZ?=
 =?utf-8?B?aUZ6YWs2YVRzUCtOczVrcm9DSkcyNU9ZazBja0FzWnRGTkU5U2I2eFpmYWtp?=
 =?utf-8?B?SU95d05IYlVGVU1wL3FER0k3QWNmanFlb3lZUjhNakRKcDlvNjNrU2hpaUhN?=
 =?utf-8?B?bElyNDRPTGI4bUhLK05udVdQNmlaMVpObUtwM2MwSFNMWjBya1BNREVEb0Fl?=
 =?utf-8?B?UmlBUkU3bmxoR3ZnMGNNR1RUZzRBRUh6c3AwdjBOWGllK1d1dXRZdnlpQ2ZG?=
 =?utf-8?B?T3VEYkpkNWZMZTNQcWJKUnVWTTN1N2lGaUhjeTY1NEdxSk02c3k4RFZCaSsr?=
 =?utf-8?B?RlJsYWlqeDJrUWxtQUVKSGl2MmhXU3cwT1YvOHhwWVVlY2lPYkxDTnRZVEsr?=
 =?utf-8?B?bzlZTkVLYjIxdUFkK0UwdWl0NW1lZ1BIa0FwZDRJMmdLUUVKYmtmTnpLR3ov?=
 =?utf-8?B?S2wrK2o4NmV0VmFDUGZpTEZJS01oN1cyNzhXZkRHbzRkWWJ1NkxncjI4Y28w?=
 =?utf-8?B?cm5mWm95L09aN1NySHpITmtsQS8vaDJPRmZLMDFsdEx2WHdQaFBnSVBRSW9D?=
 =?utf-8?B?K3hrL1VuRVhmNElOOWpZbVlvNGlIUkRKRVJoSGthZ0tIckxmTU90MUNZenha?=
 =?utf-8?B?NTFFV2Q5K0dYU3R2Mm9GK3NFNGkzWVpSTE0zVE54VjAvUTdBUTBVWGRLUGRB?=
 =?utf-8?B?U0VIR0xYZWNOVzNBakJnNHdKOGpKMm1yRndTZUJxZno2cEtjaXVjZVl6amNt?=
 =?utf-8?B?K282eHowN21BeTdtYmxXYzhpZ0tBZTNxR1pqa1FVWkJGRzZaejIzYkk4ZlJC?=
 =?utf-8?B?djU2ZitmdnpyYldFTHUyZXpOcm9IRVkzS1BnbWhwQjdGem9EcnZBNlowSms1?=
 =?utf-8?B?dnZhQkFpWjF4TFB6NUY1WW5NWW9IMTQwS1YwbGRucC9yckxESERCQ2pyNlFN?=
 =?utf-8?B?dmZqVkd0N2R5VWJIeUYvNCtIMEcrN2czdWQxUVR5V3VlR3BncDhIM0pIZDd2?=
 =?utf-8?B?YUhYYXVuUitQdkk3UWpaVWg5V3N5S2xCQU44T2E5RUFCY2w4VGR0ZjBxaTRs?=
 =?utf-8?B?cGpvWFFuM05lYlhEZ051bHBMbXBCQWJkcDNxY05zazZ1YU5aaFNJNE13WFRM?=
 =?utf-8?B?blovL0JIZjJiVUtxSzRzSHk1emc2VTVud2M5TVJuVnM2NmZSdXpkUjM3RGU2?=
 =?utf-8?B?am5MaUhWUWRMbzFXOExOZFNVWFpXVUcrOW8vblNIVzNuQ01nRW5lZFgvRjRQ?=
 =?utf-8?B?UVJTcmV4VkRFd2hxSjFsYjBvdW5LclJqV3RpNmNxL21NZS81VjFjblg3YURj?=
 =?utf-8?B?a1JBdG1GKzlvNVcwb3VmandXVVYvdVRpSW1Uc1Z2bWJGMkFqRHl6UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xBk1+gqXFVuCCLJXKO9GAKlQSnldxHnOj4Ce/zc+I+X4LmQLWmbZJk+T9A90jnPV3AigorcZ5sEFZgvYzbUERamSRezAnyhUCIrdZVswCXqcoMsbYCp+qTl0r+yfhnilN12+EwLMXN0N6DaiVV2Re7j5YzwbnUKhzPzDTugwgp31qVlD587ylN8aIyri53EhUXUTbAtY6mD3c5Nv3U2ECnGWXdvHTq/R2rmGEHlduFqeL+SlD0vr4/HPjOBmPfDXZ4Pl9bjmopxgVlCCFZb18K+wtLncbGqc/6YkrjfQHPzQpbmRAnor1Ab10dIGK3lNGJakhFpaZaYSoKcmj5+DxA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bc3eaa-6182-4aaf-7790-08df09faac4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 20:33:54.6740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DO5cxDwzxKmjy23Uh4eS7h9L+wkSgLTaklMiM0ajSXtkW06vaUZ/OP+atIxQhd3w/HNDWOdcMst3iqWX4DsUrn8f3rHXnEM4CkkGq3HzIqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc2FzaGlrby1ib3RAa2VybmVsLm9y
ZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj5TZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDMs
IDIwMjYgNDoxOSBQTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVs
LmNvbT4NCj5DYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogUmU6
IFtQQVRDSCB2NSAwMy8xOF0gcGxhdGZvcm0veDg2L2ludGVsL3BtdDogcmVmYWN0b3IgcmMgd2l0
aCBhDQo+cmV0dXJuIHZhbHVlDQo+DQo+VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEg
U2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj5jb25zaWRl
cjoNCj4tIFtNZWRpdW1dIEludmVydGVkIGxvZ2ljIGluIGBlbmFibGVfc2hvd2AgY2F1c2VzIHRo
ZSBzeXNmcyBhdHRyaWJ1dGUgdG8gb3V0cHV0DQo+MSB3aGVuIHRoZSBkZXZpY2UgaXMgZGlzYWJs
ZWQgYW5kIDAgd2hlbiBpdCBpcyBlbmFibGVkLg0KPi0tDQo+DQo+Y29tbWl0IDg2MWM5YjJiYTQ2
Njk5MjZlODMyMTkwNjcyNzJhMTg3MzMyYmI1NTENCj5BdXRob3I6IE1pY2hhZWwgSi4gUnVobCA8
bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KPg0KPnBsYXRmb3JtL3g4Ni9pbnRlbC9wbXQ6IHJl
ZmFjdG9yIHJjIHdpdGggYSByZXR1cm4gdmFsdWUNCj4NCj5VcGNvbWluZyBjaGFuZ2VzIHdpbGwg
aW5jbHVkZSBwb3NzaWJsZSBmYWlsdXJlcyBmcm9tIEhXIGFjY2Vzc2VzLg0KPlJlZmFjdG9yIHBt
dF9jcmFzaGxvZ19ydygpIHdpdGggYSByZXR1cm4gdmFsdWUuDQo+VXBkYXRlIGFsbCBuZWNlc3Nh
cnkgdXNhZ2UgdG8gdXNlIHRoZSByZXR1cm4gY29kZS4NCj4NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY3Jhc2hsb2cuYw0KPmIvZHJpdmVycy9wbGF0Zm9y
bS94ODYvaW50ZWwvcG10L2NyYXNobG9nLmMNCj4+IGluZGV4IDgzMWNmZjc0MzgwM2UuLjgwOGYy
YjY5NWE3ZjcgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQv
Y3Jhc2hsb2cuYw0KPj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10L2NyYXNo
bG9nLmMNCj4NCj5bIC4uLiBdDQo+DQo+PiBAQCAtMzEyLDkgKzMzMiwxNCBAQCBzdGF0aWMgc3Np
emVfdA0KPj4gIGVuYWJsZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9h
dHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikNCj4+ICB7DQo+PiAgCXN0cnVjdCBjcmFzaGxvZ19l
bnRyeSAqY3Jhc2hsb2cgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4+IC0JYm9vbCBlbmFibGVk
ID0gIXBtdF9jcmFzaGxvZ19kaXNhYmxlZChjcmFzaGxvZyk7DQo+PiArCWJvb2wgZW5hYmxlZDsN
Cj4+ICsJaW50IHJldDsNCj4+ICsNCj4+ICsJcmV0ID0gcG10X2NyYXNobG9nX2Rpc2FibGVkKGNy
YXNobG9nLCAmZW5hYmxlZCk7DQo+PiArCWlmIChyZXQpDQo+PiArCQlyZXR1cm4gcmV0Ow0KPj4N
Cj4+IC0JcmV0dXJuIHNwcmludGYoYnVmLCAiJWRcbiIsIGVuYWJsZWQpOw0KPj4gKwlyZXR1cm4g
c3lzZnNfZW1pdChidWYsICIlZFxuIiwgZW5hYmxlZCk7DQo+DQo+W1NldmVyaXR5OiBNZWRpdW1d
DQo+RG9lcyB0aGlzIGNvZGUgaW52ZXJ0IHRoZSBsb2dpYyBmb3IgdGhlIGVuYWJsZSBzeXNmcyBh
dHRyaWJ1dGU/DQoNClllcyBpdCBkb2VzLiAgSSB3aWxsIGZpeC4NCg0KTQ0KDQo+TG9va2luZyBh
dCBlbmFibGVfc2hvdygpIGluIGRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtdC9jcmFzaGxv
Zy5jLA0KPnBtdF9jcmFzaGxvZ19kaXNhYmxlZCgpIHBvcHVsYXRlcyB0aGUgZW5hYmxlZCB2YXJp
YWJsZSB3aXRoIHRoZSBoYXJkd2FyZSdzDQo+ZGlzYWJsZWQgc3RhdGUgKHRydWUgaWYgZGlzYWJs
ZWQsIGZhbHNlIGlmIGVuYWJsZWQpLg0KPg0KPkJlY2F1c2UgdGhlIHZhbHVlIGlzIG5vIGxvbmdl
ciBuZWdhdGVkIGxpa2UgdGhlIG9yaWdpbmFsIGNvZGUNCj4oIXBtdF9jcmFzaGxvZ19kaXNhYmxl
ZChjcmFzaGxvZykpLCByZWFkaW5nIHRoZSBlbmFibGUgc3lzZnMgZmlsZSB3aWxsDQo+aW5jb3Jy
ZWN0bHkgb3V0cHV0IDEgd2hlbiB0aGUgZGV2aWNlIGlzIGRpc2FibGVkIGFuZCAwIHdoZW4gaXQg
aXMgZW5hYmxlZC4NCj4NCj4+ICB9DQo+DQo+LS0NCj5TYXNoaWtvIEFJIHJldmlldyDCtw0KPmh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkwMzIwMTAwMi4xMDY0ODg5LTIwLQ0K
Pm1pY2hhZWwuai5ydWhsQGludGVsLmNvbT9wYXJ0PTMNCg==
