Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795177099;
	b=1+z4sIHT0OVTSkp9YId/UCyMhPL7VVtBhG292qqPauOgyyb2e+9IRPcYjYy3OzBGqqJ7
	 vFLygMz9K/BLJCaSi7+V94Z30fZoCYROiiESOBlZDzCkBlnNGyC4qtBnRzKxjr7v8x2HH
	 6lQuDPgFRRhwOHPqo0xgTtMU3EAWqFhi1wHAeqA35V7l6aBNTg+25UUd5jkpnHcTfQZn6
	 N/UDh2O687G/yte0Nsu3kfmLfCXNBfbXutFIFdkPxzfhYqL46jw8NOQmisbrMC/r26uvf
	 kFZw4kU3W8cXMy4zQzIzaZESeUDQQnqPDh4obmDVEJb4s6JmU2CWr3UF7OjrmrBuSqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177099;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=gi6cYVqc4FySIPLaxGQAppoWhIJUuI7Z8IuFlBvtf2o=;
	b=JHHAudIQaBRE5ULFdHCMSe/cK/0zeS94x16c4Po+XS2PKYsijpDdeygYoq8unNF7eE71
	 9nPY4ITkBoykfMBYQe3MlRXPFK/1Jann6VuHsrwX7OfY0cghdp55gBjqjVrLkCmE1Fz5u
	 2JUcX83X2rzxMy5MK/nyRqIigNiBm5JmsGCyZOoZp1weGhk8Gx9PjmredmbtyDbZpY/Im
	 SjLT+Sw93SomVfOgLyySJGcW9svKIMLC/ycPo421xB3AqKll28SVLpQPuGlOutzX0apw0
	 WFaYJBtvkNE9776xe0a3iexIr7w7ksq9x34tqKWXNFNk5AE4i1se7IJLsyW9qaoHX+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=DidPY2Og;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.34
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011034.outbound.protection.outlook.com [52.101.57.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D269606A32C
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D269606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=DidPY2Og
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQVybr6q04ZGr9W1ZfujwHl06+MsX3EoDNcXvzGYfO1+T/WlhJZhanA7EWz4VtLHXoDC+i2P/msHo34G0zmWyjrqBmk0QdAhADFELcZLrV0Mwrka8Oab1gDdxfKlKBnj0vP4OzoJBSggqo1MNFNI2HZ6HrhA3P8yq92GJi9GcBxwKH6Lc+j+W3JdnbtGTc9fj2a1LE7bEj4HI2zrkmaB23AJLRCpavnDx7S7cjGNbO4adOp5b5nsCze7OWaOiHTYjgYW+oY4ZVqjocwX/XO8udbXtmwUg2ptzl/lL3F/HoCqJVITUGu/OQmWraPQzlpRL+xrPMq0ZybumXngJctP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gi6cYVqc4FySIPLaxGQAppoWhIJUuI7Z8IuFlBvtf2o=;
 b=uIzNaNOASCMgpH26ipx749WFd5w4Ovtq+/fcOUq/8MaFzLiZL3dmuUsyezLeG/jaftXhj/dNdDielcLQFlNPqe+tR8x77YDuJhnAhXkxsTvKauTMFX0GQMk7j2KDOAKn/BewOQwG8WhOROK3Qzy8XvYGJxn3umlg9DywWJmBgWjOL1xUXXN4ajYhiseKxFYDmgqaGwn3z9thWabxE4bnPDfWADRZj4nlJwOU0YPZpJylolTgqDSaet3FuQ7kTAqpAVOS0HVdilCLgWOFF4WzpUG1J0G67K6A+GebgLI+GP0G3sKkk/dgr9C7sPpUyKgzb8Ljk4jnsNQPou4X1ttBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gi6cYVqc4FySIPLaxGQAppoWhIJUuI7Z8IuFlBvtf2o=;
 b=DidPY2OgLaJCI+h5GFDf5PYlduFHK2jVA95VeHu8X4b7eZCany0SYfbE3IQFH3YIfpXQD7CNGzo+6zQS/9pcqjTGjeSFUP1I1t3yvh4Arax+FupTA4KYq79UxXhuyY7UCqsPt4U/vzHmApPHp+0cgqBTVXUS7qXOMRGtQwcp8mg=
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by IA0PR12MB7723.namprd12.prod.outlook.com (2603:10b6:208:431::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 20 Nov
 2026 12:18:14 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%6]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 12:18:14 +0000
From: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v2 04/12] EDAC/versalnet: Add bounds validation in
 rpmsg_cb()
