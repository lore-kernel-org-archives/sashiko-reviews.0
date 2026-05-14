Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADEF33F5B9
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 06:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778739740; cv=fail; b=m2+NFS0ukcRplKHkT+BbnqkznR5yZVnbrAXSMTUlmgWWdq24oIr4oNSlWlhR85sWCwO03/QObK9l8t72PInKI9jbr2AC+2dJByUMLVuz4DUXzbxZRKKzC76OSq7GNMpoTHxveXwTYzEwGvAtEJ/GaZ11jOXyR3iKa6VLoGH0LJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778739740; c=relaxed/simple;
	bh=Y3qNPfv21RI3sTqDGi/R1dmkg5mqrdBdPSRTnRaQtTk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XbizKrRFDYwJqitWREleAWzS+mCJ+vNGI3d7AD5Q0NFuSK2vCBZvzE01d72lvLFcG38hl01uJN1MVEPWH8IOpwFYG1C3lV5th1SC3f/pmZz2kacrFR+3J+4X+ppuJ4WGuinTMOH/bSX8iKEuObqmL+RKm039Ol6xADLugcQ2Ox8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=BsffehDy; arc=fail smtp.client-ip=40.107.209.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="BsffehDy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvXI+P5gGhgckLfHAk3QhQeInCropKsY7Vkj38Aiu/rIsU4E7WnPqcK+aB5W0KiH84RbPw6/U5vlKSSLJI80rfODb5T9YswcU2UeQ1+fiNbauPTrAi6uFHpNIy+S/kvO1RC8rKG9qjwKRWGzRg2zOJJ6zl62HL9cr4iSvu7rhmtt8BfzVxArN1tBobqO4kOjGqMAoKYF0UYuG+/rvIFiS1whxAs6r0H9BaYDEI2qpSOkpdAwbUtlzweH2ZO9aJMaC7lnel0H3js8Je+lM60I0nfX0dy4I+rZ5pPKEb7OauJry6xwoTQItZSvLlE9AHohv9iPq6BBJW1l0XTMZKmcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3qNPfv21RI3sTqDGi/R1dmkg5mqrdBdPSRTnRaQtTk=;
 b=MKBzVvC+uWfr5fG5hynw3ZGc806qNXJjKM9gWPXiTMTFNjyK5Z26bhVc/li6aweILmKA0D9Y3BorCfdKrBUd8XJGBkJMFV+zMAsqHCpsyhECpWZtSgbf2iqt/xNfykXfuktzcx4OxGqUVVFiYThPvNsxz7qvd8ymVSCkebd+qxM/Ng7NuPCUhfM+6ecvBVlpvgRrtGuW8EGvMCtJ7IKRi7ImXqd9j1B3XELRM2fFaZCr5BZBIZCF4nCpL2xJdFwOq9Gitwc97BMq0SHUCRx7J9dkvD7l7j0ntYpY0PzI1id2CD6c3DrjnR3J8bni9sUSlIt6Io19GopUpKfPoBy7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3qNPfv21RI3sTqDGi/R1dmkg5mqrdBdPSRTnRaQtTk=;
 b=BsffehDyU/lXHmYOaYs8vMQPvik1Ue0Wsw5/5McbIlbI5ZoBBWpEIBskH5rLiHiZTJZkLEui6V1ZyYZrF9rTuFJzmzLXDspPkt+wppu6KB7aVQguFMO8f93Xi492yH5Sj1voIjfwSxg5GA4kKVRqkrrkeJrRoU+w6hjI+SiAGV5nC6MGzShChXH/oIGcRKVZ3LknoDCNnQzPogWBg66G4e9U4BIQGOpYzW3jwpPJxm66gpTV7ng05FzkoDSz51Piqv4RwSdf0Va9JQOmqylj6iT6CqIAhJrPzLCkZEQ4DktGxerXXW5pCIQwFRfl+MqYKcmW1t8YUxzfqTjM8hcpqQ==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by PH7PR03MB7439.namprd03.prod.outlook.com (2603:10b6:510:2e7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 06:22:14 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 06:22:14 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: socfpga: use consistent QSPI boot partition
 label
Thread-Topic: [PATCH] arm64: dts: socfpga: use consistent QSPI boot partition
 label
Thread-Index: AQHc4q9OFJx2phq2CUSAe6kIcFD507YM0ccAgAA824A=
Date: Thu, 14 May 2026 06:22:13 +0000
Message-ID: <85252221-f7ec-4918-a054-a9336add346e@altera.com>
References:
 <eff34df0c67d39a26d20ec91eda8dd9e15f9f5cc.1778658884.git.tze.yee.ng@altera.com>
 <20260514024425.5E423C19425@smtp.kernel.org>
In-Reply-To: <20260514024425.5E423C19425@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|PH7PR03MB7439:EE_
x-ms-office365-filtering-correlation-id: a62d8f2d-62ea-4348-1e7c-08deb18123a7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|55112099003|4143699003|38070700021|56012099003|22082099003|18002099003|11063799003|4133799003;
x-microsoft-antispam-message-info:
 gIBAxldqGM39DGYflnkBka3nltQV6P0LqyrBorD07DLR/Codbr3sHDiMhzayDWge6XcWh9FzF2PPzB4XknfHGgpXnUmMDmV1FihA22t04ksJyOd8F0zu6gu4dXg/o6WS+5iwDl4yQh1fbiszNoGpngibsLdVfKZ9Iz6/N46zoy/4IDFmYe8nBjcMNWNa1ZiA9L3cy4FKErGhhpetbAMr6JMXFys2ROn/pxOutzNZ1+1DlXzIqppdrmYSge46U55Y3OPncHVKQiIIPHVjZkkCl/VLeFmLopzXiMxlOc41Yyv8FAuKacVt0CIFDL9jHwE+NGvKPKoZ+ntB5HPHwldEVzIMIzQiqR2tEq2h08yHjUByYnD+KVdOWHI1rfWHYHK9e5uJTAYXG3QaKc8Y1B9Kj7yH/9IGs0BbzCl0xYoFpmrq+G7r0mWCLtnzs4mjo+JrUwjoFWnI+sffY4UkVSHT2KgdP2+pqCoInVUTofjXNML77klALJuYIcFS9o5bfkS9fktYWk0OPZhHxcfsqh4hvOHOQ0KtfkK4kA6A2tnxHjdaJDVpoEK/4Eq1i+CX78y2mK16FMQ3r2LXfGPYZ1Kil6S6rdpk40rQTGJFmjlmBN11dZZkH6R7sLYaWsqbBM1RY2bKP5ek4O6NuK0gKYbEN8UIA7pNLb8yfFiCnCkolts0bCLNch/i8QipGSCo8boT
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(55112099003)(4143699003)(38070700021)(56012099003)(22082099003)(18002099003)(11063799003)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VU9QSzRUNHBBUmlzS2ZBWTdSUjdiUW13RjhCbzlQWENRdGRtS0pKVG8yM1hX?=
 =?utf-8?B?ZnlIMWpxV0dydk4vSlNMcHFacC9QYWZObnlmK2xaMGg0b1dSRGd0UzV5bGlI?=
 =?utf-8?B?UTlIV1NQL3dFOXI5aXY2dnFTUmlGRVlHa3JuY3ZObGpvVW5TanlDZWMwSWht?=
 =?utf-8?B?YmZyODFJTDNIRWJGcGF6SERLcTk0dmVjZUFJSlNmNEJSNVRaTzMxR0JQTTlQ?=
 =?utf-8?B?WWZyZkh0cmxSMHlBVkhCM1VlMlBMUnJIaEhEcGZCMlc0WlRuOFdQVnNkTFJi?=
 =?utf-8?B?eFkyTHMwRTVKNXNrbDNBSFVYQWVGS05zbm82Zy9oVHJ4NzlUVjBtS2VST2dh?=
 =?utf-8?B?ZlBQYlltVXF2WlJQb0xaeFowZGsybGJ4d3EyYkZRZ28wRDBQZmVWTlptYzdI?=
 =?utf-8?B?dzFmTU5vMnE1bTAyTWdiUkt6VFdnci9oR1o0TDdDemthWTF4OUZxK3N2RUJW?=
 =?utf-8?B?L2RQb3JZZEFHNzJnblp5bm9UQUtWVCtPNWVuZ2lCRmd4V1p2YWhZSW10aVVP?=
 =?utf-8?B?VkF4Z2M5UU9McWRtaytjM04rMXZJcGNUS2NPTnE3dlE0cTgrV3dRU1FMaXlw?=
 =?utf-8?B?M1k4TmVmb205Y1V6ek1obGNBd1VYbGdjYStTdnQ3Nmk0MFhGL2pGVlNrTE1v?=
 =?utf-8?B?L3B3SWZkZXg1YlIxY2MvMm12MDJuNnlmVm80MGVrcW1TRi9kV2hScG4vRC9t?=
 =?utf-8?B?OVU0aGNwWEJiWjJtNy8wd0xqVkYyZDM2c3h2RU5PWjltM2NrOE1PUnZvaE1U?=
 =?utf-8?B?T29weUN4d2NVb0FPYjE3QktMNVBtUy9TMDFIWDYxUk9jVFEwNlI0UTVCdUxa?=
 =?utf-8?B?YVhCTE1IRDFXK2t1enFtS0lzUlBPZnB3V3I5V0grRGJPK0FSd2FUZStRcTR2?=
 =?utf-8?B?b3F2K1dDalVWT3IvUWgxWVpFSFl0endYQU02WUVjNHVORUVIZzNKNjZoVCtj?=
 =?utf-8?B?WHZnZGZTU09YL2tPUFh1dUpqTlkyYkZic2Vyd0RpeTV1TG1XVFpETDFNazFK?=
 =?utf-8?B?eGM5V1Z2bGFSempHd2ZwUkdwWHlsQ1JrRHRURWdTa3MyZnB2V05adUNpeGJz?=
 =?utf-8?B?bjJGZ3Zhc3RGZUlZaEw5d1VKMThIaFMvWS82V0huNzg2YVJGSzYwVDUrNFZz?=
 =?utf-8?B?Q29jbWY4NTNNWklGQTdJdTk0R09KdHFaZC9pSEQ0WVZDajdqTVhXWUgrR3Vt?=
 =?utf-8?B?SWxsK29za01SMzZvOXU5cGxvSy9JT2RWckp6M2R1Rys4QVR5SmhHYU9VR3Zq?=
 =?utf-8?B?dmM2M1BvQ0d6SGtaQ0R0NlJDS3djT3VteW5wSVlXMm5MdmJkci9hNGRvTWFL?=
 =?utf-8?B?akhneUQrVURHLzhZOFRSVmRZL1o3a2hSenVoWHIyblIrSFBpYUVYNCtURWc3?=
 =?utf-8?B?WmJEVCtwdllLZXFoSmdheG1YbjI0YWJFd2JNdXdqcmJaTGp4STVxRFh5V0hZ?=
 =?utf-8?B?YXRDOVRRT0kwcTl3YUIyQjVjd1ZqdW9VVUZtSzk2aTE1dTB3NGR4ekJGRnkx?=
 =?utf-8?B?R2ZEb2MxdEM1ZEt3T251WS9xTTJjb05xZmEyQjVLeUl4a0ZuR1B5SnVwei83?=
 =?utf-8?B?QmhqdGZyRE9LaHFqWFVqRDdNOVFJelZkZ2tWeVBzd0ZlcDlWdEpOWUszUTA3?=
 =?utf-8?B?YmVIVDBIR1RjWmdNcmtlSk1rSlNOcGoxeHZ4OEdybytDQU9kZHYzSWtEVjNh?=
 =?utf-8?B?OHVZNFBvMjdXMUp3dTQzRmpBQ2ZPa1BmQ1FxRlZlUWFrMDh5WndSR3ZVSDZr?=
 =?utf-8?B?aml1U2MwVWVZSWljRUVxdG1yOHpPMy80Nnk4Vk83cG11SlIyTk56K0N3NUdt?=
 =?utf-8?B?STNodWhmWE93YWRuYnRTNDRpRXFyeUpoMlJuSGNhdzdUd3dBSi9HQ1Nlc0xo?=
 =?utf-8?B?ZmE4dERCdzBhU1gxWW95UktDczRKZE4yQ1JFdERwNHlEd2Rpay8zN3NiOEY4?=
 =?utf-8?B?YzNaRUY1dXpycDc2TzkvenppV21ISHpYVWlFejkzS0dPUkwwZmJCUWtFUTFY?=
 =?utf-8?B?VGVmTTcyeUFHbEdrUThPTkd4a3M0WXRvZkY2NVdTcXJVYjNzZHIrMDdWOE15?=
 =?utf-8?B?Yk0vOGh1ZnVlR2EwMzlqUXF3RG1DUnlOdG9hZzRMa0JVNU5LV0tOS2xxU0xX?=
 =?utf-8?B?ak5wa29qSjJ1RUhiOHN5ZlhDQVNzSy9icGp4R0pUQ3RYVmxUVktFd2xLYVhN?=
 =?utf-8?B?dUxXQ1J1SFFCTHVMTlJqb29VVG9NK0pSU3ROQng2K1p1MTI5MjA0TmRpS2M1?=
 =?utf-8?B?aTdoYmdWUXZpaTlldVRXTDVMbXZlcmNwOTZHNkpYTzRucG5mNWdEVFZiOHBM?=
 =?utf-8?B?cG52M2V0VmZ4ZitjMnhyOG9XZ2VpV3pqd2Q1ZGtCcGtBNmhtMmJiZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E61F61AB0E9F746BDB1BD2BDA77786A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62d8f2d-62ea-4348-1e7c-08deb18123a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 06:22:13.9673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GtVh6Yi/hPyt2/lmpe7rTfW6Ba6lorRQnEX8Modwe40MhcmgKeASEZEiflf8ysvyyIAw5nKgjSschs7b4r4+jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7439

T24gMTQvNS8yMDI2IDEwOjQ0IGFtLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0KPiBb
WW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHNhc2hpa28tYm90QGtlcm5lbC5vcmcuIExl
YXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2Vu
ZGVySWRlbnRpZmljYXRpb24gXQ0KPg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9u
ISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRl
cjoNCj4gLSBbQ3JpdGljYWxdIFJlbmFtaW5nIHRoZSBNVEQgcGFydGl0aW9uIGxhYmVsIGJyZWFr
cyB1c2Vyc3BhY2UgQUJJLg0KPiAtLQ0KPg0KPiBjb21taXQgNGFkZTBjMWNkMWZiMDM1Mzc5OTgx
MzA2ODA3MzY3OTE0ODZlZGNkYg0KPiBBdXRob3I6IFR6ZSBZZWUgTmcgPHR6ZS55ZWUubmdAYWx0
ZXJhLmNvbT4NCj4NCj4gYXJtNjQ6IGR0czogc29jZnBnYTogdXNlIGNvbnNpc3RlbnQgUVNQSSBi
b290IHBhcnRpdGlvbiBsYWJlbA0KPg0KPiBUaGlzIGNvbW1pdCBhbGlnbnMgdGhlIFFTUEkgYm9v
dCBwYXJ0aXRpb24gbGFiZWwgYWNyb3NzIG11bHRpcGxlIFNvQ0ZQR0EgYm9hcmQNCj4gRFRTIGZp
bGVzLiBJdCBjaGFuZ2VzIHRoZSBsYWJlbCBmcm9tIHUtYm9vdCB0byBCb290IGFuZCBmcGdhIGRh
dGEgdG8gbWF0Y2gNCj4gdGhlIGNvbWJpbmVkIGJvb3QgYW5kIEZQR0EgaW1hZ2UgbGF5b3V0Lg0K
Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2ls
ZXg1X3NvY2RrLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2lsZXg1
X3NvY2RrLmR0cw0KPj4gaW5kZXggMjYyYmIzZThlNWM3Mi4uNWNlODI1ZGQ2YWZiMCAxMDA2NDQN
Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2lsZXg1X3NvY2Rr
LmR0cw0KPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9pbnRlbC9zb2NmcGdhX2FnaWxleDVf
c29jZGsuZHRzDQo+PiBAQCAtODYsNyArODYsNyBAQCBwYXJ0aXRpb25zIHsNCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47DQo+Pg0KPj4gICAgICAgICAgICAgICAg
ICAgICAgICBxc3BpX2Jvb3Q6IHBhcnRpdGlvbkAwIHsNCj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGxhYmVsID0gInUtYm9vdCI7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBsYWJlbCA9ICJCb290IGFuZCBmcGdhIGRhdGEiOw0KPg0KPiBEb2VzIHJlbmFtaW5nIHRo
aXMgcGFydGl0aW9uIGxhYmVsIGJyZWFrIHVzZXJzcGFjZSBBQkkgY29tcGF0aWJpbGl0eT8NCj4N
Cj4gRGV2aWNlIHRyZWUgTVREIHBhcnRpdGlvbiBsYWJlbHMgYXJlIGV4cG9zZWQgdG8gdXNlcnNw
YWNlIHRocm91Z2ggL3Byb2MvbXRkDQo+IGFuZCBzeXNmcywgYW5kIGFyZSBvZnRlbiB1c2VkIGJ5
IHV0aWxpdGllcyBsaWtlIG10ZC11dGlscyBvciBzb2Z0d2FyZSB1cGRhdGUNCj4gc2NyaXB0cyB0
byBsb2NhdGUgcGFydGl0aW9ucyBieSBuYW1lIHJhdGhlciB0aGFuIHJlbHlpbmcgb24gZHluYW1p
YyBkZXZpY2UNCj4gbm9kZXMuDQo+DQo+IFRoZSB1LWJvb3QgbGFiZWwgaGFzIGJlZW4gcHJlc2Vu
dCBpbiB0aGlzIGZpbGUgc2luY2UgY29tbWl0IGE2Mzc2NmYzMmQ2MmMNCj4gKEZlYnJ1YXJ5IDIw
MjUpLiBDaGFuZ2luZyB0aGUgbGFiZWwgdG8gQm9vdCBhbmQgZnBnYSBkYXRhIG1pZ2h0IGJyZWFr
IGV4aXN0aW5nDQo+IHVzZXJzcGFjZSBzeXN0ZW1zIHRoYXQgcmVseSBvbiB0aGUgb2xkIG5hbWUg
dG8gcGVyZm9ybSBmaXJtd2FyZSB1cGRhdGVzLg0KPg0KPiBbIC4uLiBdDQo+DQo+IC0tDQo+IFNh
c2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC9lZmYzNGRm
MGM2N2QzOWEyNmQyMGVjOTFlZGE4ZGQ5ZTE1ZjlmNWNjLjE3Nzg2NTg4ODQuZ2l0LnR6ZS55ZWUu
bmdAYWx0ZXJhLmNvbT9wYXJ0PTENCg0KVGhlIHBvaW50IG9mIHRoZSBwYXRjaCBpcyB0byByZW1v
dmUgYW4gaW5jb25zaXN0ZW50IGFuZCBtaXNsZWFkaW5nDQpwYXJ0aXRpb24gZGVzY3JpcHRpb24g
YWNyb3NzIFNvQ0ZQR0EgU29DREsgZGV2aWNlIHRyZWVzLiBTZXZlcmFsIFNvQ0RLDQpib2FyZHMg
YWxyZWFkeSBkZXNjcmliZSB0aGlzIGZpcnN0IFFTUEkgcmVnaW9uIGFzICJCb290IGFuZCBmcGdh
IGRhdGEiDQooZS5nLiBzb2NmcGdhX2FnaWxleF9zb2Nkay5kdHMsIHNvY2ZwZ2Ffc3RyYXRpeDEw
X3NvY2RrLmR0cywNCnNvY2ZwZ2FfbjV4X3NvY2RrLmR0cykuIFRoZSBzdHJpbmdzICJ1LWJvb3Qi
IHZzICJCb290IGFuZCBmcGdhIGRhdGEiDQp3ZXJlIGFuIGluY29uc2lzdGVuY3kgYWNyb3NzIHBy
b2R1Y3RzLCBub3QgdHdvIGRpZmZlcmVudCBoYXJkd2FyZSBsYXlvdXRzLg0KDQpUaGUgaGlzdG9y
aWNhbCAidS1ib290IiB3b3JkaW5nIHJlZmxlY3RlZCB3aG8gY29uc3VtZXMgdGhlIHJlZ2lvbiBm
b3INClJTVSAvIGVhcmx5IGJvb3QsIG5vdCB3aGF0IHRoZSBpbWFnZSBpcy4gS2VlcGluZyB0d28g
ZGlmZmVyZW50DQpodW1hbi1yZWFkYWJsZSBsYWJlbHMgZm9yIHRoZSBzYW1lIGNsYXNzIG9mIGJv
YXJkIGFuZCB0aGUgc2FtZSBraW5kIG9mDQppbWFnZSB3YXMgYW4gYWNjaWRlbnQgb2YgYnJpbmct
dXAgb3JkZXIsIG5vdCBhIGRlbGliZXJhdGUgcHJvZHVjdCBzcGxpdC4NCkFsaWduaW5nIHRoZSBs
YWJlbCBjb21wbGV0ZXMgd29yayB0aGF0IHdhcyBhbHJlYWR5IGRvbmUgZm9yIG90aGVyDQpTb0NG
UEdBIFNvQ0RLIERUcyBpbi10cmVlIGFuZCBtYWtlcyB0aGUgcmVmZXJlbmNlIGRlc2lnbnMgcmVh
ZCBhcyBvbmUNCnByb2R1Y3QgbGluZS4NCg0KVGhpcyBpcyBhIFFTUEkgYm9vdC10aW1lIHBhcnRp
dGlvbiwgbm90IHJ1bnRpbWUuIFN5c3RlbXMgdGhhdCB1cGRhdGUNCmZpcm13YXJlIHR5cGljYWxs
eSB1c2UgYSBjb250cm9sbGVkIHVwZGF0ZSBtZWNoYW5pc20gKGUuZy4sIGEgWW9jdG8NCmxheWVy
LCBzd3VwZGF0ZSwgUkFVQykgcmF0aGVyIHRoYW4gYWQtaG9jIHNjcmlwdHMgaGFyZC1jb2Rpbmcg
L3Byb2MvbXRkDQpuYW1lcywgc28gd2UgZXhwZWN0IGNodXJuIHRvIGJlIG1hbmFnZWFibGUgYW5k
IGxvY2FsaXplZCB0byB0aG9zZQ0KaW50ZWdyYXRpb25zLg0KDQpSZWdhcmRzLA0KVHplIFllZQ0K
DQoNCg==
