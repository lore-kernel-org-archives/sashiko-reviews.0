Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793711614;
	b=tCB0nCoumGPdVx+5AkbaMLOmKaxuT4jPaU7R+H8ZiE/6FPdbfEejiYPZKZZrt+YuQKPu
	 f6FVgpXpD73F7hC2j27hK9meGZUxSqaCIKZ1MxRzV6rqJC0bhXihsMeep7zELuzXnBB7d
	 nZM31NK8gnMXDoNPKEYVApKq0hi44enM+/gLh13pJ29iwGJgjda1lCGwvrwrvX7XsiqF7
	 sKSuokBS8vDPene3ShqFPaUMt8Ah/j+PdDM93nTjCxrbODApcuo8TUdsZN3PB82D6pEFi
	 of5AK5hYSi3KSj1QdEoCVN6ILAiH/VtAT1n6FrEg6yw0eQ1zoqtylyxXhHD20PEIsLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711614;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/zq4XVETt5Yd0R9K9ELMakqlbQAu6j3n4Fo7K3i5AHI=;
	b=XxxP02vfPz3fXjc6+sfY94mlVUZ+XUANVg2i5xrn5iTBGCMemrO56pdsb4mlv1ov+XEL
	 zB39tOLyEP1uzpfTo6LGJNXc9KGlZJqCwwXOAhtwm1CdYVcGSOqlsi+wMg7wJ7ngLrcrg
	 IAufFfGqzb280dbTlt/670ph4jWntfmAoBNc5vVewZSze/czBoLKehupxB+AWUiSAecHP
	 dhDIlEJxorGnW4ayp+kVjaDkIGOL5wYPLr1wGElF3LJ7v31j7BfVxEYcKGFRepRZQmZzO
	 08flxvhDsAx/3z42TtxuahxBzUra7iZoEduG0vqARldu/xYS51uMDhJ+YtnsxQ5njuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=rCximqnS;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=qccCejyT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E26A606A324;
	Tue,  3 Nov 2026 13:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E26A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=rCximqnS;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=qccCejyT
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Cltf73359525;
	Tue, 3 Nov 2026 08:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=/zq4XVETt5Yd0R9K9ELMakqlbQAu6j3n4Fo7K3i5AHI=; b=rCximqn
	S99HB9rWyupf3P6CaVeS4581hu/QQjjL6UvX6KRnCfon65PpZP7qES2u55I1E/+B
	GwGvicJ5I0sZBHJUmTpT9P3YkR9PfpX9tcrvI6HQpyk9YHU70mli+aNjTT7hvGIG
	9jv6kJAn7BnS6SXGZsOvKyQcR+iakSaX6ZbxNpr1X36LuLpNgllgWpTD1kqvD37l
	qTtbNSB52BYObCzbiPafMIDraXJG2Z238BfOKHFEFUWNWvOUYHXtd0ejdDQLJfOq
	XMpRfFW053nxNRBfK8TrWjQ9pa3ZhTqXVeLO7cDG3RzXDc1wmIgs8OXWLIJ+JVyc
	RXpjLot9pE5tCzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=/zq4X
	VETt5Yd0R9K9ELMakqlbQAu6j3n4Fo7K3i5AHI=; b=qccCejyTXRcXCrrNNZtZj
	CwpCkGh7q3dvNOKzq7BnBbR3yk4lQVPISlG1m8HVjvuoX34B64RkgZo339Sw+MN0
	3VlOuGF3TiAVjLrZwrkqvWn5Nkt/kosUt8Ky4pDfM1P49UasZB/EN+JJlZyAW9a+
	Np3m3RqFdUoC2svbGMQBxZjYySsYvZoCxBXbPCaeLo4YCJ4illWzKkxSmI4Ny9aS
	dIUjPTcAnc28+ddGLIIvpv8zyuOhR2JI0H2FlNYJ1luii6Zd4Sr7w4meEQIRCUAa
	keueUJW1zgk/OJGYPlR/tDDO2DjIwPiSee6bAxHIZLC+O7EUhv68MHAgj2OG4IpG
	Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012025.outbound.protection.outlook.com [52.101.48.25])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hpjhb1c9d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 08:13:30 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RemrPxKpXF/YRYX7IH2LCku/qHoWahb9pcVO+BduMW3tB7AKVett6ABeOdcn8vQGI37alxmVlhxqX3/zvYI6plkKrzup7oPZA3PnuZq/+Acpjrq8XLtDdGF1xs8RULbEBFaqRAcgxoy7avPUs11ggsaAB/jngcIRrgTelhta4wGssZm6+LMLE5BqiA2SS2bh/ffvIwf65io6OLTPlHhIYm+0QncD6qvZ94uEbodyRqoBwGdmTW+NGaqc8DZVCL2702t8OuRZ5pI3llLkO8rpysjGphlUkXSrUynVd6bSQGt5wTnbpJb1xPsA6VoUDJJdTrwhBzr0GErYoCm3+Jf8xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zq4XVETt5Yd0R9K9ELMakqlbQAu6j3n4Fo7K3i5AHI=;
 b=qCcEB1tB9rkLi9u+p6rLTWDHC5ML4ABKLWCMheJrRVmCXdz1RSJku3XYZcov2sna6szb/uM8Sm7JWrrFiwF1feWVzLXaTucj9upw0hQxBBxONqOWGmX1aJOGMr2qW78NhIxhCcsobC1korgXE66UnKMDpuw3Cp/cq5lLWASqD1lf97rPgQ9QKQoXf6PpcDgDrlipralKnVtUo9/N3EnIGVu3QBT1O8yjxPCbTTrnEF634JQnqX2aT/ftCm7RuEQBs4JhRcTkk4YvOmWIt4ywkaaDUVjkpug6wq/03RuRezsO8FsG75XPAKD0vPmLImMog628k7Q6VziY0GQ5ijKP4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from LV9PR03MB8414.namprd03.prod.outlook.com (2603:10b6:408:367::23)
 by BY1PR03MB7921.namprd03.prod.outlook.com (2603:10b6:a03:5af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 13:13:28 +0000
Received: from LV9PR03MB8414.namprd03.prod.outlook.com
 ([fe80::d661:7c16:d052:cc81]) by LV9PR03MB8414.namprd03.prod.outlook.com
 ([fe80::d661:7c16:d052:cc81%2]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 13:13:26 +0000
From: "Sabau, Radu bogdan" <radu.sabau@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v5 1/8] iio: imu: adis: Fix custom reset dispatch in
 adislib
Thread-Topic: [PATCH v5 1/8] iio: imu: adis: Fix custom reset dispatch in
 adislib
Thread-Index: AQHdaqwn59ENXdt7AEyuD+SO4e+vBLcahpyAgAHN3EA=
Date: Tue, 3 Nov 2026 13:13:26 +0000
Message-ID:
 <LV9PR03MB84140F976ABCEE4BDBA63042F7692@LV9PR03MB8414.namprd03.prod.outlook.com>
References: <20261102-adis16607-v5-0-4f98b0d271ac@analog.com>
 <20261102-adis16607-v5-1-4f98b0d271ac@analog.com>
 <sashiko-outbox-193189@kernel.org>
In-Reply-To: <sashiko-outbox-193189@kernel.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV9PR03MB8414:EE_|BY1PR03MB7921:EE_
x-ms-office365-filtering-correlation-id: 20ecf541-e2ae-4ce8-2c29-08df39ac3ecd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|10070799003|23010399003|366016|56012099006|38070700021|4143699003|11063799006|261009221227099003|261009223027099003|261022075727099003|261026121527099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 IiYWIXQt4pHcRd2UbEsEb1Vj2I6O2Srt6RDTL3xy2nGWX+JyulOZjpNaFn/3cvKaqQpaCr+gun8lZtzXI5mVyKj/p3VtHUbNNLQMDiDqa43K2pgtcZnAAGCJNtVJS2hqF4HnfGRgvNmbK6/llDto6nwFmotKiX4rK7TH+SqpixUK0UN7YCSuHBJYof4Q36mT5sK23ftBIOdE+8hWGZKrB69TIT6+87Vwx87pUuuPp3mL0qo5FMyV/u5CHFZC9hQQtO2R+syCc63bPNk6bjAIZrHHHTpGtf+KN4Ie+5QfHkINQ5XVK3V7Iez7RkXeAC6EqwuUIXrxZeYpQCmFAr2ohOd9nA1EpYYh4IUipLsz/O3+cpOWNtDhc1PlKKCV8e4+fEZ2WCB4i7iFIodienf5BMKeP+wpi/DY6X3wCBnNs7kjhgyalpmMJpjFkfhvqVFo3t3TBh/qfFD40YpZwvcjMLoGVPRwEJqGIXUFb/QuBZKWiLhXK2400IHhZreNtd1EaR9+eAQlzsHWymgOk7RGEN70wCwKiYF6zCzBgMK6I4C0UdkFaV/YE4GOsbd7iRVyJdZTLNTljHT4c4qT6biC8Hkhms1EtU56+qjF6YDjowdBboZM+/yrKR6U+zVIk3WjTDHAJZE5HkjU327KrbXleGGQMMlkQoDAyQ1PhZMgp/ZVy9cL13l7eh/NaFUg8U8u7gsCd2eyRAS4vcf7Z8dJuvVvrjR966PUo0fqmrcEoPM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR03MB8414.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(366016)(56012099006)(38070700021)(4143699003)(11063799006)(261009221227099003)(261009223027099003)(261022075727099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWJ3bzl5S0k0LzA1YVNndmsrR0pGZ1dWaFplaXVvZm9UbWFXcE9qcFlaR1V6?=
 =?utf-8?B?VHVuenlyVXg1UDJMc1hwTWF4MTZoUklHd0JiREdqZ3VyWEwrQ2NxSXJjNm5I?=
 =?utf-8?B?QTB2SkJqU2FCamJrWDBQcGR5WjlnRzJ6UmlZSDJmRjVrcldwQy9PNGdFY1pM?=
 =?utf-8?B?QXJoQ2hvNW1zclVHaEtwMnRPMzdndktMMGM2K3Q4OEl2MmNtUXVMc0Y4M3Vj?=
 =?utf-8?B?M25OZTcvQ2N4U3ZMQzNpNEZnWkpvUGdGWmpvTEFkYWlRKzRVMlRlOEE2SDgz?=
 =?utf-8?B?WHBmYnRkWGhHamtIUktUbXl1L0E5aXhzcDdyZHFYT0dnMGx5Qm83ckxQbWN2?=
 =?utf-8?B?Nk4xTjJsL1Eyd284MjlJOUNVNC9FWUhVTXFxamgxakRTTzdOSzdRSVNCUFVL?=
 =?utf-8?B?a2ZoVi9pUWU1VXJhclo3VmZoU0JyQXdyRlJMelBLb24rOXVpRnpYTDc2UnZy?=
 =?utf-8?B?eE5samZ3UEQ3aUsvV3NYK3VzTktReFlwQWF6WHkrMEZabHpaOE5CblQ4dTVJ?=
 =?utf-8?B?REl6NXA1bFlCbmRYT1JmRjA3MXU5YXpkaitLdTJuWmtnK2RHZWhKbmtRTEZY?=
 =?utf-8?B?eUFGM1ZYVC85V2QxSndEN2U0TENPc2xuMzR2bzNxMElQU1lqTW9qS09GaWMw?=
 =?utf-8?B?THdQajhDTXNFOHlMMXJwVVFSQlR2Q2VESlRuZUh4eXJQZjFRVHpha1lQM3ZE?=
 =?utf-8?B?Nk4wSjc1MTFEalVFdUUyK1kwb1NKSjVCQTlTVHM2TThZcE1EODV2T2NvTDdO?=
 =?utf-8?B?WFpsWVcxS0dTL0ZLTTFtZitFT2VaZmthbnNDOWcwN0QzQjU3UG1KeUUwUVpU?=
 =?utf-8?B?UHhlWWNWczQ4SGNFMHBDbFpibnZad0FBSUZreWhVb1hCNUxwc1RwcmFLeTJq?=
 =?utf-8?B?aGl6YS9nemFIeHlvUmxlbGpXMXZVZXRBQkJYUHJHMFE4bW9WWDd5SE9aS2wx?=
 =?utf-8?B?WS82enNBTDEzZjJXc0h5Z2RzOVlJaERqbW4rZXNwN1pXMjFlQzF5eFR1WDc4?=
 =?utf-8?B?S20xTk4ycDZ6NTlUVUMzcFRzOUJXTzdoSkZCejFrYkdjMkZocXVDNnVxNE45?=
 =?utf-8?B?emc5Qks2aExCSmFVZUNjemlsTTR1VmptTUFqMnJtUFFWaUszaGF5bTBvWlBk?=
 =?utf-8?B?VUMwVkUzNlVYS3BmSUg4TlV4Z2ZZUW5Sa05IeG5Zdlh4ajBmNlNZNHB1RDNy?=
 =?utf-8?B?TnZKYktrMkp1dDN1MlBmdThnMlplMUgvL0l6dFE1cFNOL3ZqaGY3MmcxTkRQ?=
 =?utf-8?B?UG1Jc1lMQ3RmWWVsVzZCQzhvVEdkU2M4SzBKbDV3NytVeERBQnl1QytGYmJO?=
 =?utf-8?B?TVRhZHBmenBZTGMzUVovVTVFUlBGdldOZnRhdU1Oam11YXh0amkrcjd6cnh5?=
 =?utf-8?B?S2NDMkNPQWRjbTEwWnRRckZsRE5tYmpsQm1iZDdwOHh4cWJFWDB0WGVscXV5?=
 =?utf-8?B?NnhzMExWV1gydFNkTjlqQkVsZkJOTnBRd2F6bGVWTlNCczZkd3lDUG14MldX?=
 =?utf-8?B?VGI3Z0M3RlBKNXVjWS81RlhpYkR4WkdoU0dXcTdOcExVbzdJUUlPdmptbjRq?=
 =?utf-8?B?QjhQY3BMdnNmYWpkQ0xUN3cwRDhVSGtiRGZWeFByMENYdU9FQWtFZzBRWHpl?=
 =?utf-8?B?M1Z0YUxXVUw4UWxTMEFVNXloc0U0Vm9jSDZYNkRkaEJDUGxZVGZTZkpaU3dS?=
 =?utf-8?B?am5OWUlUdFM2RUtkbXh2NjlhcmkyWVFNMVRrcjhoZUZSNXpCNWc0S0I0dzdT?=
 =?utf-8?B?M2pkcmp1dlplZGRqaGp6NnhrSXdkUUQ2RG1XN290aW9IUWtYeXVyOHJvM0RI?=
 =?utf-8?B?ZDFCU1VuaURLSGhsVmJxUHM5VFhuQ1EwNVFzRWVUdGx1NVAyblRkUkpNTkpQ?=
 =?utf-8?B?RUFobUR6TFpIMVFOUXRNUWhnYjludS9oL0ZDNjl5N251N0ZXV2kwRk1VanhS?=
 =?utf-8?B?eVVXQmN0RElDZG5JWmo2TlpiQ3N2OUhhQi9udmxabnlDNW9yM2owaFNkT2x6?=
 =?utf-8?B?UTJsdGZKU1VZSlNQcEI2d2pndGp2M2poc1NLVmlxbFpvUW1EZ3RPUUNacWVz?=
 =?utf-8?B?ZWNGc2lEcVErYUtLMmsvTkN4Vi9KTncyTHlhVWdiV2dKdys1SlJQbytPK2Nr?=
 =?utf-8?B?dVFuV25QNm5JaDNsOHE2NUcvWTRnSC9oNnNUWG5uSzRDakc2OTNEeDJpOXEw?=
 =?utf-8?B?Ym9GSkRsMlVLWWZUTE90dlJWVjhuWmVydk1nZ0JiQXZDN25CdE95T1dueUVr?=
 =?utf-8?B?SUJHS2ZXRmJ3TFNSVmlQT3k1dWJlZUVmVGNOZnRQZHFJVjlMWGgvNlNWSXNF?=
 =?utf-8?B?eERWSE5ndjFadnB0WExMamFkaEtNQnRIV01CeUkzRStLaEtMVEVmOU9XSGJ4?=
 =?utf-8?Q?FbB1+5v/Qg+4kvUA7dul3BQSOROX9xAHbofxDdrY3dGOc?=
x-ms-exchange-antispam-messagedata-1: yN7j0zSfBZZFSg==
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
X-Exchange-RoutingPolicyChecked:
	l52IjteS8TceqG9kXojrrnk1a/ZQDhuQa17vAB+uLPMAvOIws27V8hylHJkAtUF4ZSV7EcjfJkl4JYWTCu3bj1A4fFnkvoo37h5PulUR8JStTBDTy5488PVLg66JwZnl8VW4S4anC9urrF6W9Ex7gmu29tGIAAU3T0QZb2DQ5zX9w//q7VuS55NYx+p3QvN4bdmvhOsWxtn0VC+5eyXD7xnh9AhwWZRXe0EM1h6G3wGCHs/vmwE1U/6acFC9VePRRMWpyM7M/v5oVbDUS/gOEgweDcVkUtpd5d3s5p1RjgpVSu1Bsb5pESmdgwFQ0oL80ZZC1PcEGlIkl4npxpeIaA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV9PR03MB8414.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ecf541-e2ae-4ce8-2c29-08df39ac3ecd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 13:13:26.0497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cZpbEw7NaguKsWU/Xx+SrPjRAfKC0w9zccSz6SDjyoROnBABYTqPekauuvQ8G7x5xGGtT9uiexBskJd5o6Vj/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7921
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfXwxtFUKl1zMsq
 4cSi3qWb4/DQZjhD+cW3K+l4hsKn0DtJ4fw02s6R/MAqscj/92XYoF1x/UA+67LQoPHkJfd0ko1
 +58wmxK9+/xeYnokocsmx9ouhJGdDKqTfFNmZfUNv0+gx/l8fEw5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX3/MTh5HMm94V
 ZD/T7eIKG6NY7GuQmvBgI+2suQhykvvaSQlbt6/uKjjDDFWGs2U4+zpOg0JAfdGsLCVk7x/QHrC
 Mw74rGCR0rbibS0vUqtqQD/w17wprIO8B029DxfBzxznKHCnoo9PXG81mPVXSRayxuiVKR2mODb
 TwkS+bX23aqKom7G5WYIYMr2JC4y8tBlX6Y27ojqG7P1HE62N7caboL62Y+cIlgx21Pgy0vm5mX
 4f1CNzzjDNLO3tzMnAnjdfrHWSKb8KswtMqAXxvQuUYUA9tqKxCXiBbQee7GRuX92r6J2oqeqSq
 6xAhDyE2XH0wi2ezwy22/+ul2x9DUWISHgy5QmyLHkjBZxHpJTdmd1Ql5VTlpaI2MfISy0ckmsB
 6vPzk9P0Bp9WTW9L7pf/jpQzBdrtCKHmWP9abyuNQY5VnC77NRJvbkh8cjPStzbLeURXppHL+E4
 Fs240oSlL5zFGYIqJcw==
X-Proofpoint-GUID: GHxEJRuCZfloHx3Nl2FJ5-va81gOCE6U
X-Proofpoint-ORIG-GUID: GHxEJRuCZfloHx3Nl2FJ5-va81gOCE6U
X-Authority-Analysis: v=2.4 cv=cbtHPXDM c=1 sm=1 tr=0 ts=6ae9ddfa cx=c_pps
 a=fLgsFiGMcCN2bMhaTK1NuA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=Z0pTeXoby7EwIRygza74:22 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8
 a=wP85pPnE9NunF_-F-bUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDIs
IDIwMjYgMTE6MzkgQU0NCg0KLi4uDQoNCj4gDQo+ID4gICAgIGlpbzogaW11OiBhZGlzOiBGaXgg
Y3VzdG9tIHJlc2V0IGRpc3BhdGNoIGluIGFkaXNsaWINCj4gPg0KPiA+ICAgICBfX2FkaXNfaW5p
dGlhbF9zdGFydHVwKCkncyBuby1yZXNldC1ncGlvIHBhdGggY2FsbGVkIF9fYWRpc19yZXNldCgp
DQo+ID4gICAgIGRpcmVjdGx5IGluc3RlYWQgb2YgYWRpcy0+b3BzLT5yZXNldCgpLCBzaWxlbnRs
eSBpZ25vcmluZyBhbnkgZHJpdmVyJ3MNCj4gPiAgICAgY3VzdG9tIHJlc2V0IGltcGxlbWVudGF0
aW9uLiBJbnZpc2libGUgdW50aWwgbm93IHNpbmNlDQo+ID4gICAgIGFkaXNfZGVmYXVsdF9vcHMu
cmVzZXQgaXMgX19hZGlzX3Jlc2V0KCkgaXRzZWxmLiBEaXNwYXRjaCB0aHJvdWdoDQo+ID4gICAg
IGFkaXMtPm9wcy0+cmVzZXQoKSBpbnN0ZWFkIC0gdGhlIHNhbWUgYnVnIGV4aXN0ZWQgaW4gdGhl
IHB1YmxpYw0KPiA+ICAgICBhZGlzX3Jlc2V0KCkgd3JhcHBlciwgZml4ZWQgaGVyZSB0b28uDQo+
ID4NCj4gPiAgICAgTW92ZSB0aGUgc2V0dGxlLXRpbWUgc2xlZXAgb3V0IG9mIF9fYWRpc19yZXNl
dCgpIGFuZCBpbnRvIGJvdGggY2FsbA0KPiA+ICAgICBzaXRlcyBpbnN0ZWFkLCBzbyBldmVyeSBy
ZXNldCBvcCAoZGVmYXVsdCBvciBjdXN0b20pIGlzIHRyZWF0ZWQNCj4gPiAgICAgdW5pZm9ybWx5
OiBhZGlzLT5vcHMtPnJlc2V0KCkgaXMgZXhwZWN0ZWQgdG8ganVzdCBkbyB0aGUgd3JpdGUsIGFu
ZA0KPiA+ICAgICB0aGUgbGlicmFyeSBhbHdheXMgc2xlZXBzIHRoZSBzZXR0bGUgdGltZSBhZnRl
cndhcmRzLiBUaGlzIHJlbW92ZXMNCj4gPiAgICAgdGhlIHByZXZpb3VzIGFzeW1tZXRyaWMgInNs
ZWVwIGhlcmUgb25seSBmb3IgY3VzdG9tIG9wcyIgc3BlY2lhbA0KPiA+ICAgICBjYXNlIGVudGly
ZWx5Lg0KPiA+DQo+ID4gICAgIEZpeGVzOiBlY2IwMTBkNDQxMDggKCJpaW86IGltdTogYWRpczog
UmVmYWN0b3IgYWRpc19pbml0aWFsX3N0YXJ0dXAiKQ0KPiA+ICAgICBSZXZpZXdlZC1ieTogTnVu
byBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4NCj4gPiAgICAgU2lnbmVkLW9mZi1ieTogUmFkdSBT
YWJhdSA8cmFkdS5zYWJhdUBhbmFsb2cuY29tPg0KPiANCj4gW1NldmVyaXR5OiBMb3ddDQo+IFNo
b3VsZCB0aGUgRml4ZXMgdGFnIHJlZmVyZW5jZSB0aGUgY29tbWl0IHRoYXQgaW50cm9kdWNlZCB0
aGUgY3VzdG9tIHJlc2V0DQo+IGNhbGxiYWNrIGluc3RlYWQ/DQo+IA0KPiBDb21taXQgZWNiMDEw
ZDQ0MTA4ICgiaWlvOiBpbXU6IGFkaXM6IFJlZmFjdG9yIGFkaXNfaW5pdGlhbF9zdGFydHVwIikN
Cj4gcHJlZGF0ZXMgc3RydWN0IGFkaXNfb3BzIChhZGRlZCBpbiBjb21taXQgM2IyOWJjZWU4ZjZm
ICgiaWlvOiBpbXU6IGFkaXM6DQo+IEFkZCBjdXN0b20gb3BzIHN0cnVjdCIpKS4gVGhlIGN1c3Rv
bSByZXNldCBjYWxsYmFjayBhZGlzLT5vcHMtPnJlc2V0IHdhcw0KPiBpbnRyb2R1Y2VkIGluIGNv
bW1pdCA3ZjE1ZDdhN2QxMmQgKCJpaW86IGltdTogYWRpczogQWRkIHJlc2V0IHRvIGN1c3RvbQ0K
PiBvcHMiKSwgd2hpY2ggYWRkZWQgcmVzZXQgdG8gc3RydWN0IGFkaXNfb3BzIHdpdGhvdXQgdXBk
YXRpbmcNCj4gX19hZGlzX2luaXRpYWxfc3RhcnR1cCgpIG9yIGFkaXNfcmVzZXQoKSB0byBjYWxs
IGFkaXMtPm9wcy0+cmVzZXQoKS4gU2hvdWxkDQo+IHRoaXMgdXNlOg0KPiANCj4gICBGaXhlczog
N2YxNWQ3YTdkMTJkICgiaWlvOiBpbXU6IGFkaXM6IEFkZCByZXNldCB0byBjdXN0b20gb3BzIikN
Cj4gDQo+IEFsc28sIGlzIHRoZSBjb21taXQgbWVzc2FnZSBkZXNjcmlwdGlvbiBhY2N1cmF0ZSBm
b3IgdGhlIGN1cnJlbnQgYmFzZWxpbmUNCj4gdHJlZT8NCj4gDQo+IFRoZSBmaXJzdCBwYXJhZ3Jh
cGggbWVudGlvbnMgdGhhdCB0aGUgaXNzdWUgd2FzIGludmlzaWJsZSB1bnRpbCBub3csIGJ1dA0K
PiBkcml2ZXJzL2lpby9pbXUvYWRpczE2NTUwLmMgYWxyZWFkeSBkZWZpbmVzIGEgY3VzdG9tIHJl
c2V0IGNhbGxiYWNrIGluDQo+IGFkaXMxNjU1MF9vcHM6DQo+IA0KPiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGFkaXNfb3BzIGFkaXMxNjU1MF9vcHMgPSB7DQo+IAkud3JpdGUgPSBhZGlzMTY1NTBfc3Bp
X3dyaXRlLA0KPiAJLnJlYWQgPSBhZGlzMTY1NTBfc3BpX3JlYWQsDQo+IAkucmVzZXQgPSBhZGlz
MTY1NTBfcmVzZXQsDQo+IH07DQo+IA0KPiBJbiBhZGRpdGlvbiwgdGhlIHNlY29uZCBwYXJhZ3Jh
cGggc3RhdGVzIHRoYXQgdGhpcyBjaGFuZ2UgcmVtb3ZlcyBhDQo+IHByZXZpb3VzIGFzeW1tZXRy
aWMgInNsZWVwIGhlcmUgb25seSBmb3IgY3VzdG9tIG9wcyIgc3BlY2lhbCBjYXNlLCB3aGljaA0K
PiBkb2VzIG5vdCBleGlzdCBpbiB0aGUgYmFzZWxpbmUgY29kZSBwcmlvciB0byB0aGlzIHBhdGNo
LiBDb3VsZCB0aGUgY29tbWl0DQo+IG1lc3NhZ2UgYmUgdXBkYXRlZCB0byByZWZsZWN0IHRoZSBj
dXJyZW50IHRyZWUgc3RhdGU/DQo+IA0KDQpCb3RoIHNlZW0gcmlnaHQuIFRoZSBidWcgc3RhcnRl
ZCB3aXRoIDdmMTVkN2E3ZDEyZCwgd2hpY2ggYWRkZWQgdGhlIHJlc2V0DQpjYWxsYmFjayB3aXRo
b3V0IHdpcmluZyB0aGUgdHdvIGNhbGxlcnMsIHNvIEknbGwgc3dpdGNoIHRoZSBGaXhlcyB0YWcg
dG8gdGhhdCBjb21taXQuDQpUaGUgbWVzc2FnZSB3YXMgYWxzbyBzdGFsZTogaXQgZGVzY3JpYmVk
IGEgc2xlZXAtb25seS1mb3ItY3VzdG9tLW9wcyBjYXNlIGZyb20NCmFuIGVhcmxpZXIgcmV2aXNp
b24gdGhhdCBkb2Vzbid0IGV4aXN0IGluIHRoZSBiYXNlbGluZSwgYW5kICJpbnZpc2libGUgdW50
aWwgbm93Ig0KaXMgd3Jvbmcgc2luY2UgYWRpczE2NTUwIGFscmVhZHkgaGFzIGEgY3VzdG9tIHJl
c2V0IG9wLg0KSSdsbCByZXdyaXRlIGl0IGZvciB2Ni4NCg==
