Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5837A409298;
	Fri, 10 Jul 2026 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680743; cv=fail; b=U+3poEcrP1brUeLal7ugjjb8g4M0IYL4MYSUdMHtDgkZKPxdCFp8A8bMlcxJgYR5xLm2qGXkU9y7Q5JSkPc8sMvtW56Rg8vRx/dFmaaKbeanqIA+HsuzIBX8bGBXjQXF7p08p/v+9jSVIFXdkb38KaW6p8RplJdWufKLqm15pzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680743; c=relaxed/simple;
	bh=m4jpRPFpBziNu5AAcGf3K7pG8c0U1IW623K+lQESsno=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bhgUjt3XWs7TenwbCdTWYJ702stkDAEQHW7IEbDb1uCj3eYnXIfcaf8vAf1TDIyRAZW7Hxdm9evReOwd+O3zh7bDUGrAaRlMWgYhDNWrdP275PYlmi6c4FQK9onZq1jq+vj8KCSWc6hBZ3D0CNK6KjIhewvVBtO23jEammsHNek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JG5eYmZZ; arc=fail smtp.client-ip=52.101.84.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JG5eYmZZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbHnWZkbfoH+Yxm4vIyLr6dEBl7/2UQKtvYW13WFIIJ/IpTsik5nNq7fl2AZ2/TxrOPDUeKTW1jFOIL1V428zFqD3JO/f5O1mFEWAoOMRl+aernk7TvfYRQqwQA6emeCBEcj4WRGgXIQGoCPJT6cnfu96igk7N2Mz4cD9R36PpfY9gtBEAdV+9IhhJ42+NT50yPQ0U7/CpCLxA8661LLT0bpXCjYMPfIZiQknz07O1f1QaYzKaZEwfJur3K4OG82xYyWjskpMIKUY3UAyYh8C++UV2mIyWSPLnW93IEiPZfUTTLXwcoOGehqgkhPm6ddIidUp7D1Oql7+vvtekkUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4jpRPFpBziNu5AAcGf3K7pG8c0U1IW623K+lQESsno=;
 b=iMcU3p8pa4VRduRlRmcyQaqnIrXyl+fEMxRi7JG2I9iunuyZZ2zoFtzYyRai5c8muBXRFjrMeSnx7Bl2UHNTVDtPKjAEmKwM9I6sNg+n+N1DpsAduWQ3mbbarkpFHLQJpuBJK40RS7FRc9gdGQXmCCcXg6AQ8q8FifR4T5HoyHHBAexMgZY9Ou6e5/7jLdqoXhgcPrDYeVNgVCn1FqWYsJq7bo1xn8rZoUw2TzV1WcZNWAtO11wR8dba1b/QLkVpk4loIjozW2+J5ihm5Mm3hWlruofU7eXXR8YDmJ7jFY4Iwt2NWGMW6ZBBkCfeBGXR+pvIs1iCnZCvXgCc06IBGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4jpRPFpBziNu5AAcGf3K7pG8c0U1IW623K+lQESsno=;
 b=JG5eYmZZjzM6ndT4TaA5lJkq084LhK77+XhCVjUdM1+zBvR1rpO/n/CANBxoa5yoOVZyMNTyIx8S82pVzeQOF88lOIMD9PzzziY7ftHR77Act3AWRL75oM41xcS8hHR538f/ilUSYNfVnio9xuJMROxOl4iwJ9w1wmbeMwJinbacQJo+1J1UMvcoZfpS8E59LYOPBRYDQVXeGAL+m4AFDo9LyzfsXdksY+4wWvK1uQnGRhULaVMiZmOgX65kzK4+p+AQqooK96Fnah7ol2PyRSga0yqFxU7KETqips5gpaxmAeQoO+d3r0E9qmy9JFr1MYX3xoFJpMwZmx9Y1pIU9A==
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DBBPR04MB7529.eurprd04.prod.outlook.com (2603:10a6:10:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 10:52:15 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::d57a:2d06:49d5:9861]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::d57a:2d06:49d5:9861%5]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 10:52:15 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Bough Chen (OSS)" <haibo.chen@oss.nxp.com>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH] arm64: dts: imx91-9x9-qsb: add CAN support overlay file
Thread-Topic: [PATCH] arm64: dts: imx91-9x9-qsb: add CAN support overlay file
Thread-Index: AQHdEFQfLtwBJ56DNUubf4ogabZlI7ZmiZ4AgAAJ0XA=
Date: Fri, 10 Jul 2026 10:52:15 +0000
Message-ID:
 <AS8PR04MB86765A2F83A1492F57D0FFC790FD2@AS8PR04MB8676.eurprd04.prod.outlook.com>
