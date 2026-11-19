Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795127761;
	b=VMncTjKh9UKE2wLuNK0fJvmfxODh2CbYCvWXJYFmI+JsezccvYJv0fPPc0L2hITnIIKR
	 CRSr+V+sxVEO8iD+6tMWKwwlyqDxQdM/NMRakgUO+ur9FU2vnLqW6kk67QUQ1MVo4F6kg
	 NjfINlHX8OUTvBnkrxbzWyZXxn/Wjq3jmXCekZA2CsTrdtKW8CXpbFj2v3rHJUGZJKGUx
	 60pZgpdd6ljzUnP9YAPDQcMvDC5fP86uOcwgacW7Q21dsBR74jb1i7T6yhZdyw09ZCmLV
	 E9ZF4hgDwPXtBIz9DCZy18QK7E22qA7wwG0rWqhGam8MSzaELXSO71IZUE6oee189AQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127761;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Zv33mfxsjdlv96EelnDQ6no4M6K6oLO9lpJHI9vHKew=;
	b=Z3fD0NRJy7niJpNKGtnfvbjUFsmLscUykcxjVdMdwlpG0lZSlRov1pRbs/YM1arA/ZO2
	 NJH3zrr6/EdRyJDOtMpHI0OE0auMfUO0w6UOyPdsYnvVXFKoQZeNt2tR5ZHoIpT1ARUgg
	 030KSsE2VLGINMb1JjkZKX5lMO0fXFZQkF0kGp17VyNAGs9oahj0f1qt3hmE0dNqBtdml
	 Rn+ac8FEmUsAP1JKJ3llR61YQtckwOO/tGgAwge8XG7iuYLfyU/JMNAefcssGuUPU2h2j
	 zPN+eE1HqY99/MaJaTgmlj2dV4QJhU2KL2Qhfp5OEvsrxhxlcSQSC0PSp6Pa7L78zyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WBHK0CT4;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cvyqiBvi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7DD606A320
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 22:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED7DD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WBHK0CT4;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cvyqiBvi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795127760; x=1826663760;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Zv33mfxsjdlv96EelnDQ6no4M6K6oLO9lpJHI9vHKew=;
  b=WBHK0CT49aCsOkNSnFZ2kxZbXv15iTFrD4K8z5FwMEzwdA2POtVgRDOu
   8rNVwsc9qScOlwbFKUEkTBEiHVv9bQc+yQ4yeLRjzjdI2EtIjc4Ev2AsS
   sKtkLVK2hSHWYr8zMt16ZoBXeOSwQAXZD6bKIpMV9QWfr2hOrXatN65fs
   q0hAn6PhDvPqK4O8v+vVmLJX7sL3EMmTHStRNhmFlRlk3hDIplEr8y9ca
   yxbg41d6qtk/xfNsm4hEWYlDXHX/OrxSVmFeLbznwpcfM3W2Ez+hOte+n
   gts04rHVD4eU4GZR0p8M4oRFPzNPgRGeAWk+JFuNNDXG27jMGPCXbwJMW
   Q==;
X-CSE-ConnectionGUID: EQsPjBSrQ3KslAVf8CfyoA==
X-CSE-MsgGUID: NUWgrG6IRri8Ay0YfSNn9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4098212"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4098212"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 14:35:59 -0800
X-CSE-ConnectionGUID: ociI4+CeQqykeZvv1avaiQ==
X-CSE-MsgGUID: qMoMq0uZSYWw4OtmsGMhbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10432538"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 14:36:00 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 14:35:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 14:35:58 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 14:35:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyqfkFSOk9QI2onMC7je4ELEnNdVp5ZMWlddwjErdxf1e0kiMjd4om3HXGvoeDLKCE8bjruRPhQFypmIGwednU3n8Z3ctruOYPxK2JnNUmo5kFawqgenZMUOORZXfkDHMoMLRO9rFQqsYbKUyhaK6i5NbPWN9+kHfBZPBFP90iiARmAdJIqyS3SRsz+ApzRjIENlpcL01STttGEzxH8sq0/6PyJmEss16bAwbcpET16UHu/yOYSGSWOnW83c2bfat6Y3YfnhXEZvUIg2GpiTJb7Y7x7G9B+uZ7cw0g5lNg9s5fsbZ5i/9GQLeqByl+3pAkRbXUpbhErmcTQ1CVm5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zv33mfxsjdlv96EelnDQ6no4M6K6oLO9lpJHI9vHKew=;
 b=kkAJjWHgOU+QZhatoFbPq7wUyRyxtsW66+qVgSvgnRMdxiDfB0a7/JOohdLcHlwIMpyFDXDg4jCmAQTSxs+/Qb1J1bW+oKuabX4brJ/FkJqE5GAaTXwTNFg4Usl1TTEWzYna1ZAylOx8ORbOSgUqZHD4CT+aEUTUbVGU5ZjTmDpA69GdwfeC09zqtzyvZY8qxXBHWM/LLt7pyVZQBaO6YTIDOxEEPhEBWRim8h/jdl7vTPJHYuVIjPvEtXojr62S5qOY7CuRcjrscRAq3tDV82JgUdU1voX4KDoS5UYVO57QQU50wjACr2GzsbZimckbnf1+I0bKYlhRJvRNqPz72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zv33mfxsjdlv96EelnDQ6no4M6K6oLO9lpJHI9vHKew=;
 b=cvyqiBviqEHIUenIUoxvttjeym+1QPAmtzhp3JFikaQjctFgxxbw2wiaMBkTszsDPV/QXzZen1J/1+ssWMC3urNZV2R/vcZ9yntETySR2sRsS2S1y72K+2Z464OAVl+uwu79BorjtOFoymM/NzJelyirHZ0fN14LW8fWMb5yVEg=
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by SN7PR11MB7567.namprd11.prod.outlook.com
 (2603:10b6:806:328::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 22:35:56 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 22:35:56 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"brgl@kernel.org" <brgl@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] driver core: platform: tests: add a shared software
 node test case
