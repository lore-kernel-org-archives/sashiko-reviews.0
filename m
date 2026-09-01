Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B2C375ADE
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 05:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788240321; cv=fail; b=i1phUwAZX9tmE45wsreuHBCS2+4bgtJ6XG6efN7p9Di790mPgBOiYeMewTTtBz0hSO72EQz86odzsMzOXAdICBsQsX8AJELhARfGeJao7XGsSvhPmx+DzCHsUi6b4WhOcXPysua6337m3MQE2RfaY1XBoQR4MAuIfCPw//J38rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788240321; c=relaxed/simple;
	bh=z9w6KXI12rqV37ti5UlOxPlnSHXfcBKeeBTdyDuf4r0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qnGShiT7YLUbjy0lJxqFh8QNWqPYORvGvSnNcGSxTceIZh6B25CVgYlnjeKnRPT4BLFIIutPCBaTA3yfHdm9NGiieSDoVRwQ8lv04myMH8s9ZCAeAntp+iB2U2pYob/XPj9buD81bHJvFpjqdt3tqcglJ9rcdTq6OA9qcYIztH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5VwUUyh; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5VwUUyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788240320; x=1819776320;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z9w6KXI12rqV37ti5UlOxPlnSHXfcBKeeBTdyDuf4r0=;
  b=D5VwUUyhNoaHNuqgp4CPCn6Ir1SPWO2c4GqOjs2aE3vI7SUo4BWjBCzq
   9hFzccUqyJqIUHM8jkCtiA/WXwvKOiAyHce5PxCKw4WSxrXAiYzjlw7bE
   pej8yUhyvfd1ItGQVWPKb3tlYUFrA2f6XhiuO7tUkGoOlatryK21kjG82
   KkkP/uYQd4ffV9q78IO8UYPVG2cCacpPry/sQNX3ynwUcOQx7wb4GihoS
   FixyqOqFVFyHFCsAuMg++lzPUAhiylP1rHtzT/PyxpTR4aImhGxHNRbwc
   jPrs5fW0//+8UfcJ0N7I1nqFqqTG+pDQXiKkEPsZGtvtKzaEGoRB6DxUT
   A==;
X-CSE-ConnectionGUID: 0mWqpXX+T+uVbZIbp0kPgA==
X-CSE-MsgGUID: cWqiaSdoS6qmRoI0qfXS/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88706633"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88706633"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 22:25:20 -0700
X-CSE-ConnectionGUID: kyLOBREdRx6wY90GDz1dTg==
X-CSE-MsgGUID: QO8rp2/ER++6D0/xqs7W4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="264706242"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 22:25:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 22:25:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 22:25:18 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 22:25:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAxSB7lSkxIw2cnKbCBSxkdvshfMIsQY4KKArlTY3PVkYwRPtfdf6WHsOsw+lVgLiDym3+IKQ4T0cP2/KgFblv6/FfPHHaAJX76fSgQGAYYIvGq1pgwbQbYJS8B5KJtOPzVrKt0c3KkkJzLTklnx5KyqyXcZdjxIKmeYtjPtlNzJC8m7+FU+wXskui1+tHOq5xLWcvksnn/sSUIBQ2L+moQg51gfcmK2bPs4+gda3pDlhl6f6ikXGWvfXgcY7jA0ay35P2pPkIZLv3rGRjBxg+nRi23eok3rI9HjxO9Tjn+24dC5a/Xz7mXHGneyRapxaevS/5HWr2HhghkfY0mlvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9w6KXI12rqV37ti5UlOxPlnSHXfcBKeeBTdyDuf4r0=;
 b=ZKHkW6PwGww0yXUt45Qu4Aj6kx+4oKLKK1wqRG/45bxcFbVU7gaaT4xcR3Bpu5cOVIFt/S/86XaouA8U2QgpzFxpXFLpqkeuCCt8FmzkWTJQPkAB6qsc0czWIu1RZ2wdLvmTLSDUVVMB91Nti6g2S37L6GlieHZKozyOFvt9CcIJIFN2GC0UDMSN2FlanIHGNlhFqo/NaInUQ8aHkjb95K2145KY6UKtm1pQJ3UfShxOY/Y9FjicDzTw20CEvr97jSd6TkMx74iH+PHp6liz2M6SxqO8uqDt0McWbpvbkE78ESWFsFwHhHrl9HNyeNBBQK07dnAUp7ieS6O1qWL64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA3PR11MB992399.namprd11.prod.outlook.com (2603:10b6:806:58b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Tue, 1 Sep
 2026 05:25:11 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 05:25:10 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V19 10/15] drm/xe/configfs: Add disable_vram_page_offline
 attribute
