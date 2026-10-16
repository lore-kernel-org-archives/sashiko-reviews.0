Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF21A3128B6
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.129.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112150; cv=fail; b=R7Pf0ZHEjoLYa7bbx2bMu6mdJh6Mq8gbjNNBn7SZ3grRGuUsfOiKqGHs/UqMafsLeCE4AgVLQKQ/YzQclfb5TbP8B6bbN+aCrLiC4Dto+O9CR7vLdo4AaNBkEodexI9OXUauMOiEOu1TuKHRCR3oarQ2jXa7Y7VU53AOmMzO7eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112150; c=relaxed/simple;
	bh=DQWjmfvAr5bmODdpmauK0Bu/G8JTxmpTfcGI1oPuMow=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ih1IlpfjLXi8Kex9aEfBT4kEIk23FYML8rdGkfFyHAkFvLx9aAr/JvLxEWc3I8+7R3eY6fe0CZ9/YbmglzmsbhzCPpc/xgisq6+D4LapWpT/y9BF2iGFcHPNLttBsrhJEIs9EaoVSs+gVsamXrhWVFUpjGTMBHK1BdZYvVLEm9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com; spf=pass smtp.mailfrom=sitime.com; dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.b=hGuGj5FT; dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.b=k+6qjL61; arc=fail smtp.client-ip=148.163.129.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.b="hGuGj5FT";
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.b="k+6qjL61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=DQWjmfvAr5bmODdpmauK0Bu/G8JTxmpTfcGI1oPuMow=;
 b=hGuGj5FTWrjzzDFWpCkVcTcwhHzZIDUhz1+wwkH3WYVOeKMDi3aTJm3mLar2wKP9IS1x/bumg5YnY+svTRjJFrKul50FgsZco41JuxgE5XSEXstX2XSvQXqqDdAYu9izCicU5I+1FMg2orTGr6silBDMC+D5y+uiperqEQtTg9HjMKN/TFXKUi3BrKKSAiV5rKWO+V/UabKAWKYkHv1JQ5RdOERMkzcickm9jnd9soZyqMdR1oMuLKD1U7uK2mlvY2h3EqB3Duk1ilUbb7l+lSMW0wmquiG7ZZW2TuD4KOW73IKHW3LJLo4TDlFhc7aEm9skSzn9HYDyxtKkuZGlmw==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11020104.outbound.protection.outlook.com [40.93.198.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id DB76BC006B;
	Fri, 16 Oct 2026 00:55:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4WPCmXqPICgG+qEolJrC3JpRrQIpXqC7ikqKRIUHJkOlhIHmo0R67T9sXqwM4YT9TXJJ669baV1govPRD0zhdhKhGNwAMr0XA+f4/WbeHDALYrZMem0k8fkeMgdc85Ea8WkELZZ6foBq4jyAbfvFDc5kqzDmrj5wPg6GxWVXadef6FmPLimEHLeMOCf3mo5Bw2O6N/kbzDeUJ5Bmd6lAim0T6zshDKqkKD5397PEmC4K8O3PmUCNWEClVQjQ2bEXEG1yyLZTXoyiq19OK0tcjPsw1dwjDRV1mXZpHC4LA5m9yWVETMjhD/csnI+W5HE+KHqMlaUHVQ+7UTX1jnqNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQWjmfvAr5bmODdpmauK0Bu/G8JTxmpTfcGI1oPuMow=;
 b=yqcYdihwzL+j+VLYzAz/qZKN7o375AjKTCXO6aPLSe7ArEuOvd1NiKZki6Ww1dSWTQ9wHJG/aVOqhhNxoUWg7rUrncS1eSoLfUE2bakgSAhoI4OjvWu7KJAWBwCkticArCbVGE5tgDE88Dub9RcgXOSrSbd6DdK8HT7z+/89DmHT9nzwFoyND1VvgegExr5JMBNBIHWbXOkLX1/nBLHQoUvdIbRqEOWc0XReiX6jPeFifPEEByDMD4C2N+MW3mRxjRpip0olXey3pEXWdgjR86FOUMAaOng0qx2e6v4mTf8VFy5D2U7Cbt9mAotujZCrSh2UbQtp+DdWmAUML8WEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQWjmfvAr5bmODdpmauK0Bu/G8JTxmpTfcGI1oPuMow=;
 b=k+6qjL61MRgcFpz3eih+lyUHFstFW203FuIaDQqHXHX87uJxMXSroAjl9EDsXP/805KGyxFwwTTo5rV6haqrlWgeSmXTMU4ADuszKO9H8xZWdMdnJSsAbFA5gDuqTDscZ81HIgyrnEX5/F7U9Y6VjNqdJHwTbt+oWWIp5DBoJwCUt3t94yU4OwHgSydfsS2Cs67PVgYAqDNh3wwA3VL1ukOsJG7kzwBgUzqBGgqn1QDm0UB3bfgMiItJyLOs2aguKZlze91xwzvxLFm39/FVQfnsZRUo6gLzgqmdsQE0YdHdumFXAFNGWVmbzi3CpaolGX2Lex5DTePfFx8wUazK/w==
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 (2603:10b6:408:3bf::16) by MN0PR20MB4789.namprd20.prod.outlook.com
 (2603:10b6:208:3c7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 00:55:45 +0000
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01]) by LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 00:55:45 +0000
From: Ali Rouhi <arouhi@sitime.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: Jiri Pirko <jiri@resnulli.us>, Vadim Fedorenko
	<vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski
	<arkadiusz.kubalewski@intel.com>, Ivan Vecera <ivecera@redhat.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Carolina Jubran
	<cjubran@nvidia.com>, Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v13 08/12] dpll: sit9531x: add support to get and
 set frequency on pins