Thread-Topic: [PATCH 1/1] driver core: platform: tests: add a shared software
 node test case
Thread-Index: AQHdd6x5MZX0/FRaVUKF18s/TKog8rc0bqcAgAD4IgCAAJaKAA==
Date: Thu, 19 Nov 2026 22:35:56 +0000
Message-ID: <6d1b6620af6c3ecda34cc83e3aaf176f21b5a309.camel@intel.com>
References: <20261118223023.19653-3-stuart.summers@intel.com>
	 <20261118223023.19653-4-stuart.summers@intel.com>
	 <sashiko-outbox-222127@kernel.org>
	 <kd7u47uhw7kzvfu4a6xxtpd6pkad3fkwlw3lxgt3hdllfpzd52@dw2lkxcd3nnr>
In-Reply-To: <kd7u47uhw7kzvfu4a6xxtpd6pkad3fkwlw3lxgt3hdllfpzd52@dw2lkxcd3nnr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|SN7PR11MB7567:EE_
x-ms-office365-filtering-correlation-id: e8cf7e57-4c83-48ac-3ea1-08df468d79fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|261009223027099003|11063799006|56012099006|261022105027099003|10067099003|4143699003|261021123027099003|261026140227099003|261022075727099003|261028144727099003|38070700021;
x-microsoft-antispam-message-info: Fd7F+Okdqu28T77mKs0DPtr6op0spZgCk7mbmLOfWHps8AFqXWU10t1q4t5BKQxjd80z18tQ27zRUqM9kuWpqLqBcMydCz/qOtRbph82mWZfnxlJCF63vcaIFsk4ODS9/9pwmcANbLSkVqH/2pCi5aT3uUd8M6BXHUDki92GHxIdUqCCjo/3P+FHVETs44cfESBSSqOcUWJkjWP9tUTSm9UW0QfQ6TWjhZjyjGN4uWnsw2ChbGhyJuOOe1oW6aVydNdChNxgzBzEv9dUG3UYlPsDZ2rGF2Cf7NiTXmqtfFgCrDOgVeCfyvrOo3olTeOvUyK7kKFAxeVlbfjAZTNybXFpX5pEl05hdyeWYc02dd3NGScaUpdgC33I6f+gpjPDfKkC3aKn9X9s5IbusIXE9rNYlcV2PPzG/y5/xRtPaA51h8GRiMwhyN7t9wVKIcLZQ8JoTz80vCnyZfDfUhknj1gwMvK0E15UpSESjL6QPMIw08WkViFGCiyL6h5g9qqCHCBv8Cdx4cv/OqBIQWs6nrcDYffSqyMuA8LnRpJFNXW0cMsyOHujk60Sbz04KQnUzFCzy5pnf9nct/BqRP7qCOO1eFNcpYNZ3DQqSc7VxnIG0ln2J4dPh08cuBknB5Hv8JCRzoYz09adfx8PeUstYj/m+tTrCz2Q2fsZxGRfyhQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT6PR11MB072844.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261022105027099003)(10067099003)(4143699003)(261021123027099003)(261026140227099003)(261022075727099003)(261028144727099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1UyaUlEUnVLSG5XUjdXdE9JVE0rcjdKZFdGTzhITmUzNkhuZnltN0ZvbFJM?=
 =?utf-8?B?eFJGSGhDYXRHUk9mMEtzSDNyQ3FKMzcvcUc3Y2JHZTQ0bUkyNUtXRTlZZFRZ?=
 =?utf-8?B?elhPSWhLNU5CTnhoalVIQkhWWUtCa1VZMGtHalhGOHdRWmFsY3pvdzhWaUV2?=
 =?utf-8?B?QUxnWjRTdklnSC95TVJaOFozc1hoWUJWcFhHRlErNlRTRjVucTk5Q0grVDRB?=
 =?utf-8?B?OGI0aEFZT0FxS2ZaS3lHVTVwRVdUbzVMYktPWG5WZEZNRi9TYVczWlYydzJa?=
 =?utf-8?B?eEp1VXUweDBKdlpib3BEcmxkdXBFUjhDQVJERnRRUVF5UFNtK1dMYWhYRjkr?=
 =?utf-8?B?UjZ3SGo4eVlTNTI3NVptWkV5d25LNUVjQXJlaGhyN2wwTzd4SmYvQTU3dFFH?=
 =?utf-8?B?WER0MEgxVFE5ZVVJMW1KUlAzMDVYd0dac21yWUVqa1krZWIvZUZvdzJuU3I5?=
 =?utf-8?B?Q3FWQ0ZpZ3lyQnZob1ZjTjUvYWJlTWZRYnNLMC8xb3cvUlpHd3RLVldBMTlh?=
 =?utf-8?B?NEFnZS9ndERWMWhEVDF1T0dXMGNxcXZlOXFkK0gyWXpuMksrdlRmQWx4czdO?=
 =?utf-8?B?eVc1cmRDTk9oOVVEUERTVEovckw4bEk4QnIyYUFRRWs1OUk1WW15S3ZyWVE3?=
 =?utf-8?B?THlBaTZlODNHd0hGVi9mRWc3RGZhNjdBOTRUc3RBNktWTm1lOXhHMit1Y0tT?=
 =?utf-8?B?bjB3N2syeXBZZm1zaDhqNzJhL1ZxcTZkM1o1VDNyNTFYbFNrTStpY25QS09O?=
 =?utf-8?B?aFN6ZGswdnY0Y3loejExTnUvMUZ3T1orbm8wK0NIMU96YVd0QTlXUktUNyt5?=
 =?utf-8?B?OENPL1dXaG1NSDA3dlVOa3d2R0FRdDFwVXRXQllXZFBZanRnbGhzOVNpYTNX?=
 =?utf-8?B?dVJ6Q0ZDcUZtOWNGa1g4UXpRZ1NNNm1SM2JPdG5zdVJndFVyUFJQd1FWUm53?=
 =?utf-8?B?RkZnNjdTelpDUmthYnN1UFpXSFp4Mk9QT3ZNZ2RDUnd5ZFMzRE8wekJLU0hz?=
 =?utf-8?B?WHZRL0xZUVo2MWZqdStmbkwybThzSG9Pa1ZnOXV5clZUTnc1U1lNTG5tc3ZG?=
 =?utf-8?B?SmpXeXlGeTQxZE1id2pBQUgzYTNvQmF0dkp2RTFYQTdNUFRpbEgrWXN4a2hr?=
 =?utf-8?B?ekVNdi8vUDNFcmk4V3VxUzErcjlodFkxalAvUWpqZnVLZG5HYW1ZRzc1ZGx3?=
 =?utf-8?B?WTdnUUQzWkhJMkZhRFBKTDFiZm1QRWUzb3c4cDZ2SDVmUWxEaWdQZGlQUjZY?=
 =?utf-8?B?WS9MNThvaDVGaGxLUS9ienF1aGVWWFUrZUtWRHE1SHVXTDhVdVZITmx5bEVu?=
 =?utf-8?B?MitDRlRadm1xd0NvL3owNjJyemI1WXRKTytFTHNSY012NjZyYWhPaGRaa3k2?=
 =?utf-8?B?SzlVbzlOQjRDNlpJNUVkYTlFNVVON2ZjT0t5UDNsakNkT3EwelVZdFUzUU5Y?=
 =?utf-8?B?NGNtM3lmWVhPOWQ1N1RYbnQ0RzEwV211dCs2OUxBUGdWdmI2MWdkZnFaQnQ4?=
 =?utf-8?B?cWhuNURDWDh2bE1kL0wvOXdPUXhqbC9ma29ZVHVORjJmeTY2Qy9icWtqUzJP?=
 =?utf-8?B?bHBEVGZFNGhza3hDWEF4VEFzQ1o1WDREelhDa2w4cnM3eWV5by9pNGlObDlC?=
 =?utf-8?B?WkJjbm9zZzdvSTdRU2ZwalVMS0pTY0dmam9xSElmcm1TTnhFS3VvWjJBUGt5?=
 =?utf-8?B?THFOZGRJMk5SZzJIdU1YeW44YXlZT0tzS2pHby9hdUY0VFF6ajlHekFPc1FW?=
 =?utf-8?B?ZUltOGVSOHNBLys3WmdOSkFvK3ZhVmVSK1pOSEVqZ0d1QlpRcUF1ZXdiaitW?=
 =?utf-8?B?OUdPNm5IMHVBaC9pSEgxYkxVYlZvbUdDcTgrcmtCYjNHWGpiQUlybENFM3d6?=
 =?utf-8?B?dDRKUVRXUkpuVS9lcDdOQXJBQklBNUNZakwrR1R6NFFUaDZEcG80L2pKdzBV?=
 =?utf-8?B?aGZqWFhrVFlaWW44YmJYN3ZHMDNTSmVNR1lGQ2hYNlVGTXlmQ1JBM2V0R2th?=
 =?utf-8?B?V2Z2a2tvakFwRXdmREd4NlVxWDZYTGdDTjU5NCtyWnVmM1ZZVmxKRmx6cmRs?=
 =?utf-8?B?OU5GZVZsaU9tdVlrQ0NTOGRpYlM5WUluczErTVB2RmtsaGx1bjVuTnBTL3Ew?=
 =?utf-8?B?WlpoUlRTWnhKekwwT2Y0cXVKNVlSN2xxRXJoK25xTXBQcW9HUjJwZnRPaUFU?=
 =?utf-8?B?M3NsNGc1cDl2NEZNcjFNVDhFem5pMThyYVh0ZVFTSEVoaFJIM0d6K1RjRmc2?=
 =?utf-8?B?cUJuaEdqb3c0MFNJUFpCd1NBYTJpaDJOZ2JsV0hjeEV2YnEyeS9IY1N0TkM0?=
 =?utf-8?B?ajk5L3U4Zkl0SEZGTWdCUDR2N0RkMmttbzdzMjFzTHR3YzhrbzRGU3pQK2gx?=
 =?utf-8?Q?kL6lP6cJLktW/U7g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F73B22BB53FA154486243CC50579034F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4Lj7DM8MMEEqy0bvEnN+DXzq9dIVadt8+xLaKWsqwrJh3ljB4eXLjRVazTOD/hf+2rwrNZL9rFpetoGQKudzBtk9TiJfGcOJFmnOfV1E5z5MeLrE7RmOA1Y+U4YcFZqoWMR0LSXwV8z/RDiF3MFiQsb7PTlVUb11Dvk44iiZW+jSl/q86suqmjv2niER2Bvx56O8Jf5m4IsIDPWc5xSmHVrrab2E7isGEWj9GRlSQ6nO7hwueb7V9l2ZOkQPa46SFEzy0+CWDZAZUqrI23KLhhbqtPF32cQgZy7K5FZ3PyKJlv4ep6lUhC+7mgEiCFNCMu9KoySQbT12u5gT/HnEMg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cf7e57-4c83-48ac-3ea1-08df468d79fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:35:56.0565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NN4OuIvPTzwDJ5LLjBb7/a9CPKlC7y5rNExKsxnfSElgcSFwqsMIMEiWY8mDIPlZrelfnn10/pe0jxPQ6qWqcScsYYsEPnct4KmjdS3vvyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7567
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTExLTE5IGF0IDE0OjM3ICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOg0KPiBPbiBXZWQsIE5vdiAxOCwgMjAyNiBhdCAxMDo0OTowMFBNICswMDAwLA0KPiBzYXNo
aWtvLWJvdEBrZXJuZWwub3JnwqB3cm90ZToNCj4gPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJp
YnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAyDQo+ID4gcG90ZW50aWFsDQo+ID4gaXNz
dWVzIHRvIGNvbnNpZGVyOg0KPiA+IC0gW01lZGl1bV0gZHJpdmVyIGNvcmU6IHRlc3Q6IHBsYXRm
b3JtX2RldmljZV9zd25vZGVfc2hhcmVkKCkgdGVzdHMNCj4gPiDCoCB1bm1hbmFnZWQgc3dub2Rl
DQo+ID4gLSBbTG93XSBkcml2ZXIgY29yZTogdGVzdDogdW5zYWZlIGRldmljZSBsaWZldGltZSBp
bg0KPiA+IMKgIHBsYXRmb3JtX2RldmljZV9zd25vZGVfc2hhcmVkKCkNCj4gPiAtLQ0KPiA+IA0K
PiA+IGNvbW1pdCA0NTZlNTBkMGM0YTdjZDVlNzAxODJiYmFlMzhkNmQ3NzdhNDcxMGU0DQo+ID4g
QXV0aG9yOiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+IA0K
PiA+IGRyaXZlciBjb3JlOiBwbGF0Zm9ybTogdGVzdHM6IGFkZCBhIHNoYXJlZCBzb2Z0d2FyZSBu
b2RlIHRlc3QgY2FzZQ0KPiA+IA0KPiA+IFRoaXMgY29tbWl0IGFkZHMgYSBLVW5pdCB0ZXN0IGNh
c2UgdmVyaWZ5aW5nIHRoYXQgc2hhcmluZyBhDQo+ID4gcGxhdGZvcm0NCj4gPiBkZXZpY2UncyBz
b2Z0d2FyZSBub2RlIHdpdGggYSBzZWNvbmQgZGV2aWNlIHZpYSBkZXZpY2Vfc2V0X25vZGUoKQ0K
PiA+IGxlYXZlcw0KPiA+IHRoZSBvd25lcidzIHNvZnR3YXJlIG5vZGUgaW50YWN0IHdoZW4gdGhl
IHNlY29uZCBkZXZpY2UgaXMNCj4gPiB1bnJlZ2lzdGVyZWQuDQo+ID4gDQo+ID4gTGluazogaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNzU4NTgvwqBbMV0NCj4gPiAN
Cj4gDQo+IC4uLg0KPiANCj4gPiANCj4gPiBbU2V2ZXJpdHk6IExvd10NCj4gPiBDYW4gYWxsb2Nh
dGluZyBzaGFyZWQgd2l0aCBrdW5pdF9remFsbG9jKCkgYW5kIGFuIGVtcHR5IHJlbGVhc2UNCj4g
PiBjYWxsYmFjaw0KPiA+IGNhdXNlIGEgdXNlLWFmdGVyLWZyZWUgd2hlbiBDT05GSUdfREVCVUdf
S09CSkVDVF9SRUxFQVNFPXk/DQo+ID4gDQo+ID4gVW5kZXIgQ09ORklHX0RFQlVHX0tPQkpFQ1Rf
UkVMRUFTRT15LCBkZXZpY2VfdW5yZWdpc3RlcihzaGFyZWQpIC0+DQo+ID4gcHV0X2RldmljZSgp
IC0+IGtvYmplY3RfcmVsZWFzZSgpIHNjaGVkdWxlcyBzaGFyZWQtPmtvYmoucmVsZWFzZSBhcw0K
PiA+IGRlbGF5ZWQgd29yayBpbnN0ZWFkIG9mIGNsZWFuaW5nIHVwIHN5bmNocm9ub3VzbHksIHNv
IEtVbml0IGZyZWVzDQo+ID4gc2hhcmVkDQo+ID4gd2hlbiB0aGUgdGVzdCBleGl0cyB3aGlsZSBr
b2JqZWN0X2RlbGF5ZWRfY2xlYW51cCgpIGlzIHN0aWxsDQo+ID4gcXVldWVkLg0KPiA+IEFsc28s
IGlmIGFueSBpbnRlcm1lZGlhdGUgS1VOSVRfQVNTRVJUXyogZmFpbHMgYmVmb3JlIHRoZSBlbmQg
b2YNCj4gPiB0aGUNCj4gPiB0ZXN0LCB0aGUgdW5tYW5hZ2VkIHBkZXYsIGZ3bm9kZSBhbmQgc2hh
cmVkIGFsbG9jYXRpb25zIGFuZA0KPiA+IHJlZ2lzdHJhdGlvbnMNCj4gPiBhcmUgbGVha2VkLg0K
PiA+IA0KPiANCj4gVGhpcyBzaG91bGQgYmUgZml4ZWQgYnkgdGhlIGZvbGxvd2luZyBwYXRjaDoN
Cj4gwqANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYxMTE5LXN3bm9kZS1rb2Jq
ZWN0LXBhcmVudC1yZWYtdjItMS03ZmY4YmQ1NGU1MjZAb3NzLnF1YWxjb21tLmNvbS8NCg0KVGhh
bmtzIGZvciB0aGUgcmVwbHkgaGVyZSA6KQ0KDQotU3R1YXJ0DQoNCj4gDQo+IFRoYW5rcywNCj4g
QmFydG9zeg0KDQo=