Thread-Topic: [PATCH V19 10/15] drm/xe/configfs: Add disable_vram_page_offline
 attribute
Thread-Index: AQHdORUHB2DeqmEH90aHcKAMXHZfjba32B4AgAFZo6A=
Date: Tue, 1 Sep 2026 05:25:10 +0000
Message-ID: <DS0PR11MB8718BB1B54F9E18CCAB992FC81A82@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-27-tejas.upadhyay@intel.com>
 <20260831084558.940451F00A3D@smtp.kernel.org>
In-Reply-To: <20260831084558.940451F00A3D@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA3PR11MB992399:EE_
x-ms-office365-filtering-correlation-id: 47d37833-7b8b-4dad-6946-08df07e964be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|6133799003|3023799007|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: 98FjNab0yZARx88yEbaLOsrxSH6MJMRQEuD+gxawYAgtQz3JiFzghguKXZn5NltwifRWCyW1mxyO26rF6xWjciAWm0hxx0SnsIXcpIYsZzSjbxeaT7mjWXCCGhmUUnnAUadm+/T5+5sU4l4Ouzz3B8UiRhEdmTiDql4HYehPo1BLe13zX3LriWwOrR4ZS2abKELvX4ctARo25eolYc3xhYuMDpstzn3XMdA91/1dEWpCjXe4Xo7OQ3ebGs99MWLAfTVGfkKTdAAUT4kcLOEGTkEH2Ki5jXqdj1n+kZY7rcyzGg3HQHVb8DNpNBVdDXJyaLMgddk2+h1itq6JYxc4VtXWT++a502lz8UFN2EJWOnvJw9dOftHDQOx1/BKUuyjMDxdD77i43xZSXo+Ak53XshYPfz0webkngY4IpY5/iWUrFEcf/oysrDB24sJN3xvF5FDFYrabqXwjpuHDzCe//dh9qnXdq4kX4z+jU2lFk2Nhl3Y/G+RGJJdu9P7L/KocbZq69jLBKKefQnfW0Gm9zDa6vjRJ/VZQXRSNRzmnKoKcAiYi7SyVTR5atBgmbDf4iAfJ39ke0+oVRO56oh4F+CnsisR6aE/yjp8vTSC5O6dbEUV8hic9Q5Bx9JNGHUvW8XmywoZriUWzjF2DfsKGYel8f6m7lHGGQWwDgK8T5A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0VxcThxRVZKTTlwUS9LQlZCWkt1Um1YSXlSa1pVUEhnSU54M1Y2ZjZ0M1Fx?=
 =?utf-8?B?Sm5YWTZBOVIwWnpDd1M2eGxWcTBNTmhvQjVSWisreUEvNlBweWxNcDlpTWgv?=
 =?utf-8?B?WmhjMUY0b1FnVXpkVzhDbVNJdXI1VmpkNEtQNzN1TDkvV2c1c3UzRExNNWgy?=
 =?utf-8?B?SFFrRkVBZTZpc2J2WS9hcXhGOG5wQzJNVEo2dlB2TmZaTkxVZm1sYkJiekt2?=
 =?utf-8?B?RzltN25BaWhOMkxHZlBsUkR1TGV1VHpOQm9WczVhQ3p1aHZiUjBFOGp6Yy9U?=
 =?utf-8?B?YzJEeDRhRTlXVS8wKzZBNHB4WStxdStTbm9hTWNBYlZFZGhDd28wMFdqTnlq?=
 =?utf-8?B?WThZckV3QWp0N1FyLzZPQ050azdFT2k5a2ZSZHJpMk5EYVN1bkFSYlcraXgr?=
 =?utf-8?B?UE5FTXFzcXpZcjI2ZzFaWEdTSHMvdmhMOFJEdUJUcit0UWxYUVQrK1phZ1c2?=
 =?utf-8?B?c2lETm1PTDNvNVZOL2kzR0l0NjU5Vm9oMzAvbzFiYk9hSWttMUpVVDNpZWVn?=
 =?utf-8?B?R2dzZ01PVk9hRFRPWThORGlpR1ZxMGEyY2tTWGp3SUphMThudVQ2NEpwZmFR?=
 =?utf-8?B?dVNrMFNJUWE0cVNqaGNqbm02TFZMV00zODlHRzV5UDlpRFNuM211REkvWi9x?=
 =?utf-8?B?bk9XdENOUHc0NjE5SWlBaGhOZE5LOTVXejVVQmh1Y3FFblQ3bDlmM0Y0dng3?=
 =?utf-8?B?MXpzZ0c5SEFjYXQrSGhWRFpRYXRPVmVXZmtVeExZM2lXbDJGVWRVSW5SeG1N?=
 =?utf-8?B?TllnK0JnaDcvQW5rbFJWWXI2SzZxSDJXN0JBU1pVMjhIRXF6RmpsQVZNSHJO?=
 =?utf-8?B?VXEwVWs2dW1jL2E1YndyeDN3YzJSdHR0RTNDazB6WGVuQ0VQQmNyQ2VVRSt2?=
 =?utf-8?B?eDl1THRXcmhHRWdBTUtvNXJQd09nVnVnaTFLZUdWemNxVWxsY2pUdmljbWRr?=
 =?utf-8?B?L3UyWFdBT2pEY2VMWG5WY0F2N3FKTHh4VFF0eGxRZGhMV29wa1NtMTdvdUk3?=
 =?utf-8?B?ZEFQWVBQalBMeVozK0dFTVJyV2dZTzNobGxFeWUzQXFtOXlZTEVsQ2E4YkJl?=
 =?utf-8?B?UmQrOFJFMFBlZDdFRGMzWTRzeXlxRDNXcjVkMExoVzVGM0VTYzJtZzI5QlJW?=
 =?utf-8?B?MTZ3WFI4bzl5WXhqT1NMU1lScDB3Wi83S0duWGtxczFLYkY0Y2RLWTVLTWpa?=
 =?utf-8?B?dElRZmZZczNiRVNsbnVMamdWOVJTbCs2N0xhNm1vNWhyTXZ6TjFGQWQ2cWox?=
 =?utf-8?B?L24wNDFBcTNXb3hJb08vOUMyM3dCMXVibU43eGdVYXk1THpRckh2dlRzeHZ1?=
 =?utf-8?B?eGhEczJBeHNsUEZIMGdRSkhScjBtQ1p2Z015SGFQOVlUOVBzUWhRWW1LK1p5?=
 =?utf-8?B?ejl2NllOYzNkQVhid2NERk9nUVZYQXpra1cyclZLa0JSWWJHSDZZdHRBRWRo?=
 =?utf-8?B?Mmw4RG1sNE1mb1M1Z3ByQkh5UW90TWpEbmxhcWgySWhaOW5yN2VqK3Z4K0Zr?=
 =?utf-8?B?d0l0OU5CUEVIcU91VG1ldklBNkpUdERLcUFDd3BnVkxheW5IUkRsdnRWTnFW?=
 =?utf-8?B?cFdNMmVqMnJraXZTYjRWTEdlNjVsY1F0Rkg0eVU2eXZaQVdIa29qSDZOWkRo?=
 =?utf-8?B?bU13ZDVBelZjQU56TStjWTYvQUZIZUUvOXJhcnJyb0ZLNGtrMDFrS2JxTFNo?=
 =?utf-8?B?ZGplT2lnMitLQ0g4L0NHekE1ZGhmb25sMmZWSjdwTmxaNlpBUEVWcWZkNjNK?=
 =?utf-8?B?Qnpxa3dDNzliam9nVmlrRTZ4dVdNdkpnZm5sU2g1S3VNTXhkUDczRWJSbWl0?=
 =?utf-8?B?UDRTZlJ3RERPdEtCWWpJN3pJb0pQUmF5MFFpQUZNcFdPcndqSklNRTM4WFRK?=
 =?utf-8?B?SnUrcVp4Y3prTGdUdm1CKzFLZEhUTnVEUXNhSWxRQlFtbGdPYXkyTlpQeDNR?=
 =?utf-8?B?dFd0d3d2WkhrUDZzbTV6d0E0bC9tZFRmd2xHWEgycGZmckcvVHYvZVpodmQr?=
 =?utf-8?B?RXptNnd4bmdjSC9kdGFQVlkwcTh0T3Arc3h6TXg2S3VIeGcyWW55Y2JDbHZF?=
 =?utf-8?B?REY3Mm8yaW1YZ0R0NEJsNFI2ZTV2R2U4cFk4alJENE5nRjU4UGZDYWdjSnFm?=
 =?utf-8?B?MmtOdWRxYmI0V242TXRkTWtQcXpaQ0YvNjVsd00wRHJSRC9yd290Mkp4U0xo?=
 =?utf-8?B?MWI0aU5ETEJpZnhQeEZVdWFlZEdxa0lJK0dYNEMwZ3V2NENSZG1wWWpVL2lk?=
 =?utf-8?B?dzRIWU1PVTFwUjFUenJsNk13ZXRwSGxCc3JDN00yQ2RodmxQRU1Fa21qbkNX?=
 =?utf-8?B?cHlMeWMzSE5XUzBKd3RuOWZZZGpOZmdhUXNueVBrWjM3WXVsQ1ptQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iv9QMJ3y8iz3STFJhIYSBnsKBEH2LlbglKLDLPfmmQ/G8CvPEqOP29QbZ9nuJFTpZesqaDUm/rc9u15o53csfO1CSPTuXEvb5qd2NSIqpyWIoUPlLKX/38PBYzfysXmkShKmvD7EMzOCLhQtNduird4orJEfoDF2XPcZ+UBr/lZLuF1IAjI9fwR8OzW3m2pYyiSHc1CkmUon09Mhk3OUXJh5CIjkLWhFm3QjKE+zmFpWRY7W+hfIMKL1Uo+UxjgqOlV439iBjNOGpf8FsE/rjG1XQNKCd9z45YJO4gKDY1d9nF7Q1eidY/Ega2vL+XpciD5t58kxBWrmN+pzfutw2A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d37833-7b8b-4dad-6946-08df07e964be
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 05:25:10.8769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dGt6PXez5hs4wvkrGIqyQFeNdSOYyfnZv4Ypzcv7ikVRaRNOoYGuEuOV8ntImHD0gMaxIfhRWl33pzJylQ9PmyteM1bCgi1yNVMm3cdcGVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB992399
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMzEgQXVndXN0IDIwMjYg
MTQ6MTYNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0K
PiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggVjE5IDEwLzE1XSBkcm0veGUvY29uZmlnZnM6IEFkZA0KPiBkaXNhYmxlX3ZyYW1fcGFnZV9v
ZmZsaW5lIGF0dHJpYnV0ZQ0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEg
U2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMiBwb3RlbnRpYWwgaXNzdWUocykNCj4gdG8gY29uc2lk
ZXI6DQo+IC0gW01lZGl1bV0gVGhlIGBkaXNhYmxlX3ZyYW1fcGFnZV9vZmZsaW5lX3Nob3dgIGZ1
bmN0aW9uIGluY29ycmVjdGx5DQo+IG5lZ2F0ZXMgdGhlIGNvbmZpZ3VyZWQgYm9vbGVhbiB2YWx1
ZSwgY2F1c2luZyBzeXNmcy9jb25maWdmcyByZWFkcyB0bw0KPiBjb250cmFkaWN0IHRoZSBhY3R1
YWwgY29uZmlndXJhdGlvbiBzdGF0ZS4NCj4gLSBbTWVkaXVtXSBUaGUgZHVtbXkgZmFsbGJhY2sg
aW1wbGVtZW50YXRpb24gb2YNCj4gYHhlX2NvbmZpZ2ZzX2dldF9kaXNhYmxlX3ZyYW1fcGFnZV9v
ZmZsaW5lKClgIGluY29ycmVjdGx5IHJldHVybnMgYHRydWVgIHdoZW4NCj4gY29uZmlnZnMgaXMg
ZGlzYWJsZWQsIGNvbnRyYWRpY3RpbmcgdGhlIGRlZmF1bHQgY29uZmlndXJhdGlvbi4NCj4gLS0N
Cj4gDQo+IGNvbW1pdCBkMDg3YTljZjNjZTFiYWFhYTgwZjlkY2U2YzQ0NzUxMzNjYzA1ZGJmDQo+
IEF1dGhvcjogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gDQo+
IGRybS94ZS9jb25maWdmczogQWRkIGRpc2FibGVfdnJhbV9wYWdlX29mZmxpbmUgYXR0cmlidXRl
DQo+IA0KPiBBZGQgYSBuZXcgY29uZmlnZnMgYXR0cmlidXRlIGRpc2FibGVfdnJhbV9wYWdlX29m
ZmxpbmUgdG8gY29udHJvbCBob3cgYmFkDQo+IFZSQU0gcGFnZXMgYXJlIGhhbmRsZWQuIFRoZSBh
dHRyaWJ1dGUgY2FuIG9ubHkgYmUgc2V0IGJlZm9yZSBiaW5kaW5nIHRvIHRoZQ0KPiBkZXZpY2Ug
YW5kIGRlZmF1bHRzIHRvIGZhbHNlIChvZmZsaW5pbmcgZW5hYmxlZCkuDQo+IA0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYw0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmMNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Y29uZmlnZnMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jDQo+
IFsgLi4uIF0NCj4gPiBAQCAtNjE2LDYgKzYzMSwzMyBAQCBzdGF0aWMgc3NpemVfdCBlbmFibGVf
bXVsdGlfcXVldWVfc3RvcmUoc3RydWN0DQo+IGNvbmZpZ19pdGVtICppdGVtLCBjb25zdCBjaGFy
ICpwYQ0KPiA+ICAJcmV0dXJuIGxlbjsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBzc2l6ZV90
IGRpc2FibGVfdnJhbV9wYWdlX29mZmxpbmVfc2hvdyhzdHJ1Y3QgY29uZmlnX2l0ZW0NCj4gPiAr
Kml0ZW0sIGNoYXIgKnBhZ2UpIHsNCj4gPiArCXN0cnVjdCB4ZV9jb25maWdfZGV2aWNlICpkZXYg
PSB0b194ZV9jb25maWdfZGV2aWNlKGl0ZW0pOw0KPiA+ICsNCj4gPiArCXJldHVybiBzcHJpbnRm
KHBhZ2UsICIlc1xuIiwNCj4gPiArc3RyX3llc19ubyghZGV2LT5kaXNhYmxlX3ZyYW1fcGFnZV9v
ZmZsaW5lKSk7DQo+IA0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4gRG9lcyB0aGlzIGxvZ2ljIG5l
Z2F0ZSB0aGUgY29uZmlndXJlZCBib29sZWFuIHZhbHVlPyBTaW5jZSB0aGUgYXR0cmlidXRlIGlz
DQo+IG5hbWVkIGRpc2FibGVfdnJhbV9wYWdlX29mZmxpbmUsIGlmIGEgdXNlciB3cml0ZXMgJzEn
IHRvIGl0IChzZXR0aW5nIGl0IHRvIHRydWUpLA0KPiB3b24ndCB0aGUgJyEnIG9wZXJhdG9yIGNh
dXNlIHRoaXMgdG8gb3V0cHV0ICdOJyBvbiByZWFkPyBUaGlzIGNvdWxkIGJyZWFrDQo+IHVzZXJz
cGFjZSBhc3N1bXB0aW9ucyB3aGVyZSByZWFkaW5nIHlpZWxkcyB0aGUgb3Bwb3NpdGUgb2Ygd2hh
dCB3YXMganVzdA0KPiB3cml0dGVuLg0KDQpUaGlzIGlzIHJlYWRlciBjb25mdXNpb24gZm9yIHN1
cmUuIEJldHRlciB0byBjbGVhciBpdCwgSSB3aWxsIGhhbmRsZSBpdC4NCg0KPiANCj4gPiArfQ0K
PiA+ICsNCj4gPiArc3RhdGljIHNzaXplX3QgZGlzYWJsZV92cmFtX3BhZ2Vfb2ZmbGluZV9zdG9y
ZShzdHJ1Y3QgY29uZmlnX2l0ZW0NCj4gPiArKml0ZW0sDQo+IFsgLi4uIF0NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmgNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9jb25maWdmcy5oDQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Nv
bmZpZ2ZzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuaA0KPiBb
IC4uLiBdDQo+ID4gQEAgLTQ0LDYgKzQ1LDcgQEAgc3RhdGljIGlubGluZSBib29sDQo+ID4geGVf
Y29uZmlnZnNfbWVkaWFfZ3RfYWxsb3dlZChzdHJ1Y3QgcGNpX2RldiAqcGRldikgeyByZXR1cm4g
dCAgc3RhdGljDQo+ID4gaW5saW5lIHU2NCB4ZV9jb25maWdmc19nZXRfZW5naW5lc19hbGxvd2Vk
KHN0cnVjdCBwY2lfZGV2ICpwZGV2KSB7DQo+ID4gcmV0dXJuIFU2NF9NQVg7IH0gIHN0YXRpYyBp
bmxpbmUgYm9vbA0KPiA+IHhlX2NvbmZpZ2ZzX2dldF9wc21pX2VuYWJsZWQoc3RydWN0IHBjaV9k
ZXYgKnBkZXYpIHsgcmV0dXJuIGZhbHNlOyB9DQo+ID4gc3RhdGljIGlubGluZSBib29sIHhlX2Nv
bmZpZ2ZzX2dldF9lbmFibGVfbXVsdGlfcXVldWUoc3RydWN0IHBjaV9kZXYNCj4gPiAqcGRldikg
eyByZXR1cm4gdHJ1ZTsgfQ0KPiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgeGVfY29uZmlnZnNfZ2V0
X2Rpc2FibGVfdnJhbV9wYWdlX29mZmxpbmUoc3RydWN0DQo+ID4gK3BjaV9kZXYgKnBkZXYpIHsg
cmV0dXJuIHRydWU7IH0NCj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBTaG91bGQgdGhpcyBk
dW1teSBmYWxsYmFjayByZXR1cm4gZmFsc2UgaW5zdGVhZCBvZiB0cnVlPyBUaGUgY29tbWl0IG1l
c3NhZ2UNCj4gYW5kIGRldmljZV9kZWZhdWx0cyBpbmRpY2F0ZSB0aGF0IHRoZSBkZWZhdWx0IHN0
YXRlIGlzIGZhbHNlIChvZmZsaW5pbmcgaXMgYWN0aXZlKS4NCj4gV2hlbiB0aGUga2VybmVsIGlz
IGNvbXBpbGVkIHdpdGhvdXQgY29uZmlnZnMgc3VwcG9ydCwgcmV0dXJuaW5nIHRydWUgaGVyZQ0K
PiB3b3VsZCBzaWxlbnRseSBkaXNhYmxlIFZSQU0gcGFnZSBvZmZsaW5pbmcgYnkgZGVmYXVsdC4N
Cg0KV2hlbiBjb25maWdmcyBub3QgcHJlc2VudCB3ZSB3aWxsIGVuZCB1cCBsb2dnaW5nIG9ubHku
IEkgdGhpbmsgd2hlbiBjb25maWdmcyBub3QgcHJlc2VudCB3ZSBuZWVkIHRvIGRvIG9mZmxpbmlu
ZyBpbiBwbGFjZSBvZiBsb2dnaW5nLiBJIHdpbGwgY29ycmVjdCB0aGlzLg0KDQpUZWphcw0KPiAN
Cj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcNCj4gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwODMxMDY0OTQyLjMxNTcyMC0xNy0NCj4gdGVqYXMudXBhZGh5YXlAaW50ZWwu
Y29tP3BhcnQ9MTANCg==