Thread-Topic: [PATCH net-next v13 08/12] dpll: sit9531x: add support to get
 and set frequency on pins
Thread-Index: AQHdW2QBp8UyZE8c/UGXh+YsRn/ZU7b9o5uAgAG3vIA=
Date: Fri, 16 Oct 2026 00:55:44 +0000
Message-ID: <20261016005541.11374-4-arouhi@sitime.com>
References: <20261013224131.27149-1-arouhi@sitime.com>
 <20261013224131.27149-9-arouhi@sitime.com> <sashiko-outbox-171996@kernel.org>
In-Reply-To: <sashiko-outbox-171996@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR20MB994915:EE_|MN0PR20MB4789:EE_
x-ms-office365-filtering-correlation-id: 927226f5-7da4-4181-abfa-08df2b2035d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|56012099006|4143699003|18002099003|10067099003|22082099003;
x-microsoft-antispam-message-info:
 qxCwWHxsgEwlGQhElKPsqS2TzVfFZP1I8xbTOHZKnc9P4Wz8xeG+7w0Upw9EHBP3wrWpIODIeCNKt2FxP3HGkC4yrVU/pSyupvIox8ignVcekf0ERPJB1JtOUZV7Lbw0nr1mRCAjrAJ/ckYTcYSLdmvujxnK51Nno2CCDwolIzInv7+hPwXk8/oQfMGqAG6XXEAvN3rLbngRmtvvG7tRbvl43Th1LskXH8WvPiQU/9mZIAVlOKTEKfn5MUl0Cfz6u9XnxZMxWQIV2uw6qc3DE3dxYQjkuwvGrEXf1ibxKbv/KIaJPOQnrHYEMtg39qAz1Qomzb4dHrxJ565nOlcx5Ps0I+emETyAJ/PHhAmPTwmgyYlrLzLA0BOdlNeHweVmy81JKz0FETvW//ZhL4HI2IVs6ztGD4jtEpppvXWQVGryTJTuoOGFuU1NQTqESzY8LvwxRyewcjng/Amm0rQV1wuql8wqmGhzhFi6UmkZzJfGeafPd1JskVQ+OVk6MA9zYhOw9figGgGI1Y/PaadQcUJm9uArUvy6ud3KVNFKaAxjlJ8CAnorWmnidei4Kzv8YgYWwsqbe+3AccHs0l6mg+ao0ojubjlsVRYekce96+77sgCsEW9zTPNVD7K/LipS89/x45BsJJducT+khkmi/3NnwpAaTkF5auDl8oakll+Nir6hiXpvWUCoO1OfdLJmKI+Paw9+SoRjnY1aRHshJFuSH2ScGuSAUhfRBpUm1g4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR20MB994915.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(56012099006)(4143699003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTlYenA1UVh0S3JJeUpJWitseWt1SXYyV1ZzanJZZXFDYTZ0YjNDWnFTQ1VE?=
 =?utf-8?B?enlVUEtVQUovdzN5QWhPQWMvZ2FZU0x4ZUFHZlNxL2hnMmdValdobzdHK001?=
 =?utf-8?B?UjJNNlVMVnYyaThFQ2lMSjZHVFluMS9iM282OURFZkMzbnFSblNpZGtWeTRn?=
 =?utf-8?B?NVJRSk5yNy9SLzVJREd6eGhid2hhVzJZUGxZSWVIQWx6NWZkNzhXVXFLNit2?=
 =?utf-8?B?VHJ2VGRuTzNpODlNWGY3VUdjcktEbjRISmVhTHRFdFlUWG13MnNHN3ZpdHhB?=
 =?utf-8?B?ckpsR2M5TFdaWm0vdjZ4NC94M1V5bVl1T1dabmRyQnREVGJnRkJhK2dwOGZX?=
 =?utf-8?B?K0IxSFRLaHhSKzhKWnloVlpIVE1GSGhyb0h5enBKWThHU2M1Q01uSmhpT1ZM?=
 =?utf-8?B?ODRXaTlqWUxxUFB6ZGFkZ1Nac3hlK0FFbjA0RFh3Si9HU1Iwd0t6bGhiT1M0?=
 =?utf-8?B?OUJsSDladnBtdFlIU2w0a2ZzbGpIR0RWUmpic3NqUFAxMWlNUVEvVDhqb3px?=
 =?utf-8?B?cC9BWlBrbC9lT2RZaHNvbVNCcmhoTkRGMHk0Sm04a1g2RUo4K0o3M0FOWU9I?=
 =?utf-8?B?T3lEMW9IRzE3T0NBbXUrRXd5M0VFdDcrcFhZeXZSQnN6WkxQYjlYMDhZa0JD?=
 =?utf-8?B?SmN0M29xQ0JWaEFONXVMTTJ5c3lzMmZRSnM1UHU3RzI2SmJoMVM1WXpBeXBJ?=
 =?utf-8?B?ZUxFUGZta3IxVElRSjBmY1VmSWVVVFJxKzJiYm1CQ2NvZmxSUG1KWmh6Q0h0?=
 =?utf-8?B?TlNhQmxzQ2FCL0w2dVE2VWNFREZIaTF6YU5hdGF5YWUyWmV4OWFBQ3BtN0Qr?=
 =?utf-8?B?YnU3dTRKbk1XYlBOenBpeW01b0gyNTNYTytGZ2FSK2FzamloaU1UY0RoTGsz?=
 =?utf-8?B?VkFZYlNSTGtDVnFlK0g5UVZPODFPeWlKUnJSMmVHNFVFTUxzb3ZkaFJ5K3dM?=
 =?utf-8?B?TytvdjNMZElvcTVsQnV0Rmc4dDlaOGlHNEJhVHgxUC9OSlFTaEMzN2YvUlFq?=
 =?utf-8?B?SUNzL1ljNUpZa0dzUVArVEtEQ2tXUjkybTQ2dWNpRkx0QnpZRFpKSGxRSlM4?=
 =?utf-8?B?dHZGb0oyWU51SHJlRnFRMVduWWtveFQzekM2NlBvYnVyZkpJbVlMOTdNWXpO?=
 =?utf-8?B?b0tMV2pQMEhXWGhpcnFNUmNjS20welBTYURSeE1xVlA1ZjNQYVozcnBSTU9I?=
 =?utf-8?B?M0hTSG9PY0dhNTEwaXhuQ1FSZ0d6RTlmVHR5WGovSTZTQU80bGJRZC8wOGFN?=
 =?utf-8?B?ZWQwbVcwaG9wRUFaaUMvL25mM2JXNmNOYXhBOUFGd0FsMUk4Z09VQ2Z3SnZm?=
 =?utf-8?B?MEhIdVRTQktybm5jcUgxWDJUb09OU3JSaGJWY1c3ZTlZL3V6NXFWYkl0RTVh?=
 =?utf-8?B?SFlIUnBFMlhsNW9qdDdoOEZ5YjNVclo4T05lUWNyWldwdGgwTS9vN3B0MTli?=
 =?utf-8?B?OE5GRElFN0ZXZWIzVjFKR2FrZmFZQ3pZYi90RlpXNzNjMUd1L1ZLRTVjL1dZ?=
 =?utf-8?B?dnhPRkpwbi9TSjZ4TUF2bVh1QXY1YXdlMEJ5VHEwMmVKcDlwWEEzMkxHQ0tE?=
 =?utf-8?B?aE4wU1FRc1Jtc254MzlQVWVHNXBpVkJ5Slo3a2VyY0FrclNja3FycDBPYUJL?=
 =?utf-8?B?Sy9WSFhCMCtzMEJZR2MydlNOd2dHcVhoaDIxNE9zZ201RTcyMm1ONFRBdG1N?=
 =?utf-8?B?TG03OFBTSDBZZjlTQy9xV283cEVJQnFGL2IrQkQ5dGN6WnBiMmtaeXYyZHZX?=
 =?utf-8?B?TDE1MGhSdURNK1FxemlVZHgybExMN3pCODNUWTBobEhQbVdxMnZyMkM5dENl?=
 =?utf-8?B?ZE1Dc3hEcDl2b2lsb0c1TVYrVVYzUnRrYUt0VURnTm5HVi9EWUxHOUdRVHl2?=
 =?utf-8?B?cnNWSmdnSDdFZUVmMVZaUHhKTmJCUGxtbWpleit5THhYRyt1dHZyZlN1UGJN?=
 =?utf-8?B?WmhNRmFBU2M3OFVWYS8valdObCtVMnlNTTNLNGtLbWtKTC96YWFZdnhlMjhv?=
 =?utf-8?B?aUxlUWIzU0N2RFJGWHErYXJ6a1RqcUtmcTVHWnVoYXdnWFgvSGZzNk1OYmZo?=
 =?utf-8?B?VTc3NlZBYXJ1S1YzM2FtVXBoWFZOVDNra0RaU09SeDB4ZHJQM1RyTXlxMkw5?=
 =?utf-8?B?R2ZGNmY4c3FmVXFBUHI5QzJqb0thcGhmUDJkUUFZb25QakVhVkYvN0tjL3dZ?=
 =?utf-8?B?ZGdVdERxMStOclpEWkF0YjcrYm9mTEhBMk1hMTI3Mk80THZtM1pJQzR6UU5m?=
 =?utf-8?B?K3c0SnZmeUxyNS9WcTM1ZzdmUEtNSXFXeHJ2V1FnS1pKbStja0k1SWgxRVdw?=
 =?utf-8?Q?KslQUdS8rG/OpwWeMD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	r3arhSPNoQYyhDFUVXEFR5PMBOkYvkgh1/nHZCcOzYqjQKSIYDODB6SFvszbwyA7QCsItN4W5tMT3Qbw9W0cB+wramFATOLZKOgUU5B2E7BcV8ifeUAZL07iNQsJZc2RRX7A26FPxW5FdapZ2fjXACLPN+XhcSTrf7fFk4I42nclQz81vkju67NXcgHTO959Y9QS3/BfETnGFOItL+djJWH0HVsYkyTTpThng6XTiBRsIaPKsJGUJPWl/eX+VGQ0drTBgTdNnRHgfKxq8TUXhfL9ELQ9J/6f+nbOu3iLpw0y2eqOWZOiGQDkb56OQJFpz8qNHyYFIYO8Wmspg50ZcQ==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR20MB994915.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 927226f5-7da4-4181-abfa-08df2b2035d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 00:55:44.5215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFVmYulsV6Z4P4OxztnKTnIqsskCqHtPGcORb/1vYc56rdYnfw42kNYAkvpx9Agm6Aa/f4Ov9xREOrbICsiYvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR20MB4789
