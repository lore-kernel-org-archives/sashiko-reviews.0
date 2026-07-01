Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013018.outbound.protection.outlook.com [40.107.162.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C712C3D9030;
	Wed,  1 Jul 2026 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894029; cv=fail; b=GvpM73LZmD9nSnC8IAt9C0Ep5DXkScbZ5lo3Fwx8cUa4hHqbEGH1xKJn+OveWXFC9LjwzPQys4TA/V6P389EWKfC6A1KhTfdAYuseuUiXQAnMwiDa2Z7dswvhzP598h3/hV5XEG8FQ1XVI9gMlYQ3/1D4VK07mMKgrCY2kaRVSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894029; c=relaxed/simple;
	bh=dUmTRMwP4WhHPCdC/s25R+3Fj2L6j44uVdDTnnzmOGY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sx4pIOcEbXGV7DExUZ6+Eg7YAkCd4nQ6tLhp47TTH3Owlph6KsD+A5zc21H24Xfat4hhbj6kRUxqvLR8uTJBqjN59S5XkpZZDcGUjd2JD3zPr6zuj3ngT59reRm4n18nDgIUR1czN/GPVTzOpJQsTtIX1XGPJlb2m/ohk+wJ7EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iPYMPyZM; arc=fail smtp.client-ip=40.107.162.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iPYMPyZM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQHZaJBJLu6CB0AJgNsHGN9MKvJOAHPMjcSJz+mMbewpLLu3TUZeWCgIwbnwTfpkamt28ibKi1BfEARtVWCkiU5kK9OcLmYD1Lms59fS9+WsHchQb1/aMnvx3uXz2IgRkzarIByCgEl5BEFxq8uzRD+k811zYBIJRvsS2JLgrQiLzlWMSolKgn8Bl5OQ2ouq+VXFv99roH90pKRLUTqnuiLlmX6YReV061jN1D3HGOvSAoFwBZrIj7iMuzApIsjHPcLZQr3YTYr2DuB2vESEZrhibMIOQhxepAh2dXsFAJVI53ldAP5vtHsZTJNEBuMpy33MbA61ps5CnY/Pq6qmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUmTRMwP4WhHPCdC/s25R+3Fj2L6j44uVdDTnnzmOGY=;
 b=fpVQ8+CvQ82wO9OZJRbgN/6qYf9onRsKi/vejeip8wKVpHbIUgmuT34XfBv1APB41AL+B/mLBiiSAp6ZuCCCThThHfKFOqWsizZokQAnRyRQfyGAL/3SzhxHBwK8m9Ny1+60ac8A8SCYdoCZh7edOCiJDezzFRempdGmVBeYEka73JOftz2Dj731s21PGdMLDtBguB5CuIkRHRLvwK2VYAIoLtk2e17zW5sYneCnmBF8z+E94V3tIqpr/KoumIRJVL5t7tq36mq94BAa0XOxXl/hUgxLMWK5y+WnZwcBax7XieQsVYTc9Yt28CdypWQrE19i6q3rQPgeHyZ/+NmgFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUmTRMwP4WhHPCdC/s25R+3Fj2L6j44uVdDTnnzmOGY=;
 b=iPYMPyZMHwRosgAMzqTaUPxb3pZlnNJddD+IxHWe4ugN574D2HU6n+dZx7m4Eogn4r1UsSPk9D+HT6ZohuTqK4bnqAuTfJW28C5BE54AE+2/uyWNFLpamRKJpaxWzcm+nuLsTFk9DUjvpDDe0Z8G3XzTfZmzGW6xKm+ZvYg6hR87sVefnnmv6g+TZX1wEk/9cR2MMgA69l5Xq2jL8so7LnUlHN6JL8FFjLabCVeIThQzDmTi8pMQpy3r0h5G6Mk1u4Q0ylCCVEbZp+q3r3XJGIzdSTDq+hG8aRdHr4Q74sGckdHm0dTLdf/5ooqWwRXb5CEaQckODDQeQVX8KOYdcA==
Received: from DU2PR04MB8629.eurprd04.prod.outlook.com (2603:10a6:10:2dc::6)
 by AM9PR04MB8666.eurprd04.prod.outlook.com (2603:10a6:20b:43d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 08:20:23 +0000
Received: from DU2PR04MB8629.eurprd04.prod.outlook.com
 ([fe80::9d04:7526:a901:fe47]) by DU2PR04MB8629.eurprd04.prod.outlook.com
 ([fe80::9d04:7526:a901:fe47%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 08:20:23 +0000
From: "Wei Fang (OSS)" <wei.fang@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "Wei
 Fang (OSS)" <wei.fang@oss.nxp.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH net-next 02/14] net: enetc: extract common helpers for MAC
 hash filter configuration
Thread-Topic: [PATCH net-next 02/14] net: enetc: extract common helpers for
 MAC hash filter configuration
Thread-Index: AQHdCGTic+2CUL6FZ0GiRjWoGlV6H7ZYS/+AgAAIHxA=
Date: Wed, 1 Jul 2026 08:20:22 +0000
Message-ID:
 <DU2PR04MB862959C2A694DD118A99BDFA88F62@DU2PR04MB8629.eurprd04.prod.outlook.com>
References: <20260630072036.382761-1-wei.fang@oss.nxp.com>
 <20260630072036.382761-3-wei.fang@oss.nxp.com>
 <20260701075116.0321D1F000E9@smtp.kernel.org>
In-Reply-To: <20260701075116.0321D1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8629:EE_|AM9PR04MB8666:EE_
x-ms-office365-filtering-correlation-id: 45218127-9f62-48e5-1196-08ded74998de
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|22082099003|18002099003|38070700021|4143699003|11063799006|56012099006|6133799003;
x-microsoft-antispam-message-info:
 5/cySBhWZo40unJ34YXVEOIvx9nYQIAVhRkJYL8fb7mVO7LsimSrKGoJIQCBGniUNWn00lwNyPPzwoMVTBfvZj+DIXqO4yBiEGxBIAUcyiVT9sgtt6vvv4cW6NVgvIeUq/JfovGLXQf96nxnzkqz2ObfVSNiKiCQnaOvuLPj/J1hNM0E7jKBY9b/c2hg5l39zlNUj++dnDqzX3TG18OaS5YAkL3+JGvpjeeZ8Mv+RUC3CVMNB/GdmXJ0OOrA7B2Jqq6RFOzEDdHFZ164ZMp+v5WA9atL2k9/pf95dJcsZSOaZdGNeoynHjzI+h86v5OxzliAUYuqg6sgsCTDqweCVThYY22TFs8Is0wkqJ43C7i4vNWG+4l2nHmu2mAf/AuJF/UrQNHFEWElJxWF/35R6y5CkNkDgrQyD7ctbDelyuMTem4UUsRIfdMZS1sMo8Y1lPb8+0qMUb6dsmHK54fCSe+363BFdjkmGZeY4w5wTXLsO0Y8deodXu6i91E0JMdIUBtWRoi2YU/2k0JOXLoxc/5LrFyVtMx6tO7LGFFgCAP4MO+f08BOBUI6N9Lu5gYCiGTi8NaSxTlVSH8xilINYuEwQjEuH38x7Uh1+jrzl7mgClUFbdDMzFMWRAp9So6cf/JrG7IokZytC5xpXP95LNfDXinM9GjzVjQB8x6m/yU0J55v2JGgljTP1iYwDGTC4PymOfkOtZaxvGLCiTBhMgosOjpc+lxVbFPNySsXQVc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8629.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WklXNkxnb2VpMEhxRTJOclBiQ2pXdzRLWlBoN2VldnFmc3FZcFlzaE5yMHJv?=
 =?utf-8?B?S2tDNGVaRUdhUWM3SCt6NjltckVUR3RBZEJ4QWVXTm1mczhDK0d1N01WMVVq?=
 =?utf-8?B?bXdXRnRqdnc0TnlKbTV1ci9BdHQxaUtsZ1NMM0ttb3FzdjgyMVlOdXQzYUI1?=
 =?utf-8?B?Z1NLWFFQV0dGZ1IySGRwQzJib0ZBTUdWMkRTcFdSUTdONVd4aWQvOFBnL1pn?=
 =?utf-8?B?eWZYRzQ5OWtiaVBIcE5PQmxRMnNySFdlMW91cXgxc3BrVERoSkY4SmFiaUlk?=
 =?utf-8?B?VG9TRWFnMVdCTEVtdnExWE03V0o4bHJTVlo3RTFyUTZDbXdmTUtqanpUWWtW?=
 =?utf-8?B?T0lzcUF6QW5weW5qNDJuTThQWEZJZS8zOHpnSTN2T09oRHNBWmc5bXpwaUdv?=
 =?utf-8?B?UDZ0RWFnVHNqdnI5cGt6T3I4eGx5N3NES1huVC94bnZRZXAyZURaZEY2eWk5?=
 =?utf-8?B?dDdZdFNSTmpTT21SK0N0bjdGSjdaeDB0dUNldXZMOENSOUxhVSt1Nkh5b25I?=
 =?utf-8?B?cGZ2aENEaUlEMjBLajRZREFCbExSQ2t4cTgvTmtWM2llbG0yWVdIU05wY2tP?=
 =?utf-8?B?dFRWK2FpMmxRejlQdERJUHZEYmJuNmdPUnM3NlRmcTBFU0dxakJMWFRmMitV?=
 =?utf-8?B?Ni9JL2Z2NUhUbjZOS01xdzFzQWtwbXRCRFpFWTk3Q0tOWTFhQVo4Y0VQejAv?=
 =?utf-8?B?cFY3VTVQZ2crM0ZsbWpka3VTbW5rRWFiZTVRc1JmN0FDdjdZQjBUdkVCUlkw?=
 =?utf-8?B?TXBiWXBwTGJidkhhRjJEYUJGLy9CS0VIb0ZwUE9XL1hiRFFySFZKS0cyckIy?=
 =?utf-8?B?ek1lS2R4bm15MldRT0R4NGMycENzWFN4TFI2MWJxdXpRaFRQQXZvdmRDT1Zo?=
 =?utf-8?B?cWc0Z2t5UjNEU3JYdnJRVk93b3NXK2l1QTN6Nk9ZdWFvUHNVWFNKelpGSkcv?=
 =?utf-8?B?MHJDRHluVWtVN0hZZ3RJa3BXQ2hpdXJycWJkQUJsU0g5YWNPSms4UkYxNVdL?=
 =?utf-8?B?R2QvdTkwQ0RTY2VnaEpEUnBQeXpNRkJ1UllnNTkzdVpxL0U2anQ3WlFzVmsr?=
 =?utf-8?B?cmFzZ3QvZzN0cnNndi9yWWFsOERTbDNEcm9zcUVlOGl4T2kzMndwQ2hJSlBU?=
 =?utf-8?B?bnIyVWFIbHdMTWs3MEdNN3U1ZVZWdnJ1L25XWXhUWGx1TVIxUVljNnUxdWxo?=
 =?utf-8?B?K0w1aFYyQzF0czl6MlNvalM5dmlFOGh4Y1B4cW5EWElNOGxDVXRkemh6RElZ?=
 =?utf-8?B?VzBVWTVWMHV5US9wRk5uSndDQURNMGlaRnBNdXFsRTUxLzllOGRoN3RYQlZw?=
 =?utf-8?B?enA5d2V4bjE5aDB2OERKckNZZk1aVk5DeTZmcnJkUnZROVUxT0d1dG1aMmxy?=
 =?utf-8?B?eTRoc24yQWVTYkRDYXJSNEFDUTlyVEFsUEVKQlBmdFIzcy9OZEM4eWt2SDg0?=
 =?utf-8?B?SFhZazdlbFRlNS9tNmpQM01RdkJPWnFsS0dpUk5iWGxSdm1yaW1NOTROVFdq?=
 =?utf-8?B?ZGZNd2ltamZOY0p3SW1PMExUeHFDVHdDL3lLTWNRMkpBRDdPNmtKWUd3TVIx?=
 =?utf-8?B?Zk5iN2JzdEhPR3ZmaEFrTTRwSHFyYXYzUUYzU1ZpZ2hWOThUWldIdWFnK2Nv?=
 =?utf-8?B?bUVvUXM4YkVyZ2pQQ2EreE5KR1lTT0xSSi9nM2p2Z3d4WjIvUE12K0tQd21Y?=
 =?utf-8?B?a1Z4SDNVSmxxNTFyZ1RJbC9tajRlNjE4N3VYNzJVNEdFVlNBSDYyWDFJOHo2?=
 =?utf-8?B?eFBjZjA2aXBLN0hDVk9yK011VUp4WDliZURXaWtRckxvQU5rQ3ozNDdPSEgx?=
 =?utf-8?B?L0xKQzArWHNNZXpqTUlLcERBSlc2WjhDTy9oME1PL2NiUEJQOFFkT1Vydm90?=
 =?utf-8?B?VWFDYmtzVU1EajNTNXVmTEQxUDhJVTBQZnBmdnNleFhGa05qU3BuR3BnVUdO?=
 =?utf-8?B?STRiOUZUaG5XeEFSTlNaaXNpOTh0SnpYck82VE1TOUJJZng2aDhWbVFUTC9u?=
 =?utf-8?B?ZmlRMVZ6MDI3VmxRMXJXYk92VXBrT3NKNXdad0lKeWtpQXBqbVdyN05IYUVK?=
 =?utf-8?B?TG5ITk1ndXpXWHFvYmQ2YUFYT0VDSTNuekxnT1NrTVN4aFdTTU5XcE5IeWlX?=
 =?utf-8?B?ZThIZjdqdHg4R3Y5Q285TlEwRnZTSW5xMnRuZWNDVHNaelFCZ2g5a25kNmFF?=
 =?utf-8?B?TUZjQlZZUnVMOSszLzBJemh2SmlkQXFRQkd5ZG41TDdiUEZpYXBGSkQ5cG4x?=
 =?utf-8?B?dHhqYUFVMlc5Q0JHSDRyTkhtUE9WOHlVVjNSQ0Q4SktuRW1CNVFZcHBJb1Nu?=
 =?utf-8?Q?n3r15tY9cYeDbGzKjH?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8629.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45218127-9f62-48e5-1196-08ded74998de
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 08:20:23.0259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EfUI8S60zgAx5q51+q+4JukEiU8mZi21IGRsFkfSed8K9qTU88YigNV37ngK0rBp37iaw9iKZjB+FWFRClA07g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8666

PiA+IEBAIC0xNDcsMTEgKzEyMCwxNSBAQCBzdGF0aWMgdm9pZCBlbmV0Y19zeW5jX21hY19maWx0
ZXJzKHN0cnVjdCBlbmV0Y19wZg0KPiAqcGYpDQo+ID4gIAkJCQkgZXJyKTsNCj4gPiAgCQl9DQo+
ID4NCj4gPiArCQliaXRtYXBfdG9fYXJyNjQoJmhhc2gsIGYtPm1hY19oYXNoX3RhYmxlLA0KPiA+
ICsJCQkJRU5FVENfTUFERFJfSEFTSF9UQkxfU1opOw0KPiA+ICAJCS8qIGhhc2ggdGFibGUgZmls
dGVyLCBjbGVhciBFTSBmaWx0ZXIgZm9yIFVDIGVudHJpZXMgKi8NCj4gPiAtCQlpZiAoaSA9PSBV
QykNCj4gPiArCQlpZiAoaSA9PSBVQykgew0KPiA+ICAJCQllbmV0Y19jbGVhcl9tYWNfZmx0X2Vu
dHJ5KHNpLCBwb3MpOw0KPiA+IC0NCj4gPiAtCQllbmV0Y19zZXRfbWFjX2h0X2ZsdChzaSwgMCwg
aSwgKmYtPm1hY19oYXNoX3RhYmxlKTsNCj4gPiArCQkJZW5ldGNfc2V0X3NpX3VjX2hhc2hfZmls
dGVyKHNpLCAwLCBoYXNoKTsNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gVGhpcyBpcyBhIHBy
ZS1leGlzdGluZyBpc3N1ZSwgYnV0IEkgbm90aWNlZCB0aGlzIHBhdGNoIGNvcnJlY3RseSB1c2Vz
DQo+IGJpdG1hcF90b19hcnI2NCgpIHRvIGhhbmRsZSAzMi1iaXQgYXJjaGl0ZWN0dXJlcyB3aGVu
IHBhc3NpbmcgdGhlIDY0LWJpdCBNQUMNCj4gaGFzaCB0YWJsZSB0byBlbmV0Y19zZXRfc2lfdWNf
aGFzaF9maWx0ZXIoKS4NCj4gDQo+IERvZXMgdGhlIHNhbWUgMzItYml0IHRydW5jYXRpb24gaXNz
dWUgaGFwcGVuIHdpdGggdGhlIFZMQU4gaGFzaCBmaWx0ZXINCj4gY29uZmlndXJhdGlvbj8gTG9v
a2luZyBhdCBlbmV0Y192bGFuX3J4X2FkZF92aWQoKSBhbmQgZW5ldGNfdmxhbl9yeF9kZWxfdmlk
KCkNCj4gaW4gZHJpdmVycy9uZXQvZXRoZXJuZXQvZnJlZXNjYWxlL2VuZXRjL2VuZXRjX3BmX2Nv
bW1vbi5jLCBpdCBhcHBlYXJzIHRoZXkNCj4gcGFzcyB0aGUgYml0bWFwIGRpcmVjdGx5Og0KPiAN
Cj4gZW5ldGNfc2V0X3NpX3ZsYW5faHRfZmlsdGVyKHBmLT5zaSwgMCwgKnBmLT52bGFuX2h0X2Zp
bHRlcik7DQo+IA0KPiBTaW5jZSBwZi0+dmxhbl9odF9maWx0ZXIgaXMgYWxzbyBkZWZpbmVkIGFz
IGEgREVDTEFSRV9CSVRNQVAgb2Ygc2l6ZSA2NCwNCj4gd291bGRuJ3QgZGVyZWZlcmVuY2luZyBp
dCBhcyAqcGYtPnZsYW5faHRfZmlsdGVyIGV2YWx1YXRlIHRvIGEgMzItYml0DQo+IHVuc2lnbmVk
IGxvbmcgb24gMzItYml0IGFyY2hpdGVjdHVyZXM/DQo+IA0KPiBJZiBzbywgdGhpcyB3b3VsZCB6
ZXJvLWV4dGVuZCB0aGUgdmFsdWUgd2hlbiBwYXNzZWQgdG8gdGhlIHU2NCBoYXNoIHBhcmFtZXRl
ciwNCj4gY2xlYXJpbmcgdGhlIHVwcGVyIDMyIGJpdHMgb2YgdGhlIGhhcmR3YXJlIFZMQU4gaGFz
aCBmaWx0ZXIgcmVnaXN0ZXIgYW5kDQo+IGJyZWFraW5nIFZMQU4gZmlsdGVyaW5nIGZvciBhbnkg
VklEIHRoYXQgaGFzaGVzIHRvIGJpdHMgMzItNjMuDQo+IA0KPiBTaG91bGQgYSBzaW1pbGFyIGJp
dG1hcF90b19hcnI2NCgpIGZpeCBiZSBhcHBsaWVkIGZvciB0aGUgVkxBTiBoYXNoIGZpbHRlcj8N
Cj4gDQoNCkVORVRDIGlzIHVzZWQgb24gQVJNNjQsIHNvIHVuc2lnbmVkIGxvbmcgaXMgYWx3YXlz
IDY0LWJpdC4gVGhlcmUgYXJlIG5vDQppc3N1ZXMgaW4gYWN0dWFsIHVzZS4gV2UgaGF2ZSB0aGUg
cGxhbiB0byB1c2UgYml0bWFwX3RvX2FycjY0KCkgZm9yIHRoZQ0KVkxBTiBoYXNoIGZpbHRlciBp
biBzdWJzZXF1ZW50IHBhdGNoZXMuDQoNCg==