Thread-Topic: [PATCH v2 04/12] EDAC/versalnet: Add bounds validation in
 rpmsg_cb()
Thread-Index: AQHdd2iCB3o69o8XUEefqBKsXdWLrrcz5KYAgAL+J+A=
Date: Fri, 20 Nov 2026 12:18:14 +0000
Message-ID:
 <LV5PR12MB9828EF84DAE9C83C016D975481782@LV5PR12MB9828.namprd12.prod.outlook.com>
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-5-shubhrajyoti.datta@amd.com>
 <sashiko-outbox-221219@kernel.org>
In-Reply-To: <sashiko-outbox-221219@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Enabled=True;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SetDate=2026-11-20T12:16:28.0000000Z;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Name=AMD
 Public
 v26;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_ContentBits=3;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Method=Privileged
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9828:EE_|IA0PR12MB7723:EE_
x-ms-office365-filtering-correlation-id: fb57ef67-fde1-492b-f021-08df470059ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|261022105027099003|261026140227099003|261028144727099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 gxjrBuFwm3nM0T28JMOobFFUsKOHgJfCKGlLXNHuHNfbmGungcrYfG6azMqB0ke1JvxzlY/4SgWFsVZX9NFLbI9I73uZVY7WJ2OOiDt87co0uYLC4+4LsRhRLkTmWW68pPK62gHn4iCSPxC6zJJhFowYVx/SxeBO6DgFRYyDaF5FvErt+5CMTmJpJIuSFUxg9AsRoiDRK14vSpClnI1HIn938W8kPZrMKim9KSAh8IqhY0hC1F+bR4ixKi4ImJzvz8WM3Y6QB9/JeGEMBmbO0J3LrktATMD/VdKuCB9ah+pl1hsZkYF2AOcNDv3DwsPzzOHrDaSSkVkgf9zbXm0QH4gn4QHXVmKCTlmejZLTaZVh/0L3cHI290pw6baNqFvnCTX1CqXvy00s9iTlSKIs/C44SxLQbGjbZ1n5gho44fdFk6vTJexOn+j/0iVF+ZqN2icqlrwH8EWg4ocwpluUzh6TpIls5+PiUMfAzJfOeeTS4WfKxtavu+gFT0MndUijr4ymHYHwdKf/tv/Dkohzx/6xU3XC7b09t+Q6nK5iIgwnBkHG1eQD1+O1PBWH3lRlWUKLfEHKS38FwCdLT+9Ahoj1jOV6y76joRuUA2MafrpR1xI3ZnjO50P5ryXnNlZOSYAVCURHEg3sx2O+PowB1FCbL67xJ/lqA0+vBX5FGcwTD5or2jGnWJC1HSDqUZYhVwIqgIYJJRTelVINulL5zwSsi6/cZ9dRyRzdMcEHqT4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2dhTW9sd0JxdUorL2xKUEFZN3p5U2NIR1BTWEFidXlDV0tHN3I3Z1V4dVNs?=
 =?utf-8?B?QVdqazdiSEF4OEVaS1lZQXlwcEltUlB1SVRKWFAwRzNYOVBkVFZXVWxpZVVZ?=
 =?utf-8?B?SmEvdVhWbW9aVjJ2RG5lSndNKyszSTlhMVVjNzBCOURYci9EeVdNZGJuL3M4?=
 =?utf-8?B?NFU0TzRRbmhJT3F2UTNxVWE2UmdzZ2xWSVB4V2x4bmdjSUZsajY2ekhkMDZI?=
 =?utf-8?B?SHRKMTRiTmJteUdZK2c3MkhveC8rUHNpMEhwMzlmV1FCRGRLMVU4ZngxY1VB?=
 =?utf-8?B?V05PYy9LWC90RVVXZVhqRCtJdXczbW5EYlZyM0dYbWd4aU5UMG5sa0VZZ0RM?=
 =?utf-8?B?c09JR1NCK2lRbEdHZ1ZJNHgzWW9ud0VVZFBtMFRpbTkvSW5hczlOdzd5eVVP?=
 =?utf-8?B?QkVUV0hLeXM1ZUdzVFdBUFBKbTFINWpDZEFPZTV6VjFPaUNodzRIM01HR0dD?=
 =?utf-8?B?Z1RaLytNNDg4NExZSmRNbERvcEZwTWRqUFVMZW5NN2NSRitPa3BlaDIxQlRM?=
 =?utf-8?B?Y0RBeHRYeXk3cnNIdEZ6eWdEbmNmVE1EdzBtNjNvWWdveTMzc2dVaUxvTzBD?=
 =?utf-8?B?aE5wRjQ1bFRyMEh1VkV2Q1h2NTJYYk4rUkJUMmdpOXlDTGcxVXRrK1hnTU4w?=
 =?utf-8?B?M0NpcFZkMGtTNzlCU0k2ZzRPUjVxd2FXZlhOeW5SSzFQclhmd1J6Rmdtb3ly?=
 =?utf-8?B?eWFvaWNNYkkwaGY2RnYwQ0hGcFlJc0hPTWZ2VFJHZUt0TnFCQXd1ZUZyZ0kr?=
 =?utf-8?B?ZVVoU0lqeGNES1pLODRja3pZTTV0d2ZZV1FNZjJ2MENtWno3UUd3aEdLK3hh?=
 =?utf-8?B?bWJYVDNCWEJ1MlpCTkUvSVoweFpoci82cDlyTUl5MmhQVW4wbzdiTkZVNjlu?=
 =?utf-8?B?blhtUm5COS93SUpZNEozdDhsOHJ2TnNLeWRFNzduSlJoZWVzQmtkQjV4Q3pW?=
 =?utf-8?B?Z1hGMFdhczVsWE5JaFcvSG0wUG9oWFVyVnhGZTBLclo1Y1RSRENUQ0RrUmtq?=
 =?utf-8?B?dUxtV21VNzA4Y3hlK3h5TG5ZZFl2UVNwaXN4cXVkVkxTdDNESS90djFBaDhG?=
 =?utf-8?B?OUxJRFhoU0tDY2VKSkpEUCtBaUd5OHZhN2hpdmhGK05UWUhPejBqdEcrdExs?=
 =?utf-8?B?Uzd6cnlvdXQreUFxMVI3aUdBMHMxeGFITi9ISE5mdVR3a1dHSFRIS0NwVVZG?=
 =?utf-8?B?RlI1NVdyZDFXUzhlUWhTeUF6RE9vVUhQUml3UmVoQmhON3JrY1lYM1dZMVpi?=
 =?utf-8?B?bW00YVEveTFZcURNcDhMemV2cVNndE9qSUFkY2FQYkVlREYwWEpET1Z2eTds?=
 =?utf-8?B?dnoydTBvcVJZcXNpYWVVa21seWt3bENDd1dvblRNMldYM0tjb2FUMzVtbUVG?=
 =?utf-8?B?VWRlaEx0VVFRd0d6QUtOVlM4aDF2SnJvSzIrQzNzVm1VSWsvUDZweFp0dmpZ?=
 =?utf-8?B?U2tRVFBNVFYvN2ZTenZaQ2E2OFlGWjNibTJOSGpUczJ0dkVMRmRJbHdQdis0?=
 =?utf-8?B?YWdWb2dvNkF1V21JaWNBVkxYdnNEbTJSR1dXemVSWWU3LzYxc01RSDJ2Qko0?=
 =?utf-8?B?cVRoMWFTR3R2ZWtVeDJIT3MwbFkzV0VWTThPV2o0WjRnMEpzQjQ1ZThFS1NZ?=
 =?utf-8?B?eWEzOSs3b29UdkdFK21RQWNSQVgzQ004R3k4aGJKR1QyWGRaays0WWZvMFZ1?=
 =?utf-8?B?R1ZKM0JzYjZBemNEMVQ1ZEVteEh3R005THovbEJVbGdEcHpla2ljdm11a3hJ?=
 =?utf-8?B?UHlIWDZ4SFhiZ2ZyV3N1SFJhaVBlQTV2WXpEejZwSHVnb3hHZ1UveXFaOS9v?=
 =?utf-8?B?ZTFTakFyVWd0S1EvS3ovZDFhQXNSVEQxV0xPUzBZRWs3T1VYeSt6dEFncXRa?=
 =?utf-8?B?TUFzMWlxMWo3SFJPcXBGL1B0NC9MaStVcG9Lc2Z3bzA1K05RTHBNcVhLOW4r?=
 =?utf-8?B?R1pkZTdIbXFUT2wrN0dhWmpCQXZIUDFiMXF6c29NV2w2cjR3U2M3MXVpSnVF?=
 =?utf-8?B?NFJpNmdoNVM5YnhlR0J3VC9jdVNmNnpnVFpwaksyakNpa2krakhlR2hld01M?=
 =?utf-8?B?SWtyaU81Q0MxeTJ3aDlUb2tCcnlyZ2pzWnNpT0JjOWNVb3IvdkVvTklqUUF5?=
 =?utf-8?B?VHErcklQUE92Ukx2aGpidVhQZXZabjNxZDlQM3QvcjA0RXp1Q2FFZHBrdjdI?=
 =?utf-8?B?VE03UlU0RndtNmhUNXlhOUZxWGYveE5DU2gzQTBKd01QSDNSZktVcmdKSWZJ?=
 =?utf-8?B?cDhHZGtwN2VEdnArcDlBZ0VJajFpYWRlR2l0ZEJaTjVtWFpWc0JrT2xWcUhL?=
 =?utf-8?Q?XnAcyTB5qsbdTsmuvx?=
