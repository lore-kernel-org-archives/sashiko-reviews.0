Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C8334EEE5;
	Fri, 31 Jul 2026 03:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468751; cv=fail; b=WRw5mhGZ0KwN6hRq6IvjVQS5akrwyw7C4TEodi3ZN3/lPmV67et44iKHBesu5Hni/20+JlnfmdjGb7FBfEn4rD/jn7UEPnvZp4oA2GoUodTyjanlwI/ZgXxPTHNHdSM0VXRh7d9EG0/BF8ocMb4qNCCerP5HKGWjTpS2B+wvhEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468751; c=relaxed/simple;
	bh=SETjazkJAcSbRoELXtahJx7OHN5p3D4luW2mgjwfjbY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qjlgpZp1ISkSvvmrWpsU41JcN2/5w/duXHvJ0I3g1hH3s+UQ7g7MdjW4FdJB+cn9db1IOK64XvSV/b7GBG65ZX7MPVB0LS4Va2byyy/m9xXW91QXWDp+dqSktCagg2QBWxMjCuRURENGE8EwbIIZJkm4VJfvnbFtgWAwq603ZFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TJMEoNIO; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TJMEoNIO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGOUb8LJtqCEk2PD9kZQLA51ESH3i4qW48S3qnbWr5mMSXRZQtI7a6YsAOKWBFNX251YMCHLoLzHdMoy+1j3jSBfiHXvIqOGf2TbAGnfo0XUYI1iqR3izqjbmlnWKd0fDdMEzdZJpOOoQ0q9WiH97IkEM21V2xuGStaqwtsAkcPesFbfalNcm8T4vjgo8awv0xfqhrm4DC+HMzCYJJe/iecRPeAek43m4Q2S4daxffozYV0MG4CbClO7CpmpXrT515ZIFUx0KB/5VvhUqOWy4ZMme3Dr+N6KhCAjXxrrCfAE2S1eZ8XBJi/1RWZr9QX1Ck8lSvULWdUnzsyfW8xFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SETjazkJAcSbRoELXtahJx7OHN5p3D4luW2mgjwfjbY=;
 b=bhvxw/Mb2mGIbaPw02+uke+pEOfDWyWQpfpaexquso6Bhr3QIpQpKIRKUqLhQrJYg0pKRgdvmVYd4yH4zrmBpad7kDgrARe06itOlC8qVH13+lyewIAW7Oza8phbVdZFvtNg+lOY+Khj3XY2niGgR8Ruf5J9HFghJk9/IotHhzDhBdZt/tcBmLEp5Btxw8BOhluZ5cS8JHidXKTcrLTMkenzQnYMyJw9fslixr+LvOgF0Wkin+FPT95AfyBrLr0PRrxLQbSb5EqN55A17UIShgkRNL46GNkNeXwLX17u5PFMfSq8bUT0tIKwDOHIHaW1H7j5n/DOF1WwU1Jf0IlUmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SETjazkJAcSbRoELXtahJx7OHN5p3D4luW2mgjwfjbY=;
 b=TJMEoNIO7jCimat4tDHRNwzhpjRQKpjLsqiYN4FGqCtKMvHriZ0AersOG9ZES4DAhBTXaeTEUUfZ9I6NL4rFhLh9cuNp4Vvesx5MxZ12ZDxAD+Pc+0BBunEW682PZWSApEeS/0+DsG57c7vUC1/1g3z9OOTDqIb8Ti62XrcY2O/DgBpkZFgvXBXyvWRsqx3emIGp9crGt0HvEgZQZYkT/S8XKV9O9UPhTE3Blrn0N6jV+5VcLeI+y0z7zf2ss5miMFKty8a9ubW4JAbnrHIgp1Sei2EwU6PW/6pShIv/+No3G5m2YTUUmmD0YBAzrh1qUJPLGvVvkWWF+iyG9wClBQ==
Received: from GV2PR04MB11739.eurprd04.prod.outlook.com
 (2603:10a6:150:2fc::18) by PA4PR04MB7760.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 03:32:23 +0000