X-MDID: 1792112147-47DcXF8LupNA
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;ut7;1792112147;47DcXF8LupNA;<arouhi@sitime.com>;b258b95cf5ef1e870c44c71acb0e4bbc
X-PPE-TRUSTED: V=1;DIR=OUT;

T24gV2VkLCAxNCBPY3QgMjAyNiwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCg0KUmVw
bHkgaW5saW5lLg0KDQo+IFtTZXZlcml0eTogTWVkaXVtXSBTaW5jZSB0aGUgZGV2aWNlIHJlZ2lz
dGVycyBhcmUgYmlnLWVuZGlhbiwgZG9lcw0KPiB0aGlzIGxvb3AgcmV2ZXJzZSB0aGUgYnl0ZSBv
cmRlcj8gQnkgbG9vcGluZyBpIGZyb20gMyBkb3duIHRvIDAgYW5kDQo+IHNoaWZ0aW5nIHRoZSBy
ZXN1bHQgbGVmdCwgdGhlIHZhbHVlIGZyb20gdGhlIGhpZ2hlc3QgYWRkcmVzcyAod2hpY2gNCj4g
c2hvdWxkIGJlIHRoZSBMU0IpIGlzIHBsYWNlZCBpbnRvIHRoZSBtb3N0IHNpZ25pZmljYW50IGJ5
dGUgb2YNCj4gZnJhY25fcmF3LCB3aGljaCBjb3VsZCByZXN1bHQgaW4gaW5jb3JyZWN0IFZDTyBm
cmVxdWVuY3kNCj4gY2FsY3VsYXRpb25zLg0KDQpUaGUgbG9vcCBtYXRjaGVzIHRoZSByZWdpc3Rl
ciBsYXlvdXQsIHdoaWNoIGlzIHRoZSBvdGhlciB3YXkgYXJvdW5kLg0KVGhlIG51bWVyYXRvcidz
IGxlYXN0IHNpZ25pZmljYW50IGJ5dGUgc2l0cyBhdCB0aGUgbG93ZXN0IG9mIGl0cyBmb3VyDQph
ZGRyZXNzZXMgYW5kIGl0cyBtb3N0IHNpZ25pZmljYW50IGJ5dGUgYXQgdGhlIGhpZ2hlc3QsIHNv
IHJlYWRpbmcgdGhlDQpoaWdoZXN0IGFkZHJlc3MgZmlyc3QgYW5kIHNoaWZ0aW5nIGxlZnQgZWFj
aCB0aW1lIHJlY29uc3RydWN0cyB0aGUNCnZhbHVlLg0KDQo+IFtTZXZlcml0eTogTWVkaXVtXSBT
aW1pbGFybHkgZm9yIHRoZSBkZW5vbWluYXRvciwgaXMgdGhlIGJ5dGUgb3JkZXINCj4gYWxzbyBy
ZXZlcnNlZCBoZXJlIGJ5IHJlYWRpbmcgdGhlIGhpZ2hlc3QgYWRkcmVzcyBmaXJzdCBhbmQgc2hp
ZnRpbmcNCj4gaXQgaW50byB0aGUgTVNCPw0KDQpUaGUgZGVub21pbmF0b3IgaGFzIHRoZSBzYW1l
IGxheW91dCBhbmQgdGhlIHNhbWUgbG9vcC4NClRoaXMgZW1haWwgbWVzc2FnZSBhbmQgYW55IGF0
dGFjaG1lbnRzIGFyZSBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQg
YW5kIGNvbnRhaW4gcHJvcHJpZXRhcnkgYW5kL29yIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiB0
aGF0IG1heSBiZSBwcml2aWxlZ2VkIG9yIG90aGVyd2lzZSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9z
dXJlLiBBbnkgdW5hdXRob3JpemVkIHJldmlldywgdXNlLCBkaXNjbG9zdXJlLCBjb3B5aW5nIG9y
IGRpc3RyaWJ1dGlvbiBvZiB0aGUgaW5mb3JtYXRpb24gaW5jbHVkZWQgaW4gdGhpcyBtZXNzYWdl
IGFuZCBhbnkgYXR0YWNobWVudCBpcyBwcm9oaWJpdGVkIGFuZCBtYXkgYmUgdW5sYXdmdWwuIElm
IHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNl
bmRlciBieSByZXBseSBlbWFpbCBhbmQgcGVybWFuZW50bHkgZGVsZXRlIGFuZCBkZXN0cm95IHRo
ZSBvcmlnaW5hbCBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMsIGFuZCBhbnkgcHJpbnRvdXRz
IG9yIGNvcGllcyBvZiB0aGUgbWVzc2FnZSBhbmQgYXR0YWNobWVudHMgdG8gdGhlIG9yaWdpbmFs
IG1lc3NhZ2UuIFRoYW5rIHlvdS4NCg==