Content-Type: text/plain; charset="utf-8"
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
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb57ef67-fde1-492b-f021-08df470059ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 12:18:14.1657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XggNEuKXT1sbKZH0KF9J8zaQQAowlp746DJLM1JRRFBJxibVaF1rCaQ7eX+1Nl4mb1SoP1cwbn2Kp9V/wr0+kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7723

UHVibGljDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1i
b3RAa2VybmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5
LCBOb3ZlbWJlciAxOCwgMjAyNiA4OjAzIFBNDQo+IFRvOiBEYXR0YSwgU2h1YmhyYWp5b3RpIDxz
aHViaHJhanlvdGkuZGF0dGFAYW1kLmNvbT4NCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOyByb2JoQGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAwNC8xMl0gRURBQy92ZXJzYWxuZXQ6IEFkZCBib3VuZHMgdmFsaWRhdGlvbiBp
bg0KPiBycG1zZ19jYigpDQo+DQo+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZy
b20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNhdXRpb24NCj4gd2hlbiBvcGVuaW5n
IGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4NCj4NCj4gVGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBw
b3RlbnRpYWwgaXNzdWUgdG8NCj4gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gRURBQy92ZXJzYWxu
ZXQ6IHN0YWxlIHBhcnRfbGVuIG9uIHNwbGl0LW1lc3NhZ2UgZmFpbHVyZSBpbg0KPiAgIHJwbXNn
X2NiKCkNCj4gLS0NCkFncmVlIHdpbGwgZml4IGluIHRoZSBuZXh0IHZlcnNpb24NCg==
