Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011004.outbound.protection.outlook.com [40.93.194.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87EB3B52E3
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396716; cv=fail; b=FedIAtwM/CBJQ+ImlqaWqQv8msjebKd11dRx5ICBtkBnG44/+ownPbFQnH71ii1WRA52HS4oAAQfM6oHYO26uxjmXxRNc/6jCeRgf7/cIrR2FkjrWOF7Rwr7WXkz+TgAeJmMu1Q1LHpzsJoN3j17NVaFpwqkm2yiq5m5QoZZAvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396716; c=relaxed/simple;
	bh=ICfTdAcxzd9uimsMWTwsn53ykHbQMSnT3JZ0vKiClEU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QqlSt0HHGRHNG8/Z9l8YVJ2HSBUhfEGywXcqJyCDpR90TiHTYKC6ZnVnNJAD2JQMGg4vyYj3NJ2KL5KHo7A1ibs+OhwvSfg+89CEg44ZqLm/Ghed/6568bVZWwU3ea+0VzgksfPl/SBNxPCRZXDZM9qcLfI/1Z/n+RI5JSaGRyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=RDgxleVt; arc=fail smtp.client-ip=40.93.194.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="RDgxleVt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3DQOab624cSCrcyhEariMnEQBLca7I9zTVIpkvxUyCmGday8PtasQD6+oUW0N8DiRh4kFjOOb2NNrdUnh0JAe2ZEPtGW5VWh8bDr3Lbibqdh6rSs4xQ+/qH5XidyIL6EQRBsZs1R+m2YwUb/Ff/grQEtqDm+U7syl3QIH+cb31yCzDAhZVsmCr4WzhU8nz2rzAmUiaM28Q0p/jpSQuoBNh5pu/cIYM+s1suwAOZuhW5/2Wef5L42wxUiiEiFKmZJIBxC961YT+569dkU0AVK/jxjDT+z0KOuw03IlWv/CVCcgc/qmAcP8gxAvF+DPDfS/8PsXIabLV1zcS9g3qxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICfTdAcxzd9uimsMWTwsn53ykHbQMSnT3JZ0vKiClEU=;
 b=qjeHxHUnfdN991oNi+Yy6pd3haF9RJ8URGnDsbkb9d7S2U9YKFTVSUQZacT6leLylx377n5919oDaHIAKzsTPX9Hm2N7/t2vURcptjQEjfmbPaqzh8J00OoB47Ltdo8MDtyeNYuE16lcapueHk08xTWH37tC17A+n+96TOUa3iaC/ouL4kZ/cnnEm+G37nQY61BBhn76V/YQqV1p96naAMSgzBbw2zU8SdsMzTEqC4nha+IH/fv8IOkGLWrl6mPNfGuAzPB5rR9C6a4g3wkWRmsCfP/A+qXO05iJdzFmIn5MsqGNT8BkHsuiYBaeD0G6bevIn5xO4RzOZ15+7JzFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICfTdAcxzd9uimsMWTwsn53ykHbQMSnT3JZ0vKiClEU=;
 b=RDgxleVtVwyN255+eEhJDVAxvVJS+By1NFFJdsJXk7+y1g5CP5JUsS2ayQpa6Hkgf5UhC9XRYyGvgEbECw3FTU2vVqZp8Gog5+KEGBkY8u+gdlGlxNqRb3F+1TW18RIsHOmpKRatnzWI2iBIqEpm81yXp0KhFxYr342kfTByN5xS30JGNhKXSFhKHH+nptcyD2ocC8/UJXp82cNjYBCOjjaCvBekT12Yxwqk3fYRsu7zNWH5kCPIQPXs0i89MauipIUtuR8fXck8AE68dxlGKxYQsy3Jtl1pnoY24cHw0sOgmKiuXKL72sqm0N6tujAo81ngCRSztCOGKjMPb9e84A==
Received: from SN6PR11MB2813.namprd11.prod.outlook.com (2603:10b6:805:61::18)
 by DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 07:31:51 +0000
Received: from SN6PR11MB2813.namprd11.prod.outlook.com
 ([fe80::ac7:12a7:9c3d:947f]) by SN6PR11MB2813.namprd11.prod.outlook.com
 ([fe80::ac7:12a7:9c3d:947f%6]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 07:31:51 +0000
From: <Manikandan.M@microchip.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>, <richard@nod.at>,
	<pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <mwalle@kernel.org>,
	<conor+dt@kernel.org>, <takahiro.kuwano@infineon.com>, <vigneshr@ti.com>
Subject: Re: [PATCH v6 6/7] ARM: dts: microchip: sama5d27_wlsom1: read MAC
 address from QSPI SFDP
Thread-Topic: [PATCH v6 6/7] ARM: dts: microchip: sama5d27_wlsom1: read MAC
 address from QSPI SFDP
Thread-Index: AQHdHxMqtCdq45nstEipTx/YqorSFLaFepcAgAAyOgA=
Date: Thu, 30 Jul 2026 07:31:50 +0000
Message-ID: <0e7f12be-d1ea-4e73-a994-cb53feb95b01@microchip.com>
References: <20260729043026.1811147-1-manikandan.m@microchip.com>
 <20260729043026.1811147-7-manikandan.m@microchip.com>
 <20260730043205.0BABC1F00A3A@smtp.kernel.org>
In-Reply-To: <20260730043205.0BABC1F00A3A@smtp.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2813:EE_|DM4PR11MB6381:EE_
x-ms-office365-filtering-correlation-id: 9f5a0f68-d5db-4519-eccd-08deee0c9f17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|6133799003|22082099003|18002099003|38070700021|56012099006|10067099003|4143699003|11063799006;
x-microsoft-antispam-message-info:
 E9yrVjOnFLBEZiCqzzY/jVSoDB4qhAKfubo11dG9flnwyCY9elkW7XpdRCuUqRvUn/307WfFy5B+23VivdlD4k8MlQETmwQLm/taOdsU0GAZ2wrE8R/Ztw1wGL2tBVrVaOuagRdrajwpiuK0Gt/A/ftXB+/oY6HE8cYO9Rne+D1UUbCFuvxzRmH3AeyFw74Finq/2lxh84S0qgCLI8jClfPLztd7JVRpFGAYAgO8JMGvIHhv7QzVE3oT80nrZ1MiYUn0GsP+4dW334S9+CFwhc4I7D+5sTwfFanoIltF2A9yxCPyGvHKZRdywhE4kBON6xw0Cj1PtVL0MmQhKnwIcKeb+dYuM77vQx4hcOrwFIyspfl08g7n1WoGvyjenH3I/UDr4/km3iqm78JblkJcsemIj8VC90tNmKlY/fLWLRrSF5mxX25Em/DmIm2dFKJ7Dbp1KAH6lYBQu1NcYnNvTs7naFrZFlBXhsLhqi+B6YjYKIXWO4H8JPeGLbvucSAI9xWuMMgxBjme4EFlyX1LNh+m2f6khlU6YvIRI4RSDX9EUdi2MI2aqQfxYnVnuka8Ts7HexQ4y2nwC6ypgmFi0rOXlFaajDvxivHXqWmQHXdFUN+pnhH/8XjiziQeEsU2cQwWQLzB5c2lh0cAlL4D/Dgs7Lw/LUpmPBcJYnFei1o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2813.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cUNaVFRwaHB3SXV4S0tFMlR3SkxKbDJ3ZXpBeVVRMG9yNU54bVZ6dzd1eU9p?=
 =?utf-8?B?cUgyVElkc0JoZXpyTk9CYXpFY1d6OXllVVZ2OUIzeUY3QXpxVktpWUNXekYx?=
 =?utf-8?B?ZW1qWHQ1dlNxYzFoaFhoek5KNUhYVjlDYTFTWThuZms0THZTaG10STZTcy9y?=
 =?utf-8?B?YklOdkFNdVNkRXlNbk5GNnhKZU96WlpVU3IxMjhYcDErWG9kK09BUHBpVWs5?=
 =?utf-8?B?V3dDQnZxWmhMYmltOVYvRkpyUFhYUkp2T1A5am13QnlicmRRWFhYQnkyVDBl?=
 =?utf-8?B?UEIyakd5YkEvL29WWTNPdlFYMlE2S3JINlJub2hrZytiTkZkS1kwMHRQc21Q?=
 =?utf-8?B?MVo3YWJRSnk5ZmZpcFd4OGtWSzMzTkpkRG9pVDZRNnVRcGFkUVFQZUJlcDY1?=
 =?utf-8?B?WkloQmZ2MUo0TG5qSlF1WjBJZDAzcHcyNTVJWGh6T1NsbmR2ZGplMEQvVW5s?=
 =?utf-8?B?MXdmR1crUktxb3RiejUvbHNyZjdwWEJFZmpNbzRWRHBlbDhYd1l4dDdrSEFs?=
 =?utf-8?B?OFBiQjR3aGZ1ZUc3TklEaDFzK2s0bXJkN3BqRXJTMGtkbmZ3TFQvaUVQeU9q?=
 =?utf-8?B?cnprY3MvK1ZsYVNmS3BhK2E5SUF6eVpTd0t3WWd4ZGl4L3VFWE9EcXh2WG04?=
 =?utf-8?B?ejE2QVpiU2ZBQzFFRURkK3pKN0NxTGp1eG9HTnZGdUYvbGlHZk9iSkxxNUda?=
 =?utf-8?B?NkxuN3BxNS9ZWXhhb0lVRmp3ZmxNZ283MExqYTZJdEFvL3RwYzBwWGQ4RmJY?=
 =?utf-8?B?VGZubU5hVHJGZzFxTWNMelQrOGVONElJZmpKQmFIbTA0U1Rpc3BpZVBuTlpM?=
 =?utf-8?B?ZlNMYzVrdytHNElKZnZtL09jcW5sT3pNUGZRU01lZm9SU3krc2g3YUtOK3Qw?=
 =?utf-8?B?YjRFMG5vTEQ1T3FRQ3FXVTcxUGZpdThValdRMHhaOHl5WnJEQ0RCRHpjVkNs?=
 =?utf-8?B?VkNBcVAzRVFjcXV1WE1LMWpLTitJdmV4eVlaWkw2RkIxa3l6cTgyVFUvanZw?=
 =?utf-8?B?NTJwSzRDTkxrbDVHR2N3bFVkekt1Q3lyUnpVNzBsQy83QWllY01vYUtNUFdm?=
 =?utf-8?B?YUx6SzdHeEd0OUk2aEp2ckhBeWN5T2RidC95WWxVYVJ6S1I2UkVxZllWQ2kv?=
 =?utf-8?B?RWdSaFlqWHRrbElqdjhJbzFPcHdMeWo1NU8vM3BnZllqb2EySWRPRmQ1VFlX?=
 =?utf-8?B?Qm1PRDBkTE1vWll3U1JsdXZ6cVJxL2xKOC95ZDFCeCtJWStnSUlFbURjd092?=
 =?utf-8?B?Ny81RzNOcXhpSlp6c3MzRWNNU1FML1poR2U5RGdZSTFTcmRUYUNkRTI3OVRa?=
 =?utf-8?B?SmxrSVRmVnhVamF5U200K0pOLzJlZG0xTnBSd2lwajdiUGY4Q1pheW1xQmwy?=
 =?utf-8?B?WkpMN09GVTNycGowNnJHb0xjVFl6NU1YY3V1S015Ym5XM3Mra2JkbGMzaXFo?=
 =?utf-8?B?NmNvRGdCNmVuM0tyVUFic1FPaWZHMG9zTFh5eXJhRHFDaTFLdHd2bXRhQ2g4?=
 =?utf-8?B?eTd2cTlBTWpqWFBJeEpWMVBQWk4rZDJBVUlYUkM3K3IwS1AwK2lCSnlucTdQ?=
 =?utf-8?B?cUptU00yR1UvUURiS2lXRExEUys0eU83eEhjbkNja2tzc0hSL1RhZDlTVUZ3?=
 =?utf-8?B?NENJalJyOEF3VkhibVE1Tm81NGt2Q3NMWjRYYkxwZ2F2a2dFd2dsR1hHWGxT?=
 =?utf-8?B?N1RCdWowNTNwWVFGRi9uanUvdVpHcFBaNzNDUWxXakRJcU1UNDE0dWVjOXNl?=
 =?utf-8?B?VDhlSGdHZVpmV1piN1orN1JOUjR4VjBqSGR1QnR6UmxaamRISVg0ZnlxZ3JP?=
 =?utf-8?B?SlV1TGIrc1gwSjBac1B1cXJweWtqZ01mYjhPdmhsa0h3RkhzS2xMT25UTTJQ?=
 =?utf-8?B?eVg1MmowUlc2M1MwakxzK0UvT0N3alZFRE1NcWtnV2tVYXBFUm1JTzYvdVV6?=
 =?utf-8?B?SEVqM2NOK3YvVFV4UEdWOG8yWXJWcWMwYXAzSGFOU2RDRVFxYURyL0hDdS84?=
 =?utf-8?B?a0pBMVRtNWdkbWpsZThlbllrZk1KNXhONGhwUUNPeXRtVytlaVMxVWhFOExP?=
 =?utf-8?B?NXZKZlJQUzdGVkozSXpueTFxMFd5SjZrYU9MR0F1Q0Z4MnhodysxOGpmZE40?=
 =?utf-8?B?L1hXUE5SS0pMQkMrWUVORm9pcExpVXJQZExVajBaMzJGTXFUVjY1OWNYb0l2?=
 =?utf-8?B?MzdPaEo2SC8vTzFkRkt0S1FTUkZYbmdkTjNObmRwcWdubG9Gamd5aytMQlIw?=
 =?utf-8?B?U2kramM4dk5HdXpzZCt0bVJkb2s4Tnk3dEUrZFVMSUdiY240STVEcldmTDk4?=
 =?utf-8?B?eFo4SFlHN2IwWldaOHo0aTVaekFwd1VLeDlZZCtGQjBmbjRTc1BWdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B127C4E6B8855842BAA811D086C9EAFF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2813.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5a0f68-d5db-4519-eccd-08deee0c9f17
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 07:31:50.8520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oi05f9puFxkOKXk3SLGNCWB3WGIHsgl1AS5y+b+5UaZDixLrOW+tvVWkKZQCot1HLXPeMoglZqLqM2Mb7Qsn7wLLOIKKFehiFG8vNuID5pQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381

Qm90aCBkZWZlcnJhbCBwYXRocyBhcmUgcmVhbCwgYnV0IG5laXRoZXIgaXMgc3BlY2lmaWMgdG8g
dGhpcyBwYXRjaCBhbmQNCm5laXRoZXIgaXMgcmVhY2hhYmxlIG9uIHRoZSBoYXJkd2FyZSB0aGlz
IERUIHRhcmdldHM6DQoNCi0gVGhlIGxheW91dC1kcml2ZXItbWlzc2luZyBjYXNlICgtRVBST0JF
X0RFRkVSIGZyb20NCiAgIG52bWVtX2xheW91dF9tb2R1bGVfZ2V0X29wdGlvbmFsKCkpIGlzIHRo
ZSBzdGFuZGFyZCAiRFQgcmVmZXJlbmNlcyBhDQogICBwcm92aWRlciB0aGF0IGlzbid0IGJ1aWx0
IiBiZWhhdmlvdXIuIFBhdGNoIDcvNyBlbmFibGVzIHRoZSBsYXlvdXQgaW4NCiAgIHNhbWE1X2Rl
ZmNvbmZpZyBwcmVjaXNlbHkgc28gdGhlIHByb3ZpZGVyIGlzIHByZXNlbnQuDQoNCi0gVGhlIGNl
bGwtYWJzZW50IGNhc2UgKG52bWVtLT5sYXlvdXQgPyAtRVBST0JFX0RFRkVSIDogLUVOT0VOVCBp
bg0KICAgb2ZfbnZtZW1fY2VsbF9nZXQoKSksIE9uIHRoZSBzYW1hNWQyN193bHNvbTEgU29NIHRo
ZSBxc3BpMSBmbGFzaCBub2RlDQogICBpcyBvbmx5IGVuYWJsZWQgb24gYm9hcmRzIGNhcnJ5aW5n
IHRoZSBmYWN0b3J5LXByb2dyYW1tZWQNCiAgIFNTVDI2VkYwNjRCRVVJLCB3aGVyZSB0aGUgRVVJ
LTQ4IG1hcmtlciBpcw0KICAgYWx3YXlzIHByZXNlbnQgYW5kIHRoZSBtYWMtYWRkcmVzcyBjZWxs
IGlzIGFsd2F5cyBhZGRlZCwgc28gbWFjYjAgZG9lcw0KICAgbm90IGRlZmVyLg0KDQpJJ2xsIGFk
ZCBhIG5vdGUgdG8gdGhlIGNvbW1pdCBtZXNzYWdlIGNsYXJpZnlpbmcgdGhhdCB0aGUgU29NIHNo
aXBzIHRoZQ0KRVVJLXByb2dyYW1tZWQgcGFydA0KDQpPbiA3LzMwLzI2IDEwOjAyLCBzYXNoaWtv
LWJvdEBrZXJuZWwub3JnIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNh
ZmUNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2
aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBJ
bmRlZmluaXRlIHByb2JlIGRlZmVycmFsIGZvciBgbWFjYjBgIG5ldHdvcmsgaW50ZXJmYWNlIGlm
IHRoZSBFVUktNDggbWFya2VyIGlzIHVucHJvZ3JhbW1lZCBvciB0aGUgbnZtZW0gbGF5b3V0IGRy
aXZlciBpcyBtaXNzaW5nLg0KPiAtLQ0KPiANCj4gLS0tIFBhdGNoIFs2XTogW1BBVENIIHY2IDYv
N10gQVJNOiBkdHM6IG1pY3JvY2hpcDogc2FtYTVkMjdfd2xzb20xOiByZWFkIE1BQyBhZGRyZXNz
IGZyb20gUVNQSSBTRkRQIC0tLQ0KPiBjb21taXQgOGViYTJmN2U4MTc4MGRhMjA4M2NiM2RhMTJi
MjU2NzAyNDE3NWZhNg0KPiBBdXRob3I6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5pa2Fu
ZGFuLm1AbWljcm9jaGlwLmNvbT4NCj4gDQo+IEFSTTogZHRzOiBtaWNyb2NoaXA6IHNhbWE1ZDI3
X3dsc29tMTogcmVhZCBNQUMgYWRkcmVzcyBmcm9tIFFTUEkgU0ZEUA0KPiANCj4gVGhpcyBjb21t
aXQgZXhwb3NlcyB0aGUgZmFjdG9yeS1wcm9ncmFtbWVkIEVVSS00OCBhcyBhIG1hYy1hZGRyZXNz
IGNlbGwNCj4gdmlhIHRoZSBRU1BJIGZsYXNoIFNGRFAgTlZNRU0gcHJvdmlkZXIuIEl0IHBvaW50
cyBtYWNiMCBhdCB0aGlzIGNlbGwNCj4gdG8gcHJvdmlkZSBhIHN0YWJsZSBNQUMgYWRkcmVzcyBv
biBib2FyZHMgd2hlcmUgVS1Cb290IGRvZXMgbm90IHNldCBvbmUuDQo+IA0KPj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9hdDkxLXNhbWE1ZDI3X3dsc29tMV9lay5k
dHMgYi9hcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvYXQ5MS1zYW1hNWQyN193bHNvbTFfZWsu
ZHRzDQo+PiBpbmRleCAzNWE5MzNlZWM1NzM4Li41ZTg3YmYwNGJjNDdjIDEwMDY0NA0KPj4gLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvbWljcm9jaGlwL2F0OTEtc2FtYTVkMjdfd2xzb20xX2VrLmR0
cw0KPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbWljcm9jaGlwL2F0OTEtc2FtYTVkMjdfd2xz
b20xX2VrLmR0cw0KPiBbIC4uLiBdDQo+PiBAQCAtOTcsNiArOTcsOCBAQCB1YXJ0Njogc2VyaWFs
QDIwMCB7DQo+Pg0KPj4gICAmbWFjYjAgew0KPj4gICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+
ICsgICAgIG52bWVtLWNlbGxzID0gPCZtYWNfYWRkcmVzc19ldWk0OD47DQo+PiArICAgICBudm1l
bS1jZWxsLW5hbWVzID0gIm1hYy1hZGRyZXNzIjsNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4g
V2lsbCB0aGlzIGNhdXNlIGFuIGluZGVmaW5pdGUgcHJvYmUgZGVmZXJyYWwgZm9yIHRoZSBtYWNi
MCBpbnRlcmZhY2UgaWYgdGhlDQo+IEVVSS00OCBtYXJrZXIgaXMgdW5wcm9ncmFtbWVkIG9yIHRo
ZSBudm1lbSBsYXlvdXQgZHJpdmVyIGlzIG1pc3Npbmc/DQo+IA0KPiBXaGVuIHRoZSBkZXZpY2Ug
dHJlZSBzdGF0aWNhbGx5IGxpbmtzIHRoZSBtYWNiMCBpbnRlcmZhY2UgdG8gdGhlDQo+IG1hY19h
ZGRyZXNzX2V1aTQ4IG52bWVtIGNlbGwsIG1hY2JfcHJvYmUoKSBjYWxscyBvZl9nZXRfZXRoZGV2
X2FkZHJlc3MoKQ0KPiB3aGljaCBpbnRlcm5hbGx5IGNhbGxzIG9mX252bWVtX2NlbGxfZ2V0KCku
DQo+IA0KPiBJZiB0aGUga2VybmVsIGlzIG1pc3NpbmcgdGhlIG1pY3JvY2hpcCxzc3QyNnZmLXNm
ZHAtZXVpIGxheW91dCBkcml2ZXIsIHRoZQ0KPiBudm1lbSBjb3JlIHZpYSBudm1lbV9sYXlvdXRf
bW9kdWxlX2dldF9vcHRpb25hbCgpIHJldHVybnMgLUVQUk9CRV9ERUZFUg0KPiBpbmRlZmluaXRl
bHkuDQo+IA0KPiBBbHRlcm5hdGl2ZWx5LCBpZiB0aGUgbGF5b3V0IGRyaXZlciBpcyBsb2FkZWQg
YnV0IHRoZSBib2FyZCdzIGZsYXNoIGNoaXANCj4gbGFja3MgYW4gRVVJLTQ4LCB0aGUgbGF5b3V0
IGRyaXZlciBncmFjZWZ1bGx5IHJldHVybnMgMCB3aXRob3V0IGFkZGluZyB0aGUNCj4gY2VsbC4g
SG93ZXZlciwgb2ZfbnZtZW1fY2VsbF9nZXQoKSB1bmNvbmRpdGlvbmFsbHkgcmV0dXJucyAtRVBS
T0JFX0RFRkVSIGlmDQo+IGEgY2VsbCBpcyBtaXNzaW5nIGJ1dCBhbiBudm1lbS1sYXlvdXQgbm9k
ZSBleGlzdHMgaW4gdGhlIGRldmljZSB0cmVlOg0KPiANCj4gcmV0ID0gbnZtZW0tPmxheW91dCA/
IC1FUFJPQkVfREVGRVIgOiAtRU5PRU5UOw0KPiANCj4gSW4gYm90aCBzY2VuYXJpb3MsIG1hY2Jf
cHJvYmUoKSByZWNlaXZlcyAtRVBST0JFX0RFRkVSIGFuZCBpbmRlZmluaXRlbHkNCj4gZGVmZXJz
LCBicmVha2luZyB0aGUgaW50ZW5kZWQgZmFsbGJhY2sgdG8gYSByYW5kb20gTUFDIGFkZHJlc3Mg
YW5kIHJlc3VsdGluZw0KPiBpbiBhIGNvbXBsZXRlIGxvc3Mgb2YgbmV0d29yayBjb25uZWN0aXZp
dHkuDQo+IA0KPj4gICB9Ow0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzI5MDQzMDI2LjE4MTExNDctMS1tYW5pa2Fu
ZGFuLm1AbWljcm9jaGlwLmNvbT9wYXJ0PTYNCg0KDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywN
Ck1hbmlrYW5kYW4gTS4NCg==