References: <20260710-dts-imx91-can1-v1-1-c78c9c378e8d@nxp.com>
 <20260710101614.BA8A01F000E9@smtp.kernel.org>
In-Reply-To: <20260710101614.BA8A01F000E9@smtp.kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8676:EE_|DBBPR04MB7529:EE_
x-ms-office365-filtering-correlation-id: b2d6e15f-a5d1-4612-fb9f-08dede714dd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|38070700021|22082099003|18002099003|4133799003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info:
 xW8rG9c/KbLgAfD/F5kBnXlPxNoQsba5suYaRhWIOEAdalzWqMDSM8LtBwZ1tAW8JcA8ppebdKEcdMfBX/IoVtUM9t9hOJpMLvm8+oehUq+IW8kFZAtTwd24+OjSBewZdz0f4VgfsIGzUfTJ50JSr7hlLC2kiPE3khzCLQwyW3QSDJBcneVrK5MeNKt/PYXkdeNmB2yRDl8c0pOWAANNeLhRj1TsbyNZCKcY/FDRTv3dR3scncShbREc1srMQ4hNFnXOlb9mB8arQ0oEJs0Dvv6MEWq7KuEvhfmvwfbxufqyVQExcXQ5WPp3xByXXB33/fttu6y/0LzDsoiHwXuAtYg+ClPuX01vhFP96VhkZT2T1jtr9l/LyAxw/HLlv8dMYNILugEsDVm+706n+/mpuFT5PvlpCEM3lkjS+DQ3Ln+8Q4OVGmACJUM/zP7et0ugiQv8UI78o4xbHgq6xHe0UR1ilbCXTwWNbxlg3xOOG54OjE6kdIvSuv74iMSxpFvCV0YP42kD+XEedyo6pd2C8nDTBLIy2WVGwVZCuAVg39ZEVEWlE+1T1K6QBBpW/LZU1b9ZAFsLsvwtFPO0Tn/ii9XWcoLO9VcnsnFNfICyyKWzlRh63KXp0JCBJSTBADDtBDWlCFXh2g7eKGOhDd2qDTvex6oRHdcERg6WJtIS3VE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(38070700021)(22082099003)(18002099003)(4133799003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Y3FudStESnVqcGJtK0xrZGJncHZKZ004Nlc2SEVlUVdrdDJ2MDJWMlBxZy8y?=
 =?gb2312?B?a3ZSOWw2cm5qbWcwbWxTTDVNWDBNTlpBeTVNNVJuYTVPTmFzSEx5RjV2Qng3?=
 =?gb2312?B?Q0ZNNWlGSjMrdE4xWXpVdVdpWUVWbFNRVnJCZ1p3eVhlUXJKUFFiTy9UeENL?=
 =?gb2312?B?NGkxNFYrcGszcnhlODd2VnJMeU1qeGw1ejQxT2pmdnZGUjZtb1RMNnA1SUJx?=
 =?gb2312?B?bGg1VFoyMXJma0FGcFMvSVM0Q1VQTnBTVFY0RGNFNU80YjBlOXFmZlJNcXVr?=
 =?gb2312?B?WDFkQU5ybXRZSzVJSGJXQ2JORGRmWHVFSzZhTTkzTUZ1WWFPcUNrUFBWY0s2?=
 =?gb2312?B?aG9ZZnhMVUk1M29oQUJCdVQ5R1hBZThMNnpRUUhFbFJsbnRHSnEwbjIyMnJM?=
 =?gb2312?B?UEljRVBKTkk0TE01anNqY0V2Tjh1V2FsWHViL3cxeHpCdGR0ZjQrQXRaQU1a?=
 =?gb2312?B?VS9ybTQ2NG9MT1ovNmErekR6M3lMQnFINWRFZ2hEV001TVZJSFYyQndjZExX?=
 =?gb2312?B?MDBOdENiMk10a0NFRTRhR1NwMW94TC9jNVFuZWFGd3BKYW9Wa0NicDhpWmJZ?=
 =?gb2312?B?dmsvTC9KTHVONUtOS3FjVXQ0My9yZHRjdDJiMDUyQ0pHK2NtMkhhUFNTcmpG?=
 =?gb2312?B?L0wxckRqcVR3NjJJQStMUVpURlhLLzBmUkIybFNiVjJRQkVSK2RDMHNBV256?=
 =?gb2312?B?RWpSQlJZaGJYV3JkTENKdUF6NmF5TkVicG1YUkNDMDZEbkpmdGRrYlluenJ5?=
 =?gb2312?B?ZUIvclFSdUgxbDdBbVRlZW5GbEJuTmtITVphMVZMdG9veG00Y2wyOW9taXY0?=
 =?gb2312?B?V3M1amIwd3UzRFdkZ0l5dVVDNmMwNWpFT3pRZEt0VmZ2SGpZR2VsdElrZlVn?=
 =?gb2312?B?TU9KK2FWVVJOYXhJeGVmN1U2ZUlUd2pBcEZFUzIrTnZ6dnhzYUQwVWk2eVhp?=
 =?gb2312?B?ektMVlZINzU0eFc4QVdUTkxVNEhvbGZHNmFJNjJhdDZzSjZQaUhidGZoc2hI?=
 =?gb2312?B?Q0k1cFlZanhDdGlqUDNvUFB6TkJRTEJGYU5vOCtqalc3a3JjeFAxSkJwU3FG?=
 =?gb2312?B?WnhnVnJ5TEJuYXRvZkUxQjh3MVZqdkVWdWFEcHZsSnlKNm1LVkVtQUFvNHFX?=
 =?gb2312?B?bURUWTdtNzJWdzhPa253S2gzUHdVT0JiUWRtc0xtRUR1TldiTHJuR25iTVYr?=
 =?gb2312?B?d2FFby9yWnNCajdBSk5LU0ZraHJRMkZ1OFBzZi9EMDJhY1N4UVFONlk4TEND?=
 =?gb2312?B?RTd6WXRhZFhTQWNOcG1zWFZrVHlYb1laM04rRU5MV1NiR3U2azNGR1hiOUVD?=
 =?gb2312?B?SVUzUGhpMzJQYkFkY01Rc3VQSDJKYnlFUnpsOGM3bFNOaGtUWnRIcGZxVW00?=
 =?gb2312?B?V05mc1UzMy9PSk96c0F2S2g0b0xxang1OExGUFBqQUZ4by9PUUlaVW9ZUldw?=
 =?gb2312?B?eEN5YXpET0JDV2xDb21tS09ndkRnek1INW5CUTNrMFRodldCVmpLRWY4S3VJ?=
 =?gb2312?B?VmRqSkg2UEhMTG1YZlpIUG8wVHgxTU55MkpKaTE4ZWFKZ2k1c2NmRlNNVkg2?=
 =?gb2312?B?VjBqNC9sckpsUHdFMDk5Um9MUGNqVi94cld4Q2VmTDg2c2NJUmJsaEN6WFAy?=
 =?gb2312?B?enFweHI3OEc1VjBJczZiNUFGeHUyU1M0emU1cWpLR2QvSGtldzdLbk9SV0w3?=
 =?gb2312?B?TXk1ZWxsT0NmcjBPdlFiOCtNUUhZVlZ3OEJ1cW1PcEFKQm9rSU9mNXo5SFIr?=
 =?gb2312?B?UGNnTHY1WTdSd1dkanhoWFVaSWxPM1N5V3BTR0JlVlFNMjc5c203NzV6Nitt?=
 =?gb2312?B?Z3JybTEwaGJ5WU03OG9LWjhSSXk3QkZWdCtnaGs2akg4ay9iMFZMVm5YM0F6?=
 =?gb2312?B?L0luejZjbXFyMTY0UCtLeXJFNk8yVHU1TjcvS1pFUXZubnhqdGhIS3l6bEdk?=
 =?gb2312?B?bXJUNGJXeE9IOTlEaVR6RUYvUXpqYjJwb095QzJ6L25IbEtmaG9FR2w1S252?=
 =?gb2312?B?RlQycys3YnA2c0gwb05WNVVMS1RZblhISnNtSFJCSW40TWhxSmc2aTNFd3FE?=
 =?gb2312?B?ZDFhOW82OGdiSTF6VG51K2xOVjBOK3dPMy9yMnkyRkpMUzNNQ3hLbS9Mb2dx?=
 =?gb2312?B?VEhPRUYwSjJ3S2dMTVVscC9MaURkZFFsKzVzRkZRcElOVnZ3VnczMTYyeVY1?=
 =?gb2312?B?aEplVVNEVmJFTnNVUnV4U0tHZmpic2taL2l1YUpnaGpocE5GN00yVjc3Wm5J?=
 =?gb2312?B?Y2NYTCtqS2lNaE5ZK3BTbGtzcWNVV3FlVzBCYnNGK1NJT0V4WVViMjVHemZq?=
 =?gb2312?Q?PqD7NOvDPII5WKgQMS?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d6e15f-a5d1-4612-fb9f-08dede714dd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 10:52:15.1190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vgWB1XUI0WV/dh6a1bzQNhfdAdJfguv3JFTRzocAOVoab2kWLMFC4ZZu2gaKVD2CzSY5HxxBlV2wHcBfyiXR5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7529

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiAyMDI2xOo31MIxMMjVIDE4OjE2
DQo+IFRvOiBCb3VnaCBDaGVuIChPU1MpIDxoYWliby5jaGVuQG9zcy5ueHAuY29tPg0KPiBDYzog
RnJhbmsuTGlAa2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IHJvYmhAa2Vy
bmVsLm9yZzsNCj4gY29ub3IrZHRAa2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiBpbXg5MS05eDktcXNiOiBhZGQgQ0FOIHN1
cHBvcnQgb3ZlcmxheQ0KPiBmaWxlDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0
aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKQ0KPiB0byBj
b25zaWRlcjoNCj4gLSBbTG93XSBUaGUgZGV2aWNlIHRyZWUgb3ZlcmxheSByZWZlcmVuY2VzIGFu
IHVuZGVmaW5lZCBwaGFuZGxlDQo+IGA8JmNhbl9mdW4+YCBhbmQgb21pdHMgdGhlIGBwaW5jdHJs
LWdwaW9tdXhgIG5vZGUgZGVzY3JpYmVkIGluIHRoZSBjb21taXQNCj4gbWVzc2FnZSwgY2F1c2lu
ZyBhIGJ1aWxkIGZhaWx1cmUuDQo+IC0tDQo+IA0KPiAtLS0gUGF0Y2ggWzFdOiBbUEFUQ0hdIGFy
bTY0OiBkdHM6IGlteDkxLTl4OS1xc2I6IGFkZCBDQU4gc3VwcG9ydCBvdmVybGF5DQo+IGZpbGUg
LS0tIGNvbW1pdCBiYTNhMTM3ODA5MzQ0NWMzNGRiZGQwMzRhODI5NmU3YWFlYmRkMGRhDQo+IEF1
dGhvcjogSGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiANCj4gYXJtNjQ6IGR0czog
aW14OTEtOXg5LXFzYjogYWRkIENBTiBzdXBwb3J0IG92ZXJsYXkgZmlsZQ0KPiANCj4gVGhpcyBj
b21taXQgYWRkcyBhIGRldmljZSB0cmVlIG92ZXJsYXkgdG8gZW5hYmxlIENBTjEgc3VwcG9ydCBv
biB0aGUNCj4gaS5NWDkxIDl4OSBRU0IgYm9hcmQuIEl0IGNvbmZpZ3VyZXMgdGhlIFRKQTEwNTdH
VC8zIFBIWSBhbmQgc2V0cyB1cCB0aGUNCj4gQ0FOMSBwaW5zLg0KPiANCj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTEtOXg5LXFzYi1jYW4xLmR0c28N
Cj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkxLTl4OS1xc2ItY2FuMS5k
dHNvDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAwLi5i
ODM0M2Q2NTNlNTExDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDkxLTl4OS1xc2ItY2FuMS5kdHNvDQo+IA0KPiBbIC4uLiBdDQo+
IA0KPiA+ICsmZmxleGNhbjEgew0KPiA+ICsJcGh5cyA9IDwmZmxleGNhbl9waHk+Ow0KPiA+ICsJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArCXBpbmN0cmwtMCA9IDwmcGluY3RybF9m
bGV4Y2FuMT4sIDwmY2FuX2Z1bj47DQo+IA0KPiBbU2V2ZXJpdHk6IExvd10NCj4gRG9lcyB0aGlz
IG92ZXJsYXkgYnVpbGQgc3VjY2Vzc2Z1bGx5PyBUaGUgZGV2aWNlIHRyZWUgb3ZlcmxheSByZWZl
cmVuY2VzIHRoZQ0KPiBjYW5fZnVuIHBoYW5kbGUsIGJ1dCBpdCBkb2VzIG5vdCBhcHBlYXIgdG8g
YmUgZGVmaW5lZCBoZXJlIG9yIGluIHRoZSBiYXNlDQo+IGRldmljZSB0cmVlLg0KPiANCj4gVGhl
IGNvbW1pdCBtZXNzYWdlIG1lbnRpb25zIGEgcGluY3RybC1ncGlvbXV4IG5vZGUgZm9yIGNhbl9m
dW4sIGJ1dCBpdA0KPiBzZWVtcyB0byBiZSBtaXNzaW5nIGZyb20gdGhlIHBhdGNoLiBXaGVuIHRo
ZSBNYWtlZmlsZSBhcHBsaWVzIHRoaXMgb3ZlcmxheSwNCj4gd2lsbCBmZHRvdmVybGF5IGZhaWwg
ZHVlIHRvIHRoZSB1bnJlc29sdmVkIHJlZmVyZW5jZT8NCg0KVGhpcyBwYXRjaCBpcyBiYXNlZCBv
biB0aGUgZm9sbG93aW5nIHBhdGNoIHNldDoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2lteC8y
MDI2MDcxMDAyNDIwNC4zNDYyNDQ0LTEtY2hhbmNlbC5saXVAb3NzLm54cC5jb20vVC8jdA0KDQpS
ZWdhcmRzDQpIYWlibyBDaGVuDQo+IA0KPiA+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiA+ICt9Ow0K
PiANCj4gLS0NCj4gU2FzaGlrbyBBSQ0KPiByZXZpZXcgoaQgaHR0cHM6Ly9ldXIwMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGDQo+ICUyRnNhc2hpa28u
ZGV2JTJGJTIzJTJGcGF0Y2hzZXQlMkYyMDI2MDcxMC1kdHMtaW14OTEtY2FuMS12MS0xLWM3OA0K
PiBjOWMzNzhlOGQlNDBueHAuY29tJTNGcGFydCUzRDEmZGF0YT0wNSU3QzAyJTdDaGFpYm8uY2hl
biU0MG54DQo+IHAuY29tJTdDMDBjMDlhMWRhYWIxNDdjMzA3NzYwOGRlZGU2YzVmZTQlN0M2ODZl
YTFkM2JjMmI0YzZmYTkyDQo+IGNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzOTE5Mjc1NDIxMDgz
MzkzNCU3Q1Vua25vd24lN0NUVw0KPiBGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1Vz
SWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lKWGFXDQo+IDR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJ
bGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0YT03NGRJNmw0DQo+IFhhSHNMZzlxd2Zq
TzA1WDI4NG9xMyUyRmwxMUswZUtsaktQc2p3JTNEJnJlc2VydmVkPTANCg0K