Received: from GV2PR04MB11739.eurprd04.prod.outlook.com
 ([fe80::71c2:937b:d466:174a]) by GV2PR04MB11739.eurprd04.prod.outlook.com
 ([fe80::71c2:937b:d466:174a%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 03:32:23 +0000
From: "Wei Fang (OSS)" <wei.fang@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH net-next 7/7] net: dsa: netc: add PTP one-step
 timestamping support
Thread-Topic: [PATCH net-next 7/7] net: dsa: netc: add PTP one-step
 timestamping support
Thread-Index: AQHdHn3TU/SqWYKSAEiUh6EODwjTqLaEUSQAgAKsQpA=
Date: Fri, 31 Jul 2026 03:32:23 +0000
Message-ID:
 <GV2PR04MB1173951117EECE973F4D039DF88C82@GV2PR04MB11739.eurprd04.prod.outlook.com>
References: <20260728104548.3301214-1-wei.fang@oss.nxp.com>
 <20260728104548.3301214-8-wei.fang@oss.nxp.com>
 <20260729104316.EABB81F00AC4@smtp.kernel.org>
In-Reply-To: <20260729104316.EABB81F00AC4@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB11739:EE_|PA4PR04MB7760:EE_
x-ms-office365-filtering-correlation-id: 72104e00-15e4-4ecb-9834-08deeeb455b7
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|10067099003|4143699003|11063799006|5023799004|6133799003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 OWBwXvFyw+lel2dCZc8UPLXmhFhIs/89UKM1mS4x2ou2SuNUJFZIi8X2+6lnsyTGrFm6Nc7mHD4RRIA5F8x8iCJBrGyslluYlHYWWSZuvEvx2um+FDUPsJw2aNOC9nfOGWNwhY5NEswyy2qnGVPbEoz4jLgB87g30/787XwLfq6xwkiY7ndE7sHY7og3KhEJrZtmEy/7GidwEG1gzI5iiu1FRqXwdYcGXOgnlnnlzuaZI0Vw5sWwW2hDLDqTVvXKwpL8lSTbMJDTfSkKgIpaJywbJO3iOZnkRRSNbciELqwM7ZUosr7p1gPSUzmKBK3TH4BC3/gzTLDR7/3z/h9Dw6QAcs2fKPuohei2M8WXR8DY3Q+LyYr5DRMB1uphCU2BmfZRMgRBKcxO9eakGkZfBa/H1/LnYTYtcKYUB437GQoqEtwmfdza5T3MYutNx7NtNV/0kgDUKU5kWJN2qAJ0uek0bfgI4Y0VnNal+0Pjs5vtVpQZQTv85l1fRtdfVy0/a9b/PHNsJgcGK11d0eFjc3l1ZZZ03ojh1rdGkYxT3r3Od2d5jvnb5rxGGGRgpiSYeVBdkVqFh++dH2PMEXd+pEKNEj4dmStlqm2Ph035BDRW96BJYhORtry2uLLekxINFSwATiVzBUwg7yDEYnJsbWWAiCSqQgBQyhmVyKgiZrzx174Vf7bC3R98h5XCFexAyou/3dZSshJriiXddQHsbRbxRMDwD9AeKQivpFrslpE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11739.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(10067099003)(4143699003)(11063799006)(5023799004)(6133799003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWtCdE9BdVFDK1pzYVBqaE5ZK2d1cXFHYm1xd0dMUitKeDBxb0EwSnAzaVRh?=
 =?utf-8?B?OTFyYnRGaFNQU1k0ajFEbWp0czRVUEJ4UzFzVE5JV3hPZkNyc2RNWitDQ1J1?=
 =?utf-8?B?UjhkL25OeVVYbHE5RDdGdWZYZk0rNzBpY1o5bjBQeVRIb2p2R284R0NwTTBQ?=
 =?utf-8?B?dHlCWkJCT1RUeVZXeTZCQjc3N01WQjF4S01QWDh0R2VsT1RzeG9GYytjR2pq?=
 =?utf-8?B?M0l1OTRmaThYRVQ3RlM1bFFIeUxDUkZ1WC94RVQrKzZobFF0OVZTYTBRaWJ6?=
 =?utf-8?B?NXZGNzBYMG9YN2lmbHpwWVBMS3M1WXZhLzFLdm5mK3JTOE15aURoSHV1VTZW?=
 =?utf-8?B?aTBOSGEzYXBHZVRSRWxLb3h1Y3FVYVdwT2lQNWJOWlFWUy83RFZFaC9HbTFX?=
 =?utf-8?B?Mzk3NUtOWFozaEZCNS9YQ1Qwc3JOalA3M2NOMTJOek9lZzRoTW5WL05IN1du?=
 =?utf-8?B?M2FiZ2JtalVySndyVVZZUVdTT3RLRy92dXJldWU2bUkrWGhHSEt0elJ3ZElu?=
 =?utf-8?B?M1YyOUNGNHNMZ3Qyd1VQWnJhSEFmak12M21rK1ZGSko1SVBRaW16UGIyUTln?=
 =?utf-8?B?MDB5N2Q3dGpnaWRzUlBjeVBGQlRuakM3TXM3MlJSZnRBMk9JZFlNU0k5a2RJ?=
 =?utf-8?B?a2xhSk1EVU95TmdIQ2lxaCtkMVRWNHZMWENmYnNCYnN2K0xHM2hlS2hqTmli?=
 =?utf-8?B?djNQNXRWTHlqN3ZhZGRMUkJZQ21KUTlBOFowVWlHdmxnVXB4NjhuY0FodXYz?=
 =?utf-8?B?dnNremZXazJJL3hneEdMWDhzcW85NkV1RDVnVkhzelJxNnR1ZldTUnZIaEpN?=
 =?utf-8?B?WVFLQlhwbElxazBrak9seXVuQTNNRXNCbU9CVnhsVW5ZekRXV1p3eVVlQXNK?=
 =?utf-8?B?YWpSdEZ0SStlQkt6ZldSaVA2cXRBbitTWVVLenF1a0ZoMFlGSVpLMEdNWDlI?=
 =?utf-8?B?Q0lCYUR6YjNLelFpZGpuamxNakppZ2h5VGFLeXFaaVFLekI5VTJob1ExWkJW?=
 =?utf-8?B?dExiWklUNkZCbzhrT3VxcGllbUlmRWlNaEY1V1NBWkZkUW0xUE1TL1lEZHBR?=
 =?utf-8?B?RHpxTGhRNlVQRzdFL2F5bjQ3OWRxb3F3akx4cURLcm9HYWdGUTdVNXVncU9V?=
 =?utf-8?B?bzZJSWVNaStSalBEU3UrSjdYTHVDWU5IUDdEZVBXU21sVDMyc2JvM25ZelQ1?=
 =?utf-8?B?NGxnbDRTZ3hpa1k3Z1B2blJ2RHhRakM3NzJZc3NRNW1NcWtWZjFUMzArMUJE?=
 =?utf-8?B?TFlOMGtLN2VDNFpydUY5ZFJxdWN4UWpmYk1DTGhtbi8vclhQZTlWR0xxUXRh?=
 =?utf-8?B?Y0Q2Mmw3YjdRQkcxdkY3WnQ2TUF1RkhlWkpud0MzS1FOcHV6U3RBbzJ6dTgy?=
 =?utf-8?B?cmp4Z0lCeHJjZ284eTVzSWltOUtqZ0RSYjBQdmsycVZ2cUcrb2FDREVac2VD?=
 =?utf-8?B?WnlpYnZMZkNPVE92MDZoZGhGZjZBZERiTG4xZXpNWE9Ga2RyL2JnemJ3SkFV?=
 =?utf-8?B?b2tOZzkrK05iVUswQmd5M2I1a0JCaE1ldnlNMjRDNkk5VG52dVRyS2pqSnBT?=
 =?utf-8?B?VkY0QXgxYWdIYU9kMStGVlR0TFZpTUZVRlVnaU1ZK0JjNEZsb1ptK0NDbk5r?=
 =?utf-8?B?cUdzcVNpbFhWODA0U0I2SkRCMlV0SDB4bjZzcE14a21VS3dYcTB5UVdob0VW?=
 =?utf-8?B?Vm5FOG14UXF6b1FCT0E2RTF6eFA1UmQwYTJ1MGtsdTRJaWFCMTRJekdwVEF4?=
 =?utf-8?B?WE1oeUFBZFN0Nm5TMnJRSTdUT3dYT0J4NGdVTWVDQkhLdzdWK2xwV056amhU?=
 =?utf-8?B?N2Y1ekdPRXZWRjZVUzBubUwrS3dSNWJWbjF3dFR0aGRuVC9aNE4xSzBUelhV?=
 =?utf-8?B?TGc2aWQ1UTVCdWJPVUMydWF1VWlYUXlhWnVpNGZOcDc0OFJEdWNDMWlQSVVH?=
 =?utf-8?B?dmFMTzk4ckpiWnExKy8wd2ZHNGlRUk9NT0ZvMDljS2c2cFE0eGZDYXFCU3RP?=
 =?utf-8?B?NGxZVEt0WERsTXBUSnR5dENseXlnMThlNXdlS1RENHRFc2tlN3JPMGxLSWgv?=
 =?utf-8?B?L2hVRnJFUG5SRXdIeG0wTjQzbXFyMHNxY0xCenlrMzliS3hpSVFjV3l4cm1o?=
 =?utf-8?B?d01Rc1lKMUdzeEI0UEhQWE4yZzQyeWVjWW5ITmZPREpWcVhscUNDdTA5MCtu?=
 =?utf-8?B?a0t1ZHgxZnlMRGpxYzNCVHROUlhhUUZBWS9uMTZQU1Rta1pBcHp5YUtlSHY5?=
 =?utf-8?B?SnFyRU4zRm9DN0F2dGpQVTZlSzVwSkMxcld4VDJySGN4ZWNmUHVOclJsM0h4?=
 =?utf-8?Q?8nEMaOM1LdaIw3MKCN?=
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
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11739.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72104e00-15e4-4ecb-9834-08deeeb455b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 03:32:23.2744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k+5PSP3zlRiOb0WuSZRN8ra2zNo49eol0Z45ZKR4l0C1I/LBB8QV/ZNiizoDloAhEgHGfSc+Uk4dBergHl7nJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7760

PiA+ICtzdHJ1Y3Qgc2tfYnVmZiAqbmV0Y19vbmVzdGVwX3N5bmNfaGFuZGxlcihzdHJ1Y3QgZHNh
X3N3aXRjaCAqZHMsIGludCBwb3J0LA0KPiA+ICsJCQkJCSAgc3RydWN0IHNrX2J1ZmYgKnNrYikN
Cj4gPiArew0KPiA+ICsJc3RydWN0IG5ldGNfcG9ydCAqbnAgPSBORVRDX1BPUlQoZHMsIHBvcnQp
Ow0KPiA+ICsJc3RydWN0IG5ldGNfc3dpdGNoICpwcml2ID0gZHMtPnByaXY7DQo+ID4gKwl1NjQg
dHN0YW1wOw0KPiA+ICsNCj4gPiArCS8qIFNlcmlhbGl6ZSBvbmUtc3RlcCBTeW5jIHBhY2tldHM6
IG9ubHkgb25lIGNhbiBiZSBpbi1mbGlnaHQgYXQgYQ0KPiA+ICsJICogdGltZSBiZWNhdXNlIHRo
ZSBTSU5HTEVfU1RFUCByZWdpc3RlciBpcyBzaGFyZWQgYW5kIG11c3QgbWF0Y2ggdGhlDQo+ID4g
KwkgKiBwYWNrZXQgY3VycmVudGx5IGJlaW5nIHRyYW5zbWl0dGVkLiBDbGFpbSB0aGUgaW4tZmxp
Z2h0IHNsb3QgdW5kZXINCj4gPiArCSAqIHB0cF9sb2NrLiBJZiBhbm90aGVyIG9uZS1zdGVwIFN5
bmMgaXMgYWxyZWFkeSBpbi1mbGlnaHQsIHF1ZXVlIHRoaXMNCj4gPiArCSAqIHNrYiBhbmQgcmV0
dXJuIE5VTEw7IG93bmVyc2hpcCBpcyB0cmFuc2ZlcnJlZCB0byB0aGUgcXVldWUsIHNvIG5vDQo+
ID4gKwkgKiBleHRyYSByZWZlcmVuY2UgaXMgbmVlZGVkIGFuZCBuZXRjX3htaXQoKSBzdG9wcyBw
cm9jZXNzaW5nIGl0Lg0KPiA+ICsJICovDQo+ID4gKwlzcGluX2xvY2tfYmgoJm5wLT5wdHBfbG9j
ayk7DQo+ID4gKwlpZiAodGVzdF9iaXQoTkVUQ19GTEFHX09ORVNURVBfSU5fUFJPR1JFU1MsICZu
cC0+ZmxhZ3MpKSB7DQo+ID4gKwkJX19za2JfcXVldWVfdGFpbCgmbnAtPnNrYl9vbmVzdGVwX3F1
ZXVlLCBza2IpOw0KPiA+ICsJCXNwaW5fdW5sb2NrX2JoKCZucC0+cHRwX2xvY2spOw0KPiA+ICsN
Cj4gPiArCQlyZXR1cm4gTlVMTDsNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gSXMgdGhlcmUg
YSByaXNrIG9mIG1lbW9yeSBleGhhdXN0aW9uIGlmIGFuIGV4dGVybmFsIHNvdXJjZSBmbG9vZHMg
dGhlIHBvcnQNCj4gd2l0aCBmb3J3YXJkZWQgUFRQIFN5bmMgcGFja2V0cz8gU2luY2UgdGhpcyBx
dWV1ZSBoYXMgbm8gbGVuZ3RoIGxpbWl0IGFuZA0KPiByZXR1cm5pbmcgTlVMTCBjb25zdW1lcyB0
aGUgU0tCLCBkc2FfdXNlcl94bWl0KCkgd2lsbCByZXR1cm4gTkVUREVWX1RYX09LLA0KPiBieXBh
c3NpbmcgcWRpc2MgYmFja3ByZXNzdXJlIG1lY2hhbmlzbXMuDQo+IA0KDQpUaGUgY29uY2VybiBp
cyBiYXNlZCBvbiBhbiBpbmNvcnJlY3QgbW9kZWwgb2YgdGhlIGRhdGEgcGF0aC4NCm5ldGNfb25l
c3RlcF9zeW5jX2hhbmRsZXIoKSBpcyByZWFjaGVkIG9ubHkgdGhyb3VnaCB0aGUgdGFnZ2VyJ3Mg
LnhtaXQNCihuZXRjX3htaXQg4oaSIG5ldGNfb25lc3RlcF9zeW5jX3Byb2Nlc3MpLCB3aGljaCBE
U0EgaW52b2tlcyBleGNsdXNpdmVseQ0Kb24gdGhlIFRYIHBhdGggKGRzYV91c2VyX3htaXQpLiBJ
dCBpcyBub3Qgb24gdGhlIFJYIHBhdGggYW5kIG5vdCBvbiB0aGUNCmhhcmR3YXJlIGZvcndhcmRp
bmcgcGF0aC4NCg0KRm9yd2FyZGVkL3JlY2VpdmVkIHBhY2tldHMgbmV2ZXIgcmVhY2ggdGhpcyBj
b2RlLiBBbiBleHRlcm5hbCBzb3VyY2UNCmZsb29kaW5nIHRoZSBwb3J0IHdpdGggUFRQIFN5bmMg
ZnJhbWVzIHJlc3VsdHMgaW4gZWl0aGVyIFJYIHRvIHRoZSBDUFUNCihuZXRjX3Jjdikgb3Igc3dp
dGNoLWludGVybmFsIHBvcnQtdG8tcG9ydCBmb3J3YXJkaW5nLiBOZWl0aGVyIGdvZXMNCnRocm91
Z2ggZHNhX3VzZXJfeG1pdCAvIC54bWl0IC8gbmV0Y19vbmVzdGVwX3N5bmNfaGFuZGxlci4gU28g
ImV4dGVybmFsDQpzb3VyY2UgZmxvb2RzIHRoZSBwb3J0IHdpdGggZm9yd2FyZGVkIFBUUCBTeW5j
IHBhY2tldHMiIGNhbm5vdCBleGVyY2lzZQ0KdGhpcyBxdWV1ZSBhdCBhbGwuDQoNCkVucXVldWlu
ZyByZXF1aXJlcyBsb2NhbCBzZW5kZXIgY29uZmlndXJhdGlvbiwgbm90IGp1c3QgYW55IHBhY2tl
dC4gVGhlDQpvbmUtc3RlcCBwYXRoIGlzIGVudGVyZWQgb25seSB3aGVuIGFsbCBvZiB0aGUgZm9s
bG93aW5nIGhvbGQ6IHRoZSBmcmFtZQ0Kb3JpZ2luYXRlcyBmcm9tIGEgbG9jYWwgc2VuZCgpIG9u
IHRoZSBEU0EgdXNlciBuZXRkZXYsIHRoZSBzZW5kaW5nIHNvY2tldA0KZW5hYmxlZCBoYXJkd2Fy
ZSBUWCB0aW1lc3RhbXBpbmcgKFNLQlRYX0hXX1RTVEFNUCksIHRoZSBwb3J0IHdhcw0KY29uZmln
dXJlZCB2aWEgU0lPQ1NIV1RTVEFNUCB0byBIV1RTVEFNUF9UWF9PTkVTVEVQX1NZTkMsIGFuZA0K
cHRwX2NsYXNzaWZ5X3JhdygpIGlkZW50aWZpZXMgaXQgYXMgUFRQLiBBIHJlbW90ZSBhdHRhY2tl
ciBvbiB0aGUgd2lyZQ0KY2Fubm90IHNldCBTS0JUWF9IV19UU1RBTVAgb24gYSBsb2NhbCBzb2Nr
ZXQsIHNvIHRoaXMgcGF0aCBpcyBub3QNCnJlbW90ZWx5IHJlYWNoYWJsZS4NCg0K
