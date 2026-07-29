Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E27638E8A8;
	Wed, 29 Jul 2026 17:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347326; cv=fail; b=KmmR6jcW1pAfkV6MD/9j4LBywLsaO/roc8bR9aKblUzzwpV65BYfh8HiL1c+2q3AbSajU5chjAcZQSkytB84sWU56AfDFPX2pHTNm42ASVLyUzFzLuR9klEVFXiS35SG+LAiOXVBdxEZfl6znmF2RQzR5fVtd+xgFuZ5+n73Ghk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347326; c=relaxed/simple;
	bh=pVdSBSBdaXsbXNHvRj+L3JIthpZ/GoeOqmBq8KcEnH8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AN2cNTUmiJWGihnNCO1XaqiGzg+U0Gk9chNh8KUj6feLCG0tpgxxYDuxxRFUIKuy+ocm/cpGKDZDsk8z4tLpoSYeSK6yucLO6pYNxpH9Cc+4CzfAMAwd9bwyM0GLjK4bG7GQjvlrqoqinSmXEXIaXThjltDD1I1VwjyPcLzixqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vyveupLb; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vyveupLb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ce/t3o/fGBKgCcMB+9oZL2PGXOBLZpRFwt5BmIp3U1LKUtBr7i9PBJOho1QscT1YnSEF1qGmNqWYJ7S9FrGCcErby8wQ767Yq3dh6Z3zwj9uvJlvz67GmmjRH0XYOsV/2PPEEsgXqkyifn6EZucTxUdi4lgPSnWGsNXfcMSkpcGTyO4KSpzzByKT2zEdPJMUOowwkFfCHrc78PpoiBmMj814iXp/b8HfBNxzp0hlyaxZ8H2Hjt4mbEeB4eqpdx76yRyAA+f13wQ4CySfnq8JcZyQZq44RFqKgNRWsEC/y1CFLTmvkAqLv/MTyV9jvvP5pjHXtf0yJUL+lpXW7m3rsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVdSBSBdaXsbXNHvRj+L3JIthpZ/GoeOqmBq8KcEnH8=;
 b=OxdSUILrtN73WK3effJdodOkuXuBcaVxbexhH9+NYGjcgWGir+DvvC3TTesyzC+f3G1hRkhM0O1EL40vfSk9YpCi8DAzX3RohC6XlLtb1HtOvyxi6aHLt5GC3aCijDyVAD02LRjmxHLYYq5OdDojhvLqruYXrDyby/qVuLLl3lhvjDVL0mHF8ICO8H3jqqYEvVU7Nfjg8zsjrJ4iPpVDJyGq9Ds30iveds8+oqCgCozL4m2XiiJhDY536wcqKhTbUFMJAmJqanKM0X9u5OCZuKYto4RS0ygCHZOzlzeXVZsm+fXJ9p242tB7uh/rbYUROyvpm1fVd3XnTfhsNnhR9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVdSBSBdaXsbXNHvRj+L3JIthpZ/GoeOqmBq8KcEnH8=;
 b=vyveupLbvosV8EJSKG52vXnP4bK6g9jR7FylADUFb9FkKQi/B3a32ilT9oFELLOFTAq63J86dxPQ3sgI15X8mbUo3S43t2K8yUVry9StCqi27zkJf8vE9BuSTyrpsPjqKBAoNhk0bRjngrBxu+/Ja1FdS2hsSzoXCBqhZvRXiW+mpljjNApTB0OkOC9nSLBdAinSkuurVv2B0ts7Ds/hl6ss/93ImT24MKsqJMQj0PrYHc23/PbbhD9V/trlzPz+SzIDXg5KxocdIchJKsf/WINMA3VMQpuXHniuJWiOGfQ0kp46sOd/zmzVYqxF+PJ2vx9NnYH/0ffhTuH56ORi4A==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by DU2PR04MB8840.eurprd04.prod.outlook.com (2603:10a6:10:2e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 17:48:41 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 17:48:39 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>
Subject: RE: [PATCH v31 4/7] firmware: imx: device context dedicated to priv
Thread-Topic: [PATCH v31 4/7] firmware: imx: device context dedicated to priv
Thread-Index: AQHdHz+0QUOOYKASZ0eFz9kFFgSkMLaERI8AgAAOxZA=
Date: Wed, 29 Jul 2026 17:48:39 +0000
Message-ID:
 <GV2PR04MB1227106F264A34960FC56CDBF95CA2@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
 <20260729-imx-se-if-v31-4-e59af7adb784@nxp.com>
 <20260729100340.C6A401F000E9@smtp.kernel.org>
In-Reply-To: <20260729100340.C6A401F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|DU2PR04MB8840:EE_
x-ms-office365-filtering-correlation-id: 4db77c7e-7673-4d99-904b-08deed999fab
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|376014|56012099006|4143699003|11063799006|10067099003|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 BUT6vAlqF3pKjUlYOeJDQRYn+hzmt0Wjt/aO9cJT1mEz4JB2MXoz6mnP6qP57I2rBDgWzkZQ4xHm0XD4S8V6MKl1vCgdqR8VBnjDqUkOv988GcFIA7Schyt8+wCMajNBdYLJbAjdX/Uvzbkj9hNNwAL8peWlG9NidxMDXUoRA1sFBZHKnN6qY4dw/5cDDzGI06cmPJJaJsQOHD1Xn3SN2rPkJY1bVlpPqZ/iQ6JvBznDbFPj6iYrQj48upFfEKK3AuQnnR2of9r9NLqc3uxUBUPV7LCzowsXdMVpnz8xUy17k/C1UXGMvj1nGPQheblfk36PHGYrZnlIrG+9Be9nyY0gSR+zt5nw5PzJF4UAeKT+zJ5lADN+S5O/NXDCz8CL4X7WfuQn+jQe5lPshmS9yXzcx5I6pteTRHoP0QSFXB7EJ1YHu+8eL7ZoMpbbihkRSEYBYR14SWp6bC1oCW7Ebp9lxLC1GOpPFmZV3ly3HLlj/2b+0pCzbrjBCHHiGcNJHt3/9zvFJIXVnosqiFjH6hBzvm8+KOVMs1xsBeawJ4ZhigYiaiLTzzyU2xdGOAqkjeOY1BgChDS/pssqPnjr1frVRHfC9GnAMz0qTWaQcL9m0Gp7z2YniZvdI2WSv9FKHw1szliT39ZOS+AHoxxGKHXFZfglrG5cmGitL6GxKqfhs8Qp/QptEdJ4cGadg3KMQnocRjfd2Smw4pAsPP7bwg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzJ4T1dZTUM2aFJES1pxS1EvSmtsaGROTFlMNFdtT2pFZGJUTVJqUzl1eHFO?=
 =?utf-8?B?alBLSnNwK1lhc0hPUmxrK2JzbStzeEZuYmZST0Z1TE5kaDVJaVRsbml4QmZt?=
 =?utf-8?B?ck9uaVc4VWtJVzdPWXpLc2s5SXNIelc3bjVTdytySWNzYURmRXdwYjF5V3NS?=
 =?utf-8?B?MS9RbkFtRmQ3c09yUUszUDlUSWhIVzNQb21mOVE5d1FCVlQvK0k1K3g3eDVE?=
 =?utf-8?B?VERPbktGMS81VGt4d2JxYUdVOW5BVjNqVU03cVg0R3hXdGNlVkFSUU5nNTc1?=
 =?utf-8?B?RGxocEF4U1owaTdic054YjdXbVNmU1NrUTYyd05GMmcxdUVBYXFELzM1MDRy?=
 =?utf-8?B?Zlp1Y3BaZitDcVhYWTlPeEwzZ2R1OGpSYjZEN0pOeThFaTBiRE5tV3dIZTVx?=
 =?utf-8?B?V1NjTktSZUFRR0FUcXpjSmJLM05VdnhRbWNCNG1qbzFlbGVzaG9HVSt6R0VI?=
 =?utf-8?B?c1NZN2F1NjR3R1ZiN3Roc3czMG11K0h1K3ZoQTFxbnZsUnYxa3J3dStsQmIv?=
 =?utf-8?B?TnFjTkJ0NlhoT0VpTlB6TzBtN0FTcXdmeVJBSE50TVpjREdiU250SUYrNno0?=
 =?utf-8?B?MWtqNkJSVFBybzlBNmZrU01NbnZ1RHNZTmhUajR3YzJsUFduYlJuektkZm43?=
 =?utf-8?B?TVBqdWgvbG0vcUR2RlE1R1ZZM1lXTnR2ejlYdkxZNDZudUdSMkxtaXh4RU5u?=
 =?utf-8?B?U2VaQjU2SEwvc1VrWWJCcjM1R0gvemhOK1dkUXd3ZXdDZ0ZBU2RyMGlwNThn?=
 =?utf-8?B?Q3g1b0c0WUJyR0xoczF0M3hTOG9aWU44VUl5L09KbXpLUnQwV2dSTTQ5aDJU?=
 =?utf-8?B?akRET043ODVSQWlnOFl0S21yRER1TzBRZlhXUXBDeHBWb1c4TzUySkVJU0tC?=
 =?utf-8?B?c3pBNkswWkI3YW1CWXNROEM4TlZsTXB6dzQ4ZGFVZVJkMno2MTBCTS9IWVpJ?=
 =?utf-8?B?c1d0TVJJUjg0MXRVOE1FQUp1RHplR2RZMnp2Tm5ZUkh3YXZUTUIvOXlqZTNs?=
 =?utf-8?B?LzBWbFRkSW1WeGI1dlM4enplQnMrSXhIaVZkZjN6eHdjYUhWeUJPOElvMnZz?=
 =?utf-8?B?aW4vaVdBSUlobmVXWG1BSFpRTDM2dFczYStkUWp3NXBYSW1vRnh3K2hBb3Q3?=
 =?utf-8?B?SlAzUU9QcUR6MERGbzg3cFVKVHorRER0bnBpejNva2xmRUFDNFhkQUVjSlJn?=
 =?utf-8?B?dTRjTEpvaFM1SUhlZmR6a2ZVTjFtanlXV2NsM0F3bGhZS3RQQm1JQkpLQmR1?=
 =?utf-8?B?SHhXOCtBNXRneHQ0elg1M1ZuQmNaaVdnQUpLYWFuMkUrdWtrcnB3TUxiMlBr?=
 =?utf-8?B?TVM3VHh3V1Fydm1sZ2xYRVNFQ05lYkd0WWVzM1EwOHpZNGNBL29VTXVlUThw?=
 =?utf-8?B?RjRsZWEzRTFqZDBwLzcxNjFld3FKMFpLNDJOb2dXOWcwVURhbWxtZVZxd1hF?=
 =?utf-8?B?aWRwYkhHYVlFMnEvTThjRVFnZWVzUStuVnZFRThYMnZmSXhSeWZ4c2pjb0Rs?=
 =?utf-8?B?WklYWlpHb2FUYlpJSVpuMlR3MHNaSmV6VitkY20rR0paY2RkbUozSVhnbDVK?=
 =?utf-8?B?d1ZWLzhhTUNCb3VLWU9tZitmWjk3TlAzSkgrd2hIUklpS2orcVJUdWZ0amlv?=
 =?utf-8?B?dVU2aG5uUzVabW1GeDhwNHNOcTRZbDNIVjNTWVR6cjdkUE83WCs3eVF1Ympv?=
 =?utf-8?B?Y0NwTEtUcnozeU0yWWxZbzE3Z3hvMzhVclYweWxvcE00bXlIWUc1WC9pNm9W?=
 =?utf-8?B?a093NzhhT2MwU3F5U0FVZTRGMFoxRi9nYmNyVTJmV3JZMmFRcGd3Tm55TGx6?=
 =?utf-8?B?alRUdkFubXlzYkV3L2Uyajh6WWViZVk1Y294enQzM3pldm1tOTR6OHlGbmV4?=
 =?utf-8?B?MU02eUR2eGI2TXZBai9UTTFmd3BUR3J1bm5KRTgvYW15RWtPbG1BbTJkT1dU?=
 =?utf-8?B?cFVyVmsvMzd0ZWx4NEsxdkVnSmpyNXZpbS9KQktUcGE4aC94SlBxbmNKbHdJ?=
 =?utf-8?B?RVVwcHFLdnRMYjdNV3hlRWR4WVF2WitNemNDSlJuemRtbHpoMnY4V0syTlJU?=
 =?utf-8?B?Q1NYOElYVDRHZTRKa1M1QUZwaWU1c2FDU09RTU8wNWVhZVM5T3FLTG9jbTFY?=
 =?utf-8?B?SW9oc3Z4RDl1MXhRUzRqT1NYYmF1Tm84SWgrZzIyN2N3SVY5ODhONVVhOEVY?=
 =?utf-8?B?VHEyeFlLUmd1RUhITUpZM0VCTUZlN25iTndiNVE1TllqaXliU0dsL1FFaXdB?=
 =?utf-8?B?OTdMMFVLTXN6ZmtVWm9SNXdIYnIxcDZqSENERGorZExocjA5dTVOdnZ6SmVL?=
 =?utf-8?B?d0tiTmlpVkNjSzlQUjIreVlOMkxKLzVJU2ZVTmZDT2U3SWNSYVFwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db77c7e-7673-4d99-904b-08deed999fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 17:48:39.7627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: //Yghb+Fa8uw3MRntPIR9HZ2nvNR1Z1WNN+InqgXmUPjbqeUSN8WbZXO5rB9Fu8/hoVkq9RK5G4ooNfGgVW3Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8840

PiAtIFtIaWdoXSBzZV9pZl9wcm9iZV9jbGVhbnVwKCkgZnJlZXMgcHJpdi0+cHJpdl9kZXZfY3R4
IGJlZm9yZSBmcmVlaW5nIHRoZQ0KPiBtYWlsYm94IGNoYW5uZWxzLCBjcmVhdGluZyBhIHJhY2Ug
Y29uZGl0aW9uIHdoZXJlIHRoZSBtYWlsYm94IFJYIGNhbGxiYWNrIGNhbg0KPiBhY2Nlc3MgYSBm
cmVlZCBkZXZuYW1lIHN0cmluZyBvbiB0aGUgZXJyb3IgbG9nZ2luZyBwYXRoLg0KDQpDb25maXJt
ZWQuIEZyZWVpbmcgcHJpdl9kZXZfY3R4IChoZW5jZSBwcml2X2Rldl9jdHgtPmRldm5hbWUpIHdo
aWxlIHRoZSByeA0KY2hhbm5lbCBpcyBzdGlsbCBsaXZlIGxlYXZlcyB0aGUgc3pfbWlzbWF0Y2gg
ZGV2X2VycigpIGluIHNlX2lmX3J4X2NhbGxiYWNrKCkNCmZyZWUgdG8gZGVyZWZlcmVuY2UgYSBk
YW5nbGluZyBkZXZuYW1lLiBGaXggaXMgYSByZW9yZGVyIGluDQpzZV9pZl9wcm9iZV9jbGVhbnVw
KCkgKHNlZSB0aGUgbGFzdCBodW5rKS4NCg0KPiA+IEBAIC0yOTQsMTMgKzMwMSwxNCBAQCB2b2lk
IHNlX2lmX3J4X2NhbGxiYWNrKHN0cnVjdCBtYm94X2NsaWVudCAqbWJveF9jbCwgdm9pZCAqbXNn
KQ0KPiA+ICAJCXNlX2NsYmtfaGRsLT5yeF9tc2dfc3ogPSBtaW5fdCh1MzIsIHJ4X21zZ19zeiwg
TUFYX05WTV9NU0dfTEVOKTsNCj4gPiArCQlkZXZuYW1lID0gc2VfY2xia19oZGwtPmRldl9jdHgt
PmRldm5hbWU7DQo+ID4gIAkJbWVtY3B5KHNlX2NsYmtfaGRsLT5yeF9tc2csIG1zZywgc2VfY2xi
a19oZGwtPnJ4X21zZ19zeik7DQo+ID4gIAkJY29tcGxldGUoJnNlX2NsYmtfaGRsLT5kb25lKTsN
Cj4gPiAgCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzZV9jbGJrX2hkbC0+Y2xia19yeF9sb2Nr
LCBmbGFncyk7DQo+ID4gIAkJaWYgKHN6X21pc21hdGNoKQ0KPiA+ICAJCQlkZXZfZXJyKGRldiwN
Cj4gPiAtCQkJCSJDTUQtUkNWRVIgTlZNOiBoZHIoMHgleCkgLi4uIiwNCj4gPiArCQkJCSIlczog
Q01ELVJDVkVSIE5WTTogaGRyKDB4JXgpIC4uLiIsDQo+ID4gKwkJCQlkZXZuYW1lLCAqKHUzMiAq
KWhlYWRlciwNCg0KVGhlIGNhY2hlLXRoZW4tbG9nIHBhdHRlcm4gaGVyZSBpcyBpbnRlbnRpb25h
bDogZGV2bmFtZSBpcyByZWFkIHVuZGVyDQpjbGJrX3J4X2xvY2ssIGFuZCB0aGUgZGV2X2Vycigp
IGlzIGRlbGliZXJhdGVseSBlbWl0dGVkIGFmdGVyIGRyb3BwaW5nIHRoZQ0Kc3BpbmxvY2sgc28g
d2UgZG8gbm90IGxvZyB1bmRlciB0aGUgbG9jay4gVGhlIHBhdHRlcm4gaXMgc2FmZSBhcyBsb25n
IGFzIHRoZQ0KcHJpdl9kZXZfY3R4IHRoYXQgZGV2bmFtZSBwb2ludHMgaW50byBpcyBub3QgZnJl
ZWQgd2hpbGUgYSBjYWxsYmFjayBtYXkgc3RpbGwNCnJ1bi4gVGhhdCBndWFyYW50ZWUgaXMgbWlz
c2luZyBpbiB0aGlzIGNvbW1pdCdzIHRlYXJkb3duLCBub3QgaW4gdGhpcyBodW5rLiBObw0KY2hh
bmdlIGhlcmUuDQoNCj4gPiBAQCAtMzM1LDE0ICszNDMsMTUgQEAgdm9pZCBzZV9pZl9yeF9jYWxs
YmFjayhzdHJ1Y3QgbWJveF9jbGllbnQgKm1ib3hfY2wsIHZvaWQgKm1zZykNCj4gPiArCQlkZXZu
YW1lID0gc2VfY2xia19oZGwtPmRldl9jdHgtPmRldm5hbWU7DQo+ID4gIAkJbWVtY3B5KHNlX2Ns
YmtfaGRsLT5yeF9tc2csIG1zZywgc2VfY2xia19oZGwtPnJ4X21zZ19zeik7DQo+ID4gIAkJY29t
cGxldGUoJnNlX2NsYmtfaGRsLT5kb25lKTsNCj4gPiAgCQlzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZzZV9jbGJrX2hkbC0+Y2xia19yeF9sb2NrLCBmbGFncyk7DQo+ID4gIAkJaWYgKHN6X21pc21h
dGNoKQ0KPiA+ICAJCQlkZXZfZXJyKGRldiwNCj4gPiAtCQkJCSJSc3AgdG8gQ01EOiBoZHIoMHgl
eCkgLi4uIiwNCj4gPiArCQkJCSIlczogUnNwIHRvIENNRDogaGRyKDB4JXgpIC4uLiIsDQo+ID4g
KwkJCQlkZXZuYW1lLCAqKHUzMiAqKWhlYWRlciwNCg0KU2FtZSBkaXNwb3NpdGlvbi4gT24gdGhl
IHJzcF90YWcgcGF0aCBkZXZuYW1lIGlzDQpwcml2LT53YWl0aW5nX3JzcF9jbGJrX2hkbC5kZXZf
Y3R4LT5kZXZuYW1lLCB3aGljaCBmb3IgYSBwcm9iZSB0cmFuc2FjdGlvbiBpcw0KcHJpdi0+cHJp
dl9kZXZfY3R4LT5kZXZuYW1lIC0gZXhhY3RseSB0aGUgb2JqZWN0IHRlYXJkb3duIGZyZWVzIHRv
byBlYXJseS4gTm90ZQ0KY29tcGxldGUoKSBoZXJlIHdha2VzIHRoZSBwcm9iZSB3YWl0ZXIsIHdo
aWNoIGNhbiBkcml2ZSBkZXZyZXMgdW53aW5kIGFuZCBlbnRlcg0Kc2VfaWZfcHJvYmVfY2xlYW51
cCgpIHdoaWxlIHRoaXMgY2FsbGJhY2sgaXMgc3RpbGwgcHJlZW1wdGVkIGJldHdlZW4gdGhlDQpz
cGluX3VubG9jayBhbmQgdGhlIGRldl9lcnIoKS4gTGlmZXRpbWUgbXVzdCBiZSBlbmZvcmNlZCBp
biB0aGUgY2xlYW51cCBwYXRoLiBObw0KY2hhbmdlIGhlcmUuDQoNCj4gPiBAQCAtMzA5LDYgKzMz
OSwxMSBAQCBzdGF0aWMgdm9pZCBzZV9pZl9wcm9iZV9jbGVhbnVwKHZvaWQgKnBsYXRfZGV2KQ0K
PiA+ICAJaWYgKCFwcml2KQ0KPiA+ICAJCXJldHVybjsNCj4gPiArCWlmIChwcml2LT5wcml2X2Rl
dl9jdHgpIHsNCj4gPiArCQlrZnJlZShwcml2LT5wcml2X2Rldl9jdHgtPmRldm5hbWUpOw0KPiA+
ICsJCWtmcmVlKHByaXYtPnByaXZfZGV2X2N0eCk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJaWYg
KHByaXYtPnJ4X2NoYW4pDQo+ID4gIAkJbWJveF9mcmVlX2NoYW5uZWwocHJpdi0+cnhfY2hhbik7
DQo+ID4gIAlpZiAocHJpdi0+dHhfY2hhbikNCj4gPiAgCQltYm94X2ZyZWVfY2hhbm5lbChwcml2
LT50eF9jaGFuKTsNCg0KVGhpcyBpcyB0aGUgZGVmZWN0LiBwcml2X2Rldl9jdHggKGFuZCBkZXZu
YW1lKSBhcmUgZnJlZWQgd2hpbGUgcHJpdi0+cnhfY2hhbiBpcw0Kc3RpbGwgcmVnaXN0ZXJlZCwg
c28gYSBzZV9pZl9yeF9jYWxsYmFjaygpIHRoYXQgaGFzIGFscmVhZHkgY2FjaGVkIGRldm5hbWUg
YW5kDQppcyBhYm91dCB0byBjYWxsIGRldl9lcnIoKSBjYW4gZGVyZWZlcmVuY2UgZnJlZWQgbWVt
b3J5Lg0KDQpGaXg6IG1vdmUgdGhlIHByaXZfZGV2X2N0eC9kZXZuYW1lIGZyZWUgYmVsb3cgbWJv
eF9mcmVlX2NoYW5uZWwoKS4gRnJlZWluZyB0aGUNCnJ4IGNoYW5uZWwgZmlyc3QgcXVpZXNjZXMg
dGhlIHJ4IHBhdGggKG5vIG5ldyBjYWxsYmFja3MsIGFuZCBhbnkgaW4tZmxpZ2h0IG9uZQ0KaGFz
IGNvbXBsZXRlZCksIHNvIGRldm5hbWUgaXMgbm8gbG9uZ2VyIHJlYWNoYWJsZSBieSB0aGUgY2Fs
bGJhY2sgd2hlbiBpdCBpcw0KZnJlZWQuIFBsYWNpbmcgaXQganVzdCBiZWZvcmUga2ZyZWUocHJp
dikgYXQgdGhlIGVuZCBvZiB0aGUgZnVuY3Rpb246DQoNCglkaWZmIC0tZ2l0IGEvZHJpdmVycy9m
aXJtd2FyZS9pbXgvc2VfY3RybC5jIGIvZHJpdmVycy9maXJtd2FyZS9pbXgvc2VfY3RybC5jDQoJ
LS0tIGEvZHJpdmVycy9maXJtd2FyZS9pbXgvc2VfY3RybC5jDQoJKysrIGIvZHJpdmVycy9maXJt
d2FyZS9pbXgvc2VfY3RybC5jDQoJQEAgLTMzOSwxMSArMzM5LDYgQEAgc3RhdGljIHZvaWQgc2Vf
aWZfcHJvYmVfY2xlYW51cCh2b2lkICpwbGF0X2RldikNCgkgCWlmICghcHJpdikNCgkgCQlyZXR1
cm47DQoNCgktCWlmIChwcml2LT5wcml2X2Rldl9jdHgpIHsNCgktCQlrZnJlZShwcml2LT5wcml2
X2Rldl9jdHgtPmRldm5hbWUpOw0KCS0JCWtmcmVlKHByaXYtPnByaXZfZGV2X2N0eCk7DQoJLQl9
DQoJLQ0KCSAJaWYgKHByaXYtPnJ4X2NoYW4pDQoJIAkJbWJveF9mcmVlX2NoYW5uZWwocHJpdi0+
cnhfY2hhbik7DQoJIAlpZiAocHJpdi0+dHhfY2hhbikNCglAQCAtMzYzLDYgKzM1OCwxMSBAQCBz
dGF0aWMgdm9pZCBzZV9pZl9wcm9iZV9jbGVhbnVwKHZvaWQgKnBsYXRfZGV2KQ0KDQoJIAlkZXZf
c2V0X2RydmRhdGEoZGV2LCBOVUxMKTsNCg0KCSsJaWYgKHByaXYtPnByaXZfZGV2X2N0eCkgew0K
CSsJCWtmcmVlKHByaXYtPnByaXZfZGV2X2N0eC0+ZGV2bmFtZSk7DQoJKwkJa2ZyZWUocHJpdi0+
cHJpdl9kZXZfY3R4KTsNCgkrCX0NCgkrDQoJIAlrZnJlZShwcml2KTsNCgkgfQ0KDQpUaGlzIGdp
dmVzIHRoZSByZXF1aXJlZCBvcmRlcmluZzoNCg0KCW1ib3hfZnJlZV9jaGFubmVsKHJ4KSAgLT4g
IGtmcmVlKHByaXZfZGV2X2N0eC0+ZGV2bmFtZSkgIC0+ICBrZnJlZShwcml2KQ0KDQpCZWNhdXNl
IHRoZSByeCBjaGFubmVsIGlzIHRvcm4gZG93biBiZWZvcmUgZGV2bmFtZSBpcyBmcmVlZCwgYQ0K
c2VfaWZfcnhfY2FsbGJhY2soKSBjYW4gbmVpdGhlciBzdGFydCBub3Igc3RpbGwgYmUgcnVubmlu
ZyB3aGVuIGRldm5hbWUgZ29lcw0KYXdheSwgY2xvc2luZyB0aGUgd2luZG93IHlvdSBkZXNjcmli
ZS4NCg0KPiBXb3VsZCBpdCBiZSBzYWZlciB0byBmcmVlIHByaXZfZGV2X2N0eCBhZnRlciB0aGUg
bWFpbGJveCBjaGFubmVscyBhcmUgZnJlZWQ/DQoNClllcy4gVGhlIHJlb3JkZXIgYWJvdmUgZG9l
cyBleGFjdGx5IHRoYXQuIFdpbGwgZm9sZCBpdCBpbnRvIHRoZSBuZXh0IHJlc3BpbiBvZiB0aGlz
IHBhdGNoLg0KTmV4dCByZS1zcGluIGRlcGVuZHMgb2YgdGhpcyBwYXRjaCBkZXBlbmRzIGlmIHRo
ZXJlIGFyZSBhbnkgbW9yZSBjb21tZW50cyBpbiA1LzcsIHJlcXVpcmUgY29kZSBjaGFuZ2VzLg0K
SWYgbm90IHRoZW4gdGhlcmUgd2lsbCBiZSBubyByZXNwaW4gcGxhbiwgYXMgdGhpcyBjaGFuZ2Ug
aXMgcmVwbGFjZWQgYW5kIGNsZWFuZWQgaW4gNS83Lg0KDQotLQ0K
